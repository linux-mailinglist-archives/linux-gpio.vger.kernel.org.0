Return-Path: <linux-gpio+bounces-17926-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EA3A6E79B
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 01:35:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55D7E18956F6
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 00:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FBDC7F7FC;
	Tue, 25 Mar 2025 00:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cliV89z5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011006.outbound.protection.outlook.com [52.101.65.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7ED28F4;
	Tue, 25 Mar 2025 00:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742862944; cv=fail; b=E4CFOJ4XcAkXJVtKZIT+pmP+9F7HPekDZ4L/kEMVvwEe1z42+MGAquXMKp1hzi6ZtQR48AAjy1Kiwc7xZyND3FQcXCvY0mGcBoun4TKOv6kZJraxwAYdc+CY9majbnCOSrfaIE5Pw5DSZ2kU6Vg+n5tFNmdxW9/NgzzFG6+Z22w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742862944; c=relaxed/simple;
	bh=UGoVr3ik7YmPMPDsaRsLpfB/scwYPgLG4kn6vVbxX5A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CmL7c4wo0Rzp2mRK371XXkpmkeLSHXdddYlqJf6LsFUN9eLaPtwL0IXHeTBO7C/onMifP1I06rVAQfLvy4bm+VpJnKbrdAR6tswac6rXDD3Gy3p24XJar3RR18CPnng5LZYTY8pIcJyVrib/IKdgSY1FsKGNIAr/BZXAVIDiWZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cliV89z5; arc=fail smtp.client-ip=52.101.65.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FDcwlb8H/V37TCMiz92kts5y7FkD5qtCjOUCtfR7qZYs7cD+rHZEuj+OjOfxw7W4DeNQ4MJMjlDkggatzdLFlzQebf4cdoW31GAhSI0E2SQm9X5Gfgh6XgKnC9VqYdKaE3GzwdHN/vmX0f8JqkNWicXgQvGWZnpdWYKSbUw8VX0d5kQrnSrmTVVwrsPPOsUUuxRXWjurqws5TTlPSbVrzXVz7SqnFdurDm0pr4NYf+4mVYF/U5IQWWftJr7bX5zhY1JQsuGl6lSH+hmnRIUrAtx6BUtnkjDImro0O24Xzd4RseQupv5EjSFps4ZlK4lS56DkwqXT51s5cN922KuLtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGoVr3ik7YmPMPDsaRsLpfB/scwYPgLG4kn6vVbxX5A=;
 b=nYwX+cveX2+RhrjXdLifewRWqAqMVGQXfGsRdxFPNruCWNbyk8sqmtlljWDnarSaf5x13dRCruUditH8uGASMwvfgbfLCEWNP5l7Ek9cIZYLV2JidyFHw33n+EY19cJTZhw5LoRguqzBb3UDN/TPnXECGQHm4z0c34jWRexXxcFOopgP2F3nvI4m2jCy8qmKh982s7Ag9U0MGbf6Jn6J5doiQkv1gnw2of5fPqrJ1bblDHB5Ie7rASCf1iPzCMqpHHU8yZ2g1nwMNsa0c7L/7e9u2rsxv86cQAarnwy4W/1waGn/f7F/dgoSHTg+NrYCNRInuTjQH2qPCLdX3ERzvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGoVr3ik7YmPMPDsaRsLpfB/scwYPgLG4kn6vVbxX5A=;
 b=cliV89z5gUerW4PgFkwlUvqiSeo0P45F3OTt+gQYpFTlNX18TRxpY9W5jQaYnEqKSd3H5imrO6LLK36t4mdzkc+IqGz4uZtxg8y1VHt4xYGiHgjxeMt7dv9Y3GpUwYihMZtZ65yR0lDN6kHlby9IhWtAVLdJr11h4tFpR2gPzvm/CnL84XOFDKZkhYwTaxZXUrz0rhEbj3hJNEL+NnTwHrbypeVin8yi5on8GsrOyLV1zcZlqAwnIvY4txt2LmhSZcCIwHpu7frzZeF2DymgQxPG7NQXdf2r6leoa4JKxCIYPjRR/CxaPgVbT5nGr8bjkGxeUY9/L4PTcVDt55y0VQ==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB10698.eurprd04.prod.outlook.com (2603:10a6:102:492::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 00:35:38 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 00:35:38 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Steev Klimaszewski <steev@kali.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Linus
 Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Johan Hovold
	<johan@kernel.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>
Subject: RE: [PATCH v2 2/3] ASoC: codec: wcd938x: Convert to GPIO descriptors
Thread-Topic: [PATCH v2 2/3] ASoC: codec: wcd938x: Convert to GPIO descriptors
Thread-Index: AQHbnLM+najNIffuE0KhHBiuIgiisLOCbEqAgACVj2A=
Date: Tue, 25 Mar 2025 00:35:38 +0000
Message-ID:
 <PAXPR04MB84598509B6FEC940C88CBBF788A72@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250324-wcd-gpiod-v2-0-773f67ce3b56@nxp.com>
 <20250324-wcd-gpiod-v2-2-773f67ce3b56@nxp.com>
 <CAKXuJqiwWzC9Zhnnujq+EugJw75EqYL=AmDUUMs8LHOnbBNsyw@mail.gmail.com>
In-Reply-To:
 <CAKXuJqiwWzC9Zhnnujq+EugJw75EqYL=AmDUUMs8LHOnbBNsyw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|PA1PR04MB10698:EE_
x-ms-office365-filtering-correlation-id: cf1352f5-1a71-4154-a908-08dd6b34f72f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bFpBRytNZHExS2dxZ1Zxb3FnYzRHbWx6SWtybmxxTk45LysrWE8ydis4Yy9F?=
 =?utf-8?B?TGdYcHZtQi9HTEpHdU9NQmtBU3ZZK0tMcXZVeStscVpTYjFZeEY2MHdFcXI0?=
 =?utf-8?B?UE5oMjlYOE0ySXpJQWJjbXZpcCs3bmhOQTNRNHFSZStxMXlPZmxvZ0VxSTQ3?=
 =?utf-8?B?S3RwYlpNQUEzRGgxK0VlUTQ0aDlOSUtabzFTUFZSL3J4aEZaa1d1VlVwRHEz?=
 =?utf-8?B?eTFrRVB5K3E4YXRsMWxWeHAvRXc2VURINm9CUHVpMzhXblhqcnhIbnlOT1Ez?=
 =?utf-8?B?dnozOXJOaTh4MTRyaWZ4ZlNSeWRvOEJuRElNMVFkUGZHZ2FyYlkvaTRqWk01?=
 =?utf-8?B?ZjJqTEdZN2Rrc2xFb0NHbjYxVXhhd2JpMW4xaHJNTUYxR2pLd2dlQmV5TDdm?=
 =?utf-8?B?a21Xd0gwaitwU2FHMmtpK2xqY1hTVTJ4ZGo3VFR5amtoUGpyanlmWlE3TmFB?=
 =?utf-8?B?QkMyQzdkWGd0NlEyT2hpN0xZQURIYnpOK2lVYUcvQzFjUnNldXNmZDNWRXhl?=
 =?utf-8?B?Qlp6WWRUY1BRRDc0eDVVekpqaVNDZVgzeUtzaFlMbi9raVdCN0ovZmVBNnlE?=
 =?utf-8?B?OHZtdkhEUnBhb2M4aEs5S01XUEdtUFN5UnZUVS9EYVp5V3djNFJ3d09tS0d6?=
 =?utf-8?B?Z29YZG1iL1VpbC9kWGlsY1RQZi9pdFZPY1BpUUdMc2NsR1VvMW4zbDN0aFln?=
 =?utf-8?B?VGlxc2JFNXNjQm1WbjV2d2RkTmpEc1kzUU1uL01YNnF6RFYwWVRQYzVNRUln?=
 =?utf-8?B?Z3FZNXYzRG9vUi9CQWoxdFJVazhFa0Ftcks5Q2o3cVNKTHo1U0I5OWU0Zk51?=
 =?utf-8?B?V2pMSjRZdStqeWNaeUJjSCs2MzhPd3FWYTB5Z0NETG5PT29BVTJuVEtjYWhU?=
 =?utf-8?B?Q3EzS2RUbm5tZ1ZuVmNDenVxQjZzN000QWlNRVVWMkpEbDRhNENpQWE5V05L?=
 =?utf-8?B?UmFuS3hnUGRWVzRDSEJ6dHErcE4zaE8yODNYNjlna3E5T3oyU3VTK0pXUDZM?=
 =?utf-8?B?b3gxSE9qSEQ0VDEybWxGSVJJT1dpNmZjM2ZobVVROXErdmJ6ZHp6V0g4Um81?=
 =?utf-8?B?eXZzdnZGb0xFMG14TWZBd3FpUnVDZ1hhVDNtQm9TUUVLYTFQU1p1cFpJci9t?=
 =?utf-8?B?dlNTVVJDeXA0VktFcFlNMitNQzFGVTdzaWs0aW4yQUpSdDJRZ2NlbEliTWlU?=
 =?utf-8?B?YUJLcWc2MXhSS3o2YVV5U0hRY3FQekFnS3JKdmpneEg4TDNkR2xUQmE0ak0z?=
 =?utf-8?B?ZTFmWCs5RitmVVcrTmFwQUVXZWwyNnM5RUgxRENDWHRnMW1xTHRCSnBXbis2?=
 =?utf-8?B?dWh0WFhVZTl0ditVM2hKWko3NmNrYTFaa2NXRGlCb1RMRUNCdm92Z3h4aFJx?=
 =?utf-8?B?QlhIUlRSbzFheTMxczM0WmNpOEp2Y0FDSS9qQndaaUJxeHE2VUZ3TE1ueU9o?=
 =?utf-8?B?L0ZtNUtycHVDMnBuYmFLSVdoTERRSHZHditBQmxJRkdnTm90K1pVNG1DeEVE?=
 =?utf-8?B?eE10OTBjMFRCakY1blRHTFhzUHRqM1hUNUljZi9nQUZvT0pwRjc1dG5IUWw0?=
 =?utf-8?B?UzJNME9HNG9GTmRndER3djhmQmJKUitqR3dRRWRCMFVCdlkxTGVTU2xwOTNW?=
 =?utf-8?B?WC9Ba3BBeXdJNnk3NU5tSVFNK3d0bERJNEQ3djNPTDFCRTlLSkRpeUpjK2dw?=
 =?utf-8?B?djVJeHJ2TnhleXorU2VDR3hKRWF2dlUzS0swUDhEaWdqRHNGd0pMSDQzUThE?=
 =?utf-8?B?K0cwRHpwZjVBRWU4bVBFakFRZ2VnbFp0b1FTT0IyaDNhZFFRcXZabzZ2MVl1?=
 =?utf-8?B?a1d3RlBScEpKMytPWWljVld6YU0yNVdoeXROQVltSUFtNUpNMXlVcUlEbWFM?=
 =?utf-8?B?MjQ1VW5QV0tUYmlpVEZXSkNGcS9oSHhub1Q1TGc0NlZiTlh2QkUwekZNRVVt?=
 =?utf-8?Q?D/AQK2/XHwaOF2WaRJeIF/bbIeVZ0gFf?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UmVybHQyQ01kQmZFdmVZMXN2WmJlbkd1QnNka09Cc1UydzhZNkJIZ0F3WldS?=
 =?utf-8?B?M0gxdldUdHB5dko5SWpUUEFTTjBCUThLRkVhVk5OSTFDNy9MT0hFL29sZ3Vm?=
 =?utf-8?B?dFN3V1BjU01XSXJwQnV1MnV1K2cwbGN0QkZHbkFPbEUzQ0IzK1RSY25ZNlda?=
 =?utf-8?B?UjhteHZxcVpTdWNFQWRHSlhYaXpqS2F2ODM0WU95a1JHeHNkYjg2bDVPUm5E?=
 =?utf-8?B?RmlPUXFHT205bjN1dExlRXpqWlBCTzc4Tk9ITUd3UmRKZ2dCc2t3RUJwdGNY?=
 =?utf-8?B?KzgxUE1oWUltVDVONy9sMzJFcEc0dEtBOEFJdWdSNjFsem9FYkFadWV0SFVr?=
 =?utf-8?B?UWY5NnZMK0dsVUNuYU9PZDhoVGJnUS9Qc1RXTFdPN0hEcm50RHBjcTU0RTh1?=
 =?utf-8?B?dktiQ09YcU1NNGNEN2l1YVVQckxuTjlDRWV4cS9rc1Bsc005QTdMSW1mNE9n?=
 =?utf-8?B?WXBoaCs2Tjh0RUdLOFNSMTl4T29SVlJFdWJIZGFaRkh1ZlJWVVJ1V3IyNlFk?=
 =?utf-8?B?RHpsYzRSK3ZMU2VIa2FCSTlHb3RnNFBzcTNzRys3N0hrQUwyd25TdWNQU3I4?=
 =?utf-8?B?Znc4d0t0cjRmNFdLMUxxbXhFLzl6L0JzanNrQUJ6SHpmNTJVZGRYNk1LTGVo?=
 =?utf-8?B?TlBVcitBbjB1bkZnL0w2THFEQjErMFR0UmNzYWljWWJTamdhY1NyYnZYZEo1?=
 =?utf-8?B?M01tdDZRR2dwa3k0cW42UmJWemV5MFI0L0VvbEhXUjgzWnM0TWpUSzlRTU5l?=
 =?utf-8?B?MzBSNnc2VWNiUnRtb2xqSFBuQWxrM2RiUytPQkFlcVNvR2gvTk4vTG50Y0k1?=
 =?utf-8?B?Mjh0NnM0bWdqYUtHVjAyYW5QbGdlaEtEVVVlaW8rNExJSVZUa3ZWcUZTb0hH?=
 =?utf-8?B?RXozRTQzVnA2R3NyOE05endOYkZMMEZ4eXJ6M0phMzFnanhOSVlqWTNTOFln?=
 =?utf-8?B?YXNRNitQbDVRd0lwSWkxT3Z3amtuRDl3M1ZMNVdlTyswRlAzNXlRR0tSTG1E?=
 =?utf-8?B?OC80bWlYSTJFb0VPZ1JIVGlmaTB4ai9lbVp3cHNCUkZmdldmQjRjZnJ3Tkor?=
 =?utf-8?B?aDJtU1lmMFNVbUFxTFVlT2tGNWFXbkN5RUtYWW1MT1pGTFlZcDJ4bjBLSnN0?=
 =?utf-8?B?Wmt6bGJUb2RWblZQaGZGSXBNMms0UHBYS0ZwZFdBKzRtT2YrY2MvVTVEc2ZM?=
 =?utf-8?B?RTNXQlJld1h5VlJ2eGxpbzlKajdIbHVqakZUbzE1dXJmQVRkcVNsazlxL3Nu?=
 =?utf-8?B?WlRxZ3NmUGRBcWdxQ2RIM1E0VEd6dlZ5T2VEZURKMnNuTndFWjY0L1BxZWNU?=
 =?utf-8?B?Q3d4ckJEVXlQKzh6S3o5SUFGWnZJaUh6MlZmQXQzUG5PYlNhb2VsZmU2QlZM?=
 =?utf-8?B?b3pCTU9xZHdycXFFUWYwaENycnBLT2ovaHNGL2FIT2tzYWEyNkg1cGw0bzBa?=
 =?utf-8?B?MjFvVHVXZWNxcEtOS0p3Q3NZVUhCTkt2WkFhdTJFSmF6WXUzUVdwcW1WV0Nq?=
 =?utf-8?B?RDVwMjA2dy94OWp1WjVDNXF6ZE9WZldzdjIyeDg0dU9CaDZvWFJTdmN1Q1hj?=
 =?utf-8?B?cFNRVlNvMTRtWnhkWkx6OThHd2kyQWFDWEo5U1RBd2VWeWQzekpHYW1Zd245?=
 =?utf-8?B?N1l3K0g4aGVsWks3NjB1L3kycjhBUHpFUm1DTUxQWVJiZC92RUtSMjZiUjVy?=
 =?utf-8?B?YTBLTjJzbTVJb0ExKzFuVG4wTjh2V1hEQjgzakRvUWlKUDBUbmtnVFQyRlhi?=
 =?utf-8?B?QTI4ZE50VVp1V0d1U2p2MzdyUVJUVXY2bHRGVzBYOGpCcGVZYktwYkdYZ0Zj?=
 =?utf-8?B?NndMMklpRWVTM29HU0hnVlJtOW9nUGcxN0k3RWorcnFGWVdGd25BUkUzZzlW?=
 =?utf-8?B?R2wrVUZwWFR2NXJEcmxnd01qOVJWaXR0c2IzZ2FDa0thUW01SHRoYmdEaFhu?=
 =?utf-8?B?cGg0YnJZMk5WL2pBMGdFSlh2Si9UV2dyVmJUMENNL3VSby9XV3JwNHlKZm1j?=
 =?utf-8?B?K0o3eHIrOGsxRHFKbEYwOTdDNnhjTHByUnY0OWcrVVBPWnlPd0Q1Uk82NFlD?=
 =?utf-8?B?T3IrNC9ZVzFjODFCeEhJUXphRFJXZksyeFVud2p0aFo3UTFQSVZjb3JQVUZq?=
 =?utf-8?Q?PnTg=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf1352f5-1a71-4154-a908-08dd6b34f72f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 00:35:38.5487
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yofaHEaYIXiwGPdB4SkQ6xYuH1iQn82p2MphYP0BMbyZsPNk+3WOjUsH6ZjB2IX7YIC+l/8u5hJMzFnZQmOvgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10698

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDIvM10gQVNvQzogY29kZWM6IHdjZDkzOHg6IENvbnZl
cnQgdG8gR1BJTw0KPiBkZXNjcmlwdG9ycw0KPiANCg0KLi4uDQo+ID4NCj4gSSBjYW4gdmVyaWZ5
IHRoYXQgd2l0aCB2MiBhcHBsaWVkLCBJIGRvIHN0aWxsIGhhdmUgd29ya2luZyBhdWRpbyBvbiB0
aGUNCj4gVGhpbmtwYWQgWDEzcy4gIEFwb2xvZ2llcyBmb3Igbm90IHJlcGx5aW5nIGVhcmxpZXIs
IGl0IHdhcyB1bmZvcnR1bmF0ZWx5DQo+IG15IG5pZ2h0IHRpbWUuICBGb3IgdGhlIHJlY29yZCB0
aG91Z2gsIEkgZG8gbm90IHVzZSB0aGUgZmlybXdhcmUgZHRiDQo+IGZpbGVzLCBidXQgZXhwbGlj
aXRseSBsaXN0IHRoZSBrZXJuZWwgdGhhdCBJIGFtIHVzaW5nIGFuZC9vciB0ZXN0aW5nIHRvIGJl
DQo+IHVzZWQgb24gZWFjaCBib290Lg0KPiANCj4gVGVzdGVkLWJ5OiBTdGVldiBLbGltYXN6ZXdz
a2kgPHN0ZWV2QGthbGkub3JnPg0KDQpBcHByZWNpYXRlIGZvciBoZWxwaW5nIHRlc3QuDQoNClRo
YW5rcywNClBlbmcuDQoNCj4gDQo+IFRoYW5rcyENCj4gLS0gc3RlZXYNCg==

