Return-Path: <linux-gpio+bounces-27547-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FAEC0174D
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 15:37:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C53113ACC69
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 13:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21FE33451CD;
	Thu, 23 Oct 2025 13:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="c+3YJsYK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F03328B68;
	Thu, 23 Oct 2025 13:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761226076; cv=fail; b=Yj3DgGi8btOX9zwZLCpDxp7xePIMmQzvPnmRhafXBNvjNb1wYNDLbF7AM4NR3VKwMatyyU3r0fPMRx0bZrlIjbChvfwgZG5dY/Ly5zVtwCRL0q4ECLwpGxdYJggg5bnzrUT4fx2HtgYaUGQiJ97qHZSxveelFIY7BF66oobe8aw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761226076; c=relaxed/simple;
	bh=Vbj8IZCK9IRBHRfnoYqYQKvwv3QZvxk0w6nMlw8DCHo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N0OUqIj/YdVxxcS4OxTq70ZXTBCZDy7z3zfwp4utLSFXSF9USF759+UZgrBRoCLzoqa6+DY5M9lUBKrTDcmmrW0luXp6FoEhN6gKksMau0qbPFQYal1jQbgYJUb3G1qjfd/GgZ9MKI2n2PJU0fCeAqGVMqXnOUktlfbApwOVQAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=c+3YJsYK; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NCiCpo020097;
	Thu, 23 Oct 2025 15:27:16 +0200
Received: from am0pr02cu008.outbound.protection.outlook.com (mail-westeuropeazon11013027.outbound.protection.outlook.com [52.101.72.27])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49vnummyf5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Oct 2025 15:27:16 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PxMdEUdCs981TZ+f2lIJQJXuEK4I5T+jSRXilsyzAIT+ajDMVi0oT2MyndiCmQaYmjUsxMDoyT3jKPLYdiKdO7yMB1Lt/hit5f6YTN0mFErxjmItwUHkMCfWn5QalfUsTPvqDcJXzDs4DO3jaEZM+mnb/Wkr7CPhtfub2t0AeIY8q1fLIO5kMI3VpE1GY5PhpJ8u4G4sJEdDaMGTcVah39UV4UrK/ETQYVfmy3AFgo3nUknGdel5sFFToEUDgJql52PdmDqK3djgR1IXYbaX0248nIcFrWMFzTR+ZhFMmaVF5v8wEmEiHFyQH3/N8bU3Ox+7VrOhl1H4Ify+KxWu1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L7khND/x0XwWgNWsJnrSzt4iKDswt45U3PGjagR6zG8=;
 b=tN7RNksNQPFUhPAFYa/I6AJZ2XcK76BiZ2i6MKy1tyt7WIswP//qurkxyFD9nbSKWenMHZmplp8Xjm6jkV6woCGJBDUs407wKhOBPe9p278SCj5ZvwABAS7Evk9AG4s3CIlpAqzV1IkKMs7LtY9DZ0EqvESZ23wMekNUIT9d+e7fqGsKKNwITgkrfYFiz6948AlQcvxoLdFYu3ns56chhYUykrSWW5gg3POWdJRsduJn2T78wMAdEojSWsrsgNYY3qL4BDTXFwr4TJYSH7BWN3sWXXozzZwSkc4MjQ+zwHbJaqo6PSNB3SXUXPFLC7HHX0RjCE+VDEuCoYQA4RtyPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L7khND/x0XwWgNWsJnrSzt4iKDswt45U3PGjagR6zG8=;
 b=c+3YJsYKzMSdujKdx9MWBQivOyAgCzQrr20l+sfPjXM+6PdocvbrxRFZd8sIE0rfAktWlqzo/XGiPNDJZQXZ2A6zyQWsBg7RpCYlA1eQX9qrgRlunJAv5bbPktPSDBSSQjpgV+YUYE659CkKDK/vF6NeSRoell7TTh54nEYs7cxv/6kHQEkCMar78QTXZvkF5VrtSNh0/Ky1D9QUm5pjsQLdCgM0r6VTdhTQxfw4Slmfl5mObbgU0XP5RLKeRO6hRRV2qGi9pLJWwZKYQpEv0hLx6KRULf4OYSNqyQMwfKeENrMJZ2CBNMxkVMseWHSMmnaqurEN8XyqsDl7jwttlw==
