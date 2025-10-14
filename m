Return-Path: <linux-gpio+bounces-27102-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB7DBD9F6A
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 16:20:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A61E13E78F3
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 14:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA03218821;
	Tue, 14 Oct 2025 14:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Q+XTietD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68EDA48;
	Tue, 14 Oct 2025 14:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760451319; cv=fail; b=CNIugqUme3hQXFlytcWceY6gVZ4TNPRDYtJrraayJxPiyH0kI5r+7ssYZQiy8D/+18anox2mk8+5zi4PxyBpxkfB4FltO+2RKXSjhYbo32LwgqR9rggkixcEpT9wRvxbwMXhRvkFmpEuhXZw11nIwae3aChYG4zQKXcJePrOqsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760451319; c=relaxed/simple;
	bh=w5v3O7KC4RMNdH9Y12irjE2VKCt7vRBFSCKVyauRjIE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m0pX0G46IGTb/j8DX1YyM8IdO8jZ2Kwz9YKiBGqG0aHMqtiotDjYHHjweZ179ujP6wt/4XhPiygQz1BDmuwSxOpDImeK0MkDYMyuu/UAqmjJVjk7EWcOwJERSCP/Iy1rApI5nHsIv/HYG/JcmcEcgXB4TM34bQ2TXgrWxhc3aw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Q+XTietD; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EDIou4014398;
	Tue, 14 Oct 2025 16:05:05 +0200
Received: from gvxpr05cu001.outbound.protection.outlook.com (mail-swedencentralazon11013062.outbound.protection.outlook.com [52.101.83.62])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49qfe64nhn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Oct 2025 16:05:04 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MWoZRDTZ6GYsbQlsZXHvFBfR6MRE5lK3KBs9NuLMU2X/3SRGS3GrMRp93mwi0FcY/N/GbaxiBPKQtCX8q8chEY3SoJvOmGMDIANn2D7nNEM+eu7u6bvqLcrfmGXXr8cyMzagoizXQgYTEoVJn1TdxxrpI8E+mvqGOCeWEfmh/cJUIkk3XuNKoogmRcOZFnY8MZQ4fbC5CRVL3THHPrQrvBeX1Kb03gWs/JceYgVVNDAosjeNkWULHAfNi0aOHZnj8GOJKv4bis8JyDR+hKuy//hFhAwqWNmK2dmc7O1LSs0s/+Zrcrf6fgC7iFLf+g04zm44NujQHcHTgy5UIuOQVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SQM1PPlRQ0zgoenMOf2cd/wwkqZzcH4uHSmvD7moZAA=;
 b=nlKhtf0s2ekyIOiG2dFxu7nMTBQtQ4b/LR03WcPP2giI0vGprhlSK01oJVp0Vp/fkYhV31Hj4O5fmboMbTXJ1TYKjzbc3NUd+Hiort7I3inIzdaJGwxWYborUNToi6xV5PE9djOphZ+QmPFp6NyE5tUAl9MwWDef04dZHkX5no8hF36toBmypRseKXL6B9OjDofe+w4IpV38HtiHAryubKXqwRhbMynFuxGR8IhsUjYNLTo7Qi0vwJ6dX0lfiPo0ehMxmI9uifBqO4zbpgNFNS7l+9l3olf1B/1VVcALUcWmqylZfxrxCpDOklNY6ccyWpBXk3ln3vTHqBb9DNuOqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SQM1PPlRQ0zgoenMOf2cd/wwkqZzcH4uHSmvD7moZAA=;
 b=Q+XTietDaLaqsKWgDKujFUIrs88auQ6Mb3d6euXnXrHktuD74Z74x8SQShmXaygWi4zAwCuyWvZi1gfO5NabU1DfTYfhCHSvMqDH4YCFlAaZX3D/XnqKA35PsmANaMfRfglZ9SNtNa30BJFhSTnPuw6tjq5x48FTVunBxWMzewoCgOjHZetMwB38BqYuF4CBmY6TXqbL+6XJEIREQ+e0YVizQQEawSNi8bgEdgdrwd1KM/Eh5G3cRhG1liXbXOOBy6+m93EwvGm7SKhixOBHhgFwTR9w9LplNdiqEkCf8DmBz3nM/44B9HsX5106uCvzUedeIcOScRC70GlL64zGsQ==
