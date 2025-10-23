Return-Path: <linux-gpio+bounces-27542-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 994B7C01737
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 15:35:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8C923AA1F4
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 13:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7010B342C96;
	Thu, 23 Oct 2025 13:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Gx0sf4Rg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDC1315D5E;
	Thu, 23 Oct 2025 13:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761226059; cv=fail; b=C/LSIQ/TLKjQCli9K4frhU7tEnfCFZFpEWv2CtfdO3osDsPj0Q5sAL/wq4H1Fr6VzipSdJgJOlVjE66Hbf8KNMehCKnDpxWtKGA3R5Ch5YZXpGM1MfBgYjMg6qjxyioG5p61FODobxqFxLHu5ke+ieTbJuxYdog53HGq2fSSYiY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761226059; c=relaxed/simple;
	bh=y7HEcH6Ne++krEssonPlELF3Yjj/9yvT/FQSsuCLAcE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L6V2Dqe5Yr+wTqkYf5C4jjk1nCeQ/9uopL/akqyJe0RQKnUDmLYexZ5PVJn+exWldRVG5ME/qJLUWWlGpmsE6bnGY9B0C1YjOCYLIK9T+yn9rT+VKhXqfJh0ksb3UpLyu50VuM4ZAiIjrqdbIdq99n2BBZQTLkkfPsqgnCmpINc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Gx0sf4Rg; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59ND3G0A008574;
	Thu, 23 Oct 2025 15:27:17 +0200
Received: from pa4pr04cu001.outbound.protection.outlook.com (mail-francecentralazon11013006.outbound.protection.outlook.com [40.107.162.6])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49wtpvq9g8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Oct 2025 15:27:17 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RIau7U2XSqpnFRuRnfnG4x3hnpx49TnP1F0ZAnmXRInyLKI582xrMQfcLG/6v8BKQ+sNISb3qI4mDn5jZhO1hZUFlr1J7RpzgKormepe/F+k3NtnDRJVcyxwef1doXB1RjI0MwpHiBMMQeUs5B7lQ6hGea2ZTqdozQ9bP4JBsmkAfQr1Bd/TXzMqlCM22Fin+i0qrB8sEu83lcbBvVnrg66adGanthDA1eh748PkzOprC5x5zT526/mxIsK6ZtvrvN5X5oAJKDc1z+TbU3mIMyqbUtAmWADBTb62nW7sFMBq7BRujLO5U3AEKsr7qUWq0juL1+v5dUv7YZQfasrTOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tVZAoHFYjX4zprTP+iNPRA245unlWGQ7tR+dCa5mA+o=;
 b=l4w8wgGnjc/RzxBGlScggs73V1PB+wEDovMTprerdgG7BEwxiWLg1ap6XquaQuSUCdWzj4RldmXK2LD1wRY+77tV6KIV1QwtMwU+mwV0NVC+Ki+9Go93CxmmZtKfIQqNOC0lIuuDVVWRx6sISPSAzA/rDZ9sa/n0bNafUz+qBICJBjs67U0xQrxVkznNev+Ur1gM000el9YkpkzhJ73PxdNISqhLqTqhgAW2/nfuk3tZwNPGhc0XGB+G3Z1QJhaoSX4WsTSQWjsBeMCsJ6YHVe1Jyk8eJIS4jufGYqYmtQbaJW1GJcNvkFDxap9pNgfVGe+b9n1I4wV5ytUNpQ9Z8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tVZAoHFYjX4zprTP+iNPRA245unlWGQ7tR+dCa5mA+o=;
 b=Gx0sf4Rg2lqiJFEAHdyLd2pZkfq+oTifHfPpez9z/33chjAVxJul/gLYdr1JrSbrOMjR+LdiFVlE/NntueETQQVutQvlOthpnQkywQsSF/vBoeUBY5YalzbkMY/LSwiRYgxiv7qx6YKQKZT/q+gQxeyP2Ms+qgQmlAcMV3iQ9S6TOvCbPRF/+wqP1QqDPWXQYfFBi23tPpCeITnyWnu/hzvvsux0h3qXiudHMrO3MEv5gpb7b9r+DLWHJNBomxP6FRgqf/2EHKIHpitY37ANdgmgHSZ/N2V7M3vtFmUajXgFyVhSKxtGe52UkdKYjbrGhhsN63o/vNwfdXy378T/oQ==
Received: from AS4P191CA0028.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d9::20)
 by PAVPR10MB7490.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 13:27:13 +0000
