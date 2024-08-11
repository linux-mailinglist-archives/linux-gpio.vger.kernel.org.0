Return-Path: <linux-gpio+bounces-8709-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DACF94E39C
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2024 00:04:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE78F1F21F18
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Aug 2024 22:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0A04158541;
	Sun, 11 Aug 2024 22:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VCXU/Kdr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EF641C75
	for <linux-gpio@vger.kernel.org>; Sun, 11 Aug 2024 22:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723413842; cv=fail; b=acZoa5Nz0IH9R8ZBhW4/5H2kauThslYtfaZ04m6Mc45r5IP69iTnZtDnv74nN2mwx7mNecUFK09EsehedHabiTij9eONdzCjxUL/0bhKrvp4o2Qqf/iwDIuuzNc5GTY53u8Zgpqes5xHka1WR5mkorqmjbGpvEQ54pTxaAZxa48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723413842; c=relaxed/simple;
	bh=zYbIL6EtxTQ+UxeL2mCTQqxJgcAZgRtfcjnACgkVyRQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JUkCI8k8kIQofg2Zibyj4i42Z2Xo6yq+2lPaCpsmgiKj0Wt70vJqwLZ71LS+tPMqEOvLZzCLweJyqi0R0ateo17+LEdFemNZUPfUai6DE1IOSLsplKCTZjqv/dUWfpwlnVREWdiuy9pD/DsQYkDSBa/U+iEzDenMqPmHBYtRii4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VCXU/Kdr; arc=fail smtp.client-ip=40.107.223.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sq2hLpEbPAyDXqKaoKVI2PLLEq84y2/CHpnXJ6hU8TbHcozi6UCpQeH/gOE+SBeEjLVOjAaIZnHWX8BGxD2dSueEJCvALqWs6IdPZnUApOLZkEvyKO0s61+RZe5xtGeki/7lxy6lvhqrGgFvnMDKuus7ifkpJ0AnSlxZRnzDWdNx2HfUv56H9x7y1VW0MdHCMm3uQAmuRlNejU2NMTT2ddYla4z2oAGf8E8ywfqRfZzyY52psHc3yeJLihvx1IvQwUfOuN2YfdU85UAGbNYHMRyHi17rsgZ1OkMjV9xPKT10swxRP9JDrUkGxSa5ekX8XgSo/49w6EQ9DaBLd1+8qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zYbIL6EtxTQ+UxeL2mCTQqxJgcAZgRtfcjnACgkVyRQ=;
 b=GUDKj/Wv93LWzMQP2RbVU4lMami0j8gIJ7eZJXFrLQ5r8ui5DFV1ukItzXYBb9KFjCXa+FfTwadTmB6SLL2GS3nDBzEstXr6PrHoAudm0hhunkuFoa+lafEaF+VdtMAE7lMCxrOto+/wXkxtLsQny3+cU/rQPHWSjyd2cDwIkQiRGXqk5mbuaAICupwvBAhCKAvOCxa6s0pV3uxDIj1F3NPZv7dihkjRR2wfChuWfOGLtU4ael00PVYrGfHYx3vTUu0HDn+mzT0WcUu8iEUTMoMnPyUyzwglp1n+EeAbLlvVoksj+aljBQSvI5p962tyMMU/q1hjC/7aIgEBD0+iYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zYbIL6EtxTQ+UxeL2mCTQqxJgcAZgRtfcjnACgkVyRQ=;
 b=VCXU/KdrEv/M9uI4nxOECENtIflZs1FmI5ik2PTcetkenc+MCDzUbp4Kr99B4diW2ICqCNdIuiQ1gQsyjZZBK1bjxsn2aJuIJx+5sih6oG/smpGraLlnOgWTnpwEfPgB7xviK1eNiEizrhzpBLg4DCCqDik50uYpQPj+HyeNQQMpWapCaYZbjclJxg4H+CK+3U3wdSiFrjK2vP6F7IisSnEJo/Zloxgp9qS8HkxIF6mEJ7yQ6eUB3snocHP2/RVSzGb9P2a7ZbHWEEk5QcotL/jqbiDomhXPq32oMcBZJS5NBgg68ArpUpLYxSfmM6gUAi0ba3vpGITMxdax2TVCGQ==
