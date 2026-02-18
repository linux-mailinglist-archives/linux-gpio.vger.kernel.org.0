Return-Path: <linux-gpio+bounces-31780-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKxLFiJ5lWl8RwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31780-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 09:32:34 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E7D154189
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 09:32:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5F84A301080C
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 08:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF7B4313261;
	Wed, 18 Feb 2026 08:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JPU0BW4F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012015.outbound.protection.outlook.com [40.107.209.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662BA3191AF;
	Wed, 18 Feb 2026 08:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771403458; cv=fail; b=fN0ZYOObn2fh3aJyTvWJJp8hlm4dUgrjtvrDZgCTzBLBzz5QbkuciS7rI3QPKwaSzfiXpGvpjzKuJKM8z2Ca4C24DCsmNc93nDUamj8INdra0+GfvjL0kgeuQ364OWLj372Rw9bJ7IM8mU7HYV6lReZbrBhuCoeL5v57C5CIHtw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771403458; c=relaxed/simple;
	bh=Z+IsFyRzFWMQr+ra7k05iNzmea9kOvVwEL1cYt6iFIc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aH41mBvf4LpTR/nbRcIAVsXFcZPK04yBbhyomQVvxT9HRUUA0s81+WkGXK7L9IkVKwZx5BGL17f3H6Jd5o6RuyclDasqxH0rHnpSoh93290D37AVmDAGS1THn23rBhbjtFVW+ooHPB3Xqwxsor3Dx4hGeZ6PTaOD/lfB2KHdxrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JPU0BW4F; arc=fail smtp.client-ip=40.107.209.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eKiJ5UOG3eBbo49X+EWs0qdqnjTUIFpezqanHczxFn4rAEt1pzr+tWNhQxcXLfz7K2OOVTgke6TxkENTyP599P18nE3T8aJipz9tWxdBgf6DRXSn36cXtrm8ah/81ZSNMz4POs1Aef4TeDYXdNjOi0R8qAQ6Gyg61Blf2PPltxzGXXB5TtMNMHoIj7mrL1VNEGdUUCEe2PAXJFjQr/UMVgvOm+JlNIXaxMkmSqVXxJuGdAdp3pDr4QavcO85PyLfbhux7VllwBTtScum10jlamBgcpZlpIPeU4Ct+Xy07D0De/9igP6mjYHOg6uMm0kyJpAjGIXoPOwmBFLZnjvAGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/ja84wULt9bV7LGJebUntFQlHOHo4HJZ36M76EtP68=;
 b=bSu6iZpwVSQNJv2vMzAUztKWjHhvvWrXOyr40kJ6mFG6pu9AroOd0PU9GW8qKRIl2jedO6fQxzSU+wHro3ta0njVVYjUb6xCPUjN12DJcHVDfvDoowu5+aMKbTkYDyOFWq63v/QIAE3sJQporxJB9QAN8tbzk9chYEzjOiGgQSkh0O8/yv8DZSGE4q2mZWJankmVSp0r03ly7IoeTXMIpjDCjCKUPVPiymnKmSRSiAtC0fAat5L1L+enDbQtWQAUhkgtdciduuQ9AfklHrVW83p2QQuQm0T+ZwiIAWfQf/6j3fLS2tW9gd4btxwr9m/qBURl2XTO45vYS+/bIrS+yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/ja84wULt9bV7LGJebUntFQlHOHo4HJZ36M76EtP68=;
 b=JPU0BW4FYR3g+UZuIVP8ksOuM49tq2VEczcis0SA+9cuTZfMglzwIsZHkmdJ4PCvIVtzh5ciY4b91Bp0/oURXQ9rA8UEl4HDJAfwcyv5eNNJfktYdkxf/sr0TYmEeRRq4EPqCmCGAcwBk+Md5XbthpDjvnEdQbVyZYJStPLreeHK3URoGAwpbbXG3SRTI44OotNv0ZVgz4IYvpqxAm2LXIckKpe72Fn5mnWRGYxFuX7q1fJOkyZAcjsT7KWf6O/y+QFVQbOcDhUIV3H2mIP7DsVlkJUfb/BVn3zN4OKTrhUg4T4Rat3zYT8de/i8dC9OAqR9VWV+WKAGxFPuN0olNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by DS2PR12MB9710.namprd12.prod.outlook.com (2603:10b6:8:276::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 08:30:53 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 08:30:53 +0000
Message-ID: <b7ede8c7-acc6-485a-b433-35d780d6ad1c@nvidia.com>
Date: Wed, 18 Feb 2026 08:30:49 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] i2c: tegra: runtime PM is not IRQ-safe
To: Mikko Perttunen <mperttunen@nvidia.com>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko
 <digetx@gmail.com>, Andi Shyti <andi.shyti@kernel.org>,
 Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org
References: <E1vsNBv-00000009nfA-27ZK@rmk-PC.armlinux.org.uk>
 <aZSZ54oZS9C1Qf1h@shell.armlinux.org.uk>
 <046c9bca-f6a5-47ce-8147-6e864b364dc3@nvidia.com>
 <15817166.RDIVbhacDa@senjougahara>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <15817166.RDIVbhacDa@senjougahara>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0037.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::11) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|DS2PR12MB9710:EE_