Received: from AM4PEPF00025F9A.EURPRD83.prod.outlook.com
 (2603:10a6:20b:5d9:cafe::cc) by AS4P191CA0028.outlook.office365.com
 (2603:10a6:20b:5d9::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Thu,
 23 Oct 2025 13:27:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 AM4PEPF00025F9A.mail.protection.outlook.com (10.167.16.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.0 via Frontend Transport; Thu, 23 Oct 2025 13:27:13 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 23 Oct
 2025 15:20:13 +0200
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
Subject: [PATCH v4 12/12] arm64: dts: st: Add I/O sync to eth pinctrl in stm32mp25-pinctrl.dtsi
Date: Thu, 23 Oct 2025 15:27:00 +0200
Message-ID: <20251023132700.1199871-13-antonio.borneo@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F9A:EE_|PAVPR10MB7490:EE_
X-MS-Office365-Filtering-Correlation-Id: 255cb0d8-637a-49bc-4635-08de1237e0a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QdYfL9YCxPK1fFa/OHoYqdjYGBx50LcHRMqYqW5A8Vqt8n6qzrfKI55yPdyw?=
 =?us-ascii?Q?Lvmj+ptui6b5dtLkB48Jk9sxRfARTralbb31bXHqz76j8Ey8nPuFWwfU/Xh+?=
 =?us-ascii?Q?N/A1+P5c12/acP7lwUzQ6fT/qpOl4BNR9mwu3Zmt3V2mK/qtnzA+wz//Molj?=
 =?us-ascii?Q?Bm11xmUDtPp2J+sLlzNJreGuqW2bZoocJx4wRlQSvAm9oK43ee3MDcMUVNGS?=
 =?us-ascii?Q?RchBAy1KumkWDT2xE+wQwghEngCNgFvtFvbWizY/9BJjL3yuF6WZEUH1KjCu?=
 =?us-ascii?Q?9eKY6FU5GhcoOJ0Q5BsmipedRPBrgU1y3h1l8rhVrUeDtjhpNABxoGnDAjBp?=
 =?us-ascii?Q?Mx8P1M+udOx2foDZMe7BK8KQTMfDjubxc/3q1z2ExwiVvUy3AAcUdg84JyvI?=
 =?us-ascii?Q?tQyfXMUC8uEWeIqz+dT6tD5DI22fc5VpxJinD7iPgsuJVBPT9iFOzSO3C2U2?=
 =?us-ascii?Q?9qJf6Led23J8fbrGOt3VSS7tmiUSvdYhepPm/LrKJvde+crwLeLiJnVKH0zA?=
 =?us-ascii?Q?klFkHJtcaYJMZ22rdZ7/thOFAIHmS1MlbJEmOJqko4FnR8vZjnD6ZvlZ2D8Y?=
 =?us-ascii?Q?iDC1O3/dk/qg/NXGpZak5QUw7E1TbQAY2tR8z3O87Sh3klvPpOoMkrbaElKM?=
 =?us-ascii?Q?b7vlq7a862yzXz71HmbEoXakwg4YPmGPEGH9NUwc9L/tSb0iVJR079/Clq81?=
 =?us-ascii?Q?268mOLR9Io6OIqxd/9u1NUwHohm1M6x9DHkCI7ZyJSxz6PZvdJQfEwO4DRq8?=
 =?us-ascii?Q?LReqPUiHXxEdbitem5rTp+Zd5gaywrbFqG2+UU+Ri/PWu0OyY1xkCDuJdJDG?=
 =?us-ascii?Q?H/3nimT8hkkT9oLyiXeo1qqViqlcsWvkY1+rYZ4/zfGCbE8OQ/ZVC1v6crsh?=
 =?us-ascii?Q?ubwkc7PSprkgucQjr8yxdDLrLu/GYg7ab8ScxiKgrcUZ8UITPzUSEA8IoQV4?=
 =?us-ascii?Q?lgrlHfyFDBfGvsED/ckUlhRVmVvbJHhfSHs+hE42L4aM3as7rgSF0hqymLbq?=
 =?us-ascii?Q?PQcLwhrPB/SkP3ceG2wBKfiP9I16hKmPzGf6xybnIxH4VYq64XmiPWCE4EzJ?=
 =?us-ascii?Q?RRxNTILOf3M8v81juGKxYT4CfSsdAvjvYcRMTKBCZOb3qqUS+1jccAigRaZl?=
 =?us-ascii?Q?Q+O0Muk9QfrYEgMAEzFc5ftdIq1vtH73D5Fj7LhxwWincSpVrPdTohKVqmHw?=
 =?us-ascii?Q?HHnTVqgsE4aOKbgrz0tCbhyqnbvNtpVQeW32ifwsQ2GwL6pFKPKyQdd7eU7k?=
 =?us-ascii?Q?zDh28/WD4LTBP8MKJEH5i9miZs4EiSg13qX38S7C31b4PqWYqik+sN+KVLxM?=
 =?us-ascii?Q?GTlY0Zb/+WZ7JMhXlaVTP7wXEumlbEsdlmGFC3k40GDyBLwQd5B+RofGDs4y?=
 =?us-ascii?Q?oaA/3pRBiRaVLSw4FZxKSB7SJgIU9HlPuxMwWOSe2sSeLHfDDJrMwysxBcja?=
 =?us-ascii?Q?PgVT04YUd20N2UiIBm2X9x4bBaPXCUQVVFSvHWJj4JNoZUD9sAQh8xbaKUps?=
 =?us-ascii?Q?nDlCadlkg1G5sKhCviXAuTFd1R/QXPhUYDj6zF2HHhdDPsXrLjAtlU3ODkN6?=
 =?us-ascii?Q?7qQ49+DtbPJwtWjdu1qOW++hc4Bpxqm3AEhCr+94?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.44;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 13:27:13.3241
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 255cb0d8-637a-49bc-4635-08de1237e0a1
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.44];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F9A.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7490
X-Authority-Analysis: v=2.4 cv=Wscm8Nfv c=1 sm=1 tr=0 ts=68fa2d35 cx=c_pps
 a=JkgO9ZGQ3gVAvAonPdTi0g==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=zedmP5LN3X88bpDL2FwA:9 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: Ctl9H5MZkr_IAKEy561wmO2-lJ-QeidV
X-Proofpoint-GUID: Ctl9H5MZkr_IAKEy561wmO2-lJ-QeidV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDE1NiBTYWx0ZWRfXwDqIr+jcuJez
 O2wKVG+7TpeHYLi7dZCpM3X7D/ooQtGvsPky0rdd/Yzm7CKKumCbrLgNb6nDfVvXDgeroX/RSFX
 MV5HYtTYTvWLSbvMuafhbiWy/y1b+0QjMwM/X9b6GkAlubG2Yro+CUIXRFugdcEeraaoVbPLQRJ
 idBAKtFHWxMoWdPehL4S4KSozdqJypfzw7hfX0lmzy+fswm9QhQfLn/vPIm35Ty+8IGz9Rm4XAG
 rb5a31KWqpUWyrSBxLQIpx/VczpmI00/7JM6JRIH+lRc8j6rNVKUuEnKpp690TrACoE2X0kUj34
 40kMXLWl22JqRMztwZ2gLS0iyEdI0qARciZWK4SlHLxVgJpC0L8AIXsP2080Q5JdLUoCnYKmNR3
 pfSM+aceRX2VetDGE2B24vAV/1e84A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510200156

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
index e0d102eb61769..c34cd33cd855f 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -38,6 +38,7 @@ pins1 {
 			bias-disable;
 			drive-push-pull;
 			slew-rate = <3>;
+			st,io-sync = "data on both edges";
 		};
 		pins2 {
 			pinmux = <STM32_PINMUX('H', 9, AF10)>, /* ETH_RGMII_CLK125 */
@@ -53,6 +54,7 @@ pins3 {
 				 <STM32_PINMUX('H', 13, AF10)>, /* ETH_RGMII_RXD3 */
 				 <STM32_PINMUX('A', 11, AF10)>; /* ETH_RGMII_RX_CTL */
 			bias-disable;
+			st,io-sync = "data on both edges";
 		};
 		pins4 {
 			pinmux = <STM32_PINMUX('A', 14, AF10)>; /* ETH_RGMII_RX_CLK */
@@ -142,6 +144,7 @@ pins1 {
 			bias-disable;
 			drive-push-pull;
 			slew-rate = <3>;
+			st,io-sync = "data on both edges";
 		};
 		pins2 {
 			pinmux = <STM32_PINMUX('F', 8, AF10)>, /* ETH_RGMII_CLK125 */
@@ -164,6 +167,7 @@ pins4 {
 				 <STM32_PINMUX('C', 11, AF10)>, /* ETH_RGMII_RXD3 */
 				 <STM32_PINMUX('C', 3, AF10)>; /* ETH_RGMII_RX_CTL */
 			bias-disable;
+			st,io-sync = "data on both edges";
 		};
 		pins5 {
 			pinmux = <STM32_PINMUX('F', 6, AF10)>; /* ETH_RGMII_RX_CLK */
-- 
2.34.1


