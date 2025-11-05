Return-Path: <linux-gpio+bounces-28092-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFFBC3514F
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 11:26:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B8E53A0791
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 10:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA4C30217F;
	Wed,  5 Nov 2025 10:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Zol//b2I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE42302142;
	Wed,  5 Nov 2025 10:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762338402; cv=fail; b=HMBRKwYLmZ48cO7abG2XsgRBUNxtmm2l2VmtG5mZh2eX/HCsNrgSC4igcw2ZmoOW96UacbzLzvYf/TcDYMVhw+d9elrlLA6R70zYBmQbzm/ZqA3hJ3mMSx5jw6OVGkJoWmXKT5NWF6HK14+YBw7IUwm5igbSipbN+s+7op5Rotc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762338402; c=relaxed/simple;
	bh=vvX+sgy76B7nH0Z8may1qyxBx9uSenDFCNNB809NKqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rY1OhvF2tEJNHc0cLOTT3I6PFw2Z/xodukpH8YEa9tKgEikWMYn+laqpFYG8XK8M1VrDlpYjjdv32MNtt3ZI+KUF+IZ3DeLpOUw3Cukq30thA4UX79MhXKnCr5DH1lZabkin+f6kXp0pqxGgEKEI4jpGPS049WqEHnVE/acwNsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Zol//b2I; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5AMwi23057483;
	Wed, 5 Nov 2025 11:26:08 +0100
Received: from gvxpr05cu001.outbound.protection.outlook.com (mail-swedencentralazon11013026.outbound.protection.outlook.com [52.101.83.26])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4a7gca59m4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Nov 2025 11:26:00 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nOSVzk97z/9tEfr/UD3b7ndfasEThiP0ZuM/9YKyYgDShlgDguthmnyvlRybB9lT7wutyW2dAcRUJg9SdAir95CVkjYcMGScTvKmtZsW76JgJHmApFGwSzHq/TzlmkTqHbkf8YMSLPo+q7PUUullHg51q/URTzrx1ZMuWKKjXfd6wg0+PDG7Qd5iBI1TwQ0DMcZI7JYnD0Ia9BdQQdQL29IvdL+kcYyYMDBWMv6SHQsPks0sPETTban9hQNV/yVdS/xVmhMNAxa+i7cmRpA3Ji2BSaXrXSeLNnlR3+50kjp/DfRmx2McPaP61MlQCDsfVT5meiY5yASJQNvrqA5+yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OjzBMsKc2K0EhBL0ouxTA9SQL9SCFvMQWENUUb7kOPQ=;
 b=aiGCxxgkjgB5p2RPlsrSkbjOhJSCzoHXk0IgNXvaAzit88bemxa/WYpJjrFdZoXY83Sv7PdS3Eis3K61dd+R8WfsHAPv5pnQ6FfQw2mbDpqexh+GNUO0Oq1XaIPU09nalGsqk96LScjcDO1gJDguoRTWMbvy4mmA9iJfdE1MeOCZJGJd4GbXVRNQT+ZgPczMUHRvnJoG3s+jGhBAQda52JKJ58lp8v3i6Q1QBbc0JihyHpdstcupvl9fmos7KkZcmWeGmzVBIwlLu5c8Ikd1ooBBvMdlMjbo8W51E8jzctLU80ujx3ODx0EyrwNOMfip5xkH5ZTeoXa2U+8VySQ99g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=nxp.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OjzBMsKc2K0EhBL0ouxTA9SQL9SCFvMQWENUUb7kOPQ=;
 b=Zol//b2IR2y2hWW8NTBJsWdU3POWcKe8bAxUTSrszvx+H8qarCnAUFZeOl6Wpf3z1S7FOrtQ1J0ViK7dq00ok4z8jQ/w73cXyUtbS1IvyG42DSw/3vM+vjzWapKaxGQvDQZyh6EG2hjBJzN76Z7OzKepWNciN3FIICpaOJGdejZ/OVhv2L1XkR64R+XHVgTXEAjzM/pHyZG6Fp/9tAm44uW39MkteiG1gy8r3eOTxfROI1Zwcn6zk/6cWrSurOkRIREFu/S3gXcMcTxcnhbHRs1mSOH3cTwxDjcX820n7cbDdK0wTcm4a/AMBQ/nXRjiJHLVxvwlcETIf8JyJI+0AQ==
Received: from DUZP191CA0065.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::6) by
 VE1PR10MB3807.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:16a::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.16; Wed, 5 Nov 2025 10:25:55 +0000
