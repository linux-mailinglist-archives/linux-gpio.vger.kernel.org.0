Return-Path: <linux-gpio+bounces-25683-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 403C9B459DD
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 15:57:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E99091CC35DB
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 13:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87A7C36809B;
	Fri,  5 Sep 2025 13:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="bcK6xcB0";
	dkim=pass (1024-bit key) header.d=stmicroelectronics.onmicrosoft.com header.i=@stmicroelectronics.onmicrosoft.com header.b="h5VibSLQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8B3362090;
	Fri,  5 Sep 2025 13:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757080592; cv=fail; b=oMC3ZZz7rOogJf+FRpzyuINwPbFmRK8kUAc/yicVFiphb4pkhrjjpvLLxks3teNp2j2eGaAlFCBEk00bxd6F2xncH4ng/MzWbZyp+I/jhuvOxUDwhKce4tBEP2pakmA6W8RumHkPKTkchK4BWvA32IeJMOHAljbmfF1MjBToaJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757080592; c=relaxed/simple;
	bh=Hdjt18m5tdRvFULKkv7ZDNtO1K+kKRQSIhwYa3x5m54=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qh8qENyBsUgi6pCadNupOMQa27pxHCLZLsHGGpTIu7QJUjbA1RRiiDtPB4Xy96ZGOCy/ONlsnH1fVwv/ZXJ9jtB/PpI06eYutvA1TtLBRUZedAuwlLqZD19OgeTDQCy9nX8FY643pGuKwVyzcUgB1JDl4pRwuPBeXtGCJSUkzLc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=bcK6xcB0; dkim=pass (1024-bit key) header.d=stmicroelectronics.onmicrosoft.com header.i=@stmicroelectronics.onmicrosoft.com header.b=h5VibSLQ; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585Drjtm012018;
	Fri, 5 Sep 2025 15:56:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	kliRin4QiexKHktvU9gtBkvMNPW/7hVVt3BDB/9+9Xw=; b=bcK6xcB0tYWIo6Ew
	pPB6LJWWr5Huo/6IWHPoJnAqeXuqbSk84H0zVFlfTNfymd9i05HbL0dGfsnFvbiY
	0Ha7FDC3SPyWQHCNcroVxJs89uMALSiBc/oXFYmRgrF8BeidNTl6Dd/IjdFs0Udc
	YEZcTc1L4hkY72tT2Cxa/fQDB2iSQVJejDJteEl5zW+f2UmkCgND/QwokqDqcd3U
	DV1NJZnif89Ga0nyJb5pRFKBWl/kAqRCPaGIJeA8Hjx8OycFA0uv0hAKb86ZeS2Z
	lFe6C4gYbkmeM0mZfuOOzJXdbQPcPMg1uxDzrhFF78lzns+q/Q56miwYVDUnvbDp
	5hf0Jw==
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazon11012011.outbound.protection.outlook.com [52.101.66.11])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48upe7ts1t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 15:56:05 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yHAvByBBz0lImmkdyLfusVOCUBn80G1bUjNO38KtQQGHSJ7bwFKT1WPp7MRIvmx1r/Wy1M4qSR+INh+Xwq+tp92k00aR04bbB7Hq9qBrKMQnV31M5OaBkXLUe32zrZNlCyczzICjIxLKxqC1I63NCV8upjGTn0HPiT5YQ1DcEK0F1fI9EMdfk/ziA/OEsBgQvTebarPEEaXPK5rbRqUsMRHFZQigIGo5CHnnLR80Ih5CXd15R4P+QwSuMX4iC5LrffzUyP+Uy0VOUL7OmAQlbvb39XrYEn1kb89UpQOBJMATN8twOQe1VwKbBaTRZN38eiXcujI9S4AnqLUf1nw2PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kliRin4QiexKHktvU9gtBkvMNPW/7hVVt3BDB/9+9Xw=;
 b=lMQzXyVFRoKBGW8Q+AADfTa+PsWbaZZ9KDmrQpRwF4D5R95AScgT2Fk0ei+b6OndaceDUNqEblSz9Y8Bdvr4w4vW116hvoTCrY5OAv/nZvuKooL+eVaVf8I00HTDLCl6GIu/+UAShmSMjO2jvQfB3mHbRVZD4Oqg138nRmIPO0h/RUjPZRTnZzTInY4LFgFAcRwcqJWyBUx6D0YE841yGhVnRBnbE9b7PHMhE1z9ifPDsM7q+MtTbIT3jscvh+X2bWewfEyKDi3luz3AWMeDRoUcbDw+T9pX+G9JHZ+H2nLcCkBFonoUDtgvoBOPHjXWXNmmoeJIrOvW/i71Jm6QfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kliRin4QiexKHktvU9gtBkvMNPW/7hVVt3BDB/9+9Xw=;
 b=h5VibSLQ9TFsUeJJl47Ev+ZrhI73ZuGtzVeaVLCX1y/xFPb6b4HKzHB3hp6LjlX2veiasPHencyzAgzERKDRtMaVFkYa5Ba+VLjBCXXKisDB/+Tai5kqphyg9f4WUUsVUO1w+dXv1RImBXQWrN/t3SJ2D6EPzUlzgTVgLiJ3So0=