X-MS-Office365-Filtering-Correlation-Id: d102ec64-0bfd-4fb6-0fbf-08de6ec807a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QjdtZ0h5T3EvclhNUm1kSm0xVGpZTGNxVDhVakdSdzdiWXVEZjBiSitWaElK?=
 =?utf-8?B?L0w2VUJIWkRxT2lBMXpHZWJZRUE0YTNBalNQYkF1K29NTDY0SHVwSXhjVHpi?=
 =?utf-8?B?VFI5T05XN0orNlhKT0IzeXdpQnhJWXV6SG9VNHZsckFKMEpFaUszdENqUjV1?=
 =?utf-8?B?Z3RvOThlMlZuYkRTV28velhXaGFBWTVVSlZSb0J2M3J5TWJRZ01aTCt5eUVp?=
 =?utf-8?B?VlhTN2xRMFJabjJxTkJlb1RsMjlHeW9CNmswaU1PTEp0SGZqQUk4SllEbU9z?=
 =?utf-8?B?WlFLR1FRZTNUMnFkK2lhc3BBZDZkL3htQ3FjN0hEUXEzeXZNbk9ySEhNOEl2?=
 =?utf-8?B?eFFjVzIrSi9FdnptejczWEtlWEJXd2lrbzYzc083VWdtdUlFeDZNT3dPWlVq?=
 =?utf-8?B?RlVVSktIMWxlNWpDekRJY1VWTWwxelR3RStvbkE5NHlUY0pxbTFQdFNHS3NU?=
 =?utf-8?B?V1RLMnBVTVYweTZQNUFsbU1USXovdWFaYTVMbTlPMjZvNnU5WW1QYVZNR2Nh?=
 =?utf-8?B?YytxRTg2S2piR0RaV1NxdkFSQ0lNL3BRWW9jNVdBTGNBT2E3Q010SHZ3UDYx?=
 =?utf-8?B?QkpLNFRXQ21JWFJLQWgyR1RTS2tpUUo2aEVJVjI3eHIxQnRrNndTaUxxU1Jp?=
 =?utf-8?B?K3c4elcwZWdETnc1N29YNjIwQ3krN3BIcmY4YVFoZEJqWGR6MHc3RGxNNkNZ?=
 =?utf-8?B?bXNhUXl4L1pic1hLTjM3MFZDVGRxTHhOYVg4WTluYWZKRklFWUwzSlVzK2I1?=
 =?utf-8?B?UTVPWHlCZzcyR3o1dFowcUYvYU85YUJTN0dCMlJOWmxEMkxOdG5rdUVsV2Yz?=
 =?utf-8?B?Y2xaVmF0bTU5SEJyREh2cks1VG5WQllzWlRIRFd1QitMYXZQQnRyT0laOTdN?=
 =?utf-8?B?bExiVE1LcWM0ZGFDV0Q0WlJoYzIvK3hCdnNPRmJKUjhPUUlDa2VoUitJam03?=
 =?utf-8?B?UHQxcTF1QjNyMnJmdHVyM09mWm91NzhBSnpGLys5UXJLdjk2NHgvZWpnOElo?=
 =?utf-8?B?cWowT3VmYVZ6ZFVzZWFsTE4xMjMrT2F4dlRua1A3WVdRZkFxVitNVVZRNzNi?=
 =?utf-8?B?akk0N2ZvOHlqSmtjWnVucFhkVXI0bHpWSzUwajV0eFlSMTlBWVlnMHBLZWd4?=
 =?utf-8?B?Zk9zMzJZQmxZbDhRWnVQQkhkS2JUa2tvZ3NiNy9SM3dEOUdQSGtLMTRZam9v?=
 =?utf-8?B?eVdyem9PdEwxZXdNaXlmTVVPRUhZbEdBeHVCZTlKV3BHY2Vpc09JdGs2Skh6?=
 =?utf-8?B?Ynd0RDBMM2t6ajVhbGFTUXN3Y210cmswaVlRT21ETXJtWTUrLzc2UFlqS1Nu?=
 =?utf-8?B?a2lFMFdwQmFlM3VicFYwSHFCbngxN0hycjBXTHNIbTBKUU9mSTYxSGFrcTll?=
 =?utf-8?B?U3hWTzFoWEtrYVI3RGRPMWN6NmNtMFU2QWVzWWpBNkl4TDNEcVhESE03cUV6?=
 =?utf-8?B?R0cxUE9GSmdiZVJKdEsrUmlrbjY3MzBRQzd2RDVvcDJZYk1GelIyNW9kaWVz?=
 =?utf-8?B?YTBwT1MrcEloOHJLaVdoeVpLZEVlTGl5bW9IWmE4ZE13U3VBaC9GT0RwY085?=
 =?utf-8?B?UC8zV1Y1OWZVMW1wWk92aStJekNWS3BPSG5veFlyM0ZjYklFeE1YcnR0R3Nr?=
 =?utf-8?B?LzdVVEdzcncvVXZNQThoMTJYelFGbTZqTllwQWgyeThOdm9XQkpldDd3T3JZ?=
 =?utf-8?B?MlZaZTBOeGlOdi9LZ282OGtYa0RrTFRUMW9UMmp3Wkx4WURxZTFEZXJ2VTBC?=
 =?utf-8?B?NFlxa3NvWE1hdnpXQ1RhdDgybnFkYWFXUTlwejFwZkFnVjhDN0l1SDJHc1B2?=
 =?utf-8?B?M3IrbmVYRkhlakwvKzVYazY0djVmSi9BSW0vRlJuWXJ2bFM4a3NKTEE2UCtP?=
 =?utf-8?B?WlVZdFhkS0ZnL2tITnkyU21CbElkMXEvZU4wSWo5VWNJdlNWdmYxcWxYVVVB?=
 =?utf-8?B?QTB6WGUvLzg4SG9yQnpUSGpST3lFc004ZndqQVhKeXloYzBualFaZW82dDZS?=
 =?utf-8?B?a2tUeGlMd1RONGNsZ3BTVHFjVnNnSUdXc2pQSTZzVEI3cldQM2lYcFVsV1hN?=
 =?utf-8?B?SUdTM3AyUmNsb002MXQ3czhMckJhTlFGWnZrTUIrOW1RM29Mak5sSm5xdWlh?=
 =?utf-8?Q?ekrE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0IzQmpnYjJQUml0LzE0QWtOb0NUelR5SEhYcWEzRHB2U2dCbWlMUElNUlVW?=
 =?utf-8?B?czk2V1ZOTm9JZmN4Y0V0ejBUME9BWDVJREtCVXJ5S2lZT3hIOXJ3bW5DMHZl?=
 =?utf-8?B?RHExaXI5UUg2THo1bHpDUlkyZTRKVkF2bzJVNmRhWk41RFdQK1VJWEhVQnMz?=
 =?utf-8?B?RjNTNU1lSXZKU3ZOUmJBbDdSWmNyTHlJOEhmWDhpVldldU1MUm82QTVwbEov?=
 =?utf-8?B?ZmFhMUhvNUJQOVpvVkRWb014RTNIbFJUVTYvWUMreHZNUGRJYk51cWV1NFQw?=
 =?utf-8?B?UXFTUU82MHhKbWg5d3VpTTFvY0VzL1pUSjZuQ1J2SXpFYWFzMWVRR044RzNN?=
 =?utf-8?B?YzB4VVhoc29EVklvWEJybjE5Ri85cGgrNDNxTEV5VFJzb0huQW04d09CTVpp?=
 =?utf-8?B?S2NKK1p0ZWdjWEloK0RlcGF1YWJyTC9BajhmK1gzU09ROHlsMzNEODV2S3dv?=
 =?utf-8?B?ODQxaDRjMVN6bnVpZjFMUWp0NVBIRWVCVjNwR3JBM2MyWWNGcjJUQlU5MVNo?=
 =?utf-8?B?RUtSZ1VmWjMzUzJZMjJuZHJaeTFOeTdraVZoQXJJbjFHRXdnQXlJNUlDNmh6?=
 =?utf-8?B?SUhHblRWTFNZN3NJWm5NNnlIZ09LaWJNMFhsM0ovdXBIQVV3SE1YR2JCMW05?=
 =?utf-8?B?cTl4cHNzcERkdzZuTGl0TmZTd3ZWelZuZlNaV1ZUWlRUenRUZzZHSDltVEtN?=
 =?utf-8?B?ajA2a2dEUURhRmlNWDF0THRzVXEwRUg3NzN4a3JJbzE2MC9Mcmg1YTdZb2Ri?=
 =?utf-8?B?aGE4NDhMK2t3aEI1YXl3akJZYkkrSWhwUDh3ZFJXZk0zK09IbWxrQWVjYXFN?=
 =?utf-8?B?RSsxMU90RjA5R3E5ak5KSUMzT0czT0J6THRtbVZCSmhsMXdBK1dPSXhZL1p4?=
 =?utf-8?B?L3BoMndISHhpZXZIMklRckxjSzhVWGczYWM0WWtLMmt5ZEU3eXV1bklTUG1m?=
 =?utf-8?B?TG15ZjJpOWxXM2ZPRkZPR1E2RUxDMU1TMC9PQURnNmdVTm9qYW1tZ2tjc1B3?=
 =?utf-8?B?V1JHL3c1enFNQkVueXpxdUdxR3EwQXdtTXRBTmNxNnBmdVZybDlqRE9yMjJD?=
 =?utf-8?B?R1JVcUVYSm1iSitEd2JoWkFoeW95RFcrL294VVN1ZW9JK3JFZlNrNFBhRWxj?=
 =?utf-8?B?K3JUSTZPNFZ3ZldiaTNSMDRTUFJIb3NBOUF6SG9BT20ySWxYZUNlcFJaa2Mv?=
 =?utf-8?B?WWFnbGJ4VTNFU01PdEN5U0ptdE1jMXp5enIzU3dlMWtSZlVoVnUyam5SQkJj?=
 =?utf-8?B?Y1kyQVNteWhObnJGT3pDQWxYK1licEZqTHVVTUVCbkx1RWhPMWNQVUQ5MXJs?=
 =?utf-8?B?SGQ4SUQ3cGtXekZqRytOTURtMGN5RUhIc3JwNXpweWRwRlF6M2k1UkRqSVF2?=
 =?utf-8?B?WFlCQmJBa0V6Y0ZjOEVhVWRBaEJVN3pMQjgzV1JOOVMwcG9KaTB1TXU3ZmtU?=
 =?utf-8?B?OXpCNmFvSVNCS2hpcG5uNmtvTGZIOUZXOFFIMFo3TjBXZHB2SUVTaGdHcmpv?=
 =?utf-8?B?aFF4bnExUFo2Y0ZqOHZGVEVhQ1Zua0lTN3ZDOGlnYng1YVc2R3lMRGZFSkdw?=
 =?utf-8?B?SStZMDJ2T2s0NkhlOG9hc1ZYY0ozK0JFUWtsMHMycGN3OWtxOVBYMVVka0Jt?=
 =?utf-8?B?V1hybWtnWVFSekFyS1Q5SVJQcUExVW1sZ3UveTBWaHM2N1R1U25FY3FhQWZM?=
 =?utf-8?B?TmxPRC96S25KL3gxbHJYdXdxM0JPSUw5ODFzUHhEZ2s0UGRyNVprS3hTMDU1?=
 =?utf-8?B?SHhidkZxNVowWFJuMkFFeTVYeElvVFZydU05TXNhdlpUYlhPTEJ0bEhLWUZS?=
 =?utf-8?B?eVZTTE1BcEE4K1o2M1JBREFxMkJCUDdqdjc2UUdxajQyU212dWJINkJKVllK?=
 =?utf-8?B?RDM3U2tHb2g1dzkvNmVvTnVXdUdTUXpwYzF2M01jVEtxSktSWjM5cXAwcmpa?=
 =?utf-8?B?OVRROFE2RlpJRVduZ2xNYTdYQjJuN2R2VXprckJsK2xsODhPZW1ZaTdUUVFR?=
 =?utf-8?B?MDJDY0lYc0ovZkRrT3NoMUpCaXo2ZzdLaUtjOUYrVGxRRkM3eTh1eE0yM2cv?=
 =?utf-8?B?S21RcmJ0bVVDTlNSVzJxai84aWpwcjFMS0FWN3ZMa3pGR1ZkNENob2NFZGhr?=
 =?utf-8?B?Z1g0V2JNVk8ybGN1NG4wdzQ3cFJvTkVyRWs3QWxuMVorNzFFL3V4VmVqTkVJ?=
 =?utf-8?B?SEZCMGVOSHM1dXNnU3pqVUZwNVNjVTNWNWppcEJ2VWZ4eVJFSWZkcnVhY0FN?=
 =?utf-8?B?STBKWDc4SWJqZlBreGM0YzhBeXBiQm9kNUtKeG9Na2EzMnJaM2hhM21UYjFV?=
 =?utf-8?B?K1lIVkhQM3N2NFFESEVpUGJXN2lPWVhsSXN0NVp4bWpZbENmL2htVC9JR0dm?=
 =?utf-8?Q?q50PM0amL9yJppShrApU4vwuV0QVrDCMpLy5GTIBs56vk?=
