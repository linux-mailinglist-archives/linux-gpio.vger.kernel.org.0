Return-Path: <linux-gpio+bounces-27549-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFC7C01758
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 15:37:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DDF13A28D1
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 13:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 530C232AAA8;
	Thu, 23 Oct 2025 13:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="EWddmuO3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60668328B68;
	Thu, 23 Oct 2025 13:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761226085; cv=fail; b=CoAQKX04RfiSIdg87iaQjSP2c4N0kxAqXLuv9cbVjMTI8gvVA4kdAT1xOTW2nS+oFy6lphWvIcKMs7ryjcfSOI7Ru5oeS2Su4gRBgYz35mNc2RTrgyw7X+Nk6rbzf7zOpvzhRTuCAvb2m9ljT758Ky0WJKQwo0XTeUmB9uPDEoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761226085; c=relaxed/simple;
	bh=FtHuMcELrLv9gYiO/2OWBTreXMbWkUWvtmZntD7RZt8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FHRbA2hY1x7SgfBOglN9jXvZqAqA1HoG0w3yMcbtoJ6GWQl3bO4uaesXwfefKw8Q5kkgbXxA7Yu88182ZI9VU1rsYXEvkD0mSggy66FEyYKFdPsXg1GhQbyW4LlcQcJ+fGnA/wJ5VffesveVhXUaa+ayrMxEV71wTOnTnnt7QiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=EWddmuO3; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NCnw1c007459;
	Thu, 23 Oct 2025 15:27:11 +0200
Received: from du2pr03cu002.outbound.protection.outlook.com (mail-northeuropeazon11011052.outbound.protection.outlook.com [52.101.65.52])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49xvcxp5vr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Oct 2025 15:27:11 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z06V/wEYBxoSZLxMd8CS5pkxc9+kJM12oCMzD/CW036gn0eEOwc/0TSTjLORZnCqr58pIpMuJq33ckRKear2qr4zrUNBqIiJGVIAVyH8Wd9tXj8ohA8ZG1yFpUNeR+Y+zl/BlJ9pYQ9KIbsj4rqqICTsYXKptzpd3mmNuaMlvdvGm0l7W8h5YhviGvOMjfKh449egbMbN3AmL8Gl8gVA1mQ2N5v0+uQ8W1dwADGbQZchBWuDg2VllizerexEXltUsOlyxil3he7aFWjGAicA7tsicQq3uOJW4IZ0KBOr5cxv4AX8owymzcyICROQZITney0a6cKeciHNHCmMA1p50A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QI8nDgPijWs72g7HB24wSBD/kpul0FZmWjlS8Es+JpI=;
 b=btH4DRkT9GJnlT8ZWed4n/K1adj2rbCAowtXskAVqYDmNir1pclX++dk289ZTyZP10xsdh+gWHiXyMoi0Cz9jDfXOlVukncJvtWmk4wmTpV61lfQswAiiuHcm5GVBh/cYoJcVE1aGi8xyPiCo/LB+hWTc96q6m5Qq+lNrSNaOMvBbdgp7gE13UbOE8x9K+Siep3ueVIjWCNBe54r6mXiZMW7ykv/T6Yge92ZkJk0oo2rBySgzScFnyLcqpByFjkXDFijKmGfKl39FMRvn3OihBmb9J9636j9Jdr/0cl4nGqKKn9E2plpVts2z7EGo2fJHvYVjtmrtNUo0NId6IRfEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QI8nDgPijWs72g7HB24wSBD/kpul0FZmWjlS8Es+JpI=;
 b=EWddmuO3NLqe42R7yshBGP2ZILJfuPF+en/Skb1mms8v3VjGhO68pt1uJVBwGui181PAHA3djcHx2N76G+Kf9BIcZNEet6V1yZ1AHz17fclK66UwmFS/1nZyKVPHvLAD0Nre+1XRjEGar1QcSEh3d9WdotoLuCWkIaHSnhL3Ac2+8qkKyMgCEIWFc2bw1UpY/EJS/nKJwRkJfnBvlGl7OiBFmYysPKzAEav9VZqAxPqI/RWMfAyBRistsKWfvuwtbuV9RD5NB6fpdI0t23EZWKi+eA7XnPbagKmD6hunAkVeNgKJP3f2DLFneo6eYjP3u/IJSzM4N68epEky1a/kLw==
