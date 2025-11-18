Return-Path: <linux-gpio+bounces-28673-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D756AC6A9F2
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 17:28:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B2F05363FC3
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 16:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6494A36A033;
	Tue, 18 Nov 2025 16:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Yx2A58Qz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6500F36C5B1;
	Tue, 18 Nov 2025 16:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763482825; cv=fail; b=HnkcWgjWv0Yf7VayvB3qIkaN+fQcn8NZoh71RPo7z0cVOjbsZZvyEZqX2QI4YieT4GwmRemftCfzJQXZo/ELAjpJxzMX0whPMDIP1PyKNFF4LagzaRUSfnwKGQQDLaBkRledmpq/6gf0WihAYCrLSBb06VeFtWVjKi30LFxm5mM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763482825; c=relaxed/simple;
	bh=6T5/Rn2EFA4QBv1m/UA18PjD32ca0uWLntuikPk1vbY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OFRkOvxGVHIYd5uSyyxS4/jGIS2ncvOjfrC/o26d9WQBNl7WBbS4hwOpdz0vK2kbZ0ZLjhbrDwyYLg8KFDVaqytt0MjaMEXYv/9N/WxWWtIcXSyy5ax80ztaOi1+jDmJc37Uty/52ix41PQlfkMy5dQnZegJR/3ZnZy6VXkFdRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Yx2A58Qz; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIG5iWo4155516;
	Tue, 18 Nov 2025 17:19:47 +0100
Received: from mrwpr03cu001.outbound.protection.outlook.com (mail-francesouthazon11011069.outbound.protection.outlook.com [40.107.130.69])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4agnbdj4bc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 17:19:47 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FuUTvmC+EqeAr7leZHDVOtuxwuDta/i6yf37W+D+skBUbbtGBLDPvCDgAGBgE+BgJ8GS9djIQm5OMB0XreQG7vX66+RjxyE/+BHifWc7tWNZjv66VMCiARkni/z86iVMmoATZAQnlcqphLWFNWlCE+rdCZbUUZlGbiLhFnvO2MPTDPB2cwOyy/cHCYoQkfPpTmYP4L4g3V0jsbSXQUZTeVQS99XD+dDEFj628ADBEJKGNM3hdOnCSDiu9cU8IBEv1/SUTiLIEYNH/EmhZmuPjCB5d+mQ+SR37rrUrZ3Sbb5/WA6z4EB3bTpiOm31MQkyExLVcn7eASt0c9j4AtjFMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FGS0GzljigYbDxMrg1dVAYykPnpZuVNE8+NL6TEHXaE=;
 b=agCHoTKFNYrXw4uqR56BUo18feTXR9+Ug6rhvCJ4pJSV4jXD2er2jBeNoqyR59Fr10wMgVQIYddFcj70WLX9zgNba0MVJZughoJMzKtkPZDz6CZ1zGKzOi/rXnl/om/K/dcQaoYiGSZvLOnjFmngGsS5ZXiSCRVbN1oWO3GTPvAYw75gjaZ8axFTa4azXxGoRrXLw0UNByIDEbyyYSGVn5/gqCzjBcnBzxZUGWY+aUIAhyn2gXUO2937CuAOyJGyGAg0anGivD9QW0NhrvB0X9GrLbTsno2ipH+a5lUclySeC7jevgWgaIT7ooQy15wYkWely6537wgzxcL5lr3F2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FGS0GzljigYbDxMrg1dVAYykPnpZuVNE8+NL6TEHXaE=;
 b=Yx2A58QzmwhEiGoZ+7//3QSkVIDTdVLdavlEiJXkt8ZQCgEtGrTazLwCQwcW3W9vSqNnpzStFvur8yeXZf0SAh9rHh+UUs6+b6cb9nQ/MO/xhrN1Q3FMqLXdshshYGuLEYhiYWr0o6NYCgLZv6s6c/8zoe8vYDXpxQ2iWzY2PF6tMTHHhb7G+YDc5oYIz+w7YIV73m9cioGnyafCytwdXDizfuEZYDOPZv43d3FlGoFh2KxmSEkKswg3KRaTjHsOwz3Jm2UC84l0Jt9OApO1T7n0LbtzbdFRXm63YRTEGT1dTJnfPQjkqkeG3NwiQNJVpGI8ooO6TyVP14y86tFDOA==
Received: from DU2PR04CA0014.eurprd04.prod.outlook.com (2603:10a6:10:3b::19)
 by PAWPR10MB8240.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:388::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 16:19:44 +0000
