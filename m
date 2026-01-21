Return-Path: <linux-gpio+bounces-30861-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UM1RDljLcGkNZwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30861-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 13:49:28 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAA6570EC
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 13:49:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 890B89E1FFA
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 12:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3026248F57;
	Wed, 21 Jan 2026 12:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="oHTASMBf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAAE481648;
	Wed, 21 Jan 2026 12:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768999026; cv=fail; b=QwLuNo0ewiLJ1Yuyn42eppZy7QgaG2RGjrzxInA1aQ6Ss+ijZkA6ptccPIObQ0ZrFE9fhQ830IA1YWrpOdrtaQRumBmjfAjlOz+shLbZGg3zYP8T5RgyxfyD4e12g6wdqhpjMII+MNotofSioDHmHOeeE19nzBHAogDSumQv/SE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768999026; c=relaxed/simple;
	bh=ewEZODz90npyyYRi379HUBKf6SIxjR5Q5hb4xCINgd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=M646YmV/JVY+XEecNunNmq9eM19A3ypcWVm1JjbT4SJlVwdfEY24SjEqYr5cFOlMFAuUFXAGH5sO5ORDKK8+OEuflZFpU+HGw4noOsE2CN+VvDrbTQ4Y3V5Rgmi/3pwyAhMYu99lTn2i0GLnBKtBnQFQ41Bn+P3KSM9kQyYInxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=oHTASMBf; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LCVL4g1999325;
	Wed, 21 Jan 2026 13:36:41 +0100
Received: from osppr02cu001.outbound.protection.outlook.com (mail-norwayeastazon11013059.outbound.protection.outlook.com [40.107.159.59])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4btcn4uku2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Jan 2026 13:36:41 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DUt/G3qY2nRPw5vLAWm4lLjayQgx4YD8v0pWfUk5ALv1KI5gzbG3y9Wbir5KjNJAlKmk2ui2WjF7AIEsb0F3HwfzMCDslLcsrrfje/9kCy3QeUOJ7GEgZuIbtdjUmWNXRYtobgpcg+Os1Dr/sKS0df4hnL7QzpCKfTS9ET8FHmb8alYH41VgymP2KUvV3F2dLHtiLLbf+Yl7oRUz2ywQn5nrW9D8Hr8meFLECu/41F3Kbp8ysjUUBSqnDzZwRfAUM5PtceljuYvhuROab5MSAlxDYyULvwnfmAovRBO9bzcke7lAK2HVeOubdAO9hahmfv+CoY219Mte+t/nmpTQ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5er+eTox9cwQuYhpYmpkyJ+YK4aQrQb1NoDbSG6A+9U=;
 b=CvPBzWDg1/bkvPJsv51tjjpgazVJlNF7tDXyZaaZhZ5IqE02AxWktq585pMN7qCDUzMkgEivUH/0ellBnjMVucWkRWiPYxNhhIUMkt1rvK1thKugmyuy1tAaSTNIm8Otbt9zG3GiBoxSQuCerIEgRMv2rjwje0drRt0niq4xIlHdm77TplIQOCX6b2lGtZVTqaIsRW2badHVpa3LqSfAnAn1LE7Ef88vHN+bHO+IcZtiYOxs6SEC6u+AQ1CCeDR30RiitN24l1LupAfxpkFFVsY5zlweQmeo36yB4U/qIi6VrlA5p9Za2ayTP/EcLOPFsL69LsacamEwJNOiS0T+lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5er+eTox9cwQuYhpYmpkyJ+YK4aQrQb1NoDbSG6A+9U=;
 b=oHTASMBfqVv7yplddhtUaU3/6DpafFcROF/cSxBucV/GB36L9KYiLcF0XbFE+rGMkWkFpHD1qFTFVNaA4QmOBhEjeiKV2CRWdYLSKnaW46wXJ7RPt+AOpE1U6IFtudVZIrf9pKEo3ki7nmqh3pF7sujS63os9Z8X6hEXWM77CvDFfFSc8NTrZHCdYE3wXjNYhU4UvarkhiPe4B3aObAdKWDluuhv+JUDjpBD69M+Hw9OgjrTGftp4L7b8lkEPhVvXa9YP5bh2A4h1oFEkBjrNOyHzRebcuzSo8bszyA7kJFoNPSdEzl2lEAmXkjuBs4L8ErBoRTtNnMwHkOMQJmMRw==
Received: from AS4P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::18)
 by PA2PR10MB8962.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:413::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 21 Jan
 2026 12:36:37 +0000
