Return-Path: <linux-gpio+bounces-27538-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B408BC01762
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 15:37:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FB1F1885466
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 13:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0970E33DEF1;
	Thu, 23 Oct 2025 13:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="bBZ6zbSM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AFF3195FE;
	Thu, 23 Oct 2025 13:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761226045; cv=fail; b=Jz2+3oa+7ZcjIvLz79HXPrdDydX31TxBmp3nhcfMxxyl1bIUNK46zssMo9/QmP0YqdGh5eeHRZWUMjrjWRhkNKGg/In1xpI9pTr9H2/m30zMnwlQeRDKMDto8axTLZQ4c0jeLyjXxqh1Y4GEbAwdzUMTERplxjhIUyVLBONhPTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761226045; c=relaxed/simple;
	bh=A2/6MUKyHm1Aj5/TbeygwPWiqSMZr0MsustJSdhAl4M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BjwStjW9F7Zl7tZm/aNsNxqI/9oP8+7ZP/8MUrct3TBxys/5/U4iMvFYqn5OV7dWhhvCUo/jzLNtFP3YkN0ilFQ/wenlz/f+suQ92crsoHk0H4pbZif33OwHsB56we2TGsxcspaf60EXcO/vg6/MXZsDsFTFP3xVZgDn0FY3HlE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=bBZ6zbSM; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NC9GgM023949;
	Thu, 23 Oct 2025 15:27:10 +0200
Received: from gvxpr05cu001.outbound.protection.outlook.com (mail-swedencentralazon11013043.outbound.protection.outlook.com [52.101.83.43])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49xwe4nm9h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Oct 2025 15:27:10 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TPBAc77ICA1OlkqwV0IDtf0LXzvWNgZIZt37fh0ucvfyejG7Pg8efRll4Ot8wYzHjU5tWs+jLiR/c/i+FH5Sf6ksOQtdTMYmqwVERl6cqb1MdcblGH6VU8oMHukVg1yo/+OnpIDl0kxFRUyl9+Oww3f5Ht4MjajbEX2sWGpAyKvOIvVpcxehn7M35n6QTNddG9Go3iGFLhOh3E/h6wTNPL4LEHOdxHAZaQgoWpIhOZDhTUq25AkhxjLD/3YidqV19frjFRpkZ/PLn9j25dtl6jkAXDlnvisRmZeEwBFZtLNu4I1R1mDoJNEjI431KlvPKDtncuWhcE2BPCaHNJHK+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NrYHauC4QxgT2nBCX1xK8/FVtxibYbw9qair9KIoW/U=;
 b=G6YKkw6GPQ2EgHbD3Dyz09r5qPAKxpQfn1SrbsNl07usQ8b242pUYm00nZgpye7yPQYhc/EJ47gg5480/xTwyTdh+nYwJ0neKRnNpzq/cI46HK+3uSeTp7m4T55rqWemQBWg9lVeZXzltZTk0oPjRiloDz1hsu+dYWMPPGKr8fjQbm3pdTuwnR4ztdBet9Q6a4K1Yq3XIbtjs7AcS2/bOHRV68Odt9B5SuGSz35zH/0YIu8F8HOlPnBh1EwQKAFIwGFy/tR4zoHInWyhX0dgo5JXuh3SluCcg1AaunO1ccGhd7QlbFLyW6k4RPkkbpNsxQUKnTOI8oXjDKPXRo4TDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NrYHauC4QxgT2nBCX1xK8/FVtxibYbw9qair9KIoW/U=;
 b=bBZ6zbSMTTTD5m7s6Pi6dWpbXGZXEyHfmnyuOJhGN1bgJFDtjcegRfkArON4eNzBJXS3uDGoO4kzSdU0cOw/NEGdk5RBRGSgPfapm5y1WNWQlTwmHmNInjv+KSex8pL4m1LlMKoQyWwhdJSp37/F9z5XaLbibVZDChhi8668d55oPyEv3Rvo11dZG+eqACm6Nxwwz/ka13fAgaxYuquBmPgHMP5YlaxCFievcRFfmXfkY1dHhqj93FV2DdwoG8Z2bEUaaPKAhTo+LANwMaop/wbPqFHFSjvxZG6t/7Wd7ee7YBTd7oq+zdqiXIArfNprGQuBYLGWNz1ZsJX/gKnI0Q==
Received: from AS4P191CA0030.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d9::16)
 by AS8PR10MB7969.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:569::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 13:27:08 +0000
