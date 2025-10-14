Return-Path: <linux-gpio+bounces-27095-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C037BD9E2E
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 16:07:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69A9740032F
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 14:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89981315D3D;
	Tue, 14 Oct 2025 14:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="jaGvv8Zv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840643148D5;
	Tue, 14 Oct 2025 14:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760450730; cv=fail; b=fMuYt1tckJpztY5sM9VLI50qtoUQGLA7Eh9TNAaRq0EDBbZMoJDcX2wpFOppYdJs+3sn3wplbEIlv0n3Gcr37yD1F9AlDCzwf8Ivsg2LknYJ6EzbffjMdyBeWf7P+7bBQLXXwFDAcdtfOjz4pZQxHJ5VGgYbTm9rODhxroy3s70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760450730; c=relaxed/simple;
	bh=9A9wAKuanHieHs1FB0xkPuduibEl9Yn/3S9SVnGlOmM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IXPGr5ouki9w5weUID05yqdyrbJoAJLdar6VP9xZamcLaYALo5eZLc+N8dPLHCN/YXLFCbtjDXGYvHxuTFoBpFN+WI77ti7cmJ+S8eGEUYQfrTFccuBrw5fpk8o8H988t//y3x1o/M1qFlSZxkjH5oe2u3+kqPw9BU5TehBkYIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=jaGvv8Zv; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EDsZgE025989;
	Tue, 14 Oct 2025 16:05:06 +0200
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazon11012068.outbound.protection.outlook.com [52.101.66.68])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49qfav48su-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Oct 2025 16:05:05 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GpjoBazj+p2lNrkidr0nP+plrx20XnZGHyQPe6NLFt2ztkKTb5LkTO4Ws4CblahHm13JXIaZ+NDYWJkekQUs1NMvCnS08WcBADeUlLB4lMXeyOcXO152Gh9ewjUBuqWIxnUl219Oem13MdxOpizH+bVO2TZE5uggQEThZXauuwhLKJqefSrIU8Q0U0YHVqUKGrF+InsO7wlzzbUXrHMXZEECelMlCVxftrK8Z7AdUiDULnvQ8o/UlczlfYEseLVDLNDZ74z3GE2cLzw7CsIFPVR1HqfTd0B/B8z5+b476hby63oPzjA7ULzmOFGalI1UCM9p87rfOM576DeTHDp+1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7GCZq/0vB2JzDCStdp5xnjJ3j+fDgm9jbDYKZgxtsIQ=;
 b=soMuTTSAoCdeQHCYqasQMUeB2Ar26bCLjFIf3XfhW2IKbZOEKNRCNyja0OB8+No7QdBs2d5DTPk/P5SMM5brboedUjd4+Rrk4r43qVd5Y1FLtNWjJMyy2aaceMtlBDPX9SJeRBLvlOm7NlBpOsLggo8jstbzhObgNHrOx23xf//egnavaYfBiHxtAcrPQeIxmoYY/FX62LKS7t8RSwO4O5sBtuYOl7cQMn9R2aB/AGn0ZfaQEFXO61hpAZJCuACrxIGkDgZSMsDDZbplQ/3ABywH98fL9L2J8vGlSuxwWwSBIztqfdc6VkQ9Gr6Pvc1cfG1wH+RwAt23224QECikkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7GCZq/0vB2JzDCStdp5xnjJ3j+fDgm9jbDYKZgxtsIQ=;
 b=jaGvv8ZvA0g6JdioGVNzXNH0SWO9vckTmcTW9++Umsj7cz+Zt6W493zm2N+tLV7on5V/emaGg1CgFLLNIXa7fmqdrBZYW1nJLUz/B2yhhYVo2EpMw83dl/XvYARmpZQvk2xsl9qDarh51jhtmP797te7FINRq0vr3yzTz0AtfkXqcZZUkuyqVDYgf7eracSlmGXtN5ARpUD7OCzkauLsh25fdxcRTkW5zZXkx73r4FVyLWOsKs9opj7N4Ev0u881YKsqm5J2CX/Lu/NVR25Hux1AQ2D7z1ju/cLjnB7CZsg/Hp/dGgeP66LsM/VhdvCzTccetZzgfkwQSORNZWd+fA==
Received: from AS4P192CA0020.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::6)
 by BESPR10MB9222.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:b10:ec::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 14:05:03 +0000
