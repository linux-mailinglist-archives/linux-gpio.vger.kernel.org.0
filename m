Return-Path: <linux-gpio+bounces-30331-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 51634D08C7F
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 12:01:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43A693045F51
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 10:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1BBD3382EF;
	Fri,  9 Jan 2026 10:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="i2I1vr9x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D08339864;
	Fri,  9 Jan 2026 10:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767956230; cv=fail; b=deYZ3ZZR4+FC5nENRMYTS6g6idWuXsdXPetHYbZx0WTHjmKfEgbpanJBmoMdU8Yhkk1KQ2lv9UyU8FrwUBRdHRu49vrgaUYmq1UbDXjKD1ZCPmzm9qEhbYpuWcoPiy2F1v3h+1WbueBkUENtPeaU2aX6Qg6F2Lor6Rc0EZmoJl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767956230; c=relaxed/simple;
	bh=uisVBodUxswXlQ4BjZtWxbLmKiYqpx8ogXA5qy0HYvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=CEghAh365+fNUxE+Vx5kOsFMnQt2imkF8NcFsvBoqOF+7FIyFmlxAOiTyRjugY5nan5G4BaSvAITxYXw6PACls01qmkppvna2GlrPtj95Jc4L1F3Ok+o5yT8H+RZiSLkSCkd6F+zs4HXyFks8i/zx7hIgRd+R44Vpe7g/xbumss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=i2I1vr9x; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609AiSkY4187057;
	Fri, 9 Jan 2026 11:56:51 +0100
Received: from am0pr83cu005.outbound.protection.outlook.com (mail-westeuropeazon11010050.outbound.protection.outlook.com [52.101.69.50])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bjv2212xe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 09 Jan 2026 11:56:51 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P8+oj3hwm/Dt7MaFPJ3Wnwdob07mtV6SSDUnwcOP1BmVt1VSRNsf2rRruMM2g9vNOVrALzjyrguGscOMGNsYqnhOp+t+oFFAcqpyb7d7Z2tbqKwN01gpiSpbGyzjgVm0duKSqFNrrc+uef9L2p3jMZ+vT5jRSVSJPgTqc4M7sVUtjP6BDY7GEjO9K78+i5FjiCrexXdPUo/EzoQB2cqtr+HaZZkeRCnvOD66fnQ956erBRmqPtAcAvNBdAST1f0OJUKCfTajj1X23jnP20x8DWZCiClrcD4PFPlyOr+gq/IkHwLseKnZJ0aKPg3hzzBFNyWOD+YlJUsm2J9gM23YKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FixXCufAnSXTz/Gf8oC9WZDBTYjFNtwkRgvxSiCqRjs=;
 b=ffUb+QWnalCgMbdrDiDIzfANOeF3qvwcOqBeLrnFyA6KD6+HuXeJrg8xkfqOUqwUXWirzZtX9p0Ny+EIasaYWhglFviR2Hg0pRtPNTu/+0WbO3LmZCq7PX7fL+A5SCNoY4oiPT9WzqmcECTdfJb3D7hSVqKxuSfITLoegX5z898XACW+KTf81HkBghqPDp18dLaNtOhiJTE2rr8GQXhuxX98DsoHYKSzGloXVPm+B+JWtWZ+bOOcq4Q3UVqLXTPHV8OQ9x7vvEYYv1QzTbeNCNZeZ08RAdDJRdB8m7wwHsVA4e3Sf5sFmqiCMv8XJfyYV2xHBzKd8oMYux3WAzPjnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FixXCufAnSXTz/Gf8oC9WZDBTYjFNtwkRgvxSiCqRjs=;
 b=i2I1vr9xcC04F9nfZZIOq0/2zQ2ZztHSwyTUmCFjIpuK5xJSA5orRjv1Evyu5CSejX+RCPQ22ytOurNCh+6eIue5L0y/c0R3YetXxpBLY2TLo1NNffo4AhX9WvL8K4K/4vJpftA8AArBrPNHdbVO9Qr/feoBPTcUqPey49NFzCwbGHsBJB80AiczXaMZR0uNWaa3VVAoCcuRo9mAEF7TN+o8UiCbY9r6KzQiCjrFX3ecuqCS1stIOq+GRZzqUytBmnAqNyLGrtr+oemw3qdxz33p6CyPHzszJbJu20U24+nTbtsjE5qgRcRy+UixEpB85pq5JgeuV/WmAK8x0LwZRQ==
