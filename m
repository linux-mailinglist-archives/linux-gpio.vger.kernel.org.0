Return-Path: <linux-gpio+bounces-30332-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AE4D08BE9
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 11:57:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EBFA13015AE0
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 10:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ED4433A9F2;
	Fri,  9 Jan 2026 10:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="LN91naG5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0B133AD82;
	Fri,  9 Jan 2026 10:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767956249; cv=fail; b=Zn7K8RQHWF1PMAx/ekfXGYekkM0wc338NSZCODaCObwzjimd2ZYBVA5lqJSzOE1RpsXRUNje8Zr7zOgRZshYcWCHDCiotH2T7nv2TdZ4uaGmtTia7Em8SVIW6hmntoc0837W/+r2apR9L3wnCCzvqWyppVRON5Kk83A2a3XEIZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767956249; c=relaxed/simple;
	bh=CZJ+ivGV7gMoaxEMAgFAdDbDEkGZWq9ArDw5RnZZEmY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=R9w0y2FL5ROrR9o+STQVifY3kICWe/ZD0igOgW+uuPncdc726iO3HtT4n3iebsSfTs6ixEoszPRMVNHuKSFvHn/rr952Mq1+vxvkSt10k6wGU6Sity6aZ77cLrXdOyUDPV327hSGKdALr5yyb1HIDQs2ks8WzN/2mPBGs/V0Ems=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=LN91naG5; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609AZCDr4171535;
	Fri, 9 Jan 2026 11:56:17 +0100
Received: from am0pr02cu008.outbound.protection.outlook.com (mail-westeuropeazon11013047.outbound.protection.outlook.com [52.101.72.47])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bjv2212ur-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 09 Jan 2026 11:56:17 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DUM901FDOHRTldp8ZYPQMFp0Na5WXKYIdA+nFB/jAD9XLBDHc3dmIS2qS1Hly9hE53l0mIg477CZDUzGReI8N1i4WK/lPYsDiO02QmBYyIk3DttoCjqtLgMMLhTpgx6vgGeKdwQFeRIZ/ft3gQy6a49mHpfjV9LlBtWLf3H5hE/vPAwBCp7aQ9Ztvpf01UWZtlbW74nMp1g1PwUxyM/1Huw6wYNSKbCMCDw0jBJFoTsuDMJsfs4l7y3uJxXl7YKt6uPi69IlgpRuJGK79GbFGWbgSJ/qyW2MPSjOi9VQ9naLV3DNwvUCrtlDnC9gHHuTx9YaO/NEiFJdrJVgdTztCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g5pIoibBoBO1VUNL7l8R/hGAT3rSS6wBVNG02bp6vGU=;
 b=bwodfoCQVySF9XDWMYItwY/nxQXlLny9jBOXZkCFX7CbshvMgZ5WLvRZAwy572zMpUjBAPdLdCPCAUL1CIjpC1KOoPWzNX3+9F6vvkQZCt2IAEFH10YOnJWYqMH4mjrGuuEhh1GuLhp/FZt1qjIc6Nu3WT7JDNvvCo/cCEVCAEkslynGsLgxwZHfO3PaUGNVLN6abMIR6g07LYLIjQy3uOyWmPcwrashIT+zuWUgSx8ILNoSaeGWWYPKYgkadPHPTLfnxb7XLkg92TmvQWK73JHumnt/24E2/D8fSII5SE6DbXc6DZr5fPLpfwEOS1f+BpWHcfmq1ujXQCBGwxeADA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g5pIoibBoBO1VUNL7l8R/hGAT3rSS6wBVNG02bp6vGU=;
 b=LN91naG51wzZT+bDGfYreskQjxA1rjLbkMsthB7URaXdI1GKpPLOnXBIsAZ44cEluKrBv6bxBG2+5EYylLgaD+z+c1assCLza26RnWKfv8406qbWp1LRnCNETyUfTHfO0qPzY6NqC9SrmOlwyPQYge2cs6BMkvz1hFQBkxv+mVY1xiShYJH8J6L/hkQZYow/6hokkeT+3KYrAiEQvtYh3gPSpf+bEBSvFOrewTWqvP1+WfnfD/pwMqBNV6Whopb35cQxSUc1mTec7T20k0I0XlVa9Dhmpe4642nnNYYQlht5cj9eRxQjYdEbd7J1OQCqI7iUIfDkzAYv9Nth/4/SdA==
Received: from AS9PR06CA0175.eurprd06.prod.outlook.com (2603:10a6:20b:45c::25)
 by AM7PR10MB3890.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:14e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Fri, 9 Jan
 2026 10:56:13 +0000
