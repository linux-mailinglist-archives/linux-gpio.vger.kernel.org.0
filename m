Return-Path: <linux-gpio+bounces-30994-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNETNDBQc2ncugAAu9opvQ
	(envelope-from <linux-gpio+bounces-30994-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 11:40:48 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6027469E
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 11:40:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E42CA300EF98
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6058362141;
	Fri, 23 Jan 2026 10:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="kS/fCHJa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63273148A3;
	Fri, 23 Jan 2026 10:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769164844; cv=fail; b=UXtKs06LwsNciOG320WKC9CqeZ0UXam0vKMD1aI9zS5H2c2tDL9EQp2dInfg1LlFx8lBEznwvmoDlqk+B4bFY3GqDsMA056jjbCLUoV7FWYA62TXSZWtZ+cSFFUOWaeJxLQstqDsTzVhP40SG1fwkxRvDiw13jlkITcXZpzAONk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769164844; c=relaxed/simple;
	bh=w7EgRJfg4lt1RM1tfGcvWIk9x8pke4twWeh4gJgnxII=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=PDaSP3On6EhMxKgULCQX2AOMOCm/pCPe675iwXDOOD+X5m00fhJynNkI9ldlQDPT+GXLR049h1FCH4wpVjubVyksJyKrlXX4++6vB4kt5C0cMKCOv18NsrCCjKkMBWPL8j4ex3V/6Q1MrdwHCevI4WwufKr5uBHD5+k2WvG+FVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=kS/fCHJa; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NAK81q2219887;
	Fri, 23 Jan 2026 11:40:24 +0100
Received: from am0pr02cu008.outbound.protection.outlook.com (mail-westeuropeazon11013006.outbound.protection.outlook.com [52.101.72.6])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bunggkjm0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 11:40:24 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=svMGjvASSZIOIzusdUX23aaLxnP9dyA+p2g25cEc+7lsMC7WQEkhGgXDhikuu6fyQtJ/LSB+TJ5Pi+Dc1tak5ANxk3UizeztKsTCnlTCiTHHBYrH+bHtynWg3HROWQKdrPShi2t7VwinV9gguf56vXEadqPvYAJDrak4An7dfcI0YAtL+DCDdn/4FQVFAhNjO37ChFTqIsP1SfAAPOYzcNbzY77bIhdqsQMG0wFfEoDz//WadOcNSUWGrw7l/L4OYjnf5dn2oP8fuTOMJeikPDOEpQgh0Tih2IjEws3plwsUvfeV3apIOvhUPnYuqX/LJ3xdLySwPAUm++faxke7Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=To3isr62dU5IjJV+0pmcYXSbSJZGEcJS0YtVHQJ1phU=;
 b=nZLTpfDDO74463zW6tu05t0N+Mxex4cNaKFMidmAPNF7Z+fR1edBKtCJ6QYQn/UcGBjtDPMCfQ/7g3uqxPmiSeeD/3v5/sczSinSZUMUPtVlcpl9dNLSeysSYWpkqZq7SgKyTuj0r9bHyIBwYJU9olXQhuRId9w5mjZ96Z/sotkFfLjqjHPV6sP4VCmULXPVgHBuWWk4YgltWmGp3MFxG614DdVRrIUjsjvj6c3abQ12WH1gheilc+seNQCxpwOYxmVGzkZe6HrDJpA96exS2oBS8rbv5WezUKff2/wP9gyCZqEJmfXnyuwmbeQmarCi8/TsegYHch1nRhVIZ+06tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=To3isr62dU5IjJV+0pmcYXSbSJZGEcJS0YtVHQJ1phU=;
 b=kS/fCHJaoj0VVVXA+30NCVXxWgHjKbZaF3YuSTQuv0lq2qS8VhASgQhoUdtqmdikXt1MR0bfZdKu6QhJODlwnfhlrG6flqG5/7yjo0GgBotw+PAvr2xI+94VsSCcw8fnAOU8jZ4gnRzMMBhfHXd20MWuZJFZ/RnRspQ5Fja/WyhCDRWw7ZUM31fbvGeEaiYZfcuB1HA0Yh9ot8cM38llcfrbkHQL0bZgo1dDlnTSTwMZ1aDnkefaw9ZH5wvS/HZJ+KgXmg0IFUYUAUfjqlCsP2PSJRl++l5AorgzYelXGOW6kWuhHUOSYeAEO+laTXFeOz662NB3AojXBGiUBN4NRg==
Received: from DU7P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::17)
 by AS1PR10MB5263.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4a3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 10:40:18 +0000
