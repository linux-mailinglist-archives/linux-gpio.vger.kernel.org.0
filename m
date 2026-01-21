Return-Path: <linux-gpio+bounces-30851-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJWdH4rJcGkNZwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30851-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 13:41:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F6956F1A
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 13:41:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C7EF95CB9AC
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 12:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74127481A88;
	Wed, 21 Jan 2026 12:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="bzfebIMH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB85E47DFAE;
	Wed, 21 Jan 2026 12:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768998929; cv=fail; b=Oq0Rd/KQI1HkQJg1icUdaPNNkpt2wDIIxtYGlITv8+SA26h9RD2EspzfXi3TEI4tsihk51X89fFjsANCjbmNMcVd8PEGb0IZItCCHV/wV4Plk7JQ9K8UhgFxZ4jhHaXhQNW6xVS9R8J/oFEfAdXA14EpRPtRvQ9QfQU0+cv1rac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768998929; c=relaxed/simple;
	bh=5YXXsvl4sarwBmMztR9JatHSKugzAMfhVYtNovZ2aMs=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=bLFjr2MlQ35+zNYntC0Y2UYPWjoDgxCfRcYEZD1cqsnVsTMr3AvJ+/mGpsRldgvPhhsajTnqTABqucIuGpUuOil1glPvgKLChZUAtlfSVsHg2vce9rn+77L5Ez/oJ/T72IkBCxO01r7KzUMSxC9KsqNSHTEYvdMPLJZ54UKt6Ls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=bzfebIMH; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LCWsHQ1549277;
	Wed, 21 Jan 2026 13:34:48 +0100
Received: from osppr02cu001.outbound.protection.outlook.com (mail-norwayeastazon11013019.outbound.protection.outlook.com [40.107.159.19])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bta06cc2x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Jan 2026 13:34:48 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GRLlktXFrIT/1pMY7ZLOUNdjMRtpurercj04MKoZIcQAnuy+c2faZSrMfRF+BZPrb6mHuJVhX9lxLJup/qiHH2m8XOY4G0jKXU+jMtoacrF7/9wsekWqhnUomcvmYFa7mHfLPATdHEGBL97XuANYJXgTZunacUU4ZwM5wKW9S4PuSa/uiHc6x4g6fXFvghowrF+Uq/gr9TR9sAqClDYxYsvgJ4rWGFV8L2bmLHBmMj6up2CCn8bLjpkbuhxESwWSWjpRKiF9L626LJ8ykfnVBvrIjcEFNHFju95ymSixActEGFyrwpocS1lGaQnNqnE7JKXr/x0F934xqDiCNCrkuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/HVtRC+vMG2+QuK8gWUQcYFwuf2/gmyI88nLk0hKbQ=;
 b=Vf7f9Z98zxBfWJCP2RGkiIHCI11VYGVOEy+kAO/LgBr+MNJjegS1FWak5Bx/tjLwhadKyjprvvQvapUjGTSu2Ir3rQI2EZtaT0nFrjGpuLM0BzLv6kFZTDIM7quhp3BBpeNiyN05teawMZyGf0iTkaU2A9VRrhrBwrUiFHI8eVroQfVHeR5LC/p/EsTSueeowwHYjwhjy6fY9ZWshK/sVRc99DujMdOQuLuPehLytUDnfDpSEr0yDmAM1zSe0mqgNAyOu6+gyAT07s0MLSDd4TJjD2plsPwPX3WlGB/Gh0uy+HK81AKIYyWeoPC4kwCNVHrBLUmcmU9PqMZ0fFEw5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i/HVtRC+vMG2+QuK8gWUQcYFwuf2/gmyI88nLk0hKbQ=;
 b=bzfebIMH7sSy7ba7dO4oSwi5xG8JCW/eFlSrEFj5Hap9HES7UwkYwZ2pMAsqsibKQWIotCcxkD3SjZpxfYQD6jNGLX4GzAwOPVdp7e5pIwAwFpcU82TIsqATlOcpd7+nQXB/34fFj5AgNQ6UW+susOI58jRUlw2qrWYJqBhT0dxUm2uoUOwpZerly/TNzB5sHQgvzyVfF6bTT57qOwkK9UqfPjImvXJou43dUU3k1kPKeTr3u2G+Siv2GousG2lDD/rT/bRLpRAsGbHfhzO4WSCy1iUYWZKUHq1RT0X5ZifbkzVNr+5+al2v91hs+kvoU8JGv+fcgGOmtgfWym6Z5Q==
