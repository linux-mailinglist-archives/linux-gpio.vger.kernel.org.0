Return-Path: <linux-gpio+bounces-32145-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJXTNsblnWlDSgQAu9opvQ
	(envelope-from <linux-gpio+bounces-32145-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 18:54:14 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A374118AC88
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 18:54:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DD228303B1A3
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 17:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A6A03A9616;
	Tue, 24 Feb 2026 17:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="H4B7hQoA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011042.outbound.protection.outlook.com [52.101.65.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDDF3A961A;
	Tue, 24 Feb 2026 17:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771955651; cv=fail; b=ZwlAl0ed54J3IoknU6+CbFKI7hE72cbyJc4+0d5AmySQ3AZ4ubNJNqzgziXv8U0aCYEEqVSOY5MZppbnQzuPVSsIh03Z/OImSl8lVoUtKkr/8HwhAuK1vJABPlj2eO8O1uIUZSf0Ar7r9K9bEpX+Q+qHy5PQ/GWUlwY/mvJ9jkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771955651; c=relaxed/simple;
	bh=IZuRR0NhKSmdZfr0fRvCi0Hk4JtQ+7GEYgbgxynJcGs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nipRfeLqgg1Q0z1tpvXDFuc6rb01RHKM6OOmKdhSUxWu73wMVzkMqC9MGzTLwKpgscVq1JRvsDLPjhBwKpg4mkEZmR+AvSsEAJpJvxhmPW+LIWxyTFUd7PNod21iL+LjBjvcBjnOC5idebZV9PNY+hoCi84xErm89H3/8SXZauc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=H4B7hQoA; arc=fail smtp.client-ip=52.101.65.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b/bOrkIHs3MXMdSEm3/s5iQaWULbzTl1jKl7Vc0ru95rnXVhjp3A0b7Y6w+b7EkfJD290NPUbNVJsIVTjZsOls0NNJywvHdm2piyxkC2hZcjLEqGeV6hryBBr5BNPwSYYOtBTnn7fuVk8VbMe5V9yAmRN3iCZEG8ZIQWM2FhpNntwp1w0rFY4RHwgwzg8wJsZP5RE0apCyMPDueOJHgcPflm2/zzYgYywAo9rzCGoC434pf6WuSVPwUy8z/g3VLA82v7NdfMcyWWKfBRtYv21OVSNkHQd5dpQlwyjYOvO8wQNoz668ySDhiKepnj89Ei512l6jKeqIh5fib1SsZ4Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZuRR0NhKSmdZfr0fRvCi0Hk4JtQ+7GEYgbgxynJcGs=;
 b=XA4gTwVrZYtcMVt6txk04+EY5V0no/zfnT4JlKqXbIMTLuiteCd3w8Q4OmyuBQ5SkX9H3EdP6SappMbqrlTTWNxNLyDSA/sLZu5WA8Mha9T6eYdGmZ40w6d4IJa6r1ONGw6kiZZqerQ6pzKcuTaAxcGg+Tlrm5Ph7cXH8speOWpftNof6YjZWtHWBcPq7EM51baXoa0IDJhOlEhV2Vxc5fqD6gsNQnDdD82ns3ydRnrhBirZ1enoRD7Re0LwO4ZktV3hAj4p+9aWzpMEOsUTSJY5VYlRuF0HUs2qw68ESYqm172TAEnLjMOoLN7dNpjZLB9G1gRtR+wLzfphcn2Lbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZuRR0NhKSmdZfr0fRvCi0Hk4JtQ+7GEYgbgxynJcGs=;
 b=H4B7hQoAAdX3/5BmPA87+yxQoblivbsdUn35yydJ38/Aly/i5gcszKjTFcXPipVHAZvF0vNR0yfOT3XPCl5VtyJyUndHo9Jd6JX1KOXCKlqVqn+38NM98dC/06AXeHlaZ2N6S7OtrqKRrzpWuSVxilXaLrjoUHPUCqc+Y9eNu8IGC4kw7TZrB3nAzkURihIusqmbG4PLSgECyc2e0N5x/Quc9F/mvyq3XuoK8GbZGd8Lf3xVKcaEVsV/+MHCsrA5tZSLCzcl2mZVA/we9dvOEIaKpDKSdetRbo3HWWRICj/aW520DM1vIVKGtoraVdYITzoqU+Hj/lIVcA1X6OAmKA==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AM9PR04MB7633.eurprd04.prod.outlook.com (2603:10a6:20b:2d9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 17:54:06 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 17:54:06 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Linus Walleij
	<linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson
	<andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Frank
 Li <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan
	<skhan@linuxfoundation.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan
	<peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Topic: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Index: AQHcpbaRp7qQf7RIXECQO1Hssm46sQ==
Date: Tue, 24 Feb 2026 17:54:06 +0000
Message-ID:
 <PAXPR04MB9185F1A67384E4886282227A8974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <fd257c80-d97f-45b0-a12f-3a1888ba81db@foss.st.com>
 <396819f2-dd00-4c09-8bc7-c035a5282a56@lunn.ch>
 <PAXPR04MB9185A908F5090F0CA4FF05F78968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <b21b9ee5-d84e-47f8-86b5-c111ecc3d43d@lunn.ch>
 <PAXPR04MB918576D67A268E59242964A08968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CAD++jLkUVFckLTq=SoivNFoFymhJo4KM=qGmajFcv9T9+7tPmg@mail.gmail.com>
 <b4c422ce-3538-40aa-8bfa-b70f02774b5d@foss.st.com>
 <PAXPR04MB91859B642802813F908B03DA8977A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <64ef5dbf-6264-4758-a5d8-d8c52c359fcc@foss.st.com>
 <PAXPR04MB9185934EB640E8B21905FF878974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <79eb8bb8-83cb-4b24-8e56-42a53c710055@lunn.ch>
In-Reply-To: <79eb8bb8-83cb-4b24-8e56-42a53c710055@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|AM9PR04MB7633:EE_
x-ms-office365-filtering-correlation-id: fb371356-af34-48a3-29ab-08de73cdb445
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|19092799006|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZmlYY0FkOHZBMCtkdHhTVnR6bzZxaXoxUkdrQlFmcWlWT0drYXFQZnBaYlFJ?=
 =?utf-8?B?eVBlaFFqTncvZm1naFd0UHpCL3VveldmUTkwZ2wzVkRpdG9lZS8vZXl6SW5k?=
 =?utf-8?B?ZUxFaEFkSnRBbEZpL21Kd1o1b0dFM0p0YWlIY2w2YTF6ZU1zcjdJeDQ3aThS?=
 =?utf-8?B?UWU1cWZSU2ZSb3UvMVV2U2lTbytqMHpVNGNVYTZUeWg3aWxLb3F1UDVlQ2Y4?=
 =?utf-8?B?anVaOEh3NU55MDlOWlFrUHhtWTNWWC92QnVFOVZueFZFUVpONTM1RGhGK2RS?=
 =?utf-8?B?T3k3OXRCZjVkYVJ6R3hGYS9EcHNHcHk2eGsvayt2R0IvS1h6T0MzN3hxay9q?=
 =?utf-8?B?MWdIUTliMTFTcXV1d1BGajI1dWkwdU1OclcwTVk2NzAyMm95OTRvdWNtTWlh?=
 =?utf-8?B?L2dnZzZhSkNmTFVtTS9laEFvOCtyK05ra3pzRXNTeS8zYlY2T3Z3RzV1L2Vt?=
 =?utf-8?B?dTlHQ3krK3JjbzFsdWRHL1ZDWGdFNlJJM0JNQlFxeGVYc2drbTh4TlhXcVZL?=
 =?utf-8?B?RGwvQnhKYVlDeHBpV0RMTUZhTENnZm5aMlEvaVh2aElZczRqQmNvYjJ1WVYy?=
 =?utf-8?B?dVBtaHl2OENBQTJoSFU3NzQ4VWJCaWcrcStqN3YrdkZ0c2dCemFzL2lkMGNV?=
 =?utf-8?B?SmJDSmNvWGZJSkVnWnB3V255eS9FUDYrd2lQblA0aGcyK0lLbzV5SXFjSCth?=
 =?utf-8?B?MVhCQk8zZHN5QmR4UUkyOFVsOHNLRWt6eGFYSWFCU1VaelRxam5YNDMzYUhp?=
 =?utf-8?B?R0JXMEROSk42SVl0TU5NNXJMbWo5OS9FNUUvamordlA1REdwRkd0QStUblRT?=
 =?utf-8?B?WUJLRVI0cm5QdkU2SE5ITysvbmg0MjNkWTJ6RVIwOW5kc2pONkJ5TjQ1QlZt?=
 =?utf-8?B?YjR0blhIZE9WUTdTN0g1YzF4bmtiQTlLTDBEYjUvTWdIQVdUWVU2S1JVV1Fo?=
 =?utf-8?B?UkhIVnNtanAzUjRhNi9kNWZ3RnpmVGRFak5DSlF3WlBrbktndWlTb0Ftd2tL?=
 =?utf-8?B?TFFQZXhsenpwM3RZN1N1aVh0S0lFQ1BuSGJFWUM0SVVicWVvcDdqLzlwLzE2?=
 =?utf-8?B?S05TeHhQb3oxRUt4TFhtb0RiNHV0ZDRhNHlvMEVqZnBRUFcraWtJL1FWT2JB?=
 =?utf-8?B?R1E3ZnFoVUlkcVRteVJpdHkvYkNQT05rOU1XOXNidHBXbkdRQldCRWQzU3lh?=
 =?utf-8?B?OGxsbzdIOEtOckZzYU9pVU9qTkxGWTdHYkNjTmdZeGdFbVRya2pWcDROaHpD?=
 =?utf-8?B?Q0dDL3VVZjcrbTdkMXFyV0toNHJmbkdROSthRTdUQ1RhRk9hYld3WTBtU2xn?=
 =?utf-8?B?TnRzajZIQXZjVm9XMWJyRHlSSXREZTBqc2sxUGdHNDNjM2ZSWEdsN1hjRXpP?=
 =?utf-8?B?azlYVU5ITmh1bG0yN0pRVFExZGxFUVQrdzBwRmVpODBOc2NHTm9nSVJxNldp?=
 =?utf-8?B?K2txK3VEZkxNMUhkTGt4S0RYVW5xcEhTME1YNXNVUWtHQ1hqeEdNa1lGM3pj?=
 =?utf-8?B?TDFnR3ZLZyt3U2Rrc04zMlJ5bWZURkFNanRCT3MrUVd5bExjTWdNcmN3QUdC?=
 =?utf-8?B?YWZOdjl1Z29aYWVnZzAxNTY0SmVUNldyMWZSSHp3MWtHdXhzRS9zZUZ2Wldl?=
 =?utf-8?B?aklSMklQSXJHV2V0aC85aDhtL3FBSmFPNTlWaVRiU2RQYy9OSzZGdUxCRDRD?=
 =?utf-8?B?Z1l0dUc5bHpzMzl5alk5a0JidVBmRjBNZjRTVkdHOU5wNXpMeWRvWERBNEl2?=
 =?utf-8?B?dDRVRU5EdGRsUWZkUEdqVVpuQ2NaaUlWWjJQMnY2ZHVxbFNMSUt5NXNLeko5?=
 =?utf-8?B?NTkxeW00SVJTbFlReTRVVTVERlpVVnhGRThtbnVYQmRacVhLcW1hOG9POHlo?=
 =?utf-8?B?N05ZeUU0WmZTUFp0cG0yYXU5VmtSR1h3S2J5VWlFaDh3UmpLRTFpMlhkdExz?=
 =?utf-8?B?MzJQdkdpU3F6eHZlOFdVV293SzhTYmlKR1lFeDJwYXBhb09oMWRyeVIvZ2Nv?=
 =?utf-8?B?TzM1Uml2SUdCRWxiVlN6RlFQeGhsYThzT1BscEh3MllrdE1sdVNnYmJySGto?=
 =?utf-8?B?VDhhS3RQYVJFd3Z0MExQT09oN0ZsZWF0aERhS0J2WXl5bC8zd3A2bmsyQkVV?=
 =?utf-8?B?aWNDRld2QmxMN01jMDZjbUZOZUdMREVMRUtEZWR5UjYrZ3FSM2h1SnR0ZHVa?=
 =?utf-8?Q?bUNBhESVvVF/SYIfAD/HNGE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bGh2cHVQemxhR2VRQkNVQnF5WTV1dERId3ZibHRBc2xiS25DeUUxVzA4OGlL?=
 =?utf-8?B?WURuRlBFVDZrN1g5OFhvMXJiS2ZLcmk3MWVnbk9GdThkWlE3MHNjaE5zL2VN?=
 =?utf-8?B?aHdCNHBkYTR4LzUxdm9BaHIwVHhWaHEvYWpVeENuU2tlS01hOFJSSHNIQ1E2?=
 =?utf-8?B?MkgrVXRGZlFwWHMxZkVrS3BKNDZpS2FXQkJpcWlrdGJLcTQ0WVVFb1A4MmpQ?=
 =?utf-8?B?ZkRNRzAzS1pFYkU2Qmw3b1NKSlRldGlkYVdlNzZCcldURHlVeEdUS2laREFk?=
 =?utf-8?B?dU9wdjJUb3lPRmFQWFNpTVdtaXhwS01xTjBOWEc0ZUp1S3VkNHFZcllrOTRG?=
 =?utf-8?B?bHA0ZkVSUWJBcERmSU9IMVhSUFNiV0VwV2Q1Rm5zNG10NWt4c252enJBN0hw?=
 =?utf-8?B?K21GQ3lYMzJJREpXZDR1L2E2VGwwdXBqZWJWMjZtWkVQcXdQTmJYc0t2ZERL?=
 =?utf-8?B?a0pmT0tnYmZVRTB5WnF4VlBaSFU5THErUG1PZmQwd1ZJMU9ZVCtTSXdjWnZ4?=
 =?utf-8?B?YlEzSE9ocUlsYVdTN2dFZG1WWllvS29mNHQ1UnhIeXZPYm9YOWVrSFF2dm1s?=
 =?utf-8?B?b2toQ2JLekRsZ3JkbjFzeU1HMWVWc3VWVUt4bEZJVVZuSFdMNDJUaFNCYXc0?=
 =?utf-8?B?UGlFcVhPUHVOME5HZzF4U2thZ0R4TGIxclRwU0x1ajIzRDJlUFkzYWpDemJ1?=
 =?utf-8?B?bDdqYTQyMmpHbVg4MHhGMWp4bVMwYlBZdHlLVFNpWFQzcXNCc1lhWjRmVmRR?=
 =?utf-8?B?YTlwUFl0LzNkVHJFRUJveTdvOS92UjZ1dnFvVnNVeDVtYTNXdE1Kcnk4Ukt2?=
 =?utf-8?B?alZQdXEvazg3VzI5dEc1OTVsQ2tscWJ6RUx3c042aXBjUTM5THpBOGs5QnlI?=
 =?utf-8?B?b05PTjRoMEgzVzFWU3ErdUNkS2M5dWVvSVgrMzBEU0NlN3Z1Tis0TnZENFV3?=
 =?utf-8?B?Y3VNOTFqTGR6b2VKQ2krNy9IR2V5eExLNkJSVVVwWm15aGg3Rk1EMEV4NTJJ?=
 =?utf-8?B?UWVXdFZZemIrNEJLQ25zdU83SVlhRW5oQlhOaW1iV3dWWGp6ZjA5R2RFejlF?=
 =?utf-8?B?UmJZQkQ2Y2Rtb1lvZ2lKbHJydVZhUlhZaWJvMm1SbCtKaEI4MVVxTVF0U25q?=
 =?utf-8?B?N0k5SVhDK2tibzd2b1NLYUFaU3lwZDhXVENHc1hSckp0Tkl3M3VYRHY1QktQ?=
 =?utf-8?B?cEJnR3VSTUNubTVOYjdaZFBla3ZNY2t1Vk9CTEtIaTJvV005SGV6N09RVFgx?=
 =?utf-8?B?TTJIRE9UL01pU3duYXFYYTZkWjZBNXBiSnNyOFFiZDBNOGtFdU96NkxadmpC?=
 =?utf-8?B?ZkpoY043TXNyZ29OSTdxanJncW5Za2ZYSGR3QXAxVzVkcENZaE5meVVMMHh4?=
 =?utf-8?B?d05UTzllRmRYQzA0M1Y4OGNQRXo0ZlVGVjhINldrcU5KVTRoMzBiQUhnZENv?=
 =?utf-8?B?WWtqMTg4a1V5Zmwwei9SVXo2UFZhVThRd3VYdkx2Sy9aWWJMeHYzTUVJM05W?=
 =?utf-8?B?L0xiK21kV0k5OHhYWGRNODRadko4aVp2UE93ZjJsK0VxMHJSNUtYQy9TRHNx?=
 =?utf-8?B?SXdWWkJ5NUM5d08wU2hYT21IQ0hXeWIzSVh2dzFvUlF5NTlEMkpkYkJUelRa?=
 =?utf-8?B?eUlkODBaYktIM3lZdXdlR04wVUc1UndJWDFCMmtQd0xMVk1XOHQxR0VwWnA5?=
 =?utf-8?B?eXc4Y1h5NjVnWjJHRytkU0tobStiVkxFMEF2eEtlUGhvTU4xTmFQaFcwQ3l2?=
 =?utf-8?B?dWFMM0orY2hnUC8vVkM1Ly83THBUb0NMTDZtNTRmSit4OGxtdkxnMzMvaGhs?=
 =?utf-8?B?a0Q5ZlA1QnFFTzB1OUxuSHdqRmdzTzR6dStLQXFtcFhzNFJrNWtveXNYcVps?=
 =?utf-8?B?aFFxZEtwdGlKR2tmcDVpc0ZidDlPZzFDSjlhNkt6cVM4SkgxWVl3d1FXN0sx?=
 =?utf-8?B?bEF1TkdpY2plMklkcy92L3UxZU0rYTBWOFNib3c1dm83M2pkRW5hNHV1MkVl?=
 =?utf-8?B?a2tzRmhrVzZBRks3azJyY2NIUTI2VXNPSzVSL0puWXhlaFZuQlVNcGVtTTU2?=
 =?utf-8?B?bDF5WGMrbGZPcS94WWlRNCs3VkRNM205TVBYUzhwSDh1QzlFSlk4VmpSTTVB?=
 =?utf-8?B?NGpJSXpHcTZLR0VqNHYyd3VWOGNVWEhydTB6ZzkrK1h4ek1MRks1d3hlamIz?=
 =?utf-8?B?OVkwRmduRTVnMFlJZllXVHZaUlZ1WHR2WXU4d1h2Q0dXVDJUY2V5Tjg4VU5a?=
 =?utf-8?B?ZU9qYVQ2dmFjQXlRdmVwWk9GT2I3QjJGZnZZd1dEZnlVUDhhbVZwWCtmZnI5?=
 =?utf-8?B?NlFMSlZycTJhSHZXYWhWS2hXYjFqTXJEbEJ1aUpLS1ZYWkQ2NWJSdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb371356-af34-48a3-29ab-08de73cdb445
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 17:54:06.3005
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M/vxyqhhstCgukGzkgNRHfS8IA6hVKsd5JqBEjUqXbPQbW5J1EAuIMNW5jrOMniIQf6bRNxrR8FYSnoxfWSAxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7633
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32145-lists,linux-gpio=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[foss.st.com,kernel.org,lwn.net,linaro.org,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.971];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A374118AC88
X-Rspamd-Action: no action

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmV3IEx1bm4gPGFu
ZHJld0BsdW5uLmNoPg0KPiBTZW50OiBUdWVzZGF5LCBGZWJydWFyeSAyNCwgMjAyNiAxMTozMSBB
TQ0KPiBUbzogU2hlbndlaSBXYW5nIDxzaGVud2VpLndhbmdAbnhwLmNvbT4NCj4gQ2M6IEFybmF1
ZCBQT1VMSVFVRU4gPGFybmF1ZC5wb3VsaXF1ZW5AZm9zcy5zdC5jb20+OyBMaW51cyBXYWxsZWlq
DQo+IDxsaW51c3dAa2VybmVsLm9yZz47IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJyZ2xAa2VybmVs
Lm9yZz47IEpvbmF0aGFuIENvcmJldA0KPiA8Y29yYmV0QGx3bi5uZXQ+OyBSb2IgSGVycmluZyA8
cm9iaEBrZXJuZWwub3JnPjsgS3J6eXN6dG9mIEtvemxvd3NraQ0KPiA8a3J6aytkdEBrZXJuZWwu
b3JnPjsgQ29ub3IgRG9vbGV5IDxjb25vcitkdEBrZXJuZWwub3JnPjsgQmpvcm4gQW5kZXJzc29u
DQo+IDxhbmRlcnNzb25Aa2VybmVsLm9yZz47IE1hdGhpZXUgUG9pcmllciA8bWF0aGlldS5wb2ly
aWVyQGxpbmFyby5vcmc+OyBGcmFuayBMaQ0KPiA8ZnJhbmsubGlAbnhwLmNvbT47IFNhc2NoYSBI
YXVlciA8cy5oYXVlckBwZW5ndXRyb25peC5kZT47IFNodWFoIEtoYW4NCj4gPHNraGFuQGxpbnV4
Zm91bmRhdGlvbi5vcmc+OyBsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IGRv
Y0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IFBlbmd1dHJv
bml4IEtlcm5lbCBUZWFtDQo+IDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+OyBGYWJpbyBFc3RldmFt
IDxmZXN0ZXZhbUBnbWFpbC5jb20+OyBQZW5nIEZhbg0KPiA8cGVuZy5mYW5AbnhwLmNvbT47IGRl
dmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4gcmVtb3RlcHJvY0B2Z2VyLmtlcm5l
bC5vcmc7IGlteEBsaXN0cy5saW51eC5kZXY7IGxpbnV4LWFybS0NCj4ga2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmc7IGRsLWxpbnV4LWlteCA8bGludXgtaW14QG54cC5jb20+OyBCYXJ0b3N6DQo+
IEdvbGFzemV3c2tpIDxicmdsQGJnZGV2LnBsPg0KPiBTdWJqZWN0OiBbRVhUXSBSZTogW1BBVENI
IHY4IDMvNF0gZ3BpbzogcnBtc2c6IGFkZCBnZW5lcmljIHJwbXNnIEdQSU8gZHJpdmVyDQo+IA0K
PiBDYXV0aW9uOiBUaGlzIGlzIGFuIGV4dGVybmFsIGVtYWlsLiBQbGVhc2UgdGFrZSBjYXJlIHdo
ZW4gY2xpY2tpbmcgbGlua3Mgb3Igb3BlbmluZw0KPiBhdHRhY2htZW50cy4gV2hlbiBpbiBkb3Vi
dCwgcmVwb3J0IHRoZSBtZXNzYWdlIHVzaW5nIHRoZSAnUmVwb3J0IHRoaXMgZW1haWwnDQo+IGJ1
dHRvbg0KPiANCj4gDQo+ID4gSGkgQXJuYXVkLA0KPiA+IEdsYWQgdG8gaGVhciB5b3UgZmluZCB0
aGlzIGFwcHJvYWNoIHJlYXNvbmFibGUuDQo+ID4gVG8gYmUgbW9yZSBzcGVjaWZpYywgSeKAmW0g
cHJvcG9zaW5nIHRvIGRvIHRoZSBmb2xsb3dpbmcgbW9kaWZpY2F0aW9ucyBmb3IgdGhlDQo+IHBy
b3RvY29sOg0KPiA+DQo+ID4gICAtIHJlbW92ZSB0aGUg4oCcaWTigJ0gZmllbGQgKE1lc3NhZ2Ug
SUQgQ29kZSkNCj4gPiAgIC0gcmVtb3ZlIHRoZSDigJxyZXNlcnZlZFs1XeKAnSBmaWVsZA0KPiA+
ICAgLSBhbmQgYWxzbyByZW9yZGVyIHRoZSBmaWVsZHMgc28gdGhhdCBwb3J0X2lkeCBhcHBlYXJz
IGJlZm9yZQ0KPiA+IHBpbl9pZHgNCj4gPg0KPiA+IElmIHlvdSB0aGluayBhZGRpdGlvbmFsIGZp
ZWxkcyBzaG91bGQgYmUgcmVtb3ZlZCBvciBhZGp1c3RlZCwgcGxlYXNlIGxldCBtZQ0KPiBrbm93
Lg0KPiANCj4gSSB3b3VsZCBzcXVhc2ggaGVhZCBhbmQgYm9keSBpbnRvIG9uZS4gUmVtb3ZlIHZl
bmRvciBhbmQgdmVyc2lvbi4gRG8gd2UgbmVlZA0KPiBib3RoIGNtZCBhbmQgdHlwZT8gSXQgc2Vl
bXMgbGlrZSB0aGV5IGNhbiBiZSBjb21iaW5lZC4gQW5kIGlzIHBvcnRfaWR4IG5lZWRlZD8NCj4g
RG9uJ3QgeW91IGp1c3QgaW5zdGFudGlhdGUgbW9yZSBpbnN0YW5jZXMgb2YgdGhlIGRldmljZSwg
b25lIHBlciBwb3J0LiBUaGF0IGlzIGhvdw0KPiB5b3Ugd291bGQgZG8gaXQgd2l0aCBNTUlPIEdQ
SU9zLg0KPiANCg0KSSBkb27igJl0IHRoaW5rIHdlIGNhbiByZW1vdmUgcG9ydF9pZHggaWYgdGhl
IHByb3RvY29sIGlzIGV4cGVjdGVkIHRvIHN1cHBvcnQgbXVsdGlwbGUgDQppbnN0YW5jZXMuIElm
IHlvdSBvbmx5IGV2ZXIgc3VwcG9ydCBhIHNpbmdsZSBpbnN0YW5jZSwgdGhlbiBzdXJlLCBpdCBi
ZWNvbWVzIHJlZHVuZGFudOKAlGJ1dCANCmltcG9zaW5nIGEgc2luZ2xl4oCRaW5zdGFuY2UgbGlt
aXRhdGlvbiBvbiBhIGdlbmVyaWMgcHJvdG9jb2wgZG9lc27igJl0IHNlZW0gYXBwcm9wcmlhdGUu
DQoNClJlZ2FyZGluZyB0eXBlLCBpdOKAmXMgbmVlZGVkLCBlc3BlY2lhbGx5IGZvciB0aGUgaW4g
cGFja2V0cy4gVGhlcmUgYXJlIHR3byBkaXN0aW5jdCBraW5kcyBvZiBpbmNvbWluZyANCnBhY2tl
dHM6IG5vdGlmaWNhdGlvbuKAkWluIGFuZCByZXBseeKAkWluLiBCZWNhdXNlIG9mIHRoYXQgZGlm
ZmVyZW5jZXMsIENvbWJpbmluZyBjbWQgYW5kIHR5cGUgd291bGQgDQpibHVyIHRoYXQgZGlzdGlu
Y3Rpb24gYW5kIGNvbXBsaWNhdGUgdGhlIGltcGxlbWVudGF0aW9uLg0KDQpUaGFua3MsDQpTaGVu
d2VpDQoNCj4gc3RydWN0IGdwaW9fcnBtc2dfcGFja2V0IHsNCj4gICAgICAgICB1OCBjbWQ7DQo+
ICAgICAgICAgdTggcGluOw0KPiAgICAgICAgIHVuaW9uIHsNCj4gICAgICAgICAgICAgICAgIHU4
IGV2ZW50Ow0KPiAgICAgICAgICAgICAgICAgdTggcmV0Y29kZTsNCj4gICAgICAgICAgICAgICAg
IHU4IHZhbHVlOw0KPiAgICAgICAgIH0gb3V0Ow0KPiAgICAgICAgIHVuaW9uIHsNCj4gICAgICAg
ICAgICAgICAgIHU4IHdha2V1cDsNCj4gICAgICAgICAgICAgICAgIHU4IHZhbHVlOw0KPiAgICAg
ICAgIH0gaW47DQo+IH0NCj4gDQo+IDQgYnl0ZXMsIGEgbmljZSBzaXplLg0KPiANCj4gI2RlZmlu
ZSBHUElPX1JQTVNHX0NNRF9ESVJfSU5QVVQgICAgICAgIDENCj4gI2RlZmluZSBHUElPX1JQTVNH
X0NNRF9ESVJfT1VUUFVUICAgICAgIDINCj4gI2RlZmluZSBHUElPX1JQTVNHX0NNRF9HRVRfRElS
ICAgICAgICAgIDMNCj4gI2RlZmluZSBHUElPX1JQTVNHX0NNRF9HRVQgICAgICAgICAgICAgIDQN
Cj4gI2RlZmluZSBHUElPX1JQTVNHX0NNRF9TRVQgICAgICAgICAgICAgIDUNCj4gDQo+IFRoZXNl
IG1hcCBvbnRvIHRoZSBncGlvX2NoaXAgb3BzLiBBbmQgaSBsZWF2ZSBzcGFjZSBmb3IgdGhlIF9t
dWx0aXBsZSBvcHMgaWYgdGhleQ0KPiBhcmUgbmVlZGVkIGluIHRoZSBmdXR1cmUuDQo+IA0KPiAj
ZGVmaW5lIEdQSU9fUFJNU0dfQ01EX0lOVFJfQ09ORklHICAgICAgMzINCj4gI2RlZmluZSBHUElP
X1BSTVNHX0NNRF9JTlRSX0VWRU5UICAgICAgIDMzDQo+IA0KPiBBbmQgdGhlbiBpbnRlcnJ1cHQg
aGFuZGxpbmcuIFRoZXNlIGFyZSBsZXNzIG9idmlvdXMsIHN0cnVjdCBpcnFfY2hpcCBoYXMgYSBs
b3QgbW9yZQ0KPiBvcHMsIHNvIGknbSBub3QgdmVyeSBjb25maWRlbnQgdGhpcyBpcyBzdWZmaWNp
ZW50Lg0KPiANCj4gICAgICAgICBBbmRyZXcNCg==