Received: from AM4PEPF00027A5D.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::fe) by AS4P192CA0020.outlook.office365.com
 (2603:10a6:20b:5e1::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.13 via Frontend Transport; Tue,
 14 Oct 2025 14:05:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AM4PEPF00027A5D.mail.protection.outlook.com (10.167.16.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Tue, 14 Oct 2025 14:05:02 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 14 Oct
 2025 16:02:40 +0200
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
Subject: [PATCH v3 10/10] arm64: dts: st: Add I/O sync to eth pinctrl in stm32mp25-pinctrl.dtsi
Date: Tue, 14 Oct 2025 16:04:51 +0200
Message-ID: <20251014140451.1009969-11-antonio.borneo@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A5D:EE_|BESPR10MB9222:EE_
X-MS-Office365-Filtering-Correlation-Id: 349fdb86-ea80-4461-31cf-08de0b2aabbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ETbIHXoCdhjTRsZLUvKxQ9wRfxJFbCzA/wJ1/+u5j4lu82ASa9SidKkSUMrr?=
 =?us-ascii?Q?FZ0lKXza7m6EI0qERDmSpsxUPTTC8f929AWPtcbPyUQmJBj2huCWTqdyX4zo?=
 =?us-ascii?Q?AOSQBU5LPrTLsQGhO+6KyStOVSAj4neSb0c4gT/2wh2RIo9e/nkQoytWAjSr?=
 =?us-ascii?Q?yyKB2freCTniW8z1QTCcrYiRswa7fVteDG5Trx7WfrqjQWzzZ7KBBLpI3WxE?=
 =?us-ascii?Q?nULIXPGquaVNFy5PnMoX+vswe1COb/4UvEAkP5VTrTQUck3rUPmPergy1OWU?=
 =?us-ascii?Q?JyNWLsHbyNvX88723wUttwlZikxIQbbDbwGxRRhN8Xne8vW8W3fAoey6UcKA?=
 =?us-ascii?Q?OkhKY+Eh8jIarKi08cR9EMiHxN3dFPfg+M6S9RtZISkGoUr2dOS8FFDCoRod?=
 =?us-ascii?Q?uPraLNSBMvH5QiXqrppchh31jeAHD8GuXuB+nzyZItAgRU3xH7JoVzqEBQdd?=
 =?us-ascii?Q?Bi4l0vDlPjpaVtr1NBzE0gcXwWrA1yDYUbJpHJsLPBjiK7T0ZBBJROSJXHOI?=
 =?us-ascii?Q?GJAtFRxpPxvs7HryZdu3JxjIeEaffWEu1N93M09wIZzqQP2fGvsCRUgdvXpd?=
 =?us-ascii?Q?rwGv8kbhLr2z8xgH1kmip0fB5TTxypbwRoJNPY1ord5pySsYzbEdhcWLnO3q?=
 =?us-ascii?Q?FnzX7VoK8MxX6r8UiV3XhC6lYJOLNJCAVCnlAhTf5gBQuPw9sJhfFDj+2zEe?=
 =?us-ascii?Q?qNohdzYwz1CBP9/1NJxVlsKFWwGfKMg8+6dTDQZ8Ci/6kOpNEsOSnt5MQiux?=
 =?us-ascii?Q?BWcDWyEQnkRmwruC01vUp3cer/phcbIbc5UbikHqW3O5tTi1lIljakprnaaG?=
 =?us-ascii?Q?I4K1o9Bf4552fweiHmBtzevSblc2mSaWZyEgCjwfIjWZTN9x2d+jz+L0Merd?=
 =?us-ascii?Q?inksAiqYzu8/gZH6HUnbjYmBJq8dDUS94zDqC3qdOq2RGDf3fXwMoHURflNn?=
 =?us-ascii?Q?09XuVICnEBMur6gucV+w2uLpojI5yVtlr1pP1wOSFPhYtc50tomn081UTZ/y?=
 =?us-ascii?Q?JuWEMu7pX9HuHCgHs1XlUVrRQcuMkimwAjb6zEZXmKGosaC+VirqLgvHJNwa?=
 =?us-ascii?Q?3Vz6w+GxKnHJPkb6VUvBz+HBlBHJbo4VG23Bfurq16tQm5YvqOs9UD7Pu5+5?=
 =?us-ascii?Q?HhTY6j7JMq9JvTVGZlAPdARZvAsTHya3sh2uBp/6+e8b0ndh7hevt5yzeKWW?=
 =?us-ascii?Q?Rzrch7BPvg4HcQ4Z+j5rONPXJL5rIa7YU2uvEL2EZNqYT/Bg2SkSeHP+GQ2k?=
 =?us-ascii?Q?5PrVLPPPqTbKNwMVd1p7YPJs3Q1Bl024QV5JZrtRsV0aCw/facnIJpNUE8xo?=
 =?us-ascii?Q?7lIXMfqrlop1DIal5hYri+igfSZdXwqA5r76IqnMd+ECnyMLIiZKgatS2J4D?=
 =?us-ascii?Q?gmzhYsFHRmkjKj1m3l6mX8fC9EXN3ssNXBrhyehQNSNtmzE8enMiK8ewATOu?=
 =?us-ascii?Q?oGQUcXdNnrsb6FfQ7sEcTxJWU1fskYWy6PQmJn/WJESY+2yzy9iEB3mNPEzN?=
 =?us-ascii?Q?I/OaiksvWLVuADxwkNlsX0cgWti8Q6qmWj0bPDz3HVMNpkD5hLGOkQb9qFj4?=
 =?us-ascii?Q?cwROQhDVO+bQASX6KXvxk/8FtlLsUCvngSspk87W?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.43;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 14:05:02.9922
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 349fdb86-ea80-4461-31cf-08de0b2aabbe
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.43];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A5D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR10MB9222
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX5htO/T79uHNi
 /DSv3Xr7D4NelULSoRLQ/itqoOlHN6diV1fyASxSrTzRq5wypFJwuM0w1UpEKlMisn6A0GymlMW
 LIDjiNzO5at1Iien5jVTGMIjuM3pIJzWAZMk54MhtmbL/6FMCdFPDNQq5YBtTl7u4RnZl8oGUa8
 lM4Of/0Nx7NTaM3xrUXRkQzNaNr+62+z+1Mj/3mM5Up+CvY1YUX98wTLbJfoy2c19L8YiDzEiWm
 06+/Iw2qq0ua2QapF1nCfBG2q2yH4LMaTyeVx8cdFqyJ5x3veu5yPmSr8qPG2tyu9hybAxK5/sk
 PmBuUSVwwt4qnmrQVDlN5Pah02i3/QR0G0iy4REgogNgxoIBBbRT9K3dtLyGCnEs5MhFDrVunfQ
 AO+iSfIL+Alqx/Cv+SRarsSbst1K1A==
X-Authority-Analysis: v=2.4 cv=Ne7rFmD4 c=1 sm=1 tr=0 ts=68ee5891 cx=c_pps
 a=xyIh7xk4YN0HFApL+B8wwA==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=zedmP5LN3X88bpDL2FwA:9 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: K5a8D2S3Xz21TrJp1Al8LD_Wri9NfTTn
X-Proofpoint-GUID: K5a8D2S3Xz21TrJp1Al8LD_Wri9NfTTn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017

On board stm32mp257f-ev1, the propagation delay between eth1/eth2
and the external PHY requires a compensation to guarantee that no
packet get lost in all the working conditions.

Add I/O synchronization properties in pinctrl on all the RGMII
data pins, activating re-sampling on both edges of the clock.

Co-developed-by: Christophe Roullier <christophe.roullier@foss.st.com>
Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index e0d102eb61769..7906b3c585a2d 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -38,6 +38,7 @@ pins1 {
 			bias-disable;
 			drive-push-pull;
 			slew-rate = <3>;
+			st,io-sync = <4>;
 		};
 		pins2 {
 			pinmux = <STM32_PINMUX('H', 9, AF10)>, /* ETH_RGMII_CLK125 */
@@ -53,6 +54,7 @@ pins3 {
 				 <STM32_PINMUX('H', 13, AF10)>, /* ETH_RGMII_RXD3 */
 				 <STM32_PINMUX('A', 11, AF10)>; /* ETH_RGMII_RX_CTL */
 			bias-disable;
+			st,io-sync = <4>;
 		};
 		pins4 {
 			pinmux = <STM32_PINMUX('A', 14, AF10)>; /* ETH_RGMII_RX_CLK */
@@ -142,6 +144,7 @@ pins1 {
 			bias-disable;
 			drive-push-pull;
 			slew-rate = <3>;
+			st,io-sync = <4>;
 		};
 		pins2 {
 			pinmux = <STM32_PINMUX('F', 8, AF10)>, /* ETH_RGMII_CLK125 */
@@ -164,6 +167,7 @@ pins4 {
 				 <STM32_PINMUX('C', 11, AF10)>, /* ETH_RGMII_RXD3 */
 				 <STM32_PINMUX('C', 3, AF10)>; /* ETH_RGMII_RX_CTL */
 			bias-disable;
+			st,io-sync = <4>;
 		};
 		pins5 {
 			pinmux = <STM32_PINMUX('F', 6, AF10)>; /* ETH_RGMII_RX_CLK */
-- 
2.34.1


