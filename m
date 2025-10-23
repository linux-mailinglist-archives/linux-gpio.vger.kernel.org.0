Return-Path: <linux-gpio+bounces-27539-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F22C0170A
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 15:34:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 665E53AF291
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 13:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62B61325489;
	Thu, 23 Oct 2025 13:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="C4o5FNrb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1D2324B3A;
	Thu, 23 Oct 2025 13:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761226046; cv=fail; b=tOjPcF0ANxoxnSN0pQABlWVoeSdJB8H7YVwP/WHge1xSD64EblEsplbaQGrfgMPSH2Nk8WMdFr+r/IHY9wiqTL0o0g1CZlUVYcgDvPdBp5F4ac+JhdJZtTCij4g6SZcOh4pXyQyhKKMKeIa04jpb0aon7Kf9cGXnfvcKnTZicEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761226046; c=relaxed/simple;
	bh=8XpMGrkIBvR4vvkR+b0zHa+B3+qLiSO+Bues+D4UbQ8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sld/NEvRY7C9lFmvQUfOIVXhrCJVn4+4lCqRNu6ASVZNKKETdbiTLxgdOAaKif/QzQOm351a097M6nbgniaO6BaBOQ/pgmym3sQxMtm67JuApZSmpiNPABf+AkJ5gNJxtQrAl0aFJDZRlBUoscV2IS4PiQB954/ZkUPT4NuRtTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=C4o5FNrb; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NBpMV7025363;
	Thu, 23 Oct 2025 15:27:14 +0200
Received: from am0pr83cu005.outbound.protection.outlook.com (mail-westeuropeazon11010021.outbound.protection.outlook.com [52.101.69.21])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49xwe4nm9q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Oct 2025 15:27:13 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hH27A7nDQ9zxo8sv/fbokZF3Px/ANxDF3+/HZ5xV5aYrQCnzOzxInb2dLJZTLwAecJ3/BG1lnioqh6iE9sQz8yb0biWRaNROGNCUcX0dMPupoYcGlse7Pa09+SimOgEoxjiU07flaTLRjEYSvCv2ZZzK7MKzod/ntD9rYrMT2OSFqsqrQXHl6YY/486yGICaE0YGE3PZ76X5ppjKkkSbx0BZJ6xHAHEz92IDjcdCTjWjuB53heyn9tkEm9oAUpVbJjQU5IoxatbIKS2uyZmLvs9oAbbXbDy2wS9/5yXruzJ2JKDIjXac3W7+geHXGv4vLqJcC2xCnwzWBy42wObIQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q6vUyF+H/Nrz5MDIu2rXsJ5stAyl3SiTHcypyG2i4f0=;
 b=BwvNlS8lBbbQ5MeKyjJGM35gDb5yl1empA3jvDapp8PHcL8fi95ztI4FS5H0D0xAQYC0DsP1Au5FQ9dhWgNQZJDCpQyPqykv2oVbd9k2ba8s2IeU+wLiESX1mhU8Ia+bmaB1dEQUJxq9Fm5cmUfmihSWwu24MH/WyTzDIUoHwI71dP4s5upSTZrmZwckEliHUGG3bicjHeaxjxRs3keLn/40FtXtoPQh/1gtOwLYHIjSOh0UUTpwSq1UTsTVgjBBCV7WIqauh0ASHqLwtSsb7C5YYCN+uQ2vExrCyQUPcjScjIrTsh2aB0jPJ/H/qBUuVQi1XsVV5FcscP3ODQJ6vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q6vUyF+H/Nrz5MDIu2rXsJ5stAyl3SiTHcypyG2i4f0=;
 b=C4o5FNrbCBqgaSP3YT+8MHcScBC6zD8hQkgbh8Nk5wu/4IjkVsffLmgFjT7seSSFjI+sRv1lWey4+mYaIyUl8MjUUhiD0as3Nd+L2XFvrm43aUx5IBFJTH8t1gTBJ8u6DiqWjctZuf5MhRCSZWHAD1m3fCa2UdIUZHW0uPqtEESbAyfHk9wGiCQrx7HsVYoa6/OAl6GsHIQhxqOFbo5wJsPjzW7LJsjKwUl/6v+wHc36X5ZSjiqw5i6H1cgL6aCMDQdIrlXHqr35i9xLJ0Ne8lGsfC5MkLAYIMQ2GDpquiHdlcwMste0Bf+/3ce8HOHGN7fNMTBsm2McdJMqbVbr5g==
Received: from DB9PR05CA0001.eurprd05.prod.outlook.com (2603:10a6:10:1da::6)
 by DU0PR10MB5852.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3bc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 13:27:12 +0000