Received: from DUZPR01CA0244.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::13) by VI1PR10MB8205.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:1d4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 12:34:42 +0000
Received: from DU6PEPF0000952A.eurprd02.prod.outlook.com
 (2603:10a6:10:4b5:cafe::6b) by DUZPR01CA0244.outlook.office365.com
 (2603:10a6:10:4b5::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 12:34:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF0000952A.mail.protection.outlook.com (10.167.8.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 12:34:39 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 21 Jan
 2026 13:35:59 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 21 Jan
 2026 13:34:38 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [PATCH v3 00/12] bus: add stm32 debug bus and coresight support
 for stm32mp1x platforms
Date: Wed, 21 Jan 2026 13:34:34 +0100
Message-ID: <20260121-debug_bus-v3-0-4d32451180d0@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANrHcGkC/1WMTQqDMBgFr1KybiT/iV31HqWUGKNmUVPyaWgR7
 94oFOxyHm9mQeBT8IAupwUlnwOEOBbg5xNygx17j0NbGDHCFKHE4NY3c/9oZsC8Zkoppy23FpX
 /K/kuvPfW7V54CDDF9NnTmW7rr1IfKpligk3HqGCNtJqbaxcBKpgqF59o62R2cKk4uqy4Umjpt
 BFUqvrfXdf1C60ZNnzgAAAA
X-Change-ID: 20260108-debug_bus-392666c7a3aa
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
        Gatien Chevallier <gatien.chevallier@foss.st.com>,
        Antonio Borneo
	<antonio.borneo@foss.st.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000952A:EE_|VI1PR10MB8205:EE_
X-MS-Office365-Filtering-Correlation-Id: b28e8143-722d-4f44-21d0-08de58e971f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dzl1T0pOQ2ozNVpHSk5CT3FGNUt3cHBsY3I1U0dxQUZBUWdVUUFQaWRUMXdp?=
 =?utf-8?B?NUNIVW9kTnR1cjJHb1Avb3pQKzhCa1ZrNmlQV0JtbDB5Sk1sRXl2Z05MbUUz?=
 =?utf-8?B?Q0hTZUx4ZmtpOTZ0cFg3VTFvcDhjSW4vREcweEVZZFVPZmVBYmE4dFA3UW05?=
 =?utf-8?B?a1FZekJEbVVCKzV0QlpaOFE0dmZnS292N1ZBZU14MWU4QlB3WXZMZ1RjTHEw?=
 =?utf-8?B?Q1pjWnFxVFhwTTFUZC9XNkY5UHdwU0ZKRUxFUlErV0ZZRkh6REJYV1dFcEFK?=
 =?utf-8?B?eWU0VkZHNXV2VkEvUkQvWE91SlBzd1FjZEkyZDRXV0lwNnNHNHhGMHZyS0NZ?=
 =?utf-8?B?cjRjWnJhTmJmSUxXcDUyV3ZoMnhEZExQdStJVXNKLzdBczdiNm9idW9QMmE5?=
 =?utf-8?B?SjNJOUNoNjFOenJremZha2VwOVVHNHhWQjdJbGxtaHFBcHZwcFc3am53KytX?=
 =?utf-8?B?QzA3S3VWUU1VYVhQS1RydmJ3bHZMZTJpZ01WMWU4U0hOYm1NVnBzQjA0TnpK?=
 =?utf-8?B?MXUzd3JXZkFEUjU2OVdUeWVBaDBtL1VQVUhvVVdVZGk4VjRiK2x5ZDRuSkwx?=
 =?utf-8?B?Lzd6cjJXUFZqLysvbWxXenl0SEo1ZUJJSGs0QkZwaW9KUmtyemxrQ0NQMFlG?=
 =?utf-8?B?SmlaTmgzVnhqRkxJSHZNc0lvUHlNZTlMUHcyYWVSbGxockdpZm1Fbm5jMDRo?=
 =?utf-8?B?ZTc0c1p6bVBtVVNBc1dhOFlKdXZjZ2R0SytFOExDdi9kK3JmVFpuVjFMVG5k?=
 =?utf-8?B?NFMxb0hVMnhxakZsYU5ENmE3MzE3ZktwTVlxQzFOWlhweVRicVJxYXJnWWFt?=
 =?utf-8?B?eWlvazV4Q3NSb05RTC8xSGR4MUtTbGJBdVFtOGdiWEUydmlkLy96emUydCtz?=
 =?utf-8?B?VG1jL1JiU1RFVmtlNittbUxWdUdMRDdMS1R1eTdkZEVpZ1djWnBkQW5IUU5j?=
 =?utf-8?B?U1l6anhiSHNqZDhRZkY1WXpCYXZHMnYrQzNCTUJ5aWs2ZXh4QUp2cFV3czdn?=
 =?utf-8?B?Y1EvNnN4dHpEYWJZL1k1Y3BmY0xRaE9YbWRNUGpTT2d1NGVxSkV6VFhyMEZG?=
 =?utf-8?B?c2x2VHp0SXpOME1YTjl4TFN1L1BqSVI5UEtuelFxMlFsbklpeWVpZi9ack5Z?=
 =?utf-8?B?MUdsQzFMMHJKOTRBRGdPR1VWdjE4NW1BbmxrTy82eHlCdzJjRHVDNVlnWWhz?=
 =?utf-8?B?a2V6WkU2M2wvdDYzaDIwbHM2bUlSZHNkOU5Va21ycERZakgxRFhjemFENFZK?=
 =?utf-8?B?QjBkdHVYWTgzc3NCbFBNaytPd0ZscnR4WUVRT1E1TllXUThaV1d3OEozMkJz?=
 =?utf-8?B?aVJoK0dHYTRKMnVmTlJLSUdZNm5FbjZONFByRm44cUFDcUdGcnRUQjFaaHRr?=
 =?utf-8?B?L0cwdWtyRDRPcUJqalpqOHJhcmRkYnFzQVJvelFDMkh2Tmp3SmdCTU05Snpp?=
 =?utf-8?B?R2NiYWd5R3ROaVlwUS9XKy9STjBXbGhjdXlzbU9oZmw5NnE0R0Q0SXpQcitT?=
 =?utf-8?B?UFZBMzBxeEI5OEFlS3dRVCtYbHRlQktzYjRvYVpCSDkxNWZIMlI2RlJNejc5?=
 =?utf-8?B?VU1WR1VwaHoyUXJwUjJLM2ZYYXpkOVdITG5FK1hEVUdpWmUvVzRIMzFpdkpZ?=
 =?utf-8?B?Yyt2MC9RQ2l3OGxaenlxTUhkcit5R1k1aURYRGJSQWlaUXhkZlYvdTNHMjRF?=
 =?utf-8?B?YldGTnYyMVBQWWloTHprQ0JaSnBWbFRsbVFvc0wzNmw0VVdMVXliSU9YN3Ns?=
 =?utf-8?B?SkM5VENlcFpQRXJjU3JybWhrVnNaQjdna2dwd3lGbmhBTTNDMnpHWUxkUnZs?=
 =?utf-8?B?K0V0ajFZbDBNdldmUjRGdnFCLzhMbTRkSlA1K0h5WC9ndnpxcXVoa0xBL3dH?=
 =?utf-8?B?UkpyaEhNRmNiTjlTMm5xM09kVDYzODc3ZFo2TlF2RU9DMldqWWw2U3BaWTNa?=
 =?utf-8?B?SlorVDRRV1BXQ2NvN0t6MlJENkd5RDMyOTRhZlAwZVY2ZERYT2xXVnZKaEND?=
 =?utf-8?B?SWdkN2YyaEpReGdXZ1lpU3YvdXBQTmxIOFJnVjRNeWViVk95UXdtOFlFbWNM?=
 =?utf-8?B?WlNFOFd0bGI3NXJ1bGJtclJOSDdrSmRCRjNJaCtUYnlXbEs0cWp4Zk1xUUph?=
 =?utf-8?B?Z0N6S2cvTk5rKzJUcitwY2RZcW9VcE9MM2dCY0kxaXZwUi9EdHFRVlVsQ2hu?=
 =?utf-8?B?STJ0bDJUNHdEY05kcGtQYjJhZHp0UUxUOWg5LzRYOWFDNndsQjFxeTlaazU0?=
 =?utf-8?Q?NQiCG+degKAyfuijWC7MqzGyHyhRaL9J+1YvvqhnQE=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024)(13003099007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 12:34:39.4580
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b28e8143-722d-4f44-21d0-08de58e971f5
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB8205
X-Proofpoint-GUID: ESBNSkBoqllUQCRxLemBvoDEycRoPlLF
X-Authority-Analysis: v=2.4 cv=fuLRpV4f c=1 sm=1 tr=0 ts=6970c7e8 cx=c_pps
 a=/rRiG8GCWFf73VG6a0KYlw==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=8b9GpE9nAAAA:8
 a=Ca_RQAvUjDkQCxdtJiUA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDEwNSBTYWx0ZWRfX65ZcMPXwOKRd
 NVV7nzm3Y0xzJhP1BzMnref3phwNm58DXcc8ybfkCFZzewvIXXidhKYLmvKO0gJjx8D4NLgR2/R
 sYSRnuLFCZ4LJTu7eYVFT8tL1YNsPTxUu5AmwjXV6+o5uPInacpFAvpe1TpYSwJKOsVu5m4Jx2D
 CPC+wrRNnPUtVOmQ34fLw7sbsyJuEzR9fZ7bwZTu7nHtC58Cq/hylkk4wWLpgy2Mtc1cJW4J4Sc
 0Xxro/eX3YyRxpSUUQa6He3TeVx5Thpj3V/nK1rt6jP4IzoNi7Gl5G/3wGYSl1OpXyOyfUr8eCR
 MEkNRe94cLdGgrX4fO/q+vJ0Gull46+jf5VbnrKSRJi800GScisLPu6X8InaiiIBYu7+68DzpKm
 p6EAQ7sFJWUn0L77z7rLMq3C+jGI+AJv6eMC2Mq4MDu+sXkblesIlAydBW8ZeLZ1TPkg2hVWUiK
 Ek1qPCJviY/7UALfQnw==
X-Proofpoint-ORIG-GUID: ESBNSkBoqllUQCRxLemBvoDEycRoPlLF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
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
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-30851-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,foss.st.com:mid,foss.st.com:dkim,st.com:email];
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
X-Rspamd-Queue-Id: 39F6956F1A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Stm32 SoCs embed debug peripherals such as Coresight. These peripherals
can monitor the activity of the cores. Because of that, they can be
used only if some features in the debug configuration are enabled.
Else, errors or firewall exceptions can be observed. Similarly to
the ETZPC(on stm32mp1x platforms) or the RIFSC(on stm32mp2x platforms),
debug-related peripherals access can be assessed at bus level to
prevent these issues from happening.

The debug configuration can only be accessed by the secure world.
That means that a service must be implemented in the secure world for
the kernel to check the firewall configuration. On OpenSTLinux, it is
done through a Debug access PTA in OP-TEE [1].
To represent the debug peripherals present on a dedicated debug bus,
create a debug bus node in the device tree and the associated driver
that will interact with this PTA.

[1]: https://github.com/OP-TEE/optee_os/pull/7673

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
Changes in v3:
- Collect Rob's review tags
- Add stm32_firewall_get_grant_all_access() API and use it in the HDP
  driver.
- Link to v2: https://lore.kernel.org/r/20260114-debug_bus-v2-0-5475c7841569@foss.st.com

Changes in v2:
- Fix kernel robot error by documenting the access-controllers property
  in the missing coresight peripheral binding files.
- List the access controller items for HDP
- Various minor fixes in the debug bus binding file.
- Remove clock documentation and its presence in the DT node and driver.
  Bus clock will be handled by the child nodes' drivers.
- stm32 debug bus driver:
	- Depopulate the bus when .remove() is called
	- Remove trace when error on devm_kzalloc() as the trace
	function does nothing in case of ENOMEM.
	- Remove use of of_match_ptr()
	- Use tee bus callbacks
- Link to v1: https://lore.kernel.org/r/20260109-debug_bus-v1-0-8f2142b5a738@foss.st.com

---
Gatien Chevallier (12):
      dt-bindings: document access-controllers property for coresight peripherals
      dt-bindings: pinctrl: document access-controllers property for stm32 HDP
      dt-bindings: bus: document the stm32 debug bus
      bus: stm32_firewall: allow check on different firewall controllers
      bus: stm32_firewall: add stm32_firewall_get_grant_all_access() API
      drivers: bus: add the stm32 debug bus driver
      arm: dts: stm32: introduce the debug bus for stm32mp1x platforms
      arm: dts: stm32: enable the debug bus on stm32mp1x boards
      arm: dts: stm32: enable CoreSight on stm32mp15xx-dkx boards
      arm: dts: stm32: enable CoreSight on the stm32mp157c-ev1 board
      arm: dts: stm32: enable CoreSight on the stm32mp135f-dk board
      pinctrl: stm32: add firewall checks before probing the HDP driver

 .../devicetree/bindings/arm/arm,coresight-cti.yaml |   3 +
 .../bindings/arm/arm,coresight-dynamic-funnel.yaml |   3 +
 .../devicetree/bindings/arm/arm,coresight-etm.yaml |   3 +
 .../devicetree/bindings/arm/arm,coresight-stm.yaml |   3 +
 .../devicetree/bindings/arm/arm,coresight-tmc.yaml |   3 +
 .../bindings/arm/arm,coresight-tpiu.yaml           |   3 +
 .../bindings/bus/st,stm32mp131-dbg-bus.yaml        |  79 +++++++
 .../devicetree/bindings/pinctrl/st,stm32-hdp.yaml  |   6 +
 MAINTAINERS                                        |   1 +
 arch/arm/boot/dts/st/stm32mp131.dtsi               | 118 +++++++++++
 arch/arm/boot/dts/st/stm32mp135f-dk.dts            |  24 +++
 arch/arm/boot/dts/st/stm32mp151.dtsi               | 172 +++++++++++++++
 arch/arm/boot/dts/st/stm32mp153.dtsi               |  68 ++++++
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts           |  40 ++++
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi          |  40 ++++
 drivers/bus/Kconfig                                |  10 +
 drivers/bus/Makefile                               |   1 +
 drivers/bus/stm32_dbg_bus.c                        | 236 +++++++++++++++++++++
 drivers/bus/stm32_firewall.c                       |  44 +++-
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c          |  14 ++
 include/linux/bus/stm32_firewall_device.h          |  26 +++
 21 files changed, 896 insertions(+), 1 deletion(-)
---
base-commit: e82d0477fd80707221c3d110f56d05506de2698c
change-id: 20260108-debug_bus-392666c7a3aa

Best regards,
-- 
Gatien Chevallier <gatien.chevallier@foss.st.com>