Received: from AS9PR0301CA0047.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::27) by DU4PR10MB8723.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:55c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 14:05:02 +0000
Received: from AM4PEPF00027A6A.eurprd04.prod.outlook.com
 (2603:10a6:20b:469:cafe::e7) by AS9PR0301CA0047.outlook.office365.com
 (2603:10a6:20b:469::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Tue,
 14 Oct 2025 14:05:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 AM4PEPF00027A6A.mail.protection.outlook.com (10.167.16.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Tue, 14 Oct 2025 14:05:02 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 14 Oct
 2025 15:57:57 +0200
Received: from localhost (10.48.86.11) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 14 Oct
 2025 16:05:01 +0200
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
Subject: [PATCH v3 09/10] dt-bindings: pinctrl: stm32: Support I/O synchronization parameters
Date: Tue, 14 Oct 2025 16:04:50 +0200
Message-ID: <20251014140451.1009969-10-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
References: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A6A:EE_|DU4PR10MB8723:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d9c6220-e4c5-4bea-9c58-08de0b2aab36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Xna9hT3xx0lkIWzluGpoqyhVRFA3d0HGCqllZ0dbx/FiHmIHDXIIFI8R879K?=
 =?us-ascii?Q?WfMnRKbf/P9jikjcj1H9nN7RdqwGbFY42Hxu29eyptNS02YfzPnbeZaRP8EX?=
 =?us-ascii?Q?RnUQ+y4xERk+yTidv9G5tuZoALQtuhhMdLYrwedmqMdq/bSPesFrNDhIvXeQ?=
 =?us-ascii?Q?NJ2xWCAPKnKxb7xQPSVRQcHCJraI8/3D87Tgp/n0WBgGcHH2z/68qdowSyD3?=
 =?us-ascii?Q?8p+3aspbbWyDX21uXaowNvNXX93QtzbPtnNjYgjsuUkwHRAGZ0yWmCU3kquo?=
 =?us-ascii?Q?efDAmNYtEQJAjo1ELAujBRbtOC00Brmmk8mbjLRZo1kTcmmX83q3bkGcsA84?=
 =?us-ascii?Q?VEOyTqisvURVXUanvtNtioPfHxKEGSM15RG7eqNcFLfH7atwdhwZFnBWWAsI?=
 =?us-ascii?Q?1np78kNZPB3V0w5zIKH9sRvzxsZFYAQ2oeqrRrfrGrIXklpPQ6a5+hh72uYq?=
 =?us-ascii?Q?ryYZV3FrurXPJHkvM8OE8OSCN2IA+Qnhv3zrYgVNyJigKi2fTPqi/AS3ZnpL?=
 =?us-ascii?Q?q33ycAZ5yNxtOncvK8/Vq6uBKDqf5DsuYzc3mBR8dUDffa2HKMDMJzRAUzNn?=
 =?us-ascii?Q?+FrQFgKaow6l1tzb7ToBUZX4O5MWPWVzByesqhpnjBj7rxLTuE025sT57fyT?=
 =?us-ascii?Q?1o+opNDLfvWR6XGwLpQVq1Ll90nA5cCgWbOGgIVwaicheLssY3Z8PtgvrMo0?=
 =?us-ascii?Q?2iJfAgsoioOM17vithfYNmI/AOlnfEZtteXcJIyvqGYmZAAxCALGZNeERGl3?=
 =?us-ascii?Q?ZqmfgDqgN1DvT9EzLm1MG2ljTWLAUXu0zg2w3lNZJIWj7sNU+dLtOweXKyTD?=
 =?us-ascii?Q?DEFFFLIUDmuwz/Sceis1bL5I0SKw4tXS5JvCYvbp52n4m4QIhtnWvtNeDFGU?=
 =?us-ascii?Q?RrbPGmzV/kk2XsYw6dzY3l1Z/vzC2ZjFUjKqiTNMjmTB+anofRK+40hIys8A?=
 =?us-ascii?Q?DiacZYWXDj2s/rRkpd8B6UdRpb+kxcYUTySZrFwDJ7qYgy8AGyF4tyQvaqIP?=
 =?us-ascii?Q?n5O2ZruDe/ZyhjGqQLn/1PiS74uquVGZ7eDepVhTJ/nE92rVe0AxYBmrFbrX?=
 =?us-ascii?Q?P9bmFhPwi3neTFgoKA6r2k4hA644zPwdCSzI8tzyXq7oPKUR4VwcuIXVz0QH?=
 =?us-ascii?Q?opIOp93Cx8lvngxDFaF0vDqG4Slx3kvhb/EQywIToIrYwODcxNr0RRzTl7yG?=
 =?us-ascii?Q?ozNLmBefibvlOxbUbBYLiac+1Wojnjo2RV34TCHC5u9RpPGUDNTqllee+TmD?=
 =?us-ascii?Q?dNwthO6SeBFrKaX99mLD5hrOBuVBQS8J0CaOZnVEdOERVAL5titBQckrPg35?=
 =?us-ascii?Q?/l/5jkaTJJB718DNmwZL87z2p2gE8PuO3zdT/jKMJVRwQxzBMTz1s5BWiJ+d?=
 =?us-ascii?Q?45TN+Y5L/9v1lZfXX73ySS2llBE/6kG/4X2GGLx1YZk+iF1YOP0A+G614br3?=
 =?us-ascii?Q?WhIWAXVDg8vzWWQtqzU7AfZ2Y7DqYDiIKMZOgYF0IGHufWuzevAe+jFKN3Cv?=
 =?us-ascii?Q?Tyf5FXHqmAqvqw+q/nPAxj1tp6cl/ne4L9IrJilOlYaLw3exT2V03jjs01X9?=
 =?us-ascii?Q?xvKlaHVlBEDtDdH/DIYb9SQfQjQUZ/PxsE6GKXUX?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.44;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 14:05:02.1380
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d9c6220-e4c5-4bea-9c58-08de0b2aab36
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.44];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A6A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8723
X-Proofpoint-GUID: zDcvjtBYjjp_yew0ATDM-gi3TxKSTYXC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXyRp3nkvMqecD
 O/xUqSBU4XAKDTuI05pl7olYobuL3nKuu21WVdH4vEXr6nNng92N/9r9vdu7NsORkmCpi0R1WHo
 ofhGd69SMJU41m6sbQcIjAKXP7cijXa6sveXBjuxkFJdh016uJcEPTrAzpMefXvwdNvht8pcH9r
 /iUe1zTE1HP2qoliLFLTL5Qh2bCtHWOgmuvEoH5mGUNzY3HBX4cIxXGp7dB7T1D74ZJbKh6r35Q
 t6iP6Q5UczQXfu3TlMacOdgvTlf569kBFedaD7l4/fcti9IhXc6+h6/OidDBY3C2StEGggOxJI+
 y9/k7gqB7hYexoQZYVG8nmwATmAzOV44B5e/0j3ok7NNOcOcycQBI6hhXF8fGs3TODADScwu3e6
 KZ0Kky8z49RPafKHIN/8gaiP1w/Kww==
X-Authority-Analysis: v=2.4 cv=NfvrFmD4 c=1 sm=1 tr=0 ts=68ee5890 cx=c_pps
 a=RtmOKfXeDbbZjWwzFrWVdg==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=Y3uBLxUxZlyhwTEa0a0A:9 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: zDcvjtBYjjp_yew0ATDM-gi3TxKSTYXC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018

Document the support of the I/O synchronization parameters:
- skew-delay-input;
- skew-delay-output;
- st,io-sync.

Forbid 'skew-delay-input' and 'skew-delay-output' to be both
present on the same pin.
Allow the new properties only with compatibles that support them.
Add an example that uses the new properties.

Co-developed-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 .../bindings/pinctrl/st,stm32-pinctrl.yaml    | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index 2df141ed7222d..0010762127c05 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -220,12 +220,89 @@ patternProperties:
             minimum: 0
             maximum: 3
 
+          skew-delay-input:
+            description: |
+              IO synchronization skew rate applied to the input path
+              0: No delay
+              1: Delay 0.30 ns
+              2: Delay 0.50 ns
+              3: Delay 0.75 ns
+              4: Delay 1.00 ns
+              5: Delay 1.25 ns
+              6: Delay 1.50 ns
+              7: Delay 1.75 ns
+              8: Delay 2.00 ns
+              9: Delay 2.25 ns
+              10: Delay 2.50 ns
+              11: Delay 2.75 ns
+              12: Delay 3.00 ns
+              13: Delay 3.25 ns
+            minimum: 0
+            maximum: 13
+
+          skew-delay-output:
+            description: |
+              IO synchronization latch delay applied to the output path
+              0: No delay
+              1: Delay 0.30 ns
+              2: Delay 0.50 ns
+              3: Delay 0.75 ns
+              4: Delay 1.00 ns
+              5: Delay 1.25 ns
+              6: Delay 1.50 ns
+              7: Delay 1.75 ns
+              8: Delay 2.00 ns
+              9: Delay 2.25 ns
+              10: Delay 2.50 ns
+              11: Delay 2.75 ns
+              12: Delay 3.00 ns
+              13: Delay 3.25 ns
+            minimum: 0
+            maximum: 13
+
+          st,io-sync:
+            description: |
+              IO synchronization through re-sampling or inversion
+              0: data or clock GPIO pass-through
+              1: clock GPIO inverted
+              2: data GPIO re-sampled on clock rising edge
+              3: data GPIO re-sampled on clock falling edge
+              4: data GPIO re-sampled on both clock edges
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1, 2, 3, 4]
+
         required:
           - pinmux
 