Received: from DU2PEPF00028D13.eurprd03.prod.outlook.com
 (2603:10a6:10:1da:cafe::5) by DB9PR05CA0001.outlook.office365.com
 (2603:10a6:10:1da::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Thu,
 23 Oct 2025 13:27:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DU2PEPF00028D13.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Thu, 23 Oct 2025 13:27:12 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 23 Oct
 2025 15:24:46 +0200
Received: from localhost (10.48.86.11) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 23 Oct
 2025 15:27:10 +0200
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
Subject: [PATCH v4 11/12] dt-bindings: pinctrl: stm32: Support I/O synchronization parameters
Date: Thu, 23 Oct 2025 15:26:59 +0200
Message-ID: <20251023132700.1199871-12-antonio.borneo@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D13:EE_|DU0PR10MB5852:EE_
X-MS-Office365-Filtering-Correlation-Id: 208576b8-c5fa-41a3-0dfa-08de1237dff1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yLIcnicDvTS9/tICr2wsOM5aDKwK5nIKu89f1iB/tdIMgePJLzhxyNAJHwmY?=
 =?us-ascii?Q?6WKOVT6aH5lEu346bhSw2GZX/5SmXTx5y84TyxHEOoDd3DcNB4xjRM1M4awa?=
 =?us-ascii?Q?vA6uGH84uRKxIA9tSi8n4cSezyuOS0bMdbrOfsOOuujCTk2INhFQIZLTBKKm?=
 =?us-ascii?Q?BJlJO7jw0N1Fj/D2PkvDHx5vZxfsKRFIuvVVk7W1CHE171JdKmjJa90Ndaao?=
 =?us-ascii?Q?zmZqFL4XvEdL1Ugbn0uJY8E05goxKpPNfVwMRykHFhr1XOPFydgJ9uBZGVdh?=
 =?us-ascii?Q?FEADbIvBdtUaA3SXhJTV/wFk8CAKOR+5wQZbZrtVE2f1kCrDUcM2b5ALKx3P?=
 =?us-ascii?Q?NV0PfkqtpCzrOD8CdESqApvrpqv1+/H8HB7zGX+IZJSh5dSG7am7HWkN9mU1?=
 =?us-ascii?Q?XjbAOLOMUPrScIDJ6oCpTaWl7HJtpk3sKm2O0VnnZtw803hr2xgkuMDsnyDs?=
 =?us-ascii?Q?ZmR+0t/d+wU0xDWrhjXDPic1tdq4RhujiZNjOhXIgFHcT//o+c4q8CQ7MF8y?=
 =?us-ascii?Q?Az6h+/nwvrjaUefNf+hHW6eXDbVgQQIZt8ZGyMsucGDWGd8WiQoGxFMP4GU7?=
 =?us-ascii?Q?1zZI6LFfTiqOWrYqmgmH3RnmZOGZ8T94zSbP8cB4THLoOX0UyTRkw5uCZZfS?=
 =?us-ascii?Q?HdAqbkIwYZSdYJvIitjvOZmmFrpXTn0WCT1CBHV7l/i+AGOu1AnJfCJJmUnu?=
 =?us-ascii?Q?PwywZLfEp4UxQbx9+o0QtxzPCyGVs/xS6VdoQ0LHNRSkJ/6uNLcBe8a8ISPa?=
 =?us-ascii?Q?yC7EUOyqBNDX1+fwPuJEI5zAoi0KwtWM6Yz2HLSaGJlt7zZuRbE3NKeZxJh/?=
 =?us-ascii?Q?J7utuXFXHqCpHqzc5HU9mClQJOnNOCYudx0l2e8yedHaiqo6WeQd9k2qfiR2?=
 =?us-ascii?Q?nJWkWjB6p0l6bMFLU891nKxaeOmtwqdf6BcDs8jFG/qvrml4WUzDTr6ADtb5?=
 =?us-ascii?Q?HkCY9OFxXcc34Hh2KfIJE0zqrfXhd8LczRtGECDUbDi+nGIVp02pt6iiTPDP?=
 =?us-ascii?Q?kbfTjkSe+t4avWsdcCForqVGEFekhWeAev5aRnoq2mRCf8K49POJQhlM1Fr2?=
 =?us-ascii?Q?B3l7Nonk7IfMj1IDxxjiJ9/TKVspiXZu12RHAcChx5EkwZd/+gSqIB6p7zap?=
 =?us-ascii?Q?e6r6xFOxQQIRSPAJLp+3Xo3OlKAo1RAOUFaGsOvNBItHsq7UyQf/jGP5gFJ+?=
 =?us-ascii?Q?yFzIkMnA0tXmuDOsCTY4gcrixKqROCodo2pTyMFHFbqk1yQ62/SdH4wyM1lH?=
 =?us-ascii?Q?1Icf79oBGQF79cIhddHQgLNmnM6/cJucPL/u0kXPtihSUIIBaBC+gJS8c9eP?=
 =?us-ascii?Q?3jg6ITKSk8PdJzLTTZ3P7OMgvSyj8wcCKND/A8xgb9H/yNUdqxPCGRzzTiUO?=
 =?us-ascii?Q?zkxCrn5y6coGXrtJcjNwUX1BhxgoKO3ILZbDjnncxob9+nAWbhOiUZ+pcpO/?=
 =?us-ascii?Q?+IFJG2mjbqxESF0gXMb2naPFSXQJLBGLoABXlI63YMCug+BHpbeBSYhJOR40?=
 =?us-ascii?Q?1NCc6W/qOz7RZd2UFJf3StNKyLtuHwWKkTjtDjekp77o7AOyh75jYL3X1r5R?=
 =?us-ascii?Q?GuiTDfyrYn1vdsOcPvY0K2gYkSvaauPboFDTszGe?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.43;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 13:27:12.1759
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 208576b8-c5fa-41a3-0dfa-08de1237dff1
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.43];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D13.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5852
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDA4MyBTYWx0ZWRfXzAtLCDjAOYk1
 WlMRIAhEoqD1HGe6zddsr+bdsGZGQKZXO3ToftFJErKnzDd+qCTt8wvNZt2wwsUMkLE8nN6tGM3
 Fc3mMgh1DyHbft0rTSe66r9yWg2UfPALJQd6MM2jWMr9NgVjhWU9Dk5s6CCUSGJYfmJXzXmcfip
 zcXbA383wC3ccPi491fFiJa5mO8/uyJJiTTG2d5SvnpAoI9rSK8McYmRIK3+bfcpNbDYhW56k1e
 LMK0QmBbi8bCtJiaOePvPAKXN1W18f+KITv2N5st8k8KtbKj8ZG42RUOBOoxDPMZjtUWD4oy7aA
 NcAxn+/wjOeS0aK0HAPriIdR2gSYDBKsqQzh8la2tpzMtK0+AHYn57hGy/Ov6FnpMv06kEydExI
 N/dhg1Hyum8fz0l7HVxXccFXnn8Izw==
