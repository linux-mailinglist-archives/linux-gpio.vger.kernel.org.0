Return-Path: <linux-gpio+bounces-30329-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E08AED08C1C
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 11:58:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B2A4430150FA
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 10:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F03E833A008;
	Fri,  9 Jan 2026 10:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="MIGXIYqr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF623385A6;
	Fri,  9 Jan 2026 10:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767956208; cv=fail; b=gwNMD0Vdw3lDEy/u1KPHC5kmcmmQ0Q5cMh6m79tjZyBULjgvvsypEBPiNO3oxtD46StK3Q12DpWe6Eua/Wqj2YHMJxTTAoyoXaX1LGKl1FhsQ5H+2vdAszicZXHMiY54ZxynjBlrY9Fum22mx6BzUKxae38vwx0Qq61MsAs5hR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767956208; c=relaxed/simple;
	bh=7r8U7d+4jtcqp/4c/wGtTIbqlK1dtRZl1AduDBshASw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=HvADAVKgfpkUjgttho7+ws6bT7oZ7+ZzVaz5RaTlE9HG3a8yMmuB6LSFcctpx0U/e4etaghP2ubX/CQenU2l7MM7Tw9KrAaJ4lvR/C0ZAfC4xOOqnREgOEvbLcUy1mgo/nQCJb5/rBFS1bz1DonxKF7+Xr+PF5hINHVCEVCYIrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=MIGXIYqr; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609AlI5M4139125;
	Fri, 9 Jan 2026 11:56:28 +0100
Received: from pa4pr04cu001.outbound.protection.outlook.com (mail-francecentralazon11013042.outbound.protection.outlook.com [40.107.162.42])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bjqbf9qc8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 09 Jan 2026 11:56:27 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YIawGoHDeOyxYHjYCGOr1A1PPHiyoCf8UFYm+mKgN5xdzpnyVEtrr+SdV8/XP7Gfm8xkqae272eVp/GsxrBdqXJu/lIKrf7W9TP65JLl4a4iGy33o5/W9azrbFxgQ97hXUxl7wjBpz5sZFlehxXtaHJRLN+Zf5R6tmufViaj/URYJ2uO5jP221QDzq5/QdMOSoPuEsbbtczgdOKg16y2YDG3u7dlOcLGObzeibJWaI/Sq6wSjWmyxCKOsGDFTE49FtjGxiLIJCltPGwkrKrWxsI/4BLyH/qf2cVtBxxEdY7QqZ7cKpyXmNKOEBYsiRtQ6mM6SMneUJjSEqabcYtMHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JRrb9dC2y05CTM1xlXuwcaMz+7X+6FOWTuVBjTwbHVI=;
 b=iZM30EP7g/lXv9lMVpA1xpzDQMFNoY7d2DfZ8FcMG2w+4VmTU5FVYn3zu7sYxSAbKnpEpYBsQHCBnCYfZC+XhZfRQHK0Oi1RdYDlJeT+EzN2ZZ1WETd4YqFxNwUEOY2KnbpUYZjOMtiWhsFnBpNA4+6dCeK+Ym2nefQY7hYg4mPtzncNYtyeNHqmfX8n+6KXKyQRNsGbZE0sD/Pv7TVZ3wduPSwYutvrmZYwq9mKqdglHgW5r20F3zkX4FiYzbhgDdZBuYublxs4tlONWhbasm+6Shr8Tw/XbRF9rUtZfCXBw70X7hc/CsXFhaszUwvxRZoXxiKC1z6kDM6G1GNwtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JRrb9dC2y05CTM1xlXuwcaMz+7X+6FOWTuVBjTwbHVI=;
 b=MIGXIYqr18TwQd26y+GSEGLP9kX8UvloJXBWCxYmZ78GVy3SuWu53q443IMPfYORzWqzgNPEotxR4YpvWF1oBXgg8xfyp5Fa5u19fJXGjbvj3NCkCSPF1wXEPzUIpE5KiB8MSpD7NGSzrDwyG7eXutAN3PYA+Mdk+sAeHhMJKUKWqaMWNgqYlAiGx2mA3m6rBhuWTJRwfrTP83574AqEj+sqxln7dXS8ydJwDw++1wWeTwnRDJR2kJ+szUsLhQCUrQnl+FVVE5g+gmJWS+wdIwRRA03et8UVw5RxOYl2y2jpydUwbNAd8YkYd2pUJLRCU9bZZB1+FSApkMrDjmxmyA==
