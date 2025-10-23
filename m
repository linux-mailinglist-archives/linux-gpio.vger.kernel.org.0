Return-Path: <linux-gpio+bounces-27544-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D17C01725
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 15:35:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E09A7503463
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 13:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE47F344038;
	Thu, 23 Oct 2025 13:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="PFmAjRIf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F9B328635;
	Thu, 23 Oct 2025 13:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761226073; cv=fail; b=CrQwat5PgF1IKr8k9MQiokJ1KGt19KvCPGBCmoODk5lj7F+tMnxJuF4fNq4iDyZDTBY9Bih7Mwosip+nX9CJi44/dzSwSeLjTUtdACTwhuXcvNWVSgLSeAgaHS+ZLUVQ0GU2irALHQpKY/52ox/rp3W1l0vvgRr86RWm6Qp6Wco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761226073; c=relaxed/simple;
	bh=BZVadA5wt4fzPEeB/MY3ZTvUBEaQA514uH7k25TOZqw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SaGW/NUNqEfkEDX5Sp7qZC/MCFC10pAHysJQItSYm19S6QhCyT/0Xf4GNMf5ohQk2H+adixOXn/5wNUyxa0G+vD3po4n02WUOlk9LyWBhslVUS1rDVBqgDTY+pJ7BprlGZx03ZwBoIYPMKpiF7xBm3wXEo4wM3uqi7Lo8pzP8Gc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=PFmAjRIf; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NCnw1e007459;
	Thu, 23 Oct 2025 15:27:13 +0200
Received: from osppr02cu001.outbound.protection.outlook.com (mail-norwayeastazon11013013.outbound.protection.outlook.com [40.107.159.13])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49xvcxp5vt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Oct 2025 15:27:13 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i7dp1vE0hF/xP6Jgmj1AbSpLOhnGuBmyMOAWaCqKeQXoLHmTBftqAQWRkb/zOHsVeYjp5IyPZH1hO9L7sJDHfPTLNvJVjHktvVSgOMhwAfV72IfCRa3HsqmBy+nE7bZy5022G+Px+2uZkkfGXZI2YgDwaPngOUdu32qfe5Cn3/ASTquxE6iSCXjn1OxDTPSL/L/vOk4DFNcPb3Kj+C2n86EfeEsUZq1866JRkJSAZvyMNekgQYqoseNkPI7D6RDTbMzlVn/lEnKOWfzv8G0jKXA1y1Sgc3zGhPAdd2RiBu+Ojo+oGSciBOBiIRSCPxyMjrIJt9ASWJ3/ZRk5phI19Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjRBRYr0Pb2m5tCaFmNNVYsdtrUYyDyKrDzyAvDRR9k=;
 b=MXAF5f8Xh82+YZGZrgbFWo6WRdNyBdNQy511xIqTgQcqm1xAPDxJqP73ri77HFhzRwus+CAXvf1L8T/jQEYRe6egqhg0KRuRNVVnG9lC3Yg/krkwngFpmJVWt5duTEmaA+UU9VzE+7NdP2so1rcFtlE3QKlATYLLyX6iDqspQR7bSulBT/6H9k+0v/Pa2DvQFyLqlAMf38Kz4D/UPQDplCaBVFyiTTufFB0CuODj4jDqLEKvLGGB/I32VeTwhnAEyb6vu98etmvGEI2bqHSFp4/q+yim/zjWwWXoeMsr2CS9vXRHXHYUYMVA2JnkrwtDsj9fNG1wSPxwt+djNsrkVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjRBRYr0Pb2m5tCaFmNNVYsdtrUYyDyKrDzyAvDRR9k=;
 b=PFmAjRIfeenmZRdcvltNYOQAi6uUAMk6gJh2czkTbpKPkQoWf6NrpMXAJe/CaxXjUHdFgTax6eGRU8qSeJEv2EPgp39MTaV5m79Xkc7CrTF+8VoWBb+kxi4wq6kCyJWy/fxx09zx3ASBTKKj9Kmbfvq1s2NJrKOnwoAFj3NYxudommZnyrPtwNnp+iAUNORrT477MVMfu8Glc1MvIsM3nns1Iyzamrsojg+PzS2eko7QHTR1JBdI7f2CIxDU851+Ny4Ac3tC8xmQBXTtHq7XeinYiXoxcGnFAT/tw2sVzryXCBe46GH7L1ovpFZYQgcJfbEdlClfxL3YmWQjCmq9pQ==
