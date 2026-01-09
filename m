Return-Path: <linux-gpio+bounces-30328-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 607B4D08C36
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 11:59:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2E8A309E33D
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 10:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 402D433A9CD;
	Fri,  9 Jan 2026 10:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="YeqqxGjJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7776A26E71E;
	Fri,  9 Jan 2026 10:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767956188; cv=fail; b=ChRB/8kAdgCnUYD2iXrO6VBFN/MHhEQXlr/u9HrzX+jJ5osLEa7+1/dyXWjl6nC8icv2uch01CTJWn5VDY3aF3j/RdxieAr2T6Iulol09si0ROTAOPNpfrmm/YpE3bwfqrCKVUfWvaPhF3ekVFTNFV3w/EP/0brul/j1nUEeprs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767956188; c=relaxed/simple;
	bh=dBJR1Jmxq6Qn5ImLi5KTfEaeJt41jSJw6lZ4y1EkjG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=V72AeyyK1QwAWddARlUm6pES+aSRWDv1Y35a+n+RJWhgWqnkjKtDBN9XCuAn17Nl6Y+i9I2ahxSEdhVKcyeq5tzTScsUFAp4a8FWhbBCY6yIX7Bgi2o30LD2kFq6gCN21T7OTUNxMkxUDK/ColcWTa/oCOtFI1mmGoI1T55fZ7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=YeqqxGjJ; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609AlI5J4139125;
	Fri, 9 Jan 2026 11:56:05 +0100
Received: from as8pr04cu009.outbound.protection.outlook.com (mail-westeuropeazon11011014.outbound.protection.outlook.com [52.101.70.14])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bjqbf9qaw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 09 Jan 2026 11:56:05 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VDtp3Gpw5TyxTti5dEN8VReDRd8+PQ9An4bD9mtXrDmp4cLFboUNPDGyACGtrkD2EoPOkjSsaFm+wfgiz7zRl5FWcjP9ZD5RXJgtYwzMRWxb9EVcEk48XctaX9S69HY09/p2N3WEhBurPCpgUNvjWx149y9hg6W39gv/sazBmKTMzn8hdDsQ4OzwUdxrYQTwfBpvWncttzmV+f7Z4hvD3lGprYYyRkU8+/r9C4gZ97O6DWjKmvWmxyNxqjPrL5lB0QER2+izkxsJzvvbyabt0RgJIkYITtLvrtQ9X4qcKvTkjGhIKdXxGsFEVUaIYn0kJXuht1r08CLyLiUd1EMeAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sut2hUVO+AHxezYlRMhkRSYM8ZgDbffLrwxFHP91PP8=;
 b=OOhfRUnQc02gu870q6eC89barfE35JAo2g/krKGZAGSCgoI6eehjIam8EMG9qOHoMDYJ795KoWh+tOeVWhAka0a48NVDVPyXgExQdM8q7AVkS+1iMmUJDDHZ5lotNpHR57o6b02Rz4skAca1vWlepn+NSczP3MU6KDpeI53ha//zo+A9UWhf97gB3oezywp1CRwaKAF4mGK2ATTFRiLRPmBmf5VS4b1lmm3o072tGbVti8bFWJxAYxw+XFVL8AKPlNEIa1fCh/v8yR8rl3p1kCPpPHnAiSu/3kO8kpt+RdD9z0lNRVChIqHNysdfm7QmH3dXZWgtwd4qYAhy0Y+kJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sut2hUVO+AHxezYlRMhkRSYM8ZgDbffLrwxFHP91PP8=;
 b=YeqqxGjJI71P8/RnpiEguqFx3A/OezCsoSODnKsvkB+IKJ7rgqFqBHwYL32BOS9Bv7wc6/8zOUcXfhyosTeYHpC+kre1A9sYDfUt5E4isTWHO30qxEP3urxuuexIfMB/YE0iSxTwvPAxAafU8q0crxx6kUlNr5o5cqx6XsssMJP6w3F3MEJojzp0lgxkkOypbbkeLE5NUd5eNWtb0HiJGCFugw2YVZ1ABIkdjCPNIY17eHHaBN+q4tLuyOhoEOjvWUtlgQC5dmbJYwM+h8DXYMEvnhBOELU170MUFGxim3qUJbExqzgEWWuNJktp9ksto9OJvHIRdBlywJ2c6YFYNQ==
Received: from DUZP191CA0007.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::11)
 by VI1PR10MB8184.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:1d8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 10:56:03 +0000
