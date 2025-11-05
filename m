Return-Path: <linux-gpio+bounces-28099-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1994EC353FC
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 11:55:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7822C1891B79
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 10:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6045330F533;
	Wed,  5 Nov 2025 10:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="OfGEFcKt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A3230EF9D;
	Wed,  5 Nov 2025 10:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762339852; cv=fail; b=qQIVVziT2wqi74uDqJl2N3jhHa/kwkC+QQclut7Fwiu8RjVar/O4iwdIL6K5+WK/AsLT1a0OR/d7svQXSzxjY394Gp8EfOl/nRdcs/k9kF/CJKrt5IkDugW4wKrRbyPkNa5k1zY3eAf0nNY3jS8M08wYTiD6z0hbb/2t5Yo0oCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762339852; c=relaxed/simple;
	bh=SQSmt0QhFXPl3imQGdFecNoWsKA799NBpQ3Dk063FUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=mj5EzYcke51+gW0X4wkAO4OcWSro5SuPc3nDDyZuptg6pk71llWN9HpKvPsWMeNb2zHZ152mBN2Jz3dg+mQDgoZAFwyTywufy56nTVhoyxvZjuBcF73WYKDojal9uHt0vwApmakD63h9lHsm4m2eaY6aTaBjMgk5QMEes2XExsU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=OfGEFcKt; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5Ai0ls3097908;
	Wed, 5 Nov 2025 11:50:38 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com (mail-northeuropeazon11011013.outbound.protection.outlook.com [52.101.65.13])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4a7g9n5q4f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Nov 2025 11:50:38 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vQDSlmRwDDvldZvybrxSkY6lWtM2BxdHX6rnqFIzYQB3HfeGB6b1a6ncZZKmd9oGpeCMWVgJx774VybgA2E0spr/aisQsGwBJF7ZZ9+C8Bldt0Y+Wr6vn6+53f4DnR8Ooec0iL1qGKLAnza0x4peIeQ9jhgVmSGlC10TsWUFKpFqzFfURTTf1xBn1hlGKYMTeQ1s28QKGK6BbHVr4RqSG8nQyjG1KAOuoSeVBqEektxdxXT7cqs1qRnpYcspH7AJxSCwN22On0pNxBRB5Bd0k+9VG1QzF4l0fSj5RSCxL6D450Ukc0Ta4aVZIQZQXB9c1MO8EssBaL7eBDyWQXd2YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nz3qZoWjdfdsTibJFNmklW5gwwdrzWJiM4nhxIBQh8I=;
 b=elDDPH7MdjNWo1wMu0KRrA8Pht4UbkFoNAy6q3i2hlxmOtWB5cHilZOoPqzVz/uH0afpcMrZGvK6cjzlI3Exs2X3V0nCCE4uzJOIGJRPaT4Yfq0aTr5UovR6ySNdy4JSapXfz0xnZT1vdgH68K4j3nQfQnKsVBA0XHKXQ6SUby83FTDrTLgoUfILB2e46cvUdulS7Xcqxed2wAWjNlIvU0yAavOTcbi/D86ReuLMMDue0eyTCFSdmgS0VPmnywIdBr+3y/BEtSlabtA9pblAvlJISxvZxs2cqyggHKS62QkNqVtzoME5YZarBW0d3eY4CUYEagogGY4hybnNj6xP2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nz3qZoWjdfdsTibJFNmklW5gwwdrzWJiM4nhxIBQh8I=;
 b=OfGEFcKtvi7qV2DBWCiRKO61/OawTZVyKsTxg1chtfvBZ7fZE5v+/uFEab2BbEB+yzrYhggIeS9AYA2zRrBoGFSCeRLOWyixUE7i7RUdA24+og8Ch3fRo6rgogz7o8awnvXC5KK6N/I0FSOGl5BwhCuQF/Jpk9Wt3UWeglBQPQLFSv41988HOFmljGSCbTbo2OTNXHgRherqsY3dPyWA/Ec+gC1P+2lNiT0L287G4P7aAG3bvmvRP/lGPqzlxI/Lr47edgI0SjuJDlyxFkko+FdLYPOQJgz26g3Bcc34RZl/E92OuDPw3oOuXmlJaHJBz/OxGbXkeHqgdUFlEKf8UQ==
Received: from AS8PR04CA0206.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::31)
 by BESPR10MB9384.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:b10:f6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Wed, 5 Nov
 2025 10:50:35 +0000