Received: from DB1PEPF00039234.eurprd03.prod.outlook.com
 (2603:10a6:10:3b:cafe::b6) by DU2PR04CA0014.outlook.office365.com
 (2603:10a6:10:3b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Tue,
 18 Nov 2025 16:19:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF00039234.mail.protection.outlook.com (10.167.8.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 16:19:44 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 18 Nov
 2025 17:19:58 +0100
Received: from localhost (10.48.86.11) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 18 Nov
 2025 17:19:43 +0100
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
        =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <legoffic.clement@gmail.com>,
        "Amelie
 Delaunay" <amelie.delaunay@foss.st.com>,
        Pascal Paillet
	<p.paillet@foss.st.com>
Subject: [PATCH v2 02/15] dt-bindings: pinctrl: stm32: use strings for enum property 'st,package'
Date: Tue, 18 Nov 2025 17:19:23 +0100
Message-ID: <20251118161936.1085477-3-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251118161936.1085477-1-antonio.borneo@foss.st.com>
References: <20251118161936.1085477-1-antonio.borneo@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00039234:EE_|PAWPR10MB8240:EE_
X-MS-Office365-Filtering-Correlation-Id: fb03891d-c1db-4268-0e4e-08de26be4947
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7DC6MpbfycCD4KG0pagAqmpqxjz1Wq9151Pbq0U+B32aYtfW1JIuMPabk2ZU?=
 =?us-ascii?Q?gDjFjjqRwMUVqLMQS1OepY87jiJiHGkGmXCWjpwo7oc7bPD3A9KZikrixzjy?=
 =?us-ascii?Q?mbq1zvEekF53GEM2u1m82lwN657yah2lhAF+dyF01NlMQkUON/EMLy8TLTF6?=
 =?us-ascii?Q?gTHWwpfY9BXjXWlUD+uLv9e9Zwv4wYWMMTj3wPyAMMowjJIxX8vvApNOSNQy?=
 =?us-ascii?Q?MXmbAbaPpbd1BrnZckcyn++kUZXeCVwdMzSUWSrM9bv4RxCsJbfXpvNnW6c6?=
 =?us-ascii?Q?ghrB9RcgoBkGsh8B13LIH4QmU/l2WAdw7koHLYzziVW22SXsa9DILed2+o9T?=
 =?us-ascii?Q?be09Z29zfZgu9IIWytLyyxje4ZDV3aArBXyKV04g456yHNWuoBf+usfmvDdq?=
 =?us-ascii?Q?fvG4LFJNC3mIy7SmT3axWYPbpTyhvlBXZnsZin4WzIegQQ8U4ftItdzsFf/W?=
 =?us-ascii?Q?7swK9NKdJBD8fgKHVWWkX0ejzcYz+RsHgTzvNkv34LcYx3H+L0IU485uhegC?=
 =?us-ascii?Q?rqB2t4wRJwVPzXZjNaBftEQ7lJOKjMJ8b/HWXFiWbhXlgDDd90l40xh2Ayo8?=
 =?us-ascii?Q?52E2UqhoxWEKzjyyofw33y4p9w0CGmAm4pgx1FrAME/LlO6ELHV7quzptAvy?=
 =?us-ascii?Q?77vUdoWUIXQqrrllkCo4rAsQ2zUm7LzlZ63WZzPzE2cDDDbDS/OVDrOHKSU3?=
 =?us-ascii?Q?euSCfqz0m7eUwDrECmqqY1jtt6sxo3z93Gm/KNEYo3mFM6OEN1WsUj0F6auj?=
 =?us-ascii?Q?pMcj6Ja0qxkkL9wicn0ItvPJdkjg6IsLOBb4QR1xy5wS8MsgcioGl4E867Hw?=
 =?us-ascii?Q?5dRrTw6VQ1g/lDqJgnn0vEWgKFsQJ8gSizx07NMXE5RhKYQqfctSxqJdpHEP?=
 =?us-ascii?Q?Bt4+gu4HAZ40S6FcUu1vNfF3Oh+imu/6UipGNN4TSQ6V/PdDa/BVse7lOTDz?=
 =?us-ascii?Q?MRRn7IMfwAJYIGyXH8+ZmJ2jt+DqqwLpmG588/kWlVx/c75CBS8bDWBEA6SU?=
 =?us-ascii?Q?gVowml5+lYFI4pHK7HXOvluBV0syKEVU3OlTYAG6obVHG4UrkffWn/bIP2JY?=
 =?us-ascii?Q?qNbZySmyV8cpzdXJ8dzZaLMAZlAmKvGyL1tW58H12NkzULjWvwUxC+k7dben?=
 =?us-ascii?Q?uMZax8mi+qNeyyMJrTD7fDVIiQIR24yUOKOFRGcnQxecPjhk/AcMLWw/Fwfg?=
 =?us-ascii?Q?dE0tjIwAvvMu1vj35f7wnl1CoUZXXwUQUUt+OSWLYbYYsqQJy8OgpCWkuRl7?=
 =?us-ascii?Q?RMiBEiY28Bothla4fRNrIsiF6gCTRXT1C8KiLxScp6qIMShnmlz6LomeqdvC?=
 =?us-ascii?Q?Gi3Gmdl080E/OpAUT1OyMn6ua8/v7OD7YVk1Iy5SNtZb4mxmLSj4VOgXvGF6?=
 =?us-ascii?Q?xiamM8eZWaYWcg/pHBmInjzBF1hpDs0UssxeE+PiCcftQx/pZuYtxYMQccax?=
 =?us-ascii?Q?bsm5YeK5Exn4rBpdqmmtvoKc+lmqtDhhrKC66IieIFGc3jbzQZEBpcABW2ds?=
 =?us-ascii?Q?mLvmAVSg4ogbYInDVkabj0Z1w/UFnhj+8bA2sV6pl5qgOd93NianwGZ4a/wu?=
 =?us-ascii?Q?VexxgNF8AmsEI7KFYeah/x5Ax/aBUx8o9LTCuoMT?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 16:19:44.7170
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb03891d-c1db-4268-0e4e-08de26be4947
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039234.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB8240
X-Proofpoint-GUID: pZReUTKKhDcVBz7ak6yNW2UMD2oOHuug
X-Proofpoint-ORIG-GUID: pZReUTKKhDcVBz7ak6yNW2UMD2oOHuug
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEzMSBTYWx0ZWRfXwSft9tHXBdwp
 7U/ZJMSUy2+hS03U0BmBmq1NUgyC+zhmDSDESfWN5pTM3OTNBBLa2Ek/zuFyvUNUnviePzgeAex
 lWhlljHzo+MBbRxWqS98Pb7MFmBuTOmnc1g18TPSZI/dict3kaD84fdu4bWdyCZ8bvVQk1CO0Hk
 lZcl+H/kEg4WyeV50WeMDKjI6K+51nICI/zAO5X/JQNg4v/wlUBpmRGnDDEGmtaaE7pJQ6IPtoz
 U//0Omz8RG0ZOcZU7vJUGW5Usz8iHJYBSQAQOFnAqHFEeNUpRrisy5RBXUupyW49DU5QzEsSGnZ
 CMLSGFGuS6ObCeH/rYtuso3rTf01dZjsB80GaHii2h8SkPqacdHxPdfAPo8hTUPOhwCU/ELsu25
 6j2o8S9WsT09xw+ivHYfP/QHnBWv6w==
X-Authority-Analysis: v=2.4 cv=Q4zfIo2a c=1 sm=1 tr=0 ts=691c9ca3 cx=c_pps
 a=NSKzHYMMkvi3OeciOJHNYA==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=456DfskNNfzbJWC3vVwA:9 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 clxscore=1011 spamscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180131

The property 'st,package' reports the SoC package used in the
board DT and is used to inform the driver about which pins are
available for use by the pinctrl driver.
It has historically been declared as an uint32 enum, where each
value is a power of 2.

Deprecate the use of the numeric value and replace it with more
readable string values.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 .../bindings/pinctrl/st,stm32-pinctrl.yaml     | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index 76d956b4a5372..73277f515a8fe 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -58,11 +58,19 @@ properties:
           - description: The field mask of IRQ mux, needed if different of 0xf
 
   st,package:
-    description:
-      Indicates the SOC package used.
-      More details in include/dt-bindings/pinctrl/stm32-pinfunc.h
-    $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [0x1, 0x2, 0x4, 0x8, 0x100, 0x400, 0x800]
+    description: Indicates the SOC package used.
+    oneOf:
+      - enum:
+          [0x1, 0x2, 0x4, 0x8, 0x100, 0x400, 0x800]
+        deprecated: true
+      - enum:
+          - AA
+          - AB
+          - AC
+          - AD
+          - AI
+          - AK
+          - AL
 
 patternProperties:
   '^gpio@[0-9a-f]*$':
-- 
2.34.1


