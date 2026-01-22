Return-Path: <linux-gpio+bounces-30934-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SByxEixTcmnpfAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30934-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 17:41:16 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 114336A270
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 17:41:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6C27F30004D8
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3BA63F6A88;
	Thu, 22 Jan 2026 16:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="RpD2BCpV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988983F6FE6;
	Thu, 22 Jan 2026 16:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769098873; cv=fail; b=u0Ucg+XJ0EVNL8KsjE1Jb48quilP+L10488NNXN07Sdg+l4kGGfDR45TxqkpWnTHJ5PnZ3vN2CuFQ4jLSAAGzoPRt8iOx44taP6lMLMJxcDg2rKxEvjpvmNIDTtKtt4feq/1u9l6vXC3GhtmVWsqrZdclQImU2Sggr5SjHcZ32E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769098873; c=relaxed/simple;
	bh=YwuY3eV77TPcKFSrVhZROmKvyyKkyyvGJoV68rm43H8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=aI3DYOda/rHTk+xy4Qv1wnRZfrbbxTtbyZh++Xi11JKkxHmnhXLT8YcOTsT5oOThk33toUc0a5iUv+kFyiPowjdY+Z/EC6D9z708PHDJJnEapqqgt8TNgiraAhpeuo/XF8Kq12L2YgVKH+vP9GCeONnJg9fC+vOaTg9ltdeh1Uo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=RpD2BCpV; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MFwJOr4085133;
	Thu, 22 Jan 2026 17:20:38 +0100
Received: from as8pr04cu009.outbound.protection.outlook.com (mail-westeuropeazon11011043.outbound.protection.outlook.com [52.101.70.43])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4btean0n5p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 17:20:38 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pMDE9A+U6huar8kL5XDW7oCZrVqgPPoQ38lMs8BQE7XkAXLuqxn5eUTJhnfbU9c/ILcPsu21NqFxsN8HDUNmCcboJQFqE4vdPWtIV9VNzvCi3XyogxYHUnKvsKus3Qrm+wrKBvTwYU0K2L/AnbpGAXt2KiMEJwwi/0zxjqxOg8gzXvok4JAR/+ueopBcPGDDwcLk+E+A63AkUvpWn1RP4x2ErKRu729+76cQushAPl8XOis56ASKTuZPfiqh162mhxRQZoAsxDEsoOGFkDhioRdfXTBN51CzMuv6sntcjmMSdde7vFLDLHQqWdNOrsMPfpCljxfLqFMFyyWPoXKBPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q/jJ3nT9dPqpx2WOyU8sSZGS5YZ6LQrAiKlXrEYWtbc=;
 b=SyLQMnUHi9McFs9nPUEoCa9v36f4VxOgLAhVTUgEg60ZbHrxEbXP5VTQDMd47b1eXUaK2SsaWqU7o/bM6JNiBG821s6TqPw1G7i68DT2Gejbuz7CmiUfPU/YHoEry7PGg40ngehzdaOnxRJOy5FDOqRhVHfGBo9X2LRtS9JXD0Evd2q1CAq/Y1H5/inlTp5TpvfG3J5Gn/Mb8r7T5eXe9VAxUOoQYBGzOGDAqRbRoyxocA4C58TTzol8m0wqHCPVcjdybB2wkjxqY4a6HdR5bdYSx1eHTNoeLixOqTsxArVJHmCmR4jg20Rqy/v+/Gz6fvoH1cq5nLMc+w2R3W0HCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q/jJ3nT9dPqpx2WOyU8sSZGS5YZ6LQrAiKlXrEYWtbc=;
 b=RpD2BCpV/tehVio2sjddsu2xqTJxNGlC/Llz1BymhT/BL8geMF+awseo3QUaAOP/jLEm6FMx2GxSxCH3kZ6avzPLuFbQTEFIAibWgZt7o+rHqxh9lLs7mQR3ECS+PuGlqJ5kBcLM9EbmYbVkR9WZyM0mhY9RvQpxXVcdRUD/oFgCGqUiiR2DNl8ZuaJtOsMWY/zRB571Gf47nnjIbZppzS0bpbiyWJpIDNptMd8xOrD0BnJYsC1z50ExN68A5DOTyf/IFQvIv6/zKr0ZcmHyD2veDcRDwoq/a97QxRm7lomW8Fr5tkCDQRh51V6ywhX532BVJ9hGpoYlBI+2YgqzKQ==