Received: from AMS1EPF0000004B.eurprd04.prod.outlook.com
 (2603:10a6:20b:5db:cafe::25) by AS4P189CA0028.outlook.office365.com
 (2603:10a6:20b:5db::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 12:36:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF0000004B.mail.protection.outlook.com (10.167.16.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 12:36:37 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 21 Jan
 2026 13:38:07 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 21 Jan
 2026 13:36:36 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Wed, 21 Jan 2026 13:34:45 +0100
Subject: [PATCH v3 11/12] arm: dts: stm32: enable CoreSight on the
 stm32mp135f-dk board
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260121-debug_bus-v3-11-4d32451180d0@foss.st.com>
References: <20260121-debug_bus-v3-0-4d32451180d0@foss.st.com>
In-Reply-To: <20260121-debug_bus-v3-0-4d32451180d0@foss.st.com>
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
	<alexandre.torgue@foss.st.com>,
        <jens.wiklander@linaro.org>
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
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004B:EE_|PA2PR10MB8962:EE_
X-MS-Office365-Filtering-Correlation-Id: b6acd94d-dd6f-48ae-8d87-08de58e9b84f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|7416014|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M0tyMlpzT3dnYkpoQXpzYTQ3eGNrVVJVQVU4a1dPVnJMR21wa2JldHFmT3Q1?=
 =?utf-8?B?ZHlFSDhETS9HUTkzZUYyNzIwNXJ0OWZYSTUwWmU4czBqVENVSk9rY3JpQ0FK?=
 =?utf-8?B?Y0M4c045a3p4dGNJOE9uSWFlNzNjZnk5RW1sOE1GdjdIVEd2c2RjdW1XZURw?=
 =?utf-8?B?SGNRZ1pEVllKQUFmRnRHWGtPTUdBM2ZwTW00VTFZQTl5SVUrVi8xRUoyZEdz?=
 =?utf-8?B?VHdoWDlPbUd3WFVmU2FHZmJkb1E0bWtIU24ydVF6K0FGRkNadWt5K0QzUWhN?=
 =?utf-8?B?dlo2S2pSYzZhdm9GSVZBZElqeXVmbTViUEppVk4yZDFjZE82U3JQMWZ4QmVu?=
 =?utf-8?B?cUNHN1JvSGJPUG9Ud0g5NStnWGloYURlRjdvV04vQVluVlZCeStoL1ZMSCtl?=
 =?utf-8?B?WWZTQjFTaytNcEtpdHFLVFlMYWJicHNzL3lyVSs1R294eGZUb3dySjBmZ3kx?=
 =?utf-8?B?ZVB1MnhmU0RZU0V5cVRVbENaUTNvZUVRQ3BLMFFyTCsyQ2xkM1RlcnBoTDRR?=
 =?utf-8?B?bWRPbmVSUWwyL1Y4Ti9xWWhoSm9MN3BKUHVGOXRNZERhbDM3MTNVZ29sQVd1?=
 =?utf-8?B?TFNKWmtOWjZ1cWtZdDA1a1JDbUxlSDRHUGd0VkI2U0thRm5OTnBrNStHTm82?=
 =?utf-8?B?VUF2d0V0NnRtN29YOTl6bFNzZXQ5bkFuU1hFL1V0NXVRTUNaZEg1Q2VVL2pX?=
 =?utf-8?B?M2VMN1ZkeUFNb2c4bnE4Y0U0SjI0NnpRVzhUOTJ1UW41TmhWdG1GVzNaQXE4?=
 =?utf-8?B?SHcxZy9UaVRrMkZ4UEluSHBHeHVNU2N2L0FqTHJaNy8xZlFiVWpSUVlaaGhy?=
 =?utf-8?B?MVE5Zk9zakF2NzVvd0VzRFpVSTNiZ0tpQXNhMnAwWERXRENpbzlBOWI3Ny92?=
 =?utf-8?B?aTI4QitlaFlOUGpOWUlMcUQ3cHlCd0hFV0JFeWI4Tm9kSmtUUkI1WjJKaXJV?=
 =?utf-8?B?YWJOQmdZU2pMYVo2ckg5OHVDeTlSSzBSZlpIZHY1MHliUWRadVdHOUx3cElp?=
 =?utf-8?B?VVV2R1FDSVNXV0c3VkRXblpibDNKNXBXcG56elZNSFF5TDljUVFKWUpGa0Fw?=
 =?utf-8?B?UVpkN3A2MjJ6czA0UUNWeERaVmc0Z0N1a0h5aW1RSjdCUGFNek42NGd4OGFr?=
 =?utf-8?B?ajdwS0FDU0YrMkNzcmw2eEowOXRDd0ZsY25sMTd3ajZJcTRKRHp3R1lDcCtV?=
 =?utf-8?B?UlBhZXBvN2RhTkV4YUVtS25kQ1ZyZDkveE5vRTcwNzZLbmMwOWtsWmNPVytO?=
 =?utf-8?B?SHFtWW5SSklVZTlqZGFLZmxYcURqeGUzQTNoRDZ5WFRYNlBlT1Arc01yZVlF?=
 =?utf-8?B?ZjR0OFFzR0p6aGxrMll2QWZQZ0lTTTJHMmNuVW0xVjkxSldIYjdjUmk0Y3JH?=
 =?utf-8?B?SnNQazh1T2xRQk95aFlZaUZaMFFqZVdDYWE4VkpKQUd2ZDUzVVlhNUMreGMy?=
 =?utf-8?B?bXI3MGFPQzhaN3d3eG1wUENEMmthNmVpRWhjb1BNTmkxV3Z0eTVJVFVaZWhJ?=
 =?utf-8?B?NW85R1dEOVFjRlVpNlRJcTJxZmZsdG1jRXJUcFFFSG9hM0xXck9uRUREY2tx?=
 =?utf-8?B?dUZyRk9pTkhoS29BZlVmT0dHb1hqVkNSK0tqVG5tMmZMeFI5MXBmZEdLWTBG?=
 =?utf-8?B?citxeTl1cnMzL2JlZWlFcUthYiswVWxlZlRTb0d2NnJrWlhid1U1Z21keVZi?=
 =?utf-8?B?eUJnZ1kyMGs3WTFHclpSL2ZlOWZuQU1rT1d3c0xGWnhVdUdxNDBwMjBObUh3?=
 =?utf-8?B?blNvSWFEaEJlOUZQVWsrc0JsOGg5MVdxTmF6V0VmTjg0T3JFdzNVUldvSDgx?=
 =?utf-8?B?aDZMMUVqNHBPUGhBSk1UcW9nNHlkbzdoeHhxNCtGUDFEWU5WWXZkeUNSdE5X?=
 =?utf-8?B?QVQwejdJR2FyRlYzRWlpeFNNaURxRFdRWVY1dzlUejB2VGxQaFBNRkYyUTJv?=
 =?utf-8?B?VGVFK2h6TDJjWVlBYWpzTG9SYXpRazFMUmNNeDFGcFFaMm94VWxXeldyL0lw?=
 =?utf-8?B?T3dpRkNQVEtHdmM0ZHp5Ukt2M1dHMTRLVGltclRhTlV2bjJtUmZZcDdJZEtv?=
 =?utf-8?B?TnEwRjUzemMyblNTdGtIb0ZQaGp4N1pNZEVCSENpNzdSbTFxemdzUnZjVXp2?=
 =?utf-8?B?RngzTXV4cGk2RXhGWlRMV25EUkJYSVpJWVNYTlJjSVVaMmtkdUg1Y3doRzNS?=
 =?utf-8?B?N2x3SlB4VkxhMGNJV3BXcnlDUi9ndzRuSTFWdmU1Wm02Wm9yOWY4V0dHektW?=
 =?utf-8?Q?GYY2v9m2DOdEWC0t2aBWsdEGodMon3IkobDUSDSNrU=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 12:36:37.5220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6acd94d-dd6f-48ae-8d87-08de58e9b84f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000004B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8962
X-Authority-Analysis: v=2.4 cv=Fec6BZ+6 c=1 sm=1 tr=0 ts=6970c859 cx=c_pps
 a=wn3I2JnDdEmzcqpN0poLFw==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=134C2J0RlIERMqBQ30UA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDEwNSBTYWx0ZWRfXwgk2XdShMKaq
 tn8OR+clgjnszWQL6vFJMY1Jrsub84ymM/A7AuHWj0b8W9AXI2qTFk0BsVHlQS7svVNu0AoYCtC
 HvK3/4xnHaQdyV5bKkQju3Zw+7LvxLLA9QumxQjW8bsh85gBQPVvc9eMigQD1GLYuuVyVM5AUJ2
 ncaQqqH4KKp7Yjs88gtsn0SJNYpRl04+iB2NQomecnCOY0EN1azUa3/WVMVveVyQt8+p5+s6zZh
 8YiXcbXwCmG9yYcrgASctj6hc2CSwYlfHJgWWeRqZpsYKk5dCYF/vpZqhHk72B+CN+QnHNNG5qs
 gS1YySUlTLZVG55Oua73R3U4QsmgKKZFrRHSL8mBH+4r2dIvBgGVYo0OMdrTNmbctHY+lBwFakg
 CpLfGUDM1IQdGu2//P+jUmL4UYWxolA0fB0qaUz8N5BLcj5+1Rki39TS79N+af3w58QoCLBZlnR
 WRIWGyq8t+/FDyWyhzA==
X-Proofpoint-GUID: lY5X8lW_frIrvMhbkrk1DRE9PwKi4n1L
X-Proofpoint-ORIG-GUID: lY5X8lW_frIrvMhbkrk1DRE9PwKi4n1L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210105
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-30861-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,foss.st.com:dkim,st.com:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo];
	DKIM_TRACE(0.00)[foss.st.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[foss.st.com,none];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: ACAA6570EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable CoreSight peripherals on the stm32mp135f-dk board.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp135f-dk.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index ebc719797271..2ce38e46c6d0 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -174,6 +174,26 @@ &cryp {
 	status = "okay";
 };
 
+&cs_cti_trace {
+	status = "okay";
+};
+
+&cs_cti_cpu0 {
+	status = "okay";
+};
+
+&cs_etf {
+	status = "okay";
+};
+
+&cs_etm0 {
+	status = "okay";
+};
+
+&cs_tpiu {
+	status = "okay";
+};
+
 &dbg_bus {
 	status = "okay";
 };

-- 
2.43.0


