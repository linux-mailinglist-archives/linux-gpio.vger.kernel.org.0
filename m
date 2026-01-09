Return-Path: <linux-gpio+bounces-30337-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AE1D08CAD
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 12:03:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AD939309E638
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 10:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F3AB33B973;
	Fri,  9 Jan 2026 10:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="OMzUQBJi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A6633B6FB;
	Fri,  9 Jan 2026 10:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767956346; cv=fail; b=F6icdd6l3wtmgqHmiTLv/wfkr2B57fLHcIJfsD08C2UqCPR/qysq/p9RLTNvCvCcNv33y2uCiEMWfJ2DvJ/hwtbLKa59y+uVExEOiCucwfXZLg9CAdiDyQM328sbOgLI4k54QKAn/rEG2V/tUghN3y2fQIpJk4ulTCrpPQT8dkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767956346; c=relaxed/simple;
	bh=hU3HEygBHHL58lutyZlIrGBOxOy8vwPWczGsLdq5nl4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=u/1FgbZMhmx0n961Cr7tZEWAwDzM1vISm9aLUC9aZYECM/jmtL2rfYmrNOJzFUTMqRITdOKLH5xCycHMuGtS+gVNrHYQbr0S22RCS+zvBS8VuJxbR4G6wrGSWZ0tTOS2Hqz4v3KHlF5xIWAe4vYWxy0ON1983PK8s6SKDM7K7b4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=OMzUQBJi; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609Auc7k4156187;
	Fri, 9 Jan 2026 11:57:54 +0100
Received: from gvxpr05cu001.outbound.protection.outlook.com (mail-swedencentralazon11013043.outbound.protection.outlook.com [52.101.83.43])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bjqbf9qj0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 09 Jan 2026 11:57:53 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HX3xMShGQQXq4SzH5RARxfJC9N09GNpKJ1OWfmDMtRgosp7vT4RzROmU7AY2Q0YrIQssCi5XyU0n20sCxEAx/KRWYe/4zkmrjXEyjrmFXQg95ji2K/T1HP0nnNvBz8UKbftFpQzLTPosD69QwrM3nt5uzo0hYOplpAdv0yh410upP4BwoQvJn0i27Q+SqjEtJsd2i4W+nDGRozN66fOY6Coom+gnItq7bHF5BtvfNctQGZQDYqnIr0ytl4uJCOTOqC94Yf6wLpghjAEnqtWs7xjaTb+kI1MfdlBLO1GFuibj6ll3/PEFuDLRQb/Eg4h9Xe4OOqZ+r82fBver2nbsmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+i6hYJIl121U3yi32zJunsVI+LSsuhbXTjIa+p6N1A=;
 b=g8fec7yvCGpb8Ej+58hX2NtrClnUrNlmx0x+dd2WN3dZcoxeZxoT/HRYoyDqrQHuDaSNzZht38DhLotTWBuATZ6XY7hhbSYN7JF7s6NM+72/daHp3b2AT95sR0nMEFFQ89/gUKUFCHBY6JdrP3cK7F4+E6Atl7xnDBxWgG9L2yLTiD3ndqOYGPNK4AtE9DiUsvFAkq8h8tPUcKXIf/zBYC99eQtxJymfT1urLrSjiKVwEKQH2CBedO2MtPDxpYIHPk5oqx4TnDq3/DVtIpNnKURBvG2b0/DQwItdBjELsjI5OL0ArZm5/PoO9S8az4pBiVmDlItbSDKC6iYOBCaddw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+i6hYJIl121U3yi32zJunsVI+LSsuhbXTjIa+p6N1A=;
 b=OMzUQBJiAuHpn4LKypo92WWZzDoRSl/pMzugP172bZpBT7zLuG6lH3ZLbRPeJSDfE8gL9dVDRwweNKFdjO1m8fErtdEJbatCpJkT5uysbXQl0x1YBGRYMIHI9OtADhBx/C6laSZpfsNlEMIdwlfS99sKwQwnddb80wAqxfbpSv4Gl+7pjYNIm5/Tlo2+2phRb2OHlY6teaAjPtrNOfzd4UiMF23srCfaTQznDNYh7eV1Ho+nS1aFaqaoDd03avvSrxTT5atsOOan0J+M1A0BrjrYMJ2j4/FQBmrajWQXFvvdtlLWPzlBey+4l+5tjU7H3HQj+X20eSCGCT0YpZ5BQg==
