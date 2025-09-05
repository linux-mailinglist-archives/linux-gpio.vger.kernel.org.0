Return-Path: <linux-gpio+bounces-25675-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B534AB459C6
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 15:56:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58A2C1C2139C
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 13:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC09335E4D2;
	Fri,  5 Sep 2025 13:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="4NrXGP5x";
	dkim=pass (1024-bit key) header.d=stmicroelectronics.onmicrosoft.com header.i=@stmicroelectronics.onmicrosoft.com header.b="nbARquhc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF5F35CED1;
	Fri,  5 Sep 2025 13:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757080585; cv=fail; b=Gc7oQl5ixgwFQupYnyEs7PknSHSUbgZbMP/M94K+/3NqBXt8uVXI8rbXC4OjIAce5wn6FQAZWg6V6dwsjdUi/VmQmlgHGPSKa93ZjtIqaI+q9nuffEgMybRR1F73VXcZyK+WQPMGKP/0K9CW2KE+Wws7kvH4M4sRCZu6GK2KVLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757080585; c=relaxed/simple;
	bh=V9mfllwwXRyKe1IHY2k/ErlXSQI3ycla5iJba98+Odw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mzwWX4kDQ8gV5hJtUzVUbGonNAhOb5DDr1ULhFsUeYi1DjvEQBtWFp6vxjpMg24AkynzptXLhHHIXprCqMVBM2mgCk5upqJwb9MUSn21l89EXixn6RpcA6R5bQRy16w/yOtRugOuww6dvtKrau1QdtAEkt7RY5AOjYn718jeE9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=4NrXGP5x; dkim=pass (1024-bit key) header.d=stmicroelectronics.onmicrosoft.com header.i=@stmicroelectronics.onmicrosoft.com header.b=nbARquhc; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585CSwMj004022;
	Fri, 5 Sep 2025 15:56:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=cm3i722vY5sBe+3qC+OCKI
	j8qrJh5IcYW5dIGhgmaUM=; b=4NrXGP5xAiPr5ypqy7gLVJTprjmkiAA0S+o7BS
	wsfxdvHMNv2xvqn4r3aqaVjg65ggqIAFVKGoDvmV6Kwo2e9cL/xV3ifFDJg80NHJ
	67/hCIesngcSl7TJT89v7qVGtLj+3mqH6U8UY/6DJxsC83iRndlyUJmm4eMH1rx6
	vbFDtUwTTf0a+wn5eRn9obFGowepK9Wu/Zgdw2QJCFhhIxxH7h1dSqP5I/82SuCJ
	ueJUEoudLKWMiFODSxd+e84fw4c5mjS75TB34shlGUZGXNuGGdUej/umI9f5wY81
	9nLdnp9XBBM2qw9eBXtSRUMQ1jpiW554kiia/aSVXL+xU4QA==
Received: from am0pr02cu008.outbound.protection.outlook.com (mail-westeuropeazon11013039.outbound.protection.outlook.com [52.101.72.39])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48urmxubsy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 15:56:03 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FH0H79L1kloD3Y310zddXCKS2kT4/xEEV/gc88uOrKxY8RZrNKm50TNOvYpIhIyNcPzN3JuoLdVUbdtQGpaOFr5YAs+E9Oi4+GlrTJdRs8B8uxZclnRzYg/XAdPr71SlRoZvgp8p9EVTpZmEMkAfb25vEmkj6PNdkREhF+sgLySFwuZg/0ZqcZGiu8qihMBFBrnEb+ZXaIKMOp3bNSNrvXqWC8ERKN+zMAE4mNDF9vsqfgcIiVwSm6tW1Zi+guJJ/sz0yKKYopJ87k76Ru6mvY1U3Mmw6fcKxp4rZBYRewGBTCqSYYHV9OiCdfnzJ3FKYdwvWhNMAujfQhnqRUuTkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cm3i722vY5sBe+3qC+OCKIj8qrJh5IcYW5dIGhgmaUM=;
 b=uQcAiluUExm4LQxOKwsZBu0GX6cKxOa+uE6SfpsXlDtdSRNoOGAZ1Vd+XFJ7nH7jrjTKaFjcqs4MD7ZETvgLg8ezYT8ExYpF3X6J5Zp6q+ZeSapnITFtsY5ZQD6Vw7hmh9vVdA1m5+N5L3tajGDT5sf3kNeK8P2ER7sMa/ATC+nwInGxqZhgU72nY5uSVPQc71dqyZkpWgb1anM9UaNveAJAfUI4vdUaDRbXponKJzY26CRUxGpnmWjXaqyweIVsxhvc/H/WdK7+STJg63ssHbDClVsfJtKOzipVxN2vDS5LPNGgZ5UbTCBJiFFi4Js36UUSixaBKzm58m7gZSm36Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cm3i722vY5sBe+3qC+OCKIj8qrJh5IcYW5dIGhgmaUM=;
 b=nbARquhccQlNNv+1VmCgfFT424bnfsUfEqxxPI4X4V/hwaRJiGwt351bKgsu08wt69cVnVJhPCxIEl9SDH73FYWupm+2AfOXFW4eJyeFmtUnRon/yRsgdoX/i63HWwR1s6iQ9X8zt5sC7edWLzXrOuFLIkRIDSlHCBw6+w9Xp2k=
