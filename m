Return-Path: <linux-gpio+bounces-25679-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD74DB459D1
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 15:56:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59D5F189F2FB
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 13:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D775C35FC19;
	Fri,  5 Sep 2025 13:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="2kC7YXxI";
	dkim=pass (1024-bit key) header.d=stmicroelectronics.onmicrosoft.com header.i=@stmicroelectronics.onmicrosoft.com header.b="Uw1nk41T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A1C15530C;
	Fri,  5 Sep 2025 13:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757080587; cv=fail; b=iuda/q+xiPrIx4M+c6HqEPpkv3WlfCguPnyCwIDfB4Rreph8vzoFIgUEJ8wcxIjeIhglDp7580JImziH/Ksgag1veulUs3wGP3hJ6xyhh6fXMC+o40sjEJpwFPRP12nG1dTjMdXKZTkYH8heq8nFJh4mXUboEYeyoCkvTYsskNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757080587; c=relaxed/simple;
	bh=EU23F6oL9jcfFcRqUUo4L0tmzIhLKJCnWrUV4z9rWUY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kNp24RLemPKFRSppk86zibtbjYQEH+1aEK2+fKU3P52lSOmIff5kYacAVsIBpqvOzi+8iVWlo/6oQx81HnyQScm701bEFXLniW31AA30vtT9F/Ca57+YdG0qLN0W5F4xr7dPfD2t68NOUOL+Gb2bvuPLULvjheFqY3KFP7g9Ewc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=2kC7YXxI; dkim=pass (1024-bit key) header.d=stmicroelectronics.onmicrosoft.com header.i=@stmicroelectronics.onmicrosoft.com header.b=Uw1nk41T; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585DTFPk026407;
	Fri, 5 Sep 2025 15:56:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	CZJy36QOK99M5oe0yblmm/fvoZz7k4KaykNoblNAG8w=; b=2kC7YXxIjzb1bVoy
	4EGW3GiWoVyr8o0Llukre4du/vgFdry3H4LB14f4VdRIjQOFjkgM6lKbhT6rKsKT
	ZzUz1idRy/5oBHMgDxEGNyuYycSa5gsx2MHfhzZwTZz/yhDBpskYYeGxHdSKfvnP
	tbSrQjarsGhEV0ZXQteB9At0dcqpdTOl5jPc1eNPrrO3KPfVMrv4vBqFOYJB/1O3
	IiLzApsblVObTQhduFPbYWLmjrNWmUtBR5GmvLgQTd2/Hr0AMoa8aNeFvbFs5Nc4
	92W6AY4lkp32UtVks1Yk5UqK3DskPxzRPEsQR4DvFnJgMbUplFAULwr4rTv7hyAk
	TNgpQQ==
Received: from am0pr02cu008.outbound.protection.outlook.com (mail-westeuropeazon11013041.outbound.protection.outlook.com [52.101.72.41])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48vav3118t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 15:56:07 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mDo5qGHTHsxgIaYUMskt8Mhmvnal2MvLYO3EAmuJeb0cwPY+2z/gl7AE1/okDzKkpOE+hAErWDP0EzxFW2S+RrP7/IjHnu9YokzutnENi25P9zP7HBHLxLVskOEE/GgUqoS2M1fRamZ4JAN+tKmcnuTTpu7YimViNQQ14MePdgbc+zW4OcJk9TvORxJ2bd7iBrufaUNY736e0haaDCj94psqWP5BFrGay6tOVpUu5jgcwUTkT+v5faPIefSZ5vn3RsrFP6xJabahfoM/82gFX1VMJPS7+1utLg/jkcLI0mNO1A1TXXXkZVSkBhCMBRiN2ExVHjL2k6/BQk+0514kDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CZJy36QOK99M5oe0yblmm/fvoZz7k4KaykNoblNAG8w=;
 b=O6+2zLJ/su7G7iZ2VIpu22S8NCTw4dX8izRhbsFzickizbaniR4dBkEbQrpDWm4gBtRAnsAev0Nd1PFPGo5ADtTT39YbKZmfTuZ/D5sE2vXYUq4v9xmQtkey0H+72ZrqZGovvQT5eud02bv+XddD5nb/UkKELJXq+CQpfUNC+N9E1Vk/kdTyLLH3JAgIt7hd1W5QcJJGof72W6iJAZc2z1NhTGWdj8F1/OJyAlpbIpAbSiUMSTI1XcMwfAYkA8y49qV5WMhP+9rT0xaGMYHXdgrQ7cfrA1+ggBX9QZyArTFlVpR2nmsSRrt7+kD8/I2RcY8JMVCdQRVTTBEfEt3HqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CZJy36QOK99M5oe0yblmm/fvoZz7k4KaykNoblNAG8w=;
 b=Uw1nk41TzmWbQF1w3cnyGHx56+AwXdPEzkj4PvmETHfCI/excTbQdQ+nZbt9vn7KGeKSPlDOu9g5FC9jx4UD1LhqkH+0HAU9sow5cftxsHJsQ4jyVJrJ7ylsL6IhNFyzMU/Vrw7URSJ0SHGY25FWXxgfT5aocGuWoMFQy/ewFIo=
