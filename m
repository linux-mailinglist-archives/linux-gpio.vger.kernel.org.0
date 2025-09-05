Return-Path: <linux-gpio+bounces-25680-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 338D6B459D3
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 15:57:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEAB11CC2300
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 13:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F0D235FC2E;
	Fri,  5 Sep 2025 13:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="N99wCJWb";
	dkim=pass (1024-bit key) header.d=stmicroelectronics.onmicrosoft.com header.i=@stmicroelectronics.onmicrosoft.com header.b="ieuXHpVJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0A935E4DD;
	Fri,  5 Sep 2025 13:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757080588; cv=fail; b=fXTu/6mQYr9XH/M9COdbMQWSq/XQnqTn7hYzl5qzJtSWRvW7uCbALYTrtAMU4LQaewRbKnByRut5/ftAfMACZ34JmBuvyL3wOiXZxGeA6gvjUoq5Uz45JPLvIH6aC4NX+C1cFg08XP5UnBA8CTU56PmL54CJDUscb3OuRrkqjdw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757080588; c=relaxed/simple;
	bh=1gaeCVgDduQwebIG1ua+qjqlkMxU2PdG7HAc0UKvOR0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=izfU3M8Vey8OWQg6CB3PtG0hbzP3TX3GL4qriPnQLeSiMNCPwl0l8Y8BAoLwxaVBPkt8G/IK9bk8D9+c4DEMZw4OfymFNwDh9TyDhRLW4C933QCcLDw0EwxX/30BgH9dcBwA5vMmCvKf7/78MdSt0N/S6JvwkndSALWCoNr6m84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=N99wCJWb; dkim=pass (1024-bit key) header.d=stmicroelectronics.onmicrosoft.com header.i=@stmicroelectronics.onmicrosoft.com header.b=ieuXHpVJ; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585DhSdc032117;
	Fri, 5 Sep 2025 15:56:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	pitV3QV3B83IeDQCdTgJbwLn5JeNqPUPiog8xZNxM08=; b=N99wCJWbXfVeXHgr
	oVSwZqRmeGh0P1FO5jH1gV7ObiXr8wKqTnzQlIwht3hfYQ/JGkXA6I/RbyfmtPDX
	rpqYlfA4H79LhMaaqPr2rys3vXHSqThHsep8jsAJ+LXCH4+5anaZm3HtQupVb198
	TcV9WLWoRQR2FTTmPk0bcP2VWhQBHQ/jMvn4rHwH6uuJdi0KxgcgLuiSk+n1RTpR
	DRPtxLLoOVUs0FW/U292CIWZAiMaU8sJscsxtWBjAafhZvPXYccy/XpgQWOLHkso
	E/pD+Pm0H42x/WaZ49DrSTcnIPs3CtbKsqDzfY97EclxZMpiSlsPsEDCn6XOXckz
	uKvMog==