Received: from CH3PR12MB7738.namprd12.prod.outlook.com (2603:10b6:610:14e::9)
 by DS0PR12MB7607.namprd12.prod.outlook.com (2603:10b6:8:13f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Sun, 11 Aug
 2024 22:03:57 +0000
Received: from CH3PR12MB7738.namprd12.prod.outlook.com
 ([fe80::fad1:1acb:f5eb:98ee]) by CH3PR12MB7738.namprd12.prod.outlook.com
 ([fe80::fad1:1acb:f5eb:98ee%4]) with mapi id 15.20.7849.019; Sun, 11 Aug 2024
 22:03:57 +0000
From: Asmaa Mnebhi <asmaa@nvidia.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, "andy.shevchenko@gmail.com"
	<andy.shevchenko@gmail.com>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>
CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, David Thompson
	<davthompson@nvidia.com>
Subject: RE: [PATCH v2 1/1] gpio: mlxbf3: Support shutdown() function
Thread-Topic: [PATCH v2 1/1] gpio: mlxbf3: Support shutdown() function
Thread-Index: AQHavCL5vFoTumo/G0KcI4eczXlworIhQK2AgAG7uyA=
Date: Sun, 11 Aug 2024 22:03:57 +0000
Message-ID:
 <CH3PR12MB7738B14B5E6BA4749B037237D7842@CH3PR12MB7738.namprd12.prod.outlook.com>
References: <20240611171509.22151-1-asmaa@nvidia.com>
 <172331853306.5379.13441317995081534992.b4-ty@linaro.org>
In-Reply-To: <172331853306.5379.13441317995081534992.b4-ty@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR12MB7738:EE_|DS0PR12MB7607:EE_
x-ms-office365-filtering-correlation-id: 072bf3a5-29ef-475b-d72d-08dcba517f68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UEFMV3o3V2orTkVmQ0l3YUw5Z2Q3NnE0RWY2cGpLZ2pvL09JakF3STFyby9N?=
 =?utf-8?B?KzVuT09QdjNVR3BYcWtqRko3TTZEUlhPaFFMRHVsZlpnVDBkRnE2Vm9nUjd0?=
 =?utf-8?B?SktQdUcvZ1BkK1NieTlFQlBJekd2S2YvaFJMTmZkZERjbUlJMm54RkZWK3BJ?=
 =?utf-8?B?MlJxYzBXbGtYZ0RPaVJyNUpLcDNZbGs1NEJiS2xrRWZBNzJYR3JqaTlneHM1?=
 =?utf-8?B?YndzWWFPMTB0TFFadFZuT2VNdzRSMk5MYzEydnRLaFNKcjJEVHJseUQ2dVV4?=
 =?utf-8?B?SytuZU5CNG1LaGV2VkkwdGxZb2tXc1N6bTVVTmo1bEt0Y2FDOW93REF1V0JN?=
 =?utf-8?B?UlgycTRZbkVhbVVHNmVLSFFsVHY2ZEZDZnhiL2xiWU1uWjJFU3RuaVlkc29V?=
 =?utf-8?B?V2VGOUpaUGtCb05xRGhKUy93cWp3SVRJQ2ZWN3BNdVk2d01XUVpaOHp0dDFM?=
 =?utf-8?B?b3ZxamlKUEJNZXdzb0pJQVA4b2VQaU5HaktBYm8wT05yS1hIK2x5ODFweW4w?=
 =?utf-8?B?NnFCMFBpakJSc3lHMWhFZ3JlOHBwcWZsdXRVY2xuTGZaNCtSSForQTVnUjVG?=
 =?utf-8?B?b1BQOFhlM0VhQnpVRGI2MndISDZWWEFKVGZ1Rmcxa2ZCem1HK2FSRDVTVG9D?=
 =?utf-8?B?aXNwRmVnTHB6SVZNdklGSDNPS1NEK0NNWmYxSUxVU2VyYUJzYzdOdDN1a3Q0?=
 =?utf-8?B?dkpCdUxYOGh4aDFhQ0xtTjA3TVJjb1BOSGxRMUdtbkc0b05hUkxEVXl1YjI3?=
 =?utf-8?B?UzNrcWxpelllTVlTOHd5RFBBUjJhSThKMlBEYlEzLzBHV3YvZ3RDRmI2cHly?=
 =?utf-8?B?S3krclpQdWhqbTIwNU9RRlVMellXblFnK1pMUkJ0S1pRUGZwZ200WDY1b0l0?=
 =?utf-8?B?NTloSGNiT3pwM0xKNUFpbklieW9rWUxzdVg1OEo0NytsZ2pzanZodm1TWUNC?=
 =?utf-8?B?VnZySVZaVTJUWHdKdndCcXc0VWt6TWRCSHlXSGJJTzRtZ1FXeHJ3T21FZnQ0?=
 =?utf-8?B?VUxKa1RsN2ZBb2QvbGtFc0tpT2NmZ0JzOFRicG4wa3BiS0t5bUFRNkd6S0wr?=
 =?utf-8?B?SVlGcGV4azRhQ05FTHZSR3MwcVB1aFBlWlNOeFIvb0lackN0K05vbTZpbldM?=
 =?utf-8?B?WTJrRUFnZXpucXZ6UzNXRmNVcjRXR1d1dHlSeXdIcVFqYzdKeEw3ajNhZEoz?=
 =?utf-8?B?M01zOHNPODIvMUZkNHBCZUkyZ2RkZUJzaW9iNGZ4UnAycVFqVmtBU1hBOGww?=
 =?utf-8?B?ODNjbngzdjFrS0laOWpDSlhRZGRScU1kSnl0RTAzZEkwMm9xV0pqbUVjQXYr?=
 =?utf-8?B?WDMvODFJei9kWWx2VW14Wmg3TTU3RmZHUGhiRFZOVzNZa1laK3NXYzI4L2Jt?=
 =?utf-8?B?N3VmbkZrOGdUSU9GaDgzZ3VjRzk5cVZnazRjb2lnL3lnQW9LK1dBeDcvVm1M?=
 =?utf-8?B?cTFEUmk1QXJ5QlplKy9VWmJtUHk4R1ZNRUtyL05zZnJXNE5qNWY5aHR6eDl3?=
 =?utf-8?B?Y0IzYlFORTZEYWlhWXVIV0RPWm5obHZ4ZzVveFBnbC9qRFdvM2RWZCt0UzRP?=
 =?utf-8?B?eHhwUStBWDIwZkVRMDN0VGNicWovUGpaK3pQbHJYT2MvRUhaaDF4dkQ5RUU1?=
 =?utf-8?B?d29VMFpheXlLS3d5Mm1wRWdRUjdObzlEMjd1QzhOTUZkdUxDeUdMcklpVngy?=
 =?utf-8?B?SG4zN3JlRmpmNlJjMW1aZmxnU21QS0FPQ2RVTW9GTXlxRnJvWXh5QVIwVk84?=
 =?utf-8?B?WTZUSktDV0F5OWhidE5OZE8wK3NOMGZ2bVRRMm5xTkpxdlZ2bkJTVFhweERn?=
 =?utf-8?B?Z281V2FTRENJWWtjODlEdEphK2svdzBFc3pMQVBZSCtWNFI2UExIRGVoTG1V?=
 =?utf-8?B?WWYxbHh6WkUycEtsSVdaUWtjSUorL2FGVGZDa3l4TU9JRHc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB7738.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dEQ5Tzg2YURzajMwLzVvS1pITFF4TFhFSTBDcVJWTUZnelI2dUhHN2NhK0RQ?=
 =?utf-8?B?a2xMVzNzclpIRDdwT1NBSmkwdjZzNkdFa1pYdzM5aHpEclZZK0wzOFp0azVQ?=
 =?utf-8?B?UklYT2daSGxqTjlnaXhXbFpEWmFEQVExaWltNXl6NUxEay9Wa21OOTNUQ2kv?=
 =?utf-8?B?eVl1Qi9YUWozd09LRVBUQ2RUa3RoWEhFRkZXOS9lVWtHZTB4YXBuRHMyUnN4?=
 =?utf-8?B?dFR1NlE1UW0wQm5tSnlFSWMrc2xTaTdSR3p4UHVDN0ladjVmS3FBd1FQdzBy?=
 =?utf-8?B?NzJBUE5LUmpBTWNMa09PejVOSWxGTFYvbW5DOGd6VW9iTVN5TnFaRm1FUlpv?=
 =?utf-8?B?enVMN2xUTDJaSVgrWStvTnhVVjNidkZaUFpCb0dXNW1LQ0pOcitVUmhSNnNq?=
 =?utf-8?B?WW1mM2c0MG5NM0tlZm11YmpFRHNsQUxlVGZ1K3VQVlRNNEU5cVhOaTRHQ015?=
 =?utf-8?B?U0VMR2lJZmxTVVFHMUw4M05CNTB0MkZGQmpod0lLR3IzWmVaZ29SWHhpMlhV?=
 =?utf-8?B?eVFKMVF4MXpYWUtSY0RvUWI3K1lzSzZwSXJPcm9MV1R0NmRSYzFEQzFBMWw4?=
 =?utf-8?B?bTJJeWJDaStlRzFFaWNzZGIvMHh5ckNvcGZOTlIwMGFoVE85aFJnTXJYUzFG?=
 =?utf-8?B?UVBBQ3FVMTllUUtoZExIREM5OU5wSUZzUE5DWGdxWFRNcVVuRjRubjlXUEFW?=
 =?utf-8?B?c0JnWjU1SmZZZDhKNG84Vm1FWGEwWDQvbys2Q1VrNDdNKzZHVVNxR0phZzBt?=
 =?utf-8?B?T3QwUVBJUFo5NkZlb1QwdldXMFpFR05jU0NpbHFoR2JqbDdxSGJEVXZGNmoz?=
 =?utf-8?B?eFpHY2lWbE9LWHZpMmhPcnNRNmpzU25HVDhJRHpzaE4rZXVONFJLTVpIcEx1?=
 =?utf-8?B?Y1R4ZW9sKzA3ck5IaEFUcjYrMjMySHgyMlExdU9MSXJaL1AxdjFJTE56YWV2?=
 =?utf-8?B?WmszNytXRkxqV0oxbWZKeTl3cjg0MXJ3a3c3MUdGcGpSbER2RHl6cHgwSHVE?=
 =?utf-8?B?ZVhqRDdoWmFWMUVraGJxOEM2YnkvVVNPMmt5UjZ2SlNRYTZjSzJObnlZRmFp?=
 =?utf-8?B?czR5Y051UlBiYm1GMnNld2JnVUJsUHlDUHBkeGVvY1JwbzNIWEpHbFVYRkhl?=
 =?utf-8?B?Y3duQ3Z4WTVXZi9mUGtnN1NsMW1oN3BvQlFOdHNXdjZqZzBkMnMwUXIveTQ3?=
 =?utf-8?B?S1IzU09DZ0FQMXgzRG1IbC9UVXoreHV4S2xqVldWQTlqYTE5T2lHQkVtN0pl?=
 =?utf-8?B?MnhaTFl6U044S1VVUG5OUlpFTldrWlZtMVEzY2xoVFpJQUM0SXhEd29BL2Zm?=
 =?utf-8?B?ZnpzV2V5TkhGcnRQV251RFpUODl1Y0tsZ0N6ZVVWcy9yVWQyUndEYVhDL29M?=
 =?utf-8?B?VVlkR1lHNlhBR1VrZmR4UjBSdHJRRndKL1gwYXM0K0ExKzc4SEliVUZQLzZo?=
 =?utf-8?B?aWNhN3BnRE9Sbi8wd0k2NWRCcG5QaklLSU1XVHhUOTY1ZUdNYlV2UENJQzdG?=
 =?utf-8?B?UXFZV0svYzh5OTRIZklQOFpNd0s0ZjlqbVNLTTJTbkNUS1RzYmNreCs4dzEx?=
 =?utf-8?B?bHRDajJCMlJ4bDE5SmUvdjRZNFhJWHY0dUQvNDZVenRqVGFhTFphNHZzZE1q?=
 =?utf-8?B?R0xwNDUvWis1V0FaWHQ4U3Y3alFpL2h3ZWdyT3VqU29mRzJlUTVyeFN0dktm?=
 =?utf-8?B?U0t2VkhtUGJWcU9nZlVtdy9SRXpsWWxrNGp4UndqQlZsNkhYQW9UN0hXTTB2?=
 =?utf-8?B?WE1EWTFycUk1TGNhTDBtdGRrUThhQUE4VmpvVm1YTCtLMUZhelRtTXpYZU9t?=
 =?utf-8?B?c2w5SGROdWhNdUJvUVRzUllMVUdCOGtVSTczeGpKVXBHMUsrUGs2V1JzZnRT?=
 =?utf-8?B?Ym52WU43M09wV3ZJZWJwa3pwS1N0SnkvaUtyRlhoVnpLQk1QV3prVkxtdXNU?=
 =?utf-8?B?S1VhT3daYXpTZmlrckJOcmM5ZzhiQU9GbXdOMjVDNWFISC93VHVHWWs2RDUw?=
 =?utf-8?B?QzFFY3ExYTBiaWlCU2RHNmFKdkhMNjBpWlFuQzU1UHR5VWFsWThBMGlvQktE?=
 =?utf-8?B?TytraWFBbE9oSEVnV1JFRGxua3FlalVaa0k0WGZ1bkpSZDR5cjdFbEU4M1Nr?=
 =?utf-8?B?MkZqNnA3aGhXZGhLd0V2L1drWW9xbjZ3WU5Qb0hTUE9UamUwSy93eE9RWkRP?=
 =?utf-8?Q?75pWrH71DXXoLv4YJJ+yiDk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB7738.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 072bf3a5-29ef-475b-d72d-08dcba517f68
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2024 22:03:57.2227
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3XQvbfguFayoeW1cwmPXbBClrxn+IEt1sbUy2jzaeuYllp011Iu0DRAA2G7DPTWThpRldHeoSRI6DX/rdnNazA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7607

VGhhbmsgIHlvdSB2ZXJ5IG11Y2ghDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YnJnbEBiZ2Rldi5wbD4NCj4gU2VudDogU2F0dXJk
YXksIEF1Z3VzdCAxMCwgMjAyNCAzOjM2IFBNDQo+IFRvOiBhbmR5LnNoZXZjaGVua29AZ21haWwu
Y29tOyBsaW51cy53YWxsZWlqQGxpbmFyby5vcmc7IGxpbnV4LQ0KPiBncGlvQHZnZXIua2VybmVs
Lm9yZzsgQmFydG9zeiBHb2xhc3pld3NraSA8YnJnbEBiZ2Rldi5wbD47IEFzbWFhIE1uZWJoaQ0K
PiA8YXNtYWFAbnZpZGlhLmNvbT4NCj4gQ2M6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ou
Z29sYXN6ZXdza2lAbGluYXJvLm9yZz47IERhdmlkIFRob21wc29uDQo+IDxkYXZ0aG9tcHNvbkBu
dmlkaWEuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDEvMV0gZ3BpbzogbWx4YmYzOiBT
dXBwb3J0IHNodXRkb3duKCkgZnVuY3Rpb24NCj4gSW1wb3J0YW5jZTogSGlnaA0KPiANCj4gRnJv
bTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPg0K
PiANCj4gDQo+IE9uIFR1ZSwgMTEgSnVuIDIwMjQgMTM6MTU6MDkgLTA0MDAsIEFzbWFhIE1uZWJo
aSB3cm90ZToNCj4gPiBEdXJpbmcgTGludXggZ3JhY2VmdWwgcmVib290LCB0aGUgR1BJTyBpbnRl
cnJ1cHRzIGFyZSBub3QgZGlzYWJsZWQuDQo+ID4gU2luY2UgdGhlIGRyaXZlcnMgYXJlIG5vdCBy
ZW1vdmVkIGR1cmluZyBncmFjZWZ1bCByZWJvb3QsIHRoZSBsb2dpYyB0bw0KPiA+IGNhbGwgbWx4
YmYzX2dwaW9faXJxX2Rpc2FibGUoKSBpcyBub3QgdHJpZ2dlcmVkLg0KPiA+IEludGVycnVwdHMg
dGhhdCByZW1haW4gZW5hYmxlZCBjYW4gY2F1c2UgaXNzdWVzIG9uIHN1YnNlcXVlbnQgYm9vdHMu
DQo+ID4NCj4gPiBGb3IgZXhhbXBsZSwgdGhlIG1seGJmLWdpZ2UgZHJpdmVyIGNvbnRhaW5zIFBI
WSBsb2dpYyB0byBicmluZyB1cCB0aGUgbGluay4NCj4gPiBJZiB0aGUgZ3Bpby1tbHhiZjMgZHJp
dmVyIGxvYWRzIGZpcnN0LCB0aGUgbWx4YmYtZ2lnZSBkcml2ZXIgd2lsbCB1c2UNCj4gPiBhIEdQ
SU8gaW50ZXJydXB0IHRvIGJyaW5nIHVwIHRoZSBsaW5rLg0KPiA+IE90aGVyd2lzZSwgaXQgd2ls
bCB1c2UgcG9sbGluZy4NCj4gPiBUaGUgbmV4dCB0aW1lIExpbnV4IGJvb3RzIGFuZCBsb2FkcyB0
aGUgZHJpdmVycyBpbiB0aGlzIG9yZGVyLCB3ZQ0KPiBlbmNvdW50ZXIgdGhlIGlzc3VlOg0KPiA+
IC0gbWx4YmYtZ2lnZSBsb2FkcyBmaXJzdCBhbmQgdXNlcyBwb2xsaW5nIHdoaWxlIHRoZSBHUElP
MTANCj4gPiAgIGludGVycnVwdCBpcyBzdGlsbCBlbmFibGVkIGZyb20gdGhlIHByZXZpb3VzIGJv
b3QuIFNvIGlmDQo+ID4gICB0aGUgaW50ZXJydXB0IHRyaWdnZXJzLCB0aGVyZSBpcyBub3RoaW5n
IHRvIGNsZWFyIGl0Lg0KPiA+IC0gZ3Bpby1tbHhiZjMgbG9hZHMuDQo+ID4gLSBpMmMtbWx4YmYg
bG9hZHMuIFRoZSBpbnRlcnJ1cHQgZG9lc24ndCB0cmlnZ2VyIGZvciBJMkMNCj4gPiAgIGJlY2F1
c2UgaXQgaXMgc2hhcmVkIHdpdGggdGhlIEdQSU8gaW50ZXJydXB0IGxpbmUgd2hpY2gNCj4gPiAg
IHdhcyBub3QgY2xlYXJlZC4NCj4gPg0KPiA+IFsuLi5dDQo+IA0KPiBBcHBsaWVkLCB0aGFua3Mh
DQo+IA0KPiBbMS8xXSBncGlvOiBtbHhiZjM6IFN1cHBvcnQgc2h1dGRvd24oKSBmdW5jdGlvbg0K
PiAgICAgICBjb21taXQ6IGFhZDQxODMyMzI2NzIzNjI3YWQ4YWM5ZWU4YTU0M2I2ZGNhNDQ1NGQN
Cj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gLS0NCj4gQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9z
ei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPg0KDQo=

