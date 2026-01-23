Return-Path: <linux-gpio+bounces-31002-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJLfBQNRc2kDuwAAu9opvQ
	(envelope-from <linux-gpio+bounces-31002-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 11:44:19 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A6217747FC
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 11:44:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0655D308692C
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69700377548;
	Fri, 23 Jan 2026 10:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="S6lsREiG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E12135CBD0;
	Fri, 23 Jan 2026 10:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769164889; cv=fail; b=EZp4RvWdOji0W9ZP5dUOt6xpj/m73i+06kfF9v/YAxY0952iz+/BicXsdVJcwUSCougj7GiuP9oT6yWKWzjpwfxYRGwEG/SAuJ6pNqLgv//TuzuYn+ND+nwjtzWDt16w03MVPLnb3aYIHb/+3c45kXdOYIlrV4V03/QuCug16es=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769164889; c=relaxed/simple;
	bh=xbgh1CCIgcEFj9WeothPqUmM2N2sWTN9TRalHeX1drc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=bryPRvKbhTRkOGnXFnKlvpIAuMovmURuk/WLmD+qwk8GLf7jM7a4LyE7A+ySfgYDnEsd15kUZhk9en1/jnMUxbMdkzJXYKEwPjEfXgGtTWOme3ZLdIH7PvR014abK9zK9igwBJ3yEjBaONixHBUwtPsB/h1Zx/5/KalbZLSFkBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=S6lsREiG; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NAS4YX2164261;
	Fri, 23 Jan 2026 11:41:16 +0100
Received: from as8pr04cu009.outbound.protection.outlook.com (mail-westeuropeazon11011036.outbound.protection.outlook.com [52.101.70.36])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bumsf3nk1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 11:41:16 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HYsqpox+xfW/hYb9wLths3DCpFL8chamRDIajs01w/TjtBM2esKUF5KAE2WqqRSEri9yskdk6EQof7i8FKvEfDSdK7K0Zkg9niPfDwML/YylGHrw2QqmvuXIx0vmJi3d27a1KbHh952VWBkWQK3nGgq3muCEe6sEkeAJTzSjk28NvH04NUcSxC7/hOHF+vgjMZ50Gzyo6vigcYNcqb5POafIurdqOQ39dZsyvSYyn53I4kNO3B3Xph6445V4tdWKZRLvRvyVG+M9FM1PIRcR8MawexsqU0RjAigDuXi8UGsElgI2E+UNcq99rM69m8lfNkNBuNgwei+5WGe3XNCHuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bwxk81WusWTFK/a9r7vinmm1wcowOubfgfecTr4+eB4=;
 b=UzmIRw9DtSQmnZLtl10hs18hph029MLzjcDKnWIhHCUs9ZMvH3Whjdp4hDzIKzRBRLiQy65jrWgAnXoZlvBgXe197Zn8EIsIAaRcUHf647hh4OugpRtpMuYh+IeTe2ifFlV8jgDhR3IZYoe3giP6ndPlwFwAP6HcwqaAUGMC3KDDgef1pGSskJC3VpKGb31BTJ7B5dXDaS9TtyJR375n8L5mQRb+j+Y69OwjhLMJnQYyHNGbh4bSEMXoA/o7v/Ah3IPYSyeeJexnDIIu9wvhRjIf5qdi4ER0QfNDFnKPy5rcyPc9/tCKvlg8kZzVHQzwDpDHNdpDG9IyBvy2Kf8xBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bwxk81WusWTFK/a9r7vinmm1wcowOubfgfecTr4+eB4=;
 b=S6lsREiGcvk9HuZ53ZI/PQKpux52Kbkll6tUt4hQhYO6cnc/cUFKAh4h823u7Cy7yQHgo+r5JwuuHn69BF2O4QxsGClloDxj5Bfmpipn5xhfiUx6/bXSh9uJI56iI70sC2QLWWNV4poRxLEu3BxqT6FwUPw8Y9ewNkkTELaliVbwgr7kxmiQXaJbt4CpxCVZuW/y4FyhLLlufpTCRSWofSi7SloWc/6IfbadbqigfXs4Tzo6F7AdurMddv4JSa0ER29RIORn7MZ/z7SPjqrwWP3iPr8KpglVRga5Rueu2n6tCJ8gi/dMyYSQx35oMVP1BH8jAW96z3B36OIqBsyM0Q==
Received: from DUZP191CA0032.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::10)
 by DB9PR10MB7146.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:452::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 10:41:12 +0000