Received: from DB9PR05CA0024.eurprd05.prod.outlook.com (2603:10a6:10:1da::29)
 by DU0PR10MB5244.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:34c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 13:27:11 +0000
Received: from DU2PEPF00028D13.eurprd03.prod.outlook.com
 (2603:10a6:10:1da:cafe::73) by DB9PR05CA0024.outlook.office365.com
 (2603:10a6:10:1da::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.12 via Frontend Transport; Thu,
 23 Oct 2025 13:27:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DU2PEPF00028D13.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Thu, 23 Oct 2025 13:27:10 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 23 Oct
 2025 15:24:43 +0200
Received: from localhost (10.48.86.11) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 23 Oct
 2025 15:27:08 +0200
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
Subject: [PATCH v4 07/12] pinctrl: stm32: Drop useless spinlock save and restore
Date: Thu, 23 Oct 2025 15:26:55 +0200
Message-ID: <20251023132700.1199871-8-antonio.borneo@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D13:EE_|DU0PR10MB5244:EE_
X-MS-Office365-Filtering-Correlation-Id: ddb00b03-c941-41d4-b1af-08de1237df15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|7416014|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QJyqS1gG2xosLMgOjnr3iva6BlrJC+rCaK+u3s1VDArbIaGdpqayHFBIMVFv?=
 =?us-ascii?Q?0iKjFkZt/GLbpsi+BCxonvQabTzodtFE+wG9KPkz36tWjnhvlHd4J2prMr8A?=
 =?us-ascii?Q?mF4f+HEluhlIghK8z+gUjO8utdwbi5DGhpeL0D87gqZU5QnwxaAo7Jp2Vo3F?=
 =?us-ascii?Q?4IDmy1Zs6Wy1uVLvnSxxatwXZo8ZKwpTgw42Us5pSeYELYPSiehiSgzJjBih?=
 =?us-ascii?Q?8hHSDpJhTcZLvwHSu1dGr+q/30znTTlgP7Xf1b/peB2WnRtbwCCD16aTXhI8?=
 =?us-ascii?Q?vQKKZePMHue/Czknq4cPQ/kQz5Rc3nzaBDnVA3Fl3Au/akADDI9ktti3HvFv?=
 =?us-ascii?Q?4tXuWpab+Cq+09P7Q9+DJ4VLXaDB2zf8aUSuJy3yHUNXPcihRLke0XvXJDGO?=
 =?us-ascii?Q?uInTlPV6PCaTJg+UWfCGbIIWLEpPeRJQWcyty+6ylHBMT6SHGaK71j/ZaVj8?=
 =?us-ascii?Q?mTuUf0mHTrH+Wa3ZYrxeObwg2FHBbLHtNBGCS9Zj/MMArgL/8iR7CMm9L3nG?=
 =?us-ascii?Q?fN8H9Ay+TMFJ1Y0JZE8ubIHQwVMC/XwXflgv/eDa7qgPH4sTyNKbA9AJDRtH?=
 =?us-ascii?Q?NvOcJYpsi05a0TunB4DPC2Y9wNA69j+Z2r9+UwX3sNx9vCrP9DLkFidsoEkA?=
 =?us-ascii?Q?4zsvK8lzLeDbZZWLoxu/bJ6C2lSFI+jJNRKTMMGzhUmV1iERtFWF/oFQ2ESN?=
 =?us-ascii?Q?10CJSD23ptKwMz3FF6GDXWcDfHhp31KSvfyMChjkWAt04uxRjojb5u89Clju?=
 =?us-ascii?Q?T5gKjR2iuyGWBKsgxW+l90PbgO/HXwF5pyafmB5wfdCkb9y0V65Z/a3ftNy1?=
 =?us-ascii?Q?HQFpTfFvkS+yYzz2ilCsJW1bi3RzGk7dH8O6ino5jRkxld+N2C1g9Wi6HyfB?=
 =?us-ascii?Q?lMFuRYXdENlhaB5LDY3ZoH7hRhNjgnviHAJZEV2EhNX8Hx4C3OiXCRd6XfRZ?=
 =?us-ascii?Q?81MF0hHbg6hs3RsHHMFfpjrArcRRoGwISxL/WKk5y24SC6fW9t+T7lL/T9gw?=
 =?us-ascii?Q?MhrtdhZMp1WUHA5fznrur44/YbtCtQmCCifm4NOtIl1PMIX3Lv5NTvlWhqIV?=
 =?us-ascii?Q?7LfcO68GOxqKttY/vwOUjYcV/sF9gWkOMz/iHGbeS8XsV5CiZrvcksyPmRJ2?=
 =?us-ascii?Q?C8sAWIKWHAogW0x8FUkL/zRCssUYtT9qnVNL0n99bVfgrUKgxFBN581sI/HY?=
 =?us-ascii?Q?dCEJsJ8FVn4uXW4dN9Nb7kWPh220RDAXwDSS6p9mKA/SzMZGZ0Ay+7ia5zAr?=
 =?us-ascii?Q?46ppK5PAxJIlRTwUqLOFf5eZ2e2dCsiNVviwMp1hgY5nvhtjHfkI/eLr5JFp?=
 =?us-ascii?Q?w18u3qU160owVPL1wvlQGirOoZrAeSBDE0Nvd0v6bJrBksKQw7ATdA0rSHgU?=
 =?us-ascii?Q?n7K+7V4jsaywog69SeAsqoj3bo6bfgtxRhq77uRcLHNBsJrEYwxHQJhSVDlb?=
 =?us-ascii?Q?4BPwMKEqmTi1GyaQoKH2YOl0mjXqtHiRmimRpFmEVIwICsu3AlS+umeohnWf?=
 =?us-ascii?Q?nqW9jfPbqvfnKNyhpAjP7JqLaYaAglUgYDsxMLf+De7BVkSBo8Y94CPJVRQa?=
 =?us-ascii?Q?HzNVrghXUkUbXQ0NCkS3uuwRpONy9zLqaJKNQoEq?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.43;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 13:27:10.7362
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddb00b03-c941-41d4-b1af-08de1237df15
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.43];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D13.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5244
X-Authority-Analysis: v=2.4 cv=Wt4m8Nfv c=1 sm=1 tr=0 ts=68fa2d34 cx=c_pps
 a=FSWwXNwdXUhKkoWDRrz1EQ==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=HYu-Q55BAeZO7lAW1c0A:9 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: n5dD_brxRVESL0cW5Wfle-1vtmpL2_bB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDAwNCBTYWx0ZWRfX+uKm72MA0iI5
 BSSXSJtdclP73CQcn8fjI9RVOsrUebmFEvmSPMnXYSeleaREwIO/tH40hwulcLA1p9Y3+kk9BXV
 byIdjDanILaA9bLfMuKD1W/LFvDr7F1SN3bzSEeVaNbrCT3pHkNtRYoKWRUjVGH6+t91OcRTdbb
 Wb41QZlSBLFFudFvUaPDnyAv3wB5gB4TMiXkyMNvMb+CmwarislLGrTJsGqJWHW5okGp204WKA9
 EwKRkSCurrQiRlzDZ3+1gyUom/l0zasIU45TzoJ4E0XTi+QZsZ2ILBy3EbBYusNqXKelxmBHjDp
 vnmTAzG0vyMCX4bSodHswuzJ0xY4cRNGYB6Ashil2GFVkNyZeglN9snx1NDFfGLXkLbMmxdAUIi
 MAnbOcXjmshIpj7vCOxpTAYFDjlnbg==