Received: from AS4P191CA0028.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d9::20)
 by PAVPR10MB6985.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:306::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 13:27:08 +0000
Received: from AM4PEPF00025F9A.EURPRD83.prod.outlook.com
 (2603:10a6:20b:5d9:cafe::d5) by AS4P191CA0028.outlook.office365.com
 (2603:10a6:20b:5d9::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Thu,
 23 Oct 2025 13:27:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 AM4PEPF00025F9A.mail.protection.outlook.com (10.167.16.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.0 via Frontend Transport; Thu, 23 Oct 2025 13:27:08 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 23 Oct
 2025 15:20:09 +0200
Received: from localhost (10.48.86.11) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 23 Oct
 2025 15:27:06 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
        Christophe Roullier
	<christophe.roullier@foss.st.com>,
        Fabien Dessenne
	<fabien.dessenne@foss.st.com>,
        Valentin Caron <valentin.caron@foss.st.com>
Subject: [PATCH v4 04/12] dt-bindings: pincfg-node: Add properties 'skew-delay-{in,out}put-ps'
Date: Thu, 23 Oct 2025 15:26:52 +0200
Message-ID: <20251023132700.1199871-5-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251023132700.1199871-1-antonio.borneo@foss.st.com>
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F9A:EE_|PAVPR10MB6985:EE_
X-MS-Office365-Filtering-Correlation-Id: 720dfced-005d-4ca6-68bf-08de1237ddc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZUjDU0+Q1uhEOuPBN/FRwlyRNdRxf1kGwaooSRo90ZISrCOXu3PcmRuf1B7t?=
 =?us-ascii?Q?drjOPYGkDUYz3tLn0m+j+eThodV9uS8pLPdLFOWgIrnFQUqB0vUOTj4f6Css?=
 =?us-ascii?Q?8YTaCJgFff6GJqkuYybU7p2j+fNcbHJ09f5dQWIx2dytqD0BM5zy3NMkNKp+?=
 =?us-ascii?Q?DmRd7tcb92UMfndPrDJUi2jvdGblWjOWYRx606wIkzUKMyddmfIpu4wnybNa?=
 =?us-ascii?Q?A9DZvFsXzxr2j8J0LISyJ2RlJY+BjwEH5wJEobq5dMsugMq4TdEX9kCsjJOM?=
 =?us-ascii?Q?R3VpTYOAHLyEwl8SdXbclzqhDoLfytDqpIceRAGVjvs7CLff+9Qz/Ewz38pK?=
 =?us-ascii?Q?hDvPi/jxgCMBWggA+zxjmbERfwL8Elh7UlX+0XrMEnalaLX64YzbM5jeMJLc?=
 =?us-ascii?Q?cf1zH+1Iqsut1rP6Wch+4y39mSbBAgA9JcHrix6J8c5duT2kOT1bHErrLeSs?=
 =?us-ascii?Q?DCmxkdBi5Dx3PHkRadNUIJOymHoXxKh7huFtRBgn93zAGjo5DX77fRXvmDf0?=
 =?us-ascii?Q?PmU114g351R6vHQrwLPu2M5ZOpEJYZT0/5Bq600jfNDtRCeSfxVvre6r0Nvy?=
 =?us-ascii?Q?2Edl6w664lljQgdp5TNdIYoA7DkdtB1j3tAwA7BNt1OGMPeySUZ19RMSRkpu?=
 =?us-ascii?Q?IWT1UHgXGKq0ekewHIsGX66S/t1Ng1hcZ7a/2osxrCnd88D1zahGkGC4aNK2?=
 =?us-ascii?Q?wEOKaYszWkXZyP9Cs/8vwjyHWsv7bSYBz/T7ZVnsFDTM4+iTpTgqzrZONjNo?=
 =?us-ascii?Q?ByHN/BXG0KwX9tbdXb+/ZV2WtSLOxYfmD/eyrv3xlXjgYnAJyGSZCjMLEaT3?=
 =?us-ascii?Q?mRDxipFMduwWzuoH4FqGljJJJIwv9nvLjD0emc9sYQ+mwbEcpfba2QJkI7Ye?=
 =?us-ascii?Q?JOJhMBa5LhBCuBfM/C4Ct2spDC5U3tdLaSCmgn0oR4Pc5ZNV4mHgg+2V1RU0?=
 =?us-ascii?Q?L8k7L5ozoh0wL4ZkFCjMVtf99uS5BY/9nT7qA2ilERfvokhj+UOVvNLMj/IE?=
 =?us-ascii?Q?ieIqyqnlyq8ORdybAxQzSAcnQhilnEeJcShNQHRhx+cdFgJCPLHeiGfEbrVU?=
 =?us-ascii?Q?xnDQ4b0hZvpN8Bx5wY5Yfn478DijXFhiC8IKNpaNHzuGeBYtaJAOom2PkfWU?=
 =?us-ascii?Q?fjKaLn8z5NdUQ7c7QUCi5KWdY07VgSIhj7Ofqy+PHJyVfzdLiDNtBV7i7DTI?=
 =?us-ascii?Q?kGEHtnyVY3l/bbGVLB4wZSnPsiFHY9KxUGbpYggKSMrNhafOI/XgzcBCIxVZ?=
 =?us-ascii?Q?gUsZDw+eHL9tmxL80kydY3JS9ynrJ/CKiGkTpIJPIAZkcGw2VjbdqBuOq6cQ?=
 =?us-ascii?Q?4jfNSuUi+xeAmQWVu50/MaomoaWz3sqf6MlnqPbFyZbBMqSqy0nXiFba+STN?=
 =?us-ascii?Q?uJXp9bsDcFjSzEVCJSKeWwgKGLxFvscpGXjM3Gss6E2STrKi9ZROumAOMrm8?=
 =?us-ascii?Q?LwlCke4J//ehKRQjUVNU2MG1OpyUM7CZxR8wTzxyoNFvAlmxQ8Cj/EsA237Y?=
 =?us-ascii?Q?erZKmnCdjrEnRuAfKHL7/ORLm2ZSUinySlbdKvPJnO9cq3XAwyJvRKUjv+QR?=
 =?us-ascii?Q?ub1DZfArc/bRcLERgtU80foBQ98pMl6zO4vF5yVQ?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.44;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 13:27:08.5211
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 720dfced-005d-4ca6-68bf-08de1237ddc5
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.44];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F9A.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB6985
X-Proofpoint-GUID: CSItsjA9R-Mj3dJcgIp0-_MBU6PM_r0G
X-Proofpoint-ORIG-GUID: CSItsjA9R-Mj3dJcgIp0-_MBU6PM_r0G
X-Authority-Analysis: v=2.4 cv=RoTI7SmK c=1 sm=1 tr=0 ts=68fa2d31 cx=c_pps
 a=fn3bfvmJ32zQd73hrxC19g==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=8E2vECBWqwbzlXO_OdwA:9 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDA3MyBTYWx0ZWRfX0kFM59VnXB+q
 B7o5kyinBeZYlOqe1A/Y60tt5ZFjo/H3x+Ucw+aXnucuNGhPMKYeXdtHvfr3YqQvz9p2GF3Lzcx
 ucG0sPj6Vs/1DWXleRsoyTl0kuo9pJi5VC7Clfk92moQznEG1SzQHwLph6erq4xVpH507gYqXLs
 vOcA2BenSbsd2q+4cQ3ag6iSBFTK93+on6g/Cc1w35gcSCh4OVF/Pr1j0oM0mPgan5Z3QxVgVCa
 /lECkmFIldE6Lh2H4/TOugE9FbFqIchL0HfNpxGygjCke7tACfedPZ0JrKuqI1tAZOkgdBqfcy6
 dpi3KlijTmr/MM9UCoM0bYL8j/nklBNB3sC3s6R/lwwjvua5xsPx8/r9cD3/7yQot1s244fdSw/
 uj0+2lkks91gTxeoPTbOQx/hhltPbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220073

Add the properties 'skew-delay-input-ps' and 'skew-delay-output-ps'
to specify independent skew delay value for the two pin's directions.
Make the new properties unavailable when the existing property
'skew-delay' is selected.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 .../bindings/pinctrl/pincfg-node.yaml           | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
index cbfcf215e571d..d1bc389e0a6d1 100644
--- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
@@ -153,4 +153,21 @@ properties:
       pin. Typically indicates how many double-inverters are
       used to delay the signal.
 
+  skew-delay-input-ps:
+    description:
+      this affects the expected clock skew in ps on an input pin.
+
+  skew-delay-output-ps:
+    description:
+      this affects the expected delay in ps before latching a value to
+      an output pin.
+
+if:
+  required:
+    - skew-delay
+then:
+  properties:
+    skew-delay-input-ps: false
+    skew-delay-output-ps: false
+
 additionalProperties: true
-- 
2.34.1


