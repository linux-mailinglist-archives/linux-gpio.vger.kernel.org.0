Return-Path: <linux-gpio+bounces-28674-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA52C6AA04
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 17:28:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3F5E34ED0B9
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 16:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0353136B057;
	Tue, 18 Nov 2025 16:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="I1OQLFQw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA8336CDE7;
	Tue, 18 Nov 2025 16:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763482828; cv=fail; b=KNnVBihfzjf1XuUu7fEColo3DqzeLkeIwNWHgSSbRV+75O7E+iFi1LQTaamft5ckzXydfnAlrn0Nd3kvu2IWtXx3aDG1WdXyPdI90lgC90h1xlyDjk2aYiTLiid+ZZIwWCdTnwqN7aNBdZk7OzBfflN1rYwuvxtbqnG/7wgv5Go=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763482828; c=relaxed/simple;
	bh=ItylcoqJhKOg+0uaJS8iXNFLvygTUMy7eLFG3k8wTd0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AltdSWDQpaUFn2MlgY4OZSIyQmJPKAnRgY2TI18Mr4S/tZb5Q2Gj+WB2cWcpLKJYU3KrGKCbKnSuWal4QaHGF8doA3Ue1q6E20Vb1LWXZb7fi+O8qjxrKl62U+d4AZJmWHtA9jpoOpW93gQc8Ypo/AiQjEMsIr/YKk/sueCdoCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=I1OQLFQw; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIG2EN3076356;
	Tue, 18 Nov 2025 17:20:03 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com (mail-northeuropeazon11011033.outbound.protection.outlook.com [52.101.65.33])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4agrub8vfv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 17:20:03 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VaxzjBypaFqkWtSbxtkzqgOpNocI7lxjB8OtML7f3PY8W9m2QmgW9OBnMOaStXlbtGdXIOYcbtKmLswX8OLpd2Rp5FqEFTfNm+D4uGkA0NGBpb0ypjhnZSw8vnh4cd1vLnv1KGn/ivByOTs1fJ+Lbg4x2f9HylYVXAex4Tn6ZwF7OyO8LX1IsJxDMVJIG7ptZSMILcVL916Z2QkSAjisuTrUbOEEJ4R0iLYt1qnRRsWM+Qyxkx2+IB8CWYnqJEeAIVycRIy7O2XMrXbpjWAw7H7qwYpJrd9hN/7dIyMGlzZ/Ukp4TsROZm8SNKKNTKmNy27g78dIP7ZyQce9E44QlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LGFu3aVP3y/DJmhALtZ00kzlhkDj/MjNEEMPfByrEFc=;
 b=VUq97FsWNc7iLOD1OS/EkL2JRL7GHEP30I86ZCPsTd6R1NUi6D0bCPy2mtlWstAZBYEJTF5ZxFA4QdPL6LGkzzeq2G3TRokQag/0yGQJ53sDNTJWmsmsBtTr0bqM21I0KXDQwqWI8mplxgEbGGdTlYgzQJP2Ltpe6tWJ5DagHHxOMIZPEwGA644fvMqt68fkWXO2JvKfFaB0IIy2DVuYaehFjXP7hmUyqICE5S/WOSacIhsRSW/7DqorQiWxMncV4Y0keGx7eeDaYvwNlOBUoAN5Co2VX4R/1dA721XTskCYvh/+HqAwsxLEM+5gJetJpK6EdkIGKHJTDS4qYE6AVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LGFu3aVP3y/DJmhALtZ00kzlhkDj/MjNEEMPfByrEFc=;
 b=I1OQLFQwp8pxtQr4bkZR0Xye3LdbqI3r4wnEAvAO5hBbey4gDIbqIkrP07eoDS3XUhiKRQT6zH7YuzR1HunAWKKksOBSpQRKfYAxx5oprFhn1+QhpEkOmTtoVGeaWtOKO67Mcrv6o5OBkvP9hz7Zd4c/zqs6LyyWKXadpwoeDWIgtTVocbxlrrN6z6rtYfBBIbg22vLL6ogiUVd+bPYO+crv52GpA1UN4RGuBBlgGJnGmm0GpchTvD/dRbdsrUZ1dSqXPZeahimXtRCOi+y2vPUv9U1z38N6lNDV/MUbEsgc3WFIAdlX5gO6VkX35QFuKuXayOkl+ZBq25eIsRiUYQ==