Received: from DUZPR01CA0169.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::13) by PR3PR10MB3817.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:42::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Fri, 5 Sep
 2025 13:56:00 +0000
Received: from DB1PEPF000509FB.eurprd03.prod.outlook.com
 (2603:10a6:10:4b3:cafe::5) by DUZPR01CA0169.outlook.office365.com
 (2603:10a6:10:4b3::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.20 via Frontend Transport; Fri,
 5 Sep 2025 13:55:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 DB1PEPF000509FB.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.14 via Frontend Transport; Fri, 5 Sep 2025 13:56:00 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 5 Sep
 2025 15:48:46 +0200
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
Subject: [PATCH v2 0/9] pinctrl: stm32: Support I/O synchronization
Date: Fri, 5 Sep 2025 15:55:38 +0200
Message-ID: <20250905135547.934729-1-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FB:EE_|PR3PR10MB3817:EE_
X-MS-Office365-Filtering-Correlation-Id: 42fcadf8-8245-48f3-1c9d-08ddec83f202
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Nja3YTWnbAWU+h2LHSQwmr38H2gdYrHN3eO4CdHa18Q7S+P1oTL21DCX6Y66?=
 =?us-ascii?Q?8an5ZuCFxx1U4HXBv/nb2INc7hs5TVIWpv1CWxIodArS7C6WTzt4eSlFeeiY?=
 =?us-ascii?Q?7RuRYfP3UlOOEINsEth5PYgCsLf6JVviiHgUcFx54tQzkQbIl2UYifHZIcJk?=
 =?us-ascii?Q?Sw/Ww59ouDuGPLJ0tbvhlAUSVemBAWdAgujdbJyfQGIN/PAI+4g/ileokDpM?=
 =?us-ascii?Q?gXnn32gPSW9cVzJ7mcneX8rCxVv9MvbdbYtnBM4snbxpzR6P/Vx82m3WHkq9?=
 =?us-ascii?Q?KjlONZJOUz6Jt6jK+zUwEgjJ2J2enDJ8E0RPX+saZ11JFHUtZPvjh+ZQB0GB?=
 =?us-ascii?Q?u1vc6SEJEliFnoJZ0kyBZz8iZG3+CwAfam6uEl+2oNzB2hex4CE7MMehMFUp?=
 =?us-ascii?Q?iunlVDktSJpvP3sscNzVGmO3IP+WXYdkdE9us6Oqv2Hf0Ao1cSwkLZXKKrch?=
 =?us-ascii?Q?cwXPFOI5YYJ33ZzewwK8cD7+HZk+Vh3vqJp701b+J8DIAp2KvVkHNVsI1nKc?=
 =?us-ascii?Q?8GJXdbqvkkmiUszD90qApRG8ppuUzH3MHNYvr5TAsiFC+kGxySazIgcIYyJ9?=
 =?us-ascii?Q?Hyrod6TYne+hp29qu9eBHDc0oZUEc49Pc4sP/s1OcyutYrrWJjgxxYv4d0Dv?=
 =?us-ascii?Q?ipeIwtJ6DJFyayg5NwR6amHdbapb8zOmYxm3Tooq0eCQKUrSoa9w6UtW+Pp2?=
 =?us-ascii?Q?yXWn6jClUVFoDXAzKFLIc30iPRCwdwfm6ey+ZwePJ7QAiTwa8tLAKb6GyqIT?=
 =?us-ascii?Q?oCv5F4+B7jBcw/uTQb8hT7jVFp2F7xvbwyHrH8BANcqdiAodjfd9mUJ0AH5/?=
 =?us-ascii?Q?saVYf54Lqu3lNFCq1qEy5yT9W0lLMBf8g/A14SoniRd/08ec0BLmzR94sLs2?=
 =?us-ascii?Q?kS+ClO1gS8mT8+ydV+jqQn37dRLdswEHg68CdCy2kXx9hxergIeVB60YihI/?=
 =?us-ascii?Q?SFTb13RatyRDZhNj198y7bCV/HL5fUeY+IES5EzXyHv+p4J+Un+3yLy6mmMD?=
 =?us-ascii?Q?AvU8RQlORTD4wJK20SoeK+Qia8/9qS9TTj6ILFk2jxF+CSwEWOyt9WXaKb9J?=
 =?us-ascii?Q?cM3GVX2iA8PxF1pnqiqm/PdPfOu+0TbeBUrO35t53acf1v/wAfIERgUUR64Z?=
 =?us-ascii?Q?tNeR4UVNFqTdUt+IgVgo4wxKxP/rcDcT1YszG8QOOWSmI7edBJkxplyl5iwM?=
 =?us-ascii?Q?4FJPzYYBMzW/KyTNf0oVnv4opw3TBRO8e2uXs/U2+Kw2IyocrBPbvz3HGbJd?=
 =?us-ascii?Q?Zm8L9TwDKz/mwduzmGQrWImAXpZNONePHcsBdwWJdqarsxMplNYbqp7gr563?=
 =?us-ascii?Q?fWH/RjvOdTLie+v4Yd8bkN2/QuHaCGeGjXRsioZedX1DKmPYV8QeQItHerC5?=
 =?us-ascii?Q?ZUs19wqhE8DRUFQN/T0Pd/M9LqRzyyV/fqy3zRqUv4w/ZxO2t6BwWLRIjQOT?=
 =?us-ascii?Q?ucDc0HxPpKGHYhX+Jn8zEsv+aGFzumDgREjBe2OLGC00xcZtd1MWjCicWk0e?=
 =?us-ascii?Q?RCcd254u43TbHNs9FMZj4nYKqYBjdLn0tS5+NKFPkITRc1V4Mx9sNDP6wQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.44;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 13:56:00.0304
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42fcadf8-8245-48f3-1c9d-08ddec83f202
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.44];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB3817
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNSBTYWx0ZWRfX5xd926UNlYQT WPr20PMwqmSHS7Y2HpFh4wwuoXTFwaIb+M12UstHPG1j6AqZm4hC+tfNN3NYmh7hDVzKYxOOhxs jw3XTWB/EiaZfpTH1A2CTWL7Sx1Kd2fzheioBiZLLkwfhc0LF8SkLGiBru+P8FdKlS3BsnzKKc1
 YXHuZu+zv3UpL6DuJu2I7J48XUa7WGajfg+N7RotYnuT9d47WFwcB1k2Slzc5OjwFBxn4xtgBev E5/rNgjiuzLxTnZgp2T54scrOY8iF2CcCrM9/+aaxUbXUqJtYklZM2VF7l8aTVsTzRTkBGZl1VD CiH5S+elldAIoW5r6Vxt545z7OqeLCzkueAomBkQAq8W09s743n2CaDXd0Wt8w8U5b8VaLb0oiY 5dvaRRLZ