Received: from DUZP191CA0020.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::7) by
 DU0PR10MB7001.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:41c::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.9; Thu, 22 Jan 2026 16:20:32 +0000
Received: from DU6PEPF0000952A.eurprd02.prod.outlook.com
 (2603:10a6:10:4f9:cafe::56) by DUZP191CA0020.outlook.office365.com
 (2603:10a6:10:4f9::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Thu,
 22 Jan 2026 16:20:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000952A.mail.protection.outlook.com (10.167.8.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 16:20:32 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 22 Jan
 2026 17:22:02 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 22 Jan
 2026 17:20:31 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 22 Jan 2026 17:19:19 +0100
Subject: [PATCH v4 06/12] drivers: bus: add the stm32 debug bus driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260122-debug_bus-v4-6-28f0f2a25f2c@foss.st.com>
References: <20260122-debug_bus-v4-0-28f0f2a25f2c@foss.st.com>
In-Reply-To: <20260122-debug_bus-v4-0-28f0f2a25f2c@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF0000952A:EE_|DU0PR10MB7001:EE_
X-MS-Office365-Filtering-Correlation-Id: a81b5de7-f935-4046-8d2a-08de59d22a74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|7416014|1800799024|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L2hUOXpuY2hYQlFGWjkzL2Fabkl4NjgySHhsY2o0SzIxeDFCaUVxSXVwcFFj?=
 =?utf-8?B?SDFwcDNqUmNLRVJwKzRhWEpYclY1THIyTWtYZ1dmNHJuWWFLK0lhaTlWOVBJ?=
 =?utf-8?B?UjZxSDBuR25sdE9rbmVZaDFnUU9VbGk0SnBnUEI1Sk9sbnNWUTdBTkRWTTBw?=
 =?utf-8?B?TUhpVDJFZmxpZ1NkSTJxNjdLd3NIMyt4MnFubm9KY2wzaVIvdWRwNm01SmFQ?=
 =?utf-8?B?WGtTTG5sSUViRUtNWGhyKzZGR2VvZXplczk0elBKR0E4cFlFYXlUL01FK3VR?=
 =?utf-8?B?eG9FUHBvNWZsa1pUNHhVS2h5S0J6MGx0UzVTalhGTmkwaUh2bGg4MUFBS1JM?=
 =?utf-8?B?TnVQTXc0Z1R5dkYxdXFNUk9GSUlYNVJHYXpKZ2I5RUwrUm51RWs1bmZucHJG?=
 =?utf-8?B?Szd6SGhRK1JLTzRrZ2JKeGU0WGo2UzViUzJnWDY2V1luRG1yR0REVGtVL2Vv?=
 =?utf-8?B?dlBTRTZsL2dzTHVpc1Zkai9zTmp6S1R4YzF5UUxYdmNWVkNtcm1CU2ljSDU3?=
 =?utf-8?B?bnJVZEY3MlZMRkg4allnTDFHN1cwTWJkcFJyRzZzWE8zTVlub0FaQU5FcnR4?=
 =?utf-8?B?dWpFSkhaODVkaUw4U1lOTXpCV2dRMUlrMURWRkRvTWtnRFYzelcxSEtFN2Jp?=
 =?utf-8?B?NG0wQUhYSUMxOWZhZEhGeEZFMmx6THg0Z2dZZU9aUkZMaSttKzJ6dStJWFln?=
 =?utf-8?B?WVJxMHE1UXBvUExCOS8vSzl4L0lQcTRqL2FnUW1MUHZselgvd1V6RmZIMmEr?=
 =?utf-8?B?ZlN6MlRyemJ3UHptSTZCbzl0YS8vMlU5ay9LaUJ0aC9nb2xxK1ZwWkNFc0w2?=
 =?utf-8?B?YjQyR1dLNDhrcnVGZ0NuYkY1ZUFhM0k2UGtmdmJCME43a2dBL2lKUVRqOGd0?=
 =?utf-8?B?dUwwQVhOVlpDZTZqdjQ0R3FBTVVjc2xidVMyN3ZheHZTRVZzUFBwTndnN2U0?=
 =?utf-8?B?VGN0RzAxbVlNM2NtZEozZU05QVAzY00rV2VVL20rTS81SnhXdVFQRUt5WFJx?=
 =?utf-8?B?a3pQZEwyVjZiQmU5ekJXcnZSaktSMXZHdk90MGpkTVY0Uy9Zd1ozMVpWSVlO?=
 =?utf-8?B?cjN0eVgyOTVvcjdXbzQxYzl3Y1pLZWkvUDFDRWFsc3hsaEx0NFBzeVluakRZ?=
 =?utf-8?B?U0tPQ1JHZjgzajBsSmtXOXp1cXF1ekFsUDhqL1p2RjFyTUYxTEJtY1Nsdndt?=
 =?utf-8?B?RmFCMWY3VmZpUTBmbDBGdFBNQUdRazE3MUd6dVZKd1lLU0k2TjBBRHBCNEUr?=
 =?utf-8?B?eTl4U1N0d0wxbm9PL2dkY044aU1LQ25YVlp0M1dQZU4xMXdOK3FWbGc0bnY1?=
 =?utf-8?B?WWd3amFIdm02VzZtZUsrcVNLeUtPbUp2akdteUh6cXk3QndJeS9aM0Z6QldO?=
 =?utf-8?B?Rm0yY0pQaEdTL2VCaVBFSzAwMS9mT2RTc29ROGdVRnJsNUg1V1c0bGNBZWNR?=
 =?utf-8?B?Y0h3d1NnU0NTT1JPRHp0c2l4UFErcEVlYVVlZHpaUjJyY1UyazVxd1JkaVp1?=
 =?utf-8?B?SzNjRE9kSWh6U2lMSzBEeHJqSkN6Z25wbzczcnNNSWo0ZUovQXdUQ2QyVVht?=
 =?utf-8?B?eVZ2bHgxOVlpOUhmMXpYVERycGNKN0F1RHBxeVJ5VVJrck1DMmcwNDFDcmpE?=
 =?utf-8?B?K3JKZjhNK0RwNHd3RGJaVTVhTEUzQzR3STU4akl1alkxS1lVZmRuTjAzZWtF?=
 =?utf-8?B?Tmdkdzc5Rmh5SW9Dem54M2xxaWkxcUlwcmhJbXJZSjlLNzVGeVozaDdCaytX?=
 =?utf-8?B?KzllcXczN29xbGNPNVZSRG5QandXRHNDcDlYVDZmdmJub2dkZmxvVWxyb3ky?=
 =?utf-8?B?YlYrcXRHY2NWaXFDb0x4VTdaM3ZMV2cvaDJjcmNDdTllN2t2TmVQQmNVQ05o?=
 =?utf-8?B?WTQ3eVVrejR5RnlqWUZtU2tpanNRdXJ0ZjArUUZZWERyUDlrdVR4RFJ3Wkhw?=
 =?utf-8?B?ZW1od3RsS0x4R1BZaHF2OW5odFREQUJxZXU1dUI3eVllblRQKzNuZ2JXQmNH?=
 =?utf-8?B?S0pHUWRJRTRvRDk3K3J0bVllNEFuZzlCejcwNFZDMVNNN0xURGUzMGdnR2tP?=
 =?utf-8?B?S1VjREtIY1RmdWU1YTIydDFLdXdrZ0ZqTnBJbTAwd0hqcWk0UWVINTVQMWZl?=
 =?utf-8?B?cE1mUW5EY0xtWEZ2TzdRbTRGNDRWRHkyRVJLZzJNbFZrRHVkdXE1QzR3WlFV?=
 =?utf-8?B?Mm0wVWx3eDR1a1czNlErWlZFc1dvaUk4VGlmQ0tPNnFMbnNLelRuNVR6bHRG?=
 =?utf-8?Q?zg+D4z0XQID1+ciogz2jldrgrGutBi7inTdtOCBSmM=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(1800799024)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 16:20:32.2296
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a81b5de7-f935-4046-8d2a-08de59d22a74
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7001
X-Proofpoint-GUID: 0dsR4xUETNI1uFi7hbAacttfqx-1JjHz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDEyNSBTYWx0ZWRfX8bePks3VuKg3
 TqDIbkxclwuVlKq6cYFeN5Sqhj0P/DR0B7nd2dEdi2ne5ZfHTUVITb7GXp0ldAqNF1ffkGUj9yz
 RmBPpbWWlAu79Rx1mWniG9ILSp2yN96l1QRodxhMvSlmhXDFeLUmqGGEtvp7sTWCCJyBP9KQTc9
 fsPLcGQ/4Sqxv7vr2qam5Im/XDqLAY+f7t4GaSCiecMfUwunqDixpAod2b9bM9MSwjkkyS2P65m
 bkYe9r59eT2/bPJ/1eZDpwCSjtCIu0sUBMx2MktXyOB1mftYr3Xa6FgGPSiBahifHL+O1HqTPVY
 8mvKuCOdu8n2l7QE701mTZyfI4NXfy7vQXdz2PmtmtO9F3aDv/9mtuepgjKpLNutn7MmvaawxWb
 wPPL/qCO70WX2dpJAHD5DhOGv076mSd1KBcwFQoVt5y5Wvrnxiktq1f1NBr+Zzv7/nQgokfFTYN
 IMX47Ch650pjX7nPGRg==
X-Proofpoint-ORIG-GUID: 0dsR4xUETNI1uFi7hbAacttfqx-1JjHz
X-Authority-Analysis: v=2.4 cv=KYPfcAYD c=1 sm=1 tr=0 ts=69724e56 cx=c_pps
 a=ECbzqkp4a+S0KsFAOAVhYQ==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=3L3Zm1D9LUX1ZMezbK0A:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220125
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30934-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,foss.st.com:mid,foss.st.com:dkim,st.com:email];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 114336A270
X-Rspamd-Action: no action

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
 drivers/bus/stm32_dbg_bus.c | 236 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 248 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9d..fd8390e02070 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24698,6 +24698,7 @@ F:	drivers/power/supply/stc3117_fuel_gauge.c
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
index 000000000000..9427d4da0da7
--- /dev/null
+++ b/drivers/bus/stm32_dbg_bus.c
@@ -0,0 +1,236 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026, STMicroelectronics - All Rights Reserved
+ */
+
+#include <linux/bus/stm32_firewall_device.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
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
+ */
+struct stm32_dbg_bus {
+	struct device *dev;
+	struct tee_context *ctx;
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
+static const struct of_device_id stm32_dbg_bus_of_match[] = {
+	{ .compatible = "st,stm32mp131-dbg-bus", },
+	{ .compatible = "st,stm32mp151-dbg-bus", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, stm32_dbg_bus_of_match);
+
+static struct platform_driver stm32_dbg_bus_driver = {
+	.probe = stm32_dbg_bus_plat_probe,
+	.driver = {
+		.name = "stm32-dbg-bus",
+		.of_match_table = stm32_dbg_bus_of_match,
+	},
+};
+
+static int optee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
+{
+	return (ver->impl_id == TEE_IMPL_ID_OPTEE);
+}
+
+static void stm32_dbg_bus_remove(struct tee_client_device *tee_dev)
+{
+	tee_client_close_context(stm32_dbg_bus_priv->ctx);
+	stm32_dbg_bus_priv = NULL;
+
+	of_platform_depopulate(&tee_dev->dev);
+}
+
+static int stm32_dbg_bus_probe(struct tee_client_device *tee_dev)
+{
+	struct device *dev = &tee_dev->dev;
+	struct stm32_dbg_bus *priv;
+	int ret = 0;
+
+	if (stm32_dbg_bus_priv)
+		return dev_err_probe(dev, -EBUSY,
+				     "A STM32 debug bus device is already initialized\n");
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	/* Open context with TEE driver */
+	priv->ctx = tee_client_open_context(NULL, optee_ctx_match, NULL, NULL);
+	if (IS_ERR_OR_NULL(priv->ctx))
+		return dev_err_probe(dev, PTR_ERR_OR_ZERO(priv->ctx), "Cannot open TEE context\n");
+
+	stm32_dbg_bus_priv = priv;
+	stm32_dbg_bus_priv->dev = dev;
+
+	ret = platform_driver_register(&stm32_dbg_bus_driver);
+	if (ret) {
+		stm32_dbg_bus_remove(tee_dev);
+		return ret;
+	}
+
+	return ret;
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
+	.probe = stm32_dbg_bus_probe,
+	.remove = stm32_dbg_bus_remove,
+	.driver = {
+		.name = "optee_dbg_bus",
+	},
+};
+
+module_tee_client_driver(stm32_optee_dbg_bus_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Gatien Chevallier <gatien.chevallier@foss.st.com>");
+MODULE_DESCRIPTION("OP-TEE based STM32 debug access bus driver");

-- 
2.43.0