Received: from mrwpr03cu001.outbound.protection.outlook.com (mail-francesouthazon11011011.outbound.protection.outlook.com [40.107.130.11])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48urmxubtk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 15:56:12 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sSy2qzfkFjPW/SZIbOw6DYU5UocPfsWOtnRaeDVRVjwuU8FemTq846JuJfa/EEp8m7oNVj47tEuD+oLu4CB76k4cfCCPUGOaNYg+O31qNopP3QJcTJBSOJm2glw/+2YfvI4WqoybgA++rVHx9/zKcUBjiNLhDa/NcIPR8JnIbn6hcpPP6h8jXhRnSdtvtq9kMXf4TYIeedEhxMCEC5LYMIiJVAkkHfwRqSIU0Q18Aktb/Q//fSpWJy6gW1rMUjP0gcwpmw36N8ktz7475Oz803RDOH1nPUlZdgQqGAdXDRWMBM0DpKDkeKFKvnRhCWOkjIR7ywLgXB/nXHIHB1Q8gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pitV3QV3B83IeDQCdTgJbwLn5JeNqPUPiog8xZNxM08=;
 b=YsH+zit/WW0oFLMA4LBMOmtdmXomfKHp0xZZWMSd7vS0yxeHY8C0E/xN8PrmS8oEqYW7klAWE3VgQfq7XsHKc3lUL3GLd3kCnjX8yw/DFIM15rjg+6Fi0xh+22vXCXF4o159hILQBD0QjoNPg672tP38UuBrB7Vv5D03npTYzYUwVo44izOOYbDokh94j8c15mxpQog6j6Gn2Bf+ylGAlXMBXBOySxWRjHw7YnXeb0ILYeqBvVxE+MwfRJCCm0u6DIdvznTgYtL710ArAkCX7BlxyIXiRiVfNf7WO3qKr1Pd+v8x6pkUbIz8+xE7s4HBPBEF7nDxfhXELpZqjD8vYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pitV3QV3B83IeDQCdTgJbwLn5JeNqPUPiog8xZNxM08=;
 b=ieuXHpVJv1bMlaP2pye1PjBjy0PGK0BjEEo7bSsbf/zSclDPWEhoc58fASE/h73WNGZ3t8nA77W2a9sKnm4s8xWHIqGfGKHZ1LvPvs1F4IlpKykOdxx1qvdxKc35QDtLJuXkaI/sSRhbQlxTeBM+5BN1rostUSaQnwBMm2I6p3A=
Received: from AM0PR10CA0105.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::22)
 by VI1PR10MB3981.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:13b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Fri, 5 Sep
 2025 13:56:04 +0000