Received: from DU6PEPF0000A7DD.eurprd02.prod.outlook.com
 (2603:10a6:10:4f9:cafe::1a) by DUZP191CA0007.outlook.office365.com
 (2603:10a6:10:4f9::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Fri, 9
 Jan 2026 10:56:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000A7DD.mail.protection.outlook.com (10.167.8.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 10:56:02 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 11:57:18 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 11:56:01 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Fri, 9 Jan 2026 11:55:01 +0100
Subject: [PATCH 01/11] dt-bindings: document access-controllers property
 for coresight peripherals
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260109-debug_bus-v1-1-8f2142b5a738@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7DD:EE_|VI1PR10MB8184:EE_
X-MS-Office365-Filtering-Correlation-Id: aedff7d2-631d-4221-5e2a-08de4f6dae56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eWZOZUhjZVA3VDAyUzAzOHorTE5wQTRjVDlOdTNHT1AwUFk1emp3UjFNRDBZ?=
 =?utf-8?B?TVVybGU1cFFwM3dXQlRaaHdKMituQW50cDFHNlQyeUIyejVxMmhWQ1JWSmlk?=
 =?utf-8?B?c1J3TTR4YlJGQit5YnlDQ2hTKzhndnZwRlV0UU1aQ1I5WmpDenlBdWVjRHJ2?=
 =?utf-8?B?a3ErNlZZakozOVlFUzBCdGdLRkpZUVZqakJIRTJoYi9NTzdOdmsyQ2ZpajZ2?=
 =?utf-8?B?VmtsSHVDNC9KbG42bDZHdDdaNWZPTkU5aGtDUTU3ek56bTN0L1BMSXhmLzRG?=
 =?utf-8?B?emxrMzV5VWNoZHRjd0lHTGp4bytyaEh0YkZIcUNVMUZKUi83MUFSNk5Ecms5?=
 =?utf-8?B?MTlIUDlIT0RUelpaRVMwcUFET3NpbFlpRTdrb1FaT3pIVmVrK21JWUdKQ2pq?=
 =?utf-8?B?WU1NakRrU1dneERyekVlVG4yOS9uYnFvZzYrNTJoeFBSL1JPY0pEK29kc1ZS?=
 =?utf-8?B?WjBpV0N4RWFzSWRwRG5LNVQ4TXlESENlNGJsMVJMZExEa05RZ1lSY0JiTVJj?=
 =?utf-8?B?ekhKUkJMMjNlb1ZCSGgzWStCeGxrbDNaZlVobER1QzlRTkRYSTcvTmxoYjBX?=
 =?utf-8?B?QW52THVweC9HNWtkakQrSlZzOXo0WnBud0xBMzM3clBsUTlGMFJhZW16S2pw?=
 =?utf-8?B?R3JxbXJ4WEIvU3hZUEVYQUpzUmpwcEdLOVFRRVd3djJPaTFoVG1VN1BzQS9j?=
 =?utf-8?B?SHU5MitVck1pME9GWnZzcFYwUGFsWmJ4QU5GME9kSStmRUt5WDY3YnBLQ0Q3?=
 =?utf-8?B?UDBBVWhwQTZYSVQ0eUJvNEhzdU9Qa2dYTnhRbkhxNER6UHlxaXc1MmJ5cExS?=
 =?utf-8?B?eDREdTZaRWdxZVBxUExteGpjQmxqQTdZYnpFM1pzdURaVGtKRC9wd0FkN2FU?=
 =?utf-8?B?NEV5ckZqeHBLalJCOXoxMFR3OUdzbFZRQ1RIQlBxMW1QajRYZVVRMit1SzBS?=
 =?utf-8?B?TERjQklBaUZ4MG1CNVNFVDd6K3B5T1NBRDRmeUlucVBkYWdScVcwNVNUT29s?=
 =?utf-8?B?Nm1MZW1LV2VPTnAyQjJqcnR2Q1pZMzB5RC9GSDk3Zkk4SThQN1pTT01NZXRM?=
 =?utf-8?B?SjBGbHExMXVDMm9jOVpkbVd3eThqNzlHZnJkVzFGek5rOHpUdnViUStWK1Ru?=
 =?utf-8?B?TFNGb1BDY2lBcklZWVIxYnZoVFl3bGtKMWxOc1gzbFY2M2JDc2pIN0x1YTgz?=
 =?utf-8?B?ME5ZZTlSVlpXRDZWZmp2K254Z3o4UFFYaEV0b1pqUTV5TnM2eTA1dG95QnhC?=
 =?utf-8?B?amZBblNQSEdLd2VZdEVvQTROaHRodVBvOUlHd2o2U3d5bkcxUU11Wllmd2w1?=
 =?utf-8?B?c2xpR2hHMm93cGtyQU9RR1UvZmpnSFpHOWFKR1hiSjhURmpLMkRiOW8rTU95?=
 =?utf-8?B?K1VhUStZQkJlZCtKVmI3ZUpaTVpFeXo1QnJQSk9DSTcwa0wveFNnT3owV3RZ?=
 =?utf-8?B?RC85YzBSOG81YVU0cHVxTzJqREJ5eDlBRmpxdTQ2REVhVGlsWHR5NkdsY0ZX?=
 =?utf-8?B?ekZ2MmZwREFIU2M0Skc4d1ZIUmJNMWVyNkpWcllrK0VVT2hjNUZIbGQ5ZFA5?=
 =?utf-8?B?SWZUb04yaTVkcHYyRGJjNkZ3bFpXZ0loZ3FKR1hORENCRW5wcnJlMndhSk0v?=
 =?utf-8?B?K1RvckxkQWs3bk51Y3V1eWZZb0hTZHJSbjBEaE94ampCbWxJYWN2NThwSkZX?=
 =?utf-8?B?UEluSmgxVVBlVi93RGFtRjU1N3gwTHVJblc3SkNHU1JJMFBTRmdJWWhlcUpO?=
 =?utf-8?B?Wm9sbEVEZy9jWUVIbGR1UUNjUy9ybWlkdlRTUWkzbHdOSTdzUktSMnA5TnJV?=
 =?utf-8?B?bmlhVU95QnJaSC9IcnB1SVNJSEdINmJPOTNCeWsrN3JPMFZSaUsyaG5WY3Mw?=
 =?utf-8?B?M3lYK1BZcGcxVlhnczZ2SkhNNGNKVHFSeXdwU0JSZTRqMGt0SGlyTU9LTzlo?=
 =?utf-8?B?ZFNSWlhyV3NiOFJnRnJTOG1XUWk1VDBjbytyeFBCcnBGdXQ4eTRReGNyQnhQ?=
 =?utf-8?B?eWZ0VnZWQ0pQL3BseXJmUnc3SDdQZHBFT3FsNmtveFZIQ2R2TXNkckZsUGZP?=
 =?utf-8?B?WlpCdUpLZlNsaE5NZDdWSDJFZlBYL3c2MSt1Tkk5TVcyT1Y0eW1TdFgwSFY0?=
 =?utf-8?Q?Nbu47qcsahw+EUpMsegymaCx5?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 10:56:02.6915
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aedff7d2-631d-4221-5e2a-08de4f6dae56
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7DD.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB8184
X-Proofpoint-ORIG-GUID: 1VTrg0VRwJaHqNfEi2tWtROs79T7gxTT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA3OSBTYWx0ZWRfX2G/6K6yy1ZD9
 9iPZt9ZcZC6O2BBcquYR8bVXFbMTFy8lSAlZBqZwexySIYkoclNzfZ3452AiCAp2vyZfjAOj4Ux
 C+91nxtNOgnEKmfomDiwk6vlMd4ZEAR0aZyx0IXzWCcVxUtV6qF4ENTCe3CA1LMUsA1Ad+WbSHP
 caKSUB9fwxM/zjFttoAiuo8d/IRRaNQX3daPfy/pyZ6HfZ5nGaHeENHPg0nckhKaplXsU7nYw55
 /uCPb4a/+DIZwzJYd2wgQCUGzhb6pc4W7Gu5f2THBsHN7Qx5/u45z+MVgOVZZXF7RQ7mAMX+7Uz
 bNzoRENVW9RHbOG9PCxMUE1fjr58oiiJdZPbQBt/XDGL/dtOzUhi/n7dfg+SCg7Tjy7fqvWXaz1
 nSgp4yY9IhHyQ4iHItMfxVejHypLydbk67MnckYDhJDPtEHdPIbxWdJn7xqmuvyMjAU4R02RtIv
 P5PQUBqUbfIfgYkSzKA==
X-Authority-Analysis: v=2.4 cv=abtsXBot c=1 sm=1 tr=0 ts=6960dec5 cx=c_pps
 a=x9zcKlvBpG4CqsuvBplHWQ==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=-k0Mbft0Yh-Pe3FRC_sA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: 1VTrg0VRwJaHqNfEi2tWtROs79T7gxTT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1011 priorityscore=1501 spamscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090079

Document the access-controllers for coresight peripherals in case some
access checks need to be performed to use them.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml  | 3 +++
 Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml  | 3 +++
 Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml  | 3 +++
 Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml | 3 +++
 4 files changed, 12 insertions(+)

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


