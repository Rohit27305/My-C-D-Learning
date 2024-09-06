# S3
Simple Storage Service is a scalable and secure cloud storage service provided by Amazon Web Services (AWS). It allows you to store and retrieve any amount of data from anywhere on the web.

**What are S3 buckets?**

S3 buckets are containers for storing objects (files) in Amazon S3. Each bucket has a unique name globally across all of AWS. You can think of an S3 bucket as a top-level folder that holds your data.

**Features**

1. **Reliability** - 99.99999999999% reliable that means AWS claims that out of 1 billion objects in 100 years at max 1 object can be deleted..
2. **Scalability** - You can store unlimited data in a single bucket only restriction is that you can the size of the object may not bigger than 5TB.
3. **Security** - S3 provides bucket policies, access control, and encryption setting and appropriately configured..
4. **Cost Effective** - It depends on the storage class that you use such as S3 standard , S3 Glacier etc.
5. **Agility** - 


**Note** 

1. The number of S3 buckets you can create per AWS account is 100 buckets.

2. Bucket names must be globally unique across all AWS accounts and regions. No two buckets can have the same name.

**Amazon S3 Versioning** is a feature that allows you to keep multiple versions of an object in the same bucket. With versioning enabled, every time you modify or delete an object, Amazon S3 automatically preserves the previous version. 