Received: from AM3PEPF0000A78D.eurprd04.prod.outlook.com
 (2603:10a6:208:e6:cafe::77) by AM0PR10CA0105.outlook.office365.com
 (2603:10a6:208:e6::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.20 via Frontend Transport; Fri,
 5 Sep 2025 13:56:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AM3PEPF0000A78D.mail.protection.outlook.com (10.167.16.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.14 via Frontend Transport; Fri, 5 Sep 2025 13:56:03 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 5 Sep
 2025 15:53:42 +0200
Received: from localhost (10.48.86.11) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 5 Sep
 2025 15:56:00 +0200
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
Subject: [PATCH v2 3/9] pinctrl: stm32: Rework stm32_pconf_parse_conf()
Date: Fri, 5 Sep 2025 15:55:41 +0200
Message-ID: <20250905135547.934729-4-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905135547.934729-1-antonio.borneo@foss.st.com>
References: <20250905135547.934729-1-antonio.borneo@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A78D:EE_|VI1PR10MB3981:EE_
X-MS-Office365-Filtering-Correlation-Id: 847bc3d0-f72c-4ae7-5dce-08ddec83f446
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?edTlEpAEzP+zc/9vJmScGSVEaHObXxG9xs+CXsTqKPCvltCFDN1t01O4F0n4?=
 =?us-ascii?Q?+scLyogoOALFi69pPf/J45znJct4935TkbefV1A5eaTgNz7SbIwIB8zaPK9r?=
 =?us-ascii?Q?bIfjawolz6UNOIx/GBRLf00GrPR3omWlCeC7Kn8Yp1V4Ey6bY8OOOfXQOyJX?=
 =?us-ascii?Q?6p6fcAq7JpYXJotRIgGMbPZL/s0CsengyYzMZgz1jGb5s3PiI0IrDMwAnWcJ?=
 =?us-ascii?Q?etwC+ZQXKxyN718Za17nOsDOQBvEGjd1HKgNe+5/7oxYk4kcSfjxb7MTAGbX?=
 =?us-ascii?Q?LyzpVcUIjarFglyixEVXi0yPPenHakdIqpazeKyKCDcciYMvLcKrYVLC4qBR?=
 =?us-ascii?Q?iLdU2l/yT6QN11LixuqghxQA6165AX393wg7xi+mBFMrfEgAeXUQsfoLzKO3?=
 =?us-ascii?Q?mDHm5FxWK2PyTUQNlnyCtPbqPFDOn078z3Z14J4sJ1ZkpBz6RWDn4Oka4UGR?=
 =?us-ascii?Q?hZSAnubYXc+0zshZzuWF047N4JEjKnDxyzGKf1GXdT1+VUEs/6lvplwFeqCa?=
 =?us-ascii?Q?YW9caDAq1kY2ajKmtuNgwqSVuQsU5NLbVX5g+lDAP5+llMC/VgEAYX1YK16R?=
 =?us-ascii?Q?zQHURn7BUwKh9BUZA3+1xsaW/pgM7ux43ebvgPkYuoUGm0eyim1DLtxIXKMy?=
 =?us-ascii?Q?EdDfXtmYZWHL3vBq7tCWAhgw5yu9twVBsworcL41TGTT1gbXYv8Rnl81dfol?=
 =?us-ascii?Q?k2dqla+ucASgNCsxVMwNu4VV+pWbhQbSqQ0+75SK7cCzt3+JwZcxfU/wu54a?=
 =?us-ascii?Q?YEjf8pYXrVPOAt+Uv8cTlaIem8Xuzg6TUb6kDHOh3TUmEtZBxVt+ZglZAg9O?=
 =?us-ascii?Q?QQAbOqJ2rxg2GJUPl9gj8RUh/L8ctbx2GuVQYb/jPINJlrfxJb8bP6yntdow?=
 =?us-ascii?Q?ixdOQZj+iBiUTMm8GGkKjgSVn+JY4VxZwBPOMXJa356nwXPzNCOOa8VCCFLY?=
 =?us-ascii?Q?DmBFup6Qo90hTNrifHFoxZBMxl9q6DzzWL99dseVgjG8BQao7DeHUg92wgXA?=
 =?us-ascii?Q?PImBTiKvGosn8awj29xSuw6jseQnKI2RF6SB9uxQD45YrQ0itPigsZhwDB3N?=
 =?us-ascii?Q?+yfYv9uuIHOro9fuNAbVF6Vknc6rJwvTh30Q6bTaYsAlmDhiPFDVPjFMgcGs?=
 =?us-ascii?Q?Ug+Gx0eTw4aL4rl6TGPTP6DM2JTsDAbs4Lf2dSkhWwFEkweOR8WZl8NYvZoq?=
 =?us-ascii?Q?SdWDXFFKZweZSZnlHDFWOW3PmHmQTf9C8bcKDM8dLzElO/Gk/b7xypR8gpwr?=
 =?us-ascii?Q?A8zV4TqZHAPhneSB2NP3Mhj13H8+H/1lHymvTQe+QuRop0m2kcOfNJZ8drLO?=
 =?us-ascii?Q?y6xHZDlcNeSIJeGlFwLuQX1C1xFv/25rGS+72a3O3iEig0lWXZAJ+q25GKUb?=
 =?us-ascii?Q?bSgth3NRzXSZxGwcS/MDuVFzhl6l3r3ulBrcXZbsRTGe3xUiRaRYFbivn692?=
 =?us-ascii?Q?J/Xn+DeqE2BYPgXHaq6BDbS59D+B9Mf+aaVMuJbZTZbmE68IcW+bp/vNaCLv?=
 =?us-ascii?Q?JH9jYKwpi9ORHzD1yB2HQCw62d3JzlAlVflIQDPmUrBNIIgz5a8ZWNAqvA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.43;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 13:56:03.8741
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 847bc3d0-f72c-4ae7-5dce-08ddec83f446
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.43];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A78D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3981
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNSBTYWx0ZWRfX1gVtCbGSjBQs AcExDjhzL8NhRFCeCAINBcKGbBSMzJ20IAF0SvnqlyXtlsrF7tdE0cyBMZSy2lehaFC+tkNV3BX WTsdus5nsFDJRih++qJbq9D/h4GvA4jcMneQFJDUkaFLs6XYVeG1Se11+sgbH/l7T2/EpcR2Fm+
 Ye14azq/CVX0CLpxLnGMlIJHD/xw5Y8RQrqsnmF39VjSwgVp/gJw/YfRoDQZSXHraGHkzQ/s9xn zlssW0AQkXluKo19S0XQ+7Dmf2SQRmVwnXaAX65C/lASSo5Tly8onLTzaTihnu7CmYihqJ8UDYr ROrfcX3kr2xW2OOWPJdFLde53OmH84yWNvKNToXxZYRI/G5Lcmc293GrJGE42ndXLah1V3Hzv7U BlP9fxYs
X-Authority-Analysis: v=2.4 cv=dqLbC0g4 c=1 sm=1 tr=0 ts=68baebfc cx=c_pps a=PyuWNx0SgPbB4SnybF+ChA==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=y9YUpebZf6kA:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=8b9GpE9nAAAA:8 a=JfSwdrTX8Euj0BBcFicA:9 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: dAPxUS2hgtsosrhAASga1M6Dc3LID3bD
X-Proofpoint-GUID: dAPxUS2hgtsosrhAASga1M6Dc3LID3bD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 suspectscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 spamscore=0 clxscore=1015 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300025

Reduce the number of parameters of the function by moving inside
the decoding of the field 'config'.

While there:
- change the type of 'param' to 'unsigned int' to handle the extra
  values not in 'enum pin_config_param';
- change the type of 'arg' to 'u32' to avoid additional conversions
  and align to 'u32' the corresponding param of __stm32_gpio_set().

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 823c8fe758e2c..baf160a71c11c 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -287,7 +287,7 @@ static void stm32_gpio_rif_release_semaphore(struct stm32_gpio_bank *bank, unsig
 /* GPIO functions */
 
 static inline void __stm32_gpio_set(struct stm32_gpio_bank *bank,
-	unsigned offset, int value)
+	unsigned int offset, u32 value)
 {
 	stm32_gpio_backup_value(bank, offset, value);
 
@@ -1195,10 +1195,11 @@ static bool stm32_pconf_get(struct stm32_gpio_bank *bank,
 }
 
 static int stm32_pconf_parse_conf(struct pinctrl_dev *pctldev,
-		unsigned int pin, enum pin_config_param param,
-		enum pin_config_param arg)
+		unsigned int pin, unsigned long config)
 {
 	struct stm32_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+	unsigned int param = pinconf_to_config_param(config);
+	u32 arg = pinconf_to_config_argument(config);
 	struct pinctrl_gpio_range *range;
 	struct stm32_gpio_bank *bank;
 	int offset, ret = 0;
@@ -1267,9 +1268,7 @@ static int stm32_pconf_group_set(struct pinctrl_dev *pctldev, unsigned group,
 
 	for (i = 0; i < num_configs; i++) {
 		mutex_lock(&pctldev->mutex);
-		ret = stm32_pconf_parse_conf(pctldev, g->pin,
-			pinconf_to_config_param(configs[i]),
-			pinconf_to_config_argument(configs[i]));
+		ret = stm32_pconf_parse_conf(pctldev, g->pin, configs[i]);
 		mutex_unlock(&pctldev->mutex);
 		if (ret < 0)
 			return ret;
@@ -1286,9 +1285,7 @@ static int stm32_pconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	int i, ret;
 
 	for (i = 0; i < num_configs; i++) {
-		ret = stm32_pconf_parse_conf(pctldev, pin,
-				pinconf_to_config_param(configs[i]),
-				pinconf_to_config_argument(configs[i]));
+		ret = stm32_pconf_parse_conf(pctldev, pin, configs[i]);
 		if (ret < 0)
 			return ret;
 	}
-- 
2.34.1