Received: from DB1PEPF000509FF.eurprd03.prod.outlook.com
 (2603:10a6:10:54e:cafe::8c) by DU7P191CA0013.outlook.office365.com
 (2603:10a6:10:54e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 10:40:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509FF.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 10:40:18 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:41:38 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:40:17 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Fri, 23 Jan 2026 11:39:00 +0100
Subject: [PATCH v5 03/12] dt-bindings: bus: document the stm32 debug bus
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260123-debug_bus-v5-3-90b670844241@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FF:EE_|AS1PR10MB5263:EE_
X-MS-Office365-Filtering-Correlation-Id: 424766f4-b7cb-4a4e-f600-08de5a6bcd45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OEZ1Q3hmLzBoc1JrMUVpRk9IOURzRFE1aHpZZmdyNXVqK0lyUUV6aHpYUmVE?=
 =?utf-8?B?djdSOG1CTUxtWHNicDA5ZGJpQ3ZPaXVUbGNYNDNka2kxWWhqanVOUTlqenhE?=
 =?utf-8?B?SithMEY1aFpScDVTODY2V0ZqYmprMHByVlV2b1JsRmUxWWwvTlk0UkhXLzdh?=
 =?utf-8?B?M2xIS1Nkc2Fza01nTk8yNXdEQ2d0VFZaa0V1RnBuK2wrUkpOR0NvL1Mrb3Nq?=
 =?utf-8?B?K0dZaEhCbDNFZGlvRDc5RDZJN2RLYStPOXAwblRaVFF1a1l5dGhaSDcvTGdW?=
 =?utf-8?B?NGZMU1lDN21IN1I0bUExejB2N0trbTJVQ2JtVTExTkNqdE1xdU45MElaR0xP?=
 =?utf-8?B?SWpqQllJcEMwK1RHaWM3Znp3UGoxam5iZzI3Rit0UjhUNHhFdHE0TmcxK2Rr?=
 =?utf-8?B?MUNhdmplWnVjTlFjMDJCV214U0NPV2pnQ3NHamhmTC9ZVGtSZ09Rd2tMblBO?=
 =?utf-8?B?SDFFbWxrdXVCYjF2L0FtNXlFeS9BbWdMQXN1Q1dacTQyUG1ITWdwYVZhZVZx?=
 =?utf-8?B?akVRNk80ZmxWSHE0MGtVTW16UmVZNjRTdXFqMEllajNXcHZQL2ZmK0NHMFo5?=
 =?utf-8?B?YSt2MFJUTjVGL1ZPQ0NmSDJkSUR6UHFBdzVCS2lWaER1TUF4dGdUQkF0aGVu?=
 =?utf-8?B?TUpsYjFHT3RpaWs4Y2pHSWlOSUhhdzVzZFJ5VTlOcFozMHpGbHFWNFhBN1R2?=
 =?utf-8?B?QkdPZGRZQVF0dy9LSWJpZkkvREtLVFFLY084UGRTRElGa1RsUDdOQUUwcVhP?=
 =?utf-8?B?UzdWdDNHVkVXZlp5YkpoTFlOTUdaZ1JBeXBqeVNmOEYrZWh5UEtuZy9yL0hs?=
 =?utf-8?B?ZjJDdm5SQnRYRkRxWEgvcG9WNm5rWnZ1anVSditqYlU0UkpTRm4wVGhJdkow?=
 =?utf-8?B?NnZhQUJqRzhJc3JFWGYzY01QNCtNa3ptZVRPa0dxZW1oWkg5V1o2bnlGckVl?=
 =?utf-8?B?ZkhFWmlrM3U3bTBTbEpaeE8rTjZuQS9uWncxRUJVdklJVU5DdVRCSC9ZRmVF?=
 =?utf-8?B?Mk51eGNvOUU5S0lmZDBNd0VvbjJ4cERDVzc4cWFIU01HSlFsMGRCMjFKL05k?=
 =?utf-8?B?L1VzemJaZTM1RXZxQXFWc1RoWVlXSlpBSEFUa2lWbFRqcUNEUjJPRG14Sllp?=
 =?utf-8?B?bEtFUlJubWdCKy9yZHlsQm5wSEc4WEg2cWg5Z1AzT0pQamVGOXJBSXdBQm1v?=
 =?utf-8?B?dldHTWpmZFFLckNhcGNyV1NUZWtyVmdUcFNQZ0FsZVNIWCs0Z1gwTzZ6Y3M3?=
 =?utf-8?B?bUdOWkwwVzZyVm9OVGZTbkJva2RYTDhBZk9zL3hyK0tQajErTkFLZ2pNK01q?=
 =?utf-8?B?akllc1RMN05RN1BuT3lMdFpUdjhYMFBpT3ZNaWZmSUxVd1ZvbFBmOGIzUWhE?=
 =?utf-8?B?WEQ3TDFZMzhsN2pHb2dCNm5yTnh5TXlIc0xHT1RTSHdoTFdlSTlZdGRjRVZT?=
 =?utf-8?B?aGszQm04S3VsVTByNlBlNGdBNmR5YzE3VGNBVEU3RWM4ZE5SUEgxR2hUSDk3?=
 =?utf-8?B?SURCY0sySHROaW55N3RybnZPZ3VMc0g0NURzdXhaUFpNWmRmSVU1TzRRRHNL?=
 =?utf-8?B?ZFhBM2cwSytjTCtoY1JNNnhHZ1VFNWZQekNHZDQyT1dGSTZ2bEp4ZWtUZWRp?=
 =?utf-8?B?YmRoYlluNExZT2k3bUhLc1J3dTVaMnNNaFR2YVBqNnhqT2c2U1RmMFhUNzR2?=
 =?utf-8?B?d25Pck40d3FCZFZOYkNwUjEwSk84enpUR2g4dWNWQkJLZlpIK01YNHJranlW?=
 =?utf-8?B?RUZPcmFlb2V4SGp0MGEvbmxBaGcrN3NPYVJsS0tZRVBFNVgrdU1PU1dvLzBQ?=
 =?utf-8?B?eGY1R0lJTkFtOGdOWDV2L1MydGJBZkJHbUVrWDM1cXhqaE9CaTNmVnEzSUVM?=
 =?utf-8?B?Y3VPTUlLUVMrT3hoVkNZZFhkbHh3Z00yTEdZZXhwMEI4MG5FWmV0ZENYWm5K?=
 =?utf-8?B?d1N2M0dWdFlYTmlTZis3VUhhc1l2bWlnL29pWlVicDE1WmFlci9QTkN1NGZ6?=
 =?utf-8?B?L3F1TkVoWTJ1TFdNeDJWNm9pTTBCVHpVNGdiekpPMU51ckY0OG5rbDlCeTRl?=
 =?utf-8?B?MUZ3dTVnc2RINlpEeXNVNzdOQzBwTGRJcThQbWxDck52RC9ua3FZbU5ZUVBx?=
 =?utf-8?B?cnV2N2tsWS93ajdmNHdwVitiRmR1QWV6aXpIOWY5Y1ZTMG1QZkFXMjA1MSs1?=
 =?utf-8?Q?uDXHa8axHEjfYPOYmYOVYwfH9C95Jvj1srWuYCzn6miq?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024)(13003099007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 10:40:18.4050
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 424766f4-b7cb-4a4e-f600-08de5a6bcd45
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5263
X-Authority-Analysis: v=2.4 cv=VdD6/Vp9 c=1 sm=1 tr=0 ts=69735018 cx=c_pps
 a=q0G+tp7u1Bk0++rDIKb9hg==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=8b9GpE9nAAAA:8
 a=nQXd0E9VhXsRxXXh0-wA:9 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: YDSPjT7mG2R6XZBTnvPQAuYGrRjgWdHL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA4NSBTYWx0ZWRfX0vrVE8ogHSSl
 rBPXnb7gBqsmR6qyGaaHEkcI8KuQsCh2/S4vNHOLkVC0dBgo7bgeFZ5bKGgimumMgw3lnS3ZJbM
 1LWJc1KHXnfJ93OGlwKFqCE22ig4wnw1tdPIlIgQ3rk89cot3KBmFavNNKoTdL5ebiqDnUlmB0A
 P35S5HuSdw8MhKH4q5gFSWGhu9pr+tSQ3owMVH9JCD5rRaQV7Mj5aCdWVAqF599GuWZyH3YmShD
 QaEicmEcmvA8rO3ZgS5ehnIXBYrdR+1CjMFzjmkKQ42b6dhiqOQLuo7U7c7jHs4PPG/A7V+93JA
 JGPQGmGgnKf+B+HQL71r+Pog6CUfJhOmPViIJsWBag4x786RWkiKnV4fRdbSqzFjH0qljbDNL9A
 dGr7R9BV2WiKm3y5fOgYEr3ciuW87vNCY+KEWIJGwVr9rsa28/0yU75DaM2NSIFbWWOJxauN5cm
 IXIIUWJuJ+ecsDCy2Ew==
X-Proofpoint-GUID: YDSPjT7mG2R6XZBTnvPQAuYGrRjgWdHL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30994-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,foss.st.com:mid,foss.st.com:dkim,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,2.252.41.0:email,2.252.95.176:email];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7B6027469E
X-Rspamd-Action: no action

