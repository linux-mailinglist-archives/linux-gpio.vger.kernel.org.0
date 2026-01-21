Return-Path: <linux-gpio+bounces-30850-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKJLOYjJcGkNZwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30850-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 13:41:44 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A573B56F11
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 13:41:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6AAC9929141
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 12:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF39E48167C;
	Wed, 21 Jan 2026 12:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="M3na6BQj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB729319601;
	Wed, 21 Jan 2026 12:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768998928; cv=fail; b=I0r4mbPtClMcU/Bdd+19T7Vuu1VCD23WpKAiUOightg7+gfzjigDYWSJkm35850919t8BIpE9ktdbj5QAjek9jJN0+4LSs8/ozg4i+m3Ohq1PLRXxP4tr2Y7awesUCSKtz9cFFKPliWN2RrB0nZOAna/KB/zDaQMYcAHEcthaJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768998928; c=relaxed/simple;
	bh=kWxnJDYO9AftrrNNS1t08lSBPaz4Xh10odqD9/Zoyuc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=IAzI7nRBQnuXVTxVOV3EKOTD7TYp0Cwl8lAJKdB9AZwd9KNDPLR1MJNQ81A6RvEZPkmhqUSLjAGKEdLRU2r8fEFijdIBCktPsnnL67ECb7JyICz3NeGfOUZixI0ejSH2+rCymurIFp54aGMEF8a/o1ryxccNHd5wcT5P23l3LWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=M3na6BQj; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LCWsHR1549277;
	Wed, 21 Jan 2026 13:34:56 +0100
Received: from mrwpr03cu001.outbound.protection.outlook.com (mail-francesouthazon11011003.outbound.protection.outlook.com [40.107.130.3])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bta06cc3b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Jan 2026 13:34:56 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ioDsl1l05kbPTnDmCmbGhQRBjSE+aVroPYtQQw1JEM3LcSDtbgIacBbWKbQJL7IAAISPvRVxbAexIt9+Gntyj31/JJJKx50OQDKdnMvm+Tu4z6VlEEyaP+8eU0yp7glQXKJR+rBXmxTNjY31Ycb0qSvLHbN+eUytudZ/X4skq2xfsq3Os+9i+nWaGzlamR0D9FlIABdfH33Xc9LL4BDn3G9kkjsJ6GwdPnjE+73NJT8VcCB9LX529PF8Eh60wdGAlTneF+lZrYc/MFdsvE72/TJqBDSxcq5z+DLujhO4TeWYececexRfOK2Hkw20V1yYtAUnqs0OSS+7H9BCtW5GGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=srWL9bt58H8X54p4YAG4fjaV9EEKOcR5MTMc7HXPiu0=;
 b=cOI32chgz/r05qOVGKMpT7WtglUV9S5/YNg5oSKvf8AQCMaeTin2g6NbugP2RY8/8Ym9cb/v3JXnBHEK2w26xUYUs6Dlij9ZYA8dDgf3KgVC3wWXQ1PPW/0f0UBC5G8QDmlw0oiMm0+EPPynhfzQ5PnPlgWJ3c+DJgFRqvjVw3NVftzqhjxgNNX5L3I2/+628lSO4wLxF7RvahvT60mT4PvWHEMAEPuEcsFfKlHan6nVj7LKhOd5nyspWt/miO/TgxDUpH6dfog/CKfDBAKcp3urIDKyf/qnWT/EnWIGEvdOAYBF/3NN0ZerGimsSW+menGwLkR9cfb/hg8BwBjgCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=srWL9bt58H8X54p4YAG4fjaV9EEKOcR5MTMc7HXPiu0=;
 b=M3na6BQjByqlvItekuWm4BUKcQQMFglCYQeStFR4/wFoUkGeh0IxQmMDovANNpmLH1VYlsHS/FyQU6WkBpPjg/MBGPTw6NV3sgIYnnqt6uRqnL8+y7i8LGZXOgDhEwFbqst2jxGT2RYQJh4YzIv7UCR+Wn1y2/DEHHnxzXP2Y6HAeX2tsRhLaKAvAO2LNrU0mJkJdXwS5DbG49oaDiIxi7RQUkB3SOLF7L96Ufsp0+XkkmADnXVMpqB/rfC/qc83yw8/OuQfqakO/qiyMHfpm3ny80Duf0L8oS59dNGRGCp9boVD3w+qUeSy/vbTM/JQdK9gvIUXqs+8E5/CZOZCeg==