Received: from DU2PEPF00028CFC.eurprd03.prod.outlook.com
 (2603:10a6:10:4fa:cafe::e1) by DUZP191CA0065.outlook.office365.com
 (2603:10a6:10:4fa::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.8 via Frontend Transport; Wed, 5
 Nov 2025 10:25:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DU2PEPF00028CFC.mail.protection.outlook.com (10.167.242.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Wed, 5 Nov 2025 10:25:54 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 5 Nov
 2025 11:23:35 +0100
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 5 Nov
 2025 11:25:53 +0100
Received: from [10.252.24.142] (10.252.24.142) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 5 Nov
 2025 11:25:52 +0100
Message-ID: <05a0c630-3bd5-4307-8b94-1889ba191c33@foss.st.com>
Date: Wed, 5 Nov 2025 11:25:49 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
To: Peng Fan <peng.fan@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, "Shawn
 Guo" <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "Jonathan
 Corbet" <corbet@lwn.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Bartosz
 Golaszewski" <brgl@bgdev.pl>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam
	<festevam@gmail.com>,
        "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Randy Dunlap
	<rdunlap@infradead.org>, Andrew Lunn <andrew@lunn.ch>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <PAXPR04MB8459C54EAF106184E7A378D888C5A@PAXPR04MB8459.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <PAXPR04MB8459C54EAF106184E7A378D888C5A@PAXPR04MB8459.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFC:EE_|VE1PR10MB3807:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a53414b-05b5-4e37-0b74-08de1c55b3b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|1800799024|376014|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bmc4eXpubC9mTjRBMjh2enFldDM0cU5iblJxT2Ywc3E5eHRYY2Fpck8wN0Ji?=
 =?utf-8?B?eE9VSWVta1JrcnM3TE1JMCtTdzRUM2RrU3pmL3FHTkRKYUtveWdmUFM2MkpR?=
 =?utf-8?B?bU1XZzlkS2dieXdOcFU5M0ZwL2FwOGhKSDI1OTYwWWxxRjVQaFJmdnZ5Mzkx?=
 =?utf-8?B?c2tQVGtKV0xyT2lNcDNqK1JNRDhkWXltZytCOWRlQmxOeFRIa3VZbThlZVVR?=
 =?utf-8?B?dlVFdFplMDRISEE0dGJBRTJaRk90NkU3S3AxcDNrS1F5c2tHNS9QMjdZNFdP?=
 =?utf-8?B?OVV2cnc0ZlZ1d3BKR0RzMVBrQXpmNmpsMUViRmdQenRmcXlGbUd0TVhweGIy?=
 =?utf-8?B?aE5TNDVzcXV6Q1hoeHhJaFR3eE1KZzFjTlF6ZFl0dHBKWE5MZnZhem1MUHVS?=
 =?utf-8?B?SHJJQmo2bEZXTnZUQmY3eVIxREVnbFpZVmZBK1haNGdzRFpKREZZRGxXSEtE?=
 =?utf-8?B?UGI3dUg2dVpnNERreEFMOFQzKzY2Lys0azVkeHlrKzdPMmY5eFhXWjNLYXNi?=
 =?utf-8?B?WTd4QWw1cGNVa3BycEYvWFFzRjgyQ3hwaDhlR3hKVkk4MTJSeTFkSWdZNWVH?=
 =?utf-8?B?SGo3TmV6dFIyQXRBTGI1cCsxYm1mTy9IeXVKb0hjSjdadU9zYjBBQ3V1OGJS?=
 =?utf-8?B?a0doYXByT1FMeFY5eVlaT3dBZmptb0lla1JsVUROMFkzeXRWNmZsSFVoWW1q?=
 =?utf-8?B?MTc0cnkxOE42S1dkZVY2SUNMN3RvSERiZE9iV3pEMDhmNlNaTzhOL29ENkdF?=
 =?utf-8?B?a1NHS0pyY2tFeVNuL0VjMFdmNHQvWWlhYmcvTjhHemtNWXU1aEtSUmtxc3BC?=
 =?utf-8?B?U3JrMFhXcFdwNnVndjhmV01BRHltNis4dGxhUm9zbG92WWtVcHZTejk4NWs5?=
 =?utf-8?B?ajdGUFBHNHVFK1o5NXBuS0ZNWS9tbkxOUTR6UFhGSmhlZlFtdHdLTVI1WHJo?=
 =?utf-8?B?REJBRDhHazdjNmxCOUxjWTNSSzMxNDRmVW1TWXl3Y3hsUm5pa2UxVmU0b0VG?=
 =?utf-8?B?N1RlZDFuL2dhdEV2bUhLZUEvNDFrS3M1LytjSXNUd0hOT05tdkp6TlI4R2cr?=
 =?utf-8?B?a29QUGxveU9sNUZmWmpUU0dUQU1uZ1NxTDdJdDQ1VW43UElHOHVsbml3aFJs?=
 =?utf-8?B?M01MLzZaVHF1Vlk1d05NNFQzaXFwMVJtNnZVU053MlJsWTBYQ2Noc200a0NV?=
 =?utf-8?B?bzIrMDBsYnhDaTMrUHhnejUzZnp4V3VWZlZBKzY3OTZsamlSVXVteXdEZURj?=
 =?utf-8?B?NGxkRDZQdEx6d24wOENPZmhOVm8xZFNFUHczWHgxcVBiV2ZHdGwwblNsWDRN?=
 =?utf-8?B?dTlxVENrOEdMblJ2Ty9zdVBBWFVqRXg4QlMzdzkwS29uanhiLzE0ZzBXbFkv?=
 =?utf-8?B?WklwcGpHZVM4SnF0Z0dJZnlTMzdQVmsrUEVTcDRneHdOcS9UcmpPdU5FN3ZP?=
 =?utf-8?B?U214a09BcW8xakx5Zm9meUV1MEZOYTB3QTNqVTBuUERadmJBZjRmc3l6VzR0?=
 =?utf-8?B?cmtyZEJ2VTdwMit6blRGbTRkSW1RKysyUWZ0YjM2ZnBNV3VxbE52V2JoS1lr?=
 =?utf-8?B?ekVJcno2YkowN1hvVkdBVjBWTHoxSGc3ZTJadEoxYW14M2ZwSEUvSHVVZXFT?=
 =?utf-8?B?OFB1dTNyK2wvbjVWUzNRQjdDbTNVNVVWTS9QeUVQOXhjeGNiazNRSW8wVzBp?=
 =?utf-8?B?TnM2NGJjTmJNNytjZHFlSThzK054WVhnUDN3bGRxd2VxZUN2cjVLeGlXRVIr?=
 =?utf-8?B?RFVaNUdkamVyMzBuSlI2TXJrMnNjSHJYNlRkTHptMk5WNWQzOWlFL3ZxK0cz?=
 =?utf-8?B?a25JUld3SVlLTWdaZitQMitlS2RHT1JIVnVmUDZIc2hXc2dGV3pDaHhxUDZF?=
 =?utf-8?B?TDhhNkFHK1Z6Z1h3N0QzTzhVcGM2MVg1NUl1RDdkZHB3UmszYXJFOVZkeVIv?=
 =?utf-8?B?Y2NoRmo2WVFJSnRyaDJXcytITytyMlVlR0hiUVgrT2tFSVFKU1Z6Y1hmaFRT?=
 =?utf-8?B?a2FscDByWjJKKzU1ZE5SZE5kbWhaTEwwSjVpaUZ4emJ4T25MVVZZcEhrVktO?=
 =?utf-8?B?WFRPQVZJSCt5bkIxMXZ2NE1hQkVvL3R3MEJFVS93aTluQVoyOXhlenJucVpI?=
 =?utf-8?Q?Os768vnUDsmFPExhFcMqG+fHJ?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.43;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(1800799024)(376014)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 10:25:54.4631
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a53414b-05b5-4e37-0b74-08de1c55b3b3
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.43];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028CFC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3807
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA3NyBTYWx0ZWRfX1GeT7JkpR7zA
 MBkSJHrUfikq9yGxw/czSHmMvaT4fuMa3gdvisFdDuLI7iEWE8vUfb2gD4BfjbONrsSxgL58nkT
 cYIyxdlTOyfIZHsck/qyyVKQYmlScD7FLbdhQSltaNPh69UKuURl8DJywyXzyCqlq0Gj3BHsdcA
 HccHH1t3CFZoUTKJBptk/3sriV3ol33IQ1MS8JC/ORGlgZljQRU04DD5YPQPV+++yePDfhUn1KL
 ppZwkL9TjdOpVafsdUFIm+cedL49zT280MQ8jQhRZBef1ENNJjU1PlAGPInttq1b7fWasc6+bbR
 4FrwX3ImZwViyS9r9C2FPwiPq3BmUOxX72lcxdJhNj9CCRdRi94RSOpDyOjoZEtEgJvIwowZl1d
 gciO8yugjEBVu/xuSioJr5iPYYUwyw==
X-Authority-Analysis: v=2.4 cv=EpzfbCcA c=1 sm=1 tr=0 ts=690b2639 cx=c_pps
 a=UoD1qdM88Ekh55SgLqAOKQ==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=1L6_QlTVf4EA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=mkCXqc3cyx7BTJBtcHcA:9 a=QEXdDO2ut3YA:10
 a=HhbK4dLum7pmb74im6QT:22 a=nl4s5V0KI7Kw-pW0DWrs:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22
 a=bWyr8ysk75zN3GCy5bjg:22
X-Proofpoint-GUID: YNrHbQ1Cv570Mb3i78xgmOoN8rr6dayC
X-Proofpoint-ORIG-GUID: YNrHbQ1Cv570Mb3i78xgmOoN8rr6dayC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_04,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 clxscore=1011 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050077

Hi,

On 11/5/25 02:12, Peng Fan wrote:
> Hi Shenwei
> 
>> Subject: [PATCH v5 0/5] Enable Remote GPIO over RPMSG on i.MX
>> Platform
>>
>> Support the remote devices on the remote processor via the RPMSG
>> bus on i.MX platform.
>>
> 
> I have not look into the details of new version, but before that,
> just want to check, have we agreed on what Arnaud suggested?
> or continue to proceed to be this as i.MX specific?

Thanks, Peng, for pointing this out. Regarding the V3 discussions,
it seems that I am not the only one suggesting a generic driver.

Thanks,
Arnaud

> 
> Thanks
> Peng.


