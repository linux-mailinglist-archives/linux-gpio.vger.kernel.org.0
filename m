Return-Path: <linux-gpio+bounces-30529-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D82D1E17B
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 11:33:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 777E13075F3F
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 10:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E39DE38A727;
	Wed, 14 Jan 2026 10:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="exkts00x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40871342CB1;
	Wed, 14 Jan 2026 10:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768386624; cv=fail; b=U28MkV+CaWXFM6Y5SbgJMqD8zgPxyaJws57K3uV3J3Pqh8jy2JH3ZaOCyWAtyPhetf60bmexjFID4iix+0nLTVqysyB5NbyMk9UwiF+yVTDD1zEa+724lHugF3F5UdY+S6SI3MebBz4v+tWwbLNa0X+PLp0UuP3u0RNnJwS2tac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768386624; c=relaxed/simple;
	bh=Qcn5R3R+w/VJpW9bxMd9r5CTIzCqn82RZwpeCwOToM0=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=qOYP2K5dwWHBKj7OMalGw3QsD2jwSCfoR428dixX5nbda9LE7yBYbpK+NQLmtTJJq5HlcPShP/NqFaMQqZLSiSSOjPmzZ3C/UI4cdPd6ZHdv+ISAbfDw95hyTK7KT8pAix2rKQx7nyDHZIcLEeSXaCHQ/wA0+z/jve+SFg/2gAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=exkts00x; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EAPiY3139261;
	Wed, 14 Jan 2026 11:29:47 +0100
Received: from as8pr04cu009.outbound.protection.outlook.com (mail-westeuropeazon11011037.outbound.protection.outlook.com [52.101.70.37])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bp7bjrnp5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 11:29:47 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dtInVOmnWBekEaOZ0cNRlPJlCV+6o0rNNB0dWgA7r6hlD2+haF2sHiON7JluwLSuJSaBrOsQgu5aya3lEo2mOJtH1UlJoc2BIeMn6MdgniJvR0bX7Ol0LzQsku+X9lObKHst7RYC7jsv6XnQJTiuUCFnlX+DezzdF/n15vyF3+fMEdTkchG0OfXSxcZ2ECB3fZx0QkbrlZ6xkwTy3ak5NZvvwDn8HZCfYwFAkVttHqyUke68qBAG2tOTOVouqeLkTBr9F48mD4MIWkDzJ0CgcDCfi+j742isghSkqyuEl/CWiC3QpC8d8RtLEVDTehOjJDZVRaQui2YBp9OeMk/TcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=82iaYBcUjYhHV+8ExsjUoWsMsqMtFzhosVFhS9i75Yw=;
 b=raYQSbh3oPSKtjt0RghV4oa94ezCaBWoIZVEyBu50szRhZAI0lqCkOzreq/gHagcIh9C0a4XkY13qwQSnyW/oD7TChseGHzIXYcVJ5IhAEe296oyqH5m6fySlxVEQFmOqej+nGViM4952lECuYaXkTBAAuXAHH9gRCgOnCIsmffGzyx/yqJxI27jRhiIbq6s+WrGfFV/O8lQ/Bs2fDa/TfiY3W+kH96aRAvJNEhic3L2OiqNp/tHLVZbFpZEw99+E3pWl1iEXCS7DHSx20TlwDwrTgBvm18FKbi8H1CI2nlemwo+sRcWsJoqdWeF4HDJCG3a3oRsH50A7SkZ0e1oOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=82iaYBcUjYhHV+8ExsjUoWsMsqMtFzhosVFhS9i75Yw=;
 b=exkts00xxssTF0xwjoUuuIBHnagLx7jjvLWv7zxUzYl9fqtl5liWLBhYklMEDW0TPe83csyTUB0g+qbxwYB4m5sPjLfDCf+AU0W5rPcXpiV1Swf0ySinsOht7MbTBu3thKVrY2djH9orCucx8VPUUhhPxwo6KqLmF8KuX4UL/ToIt9dm3GuZhC2LdDsnnlmx/Kk+g64nKKsbPkVLz8Hg4KhaBeQ46uGd7l+qb3z5LU0QTcn/xHbXUmCci3ob1RpdhyBUREjI+tFIC7MCZaYl0SlDCUzSi0H4Ni65mqKLtao3CebGXITALPVjIJkHc4eNp3dvoTCwLtgudWclsg6P+A==
Received: from DU7P250CA0018.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::31)
 by PAWPR10MB7717.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:360::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 10:29:44 +0000