Received: from AMS0EPF0000019E.eurprd05.prod.outlook.com
 (2603:10a6:20b:45c:cafe::e7) by AS9PR06CA0175.outlook.office365.com
 (2603:10a6:20b:45c::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Fri, 9
 Jan 2026 10:56:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF0000019E.mail.protection.outlook.com (10.167.16.250) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 10:56:12 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 9 Jan
 2026 11:57:27 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 11:56:12 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Fri, 9 Jan 2026 11:55:02 +0100
Subject: [PATCH 02/11] dt-bindings: pinctrl: document access-controllers
 property for stm32 HDP
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260109-debug_bus-v1-2-8f2142b5a738@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019E:EE_|AM7PR10MB3890:EE_
X-MS-Office365-Filtering-Correlation-Id: 546699ae-c970-42f7-f82e-08de4f6db459
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Tndob1QrWG5Uc0tYMW5Fc0NEbTJhZ245NkJwZ2NCUC9HcHVwRUpzQUVDWmYv?=
 =?utf-8?B?L0Z1WEI1RnE0OTJ5MitFVFJubVBCOFRHODhSUkI0YmZtaFhOTWgvYklsWW5w?=
 =?utf-8?B?T2VlUGJ2T0MyM3JQOFVGeHdTNTg1YlNvSTdkSElraXVBSVhOU0wzRmI4cFk5?=
 =?utf-8?B?bEp2aUw2UE5BOG5UdU41UlV4d0dvZkxNU1ZtWUtaTVdvRE14ZFVwTS85WlN0?=
 =?utf-8?B?NlNDOU9vUzhzenIySkZCS0tYNnNLbmRPbWg3NHBWMWtuZW9XRTgrNjB5N2lu?=
 =?utf-8?B?WEsvbG94enpOeEkxT0JRUzFlN081MENqRU9SdURvNHVpcTNhSnVSaG1pTnVV?=
 =?utf-8?B?WThWSTBZZ2xTY2xXY0FMdWhHR0dhZ2YxTGQ2emZ0YkRFNE5qUGhtNDA5SEt0?=
 =?utf-8?B?R0JYaWM1Mzg5UzBwUjM5VUFoSzFpeU85cmUxenpQVllMM2JVZC9xc3pIL0hm?=
 =?utf-8?B?OXV6T0pHLzZoV2VTWGE5dFp1cjVXWnloQnh1MUoyM2FNNzE0RGhjakxFbWRp?=
 =?utf-8?B?ZkgwdkgreEFrYWxpckRUVHdhUjJkKzdxazN0Z1B6SVcwVGRoWVJUYjJZQkF0?=
 =?utf-8?B?ZkE0YkJBUk9CR2ozTTd0LzVMMENXdG9TSGpva0JHR2xJUTZxamI2RDVHTnl5?=
 =?utf-8?B?dGhzZUFxc3ozUC9XOWpEd0RYYTNjdkpWUmYwbm9RQno5N1RKYmFrODNuWUZW?=
 =?utf-8?B?WUdsRzFwbEZWOFo5QVl2SFYzMXRGa3g3UUZZWUkvWmxuK3c4anNjN09iM0ZP?=
 =?utf-8?B?bDFMZ2JrR0V6WmVhYmIyaTMzUzlFZUFVU0xnbkozNWExVExjZnU4VDNZVk16?=
 =?utf-8?B?TVd3UWdDOStuVGJaYWRtMy85UFV1Ky9NQ2ZjZHRaWWIydkIwQ1JJS1hUNWcr?=
 =?utf-8?B?UUllUHF0VTdKZ0IzcWVDdGpYY09BRE55SSt0Vm44M05HMlhERi9zRXZraUxr?=
 =?utf-8?B?ZDRtZGFKZ3hDTDdVeGRIRTBRRkptN0VFRzV3ZlMwdzVEZ3dGZTBZdzRBR2tr?=
 =?utf-8?B?bXo4MGY0QWVBZU5WWkZhd1pGajBDUmVORFZWbDlicXVDSWczaSthSjB0UTA5?=
 =?utf-8?B?NjhSMlRMK3NPMDVmWE1PNEgyeDlTNzlDL2JOQk9ZcXYrdjBHS25pMG9pWHpj?=
 =?utf-8?B?WDNheE1Gby90VzcyNm50TTZ0VXp0N2R6ZTk2S1g2ZnhTc3daU05xQ1FCWFVU?=
 =?utf-8?B?bkVPMTREdGI2SEdnMzgxb3NtdmJMdVBzdFBhWmNyakVZNzNNd3ZybkE3d21F?=
 =?utf-8?B?UHJKRGZHalIvcWlyUlVCTG5pY2Z0OU96a2dYVnM4bWl3SVMvRXRFMTlRN3Fl?=
 =?utf-8?B?bTk3NkpVVUxZaWxiM3BaZkxSWGlneEQyQWRUREhHbCtZMDg0QTRjRlNPU0ZR?=
 =?utf-8?B?N2JiV3hvdnJuckNNNDhPVmNZWVBEc1dqcEkrMFpSUXJINStET1poQkVidGRF?=
 =?utf-8?B?N2g0bTluazNpUi9EdHY0bUYzdnplSmVXMXM4YU94d0Z5MEd3bjBDRHVCOWV1?=
 =?utf-8?B?ZHgrNlZmdnlLZzdpM09tMVhpMzA5QmRsaFQ3SGN5SUk1cUQ5dEkxa3BIUkxq?=
 =?utf-8?B?QVd5U1k0cTZSWHFBazFBRmFUNUY3N2tsZzNCamJHMDhPQWRMWHM3NVdwckZV?=
 =?utf-8?B?ZGxRTkVSS2dSQ2RnR0ZHTlp6aXNMTnp3K01kUkVNSjYwZFZFdnVRMVRiZ2VN?=
 =?utf-8?B?US9ROTdVTnhzS2RvYy84YnpRZjQyeHRlZU9PR1F6bWpHTU55K1pwWnNYU3lw?=
 =?utf-8?B?K1ExWWZSRHBBbGtEcm9vMmdnSnBoNkx4T0lyWHFUb0VsUU14WWFhQldxKzRO?=
 =?utf-8?B?NlpCb05sV1VhZytrZVlGbmFCTFNRYVFXVFdTcEs0b2FRQzBZaFRHS2dKcXBP?=
 =?utf-8?B?b0p6VzZhajlxdVc3amVNYUQzSmM0N28vQ2Zrc01vWlQzMkt2emNiRWtkWERF?=
 =?utf-8?B?WlltODluak5SV2dpNTRkZjBGTkpPMk9ROWRsVHJ2QWNlbnZjenN6OFFPVmVk?=
 =?utf-8?B?cUplSWZySXZ6OEUyU0R0REdIVE90Tlc5VHdobHh2aWF5UjRKZ2dOVmh4eHBW?=
 =?utf-8?B?YmRpU2VMY0FiSmVuWXR5a2EvTUhjVlhDQjg0Q3JkM1FUd0toTGg3V24yZzdu?=
 =?utf-8?Q?2Bl5RZnPKsnYty5zSESuxSUdY?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 10:56:12.8157
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 546699ae-c970-42f7-f82e-08de4f6db459
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3890
X-Proofpoint-ORIG-GUID: nmmM0z8Pd8vGlgFwRRgSLPr3ObWrL2km
X-Authority-Analysis: v=2.4 cv=d4f4CBjE c=1 sm=1 tr=0 ts=6960ded1 cx=c_pps
 a=/riwZtEhZw8wleqld+6sWQ==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=LS5lh7VHtsIGWKReRLIA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: nmmM0z8Pd8vGlgFwRRgSLPr3ObWrL2km
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA3OSBTYWx0ZWRfX1ZpsKp5AmCkA
 nhZo/SGougcOO5aWeIE+xAVsJdoubc4+XQT/7yatp7ISYvVaOWEezz+dMu+4EB/6B55oKwktQ6x
 4Xi948y3S+AWPasMv5XOT+tQJliKXGdbb1js6NB4CpydC6LxQ7t2Fpt/IdpJuGysDbD5Kdy3wN9
 YoPe+eXUrAO5CyO0oLNM8bO0MYaHNG5UTDU5kagE2l6z82xztXome9bHtIxF8aVsYeoDLjVInes
 /U3AJga//Y4vAUKEwqE+S3wzO8+T4fepD9KPlPQDM6NcamBE4Poo1Q39ib97Qh13ozN0rAZT0gb
 GBQ9gE6ky6jvzGRHYBuBzNo7UR8IAbQN9hzZsHhRUXcyPZMYXNu4zHRi2mme00RNEOsU2FJACa8
 1CLZVnu9f7y3CnNoOT1KypCbfI+HxFA9RNvV6cgvJ9gpORaKOdB9K0p931ZcCb9kpU+mOcAkile
 RQC4v2bDXOVPYz75K7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090079

HDP being functional depends on the debug configuration on the platform
that can be checked using the access-controllers property, document it.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml
index 845b6b7b7552..75054c1e4044 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml
@@ -27,6 +27,10 @@ properties:
   clocks:
     maxItems: 1
 
+  access-controllers:
+    minItems: 1
+    maxItems: 2
+
 patternProperties:
   "^hdp[0-7]-pins$":
     type: object

-- 
2.43.0