Received: from DU2PR04CA0080.eurprd04.prod.outlook.com (2603:10a6:10:232::25)
 by AM8PR10MB4081.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1ca::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 16:19:59 +0000
Received: from DB1PEPF0003922E.eurprd03.prod.outlook.com
 (2603:10a6:10:232:cafe::ac) by DU2PR04CA0080.outlook.office365.com
 (2603:10a6:10:232::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Tue,
 18 Nov 2025 16:19:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF0003922E.mail.protection.outlook.com (10.167.8.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 16:19:58 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 18 Nov
 2025 17:20:04 +0100
Received: from localhost (10.48.86.11) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 18 Nov
 2025 17:19:49 +0100
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
Subject: [PATCH v2 09/15] dt-bindings: pinctrl: stm32: support for stm32mp215 and additional packages
Date: Tue, 18 Nov 2025 17:19:30 +0100
Message-ID: <20251118161936.1085477-10-antonio.borneo@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF0003922E:EE_|AM8PR10MB4081:EE_
X-MS-Office365-Filtering-Correlation-Id: a89e71ed-2412-41c8-8b91-08de26be51b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|36860700013|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Qb0Uw+NObkEWCB6x9rPVtkU0/SiWRbb+xfXKGsEsWvaFKOKhidY97ZX+F5mH?=
 =?us-ascii?Q?epeM9YH9vmH0AtVyeAmHMIkYvkTp2u9KsIdcdCSwBeRK1pLsgA9XhaNF319v?=
 =?us-ascii?Q?NeqZF6dZJb92yS3SwRLEDhUL0c8XLqn3Q46BYQv/EmnN+nyoKUZFsfPvXgtW?=
 =?us-ascii?Q?t3e33kgrv0KXTdgRc6kXwXJ4avjodLkZNjbFhMIjvwS/lbXESQGplRWA7qvB?=
 =?us-ascii?Q?wxqarFNcaz1nH9bbF3SE1ifUXK/uJrfkcNl/WOoLQkgZJzI4c4oE3eFQNNtm?=
 =?us-ascii?Q?pkhcQFODrxFhLe3m9WNV1NfuyTwMX01YcIc6XdFHN1nCDr4j6n5u7wRCTPiF?=
 =?us-ascii?Q?lmubc4GZ4RQU9WzJY5TX15wNK6eNdvFOopxetivvNeDknMJCoINcKZ5QlFWK?=
 =?us-ascii?Q?EEfoZnTvTz6HaWKsi0Hm1dGU1f6RnlXCScvm/wDtaNF/9oOXIcz+QkVnyS5v?=
 =?us-ascii?Q?DpBPfOkbom0gZ4PLHaWE8Necsta0h+04O3fUIW+6Yo9L5+Q5T7YfJJ7p0V3r?=
 =?us-ascii?Q?mRuI1pXCewIdn4nG8YxWm8TshsE15TecPna+8oyfTRDj2ye+0G/bF0jUaR35?=
 =?us-ascii?Q?sD07VfvUXG/OCd7417HcrWDHEwGQT3+tkzN8P56OgF8RYiGoxfp7GWpVcAUY?=
 =?us-ascii?Q?/K85ZiEGxWVtpxhPAskJT1o9q6gZHjHga9OHH/aJT3xw82MPMsxXidJ18zzG?=
 =?us-ascii?Q?bo5HYfT2K4sbSbv9EYXpm/4wDv5JlMxfP0dnY63VyT5A0VTCWUGlBYj5sW+w?=
 =?us-ascii?Q?MSokwOr+xnmiAg730Nf/AsHR810gkS/7j9flRAC3gKzYgEm/PE0K8ejYgDuu?=
 =?us-ascii?Q?8prlddmqN/lAi/w1fIvScoeFu+i73LP7rmeifJZzrTFJv2vMvuiYG8Lqxkvg?=
 =?us-ascii?Q?Ow6Q09R3Kz/f4Xosni+FtmE1BpJ3IW2WoYDDb4kS4/pY+0nGEML5RVZZ5yw4?=
 =?us-ascii?Q?jeaMGidMHnSGiZhzUWH4La7C30fH3tRc0g5Le27lYvVbLrjjBtSBRMvTfzDT?=
 =?us-ascii?Q?sTetETW3R6S6USIDR2gK7rPzgJaMsy2r+PXwZZq6F/wmNvE9pZpX/Uev2Ciw?=
 =?us-ascii?Q?3aCO/l/jASlbYXneXXYthcUAQVDZIGyHKl/C5PqVSQE4F9g88hyiz5HJS7tt?=
 =?us-ascii?Q?3kEFUTV319L4pq8n8oWawyAvD5KBH1oebsbrVz+aRtMcCIVOdOWVDj5v3WmI?=
 =?us-ascii?Q?E+vnh2Q+bfuxI5crGWZ5JUdPma4NhEs2hX4u0fypV/+Hhm+zY4SYUBsGooxN?=
 =?us-ascii?Q?smToaQptd5Esym/cnERLM1yX6XMKluw5/11gnjdDmSRcew0Wr+ntPiYOjcf5?=
 =?us-ascii?Q?VmVh9Xu3R+Jz/IO4jj+ByxhTA6imYpZxMTOqWcmtUpbWHWRCsO0V4+/qtPJo?=
 =?us-ascii?Q?6ZD/K3zoY4KJLXVxr2OQ7AqrKOlIX/TAojVezqZ33uxPjKTRV81d1caQR66K?=
 =?us-ascii?Q?Os5BqlEy9XYAFv5vXJR48PUqIQNYwX1M59V2xWu/YJcRQOgLsk8MgyZAnsyc?=
 =?us-ascii?Q?qfT1nHbaeCqz6QYceGEOXnRmA1kM8ZJEmqP5ypH+gqgK1TV3uc8QNtxcTjUF?=
 =?us-ascii?Q?He2VFAHqkPoDv2CJ2pmBGNGGPZS1AahYBaTh2jO6?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 16:19:58.8304
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a89e71ed-2412-41c8-8b91-08de26be51b2
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF0003922E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4081
X-Authority-Analysis: v=2.4 cv=LKBrgZW9 c=1 sm=1 tr=0 ts=691c9cb3 cx=c_pps
 a=pBObNCbZZWdCwjyidvzzAA==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=xqCuHB6n_14x41okXgkA:9 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: FJjvuSSzbbM_5SvaGzn8biiS4WPCI6nP
X-Proofpoint-GUID: FJjvuSSzbbM_5SvaGzn8biiS4WPCI6nP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEzMSBTYWx0ZWRfX015kZWjqsk/n
 XTUO1drEBRHhErlGXSG/9CeUlDrrAnjjRp05XIiD4vRNzNJ9uvSvoXqMq85mZxa3m6Q3JcdhhLO
 /T77LnOOinRnJv/lrJ4f4mauaHzqqquPmrFQULhnl1MIyJ9/2Jn2S3UGSXOhub/LWp6ZU7H6QEM
 1ZxT81l1j7iaf8z4dnQv4XRA57tNzIXjMYbYDGA1HqPUfdDJ5DGW6uBBGefPJd3YAwsdeR6TPYU
 eYXtrPH6ziGnRMm9G3xv/41HkuUU2JAmglSumNz2U2gFTnO19aNb3mioOChX7FLkVkXGhug+jh4
 yfevqyff1sdwh+6+e2vT/WCHVE9nzEZ92LHi7UF25INtx9P7lsuKlRJNHQiTVLNUa0KiGxDfUnh
 +Vq2NnjBuf4KjZQ2D/OC6E/BZ0HiEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180131

From: Amelie Delaunay <amelie.delaunay@foss.st.com>

Add support for st,stm32mp215-pinctrl and st,stm32mp215-z-pinctrl.
Add packages AM, AN and AO.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml      | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index 27e1efee13481..3bd1ecbcdbe50 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -27,6 +27,8 @@ properties:
       - st,stm32mp135-pinctrl
       - st,stm32mp157-pinctrl
       - st,stm32mp157-z-pinctrl
+      - st,stm32mp215-pinctrl
+      - st,stm32mp215-z-pinctrl
       - st,stm32mp257-pinctrl
       - st,stm32mp257-z-pinctrl
 
@@ -72,6 +74,9 @@ properties:
           - AJ
           - AK
           - AL
+          - AM
+          - AN
+          - AO
 
 patternProperties:
   '^gpio@[0-9a-f]*$':
@@ -276,6 +281,8 @@ allOf:
           compatible:
             contains:
               enum:
+                - st,stm32mp215-pinctrl
+                - st,stm32mp215-z-pinctrl
                 - st,stm32mp257-pinctrl
                 - st,stm32mp257-z-pinctrl
     then:
-- 
2.34.1