+        # Not allowed both skew-delay-input and skew-delay-output
+        if:
+          required:
+            - skew-delay-input
+        then:
+          properties:
+            skew-delay-output: false
+
 allOf:
   - $ref: pinctrl.yaml#
 
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - st,stm32mp257-pinctrl
+                - st,stm32mp257-z-pinctrl
+    then:
+      patternProperties:
+        '-[0-9]*$':
+          patternProperties:
+            '^pins':
+              properties:
+                skew-delay-input: false
+                skew-delay-output: false
+                st,io-sync: false
+
 required:
   - compatible
   - '#address-cells'
@@ -306,4 +383,25 @@ examples:
                 pinctrl-names = "default";
     };
 
+  - |
+    #include <dt-bindings/pinctrl/stm32-pinfunc.h>
+    //Example 4 skew-delay and st,io-sync
+      pinctrl: pinctrl@44240000 {
+              compatible = "st,stm32mp257-pinctrl";
+              #address-cells = <1>;
+              #size-cells = <1>;
+              ranges = <0 0x44240000 0xa0400>;
+
+              eth3_rgmii_pins_a: eth3-rgmii-0 {
+                      pins1 {
+                              pinmux = <STM32_PINMUX('A', 6, AF14)>;
+                              st,io-sync = <4>;
+                      };
+                      pins2 {
+                              pinmux = <STM32_PINMUX('H', 2, AF14)>;
+                              skew-delay-output = <2>;
+                      };
+              };
+      };
+
 ...
-- 
2.34.1