Received: from CWLP123CA0051.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:59::15)
 by AS4PR10MB5396.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4be::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.13; Wed, 21 Jan
 2026 12:34:50 +0000
Received: from AMS1EPF00000048.eurprd04.prod.outlook.com
 (2603:10a6:401:59:cafe::45) by CWLP123CA0051.outlook.office365.com
 (2603:10a6:401:59::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Wed,
 21 Jan 2026 12:34:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF00000048.mail.protection.outlook.com (10.167.16.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 12:34:50 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 21 Jan
 2026 13:36:19 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 21 Jan
 2026 13:34:49 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Wed, 21 Jan 2026 13:34:35 +0100
Subject: [PATCH v3 01/12] dt-bindings: document access-controllers property
 for coresight peripherals
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260121-debug_bus-v3-1-4d32451180d0@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS1EPF00000048:EE_|AS4PR10MB5396:EE_
X-MS-Office365-Filtering-Correlation-Id: ab1510e5-a263-46f7-2be4-08de58e9784d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RklEQjZYTU9TbUFjN2VPMjhub3EzZlNzZVpvNlJraGhreEU4SnZ6TDJKR09v?=
 =?utf-8?B?dzZrdE5BSEtoaXZtNCtSQnJDRUQ0STBYdkgvK0ZDeXQ1RzlWZWJyMitZajR2?=
 =?utf-8?B?OFBjbTZmOHRjREd2ZGpudmczODdSOG4wTWs0TXZKNk14TUlPZ2JaVm9Oc05Y?=
 =?utf-8?B?aXdVSC8zNGVGUEdIcUxoRHJxZmJBVUJEN1hibkovaXNrUUtWQklzaDd1U3pw?=
 =?utf-8?B?MEhCRGVtZE84bXNtNVpmeXpocE5TT2cwcHZoZS9aakZtYkZnbHJ5Um5TL2lR?=
 =?utf-8?B?WExTc3BzSDF0RjJkOEI5cytsMEpZWm1MYUo1Q2I0MUZVNkIweWw0d1ZEcUY0?=
 =?utf-8?B?ZjRrY0hyQjh5WTk5QXE1dVNBQjh0WlBiSU1TenQrTHZYNlhkUmFaZEx2T0hw?=
 =?utf-8?B?Z001dk5aaDFITEhWWE5oL2FEUjJPZlg3TVNCTlp1OURUTklhck8xZDVRNjdv?=
 =?utf-8?B?c21USk1ZZng0RktnL0NjQVZKK2lMZFNzVlBzUVNsek55VWNMeVlBeHlZWStC?=
 =?utf-8?B?QzUwZ3Y2VFlLalJwT1c4MHMvVGlSN2h4VEFtVWxIblFYRFBlTTcvUklNeVpk?=
 =?utf-8?B?NElHaThWMW9ldWdEWEtpb3dpd3VzUzRXaTVvNmVlMFMxVzA4eDNwZjg1UU1O?=
 =?utf-8?B?T01ZZlh5WmtyQmJ3ZDNrVEJDTzBJbjg1OWxHODBxU0t5enI3NXk2cTI5aW9o?=
 =?utf-8?B?dHNYS0VLdVU2clN1bDlCQ096WTVKbDZpcWVMd1NOTmpMRE9mMzN1SzIxSUlZ?=
 =?utf-8?B?ZXBFbDhiYVZPVkRtKzUxc2thQmVwSTJoY09PZ25uMFR3MHE5clFMdHEzdnVx?=
 =?utf-8?B?cUh3eFczaFJsM0lhc1ZrQ09neS9VMzZ6a2dnMzY1eUJJcXdZa21TNmIrb04v?=
 =?utf-8?B?NTdQejNBaFVpaVdzTlg5dmdNNUZzb0hvTFMvUElWUTU3TStOV0EwaFdMMHdi?=
 =?utf-8?B?b3B4RUMvdFd0bm1nODYxUTdKOXRaUkI4R01xWlVpRldueWtyVSsyVHN0WnZh?=
 =?utf-8?B?Q0NacVBNQjlocU1nZUU5NlpwTlBlUFVWMnpaUzlLT1doMnZoZlRhT3A1TXhD?=
 =?utf-8?B?MXVnK0ZXTmNWcngvdVhWVGVQY1U5OHhXMWRRYkZPNU80TnJBSGl2N0lodW1k?=
 =?utf-8?B?akxHWUhJbk9zWTAyWit3V2NnSm4xdUxQUnVWOVRHUWxWSndIcVFiNmlzRTIz?=
 =?utf-8?B?S3FDeHhSOHhveS9JWG9kUTYvcEdrRVZDUmhGL0dkdXdIQWNKQ2wxd3NZbjQ3?=
 =?utf-8?B?Vm5uTm5mNjFDTVlzdXhXVmdLd01zM21xSGZFbFFPZkM0R1ZLM1VGWDk4cW1N?=
 =?utf-8?B?SEljTzl5OHpLVzVvYzJ1Y3pBNFpMdXVsb2o4SEs3OHlLdXRvU0ViL0hselNu?=
 =?utf-8?B?aVVna3VrT1RiNjlKSnRNTlhaMmxWcmpHZGthYTRHdjJFeFJHUEhjTUZZdVB5?=
 =?utf-8?B?aHBadGtlWTFxTXA2NGpob1FhUHB2R1dTRHhvUk1YN1NFa29hTDZFUnZXaGxj?=
 =?utf-8?B?WEc0TXVGQUdWZWhzajhuQ1owU1p4aWhtV0xzSEM0dFZMVlVpdlV3Vm5wVFFx?=
 =?utf-8?B?eU9SQ1lXdEtJQVVGRC8yV3c0WHBiZ0NVRFFMdVpkdi9ab3Zxd3NpaUNsNm0x?=
 =?utf-8?B?NXJkaG5GYjBYazlBWTNCS0U1Slg4ejMvRWxxR1BuazdCSXZUL0JyMldLVFZH?=
 =?utf-8?B?Q3dkTC9kbGdhelZVa21GeDZSdjZLQlRuQ1hDdzNWbk1vNjJxOUpjR0UxM2ZU?=
 =?utf-8?B?RzB6aDJHalkvQU9jVlF1a2Z0VGRqc0JqMGZzd1lUR25rQ1o0ZWl5YU1pRDJD?=
 =?utf-8?B?NU03Snh3VWorby9iRUdMbHBmQUluSjRQK0FHS3pra28wYzBJQWI1OTlGVGlZ?=
 =?utf-8?B?aFlzbmN1dzZjQm0raXJmd0J4VnJsVy9uNzBwMFdKVnVSZ1JhTVQ1WHlFcytV?=
 =?utf-8?B?MHhIeitQVFpSRkdSVG1LWS9oSmlVK1NkVGRHeTBDbGQ4UDhCZkQzdVRwSkw2?=
 =?utf-8?B?WTRGUDJxanJSM2pmaFUwZWhyY3BoR3dtZjltWVFVejFBa2dJcXhCaTFjci9R?=
 =?utf-8?B?WWxpaDljdG9tRTErTUZCZjZSU1ZsekNlN3pySXdDa012UEE4T05YVC9ZTko4?=
 =?utf-8?B?VFpCUzVkM0VZaS9jeDBjVDNYT2JIK05vL3BIRG1QejEyYXo5U1FIbWs2K3Bj?=
 =?utf-8?B?LzhOTTdQVFpiR2hnR0xrWUxuQnB1dlVDaUd0OW5YbU5ualc4SnFXcGtRanox?=
 =?utf-8?Q?WXL30qQ58MCyWSy4iXbmteObQcvCj1Ektj9cybJya4=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 12:34:50.1230
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab1510e5-a263-46f7-2be4-08de58e9784d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5396
X-Proofpoint-GUID: AD6BlGlWDmQAkt9l4BBP2ua0BAs1qblN
X-Authority-Analysis: v=2.4 cv=fuLRpV4f c=1 sm=1 tr=0 ts=6970c7f0 cx=c_pps
 a=R56xEDDr6mzyEyUPSk+Xbg==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=VwQbUJbxAAAA:8
 a=zA8jFupHd_524mN9yHMA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDEwNSBTYWx0ZWRfX2L2JAz2zpEbP
 6teUtTcrcEFWRabDe6QvCXENEyXZk+Z7eNBOg4hWMG12PEyaa2FKMaYZf1KD8cdH/tvRm+/9128
 Bzt232Q3fcl1a/hy3GqwrrXXfR9VWiDF7HjLUgX2XBBZM/mxHKDfntHLwm2vPL/qnP7Im49fItL
 sTuSSyiwm08pbI1uf3ijjC19XjbH6uF0e6KJwu7neBMUOIXHRaESRYP1oLqPv6abAw5JukR+1JP
 4GJeC9N9ks6dNTzFfFxDEn7JGu2SlzXAv6jAXu4lfG6sxDLKlNzpNa0Od1s5pYpdcIn2UuvVAlS
 vyP5G2VqJ/mgfkkUseWwI5cpxDZUKiM3XXb4C1p4bdgM+oTAYF7Nvn5oO4XQPocyraXKPte6H/6
 zvnRw5e6v4EV0qcyYYP1ZT+tujddYG+jPdzzVO5gFNUEsYQn2JrH8GpUvztJWTVXIKupuUWb8xD
 WfamobM7JiuJWleGXUQ==
X-Proofpoint-ORIG-GUID: AD6BlGlWDmQAkt9l4BBP2ua0BAs1qblN
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
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-30850-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: A573B56F11
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the access-controllers for coresight peripherals in case some
access checks need to be performed to use them.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml           | 3 +++
 .../devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml          | 3 +++
 Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml           | 3 +++
 Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml           | 3 +++
 Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml           | 3 +++
 Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml          | 3 +++
 6 files changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
index 2a91670ccb8c..949444aba1f8 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
@@ -128,6 +128,9 @@ properties:
   "#address-cells":
     const: 1
 
+  access-controllers:
+    maxItems: 1
+
 patternProperties:
   '^trig-conns@([0-9]+)$':
     type: object
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
index b74db15e5f8a..b0693cd46d27 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
@@ -78,6 +78,9 @@ properties:
         description: Output connection to CoreSight Trace bus
         $ref: /schemas/graph.yaml#/properties/port
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
index 71f2e1ed27e5..10ebbbeadf93 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
@@ -118,6 +118,9 @@ properties:
         description: Output connection from the ETM to CoreSight Trace bus.
         $ref: /schemas/graph.yaml#/properties/port
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - clocks
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml
index 378380c3f5aa..f243e76f597f 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml
@@ -73,6 +73,9 @@ properties:
         description: Output connection to the CoreSight Trace bus.
         $ref: /schemas/graph.yaml#/properties/port
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
index 96dd5b5f771a..9dc096698c65 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
@@ -128,6 +128,9 @@ properties:
       - const: tracedata
       - const: metadata
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
index a207f6899e67..29bbc3961fdf 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
@@ -70,6 +70,9 @@ properties:
         description: Input connection from the CoreSight Trace bus.
         $ref: /schemas/graph.yaml#/properties/port
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - reg

-- 
2.43.0