Received: from DB5PEPF00014B8A.eurprd02.prod.outlook.com
 (2603:10a6:10:54f:cafe::f4) by DU7P250CA0018.outlook.office365.com
 (2603:10a6:10:54f::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.9 via Frontend Transport; Wed,
 14 Jan 2026 10:29:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB5PEPF00014B8A.mail.protection.outlook.com (10.167.8.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 14 Jan 2026 10:29:43 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 14 Jan
 2026 11:31:00 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 14 Jan
 2026 11:29:43 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [PATCH v2 00/11] bus: add stm32 debug bus and coresight support
 for stm32mp1x platforms
Date: Wed, 14 Jan 2026 11:29:14 +0100
Message-ID: <20260114-debug_bus-v2-0-5475c7841569@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPpvZ2kC/03MSwqDMBSF4a3IHTeSRxtjR91HkZLERDOokVyVF
 snemwqFDv/D4dsBXQoO4VrtkNwWMMSpBD9VYEc9DY6EvjRwyiVlVJHemXV4mBWJaLmU0jZaaA3
 lPyfnw+uw7l3pMeAS0/ugN/Zdf0r7p2yMUKI8Z2duLroR6uYjYo1LbeMTupzzB4aNlTikAAAA
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
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8A:EE_|PAWPR10MB7717:EE_
X-MS-Office365-Filtering-Correlation-Id: f81e0d9a-4356-4362-252c-08de5357d55a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZnRJSWk1VGV4b3NrZDRWSDk1ZzNraTNrWk1yNTRMaHhiNWNFTlR3TExZQkJJ?=
 =?utf-8?B?S3NFNStZeHRZSWtFTTIwY2dlV3Q0bENrdlFrcksxb3NjWE4ycFBxdElVR3Rs?=
 =?utf-8?B?cFNIVTB4QzJDYXRnMHNnam1ENlhpK0ZNWW5mRnVvbkhjUWR3NzhLYm8xZjYw?=
 =?utf-8?B?aUp5TC95NVJSUHhMNUFRUlFMbi80TGVNVTZGMCttdkMxRDZzaHN0a21SRm15?=
 =?utf-8?B?RG5jbkNFYVBWSENBand1VG9DV3FUTHFCaUJZeXFBc1NWaGR6Qk1PR2YvUmpG?=
 =?utf-8?B?bU41VERaKzFRbmVSbFlhUnZsMVNvUTBHNmM1cGVRY2JiWTNIME1vYmJhNDhC?=
 =?utf-8?B?TXlTNDhaUXBUWXd3dmlVOHBaZTBGang3Zk90UTNCUkx3N3FML0NzZ0FQL3Na?=
 =?utf-8?B?cTZWRVdBQWMydmN4cTJrS01QY3RsZGxRWi9pVzZ4cVRxa3pPOFNXTGlsNmVt?=
 =?utf-8?B?TU51a1lObW5ZdVR5Wkd3Wk44NmdtNXQvTzdaT3d2NVY2MGR5c3BKbnFIVDVs?=
 =?utf-8?B?VHhzc0YrTHpQTkJqTjJTTHlnMkt6T00wc1Z1eDdhOTVvQ1FpWHRjaDhhcFBY?=
 =?utf-8?B?U1VxTWFtRzRqNGROdDFtTHJRTTAzSnhGQVllOWFVUWFmVTY2YUlvU2dXTEVW?=
 =?utf-8?B?NFI4UnZRQnMydWp3dlZqYXJ2N3NkNUc5M09lWWxSY1FUODY5RUt0ejllQjY0?=
 =?utf-8?B?THZIZ3ZKU0xNK1BmaG1YQ0tTNW00b1VTTy9hVC9wUlpsejhPZWE1RXhPNm84?=
 =?utf-8?B?bTR2MUpSLy9CUlVXakRaWUZGZXNoT3c4UWhOUjRZNytjYXBWWVVHa2taZk4y?=
 =?utf-8?B?SkFFWXk3Z3BhSXVxV2JWVTM4dEtMdHdlOVBlbkY1RENJd0ZHUXZHMkxQYjZl?=
 =?utf-8?B?WWhVTXppUjI2SHJTaUZLTVdRT0R4Ym5DMFRDSHBJdm5iR0lkT2FsN3QycmNG?=
 =?utf-8?B?OGJhamdBMzFtQ2JtUHdRTU5OWlhKWW96Q2F2UjhRbUhLdHZVVEFLaGtrZWlN?=
 =?utf-8?B?QVZJbUV5L2h4SjhvNk42K29pOGl6clFYTGlOZnJaMzRvSTlHSngrVjBwNlJ2?=
 =?utf-8?B?VDBsUmRHSGo2aXU1cEQzZ1pjNUd4eWlXMW1vc3Z6UUxlN1VxTmxvQWJoYU5n?=
 =?utf-8?B?bUZtazVxc3RSck1lekdRcFFmVk9JWjJ5enMxVDBaRlZWWnNSWVJlUm1yRGNM?=
 =?utf-8?B?aERsMCtHN3NlVWpJQjROZ2VxbjcxR1k5bWMwaXh2OEJ4T2I0eWMxQS80aThp?=
 =?utf-8?B?WHR1ZzFaWjlYMWlZYjB6Z3JaMHUrejloWEdpY2tNdTJGRCswdkF3NlVXTG1L?=
 =?utf-8?B?UjMvVDV0WHNrdndOdko0NzFFZ0RsM3ZLS2tRU2hFRlhOd056SVFEeDBObDRt?=
 =?utf-8?B?Q1QyZGw4V1hJVHBMTCtQbUg2eExCeUQyWTM1NCtXZDBsQUhXS0ozK1MrU2Ur?=
 =?utf-8?B?V0luMktaeWxvbXUzYkZ2bnMyQzJGQUg1bHhVOC9ZQ2kvNy9DR212dVlmZkJG?=
 =?utf-8?B?TytmV241Mm5ldmVyV1I2TjhaUTlxbzJqcHp6eHV3clhLR3RNbE4yMnRydGxs?=
 =?utf-8?B?dFR1QVdDWFNMT3U0dTI2NlZMR1VUREhyRXBmM2NuRXVCaWtLdUhMeWRFejN3?=
 =?utf-8?B?NmtCL0FubWkwcEcwYVBtTmcxRXJITGhUTzk0ZWpCbjRLQ0x5MDI3M2R5RC9o?=
 =?utf-8?B?WEMzZDRRNHpGR0dDdU1QYVAwbjhqNURjTjJlRmdIM0lMWVg1bmdCNUE2Y3NX?=
 =?utf-8?B?Tk1rZ1BIWks5VGNwcEdQNDNTT3l2NSs5dXZVNjhqUmI3V2M0aVJuWWxwVnBp?=
 =?utf-8?B?cWRaRjBZZGdGdVo4Z0pVMjJMR3hTalVsWXRXcVhmVDN2S1FZTy84L3VWdS9P?=
 =?utf-8?B?TTFHM2x3YXIyK244d2UwbDEzdEJmU0tLU0JSR0YzUDViaTZLMEk5akVxSE1V?=
 =?utf-8?B?ZURsTDAxYmlJZ0ExSlJYMWVpVEcwUFlXRXV1RUZuTGpDcFMzQldJUFRyZC9S?=
 =?utf-8?B?UlNGaExlMmZmaUl1SmhNTHBZQ1BobU9XZGo1aElXM0wyMnFVbDNDcTArWlZl?=
 =?utf-8?B?dGpxYUdiOFRhbjc4bm5hNEV1WTREM2Q2bHJGVG8vcXFoWnJBa1k2aGFZQzg1?=
 =?utf-8?B?MzFYb0d1TGw3NFQvTzhtWXBHdFVPbVZVYWd6RkttMy9RcytyVmo5Sm43L2xq?=
 =?utf-8?B?S0MzWHdldy9NczVvTjFlRG5ZTXZLSHJtUGJCRUlRNlNTaTFiTE9xSEZHUnU2?=
 =?utf-8?Q?v/4ukC5GLUxrvjnt+RC9X3+ljXaVWkVa2LXvPc00Ko=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 10:29:43.8851
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f81e0d9a-4356-4362-252c-08de5357d55a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7717
X-Proofpoint-ORIG-GUID: 7crT-O5lVJAyWnH8un_yKRgW2Er6-kH-
X-Proofpoint-GUID: 7crT-O5lVJAyWnH8un_yKRgW2Er6-kH-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA4NiBTYWx0ZWRfX/MakmwTS+KYN
 gJLjBaKJT4PczmozJwcnRFdEupQTqpF/HomHQusEP3F61vj9gWblLXyCUoqoMo+ppBLjco0rp43
 nusAt8QvZXy/1IQ9j0rTpmhDVnMDlA20hhNzgbXnfITB9rcftmuYb2wTARv/qH5MiX5TuQ3zKsI
 4IsSEZp7apYWnmnVBqAWQlywjpH+22Urx9I32gltKbEzNX91QyMT8QRFQouSevBGWxvxtNonlHl
 c8b38fk12YSqRUZHKSFzZzQQMHBRDf6Rt/bGZgUsdNS5zK8oOOvLff0a23zQuVaKpdJCpmfhgac
 WgjD04U/bR7gBVtZJymODyks3/R+CAR05GmyrAlcxT6cXrrNXAiRn21KyjWbncKte4AkhLfKUGm
 h4/1YDKpvP5s8TnI/NAoj5avS0a8gNnsGiprd8UVVfr722YIl1VHDik7Tl8PhaXXo0BN7JEZH92
 2DXLAJ634S33YqCDUWA==
X-Authority-Analysis: v=2.4 cv=YvYChoYX c=1 sm=1 tr=0 ts=6967701b cx=c_pps
 a=le7R1DPsL10lBYSFBlTEnw==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=8b9GpE9nAAAA:8
 a=ypHp3MR7veaYCG1KK1EA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140086

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
Gatien Chevallier (11):
      dt-bindings: document access-controllers property for coresight peripherals
      dt-bindings: pinctrl: document access-controllers property for stm32 HDP
      dt-bindings: bus: document the stm32 debug bus
      bus: stm32_firewall: allow check on different firewall controllers
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
 drivers/bus/stm32_firewall.c                       |   2 +-
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c          |  41 ++++
 20 files changed, 855 insertions(+), 1 deletion(-)
---
base-commit: 92fad96aea24fc19abe1eae2249402b61de3a3e2
change-id: 20260108-debug_bus-392666c7a3aa

Best regards,
-- 
Gatien Chevallier <gatien.chevallier@foss.st.com>