X-Proofpoint-ORIG-GUID: n5dD_brxRVESL0cW5Wfle-1vtmpL2_bB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 impostorscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190004

There is no need to acquire a spinlock to only read a register for
debugfs reporting.
Drop such useless spinlock save and restore.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 66f9783fce862..7175328d0df0c 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -920,9 +920,6 @@ static void stm32_pmx_get_mode(struct stm32_gpio_bank *bank, int pin, u32 *mode,
 	u32 val;
 	int alt_shift = (pin % 8) * 4;
 	int alt_offset = STM32_GPIO_AFRL + (pin / 8) * 4;
-	unsigned long flags;
-
-	spin_lock_irqsave(&bank->lock, flags);
 
 	val = readl_relaxed(bank->base + alt_offset);
 	val &= GENMASK(alt_shift + 3, alt_shift);
@@ -931,8 +928,6 @@ static void stm32_pmx_get_mode(struct stm32_gpio_bank *bank, int pin, u32 *mode,
 	val = readl_relaxed(bank->base + STM32_GPIO_MODER);
 	val &= GENMASK(pin * 2 + 1, pin * 2);
 	*mode = val >> (pin * 2);
-
-	spin_unlock_irqrestore(&bank->lock, flags);
 }
 
 static int stm32_pmx_set_mux(struct pinctrl_dev *pctldev,
@@ -1050,16 +1045,11 @@ static int stm32_pconf_set_driving(struct stm32_gpio_bank *bank,
 static u32 stm32_pconf_get_driving(struct stm32_gpio_bank *bank,
 	unsigned int offset)
 {
-	unsigned long flags;
 	u32 val;
 
-	spin_lock_irqsave(&bank->lock, flags);
-
 	val = readl_relaxed(bank->base + STM32_GPIO_TYPER);
 	val &= BIT(offset);
 
-	spin_unlock_irqrestore(&bank->lock, flags);
-
 	return (val >> offset);
 }
 
@@ -1101,16 +1091,11 @@ static int stm32_pconf_set_speed(struct stm32_gpio_bank *bank,
 static u32 stm32_pconf_get_speed(struct stm32_gpio_bank *bank,
 	unsigned int offset)
 {
-	unsigned long flags;
 	u32 val;
 
-	spin_lock_irqsave(&bank->lock, flags);
-
 	val = readl_relaxed(bank->base + STM32_GPIO_SPEEDR);
 	val &= GENMASK(offset * 2 + 1, offset * 2);
 
-	spin_unlock_irqrestore(&bank->lock, flags);
-
 	return (val >> (offset * 2));
 }
 
@@ -1152,27 +1137,19 @@ static int stm32_pconf_set_bias(struct stm32_gpio_bank *bank,
 static u32 stm32_pconf_get_bias(struct stm32_gpio_bank *bank,
 	unsigned int offset)
 {
-	unsigned long flags;
 	u32 val;
 
-	spin_lock_irqsave(&bank->lock, flags);
-
 	val = readl_relaxed(bank->base + STM32_GPIO_PUPDR);
 	val &= GENMASK(offset * 2 + 1, offset * 2);
 
-	spin_unlock_irqrestore(&bank->lock, flags);
-
 	return (val >> (offset * 2));
 }
 
 static bool stm32_pconf_get(struct stm32_gpio_bank *bank,
 	unsigned int offset, bool dir)
 {
-	unsigned long flags;
 	u32 val;
 
-	spin_lock_irqsave(&bank->lock, flags);
-
 	if (dir)
 		val = !!(readl_relaxed(bank->base + STM32_GPIO_IDR) &
 			 BIT(offset));
@@ -1180,8 +1157,6 @@ static bool stm32_pconf_get(struct stm32_gpio_bank *bank,
 		val = !!(readl_relaxed(bank->base + STM32_GPIO_ODR) &
 			 BIT(offset));
 
-	spin_unlock_irqrestore(&bank->lock, flags);
-
 	return val;
 }
 
-- 
2.34.1


