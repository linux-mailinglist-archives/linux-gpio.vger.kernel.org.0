Return-Path: <linux-gpio+bounces-32137-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPNXDuPLnWnfSAQAu9opvQ
	(envelope-from <linux-gpio+bounces-32137-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 17:03:47 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E223189831
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 17:03:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD78B301AA5A
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 16:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE51D3A641C;
	Tue, 24 Feb 2026 16:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IERKXADx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010029.outbound.protection.outlook.com [52.101.69.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A40F267B89;
	Tue, 24 Feb 2026 16:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771948896; cv=fail; b=NUd7bzJRF61FEKO0L8ryxmRhOZViE+DswdAtX1l7MGM+puv+rnVG4yB75RB33OR29jTF+oRSYLhBaxhp654M+kk9MR7XKgppiGrL97K0laUGkGrJs7+hibToQdQugVNofhWEpsydU4422GsvD7UhzwpNRN3BmPjdv1VP0zSTrhg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771948896; c=relaxed/simple;
	bh=AURc0aYfjmb5RA5HVstcLusOBIvRceibwVo3DikqBR4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MREAJyIgcrAzWVZcYb+4NkFU906eDIg0cF/JjJcGYjIFJyjgzUT0qRmjXk787nsWGhTRgxiaRLtGTpDy1Kutk6xN6EKwqr6IvoY0EceYgQLppW3gJe2zwW3YkrAp7HNhAlrIRpjPUJ58JMyE5J14++MYaK6KztpujvDbdmf/CUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IERKXADx; arc=fail smtp.client-ip=52.101.69.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bfjoCngNICBwhNU82W1vtoEM7U0K5ZtvRTWtk57KjpGi6J7fNjuG+m/5JcS3h+KqMY5+m85+dgWvjbQ9E5ssvEca40MJFxvmp+iH85cRiDNjv5/s36s0HB7PbQt/Jou9I904qMf69lQuQotRq7b8qHzR12tIiYb56+YYIm2IvA1L5Ry0nQayg7IUTPlkhbdM3NLzazBHR5sNDGcnFWqkgXvvMmErY0ALFYQRLd5x0IQRVDJXOaFCmTkWc0WYCdNOWgitv5EknIHOk663PiLC4fprIsgMg934G6n43q9WlY29fFJVE/tyQeDEMj0AI4ye3mYr7gZFeEAZ/8+WNH7PxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zLEipTZ7HDNZcCz6Q4CvQ3RLEPvBZOcmigvQMYeeS74=;
 b=Vr5poakiwhJF4jWLEIuOIRoDCV4U1rNVMJQ7I6SS55mu5MTaiDaC3kl3Smd64hOEt0yF7xnfXyAHrC5tcQyY3Q0qrfrhP/sMo8BiX2VQkfEdYpeTNVnB6y+xI7DD9aAnzBWoVxvTyxPemD+C7It3U3S404TYuF2/TjsAPquVm/hrN3eCF7DrlPmOHMH2V4RnczKcna6bosOCJHU2bhWqgkvRqXL2ZCB/m4QgWZgxDnZxK3UqM4abZU4TKicZLaKGDjKbib8X23iotZ3qn2wp6hdOKeHL/0oHaAaLookJkcyNcMMx5VC0qojBa+m1WjGu8yk4lMbQssmojPC+yXC5fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLEipTZ7HDNZcCz6Q4CvQ3RLEPvBZOcmigvQMYeeS74=;
 b=IERKXADxDg5PTNWtdSQBH+mNyWNezhKjA9bT8qi9HpTWw2r++uwhZADIUA7n/n65J/6RJyPEzslzYobQROWv2qsR6glbpLdtYcMEX3hhuIkdDM7dFbNMsD/voJDiJp97kLczpQYgclLnA6hm3G3RQ12AbGuNO22Sl0wvYi5miGWk7HY2l6f/Jushc07Up7I6mkkJGiXrsEaOI9Edf2XVJo+B/lGv7gfjeimJyDnd3f3snGDUwdDf9yYKbGmJWlX+rCa50I4L2HdFWzUvLNVXOJ/NuPpoUVpmve+nPNoS+b5cV8xf1MhNQuUCs+XJjwuDh7mLQAXeQt8gQixieizSyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by GVXPR04MB12090.eurprd04.prod.outlook.com (2603:10a6:150:2be::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 16:01:28 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 16:01:28 +0000
Message-ID: <c024e8d2-858f-4a88-ae38-17b8c5e830e9@oss.nxp.com>
Date: Tue, 24 Feb 2026 18:04:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Linus Walleij <linusw@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Frank Li <frank.li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan
 <skhan@linuxfoundation.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
References: <20260212213656.662437-4-shenwei.wang@nxp.com>
 <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
 <13f9d767-61d6-4e29-b36e-6dcc860ccb11@lunn.ch>
 <fd257c80-d97f-45b0-a12f-3a1888ba81db@foss.st.com>
 <396819f2-dd00-4c09-8bc7-c035a5282a56@lunn.ch>
 <PAXPR04MB9185A908F5090F0CA4FF05F78968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <b21b9ee5-d84e-47f8-86b5-c111ecc3d43d@lunn.ch>
 <PAXPR04MB918576D67A268E59242964A08968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CAD++jLkUVFckLTq=SoivNFoFymhJo4KM=qGmajFcv9T9+7tPmg@mail.gmail.com>
 <b4c422ce-3538-40aa-8bfa-b70f02774b5d@foss.st.com>
 <nbzdtngifwrx2kyu4tsiwwua5v4i5cjtaotemq5hubaets3bcn@fk25twf5rv6x>
 <PAXPR04MB9185588C1DB71B1FEFA1DEE38974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <PAXPR04MB9185588C1DB71B1FEFA1DEE38974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P189CA0057.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::6) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|GVXPR04MB12090:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f473b6a-5bde-4d08-418c-08de73bdf851
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y3pVZ2pGY2lkWWRnSGZEdW5maithNWlzRmp4SUEwUTFKQnVWMUFPb2xsVXZo?=
 =?utf-8?B?ZlRDYWp2VkxpNjlSdW5ScENuVVB1UGtrL0Z2Mk55bTBXb3ZCOWRzWFN5VSth?=
 =?utf-8?B?bmlSdVVEREo4UmJBeFBVS3ZNR1BwVzVhZHYySi9tbmZzLyt0bVMrQVhSdmE5?=
 =?utf-8?B?L3cvVkErWFBISHpmQjF2V2RLVUNiMklzLzZ5VDRtQnppRU1ydW1XdDhDMGF1?=
 =?utf-8?B?dGY3LzgrS1ZjTEg3S0tMVTErZmxlRFBhVnFlSmhyaWhVM0IzSVYrSCt0bnIv?=
 =?utf-8?B?WHgwTzcyMHJFZFYvMmNJNktxaWdtNjhrR3VvL0h5RlFZSjhpUCtybHVXQS9w?=
 =?utf-8?B?N25BVDhIQUhVSXNHb1Iyc1NLWFFBczEybDNvSkxxOXdpQnBIYitQZUdNQXQ2?=
 =?utf-8?B?b0RUMnQxbmVuNEJYZGlON3kwWisvT284Q2FYRUJYM1dGc3FhdkpiRnB5QWw0?=
 =?utf-8?B?dnVWQ3crSXdHWjNtSUtFYkFEeXFyTHpMR2ZudnBmWlVyeERXamlJZTJheElE?=
 =?utf-8?B?TEozSFdVWDRXYUsvSWFpZGhhVzdNb2k5SjlPa3Z1Mk9mc1lkN3RaUHhyaUpB?=
 =?utf-8?B?SEYyU1F5MTg4MGRuUUxMdzBSMm1JVVFncmJlZ2RNWEVLc3JQOWZZQ2pGVkRr?=
 =?utf-8?B?ZEdwZXhFdUx6Qm5NdTNEV3kwazFPSXd5VzFBQzZYVUxVNi9QMFBkWVpLN1lh?=
 =?utf-8?B?bm5ENlBCN1J2VUlONU9KOVBPWUNSZjhIc2pnbUV4QzIwVU1CSDRDWC9CbGph?=
 =?utf-8?B?aTdJNDkrUG8xcUIvZDY2cHhCZGdDOElCZWNoTHlGY2RPZFpGZmRQTDgycTdu?=
 =?utf-8?B?eXpQVXhHeFBiSTNabWxGL1FzaUxSUUliek0vc2tTU2dxb0l2WU80K1dFN1Z0?=
 =?utf-8?B?QnJpODJKRDkrTTRCYlMzUEgxYzV2YkdXVW1XQ2V0TVZrUzJxTVAzZHdPK3Vw?=
 =?utf-8?B?UHNnY2R4eWFnZk0zSHJyMHFKZTg5VXJEVk9iWTVsdjRwZDdpbzkrVmpJU3hy?=
 =?utf-8?B?NkcrcWRoaGxzcjl5cUJleHFRQlYxQWw5aHdCRmRDcGhJRkV5L1NiWTF6b3Rw?=
 =?utf-8?B?TlBSVUZBdVA1aE9SaktVeUhSc2gzN0hvV2R0M1dGTnR0enJKVmxJQk9RWDVD?=
 =?utf-8?B?ZHJXZUlpZi9IZ1EzamY1cFh3cUhJQzhiVWpvN29RbjZLQjNsZDFldExGaXhX?=
 =?utf-8?B?dXY5TnUwS0lvQisxU1lQMmZyR2Zic1V2eVZuQkFLcEs5MDRVdGZRaXhteFZY?=
 =?utf-8?B?UXJtWms1WXQyUjEzT0EwWVVacEFYaU03blY0cWJ0R2pPQ056UTBlNHh5dktw?=
 =?utf-8?B?bXpHU0dheUM5SWE3UGZKbGdTeEZkRTNpTU02b1JXVUlpNFlXVzdTQXdxTnlO?=
 =?utf-8?B?RFBCUkVhZitjb2NmanRGcXJnVjNaTnY3STZ6bGRHL2I3VFFZeitxSkxBN0Jh?=
 =?utf-8?B?cDdrQS9QV0NhRnhCcXF4N2tra0pXR0o3ZTFYWWNWckVOVWxRK2JYZWVuODJq?=
 =?utf-8?B?ZktiVU5zb2tQWjdnWDAzR0ZCLzRIUTZxREJld1h3MVB3MEs5dUdyLzJaa2V4?=
 =?utf-8?B?dG90MHhMZGloWExOZGdrWmwvdUROSUFYMldoSEhyd2hEa1ozT0NxaEZ3dWEv?=
 =?utf-8?B?aVRYR3ZzL1lSeGpocDEyUld0QlVaM0dlMFNYMTlGM05lSDJZR28zVzRobUNS?=
 =?utf-8?B?KzZhUEJOb2Y2TC83QVNrcXJjbk5hRXhJK2MxcUJpWXRVWFRIaWkzdEpXaFpF?=
 =?utf-8?B?eHFERG9GRHVDdkkvcUx1Vy9OUWtOQ25TeHJNWDlJQktVRFFReFFoYTV6VU03?=
 =?utf-8?B?S0R4OGUxQWtmUCtyMXFjdStwQ1Aycis5TXhhZWpUNGtPanhZSStOQUdHcksy?=
 =?utf-8?B?bGpvMzdSZWJYZTI4Y1dVbENGODVNS1pOcStTQ2twYUxGQUlaRC9FQ0xzdDFp?=
 =?utf-8?B?MXduQ2dNZi83ckIxN1ZJSk16dHc3YkhkUTBuc2V2WUQ2bStZc09OZytyNjU4?=
 =?utf-8?B?cHp6TVJqVzNiUVd4SldSMFl5djdKQ1BqTzJoWVdpUEVvMUlLOWpaMHhqbyt2?=
 =?utf-8?B?ejFZVWIwbTBDWnNGZ3ZTQmJ3V2NndzJmMmZyVWJTQnduMklZdVlkRGlBUFg1?=
 =?utf-8?Q?Eg2o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGYwVG9rUGpQaEQrWXdjYmoyVlRxQjV5N0wxQkVzc21KRld1ZXU1RUNDbFdi?=
 =?utf-8?B?Wmc3R3RFVkViVG1sK0FVT2FjYVduUDQ1YzB0YWIxeGlyUzlUbyt5TVRkdDhO?=
 =?utf-8?B?Q2NkdURyRjM2Y2FGbTk1ZHovNVJKU09Sc1lQYnhuanZHQUMyYXJaa0J4eDd5?=
 =?utf-8?B?Mk5rVUI3MUJ2U29iQk9CcFZiM2ZjUDQxdzRHU1RSMGdFS05RTXpDeXNBSnRH?=
 =?utf-8?B?cXlUaHQ1clZxZTNqd2VEY3kvZStNZ2RJc2JlRFZOS2JOdllBajJxQ2VCMHBa?=
 =?utf-8?B?c3BqbUMyUTNOdWFDZzEyRE9TdVp5dVAxYVI1VFkrN2EzNmN5aDd2SmdOSWcx?=
 =?utf-8?B?b3NZcW1vcG9qeFdFRDNOVllOT3BXbDlmWnhObUR5Rkgyd1cxODdIOTRuQTcr?=
 =?utf-8?B?RFZlVk5nQVFKSUcrZGthYjdVVVVobFhURzZGS2w0L0FJcHVUdURJWjcrbVpk?=
 =?utf-8?B?aUxsRDFoUjJIVk1CRFEvZWNxamZJSXZiRzBMT0dycWNldERSL3c2bFRMekRl?=
 =?utf-8?B?VEdobEJ0RGJ4eEt0dkR0b1F1YTVnTU5UZFJyOFZ0V2VmVXZqOGhqRUdINDJt?=
 =?utf-8?B?Mld1dkZOTW1BUGNrc2JnaTBNbVl1SGJzNEM2bTROUTVsK2VIc1lXcTdDUCtn?=
 =?utf-8?B?ZVhiZG41dG1oWkZHbGZuMnNPNVpWY1U3UFVEZTF6N3Eza2xEZVZ3QzZkNFFo?=
 =?utf-8?B?Qk5pa3k3SFhhc3lhZ25PZHQ1b2d3UDVQUUR3V2p3cnN3dHVlQ1g3eE4reTN6?=
 =?utf-8?B?TFhPZkpIOUljamNmU0tyRFNOTFI3UnBMRnFvNjBWMEJJZHZOd2orY2wrMStp?=
 =?utf-8?B?OUFwQTZtUkJvcUprM1NhS0ZEM1J2VVVGQmZYM0dkekRMSk5Bdi9OdWpzdnRs?=
 =?utf-8?B?b0ZmV04vQlJrSVUyZitRWWNaM0FzcTZFN3VzTFFDV2VpM2NPOFVjZUJ3OVlY?=
 =?utf-8?B?QTFDY0h5N2NOSjlwWTBqbm93eEE1cCtDWjNFTzlHR1lkWGVYbDhFY1kxdXhK?=
 =?utf-8?B?QThXSFZkZGNIV2MrZW9yNTVsZWVGV242YWNDTTY3ZHpVOE5hSjIrVGsvd1g3?=
 =?utf-8?B?MGM3Qy93cjg3OXUvWG5UL0p5Z0pNQ28yYndCQlpFQndSMjFEMk9HeDBBZ3BX?=
 =?utf-8?B?OUI3S1FEV1RBdHBrQkgrWUY1alhHa2NOMkwxOXJRVGVWNGRMT0RENGdiaCtn?=
 =?utf-8?B?eEliZTFING5TNXJTWUJsRkdvR2xpTDljc3FLRGt4SG9hd2NWOEhNOThwcVp3?=
 =?utf-8?B?ZGRCTFA4RXppY3luS3dUSmpYOUJyUHpyZUpJOStHem5oNDVmczdqK2VIaXNO?=
 =?utf-8?B?MVJ0YjU3cUJGZFFRYlFFRHVKYlFuUWIrMnRzZmxNRFY5RTVHUDByNGJmU3pY?=
 =?utf-8?B?Y3BqVU5TRkhJS1Y5UUtzaDlRQjZIR3ZJV2cwdWcxM3RhVXA3Q3pDL0VDYnhr?=
 =?utf-8?B?VWdFRXRKMWljVVQ0Y0pRRTdzWTJKNjM1L0pGZ3pLV2FmWlllLzBNUGNCc2VE?=
 =?utf-8?B?Rnhsa0Q1d0U2cDZSWFBQRm41Ri9QcnUxdERmYXVydmduQTZVRnpObDNvZWtw?=
 =?utf-8?B?U3NKdWViWktIVDUwQ0ZNTTEwN0VOK3pzakNWOFZmQllRVzdnR202eGhwc0JJ?=
 =?utf-8?B?WnRXODVqMVJzWlRIc3dUNmVGZytCT2hQOWR4cTZmZ2dXSS8xWCthcTl4ZzRr?=
 =?utf-8?B?VGQ5RVM3Q0l1SVhGR1d6eGlTU3NtOUhUSXUvYUJISFhlNy9OdG14Y3ZlNi9H?=
 =?utf-8?B?R2xmc3c0dmFyK2NQMGlDT2FYTVQzOVpHSHdZTG9oNjI1Z3ZmZUtCenN6a2Fy?=
 =?utf-8?B?TlpXYXF6SkgvODE5UjNqbUg5bVlxYkdxZzRCK3l3N0NsVGlwSVBNM0hNd3Yw?=
 =?utf-8?B?eDFCR0hJOUdvSVVLZERRd2JBNTExaGtZZG91UVhJY1ZZMlpJVkRCOXMwemht?=
 =?utf-8?B?Z0xJQXpoUTRJTnJwMWhhNGc5Rk5CNkxwZlN6RnlPdTFPVHh0NjR3QmtvTFB2?=
 =?utf-8?B?YmduczRvdXlQaHgwRzI2MkVwZ0dUbHhnT2QxQlZMcVZsRmgwQXJtTGcwMjlk?=
 =?utf-8?B?a0FXR3QzQlBwVk5QT0MwbXlVelNnMFVGSUtKd1J2Z2hpTm9xalU4UjJTdEhZ?=
 =?utf-8?B?TStLcWhFbm9XOWlLUW9WK3VvR3hyV1BnZWVtbEJZYWVuSVQxOWhUdjJXTHYw?=
 =?utf-8?B?b0dQaUM2L0tqU2tPNWF1QW1DQ1J1VXpyeFFQQU1kOUdiZDZ5c05UZXljeXBp?=
 =?utf-8?B?TFVkaktyYWFzZDdMYWRzVU4xdnZBdTlwbnQ3cGFZS2tOV3h3ZlBIN01UVFpw?=
 =?utf-8?B?NCtSV0I2ZTlVV21YRU9FM2Y4ekQyT3JJbTRINlpOTWcvTGNLMUxnQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f473b6a-5bde-4d08-418c-08de73bdf851
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 16:01:28.7715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 77MzVxQHuny/IMGbzIY5sx4QOE/oxSwLIodjj/6GTOKVoW+Qoh6L47GonwxqGKNKROG+JVA5ZmYflZ8BQNHctA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12090
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32137-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_CC(0.00)[kernel.org,lunn.ch,lwn.net,linaro.org,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.baluta@oss.nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,oss.nxp.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8E223189831
X-Rspamd-Action: no action

On 2/24/26 17:56, Shenwei Wang wrote:
> Technically, yes—it's possible to use the virtio mechanism directly without rpmsg.
> It’s a bit like talking straight to the IP layer without involving TCP or UDP: doable, but 
> at a lower‑level approach.
>
> As for the idea of gpio‑virtio, which could be an optional solution that certain customers 
> might prefer. I recall hearing this idea from Mathieu originally, though I’m not sure whether 
> he plans to implement it.

gpio-virtio is already upstream in drivers/gpio/gpio-virtio.c