X-Proofpoint-ORIG-GUID: bfV-EZxVzFe0tgUfDHP9cRfLPyCfKgtt
X-Authority-Analysis: v=2.4 cv=HsJ72kTS c=1 sm=1 tr=0 ts=68fa2d31 cx=c_pps
 a=OcN2TkFOMFfDSoiv/1frgg==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=DaHjY2FiXupCYFAVBmIA:9 a=T3LWEMljR5ZiDmsYVIUa:22
 a=5m3KZe5UNqIRxfhhl7FS:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: bfV-EZxVzFe0tgUfDHP9cRfLPyCfKgtt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220083

Document the support of the I/O synchronization parameters:
- skew-delay-input-ps;
- skew-delay-output-ps;
- st,io-sync.

Forbid 'skew-delay-input-ps' and 'skew-delay-output-ps' to be both
present on the same pin.
Allow the new properties only with compatibles that support them.
Add an example that uses the new properties.

Co-developed-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 .../bindings/pinctrl/st,stm32-pinctrl.yaml    | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index 27c0dd7a8df01..76d956b4a5372 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -220,12 +220,65 @@ patternProperties:
             minimum: 0
             maximum: 3
 
+          skew-delay-input-ps:
+            description: |
+              IO synchronization skew rate applied to the input path
+            enum: [0, 300, 500, 750, 1000, 1250, 1500, 1750, 2000, 2250, 2500, 2750, 3000, 3250]
+
+          skew-delay-output-ps:
+            description: |
+              IO synchronization latch delay applied to the output path
+            enum: [0, 300, 500, 750, 1000, 1250, 1500, 1750, 2000, 2250, 2500, 2750, 3000, 3250]
+
+          st,io-sync:
+            $ref: /schemas/types.yaml#/definitions/string
+            enum:
+              - pass-through
+              - clock inverted
+              - data on rising edge
+              - data on falling edge
+              - data on both edges
+            description: |
+              IO synchronization through re-sampling or inversion
+              "pass-through"         - data or clock GPIO pass-through
+              "clock inverted"       - clock GPIO inverted
+              "data on rising edge"  - data GPIO re-sampled on clock rising edge
+              "data on falling edge" - data GPIO re-sampled on clock falling edge
+              "data on both edges"   - data GPIO re-sampled on both clock edges
+            default: pass-through
+
         required:
           - pinmux
 
+        # Not allowed both skew-delay-input-ps and skew-delay-output-ps
+        if:
+          required:
+            - skew-delay-input-ps
+        then:
+          properties:
+            skew-delay-output-ps: false
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
+                skew-delay-input-ps: false
+                skew-delay-output-ps: false
+                st,io-sync: false
+
 required:
   - compatible
   - '#address-cells'
@@ -306,4 +359,25 @@ examples:
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
+                              st,io-sync = "data on both edges";
+                      };
+                      pins2 {
+                              pinmux = <STM32_PINMUX('H', 2, AF14)>;
+                              skew-delay-output-ps = <500>;
+                      };
+              };
+      };
+
 ...
-- 
2.34.1