Received: from AM4PEPF00025F9A.EURPRD83.prod.outlook.com
 (2603:10a6:20b:5d9:cafe::ea) by AS4P191CA0030.outlook.office365.com
 (2603:10a6:20b:5d9::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Thu,
 23 Oct 2025 13:27:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 AM4PEPF00025F9A.mail.protection.outlook.com (10.167.16.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.0 via Frontend Transport; Thu, 23 Oct 2025 13:27:05 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 23 Oct
 2025 15:20:08 +0200
Received: from localhost (10.48.86.11) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 23 Oct
 2025 15:27:05 +0200
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
Subject: [PATCH v4 02/12] pinctrl: pinconf-generic: Handle string values for generic properties
Date: Thu, 23 Oct 2025 15:26:50 +0200
Message-ID: <20251023132700.1199871-3-antonio.borneo@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F9A:EE_|AS8PR10MB7969:EE_
X-MS-Office365-Filtering-Correlation-Id: d64ccd0d-63c8-4b78-c439-08de1237dc40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LM8OO4+kL6rP1Zzq3mCOKP3vJq5SUTFVjfXTZz2OC/Z8NHBI0VvqiRbaNAfE?=
 =?us-ascii?Q?qgCvOWClsO2nIXNEDfVHd9kZ1BstxqeJ7rn6w28KPSjP1gryxHtIOofh4noJ?=
 =?us-ascii?Q?mxht9kmB18yKcbY09OsY/GqMealdtvhtpVo2BgWbpHKhmTNnrIak13JKJOXi?=
 =?us-ascii?Q?uO26P5LQe2ix5u/bQsNdP/4pPQSNhLB0lRX1jpYpFXgMWS+q7Db7ivPk7ikc?=
 =?us-ascii?Q?9q2EgtvLFVVqwrrAUgDj95u4fJ6HIgCBU0inSJ+1ebTaTnWu4ISQXcc+Jomt?=
 =?us-ascii?Q?aDFVag3zmHQJcSg+2D4wJTVhaQkyQpuDkfsEMOH+Oa3fel75FoAh5bAGF+LX?=
 =?us-ascii?Q?J+v9aZ3teCHKz4OangPhvwomjd+u/AMtc/G18n/LzuDbxlqy5N1+BaolAGiJ?=
 =?us-ascii?Q?avNvK54pVXVxvsnqoBzsDWEmjCnJAnNFeKugkIKSJA7yctTQx3ysvWpERoqu?=
 =?us-ascii?Q?DjjDh7Qk8Y/IU2fjfZUkLUG+9C6X77/iszlrkTTz3uaTXTru2xbcygA4Kh3P?=
 =?us-ascii?Q?thwlTII7uiYAre7DCpnxvzcByISFi0gi9wb4ii5A9WPto/h2Cdrg7E1Ue8Qi?=
 =?us-ascii?Q?fhYAHjqg8hkb0SQCibgUsZhmSD8MN40B/nGOyHzAN3a8R9bO7dUrwnT8Wmac?=
 =?us-ascii?Q?dEzfgdxGYhkPZKaGJbJjGpdlLU3fInqrw70SxBPOi9ZaOXTktO7t3h2f4mgH?=
 =?us-ascii?Q?42DFBsrzGIqLbSr+toAvCK4k6b59GJ3c99NH5RH3UsisBJQnqMIVPhFN/SKe?=
 =?us-ascii?Q?L4CGlAFrRgu+/4mqN43iFFnDgXhiwMPnBenKSQRHQHyT6iaMgvyriIDCsN/g?=
 =?us-ascii?Q?PjIImR32KyxLGeEbd0uMXfjpH7Le0WDlgTDA8o07qikuCeZmfFBIMy3OvpGE?=
 =?us-ascii?Q?AcHzmnlCb8cnZ6LHIQYpnjxUOLVbX7yz+TAHmH9TiPPG4l+YilchDeETXpca?=
 =?us-ascii?Q?lMa7Gkh3I1ISKGIdC5i26v1Eqkccrq0Si4Ictb6GSZsSpdbzYy4DK8Vy2T+M?=
 =?us-ascii?Q?lqu/tRpKqkK7jpkWU6yQWiPy3XKHLlEonfejwRBYRVBEqeNUAnfJqNPt57ed?=
 =?us-ascii?Q?M9jkDMnSMUbh10Parlhksuy0jlGTefafny7G81WP8ynEbwecmgI+FE+UciCP?=
 =?us-ascii?Q?0Ekm1xq6ZtvNuPYnswo35/IKyeH2OWdAabS7UpvXPKK5N0OtidNxZPXHd3EY?=
 =?us-ascii?Q?6P88PJeZ5VPuQ0HJiLENuEFboQjR4kdU2jRqxdLHM2XZPdBl3YXq+GwYDySc?=
 =?us-ascii?Q?AJ/lYKw5oERLaoo56/6lZ13/g7K0ijTPgUIMahOHsGHAMUOrVYpZo5uNBdu8?=
 =?us-ascii?Q?/Jxz9qmHeR46h4cnqrsO2liXw4K8dspOEqD8fEQ04t762XC85DYGPfjunTUJ?=
 =?us-ascii?Q?/xSzWe66b72RmtEbijsLFeMVNBZjZ/V7A3fpu4OMOkhBVlRbzZhSaHzKggDd?=
 =?us-ascii?Q?DD2R3jAVTXwSnR2DWmv4J2hyIqg3O/pPgYxbCS1okCMi20k3CltUTvVE/1JF?=
 =?us-ascii?Q?WdO4M3EaLUUIBooJRagIOyNI0dv8OQF2HdfIp3aMReIGqY+STR5iKP1c5AgT?=
 =?us-ascii?Q?sYgcbZ6dzd5yHIDeSB2S4Y0XtNEjfJUCpD8BolGq?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.44;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 13:27:05.9783
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d64ccd0d-63c8-4b78-c439-08de1237dc40
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.44];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F9A.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7969
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDA4MyBTYWx0ZWRfX3r02CqTzi5Xg
 v9AvAxkS7WYAYZWJFVeINEj0zvuP5ChjzkVjh/+lf5c2KGOBYV9+LaLzGlf+uHRfZCM/WFPdDZi
 9b/jNYmNUvtVCZ3CR3ZAMdn65Ds717aSi0l1dWmBEYGAHAfwDz1dJqUtgi9+ljpCa0mw+yOBk/z
 g+gLg31vVZ9C9kdx17oaYQbRkzezBml70NBh53niMtXWZLqRm7sCr25/8ImD/huVAsua4fXWESb
 FiczIa1Mn84B1X0vLMs7bq3fhRv2zbsq2aalQtyCkbk2fOMJMbNx7jkPl8bc7bripD1E+uQsg/5
 CrLBPzov3JKCDldAbeTV4wHN4Wk4Vwwpk2nYbvUR9WJzq5B7WqEXmU+BB/Ei9+AjeBBmnCLTmFu
 HgVIHXPQ7GexVlYr8qmfkI9WggARFQ==
X-Proofpoint-ORIG-GUID: 8aBccV6e8ZJh6pdBpwqzQbdkTHlydf6-
X-Authority-Analysis: v=2.4 cv=HsJ72kTS c=1 sm=1 tr=0 ts=68fa2d2e cx=c_pps
 a=siRb+Px2ILhIpkBuM5jyjw==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=h_VNhpXTB0uJSYwUu5MA:9 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: 8aBccV6e8ZJh6pdBpwqzQbdkTHlydf6-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220083

Allow a generic pinconf property to specify its argument as one of
the strings in a match list.
Convert the matching string to an integer value using the index in
the list, then keep using this value in the generic pinconf code.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/pinctrl/pinconf-generic.c       | 57 ++++++++++++++++++-------
 include/linux/pinctrl/pinconf-generic.h | 11 ++++-
 2 files changed, 50 insertions(+), 18 deletions(-)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index e3d10bbcdaebc..72906d71ae1a2 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -65,11 +65,12 @@ static void pinconf_generic_dump_one(struct pinctrl_dev *pctldev,
 	int i;
 
 	for (i = 0; i < nitems; i++) {
+		const struct pin_config_item *item = &items[i];
 		unsigned long config;
 		int ret;
 
 		/* We want to check out this parameter */
-		config = pinconf_to_config_packed(items[i].param, 0);
+		config = pinconf_to_config_packed(item->param, 0);
 		if (gname)
 			ret = pin_config_group_get(dev_name(pctldev->dev),
 						   gname, &config);
@@ -86,15 +87,22 @@ static void pinconf_generic_dump_one(struct pinctrl_dev *pctldev,
 		if (*print_sep)
 			seq_puts(s, ", ");
 		*print_sep = 1;
-		seq_puts(s, items[i].display);
+		seq_puts(s, item->display);
 		/* Print unit if available */
-		if (items[i].has_arg) {
+		if (item->has_arg) {
 			u32 val = pinconf_to_config_argument(config);
 
-			if (items[i].format)
-				seq_printf(s, " (%u %s)", val, items[i].format);
+			if (item->format)
+				seq_printf(s, " (%u %s)", val, item->format);
 			else
 				seq_printf(s, " (0x%x)", val);
+
+			if (item->values && item->num_values) {
+				if (val < item->num_values)
+					seq_printf(s, " \"%s\"", item->values[val]);
+				else
+					seq_puts(s, " \"(unknown)\"");
+			}
 		}
 	}
 }
@@ -205,10 +213,10 @@ static const struct pinconf_generic_params dt_params[] = {
  * @ncfg. @ncfg is updated to reflect the number of entries after parsing. @cfg
  * needs to have enough memory allocated to hold all possible entries.
  */
-static void parse_dt_cfg(struct device_node *np,
-			 const struct pinconf_generic_params *params,
-			 unsigned int count, unsigned long *cfg,
-			 unsigned int *ncfg)
+static int parse_dt_cfg(struct device_node *np,
+			const struct pinconf_generic_params *params,
+			unsigned int count, unsigned long *cfg,
+			unsigned int *ncfg)
 {
 	int i;
 
@@ -217,7 +225,19 @@ static void parse_dt_cfg(struct device_node *np,
 		int ret;
 		const struct pinconf_generic_params *par = &params[i];
 
-		ret = of_property_read_u32(np, par->property, &val);
+		if (par->values && par->num_values) {
+			ret = fwnode_property_match_property_string(of_fwnode_handle(np),
+								    par->property,
+								    par->values, par->num_values);
+			if (ret == -ENOENT)
+				return ret;
+			if (ret >= 0) {
+				val = ret;
+				ret = 0;
+			}
+		} else {
+			ret = of_property_read_u32(np, par->property, &val);
+		}
 
 		/* property not found */
 		if (ret == -EINVAL)
@@ -231,6 +251,8 @@ static void parse_dt_cfg(struct device_node *np,
 		cfg[*ncfg] = pinconf_to_config_packed(par->param, val);
 		(*ncfg)++;
 	}
+
+	return 0;
 }
 
 /**
@@ -323,13 +345,16 @@ int pinconf_generic_parse_dt_config(struct device_node *np,
 	if (!cfg)
 		return -ENOMEM;
 
-	parse_dt_cfg(np, dt_params, ARRAY_SIZE(dt_params), cfg, &ncfg);
+	ret = parse_dt_cfg(np, dt_params, ARRAY_SIZE(dt_params), cfg, &ncfg);
+	if (ret)
+		return ret;
 	if (pctldev && pctldev->desc->num_custom_params &&
-		pctldev->desc->custom_params)
-		parse_dt_cfg(np, pctldev->desc->custom_params,
-			     pctldev->desc->num_custom_params, cfg, &ncfg);
-
-	ret = 0;
+		pctldev->desc->custom_params) {
+		ret = parse_dt_cfg(np, pctldev->desc->custom_params,
+				   pctldev->desc->num_custom_params, cfg, &ncfg);
+		if (ret)
+			return ret;
+	}
 
 	/* no configs found at all */
 	if (ncfg == 0) {
diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index d9245ecec71dc..f82add5d3302d 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -181,21 +181,28 @@ static inline unsigned long pinconf_to_config_packed(enum pin_config_param param
 	return PIN_CONF_PACKED(param, argument);
 }
 
-#define PCONFDUMP(a, b, c, d) {					\
-	.param = a, .display = b, .format = c, .has_arg = d	\
+#define PCONFDUMP_WITH_VALUES(a, b, c, d, e, f) {		\
+	.param = a, .display = b, .format = c, .has_arg = d,	\
+	.values = e, .num_values = f				\
 	}
 
+#define PCONFDUMP(a, b, c, d)	PCONFDUMP_WITH_VALUES(a, b, c, d, NULL, 0)
+
 struct pin_config_item {
 	const enum pin_config_param param;
 	const char * const display;
 	const char * const format;
 	bool has_arg;
+	const char * const *values;
+	size_t num_values;
 };
 
 struct pinconf_generic_params {
 	const char * const property;
 	enum pin_config_param param;
 	u32 default_value;
+	const char * const *values;
+	size_t num_values;
 };
 
 int pinconf_generic_dt_subnode_to_map(struct pinctrl_dev *pctldev,
-- 
2.34.1