Received: from AM3PEPF00009B9E.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3:cafe::f5) by AS8PR04CA0206.outlook.office365.com
 (2603:10a6:20b:2f3::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Wed,
 5 Nov 2025 10:50:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF00009B9E.mail.protection.outlook.com (10.167.16.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Wed, 5 Nov 2025 10:50:35 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 5 Nov
 2025 11:50:41 +0100
Received: from localhost (10.48.87.185) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 5 Nov
 2025 11:50:34 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Wed, 5 Nov 2025 11:50:22 +0100
Subject: [PATCH] pinctrl: stm32: handle semaphore acquisition when handling
 pinctrl/pinmux
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251105-gpio_semaphore-v1-1-f73de44310dd@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAO0rC2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQwMT3fSCzPz44tTcxIKM/KJUXfPEJBOjNGNDs2TTFCWgpoKi1LTMCrC
 B0bG1tQDMrxLoYAAAAA==
X-Change-ID: 20251104-gpio_semaphore-7ab42f316c5d
To: Antonio Borneo <antonio.borneo@foss.st.com>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <linux-gpio@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9E:EE_|BESPR10MB9384:EE_
X-MS-Office365-Filtering-Correlation-Id: db7f7fef-3510-4701-c283-08de1c592665
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WEQ0WkN2aU9acUZMVGZqS3M1SzNPOXY2VFNJSWFQQkdDQWdNMjVBaDRqbkRS?=
 =?utf-8?B?cmVpa2tRNHpmQkE4eUFUVTE4YVh5eXUxcGRFOU5IT1BVdlA0eXhZRWpEYWs0?=
 =?utf-8?B?MFRNS2JlRERkSXF3cGMrYWREL0liVVRISzR3Mjg3U2cvT05mc1Rqb3IzSHhq?=
 =?utf-8?B?VEJsbmQvRWwwb2d2ekphcUk1YzhwaEJzcjE5VzFQR0E0K1dMdTFMQ3c0aWhZ?=
 =?utf-8?B?Y2ozbm1GZU45NVgxUUYwVGhhVjJoVnVWMjFtc0pMSkdKZG1MSzdUSG91M1B0?=
 =?utf-8?B?eWo1NnEvTWFIOVM2b1g0b3JNbHFlWWpMOEwzMEFXY29FK2d0eDJpZXBVcTBu?=
 =?utf-8?B?djkwclYxZWJlUTg5cWQrd0lxR09rK2l5Z3owU0NkNDVrTFZyRFdCNnZlVkE0?=
 =?utf-8?B?aDFURWdPOExEcGNNZ1NlL2ZnMVMzT2ZEQW5OOGN5b1g4NUZwbldaQ1FXRXAr?=
 =?utf-8?B?V1I4TmZCZkJ6K0R1MUEyQkE2cTNacDM1VkFrSXFMNWpIV3dybnJqNkxCRHRG?=
 =?utf-8?B?WXNRam5ta0dWMVAxbGk2NXZmN2dGUDZXcDRNSEpLejd6Z29hR3NNTExlWk5Z?=
 =?utf-8?B?bXVCM0pkbVVISXR6R3dDVlFUQUJrWjFVUG1CdUViRHhubVdGQVFRbThHZmt6?=
 =?utf-8?B?aFdQdUFnRU1hbXZCRTZGNWxRWGp3ZlU1TUxjeGU2cm13aUUzYzI5QmUzTkRB?=
 =?utf-8?B?d3oxd3VEcXo0cDZZRXBtcGMzc0ZJVmJKMUZMZkNzN2Vxd1VxQktobUsxNUxm?=
 =?utf-8?B?VlMyclNRazJEUnpvVThlTC9HNnoyc0U2a2grSDVrWCsyN01vN3MyM09kYkhJ?=
 =?utf-8?B?SmVOQXZyS292Vm10dCtac1NxVnRpK05pMlhYSGZHQU5HT1BBYXNWQ0JFSDYz?=
 =?utf-8?B?SmFPOXIraEhPaEFpYzE0a3ZpdWN6cmwrTXVVVDl5bHRuQ0o5WEVxaUVjYkFp?=
 =?utf-8?B?N1VxTy9rTUtWandyajNOVjltWjhiZzg5RVhZS3Y3eWgvRHZOZC9SMFI3V09E?=
 =?utf-8?B?TDJMUWtTQzBicUdsdExFQzNaRG5xS2ZtUEtCajgwdXVWZk5nUHBFV1hVd2Rk?=
 =?utf-8?B?YWIyalRYekFxZ0FiSUdKdGdDczhxU2tjdjFQT3FWWWRjeG5obVkydzZ4WDZU?=
 =?utf-8?B?MUxrakduYVI4SExPSWx6dGdrcDNDcTZXTFMrWkVqbU5LNkFBcWpIK000aFNo?=
 =?utf-8?B?SDdVS1dBdmRrWGx5S0xrbUtUQ0IwNnJBWnhuakpRdndGY0JXNUNmUng0dnJM?=
 =?utf-8?B?RjFNelN2ZVlHZjJIWjJmeXVvRWZZUm1rSmtwM0lqeXFTL3FFcTB5TDNSMkFB?=
 =?utf-8?B?YVY2Z3YrY2N3TnlFWk9rQVREVlNmMEptQk1uS082MmU5QkZZYUhERXEwWmZC?=
 =?utf-8?B?ZVRPZDBuLzdySmRHY3RjZWlNU2Y2aVpWSDUrV2pRRmsrWEpMMkNYUnUzRDJ1?=
 =?utf-8?B?RDQzMU9tU2lvcHJPbWtaYTBpU2FNL2RtNE8za0FTa3dXWnhEb1JTMkQzTitI?=
 =?utf-8?B?dHNJVUs0TGtUV29CN2VneEdMQTkxalNaeTc5UFRoL1NFc2lCMzNQMWVneERP?=
 =?utf-8?B?ajZnME55Z1M1bkxiVnpTWGUydi9kdUZuNGhmT1lib2FkZDNTUVlKUW8ybU9M?=
 =?utf-8?B?ZlkzV2s2aGNGOUxxdFR5VlJ6aHQveDQrc2EwVVEyQ2lMQldCVUxnQnJLOUU5?=
 =?utf-8?B?Y01HRUIvMFRDRTRyOEx1bTQ5bWpjVFRESzVzUys1dWRwVVQyUWpNSGQ3T0Zj?=
 =?utf-8?B?UE5STzluWUtOTVR6UHZlM29uUmhPaE94RWtpemJrdHEwQmJWTzVkR0QzQjhL?=
 =?utf-8?B?UlgrazM1UXZoSjUyb2pUdDlGMGM3VGFzVzVOeFl1bE9lRVV2V0UzUXpxTzZj?=
 =?utf-8?B?YkN6emozSVNQMGsxQlczUWlVdFJDbURuU3hJWWE5QWpTcm0vTnNvUFhuU2Fz?=
 =?utf-8?B?dDNNZGNTR1Y0OC9FSktQN1dDeFA1WHkzZzFWVEVlQkM5QzZ6V0JZUkVjR3dF?=
 =?utf-8?B?QWpUamU2OU42S1NCVEN6WDNpV01hUjZBeXRRSkx2UkcyMFErdGtaNjU2cmtw?=
 =?utf-8?B?MExIRjNrekErZlhmSHBrZjhocy9aZEJvWFpvaThnaXNzQzRoeDFjamRBb21P?=
 =?utf-8?Q?X3Xk=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 10:50:35.4182
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db7f7fef-3510-4701-c283-08de1c592665
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR10MB9384
X-Authority-Analysis: v=2.4 cv=WL9yn3sR c=1 sm=1 tr=0 ts=690b2bfe cx=c_pps
 a=jPyTe4tpzhGg3oLrFBeDzA==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Wpbxt3t0qq0A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=gJYUMVh2_V92V_SRxcoA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: qz36y0A0Tk9QpQMpXwwoNg22jECHMG9p
X-Proofpoint-ORIG-GUID: qz36y0A0Tk9QpQMpXwwoNg22jECHMG9p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA4MCBTYWx0ZWRfX2N71VxGVSznT
 5c5s0djpaHINtXAq0FvCi1Lqoww0AgA7jJ2iYyNn5Jw+BZHZNW9XIG4b3+x00Myt5bzkyYNBzzQ
 c6nVA5gjNOPEVIRwB+ZS04MJ+bY3nec1ymz/maRjxcaTNPoLpmNmvFvL4NvpxbDawPJ2A7j+pBT
 CyAgn19bnyrQsHjlfDxLZvke4icPNlWIsDjYKLr5h/PItERkNX4cJyIplllBUpKE7rWG1g9cEfL
 8SsGeznBJYj4OBbCRmKoaXoC2sOFAS/uUBhgBnYcpKye6F0CBefM6fwi4x+uSCSYhXlEOrUTEdS
 IK7CwjRYT171A2m+w30xoHHlIQc/vu4XxM9JhW9evPUAKgJqVDlmNFSqCzZT/rn1MRCzDiGXpCK
 9e2WuJnkGssYCNVRkLGJzxXc9e/n8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_04,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1011 impostorscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050080

When a GPIO RIF configuration is in semaphore mode, and the semaphore
hasn't been taken before configuring the GPIO, the write operations
silently fail.

To avoid a silent fail when applying a pinctrl, if the pins that are
being configured are in semaphore mode, take the semaphore. Note that
there is no proper release of the RIF semaphore yet for pinctrl.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 35 +++++++++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index ceb9e19f2290..6a99708a5a23 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -362,11 +362,9 @@ static int stm32_gpio_request(struct gpio_chip *chip, unsigned offset)
 		return -EINVAL;
 	}
 
-	if (bank->rif_control) {
-		if (!stm32_gpio_rif_acquire_semaphore(bank, offset)) {
-			dev_err(pctl->dev, "pin %d not available.\n", pin);
-			return -EINVAL;
-		}
+	if (bank->rif_control && !stm32_gpio_rif_acquire_semaphore(bank, offset)) {
+		dev_err(pctl->dev, "pin %d not available.\n", offset);
+		return -EACCES;
 	}
 
 	return pinctrl_gpio_request(chip, offset);
@@ -1040,7 +1038,9 @@ static int stm32_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
 static int stm32_pmx_request(struct pinctrl_dev *pctldev, unsigned int gpio)
 {
 	struct stm32_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+	unsigned int offset = stm32_gpio_pin(gpio);
 	struct pinctrl_gpio_range *range;
+	struct stm32_gpio_bank *bank;
 
 	range = pinctrl_find_gpio_range_from_pin_nolock(pctldev, gpio);
 	if (!range) {
@@ -1048,11 +1048,20 @@ static int stm32_pmx_request(struct pinctrl_dev *pctldev, unsigned int gpio)
 		return -EINVAL;
 	}
 
-	if (!gpiochip_line_is_valid(range->gc, stm32_gpio_pin(gpio))) {
+	if (!gpiochip_line_is_valid(range->gc, offset)) {
 		dev_warn(pctl->dev, "Can't access gpio %d\n", gpio);
 		return -EACCES;
 	}
 
+	bank = gpiochip_get_data(range->gc);
+	if (!bank)
+		return -ENODEV;
+
+	if (bank->rif_control && !stm32_gpio_rif_acquire_semaphore(bank, offset)) {
+		dev_err(pctl->dev, "pin %d not available.\n", offset);
+		return -EACCES;
+	}
+
 	return 0;
 }
 
@@ -1394,6 +1403,11 @@ static int stm32_pconf_parse_conf(struct pinctrl_dev *pctldev,
 		return -EACCES;
 	}
 
+	if (bank->rif_control && !stm32_gpio_rif_acquire_semaphore(bank, offset)) {
+		dev_err(pctl->dev, "pin %d not available.\n", offset);
+		return -EACCES;
+	}
+
 	switch (param) {
 	case PIN_CONFIG_DRIVE_PUSH_PULL:
 		ret = stm32_pconf_set_driving(bank, offset, 0);
@@ -2014,16 +2028,21 @@ static int __maybe_unused stm32_pinctrl_restore_gpio_regs(
 	if (!range)
 		return 0;
 
+	bank = gpiochip_get_data(range->gc);
+
 	if (!gpiochip_line_is_valid(range->gc, offset))
 		return 0;
 
+	if (bank->rif_control && !stm32_gpio_rif_acquire_semaphore(bank, offset)) {
+		dev_err(pctl->dev, "pin %d not available.\n", offset);
+		return -EACCES;
+	}
+
 	pin_is_irq = gpiochip_line_is_irq(range->gc, offset);
 
 	if (!desc || (!pin_is_irq && !desc->gpio_owner))
 		return 0;
 
-	bank = gpiochip_get_data(range->gc);
-
 	mode = bank->pin_backup[offset].mode;
 	ret = stm32_pmx_set_mode(bank, offset, mode, bank->pin_backup[offset].alt);
 	if (ret)

---
base-commit: 2aea4b47e7a5ef171645302b036fa5fb21837274
change-id: 20251104-gpio_semaphore-7ab42f316c5d

Best regards,
-- 
Gatien Chevallier <gatien.chevallier@foss.st.com>