Received: from DUZPR01CA0030.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::19) by AS2PR10MB7710.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:64c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 9 Jan
 2026 10:56:45 +0000
Received: from DU6PEPF0000A7E0.eurprd02.prod.outlook.com
 (2603:10a6:10:46b:cafe::5b) by DUZPR01CA0030.outlook.office365.com
 (2603:10a6:10:46b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.5 via Frontend Transport; Fri, 9
 Jan 2026 10:57:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000A7E0.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 10:56:45 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 11:58:01 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 11:56:44 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Fri, 9 Jan 2026 11:55:05 +0100
Subject: [PATCH 05/11] drivers: bus: add the stm32 debug bus driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260109-debug_bus-v1-5-8f2142b5a738@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E0:EE_|AS2PR10MB7710:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a093336-b2e3-4886-e8ef-08de4f6dc78d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L3VtMWp5Y1BlOU5VVlBSNWxzMjBuaVJRWmh6VU5wSlJhVzhrd0lmaG5zL0lx?=
 =?utf-8?B?dGUvUHFQR3U1SzBSWUlkN2ROdDJNQ3U1MjVxYU5TVHNIaVkvTFdveHNLbmV5?=
 =?utf-8?B?QUVlTE1VSU55a0FSanhvaC9TRkFpMjBBeFB3UVNzRmo1NFJxc2xRWVNMaTdI?=
 =?utf-8?B?MDRSVEV3U2EwcWtieVl0a1hDS2REbVdvZVpnSFhzRFBxWGJtOGlNYWRYeWxM?=
 =?utf-8?B?NVE4c1FOZ2xnbWI2SFBwcFU5MXhsZ1Ixei9vWTV3bW8xQStsUE1vNVFBVHlD?=
 =?utf-8?B?L0hueFBOUHRGNWY1Z045ZmRXTzBKVktBbHBJOXEySG9SQ0MwandBb3ZqaitI?=
 =?utf-8?B?eUN4eEUyYzhFQ3NsY0hOOVRJdEFqbll2UVJhVVJjZWE4cldNekxNdDNYUjlE?=
 =?utf-8?B?QXdFczBKSmlKbXhBY3BGNFluWDBwUWdIUTJIaDMyM0JiUXlGV1hBSXkyY1Vu?=
 =?utf-8?B?SzBvNEF0ZklZZURZcU9QY2N6c1h3b0dNQ25GRnMxWWpvT3dJM2FMN2ZadGdk?=
 =?utf-8?B?REtERzI0RnlNS3I5TnBXRUV2TktQYUk5RHg4WjFFSUcrOSs3S3BCeDFJY25Y?=
 =?utf-8?B?Q3FlQTVPcTZ4MDFML201RzFOTTF3bXZJaVN3Y1ZWei9iVGo4Y3VqVUpoeHZm?=
 =?utf-8?B?OVprMld1bkZoZWJNeTlQdHdZZW05SjNScmQ2OGx3SWYrOEROeExmL0ZBS1R2?=
 =?utf-8?B?dDNLQ0xjV0R4ellsc2dhNkZEMmVPbXZxaTRIeUgrV085TzZYTlZNVWhseUlh?=
 =?utf-8?B?SHdxekRWUm5WVjNWY2FaSTBBRjBkVlZYT2RIMFROMWp1c043SWNkR2E4SXRn?=
 =?utf-8?B?VWJreFpKYUVhMWxzclN3aG5MdmdZT2x3WHlFV002SERGTklKeDM1Wlg3QXhn?=
 =?utf-8?B?bCtXYUFYVlY4ODhIT0dsUURuQW4zY1daSWNjTWU0ZUp5WE1ZUTV2Y2ZSbkFr?=
 =?utf-8?B?MDAyWlB0N3pCVEN4bUE1Z2JvTy96SzZWYWN4MGJINnNTVjJ1RzZtZG42bmJO?=
 =?utf-8?B?WFlqdmNmYnMrWVJrSkxkMlk1a2x1amVIdTBjWksrS1FnZis2VUk1WVl6V3Uy?=
 =?utf-8?B?YTg1UWVWZHBwNUlFL1duRlo2RVNOYUlvRDJzQWFhYnJpWFZiMTB0SWFlZlZY?=
 =?utf-8?B?V1VMS1Q4dzVlS2p1azRpN0xXRVlXYlM4SkRuNi90cmNmYmVJcFBwUEx0eElw?=
 =?utf-8?B?VE9TL3J5ODMya2ZXQWRGNGtBY1FTZlN4cU04cThneE1QckFxZDFOaVN4Q0RV?=
 =?utf-8?B?WFVabnhCSjFIQmZhc2h3Q3ZjdkxKU1dRamhaZGU1WTd0alhPQzlIZEF1Mk9D?=
 =?utf-8?B?V1NVTG5iaVRwMXVDR3Y2ZUhlZE5VY3hFd0M2bnk5UDgzZVNIR2M4U0I3Y2o0?=
 =?utf-8?B?cWx2WnFKU0lsb0ZzYW5ITFpZQkc1YTN3NTZjRG40OXYzakowdjdaZDM2U2xw?=
 =?utf-8?B?L3dRck9wTHV3dzcvK3JpcmUzdzRKblpxSGFmbUkySzdzQlMvUlltZk10NkNn?=
 =?utf-8?B?TS9DcStISDlNZERkMjYwbVRjVUN4dzN3SjlWZDFFSkc0OHJmMG0yREtMT2h2?=
 =?utf-8?B?NjBjcWVraFluUGE1NDdjbkVhOWo4dm5hRkg5dnhwdytLRzFGaHFmRitDWlBG?=
 =?utf-8?B?dVAxalZocG5qa0J6UDVTbjJnN1p4VUwwZXdjZzJ6WThXVWltWDl6YnBwMjdX?=
 =?utf-8?B?MEFGV3U3TzM2N1BrNVdvaU40K0U5dE9VNjdzTTc1SjdOQlJ4OTN4Z2tmVmIy?=
 =?utf-8?B?Z05LeHNoWUpENXRwMURhUDU4RXVKaDk0YnNDbWNERlB6ektNV21RV1h2MEcr?=
 =?utf-8?B?MDdqempYUmJSRFQvalhJOFB2Rmx1aGcraVJORkJqb0xrc2xBNnp6Y2M5M09v?=
 =?utf-8?B?NnJJVzZRMFpSeW1mN3BzdlBGZ24xU0JNMWpjVUtWYWlBT3Zmc1gwMkFFRnBZ?=
 =?utf-8?B?RmFaL09ZTHVrRHVFZUsrb3E3UWVDNnJBNlREMmJKMlNHZUozRWQxamxuWHpM?=
 =?utf-8?B?Kys2bUwwS0IzSE5XVFRmUVdpQ0Z6UUNuSmk2ZVBQQ3FxanV1SXdXTjVHVGJ2?=
 =?utf-8?B?eG5FOGxqTExvSlhwU3FxMks0NDhUNFBnQVVGNkhMY21PanpNRmNmSkppQTBS?=
 =?utf-8?Q?9hSC9dELH/bGKqWESRCqPKQN5?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 10:56:45.0115
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a093336-b2e3-4886-e8ef-08de4f6dc78d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7710
X-Proofpoint-ORIG-GUID: 2BJhxFNhk_uICZZ_SeNTx4IWeLALLlIq
X-Authority-Analysis: v=2.4 cv=d4f4CBjE c=1 sm=1 tr=0 ts=6960def3 cx=c_pps
 a=gXrl5TodGbHmua8ggoz7cw==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=ChlD8RZ6-yybeBONWf8A:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: 2BJhxFNhk_uICZZ_SeNTx4IWeLALLlIq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA3OSBTYWx0ZWRfX+3jXRh4VGEXd
 X+B6FES8AJlmTsPaegNUTFERa46Asvg8g2SMzB03xxpCX8YdeApPflFRV2IOtmlE+eNQRu69gJe
 4JcPySOK7H0ib1iZsXyta3fE33f07JesI6Dv4J1VYXHDvLnb/RJ8Xi3/uQOqxLTdrWGYG8aAV8h
 j7hwoSeuO/AaJKB24R1dubN4tfpJiUg1dHzhBr7Y9XfLAGGxqLconnBVi3ihS0tZq4Bup0ItaoM
 pJXpbOJfWO/g2UZJssAtUWhba/PCIrApXFd3222a2l8Y3hI394FognGO2OLDxIDPbg7zvCC/H+T
 qfMONimxnhrXTwwI00l30UixPshYM76QfkBRoKOa8pyoRKXNvQVozu5O4/XH88mI+1Q049gNSbQ
 ECIMwsUDgR9RR1DSvGQBC/a2MrOp77MPlR+cAZe/86CCpZaPuF1CzTeTLkLBwWB573b+7d4lYU7
 0UswnVJ9jH58TU5dEVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090079

Add the stm32 debug bus driver that is responsible of checking the
debug subsystem accessibility before probing the related peripheral
drivers.

This driver is OP-TEE dependent and relies on the STM32 debug access
PTA.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 MAINTAINERS                 |   1 +
 drivers/bus/Kconfig         |  10 ++
 drivers/bus/Makefile        |   1 +
 drivers/bus/stm32_dbg_bus.c | 285 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 297 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 765ad2daa218..2489a24a0515 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24701,6 +24701,7 @@ F:	drivers/power/supply/stc3117_fuel_gauge.c
 ST STM32 FIREWALL
 M:	Gatien Chevallier <gatien.chevallier@foss.st.com>
 S:	Maintained
+F:	drivers/bus/stm32_dbg_bus.c
 F:	drivers/bus/stm32_etzpc.c
 F:	drivers/bus/stm32_firewall.c
 F:	drivers/bus/stm32_rifsc.c
diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index fe7600283e70..c9be21d5dfda 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -169,6 +169,16 @@ config QCOM_SSC_BLOCK_BUS
 	  i2c/spi/uart controllers, a hexagon core, and a clock controller
 	  which provides clocks for the above.
 
+config STM32_DBG_BUS
+	tristate "OP-TEE based debug access bus"
+	depends on OPTEE && STM32_FIREWALL
+	depends on ARCH_STM32 || COMPILE_TEST
+	help
+	  Select this to get the support for the OP-TEE based STM32 debug bus
+	  driver that is used to handle debug-related peripherals on STM32
+	  platforms when the debug configuration is not accessible by the
+	  normal world.
+
 config STM32_FIREWALL
 	bool "STM32 Firewall framework"
 	depends on (ARCH_STM32 || COMPILE_TEST) && OF
diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
index 8e693fe8a03a..799724cfc2df 100644
--- a/drivers/bus/Makefile
+++ b/drivers/bus/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_OMAP_INTERCONNECT)	+= omap_l3_smx.o omap_l3_noc.o
 obj-$(CONFIG_OMAP_OCP2SCP)	+= omap-ocp2scp.o
 obj-$(CONFIG_QCOM_EBI2)		+= qcom-ebi2.o
 obj-$(CONFIG_QCOM_SSC_BLOCK_BUS)	+= qcom-ssc-block-bus.o