Received: from AM0PR10CA0106.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::23)
 by AS8PR10MB5832.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:508::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Fri, 5 Sep
 2025 13:56:00 +0000
Received: from AM3PEPF0000A78D.eurprd04.prod.outlook.com
 (2603:10a6:208:e6:cafe::4d) by AM0PR10CA0106.outlook.office365.com
 (2603:10a6:208:e6::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.20 via Frontend Transport; Fri,
 5 Sep 2025 13:56:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AM3PEPF0000A78D.mail.protection.outlook.com (10.167.16.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.14 via Frontend Transport; Fri, 5 Sep 2025 13:56:00 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 5 Sep
 2025 15:53:41 +0200
Received: from localhost (10.48.86.11) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 5 Sep
 2025 15:55:59 +0200
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
Subject: [PATCH v2 1/9] pinctrl: pinconf-generic: Add property "skew-delay-direction"
Date: Fri, 5 Sep 2025 15:55:39 +0200
Message-ID: <20250905135547.934729-2-antonio.borneo@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A78D:EE_|AS8PR10MB5832:EE_
X-MS-Office365-Filtering-Correlation-Id: ff6146d8-0c02-4e6c-0d51-08ddec83f235
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700013|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?m+2Qtk14Q1b4gpu+erwrHNk3Us/VueiGI2aTGMLBEv2LZcYmDL56UIV9rDQL?=
 =?us-ascii?Q?nSw774VEUheacXoxMHFMVNcV31VyUkeX8uUoF9Y+qvl7SeVBtjrQ9ftPp9b+?=
 =?us-ascii?Q?C6nd11c4OtENDmijNnOJ5f2YfgqYk+DpswepdORT8NrjOu9UO+qCtMMeZ7q6?=
 =?us-ascii?Q?hzrz34AXpwc80DIIqmj7bm4mWXNED10Ll7qIv4zPWjMSOlFTV2cjtb2XGGEd?=
 =?us-ascii?Q?fTBQwf3USQIPjfw0JtvIY51Z/icTB2BI1HQFscVmuz/Ucp980j2m7zJaWjys?=
 =?us-ascii?Q?Bv+4cqGl8hKBD4VpIGTcdF4dePxZPzJATeec2LI2Ils9cRAGnqnqn6spA5p6?=
 =?us-ascii?Q?tmnPmY4RoAx0rP7itHuuHLJze1z6FbrhY4bHokyZRYewwv+wPAjKYWx3mook?=
 =?us-ascii?Q?8e063lwCFDAey0mUaIZ18aRrgx5VlouT0bVtLy9ljhwY3R3VF5lhOpw6npCb?=
 =?us-ascii?Q?1+k5/MOMqAyzv/Mw5tklckTq3uOfqrwGu3HfRKIZW6jr9+yVyt6bEFh2yG2c?=
 =?us-ascii?Q?5vxZ1BPWo/MdFBvxHkjjLo39QHnNiUM8UbDa7CrEWavhzQM5I6dlDp/6EJRq?=
 =?us-ascii?Q?AJ28exJQ/Dp6dzCg556pdxhYEF4TTdAgl352bS4HLem2wrwvzFkkoRNmFVi0?=
 =?us-ascii?Q?wtPWPs+3CvJVWrg8P190mvqANK7sqkyVPy9hsm9vbWPsoP5lVtZmvvb0lovH?=
 =?us-ascii?Q?zbYcG3ygL0cxQQCZet/kbgUYqGUhIuoyr5npx4hq9HuI8HbJXUYd/o7GEASR?=
 =?us-ascii?Q?s/zKDMf69xqA/FAghTILHHieqp69VVP4Ltl2/K3J7w3XoIqIx2BuoAbqz6yL?=
 =?us-ascii?Q?PpE692aZK5ResiCY43fLaB3LZVJJ6JRMnwX6M17qPXciN8GM7b42Y4g0imFQ?=
 =?us-ascii?Q?IZWnzeDbPzxRDRt9gasA5gvkZqRTNpu9bkIzyOZ6FOTVXNWVJf+zdOQNu0c1?=
 =?us-ascii?Q?6MA4MaGG5GJqZrE83UnOXlyT514RhlFEz3H0+meLvepDtTtpiq65GJXNx/38?=
 =?us-ascii?Q?2M+ENah9ySCgCcK02+wH14OGDORGEijYuoKtuUINfMHMKWUusQ7icMwNb2+G?=
 =?us-ascii?Q?ar7O/W6793XE2dWYyuWiW1i1iAWZj474vO2UWpG2uE2kN064pe9gA0ZQGWbc?=
 =?us-ascii?Q?4qY4laXHc4ld5RZv2800uWiNEtJLjYVXS8G9HC518UTnzTkNwm8XqpR2+irv?=
 =?us-ascii?Q?SQIQHOlDFq+JO9y1K9ja8QkWMb7oT1magt8uW6pR/cRe6pJMmPYQGo/SQ15N?=
 =?us-ascii?Q?04jXzGaQAM+fvjWLfoHNRLTqn28ApLiaYfHefqLCkivJg6YKVZo4u8Vvq/Hc?=
 =?us-ascii?Q?lOIgTKI94Ug/3SovsbIbi9uSTJshMdERTAxWKd01nits/Y7suN3oLJa5v4xM?=
 =?us-ascii?Q?TZOhQAlQuHmlIGQHn3VEKOsVEMLAHk9RRxUUNPSo2EXEQkAjToSANFXFtMGa?=
 =?us-ascii?Q?GaFebO9BkKRRlp1iuXDk8+1jNEuHb+kk9Z4ZLf6km3EgBwXk2jn1wyRphG8i?=
 =?us-ascii?Q?3U9rYHJGt5q8TiRaW35XWkYkQigVbcyd9WN/riwSQHAfQgnPnB+aHw83gQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.43;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 13:56:00.4016
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff6146d8-0c02-4e6c-0d51-08ddec83f235
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.43];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A78D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB5832
X-Proofpoint-GUID: b9V5UPdadA21bueLA2m0bKmkSI84umv-
X-Proofpoint-ORIG-GUID: b9V5UPdadA21bueLA2m0bKmkSI84umv-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI5MDIyMCBTYWx0ZWRfX06xGFul2obWM b8S3drXuIZOIsERqe0m7G/52EtFZ3XPA0DqEPar+9f52W22sj2V4a2/KZxQdqpYHbSgC6QkS+3b PTSbmxPk/yvUV8Y4ywLFLFZcpF91nd0gPry7e4InTxeJAU7y62GESvRkrnrtYA7SrhHZItNm15S
 wpKBMsyT/Gq10yUSwe/LCVgdLkruatubafsgWc4Cp252cpjbY/slFHZFZ8b9BMcoBvsEOc4YoFD JFWz9elJDTWTGe13pw1FOnw65TlNkh4OrvmZQNd3bgK/Teo9MJdtNiGRvXeJoGBFlrT2/ltDx33 Xtilcy5p0ns1BJJPivrXriQu+NC3Rx+zAtJPJlUeMxOEipMMz0gNk//hs2QUSWggvAnwLSEIGJ4 3rZIM3IZ
X-Authority-Analysis: v=2.4 cv=Vq0jA/2n c=1 sm=1 tr=0 ts=68baebf5 cx=c_pps a=ZPycPb/c0f+ZTB6yQ4jH7Q==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=y9YUpebZf6kA:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=8b9GpE9nAAAA:8 a=xf320qtOAoSKBp3c5q0A:9 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 impostorscore=0 spamscore=0 suspectscore=0 adultscore=0 clxscore=1011
 bulkscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508290220

Add the property "skew-delay-direction" to the generic parameters
used for parsing DT files. This allows to specify the direction
(either input, output or both) on which the existing property
"skew-delay" applies.
For backward compatibility, set default to 0, equivalent to "both
input and output directions".
This enables drivers that use the generic pin configuration to get
the value passed through this new property.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/pinctrl/pinconf-generic.c       | 2 ++
 include/linux/pinctrl/pinconf-generic.h | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index d67838afb0857..d2713fce0ab0f 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -54,6 +54,7 @@ static const struct pin_config_item conf_items[] = {
 	PCONFDUMP(PIN_CONFIG_SLEEP_HARDWARE_STATE, "sleep hardware state", NULL, false),
 	PCONFDUMP(PIN_CONFIG_SLEW_RATE, "slew rate", NULL, true),
 	PCONFDUMP(PIN_CONFIG_SKEW_DELAY, "skew delay", NULL, true),
+	PCONFDUMP(PIN_CONFIG_SKEW_DELAY_DIRECTION, "skew delay direction", NULL, true),
 };
 
 static void pinconf_generic_dump_one(struct pinctrl_dev *pctldev,
@@ -190,6 +191,7 @@ static const struct pinconf_generic_params dt_params[] = {
 	{ "sleep-hardware-state", PIN_CONFIG_SLEEP_HARDWARE_STATE, 0 },
 	{ "slew-rate", PIN_CONFIG_SLEW_RATE, 0 },
 	{ "skew-delay", PIN_CONFIG_SKEW_DELAY, 0 },
+	{ "skew-delay-direction", PIN_CONFIG_SKEW_DELAY_DIRECTION, 0 },
 };
 
 /**
diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index 1bcf071b860eb..7e49d4e60b9fb 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -108,6 +108,11 @@ struct pinctrl_map;
  *	or latch delay (on outputs) this parameter (in a custom format)
  *	specifies the clock skew or latch delay. It typically controls how
  *	many double inverters are put in front of the line.
+ * @PIN_CONFIG_SKEW_DELAY_DIRECTION: this will configure the direction of the
+ *	skew rate or latch delay. If not present or it's 0, latch delay (on
+ *	outputs) and/or skew rate (on inputs) is applied. If it's 1, then only
+ *	latch delay on outputs is applied. If it's 2, then only skew rate on
+ *	inputs is applied.
  * @PIN_CONFIG_SLEEP_HARDWARE_STATE: indicate this is sleep related state.
  * @PIN_CONFIG_SLEW_RATE: if the pin can select slew rate, the argument to
  *	this parameter (on a custom format) tells the driver which alternative
@@ -143,6 +148,7 @@ enum pin_config_param {
 	PIN_CONFIG_PERSIST_STATE,
 	PIN_CONFIG_POWER_SOURCE,
 	PIN_CONFIG_SKEW_DELAY,
+	PIN_CONFIG_SKEW_DELAY_DIRECTION,
 	PIN_CONFIG_SLEEP_HARDWARE_STATE,
 	PIN_CONFIG_SLEW_RATE,
 	PIN_CONFIG_END = 0x7F,
-- 
2.34.1