Received: from DUZPR01CA0136.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::24) by PA1PR10MB8796.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:451::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 9 Jan
 2026 10:56:24 +0000
Received: from DU6PEPF0000A7E4.eurprd02.prod.outlook.com
 (2603:10a6:10:4bc:cafe::e6) by DUZPR01CA0136.outlook.office365.com
 (2603:10a6:10:4bc::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Fri, 9
 Jan 2026 10:56:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000A7E4.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 10:56:24 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 11:57:40 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 11:56:22 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Fri, 9 Jan 2026 11:55:03 +0100
Subject: [PATCH 03/11] dt-bindings: bus: document the stm32 debug bus
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260109-debug_bus-v1-3-8f2142b5a738@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E4:EE_|PA1PR10MB8796:EE_
X-MS-Office365-Filtering-Correlation-Id: 346a12a1-adbd-4e1a-c72d-08de4f6dbb68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TUg3WXNRQ003UjdXSndaNllyWE5YNGFZT1V0dTdZbTA3MEtUUXpRV004QnAr?=
 =?utf-8?B?Q3cxRTJhakRDRE5zYlZXN2phM1h3RFpCaVlVaW1iY1ZjYmJXdmVpS3JlUE5v?=
 =?utf-8?B?Y25pRDk4ektoOUpDN054Qi9vaU5ISFpVN1FGbUFFY1RKNElOUlF6VDRiSVJu?=
 =?utf-8?B?dVN1eWQrVUorUEhBeFZqWHZsSmNXOG9mZDNVaytHRkMwNzQ4VDBPL0w2Z3Nx?=
 =?utf-8?B?QUlLcTJ4T1loMXVQR2RFNlNyaXFGeG5GKytkenF1WnAwdG4vMG5VMDJxbFZX?=
 =?utf-8?B?bWV4eGg4RVFwS2lnRTc4ei90ZFdycnNrK2loRS9VNDhXMWxhck5HUk03WG1G?=
 =?utf-8?B?SUVueGFpd2RxM1ZqV1g3ZXJiMElhekJib1I0d3RWSUZrUHh1ODd0SWdDZlB6?=
 =?utf-8?B?REI4YmFqdko1RzNCZTZQT24yaWFJdE91aVFseVUrcnBtZ3VJaEpVR0g2NnpZ?=
 =?utf-8?B?eFdOMURsR3lOS1JNemVWTDE0d2VzK0lvQ0xrZnhwaTFpY3NnT293dnJEdVFQ?=
 =?utf-8?B?RDFIVkdKMFphSXVLOHZEenJwTG5IZHd0RVlqOWtZZDh6YVVEdS9jcnFSU2h0?=
 =?utf-8?B?RVU0cVZ4aVhGYi9lMTZmQVI4a2UzRjMrR01RNVhpa0tWN2Q0ZUhCaEFaUVk1?=
 =?utf-8?B?cUFYOGYvQ1VZSm5tSTNGUDNwU0ZReUttZFNYT2toV3BLTmNoZkhWOWMwUnhn?=
 =?utf-8?B?cDlFNmtEMGdCcXpWVW9PakcwczZyeXltN2xnelNHQ2pnWWpLSnRVSXg0OXla?=
 =?utf-8?B?NDhVMUhXaDJsSnd3MVg2azVFT1h3MnUxdlk2dndoamttbzFkWDRPQkF4bUVT?=
 =?utf-8?B?VWpRZjl2L3RxRGJ4ZEdiVmk4RFJ3UmFEbDRFS21qZll4MHZpWGZPSUlmMUd5?=
 =?utf-8?B?WHpQNmtnS3VpeTlFN3lrR1ZPVG5yU0kwYVYzYldPMjh2d29RNmlIMmlkK0sy?=
 =?utf-8?B?UFFjRlQ0dEhOeDllTEFyVFpDa1hMTDVEdFR4dWVlL0hhSUh5cXMyUTlTS1o3?=
 =?utf-8?B?Q3l2Q1FHNkpDOGhZOGV6cXo5QkZxN3VkbTYxaG95Y1QwUzE1cWYxRW8wSi9Z?=
 =?utf-8?B?dVJacjZ6RUdyeVN1Y0JsSU1sd0FiTDFXVitZZXBDM3c1bHlLbllKeGVrVDB4?=
 =?utf-8?B?VXNFQytPV3VnUDRCRFRNS1RJeG41S0ROTDErcExtbXlIMVJja2I0cllMWDV6?=
 =?utf-8?B?S3Nja0psQUFXa3NQWW9nd2E3YUhGRTQ0Sml4VVNsOU5CblJxZCtGRTY4c3RC?=
 =?utf-8?B?Qzh2SnFFSmhkWXpMbkd5SDBrYzNQVTcwWkFLSS9WcUxxcVluUUlzeHNzbldB?=
 =?utf-8?B?WUZUcmx3OWIyR1dGNGljaGsvS2U2UFJydGYrVFBUUXFMY0VlY254VG9NSXFx?=
 =?utf-8?B?UXQ5WFFOVk93OUdPelFNN2hkc1BwSnBDeUZUb215UUM3eFY4YzJiMDlUcXZN?=
 =?utf-8?B?VGM0RFhHQ0xrNk5KL0lXQTRzazRya2ZzMWtQQmN0QmhWbnhBNXJ3VlVXRkdp?=
 =?utf-8?B?bFYrSDZZVFBLM3NzZ0I0cmpRdEZsTU9kWGg1SjdQY1g4a3RPQm1jQXloOFBR?=
 =?utf-8?B?aHBxN0VjN2FtSHh0Y3lUMFdvejdWQzF3U3M1cUZYR2M4ZTdvTWdkSW1EYS9Y?=
 =?utf-8?B?bUE0eW9NSC9Wd3lIdTI2L0JMNmUzSElFQ0czN2N3b28wdGhHWmVKUFNIR05T?=
 =?utf-8?B?NlhUTWY1ZkhjSUlGQmhxSTdEdG9rZHRlZWhGamxwSkp5R09ncUhreWJTbjBD?=
 =?utf-8?B?TlZYZlRTYVVrN3d6N3RUMU5raC85WVF6YUd6MGlnNFBhOXhjZDJjSm9rV2Jo?=
 =?utf-8?B?WmpFSDdzVTU0QllxNllvcXNuMzZIWk03YnNlaVdIR01nV3BkWThGVnVaSUFH?=
 =?utf-8?B?OUVVSEcyNFBFNUprcG11NlJZUkZ0YzFHSStBVmsvenNWZDNtL2dyVEw3cmwr?=
 =?utf-8?B?MFUwa0JaQXh6eGdQc0dUZ0g1bmkwVGUvd0xoV0lLVXJ2V1FuQnlxWW41TDQ5?=
 =?utf-8?B?Uk5sbzc1UmE1OTJlcmxsQ0cydko0MEM4YjdIMWtZTjlaaDFROEgyNldNaGJn?=
 =?utf-8?B?M1N6dm4vWWNRUXpOQ1B4UEdMUDcyV3JsM29rc25ZSy8reUdJUWY4VFJSL0h5?=
 =?utf-8?Q?BBbx2pwZow7Cl3g8z+gEvk2sR?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013)(13003099007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 10:56:24.6212
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 346a12a1-adbd-4e1a-c72d-08de4f6dbb68
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB8796
X-Proofpoint-ORIG-GUID: EKEVIqu6PSVm8HA7ajlYLoBu4DnYeQdV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA3OSBTYWx0ZWRfX6Ma6n+Uml1w0
 dxbj/ZMMxEdK+GdPS0oeW4hZMfbLA7sRged92M2DHp5BIypcZuWuIO9Atn0BBdVxq3aPDuokSwy
 YkU3qN17+7AhUQ+MfIrX5I1w/MOsO5WsyyF336RnLc2akN878jRUE1Vk1lCH8g2pAi9bqDhTt+H
 JuqThG6JK9XW8QdHqNBJcFwwhxRdx7+w1UtmmqGEsyvzB64+Y9uG9RM9M7o5Su6eKuzL+ySZhQr
 TOuEhuBQ3jrwQQ3xlqeQ/nPtSVz3JXVsPdUL/LbSzXx3EvwddQ/k4/WIieMR+za2Siuwi681hQS
 gjhFrd0nJu9cfOhMG0DH0XVBSRq9HeSyP0LSud/RUuT1Gw6/URiAzhCf4xoCeLy1DKAmfdOwpJ6
 DZt2rOpKyIZeCKHdKro2gK+nHFqun7JTbzA/vDHU7zCP5JIWkhdhS6LZu2tcqjmpbAVtyRoyOt4
 w5Ep1EPzCzO93z552kQ==
X-Authority-Analysis: v=2.4 cv=abtsXBot c=1 sm=1 tr=0 ts=6960dedb cx=c_pps
 a=q6JosxaEGeR7AdicCWl0cg==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=8b9GpE9nAAAA:8
 a=nQXd0E9VhXsRxXXh0-wA:9 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: EKEVIqu6PSVm8HA7ajlYLoBu4DnYeQdV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090079

Document the stm32 debug bus. The debug bus is responsible for
checking the debug sub-system accessibility before probing any related
drivers.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 .../bindings/bus/st,stm32mp131-dbg-bus.yaml        | 86 ++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
new file mode 100644
index 000000000000..68bdfba08909
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/st,stm32mp131-dbg-bus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STM32 Coresight bus
+
+maintainers:
+  - Gatien Chevallier <gatien.chevallier@foss.st.com>
+
+description: |
+  The STM32 debug bus is in charge of checking the debug configuration
+  of the platform before probing the peripheral drivers that rely on the debug
+  domain.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - st,stm32mp131-dbg-bus
+              - st,stm32mp151-dbg-bus
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  clocks:
+    maxItems: 1
+
+  ranges: true
+
+  reg:
+    maxItems: 1
+
+  "#access-controller-cells":
+    const: 1
+    description:
+      Contains the debug profile necessary to access the peripheral.
+
+patternProperties:
+  "^.*@[0-9a-f]+$":
+    description: Debug related peripherals
+    type: object
+
+    additionalProperties: true
+
+    required:
+      - access-controllers
+
+required:
+  - "#access-controller-cells"
+  - "#address-cells"
+  - "#size-cells"
+  - clocks
+  - compatible
+  - ranges
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+
+    dbg_bus: bus@50080000 {
+      compatible = "st,stm32mp131-dbg-bus";
+      reg = <0x50080000 0x3f80000>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+      clocks = <&rcc CK_DBG>;
+      #access-controller-cells = <1>;
+      ranges;
+
+      cs_cti_trace: cti@50094000 {
+        compatible = "arm,coresight-cti", "arm,primecell";
+        reg = <0x50094000 0x1000>;
+        clocks = <&rcc CK_DBG>;
+        clock-names = "apb_pclk";
+        access-controllers = <&dbg_bus 0>;
+        status = "disabled";
+      };
+    };

-- 
2.43.0