+obj-$(CONFIG_STM32_DBG_BUS)	+= stm32_dbg_bus.o
 obj-$(CONFIG_STM32_FIREWALL)	+= stm32_firewall.o stm32_rifsc.o stm32_etzpc.o
 obj-$(CONFIG_SUN50I_DE2_BUS)	+= sun50i-de2.o
 obj-$(CONFIG_SUNXI_RSB)		+= sunxi-rsb.o
diff --git a/drivers/bus/stm32_dbg_bus.c b/drivers/bus/stm32_dbg_bus.c
new file mode 100644
index 000000000000..9e1238575b94
--- /dev/null
+++ b/drivers/bus/stm32_dbg_bus.c
@@ -0,0 +1,285 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026, STMicroelectronics - All Rights Reserved
+ */
+
+#include <linux/bus/stm32_firewall_device.h>
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+#include <linux/tee_drv.h>
+#include <linux/types.h>
+
+#include "stm32_firewall.h"
+
+enum stm32_dbg_profile {
+	PERIPHERAL_DBG_PROFILE	= 0,
+	HDP_DBG_PROFILE		= 1,
+};
+
+enum stm32_dbg_pta_command {
+	/*
+	 * PTA_CMD_GRANT_DBG_ACCESS - Verify the debug configuration against the given debug profile
+	 * and grant access or not
+	 *
+	 * [in]     value[0].a  Debug profile to grant access to.
+	 */
+	PTA_CMD_GRANT_DBG_ACCESS,
+};
+
+/**
+ * struct stm32_dbg_bus - OP-TEE based STM32 debug bus private data
+ * @dev: STM32 debug bus device.
+ * @ctx: OP-TEE context handler.
+ * @dbg_clk: Debug bus clock.
+ */
+struct stm32_dbg_bus {
+	struct device *dev;
+	struct tee_context *ctx;
+	struct clk *dbg_clk;
+};
+
+/* Expect at most 1 instance of this driver */
+static struct stm32_dbg_bus *stm32_dbg_bus_priv;
+
+static int stm32_dbg_pta_open_session(u32 *id)
+{
+	struct tee_client_device *dbg_bus_dev = to_tee_client_device(stm32_dbg_bus_priv->dev);
+	struct tee_ioctl_open_session_arg sess_arg;
+	int ret;
+
+	memset(&sess_arg, 0, sizeof(sess_arg));
+	export_uuid(sess_arg.uuid, &dbg_bus_dev->id.uuid);
+	sess_arg.clnt_login = TEE_IOCTL_LOGIN_REE_KERNEL;
+
+	ret = tee_client_open_session(stm32_dbg_bus_priv->ctx, &sess_arg, NULL);
+	if (ret < 0 || sess_arg.ret) {
+		dev_err(stm32_dbg_bus_priv->dev, "Failed opening tee session, err: %#x\n",
+			sess_arg.ret);
+		return -EOPNOTSUPP;
+	}
+
+	*id = sess_arg.session;
+
+	return 0;
+}
+
+static void stm32_dbg_pta_close_session(u32 id)
+{
+	tee_client_close_session(stm32_dbg_bus_priv->ctx, id);
+}
+
+static int stm32_dbg_bus_grant_access(struct stm32_firewall_controller *ctrl, u32 dbg_profile)
+{
+	struct tee_ioctl_invoke_arg inv_arg = {0};
+	struct tee_param param[1] = {0};
+	u32 session_id;
+	int ret;
+
+	if (dbg_profile != PERIPHERAL_DBG_PROFILE && dbg_profile != HDP_DBG_PROFILE)
+		return -EOPNOTSUPP;
+
+	ret = stm32_dbg_pta_open_session(&session_id);
+	if (ret)
+		return ret;
+
+	inv_arg.func = PTA_CMD_GRANT_DBG_ACCESS;
+	inv_arg.session = session_id;
+	inv_arg.num_params = 1;
+	param[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
+	param[0].u.value.a = dbg_profile;
+
+	ret = tee_client_invoke_func(stm32_dbg_bus_priv->ctx, &inv_arg, param);
+	if (ret < 0 || inv_arg.ret != 0) {
+		dev_dbg(stm32_dbg_bus_priv->dev,
+			"When invoking function, err %x, TEE returns: %x\n", ret, inv_arg.ret);
+		if (!ret)
+			ret = -EACCES;
+	}
+
+	stm32_dbg_pta_close_session(session_id);
+
+	return ret;
+}
+
+/* Implement mandatory release_access ops even if it does nothing*/
+static void stm32_dbg_bus_release_access(struct stm32_firewall_controller *ctrl, u32 dbg_profile)
+{
+}
+
+static int stm32_dbg_bus_plat_probe(struct platform_device *pdev)
+{
+	struct stm32_firewall_controller *dbg_controller;
+	int ret;
+
+	if (!stm32_dbg_bus_priv)
+		return dev_err_probe(&pdev->dev, -EPROBE_DEFER,
+				     "OP-TEE debug services not yet available\n");
+
+	dbg_controller = devm_kzalloc(&pdev->dev, sizeof(*dbg_controller), GFP_KERNEL);
+	if (!dbg_controller)
+		return dev_err_probe(&pdev->dev, -ENOMEM, "Couldn't allocate debug controller\n");
+
+	dbg_controller->dev = &pdev->dev;
+	dbg_controller->mmio = NULL;
+	dbg_controller->name = dev_driver_string(dbg_controller->dev);
+	dbg_controller->type = STM32_PERIPHERAL_FIREWALL;
+	dbg_controller->grant_access = stm32_dbg_bus_grant_access;
+	dbg_controller->release_access = stm32_dbg_bus_release_access;
+
+	stm32_dbg_bus_priv->dbg_clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	if (IS_ERR(stm32_dbg_bus_priv->dbg_clk))
+		return PTR_ERR(stm32_dbg_bus_priv->dbg_clk);
+
+	ret = stm32_firewall_controller_register(dbg_controller);
+	if (ret) {
+		dev_err(dbg_controller->dev, "Couldn't register as a firewall controller: %d", ret);
+		return ret;
+	}
+
+	ret = stm32_firewall_populate_bus(dbg_controller);
+	if (ret) {
+		dev_err(dbg_controller->dev, "Couldn't populate debug bus: %d", ret);
+		stm32_firewall_controller_unregister(dbg_controller);
+		return ret;
+	}
+
+	pm_runtime_enable(&pdev->dev);
+
+	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
+	if (ret) {
+		dev_err(dbg_controller->dev, "Couldn't populate the node: %d", ret);
+		stm32_firewall_controller_unregister(dbg_controller);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int __maybe_unused stm32_dbg_bus_runtime_suspend(struct device *dev)
+{
+	clk_disable_unprepare(stm32_dbg_bus_priv->dbg_clk);
+
+	return 0;
+}
+
+static int __maybe_unused stm32_dbg_bus_runtime_resume(struct device *dev)
+{
+	int ret = clk_prepare_enable(stm32_dbg_bus_priv->dbg_clk);
+
+	if (ret) {
+		dev_err(dev, "Failed to enable clock: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id stm32_dbg_bus_of_match[] = {
+	{ .compatible = "st,stm32mp131-dbg-bus", },
+	{ .compatible = "st,stm32mp151-dbg-bus", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, stm32_dbg_bus_of_match);
+
+static const struct dev_pm_ops simple_pm_bus_pm_ops = {
+	SET_RUNTIME_PM_OPS(stm32_dbg_bus_runtime_suspend, stm32_dbg_bus_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+};
+
+static struct platform_driver stm32_dbg_bus_driver = {
+	.probe = stm32_dbg_bus_plat_probe,
+	.driver = {
+		.name = "stm32-dbg-bus",
+		.of_match_table = of_match_ptr(stm32_dbg_bus_of_match),
+		.pm = pm_ptr(&simple_pm_bus_pm_ops),
+	},
+};
+
+static int optee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
+{
+	return (ver->impl_id == TEE_IMPL_ID_OPTEE);
+}
+
+static int stm32_dbg_bus_probe(struct device *dev)
+{
+	struct stm32_dbg_bus *priv;
+
+	if (stm32_dbg_bus_priv)
+		return dev_err_probe(dev, -EBUSY,
+				     "A STM32 debug bus device is already initialized\n");
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return dev_err_probe(dev, -ENOMEM, "Cannot allocate priv data\n");
+
+	/* Open context with TEE driver */
+	priv->ctx = tee_client_open_context(NULL, optee_ctx_match, NULL, NULL);
+	if (IS_ERR_OR_NULL(priv->ctx))
+		return dev_err_probe(dev, PTR_ERR_OR_ZERO(priv->ctx), "Cannot open TEE context\n");
+
+	stm32_dbg_bus_priv = priv;
+	stm32_dbg_bus_priv->dev = dev;
+
+	return 0;
+}
+
+static int stm32_dbg_bus_remove(struct device *dev)
+{
+	tee_client_close_context(stm32_dbg_bus_priv->ctx);
+	stm32_dbg_bus_priv = NULL;
+
+	return 0;
+}
+
+static const struct tee_client_device_id optee_dbg_bus_id_table[] = {
+	{UUID_INIT(0xdd05bc8b, 0x9f3b, 0x49f0,
+		   0xb6, 0x49, 0x01, 0xaa, 0x10, 0xc1, 0xc2, 0x10)},
+	{}
+};
+
+static struct tee_client_driver stm32_optee_dbg_bus_driver = {
+	.id_table = optee_dbg_bus_id_table,
+	.driver = {
+		.name = "optee_dbg_bus",
+		.bus = &tee_bus_type,
+		.probe = stm32_dbg_bus_probe,
+		.remove = stm32_dbg_bus_remove,
+	},
+};
+
+static int __init optee_dbg_bus_mod_init(void)
+{
+	int ret;
+
+	ret = driver_register(&stm32_optee_dbg_bus_driver.driver);
+	if (ret)
+		return ret;
+
+	ret = platform_driver_register(&stm32_dbg_bus_driver);
+	if (ret)
+		driver_unregister(&stm32_optee_dbg_bus_driver.driver);
+
+	return ret;
+}
+
+static void __exit optee_dbg_bus_mod_exit(void)
+{
+	platform_driver_unregister(&stm32_dbg_bus_driver);
+	driver_unregister(&stm32_optee_dbg_bus_driver.driver);
+}
+
+module_init(optee_dbg_bus_mod_init);
+module_exit(optee_dbg_bus_mod_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Gatien Chevallier <gatien.chevallier@foss.st.com>");
+MODULE_DESCRIPTION("OP-TEE based STM32 debug access bus driver");

-- 
2.43.0