Received: from AM0PR10CA0119.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::36)
 by PAWPR10MB7789.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:365::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Fri, 5 Sep
 2025 13:56:05 +0000
Received: from AM3PEPF0000A78D.eurprd04.prod.outlook.com
 (2603:10a6:208:e6:cafe::e9) by AM0PR10CA0119.outlook.office365.com
 (2603:10a6:208:e6::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.19 via Frontend Transport; Fri,
 5 Sep 2025 13:56:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AM3PEPF0000A78D.mail.protection.outlook.com (10.167.16.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.14 via Frontend Transport; Fri, 5 Sep 2025 13:56:05 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 5 Sep
 2025 15:53:44 +0200
Received: from localhost (10.48.86.11) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 5 Sep
 2025 15:56:03 +0200
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
Subject: [PATCH v2 7/9] pinctrl: stm32: Support I/O synchronization parameters
Date: Fri, 5 Sep 2025 15:55:45 +0200
Message-ID: <20250905135547.934729-8-antonio.borneo@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A78D:EE_|PAWPR10MB7789:EE_
X-MS-Office365-Filtering-Correlation-Id: 90f52cc9-7435-4324-72e1-08ddec83f551
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?akfu01tjazHE4FBpK89/wbop42QPoQXCdSagKmrx2DNfOJ5M1vzSqLSG2esQ?=
 =?us-ascii?Q?i86BfNlWCFUObYAkDQr90irrzu/geeZSEHrpnK5XxzzMR8lhyWs3NNQ7917e?=
 =?us-ascii?Q?Y2hoVbgxHHkuioUlVOAMh19v3ExbUTTjGlC8b4N6qq9pxjdFGFK+NQsBqOQo?=
 =?us-ascii?Q?DhNu3W9fItbFtbka57BN3030jb49PYrDeP2kGy/C+NC/bpujj3pX97apjexj?=
 =?us-ascii?Q?GPgAf3L72B6A8rLKWoUS33ncaNOByRlAbwYC2CKSs+REFkhwef+mRw6lt1b6?=
 =?us-ascii?Q?gaE9JDcEQOnjjnSfYNTRYaCLBiQdJb1MK+TzbqdtxDklS0lUBvwPecsIEhHp?=
 =?us-ascii?Q?sJbLXNhCrDu4bEhBIPHxCndgUEotXjneMh3z55RxTT4WuprSxqbzoI0HSD4z?=
 =?us-ascii?Q?MrV66brnEW4U2UOa3NMHrrOLNdUyr5pR5gAIwELAMlP88SZLSfmjFE+tZE8G?=
 =?us-ascii?Q?AucpA8zkVUrGN++Jdkh+ZGI+t8E9E8LVBgYsX8i/HoODW0JrpQ6tcB+QwACN?=
 =?us-ascii?Q?TPgcG724EIX9LgVeAr8ojFFQRNulSSd98kV6/saubcwI9jlFi+C5TyhflRtS?=
 =?us-ascii?Q?JtVb8PvWhZxgwa3tZ1RbT5hTtYIX+OLqwjkVf4Bj2M724aUCi7lSa+Zzu6Xv?=
 =?us-ascii?Q?9COXEX3bHTHtrVQlkPmhtpMBEgVL7h1lEkihgujtSZVZVGA2nBo287zMWQQR?=
 =?us-ascii?Q?sS4ATN2w/e1Vsumb8Y+5dF2n3hl0vFkk9211AJR9p4o+YKZL/ryph6NRvTLe?=
 =?us-ascii?Q?rqusOify26M1cQP2Y1qt7Qf79pPi5hgCiUXsJPbpHtxqKNGkTD3DVbH+yJcn?=
 =?us-ascii?Q?1YM5/vSxsjncN7SBCUGBZdZgIZbry7URn7HcjYYCUi2s5kDU2X+gcgvbgvKq?=
 =?us-ascii?Q?1eiJ6LXaFuvmHJOnVBQe/6FXWRCL38aJ3FDAm4a1JbkiM+MNLbQiFu0m8Yn1?=
 =?us-ascii?Q?PhBFzEOQ0wu+xwQc7SAVBYxPCcbcGvnQXMqM47zfsIpkCWmAnCu3FAEimYAE?=
 =?us-ascii?Q?fCWat5kMHVz1bZHGAoD/VbxyssaZVqIqEe4aeAD4JL+ir72GPQV8pffZV+7l?=
 =?us-ascii?Q?7KdENYIh6yp7kMcU3nvNlB9kQFGq5Hfd2p73fR6ilLGfohk4MrOM2uKkSp2C?=
 =?us-ascii?Q?8cClJfQ2FyX7PE0dL0CcqA9LX8BOwNOUjAtXP4IcFqiJ0+ZsSeuKO+wGii2C?=
 =?us-ascii?Q?+R45B8qclNhrhEtnkwGcGe7lv1DL05uwrhx9n8rLPaIteqbALAV4TB7RfmuS?=
 =?us-ascii?Q?cI6yA21L4/dV0IdjNGDpt9+a41PDe6A/o4HIEXnKM6AxCdCBaElHjRDDpl5U?=
 =?us-ascii?Q?I2VL16jDACFv2HWUGLsptiXDltacO5kZ2AceRWiw0dvh+w48rsic7SYK1F+n?=
 =?us-ascii?Q?+BnsblByPTO1kMg6oShci7/7tRoNl0EZEFlQKM1xU1GO2M0YDxzrPXMeBpe3?=
 =?us-ascii?Q?v9YE67V1uQ+OLZZeaTMqjItOcakRFCHt4ZEuyjjSRhJYSlI5AGw3m7sgqwb3?=
 =?us-ascii?Q?+ikQ2wjC+7rrD6ZXLz7OUD0lqTtUS/Wvd6u5crf6MZ8/nNkKwaa+X401ZQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.43;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 13:56:05.6120
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90f52cc9-7435-4324-72e1-08ddec83f551
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.43];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A78D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7789
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDI1MCBTYWx0ZWRfX+CvuR2Y4z44h soD2shTL9HL1Nt4dSc9T495RNtGYsSQAKmHMfMSdmNyLd0vSVoz8BLDDcO6cvmVOqg1uhqW9gid jHbd6x5bSQem9xqZ/1fMFB5ULPB9JQJB3GolbdjFM2kqcorZxBdWj/ZTxQLPbKWRD31yHQmfvli
 q9m9SfxcWGXUfCTZ24GuWvcnkr4k8Fl+2JaDokbBn+nxT3OFcKcF5K1RKfyTA3GKl/VArs//qmd XrfDZN8Z5rF4UWtswCD6BlHvRkyHvibARBBGMjJBooQkxojokXnu+faUc+1tqiTGvfg+I1jQDGw qkkgizVlibLJGHhwip+IqC0heQSc3a6UE534G+AWXfORb2kNIoxeJoh54rTIr/djFvgf0M8OigF xzxKFnus
X-Proofpoint-GUID: au23U3NjklTxSPIcBhMKtsoQ3pD1q-DN
X-Proofpoint-ORIG-GUID: au23U3NjklTxSPIcBhMKtsoQ3pD1q-DN
X-Authority-Analysis: v=2.4 cv=bchrUPPB c=1 sm=1 tr=0 ts=68baebf7 cx=c_pps a=n4skp7f/kd8NQtG3blCMdw==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=y9YUpebZf6kA:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=8b9GpE9nAAAA:8 a=GcfiOUnl-Qwgb4vcQAQA:9 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 clxscore=1011
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300250

Devices in the stm32mp2xx family include an I/O synchronization
block on each pin that is used to fine tune and improve the I/O
timing margins of high speed synchronous interfaces.
It can be configured to provide independently for each pin:
- skew rate on input direction or latch delay on output direction;
- inversion of clock signals or re-sampling of data signals.

Add support for the generic properties:
- skew-delay;
- skew-delay-direction.

Add support for the property 'st,io-sync' to configure clock
inversion or data re-sampling mode.

Show the new parameters on debugfs pinconf-pins.

Enable it for the stm32mp257 pinctrl driver.

Co-developed-by: Valentin Caron <valentin.caron@foss.st.com>
Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
Co-developed-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c      | 235 +++++++++++++++++++++
 drivers/pinctrl/stm32/pinctrl-stm32.h      |   1 +
 drivers/pinctrl/stm32/pinctrl-stm32mp257.c |   2 +
 3 files changed, 238 insertions(+)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 8d2f409342313..f5026e34f97f4 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -51,9 +51,21 @@
 #define STM32_GPIO_AFRL		0x20
 #define STM32_GPIO_AFRH		0x24
 #define STM32_GPIO_SECCFGR	0x30
+#define STM32_GPIO_DELAYRL	0x40
+#define STM32_GPIO_ADVCFGRL	0x48
 #define STM32_GPIO_CIDCFGR(x)	(0x50 + (0x8 * (x)))
 #define STM32_GPIO_SEMCR(x)	(0x54 + (0x8 * (x)))
 
+#define STM32_GPIO_ADVCFGR_DLYPATH_MASK		BIT(0)
+#define STM32_GPIO_ADVCFGR_DE_MASK		BIT(1)
+#define STM32_GPIO_ADVCFGR_INVCLK_MASK		BIT(2)
+#define STM32_GPIO_ADVCFGR_RET_MASK		BIT(3)
+#define STM32_GPIO_ADVCFGR_IO_SYNC_MASK		\
+	(STM32_GPIO_ADVCFGR_DE_MASK		\
+	 | STM32_GPIO_ADVCFGR_INVCLK_MASK	\
+	 | STM32_GPIO_ADVCFGR_RET_MASK)
+#define STM32_GPIO_ADVCFGR_MASK	 (STM32_GPIO_ADVCFGR_DLYPATH_MASK | STM32_GPIO_ADVCFGR_IO_SYNC_MASK)
+
 #define STM32_GPIO_CIDCFGR_CFEN		BIT(0)
 #define STM32_GPIO_CIDCFGR_SEMEN	BIT(1)
 #define STM32_GPIO_CIDCFGR_SCID_MASK	GENMASK(5, 4)
@@ -67,6 +79,9 @@
 
 #define SYSCFG_IRQMUX_MASK GENMASK(3, 0)
 
+/* Vendor specific pin configurations */
+#define STM32_GPIO_PIN_CONFIG_IO_SYNC	(PIN_CONFIG_END + 1)
+
 #define gpio_range_to_bank(chip) \
 		container_of(chip, struct stm32_gpio_bank, range)
 
@@ -82,6 +97,23 @@ static const char * const stm32_gpio_functions[] = {
 	"reserved",
 };
 
+static const struct pinconf_generic_params stm32_gpio_bindings[] = {
+	{"st,io-sync", STM32_GPIO_PIN_CONFIG_IO_SYNC, 0},
+};
+
+static u8 io_sync_2_advcfgr[] = {
+	/* data or clock GPIO pass-through */
+	[0] = 0,
+	/* clock GPIO inverted */
+	[1] = STM32_GPIO_ADVCFGR_INVCLK_MASK,
+	/* data GPIO re-sampled on clock rising edge */
+	[2] = STM32_GPIO_ADVCFGR_RET_MASK,
+	/* data GPIO re-sampled on clock falling edge */
+	[3] = STM32_GPIO_ADVCFGR_RET_MASK | STM32_GPIO_ADVCFGR_INVCLK_MASK,
+	/* data GPIO re-sampled on both clock edges */
+	[4] = STM32_GPIO_ADVCFGR_RET_MASK | STM32_GPIO_ADVCFGR_DE_MASK,
+};
+
 struct stm32_pinctrl_group {
 	const char *name;
 	unsigned long config;
@@ -95,6 +127,8 @@ struct stm32_pin_backup {
 	unsigned int speed:2;
 	unsigned int drive:1;
 	unsigned int value:1;
+	unsigned int advcfg:4;
+	unsigned int skew_delay:4;
 };
 
 struct stm32_gpio_bank {
@@ -110,6 +144,7 @@ struct stm32_gpio_bank {
 	struct stm32_pin_backup pin_backup[STM32_GPIO_PINS_PER_BANK];
 	u8 irq_type[STM32_GPIO_PINS_PER_BANK];
 	bool secure_control;
+	bool io_sync_control;
 	bool rif_control;
 };
 
@@ -201,6 +236,21 @@ static void stm32_gpio_backup_bias(struct stm32_gpio_bank *bank, u32 offset,
 	bank->pin_backup[offset].bias = bias;
 }
 
+static void stm32_gpio_backup_advcfg(struct stm32_gpio_bank *bank, u32 offset, u32 mask, u32 value)
+{
+	u32 val;
+
+	val = bank->pin_backup[offset].advcfg;
+	val &= ~mask;
+	val |= value & mask;
+	bank->pin_backup[offset].advcfg = val;
+}
+
+static void stm32_gpio_backup_skew_delay(struct stm32_gpio_bank *bank, u32 offset, u32 delay)
+{
+	bank->pin_backup[offset].skew_delay = delay;
+}
+
 /* RIF functions */
 
 static bool stm32_gpio_rif_valid(struct stm32_gpio_bank *bank, unsigned int gpio_nr)
@@ -1145,6 +1195,150 @@ static u32 stm32_pconf_get_bias(struct stm32_gpio_bank *bank,
 	return (val >> (offset * 2));
 }
 
+static int stm32_pconf_set_advcfgr(struct stm32_gpio_bank *bank, int offset, u32 mask, u32 value)
+{
+	struct stm32_pinctrl *pctl = dev_get_drvdata(bank->gpio_chip.parent);
+	int advcfgr_offset = STM32_GPIO_ADVCFGRL + (offset / 8) * 4;
+	int advcfgr_shift = (offset % 8) * 4;
+	unsigned long flags;
+	int err = 0;
+	u32 val;
+
+	if (!bank->io_sync_control)
+		return -ENOTSUPP;
+
+	spin_lock_irqsave(&bank->lock, flags);
+
+	if (pctl->hwlock) {
+		err = hwspin_lock_timeout_in_atomic(pctl->hwlock, HWSPNLCK_TIMEOUT);
+		if (err) {
+			dev_err(pctl->dev, "Can't get hwspinlock\n");
+			goto unlock;
+		}
+	}
+
+	val = readl_relaxed(bank->base + advcfgr_offset);
+	val &= ~(mask << advcfgr_shift);
+	val |= (value & mask) << advcfgr_shift;
+	writel_relaxed(val, bank->base + advcfgr_offset);
+
+	if (pctl->hwlock)
+		hwspin_unlock_in_atomic(pctl->hwlock);
+
+	stm32_gpio_backup_advcfg(bank, offset, mask, value);
+
+unlock:
+	spin_unlock_irqrestore(&bank->lock, flags);
+
+	return err;
+}
+
+static u32 stm32_pconf_get_advcfgr(struct stm32_gpio_bank *bank, int offset, u32 mask)
+{
+	int advcfgr_offset = STM32_GPIO_ADVCFGRL + (offset / 8) * 4;
+	int advcfgr_shift = (offset % 8) * 4;
+	u32 val;
+
+	if (!bank->io_sync_control)
+		return 0;
+
+	val = readl_relaxed(bank->base + advcfgr_offset);
+	val >>= advcfgr_shift;
+
+	return val & mask;
+}
+
+static int stm32_pconf_set_skew_dir(struct stm32_gpio_bank *bank, int offset, u32 dir)
+{
+	return stm32_pconf_set_advcfgr(bank, offset, STM32_GPIO_ADVCFGR_DLYPATH_MASK,
+		(dir == 2) ? STM32_GPIO_ADVCFGR_DLYPATH_MASK : 0);
+}
+
+static const char *stm32_pconf_get_skew_dir_str(struct stm32_gpio_bank *bank, int offset)
+{
+	return stm32_pconf_get_advcfgr(bank, offset, STM32_GPIO_ADVCFGR_DLYPATH_MASK) ?
+		"input" : "output";
+}
+
+static int stm32_pconf_set_io_sync(struct stm32_gpio_bank *bank, int offset, u32 io_sync)
+{
+	if (io_sync >= ARRAY_SIZE(io_sync_2_advcfgr))
+		return -EINVAL;
+
+	return stm32_pconf_set_advcfgr(bank, offset, STM32_GPIO_ADVCFGR_IO_SYNC_MASK,
+		io_sync_2_advcfgr[io_sync]);
+}
+
+static const char *stm32_pconf_get_io_sync_str(struct stm32_gpio_bank *bank, int offset)
+{
+	u32 io_sync = stm32_pconf_get_advcfgr(bank, offset, STM32_GPIO_ADVCFGR_IO_SYNC_MASK);
+
+	if (io_sync & STM32_GPIO_ADVCFGR_RET_MASK) {
+		if (io_sync & STM32_GPIO_ADVCFGR_DE_MASK)
+			return "data GPIO re-sampled on both clock edges";
+
+		if (io_sync & STM32_GPIO_ADVCFGR_INVCLK_MASK)
+			return "data GPIO re-sampled on clock falling edge";
+
+		return "data GPIO re-sampled on clock rising edge";
+	}
+
+	if (io_sync & STM32_GPIO_ADVCFGR_INVCLK_MASK)
+		return "clock GPIO inverted";
+
+	return NULL;
+}
+
+static int stm32_pconf_set_skew_delay(struct stm32_gpio_bank *bank, int offset, u32 delay)
+{
+	struct stm32_pinctrl *pctl = dev_get_drvdata(bank->gpio_chip.parent);
+	int delay_offset = STM32_GPIO_DELAYRL + (offset / 8) * 4;
+	int delay_shift = (offset % 8) * 4;
+	unsigned long flags;
+	int err = 0;
+	u32 val;
+
+	if (!bank->io_sync_control)
+		return -ENOTSUPP;
+
+	spin_lock_irqsave(&bank->lock, flags);
+
+	if (pctl->hwlock) {
+		err = hwspin_lock_timeout_in_atomic(pctl->hwlock, HWSPNLCK_TIMEOUT);
+		if (err) {
+			dev_err(pctl->dev, "Can't get hwspinlock\n");
+			goto unlock;
+		}
+	}
+
+	val = readl_relaxed(bank->base + delay_offset);
+	val &= ~GENMASK(delay_shift + 3, delay_shift);
+	val |= (delay << delay_shift);
+	writel_relaxed(val, bank->base + delay_offset);
+
+	if (pctl->hwlock)
+		hwspin_unlock_in_atomic(pctl->hwlock);
+
+	stm32_gpio_backup_skew_delay(bank, offset, delay);
+
+unlock:
+	spin_unlock_irqrestore(&bank->lock, flags);
+
+	return err;
+}
+
+static u32 stm32_pconf_get_skew_delay(struct stm32_gpio_bank *bank, int offset)
+{
+	int delay_offset = STM32_GPIO_DELAYRL + (offset / 8) * 4;
+	int delay_shift = (offset % 8) * 4;
+	u32 val;
+
+	val = readl_relaxed(bank->base + delay_offset);
+	val &= GENMASK(delay_shift + 3, delay_shift);
+
+	return val >> delay_shift;
+}
+
 static bool stm32_pconf_get(struct stm32_gpio_bank *bank,
 	unsigned int offset, bool dir)
 {
@@ -1207,6 +1401,15 @@ static int stm32_pconf_parse_conf(struct pinctrl_dev *pctldev,
 		__stm32_gpio_set(bank, offset, arg);
 		ret = stm32_pmx_gpio_set_direction(pctldev, range, pin, false);
 		break;
+	case PIN_CONFIG_SKEW_DELAY:
+		ret = stm32_pconf_set_skew_delay(bank, offset, arg);
+		break;
+	case PIN_CONFIG_SKEW_DELAY_DIRECTION:
+		ret = stm32_pconf_set_skew_dir(bank, offset,  arg);
+		break;
+	case STM32_GPIO_PIN_CONFIG_IO_SYNC:
+		ret = stm32_pconf_set_io_sync(bank, offset, arg);
+		break;
 	default:
 		ret = -ENOTSUPP;
 	}
@@ -1349,6 +1552,22 @@ static void stm32_pconf_dbg_show(struct pinctrl_dev *pctldev,
 	case 3:
 		break;
 	}
+
+	if (bank->io_sync_control) {
+		const char *io_sync_str, *skew_dir_str;
+		u32 skew_delay;
+
+		io_sync_str = stm32_pconf_get_io_sync_str(bank, offset);
+		skew_dir_str = stm32_pconf_get_skew_dir_str(bank, offset);
+		skew_delay = stm32_pconf_get_skew_delay(bank, offset);
+
+		if (io_sync_str)
+			seq_printf(s, " - IO-sync: %s", io_sync_str);
+
+		if (skew_delay)
+			seq_printf(s, " - Skew-delay: %u (%u ps) %s", skew_delay, skew_delay * 250,
+				   skew_dir_str);
+	}
 }
 
 static const struct pinconf_ops stm32_pconf_ops = {
@@ -1441,6 +1660,7 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
 	bank->bank_nr = bank_nr;
 	bank->bank_ioport_nr = bank_ioport_nr;
 	bank->secure_control = pctl->match_data->secure_control;
+	bank->io_sync_control = pctl->match_data->io_sync_control;
 	bank->rif_control = pctl->match_data->rif_control;
 	spin_lock_init(&bank->lock);
 
@@ -1683,6 +1903,8 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	pctl->pctl_desc.confops = &stm32_pconf_ops;
 	pctl->pctl_desc.pctlops = &stm32_pctrl_ops;
 	pctl->pctl_desc.pmxops = &stm32_pmx_ops;
+	pctl->pctl_desc.num_custom_params = ARRAY_SIZE(stm32_gpio_bindings);
+	pctl->pctl_desc.custom_params = stm32_gpio_bindings;
 	pctl->dev = &pdev->dev;
 
 	pctl->pctl_dev = devm_pinctrl_register(&pdev->dev, &pctl->pctl_desc,
@@ -1804,6 +2026,19 @@ static int __maybe_unused stm32_pinctrl_restore_gpio_regs(
 	if (ret)
 		return ret;
 
+	if (bank->io_sync_control) {
+		ret = stm32_pconf_set_skew_delay(bank, offset,
+						 bank->pin_backup[offset].skew_delay);
+		if (ret)
+			return ret;
+
+		/* restore io_sync and skew_dir */
+		ret = stm32_pconf_set_advcfgr(bank, offset, STM32_GPIO_ADVCFGR_MASK,
+					      bank->pin_backup[offset].advcfg);
+		if (ret)
+			return ret;
+	}
+
 	if (pin_is_irq)
 		regmap_field_write(pctl->irqmux[offset], bank->bank_ioport_nr);
 
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.h b/drivers/pinctrl/stm32/pinctrl-stm32.h
index b98a4141bf2c0..d17cbdbba4482 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.h
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.h
@@ -64,6 +64,7 @@ struct stm32_pinctrl_match_data {
 	const struct stm32_desc_pin *pins;
 	const unsigned int npins;
 	bool secure_control;
+	bool io_sync_control;
 	bool rif_control;
 };
 
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32mp257.c b/drivers/pinctrl/stm32/pinctrl-stm32mp257.c
index d226de524bfc1..6709bddd97186 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32mp257.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32mp257.c
@@ -2543,6 +2543,7 @@ static const struct stm32_desc_pin stm32mp257_z_pins[] = {
 static struct stm32_pinctrl_match_data stm32mp257_match_data = {
 	.pins = stm32mp257_pins,
 	.npins = ARRAY_SIZE(stm32mp257_pins),
+	.io_sync_control = true,
 	.secure_control = true,
 	.rif_control = true,
 };
@@ -2550,6 +2551,7 @@ static struct stm32_pinctrl_match_data stm32mp257_match_data = {
 static struct stm32_pinctrl_match_data stm32mp257_z_match_data = {
 	.pins = stm32mp257_z_pins,
 	.npins = ARRAY_SIZE(stm32mp257_z_pins),
+	.io_sync_control = true,
 	.secure_control = true,
 	.rif_control = true,
 };
-- 
2.34.1