Document the stm32 debug bus. The debug bus is responsible for
checking the debug sub-system accessibility before probing any related
drivers.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 .../bindings/bus/st,stm32mp131-dbg-bus.yaml        | 76 ++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
new file mode 100644
index 000000000000..6c74433efbe3
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/st,stm32mp131-dbg-bus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STM32 Coresight bus
+
+maintainers:
+  - Gatien Chevallier <gatien.chevallier@foss.st.com>
+
+description:
+  The STM32 debug bus is in charge of checking the debug configuration
+  of the platform before probing the peripheral drivers that rely on the debug
+  domain.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - st,stm32mp131-dbg-bus
+          - st,stm32mp151-dbg-bus
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges:
+    minItems: 1
+    maxItems: 2
+
+  "#access-controller-cells":
+    const: 1
+    description:
+      Contains the debug profile necessary to access the peripheral.
+
+patternProperties:
+  "@[0-9a-f]+$":
+    description: Debug related peripherals
+    type: object
+
+    additionalProperties: true
+
+    required:
+      - access-controllers
+
+required:
+  - "#access-controller-cells"
+  - "#address-cells"
+  - "#size-cells"
+  - compatible
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+
+    dbg_bus: bus@50080000 {
+      compatible = "st,stm32mp131-dbg-bus";
+      #address-cells = <1>;
+      #size-cells = <1>;
+      #access-controller-cells = <1>;
+      ranges = <0x50080000 0x50080000 0x3f80000>;
+
+      cti@50094000 {
+        compatible = "arm,coresight-cti", "arm,primecell";
+        reg = <0x50094000 0x1000>;
+        clocks = <&rcc CK_DBG>;
+        clock-names = "apb_pclk";
+        access-controllers = <&dbg_bus 0>;
+      };
+    };

-- 
2.43.0