X-Authority-Analysis: v=2.4 cv=dqLbC0g4 c=1 sm=1 tr=0 ts=68baebf3 cx=c_pps a=pv+iSUMxSX8tKyfHAWeKVg==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=y9YUpebZf6kA:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=VwQbUJbxAAAA:8 a=8b9GpE9nAAAA:8 a=N9hAaWMDDcpL-UdVeGoA:9 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: vo2Kc1XbH8CkPdDmVtl56gRKrAZR7xIN
X-Proofpoint-GUID: vo2Kc1XbH8CkPdDmVtl56gRKrAZR7xIN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 suspectscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 spamscore=0 clxscore=1011 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300025

This v2 is a subset of the v1, split-out to simplify the review.
The old patches concerned in v1 where 05/14, 06/14 and 07/14.

This subset:
- introduces the generic pinctrl property "skew-delay-direction", as
  suggested by Linus Walleij;
- applies some cleanup to STM32 pinctrl driver to simplify the following
  commits in the series;
- adds support for the I/O synchronization in STM32 pinctrl driver and
  bindings;
- updates the DT for STM32MP25 pinctrl to use the new properties.

Changes v1 -> v2 subset:
- rebased on v6.17-rc1;
- replace ST property "st,io-delay" with generic "skew-delay";
- replace ST property "st,io-delay-path" with generic "skew-delay-direction";
- collapse the other ST property in a single "st,io-sync";
- Link to v1: https://lore.kernel.org/lkml/20241022155658.1647350-1-antonio.borneo@foss.st.com/


Antonio Borneo (9):
  pinctrl: pinconf-generic: Add property "skew-delay-direction"
  dt-bindings: pincfg-node: Add property "skew-delay-direction"
  pinctrl: stm32: Rework stm32_pconf_parse_conf()
  pinctrl: stm32: Simplify handling of backup pin status
  pinctrl: stm32: Drop useless spinlock save and restore
  pinctrl: stm32: Avoid keeping a bool value in a u32 variable
  pinctrl: stm32: Support I/O synchronization parameters
  dt-bindings: pinctrl: stm32: Support I/O synchronization parameters
  arm64: dts: st: Add I/O sync to eth2 pinctrl in stm32mp25-pinctrl.dtsi

 .../bindings/pinctrl/pincfg-node.yaml         |  13 +-
 .../bindings/pinctrl/st,stm32-pinctrl.yaml    |  92 +++++
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi |   2 +
 drivers/pinctrl/pinconf-generic.c             |   2 +
 drivers/pinctrl/stm32/pinctrl-stm32.c         | 337 ++++++++++++++----
 drivers/pinctrl/stm32/pinctrl-stm32.h         |   1 +
 drivers/pinctrl/stm32/pinctrl-stm32mp257.c    |   2 +
 include/linux/pinctrl/pinconf-generic.h       |   6 +
 8 files changed, 378 insertions(+), 77 deletions(-)


base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
-- 
2.34.1