Received: from DB9PR05CA0011.eurprd05.prod.outlook.com (2603:10a6:10:1da::16)
 by DB8PR10MB3308.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:113::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Thu, 23 Oct
 2025 13:27:07 +0000
Received: from DU2PEPF00028D13.eurprd03.prod.outlook.com
 (2603:10a6:10:1da:cafe::f6) by DB9PR05CA0011.outlook.office365.com
 (2603:10a6:10:1da::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.12 via Frontend Transport; Thu,
 23 Oct 2025 13:27:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DU2PEPF00028D13.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Thu, 23 Oct 2025 13:27:06 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 23 Oct
 2025 15:24:40 +0200
Received: from localhost (10.48.86.11) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 23 Oct
 2025 15:27:04 +0200
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
Subject: [PATCH v4 01/12] pinctrl: pinconf-generic: Fix minor typos in comments
Date: Thu, 23 Oct 2025 15:26:49 +0200
Message-ID: <20251023132700.1199871-2-antonio.borneo@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D13:EE_|DB8PR10MB3308:EE_
X-MS-Office365-Filtering-Correlation-Id: 78834f76-b292-42cd-c806-08de1237dcc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|7416014|1800799024|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AMojw9BeStcwVHwmm0qemw/OIdKYEMKq4K2PN3rHv6oIoQ2O9vYwLtjxCnml?=
 =?us-ascii?Q?tbjIxM43YtmNmmtlOTsNadaNblqYLEpdZqd8GZVY02u6vaY88YRTXZeqGahK?=
 =?us-ascii?Q?aJjjPyITm7MXTQ2HrwOixeor4frjN5FUs1D2sOkfBV+6qC7i6HZTUOMJzZ5v?=
 =?us-ascii?Q?cGE4obROST9lcri0QClEakygqIqywQc5Ca35j6aBAKXY3fmuf3uWmLsAJ1O4?=
 =?us-ascii?Q?fHFFgxeAR9WR0I3GJ3YZUyEUNo5Dl0RY5yUl92sePbBUhVcyWEXcUIjYfTdF?=
 =?us-ascii?Q?krTu8KlN8oLXyOrUgDABuOFNEKBruV+A+s2eqXfUbsrxThKmQv+32IuktFkx?=
 =?us-ascii?Q?QETo3qLb24O+Y+0vLon4SPs6RKIzyf8Gy9G7vbNCmowTF32sF+EjddSxNhTX?=
 =?us-ascii?Q?nCPgLcnypbBfhSaPW1PaUcX2sggsrgm6MftPayDvVaV45ldxG7uawv0qTjCv?=
 =?us-ascii?Q?G7KxHwxlNKBsJ2xhl7FntLzl5vEg77AqGbQZ15CIyajcv6AcTpEu9/miqGmZ?=
 =?us-ascii?Q?zSg9SIim6WCU/c17h052fjxzqBYh/5riHX1DVdtGeHIL6p1siY37/8/7iufI?=
 =?us-ascii?Q?sYyU3APOjHf3l5KRsKix/VQR+Bqo/QIgFCENjVdyCFR6YAElOZuvNyADnzY8?=
 =?us-ascii?Q?AKiOabvhHQFe9yUaRBN33xS0oBjieMXEA56/n7kGkfaS8zu7dOXXeAh8XyKP?=
 =?us-ascii?Q?v7dLLUKPNHiBAMCWoO78SxkhvnQ9vlh6LCjMDFqpTkp9Sj/A1Wv12hKt3OjK?=
 =?us-ascii?Q?pYHkenGCWdZvjpGu4ftf0QZaFepvwbBMOlZNyIvDzP2uv1SMrKIHKes4ObMS?=
 =?us-ascii?Q?8ayAH6Acgo5aoQw9W9f/yLuT7fzWOinK4+eqidApBrIqd5aQ0KIqbM/W7Tzm?=
 =?us-ascii?Q?eqeuK03X5x6oYPbDdQEeGDSa7Mn4cGThmCTGHKdFFVN3cBeD7GrOKc0RaEIM?=
 =?us-ascii?Q?TSuqCdzQA0Ce+LvxFD7e4hvaSypQYvZNwx4NQCTq3sxn5KyQUgu/VUC0axbO?=
 =?us-ascii?Q?H9LsAm2eFl4Vlp+EOgMkIC/HUdB2gZD/UrOiFyx948CcwsVX7rFCZnWwm29j?=
 =?us-ascii?Q?QdpnPZHtdOruigdTemSgd31AXbcaUwKenBEPjzUCrAU9x52NPgNYHiXXdkxp?=
 =?us-ascii?Q?Z6BPrTgGozY9ACF2m8XL7Bjy9dIVmedKEmSC7LUMdKlHgd3Ns6UuQIYqDru0?=
 =?us-ascii?Q?h5CBeuAw7q++c6PmSIPB/EtcqeIxw5vn2mZUEsoUvMFMd5WtPRjyrs5gptTC?=
 =?us-ascii?Q?dEwkT+7dDsVFZTo/TBMhG8gRly+pmhPhc7QC8wr24H8GXkEXQYi09IoN12nP?=
 =?us-ascii?Q?0s+NVX3/QGKbJsDCfpjbnpGTCt0m1sGBmOzsUeg1f3U0uorTwIxBITKJ2NxN?=
 =?us-ascii?Q?lOj3Nskm0KXsJAKim/Zs6zFn4ufBWUL01WOPUk+Z/STMrtRMl/bDv1AFRICk?=
 =?us-ascii?Q?0Iq4nJWRg2A2Yqwwan2gwc1ug+TTwcU5DJcLg01q/98zM9s5doN0UCc7+Jmn?=
 =?us-ascii?Q?7Bbu4nipoRJ3cZrZPTqZ1TgNk7QkuJnlPWPVN8ptaEz6rvKYUKS02JBmFvAj?=
 =?us-ascii?Q?fVMe5SZLwa89INwhgCXlloZMGIDPr9rGN4+nFoop?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.43;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(1800799024)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 13:27:06.8731
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78834f76-b292-42cd-c806-08de1237dcc8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.43];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D13.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3308
X-Proofpoint-GUID: 2M_AwfDwI1oWYJtUd9pReEARipWnDpKr
X-Proofpoint-ORIG-GUID: 2M_AwfDwI1oWYJtUd9pReEARipWnDpKr
X-Authority-Analysis: v=2.4 cv=RoTI7SmK c=1 sm=1 tr=0 ts=68fa2d2f cx=c_pps
 a=t+Agv/4bEvHkrKSCpahcKA==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=GcLWqdTLnVYnHUTHeZEA:9 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDA3MyBTYWx0ZWRfX8GlJE45GBt/D
 y02SARTcYsNREfFlapX1HMhdlrV63qOeXHBefflF7XOwsMSPIe5gqm8ksCC/p9zl4M8DO3odlXK
 svVbi9jWSG8OOk+cRC26lEPjDw7mpE2FNGAuAYyaZIzj/biDCEgYGr38yN/YSkTFl0B4ZqXiYis
 4z5w9jhUAzzODN+lL9jTg4VT4fHja4xAIEet67xTUZscnzodnLw8fJ8YacLf7IYHThJB+btQj4K
 BywgG/C1Fr1qv8mHKckBL3gBb9ZVRhDVsAgxBwWm5Eta8TaLTUXhbCio0l8ijAJ1JFOrGRo/SxS
 yTz9B3svkOlCy+mbcUr3hQ2z4gTU9MrMIvag15EwyyTZhGvTZlGP9+3WnhTLcf6yqdD1iWZ/HFb
 qoEuxGz/RQ9y4XqPu/p+LVXTWJddUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220073

s/specyfying/specifying/
s/propertity/property/

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/pinctrl/pinconf-generic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index 5de6ff62c69bd..e3d10bbcdaebc 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -104,7 +104,7 @@ static void pinconf_generic_dump_one(struct pinctrl_dev *pctldev,
  * @pctldev:	Pincontrol device
  * @s:		File to print to
  * @gname:	Group name specifying pins
- * @pin:	Pin number specyfying pin
+ * @pin:	Pin number specifying pin
  *
  * Print the pinconf configuration for the requested pin(s) to @s. Pins can be
  * specified either by pin using @pin or by group using @gname. Only one needs
@@ -242,7 +242,7 @@ static void parse_dt_cfg(struct device_node *np,
  * @pmux: array with pin mux value entries
  * @npins: number of pins
  *
- * pinmux propertity: mux value [0,7]bits and pin identity [8,31]bits.
+ * pinmux property: mux value [0,7]bits and pin identity [8,31]bits.
  */
 int pinconf_generic_parse_dt_pinmux(struct device_node *np, struct device *dev,
 				    unsigned int **pid, unsigned int **pmux,
-- 
2.34.1