Received: from DB9PR06CA0017.eurprd06.prod.outlook.com (2603:10a6:10:1db::22)
 by VI1PR10MB8277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:1d1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 10:57:50 +0000
Received: from DU6PEPF0000B620.eurprd02.prod.outlook.com
 (2603:10a6:10:1db:cafe::c0) by DB9PR06CA0017.outlook.office365.com
 (2603:10a6:10:1db::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.5 via Frontend Transport; Fri, 9
 Jan 2026 10:57:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF0000B620.mail.protection.outlook.com (10.167.8.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 10:57:49 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 9 Jan
 2026 11:59:03 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 11:57:48 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Fri, 9 Jan 2026 11:55:11 +0100
Subject: [PATCH 11/11] pinctrl: stm32: add firewall checks before probing
 the HDP driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20260109-debug_bus-v1-11-8f2142b5a738@foss.st.com>
References: <20260109-debug_bus-v1-0-8f2142b5a738@foss.st.com>
In-Reply-To: <20260109-debug_bus-v1-0-8f2142b5a738@foss.st.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan
	<leo.yan@linux.dev>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<legoffic.clement@gmail.com>,
        Linus Walleij <linusw@kernel.org>,
        "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B620:EE_|VI1PR10MB8277:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dd349bb-9375-44f0-86ad-08de4f6dedf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eHpwaFpqdCtydmh4V1M3c0hMa2syallnczZRVjg3dU1VU0ZvU3lQdmZ3Yi9p?=
 =?utf-8?B?Smo5ZERpTlNKOGQ0SE1HTG15ZkxTSjVyU092UDd5NnY3U1I1c21ieHlGYlhz?=
 =?utf-8?B?NFN1VkpBajdmWFRjR0NMdzdkaTFXNFlJelJtaFBlL1FFWEFWZk4zUEtrODA0?=
 =?utf-8?B?UGgrSURlYjcxbG5OaVBLTVZCMXZLODZQcHJKTXlQMDRUb0dQME9YTjBWa1hx?=
 =?utf-8?B?b3d2Z1daV2ZnNHFTN0xnUVo0a1NpWjNPalB2cDNPeXk1bXpXZ1MvUzBFa0Z2?=
 =?utf-8?B?WjJwT3NQdmxrejZDYktIcFI3dzdKWWk1Q05yaldVZnRRRHByOTlBekhFUm9y?=
 =?utf-8?B?S0NlT2QyWkozQjQ3WWdPb3EycEhGak8wYURlYmNBQzIzaFpMZVMrZ0ZiaFdp?=
 =?utf-8?B?RmhQQUpMS0JyaTJiRm5BNjRqakQ2VEJuVGhqdWlTTGViSThsejZ4aVVhU1c3?=
 =?utf-8?B?WjdxekQydXlleHJvVjkxbDV5bnl6VU43dnZaU05SMkZqR3lQaitUb09pRTRN?=
 =?utf-8?B?TVU4c0lKUGd2Z1V1YzZzYUNOVjdITmgyYzBIdnZ3dWxuT1J1UDVDbkp3NnN4?=
 =?utf-8?B?VFYrQ3VOMUpFOXVlVytycGQyQUdGYW9NUEd5VFVoakZDdDV4ZWMzUXFRRGdo?=
 =?utf-8?B?NGdGSGJmbTkzVDkwK2NiUTlCN09kQkhhNkluNXFKTmNGNE55dlFuQzBRbUhY?=
 =?utf-8?B?RjhWVEZNRjdZeW9vcGlGRExBMDFRb05BWkpVdjVKd3JNVEJaNGRCaWVTTEpq?=
 =?utf-8?B?MXpIWVN4MFBxUVFvanI2VVBadjhIcVVma1NUTzV2U0ZnMVhmZmx5TVZ0TTU4?=
 =?utf-8?B?RUhTVXdkZExuNlZkK2NmLyszTkZDUjdkZXk5UTVwYnZmai9Bd25CQjUxb1Nh?=
 =?utf-8?B?VkNRY2pFTno5aXV1ZVNGME1ocXdxZXQ0c0FsTmd3WDZBdVNvaUNrZ1kzZVcv?=
 =?utf-8?B?YnlacVJYczNpeklTVWdBWWZwdmFWSkxrdzYzNlV4d2p4Z3FWSkEwME82UEtO?=
 =?utf-8?B?NUJrWXkvWHU2NllocUJHZ05xcnUrekFDdy85SEp6enliczBvT1N6ajFiV1Fm?=
 =?utf-8?B?OG5mSzMwRndUUFRBbDRURDFwSlltNWFlTkRDL1pPZUdHM1huTFRVUEFTOTNx?=
 =?utf-8?B?WEJLbDBFUmkwYXpJbnZ4ZXBKK1FYVGMvTGNkT0dlYjBqZEltd0dwOWRJa01L?=
 =?utf-8?B?QXFuenNTVHhOc0xRMUlFUldKYW9ScGZxbnMreGZ1d1Bodmt0NkhjVGVvS0hs?=
 =?utf-8?B?SGtTMGZQbzBvZG90aUlsTG9iVHYxMXpkLy9CTzZpalIvWVFyVkU2dmRnQ0Ev?=
 =?utf-8?B?Ry9zWEtnRlBoc1dzNmk5bzlrV3FDWk8ySkswSWthd1ZFQXUza0VUQXVaV2hB?=
 =?utf-8?B?YnpoTm9vUkQ3QUFISWZheDFvaDlDaEJaSUtPazE3NkNiVGtabHJkUmJrTFE1?=
 =?utf-8?B?Ry9EcUpzZlhQNHRzM21kSC9ydlpjQkZxNlNqbXg4eVVZdENMbi82S3lSc2J1?=
 =?utf-8?B?YXhXV25VdzFFRVlFS1pTYW44MFRGSm1NdEZrWWQyM3B4L3BMVklDNmdPa0ZD?=
 =?utf-8?B?MnVMaWFpQWtkZkRLZnExbk5UamNrUkZJa1hRTEJPWnpQdEM4blArb3IwWjBU?=
 =?utf-8?B?Zk56K1M3T25VemIrbzk1NExnUGtLTmZTMEhJcEpiOXNLbU9DREx4ZmJKRHVS?=
 =?utf-8?B?ZjZrRklHOGJ2MU4vUmloUWJNQ0NNUENXOEJaMkNkS1ptK2pWRHI5TkpzY2E5?=
 =?utf-8?B?dGRnUFZXd0g0MDdMckpuODJZZ21rajk0d2d1ZFVuSWdEV1dGNmpyVTVaTXBZ?=
 =?utf-8?B?VllHK2RDUGIwc2UzaERIZ1o1ZUxWNW9IWTd6SFBOUmFnR3V6K0tOd3N1ZUxU?=
 =?utf-8?B?YWNVVmZuV2FlOU1uem9SRFllK3NaNFNMTEx1KzB5Y0RMMFJBV09YYzJ0TTc1?=
 =?utf-8?B?Y1F2d3JhT1IxbG85MGZLb3E5SjduQTRYQndXMWFYU0hiNE5TZGFTbE90OXV0?=
 =?utf-8?B?YWFaN1IxdWVTM1ViUCtvNGFISnFXblRrenpoQjN1eHJycUVSOWQzb2E1V2tW?=
 =?utf-8?B?TkRwRERzbTBUVDJJYTZTVjhuNzVmRXgxemQrN1FhMEZNOFV6eFY5YXJIL1FZ?=
 =?utf-8?Q?TwPCcODJ0nXQc6PxoNfVRjFbp?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 10:57:49.4217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dd349bb-9375-44f0-86ad-08de4f6dedf3
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB8277
X-Proofpoint-ORIG-GUID: X7vddUYeO3SpnSVxv9TgJaRFgvh1d4z-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA4MCBTYWx0ZWRfXxq6akSr9sDj6
 ljvI0vlQLx3Do6k/JIN+pZSsz9lDnY3umqwDoJmHVEKAkyuxVsmbCwLKwjSPAnemXc0j5jco5JY
 MD3N1/ugRwWxppC+Wj+UOuj/znn+spxtFjj7+vEbI/64EO8HygvEt8PA/RtdxM/+sLWLm6ky5wX
 pkzR4AjmgR+SFFv0p13tyOtHSyDvmbOq5ugh2DeLWxBo3dnMVlgsK+IeJ7cfS5x5g4hrEqO9oWi
 ioNCR0NYcii23NP9ahN6BYMfDL7hSZ5/QauM3AokzSAI5KMnJnVdv69sVfCFWKrqDdeOIaiF/I/
 zYkOvnX/0GkeTvi68A87RbTPgv87QgZEw73jQiw0rwYRaDi3VA7YqCztNi/kpk5T1zM13EhmzFn
 tNuSTYHabbmnSvOU00q3eEBULS703amm8EK4OEsLIW99SYKO0OZtuCLNww7fIwmpCYi2lhYmMe3
 cQgD5cME47rmGQA52Hg==
X-Authority-Analysis: v=2.4 cv=abtsXBot c=1 sm=1 tr=0 ts=6960df31 cx=c_pps
 a=siRb+Px2ILhIpkBuM5jyjw==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=prQzqxCaf5vTWlbXWNoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: X7vddUYeO3SpnSVxv9TgJaRFgvh1d4z-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090080

Because the HDP peripheral both depends on debug and firewall
configuration, when CONFIG_STM32_FIREWALL is present, use the
stm32 firewall framework to be able to check these configuration against
the relevant controllers.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c | 41 +++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
index 0b1dff01e04c..7e4aa0465c06 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
@@ -4,6 +4,7 @@
  * Author: Clément Le Goffic <clement.legoffic@foss.st.com> for STMicroelectronics.
  */
 #include <linux/bits.h>
+#include <linux/bus/stm32_firewall_device.h>
 #include <linux/clk.h>
 #include <linux/gpio/driver.h>
 #include <linux/gpio/generic.h>
@@ -605,10 +606,50 @@ MODULE_DEVICE_TABLE(of, stm32_hdp_of_match);
 static int stm32_hdp_probe(struct platform_device *pdev)
 {
 	struct gpio_generic_chip_config config;
+	struct stm32_firewall *firewall = NULL;
 	struct device *dev = &pdev->dev;
 	struct stm32_hdp *hdp;
+	int nb_firewall;
 	u8 version;
 	int err;
+	int i;
+
+	nb_firewall = of_count_phandle_with_args(pdev->dev.of_node, "access-controllers",
+						 "#access-controller-cells");
+	if (IS_ENABLED(CONFIG_STM32_FIREWALL) && nb_firewall != -ENOENT) {
+		if (nb_firewall <= 0)
+			return -EINVAL;
+
+		firewall = devm_kcalloc(dev, nb_firewall, sizeof(*firewall), GFP_KERNEL);
+		if (!firewall)
+			return -ENOMEM;
+
+		/* Get stm32 firewall information */
+		err = stm32_firewall_get_firewall(dev->of_node, firewall, nb_firewall);
+		if (err)
+			return dev_err_probe(dev, err, "Failed to get firewall controller\n");
+
+		for (i = 0; i < nb_firewall; i++) {
+			err = stm32_firewall_grant_access_by_id(firewall + i,
+								firewall[i].firewall_id);
+			if (err) {
+				while (i) {
+					u32 id;
+
+					i--;
+					id = firewall[i].firewall_id;
+					stm32_firewall_release_access_by_id(firewall + i, id);
+				}
+				if (err == -EACCES) {
+					dev_info(dev, "No firewall access\n");
+					return -ENODEV;
+				}
+
+				return dev_err_probe(dev, err, "Error checking firewall access\n");
+			}
+		}
+	}
+
 
 	hdp = devm_kzalloc(dev, sizeof(*hdp), GFP_KERNEL);
 	if (!hdp)

-- 
2.43.0