Received: from DB1PEPF000509FB.eurprd03.prod.outlook.com
 (2603:10a6:10:4f8:cafe::1d) by DUZP191CA0032.outlook.office365.com
 (2603:10a6:10:4f8::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.12 via Frontend Transport; Fri,
 23 Jan 2026 10:41:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509FB.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 23 Jan 2026 10:41:12 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:42:32 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:41:11 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Fri, 23 Jan 2026 11:39:05 +0100
Subject: [PATCH v5 08/12] arm: dts: stm32: enable the debug bus on
 stm32mp1x boards
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260123-debug_bus-v5-8-90b670844241@foss.st.com>
References: <20260123-debug_bus-v5-0-90b670844241@foss.st.com>
In-Reply-To: <20260123-debug_bus-v5-0-90b670844241@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FB:EE_|DB9PR10MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: 61e6c8dc-27e1-4117-3a37-08de5a6bed47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bWJIeWJpcXFGY1l3NEFtKzQ1YllneW1MSGYzWnUzSUhKYWdRVlI0RzNVUlpC?=
 =?utf-8?B?c0swUzhpS0treHV5T2RoczBqVDRZdlJFMkpTeXFPa2t4SHI2cWFldUZCU0Vy?=
 =?utf-8?B?SVJXRDh1UFllcVZyS0VaM0VtOEg5a3dwQndSQkV3Z1FzVXBMQmZyV3hCWXV1?=
 =?utf-8?B?N050eldQQXVlditvR21rOWk5cU0zSDVmaXYzN3ZiYTRTZHBMUzRkSEVzbWh0?=
 =?utf-8?B?NWU5dm9oVFVqTFVUT1BRU1ppVEQ5UVMxNkRLL3FVOFg1WnNnKzBDRU5ybHhB?=
 =?utf-8?B?VUw0eWtQc0w1WW10bGI3SUJhQW52bzlaVnVDblM3L1VwVEhJcDVseVlHK29O?=
 =?utf-8?B?SHpEaG1waUUyWG5PeTNGRjZVd0JiaTgxOTNEMWhoWFQzZmo4R2loRnQwY2Zl?=
 =?utf-8?B?Z1pKdmNCS2Y1NURMNnlvSXVVSHRXSGF6Vkk0cG12MnFIT1l3dTUwZ0ZPbGJG?=
 =?utf-8?B?YjZBclBiczVvb0xWRDNNNUFRM1VBa3BoUnVISFdpbGtoajBJYU5NeDBTZDRS?=
 =?utf-8?B?TWNLUURjUGpCU0tZczVKQjlKSzl0WXFNWVo0cUZmYXdwQUdGT2hMSERISDk3?=
 =?utf-8?B?R3lhU0J4d2xDQnZ2bkFNQmhyZW1ubVVkODVhdmxOTzloRjdjTlBjL2FoWGdx?=
 =?utf-8?B?eFlLRGpaMDFmanFmRU5PWTI1eit3bmVsYXgzUFl0cmd4UUFoTW0yaVVBTStW?=
 =?utf-8?B?S0FPSko4TFhWWW1SM1RKQnYwdmdyMFhmM0NuUnhKUERUK3puSzM5aGRWZ25I?=
 =?utf-8?B?Sy9qVWFlSTJxb3hYdTk0Y0hFNUVZYkI5NzJ4R3dvbUZpdDhQSGZ3NXNqODRp?=
 =?utf-8?B?aFFUN3FUb1lzK2U3bjdRTU5QaTg4bEFlRmVnY2ZLWmRQMSsyZ0V3RUxTRnFs?=
 =?utf-8?B?SkFzUllOd0Vibkd0RUUrOVR6T29BVmo2eGkvanZFSHpObDdJZlJIUFU5NmhO?=
 =?utf-8?B?akRVbHBza3JVZWllTTZrNVM2VW0vZnUxYjJ2aXBaUzA0R0RuOWptU21pWFlR?=
 =?utf-8?B?aFFuaXRvS0thYytlbDUwSStTeFFvV3J6c1hRTGl5RWRkZ2JtVWFaTHNndUht?=
 =?utf-8?B?Y0Q4VVAzbHo4Y0Q3ck9VWStGV2RXbmc5NnZkaitOZG1ub0JrT1c2ZnRPU0lJ?=
 =?utf-8?B?MUZtOVh4cGdxbWJHbitRekJrMGdqeGdSTUdaVXB2QUFMNnR3WXZueG0zeEhq?=
 =?utf-8?B?Q3NqTGt2UUtuQXpMWGVsb283ellpQlBTSVJ2d0U3VUVNQWF5UzhEVEhtN3ls?=
 =?utf-8?B?eDJuYWRaT0V4S3A2L2h4cVFpMTdzWE5IbFp2YldrYUc4Z0VCTVNUY1NkU2Uv?=
 =?utf-8?B?dEZtYmE2NjBiVGtiTE0vRWFPRzNOUHc5WFVKOHBYK004ellUTDVHdnF1eXFR?=
 =?utf-8?B?TGcvM1djS29tcS9MSndNWXZDMUVlcVZSZkNSdkQxdGNJKy9xNHhyNHUxMzk1?=
 =?utf-8?B?ay9YRzRZYzQ3S2syZnFNbkVhRzRsSmowM2U3THVEengrKzhPdGFKNzhEMWp0?=
 =?utf-8?B?T2JlSWV2bEk3OUxnTGxHTmcwSzVoODhpSUlYcmhyZ2JTbld1NlV4QTZDMnFP?=
 =?utf-8?B?SlpCMkUxOUlhbDdScTk1OU5sSGRFMlhqQnRKYnF1TmFjMUhla0QxeFVWRFR2?=
 =?utf-8?B?cHBJK1ZpSTNER0ZJc3g5UDlGMUg4bjJ1RFozOEJhMU5KZTJKU2tsb21EZHpH?=
 =?utf-8?B?R0FiMUtCNzI1R0toc1ZEWHQvZGFZamc0bEhYaXZTUXVXZXVtV3dmNUp6dUdV?=
 =?utf-8?B?d25qRjhXeFBFN3ZZUG1SY2pSOStPdjIzdDFkbTFhL3NoaThvVHZUQUZnaEFu?=
 =?utf-8?B?c2Z1QU9WWVd2NWVNUmF0L3BZOWw2SFRSRkJSOXdoYStJYXpWZTA0RzhNVG9y?=
 =?utf-8?B?U050UiszRkFhRzlEa1dScWwzN2tDbjFrR1pNbEtXaklnRUFSeWE5SDlnWHQv?=
 =?utf-8?B?d2VhMHd2N3QyZEdTZk1zaHRJK1RqM3VGeXhwYTdQSTRWdE5aTWZkVGJJdVlT?=
 =?utf-8?B?OStQaHhITkZZQlVXclZVaVZSRWFMRFhlV1F4bnZTRGU3alVibXhta2hSY3VY?=
 =?utf-8?B?MjIxTHgzc1ZPNGtNZGlxYkFoOURGTkQ5VUQ4aXJQQS8xc2RGcFNiTDVRSlpj?=
 =?utf-8?B?Rk5nQXBUMzkrYS9aMDFZd2E5RFgxQk0vKzZnZjFrU0lQWHlwUXEwaVhyY2Jm?=
 =?utf-8?B?bmN5NzdGSW5DTXVUYlBGbllteG0rMWZjZDZBcktOMjZtbTJ1WTliOXE2S2dN?=
 =?utf-8?Q?gS94yL2AhStb9Kj/PPDL6JcMfLEkpQ3KBPROZJfUyI=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 10:41:12.1007
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61e6c8dc-27e1-4117-3a37-08de5a6bed47
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7146
X-Proofpoint-ORIG-GUID: oXk5ZkD04oh-z90c5qiYHftBzuUVFN3Y
X-Proofpoint-GUID: oXk5ZkD04oh-z90c5qiYHftBzuUVFN3Y
X-Authority-Analysis: v=2.4 cv=HbUZjyE8 c=1 sm=1 tr=0 ts=6973504c cx=c_pps
 a=0KEUCuYbRGMQExV0WGpb7A==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=mOgyZ-Q4tP4zXMNofoEA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA4NSBTYWx0ZWRfX6rd49MuCr/TQ
 oIkFVFyUVE0Zabo7yBp8gGmSd1/0PH8ioszYx6BLs6BWybuX1tDw05/wWVW+ALXpHjYiAwhO1Bp
 cASnJTzsTFUmoBlr6YusYQ0sN+ENFJFYH5rEkFxd0XiBw7m6kLZ+uOxwTUMZ5z2IeRD1lIbXmkH
 MrZWXP35mvIBwoa2wDymIggVV+AfuhcETqCGzRMue8K6lER+pOOj5Ui3LEYT77hDRujkq9cUGRN
 nhls877e2KPMCZe/JnamlQg0RDjYLX+V3cXAdznKLHhSAj28Vq9mRLVkycV2FeAAHK40aD4BpVn
 2X6lMsBeH6xIOP2yOmqTnDzPgoCzFsbc/1Dv2QocZaGPpx7C4wUz8izYS8QwaAcxFTTN74a0zo6
 Nbsfzi3CKI5fHpmxlPkQLW8I7tvnkR7UQeRl3HHoL+IXXnhSbNEjZydNPyfHTHPqCt7wOb5JmRn
 5iS13d2DQwr70m6auMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31002-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,foss.st.com:dkim,st.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A6217747FC
X-Rspamd-Action: no action

On stm32mp1x boards, enable the debug bus so we always try to probe
the debug peripherals, if their status and the debug configuration
allow it.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp135f-dk.dts   | 4 ++++
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts  | 4 ++++
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index f894ee35b3db..ebc719797271 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -174,6 +174,10 @@ &cryp {
 	status = "okay";
 };
 
+&dbg_bus {
+	status = "okay";
+};
+
 &dcmipp {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&dcmipp_pins_a>;
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
index 8f99c30f1af1..e69c8e282c8b 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
@@ -81,6 +81,10 @@ &cec {
 	status = "okay";
 };
 
+&dbg_bus {
+	status = "okay";
+};
+
 &dcmi {
 	status = "okay";
 	pinctrl-names = "default", "sleep";
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
index 8cea6facd27b..fe2ab07ea4a8 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
@@ -140,6 +140,10 @@ &crc1 {
 	status = "okay";
 };
 
+&dbg_bus {
+	status = "okay";
+};
+
 &dts {
 	status = "okay";
 };

-- 
2.43.0