X-MS-Exchange-AntiSpam-MessageData-1: mXITjkMFYdur9A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d102ec64-0bfd-4fb6-0fbf-08de6ec807a6
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 08:30:53.6214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hf4iqDHo8tFgab4tkAupzGcb+1NOj2Vi9CF05Z5iap4+tTFOdwNTwsq35YHDwrxJiOd1TG7Ipxq1jBaZaFwZAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9710
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31780-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[nvidia.com,gmail.com,kernel.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathanh@nvidia.com,linux-gpio@vger.kernel.org];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: 80E7D154189
X-Rspamd-Action: no action


On 18/02/2026 01:35, Mikko Perttunen wrote:

...

>>>> Yes we should always follow that rule. However, in this case, I believe
>>>> that the build time dependency on the PINCTRL subsystem was only exposed
>>>> by adding the 'i2c_dev->dev->pins'. Unless I am misunderstanding ...
>>>
>>> Yes, it looks like it.
>>>
>>> However, I wonder why the dependency has to be complicated.
>>>
>>> ARCH_TEGRA in both arm64 and arm selects PINCTRL, so we can assume that
>>>
>>> PINCTRL will be set for ARCH_TEGRA. So:
>>>    config I2C_TEGRA
>>>    
>>>    	tristate "NVIDIA Tegra internal I2C controller"
>>>    	depends on ARCH_TEGRA || (COMPILE_TEST && (ARC || ARM || ARM64 ||
> M68K
>>>    	|| RISCV || SUPERH || SPARC))>
>>> +	depends on PINCTRL
>>>
>>> is a shorter way of writing this, and it makes sense - pinctrl isn't
>>> required because we're doing a compile test, it's required because
>>> the driver itself fundamentally requires it with this change whether
>>> or not we're doing a compile test.
>>
>> Yes that's true indeed.
>>
>> Mikko, do you want to take care of this?
> 
> My thought was it would be better to keep the PINCTRL dependency grouped with
> COMPILE_TEST. That makes it clear it's only needed because of it -- clearer to
> the reader that ARCH_TEGRA implies it. Kind of like not checking for NULL
> pointers in C code when the contract is that the pointer is not NULL.

Russell's point is that regardless of the compile test, the driver has a 
dependency on pinctrl and so should always be dependent on it. The I2C 
instances for the DPAUX device on certain devices require this and will 
not work without it (before your change was added). I guess I should 
have added this dependency back with commit 718917b9875f ("i2c: tegra: 
Add pinctrl support").

> I can change it though if you'd like.

I think we should.

Thanks!
Jon

-- 
nvpublic


