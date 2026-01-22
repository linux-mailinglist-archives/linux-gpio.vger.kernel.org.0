Return-Path: <linux-gpio+bounces-30932-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIcVExNTcmnpfAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30932-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 17:40:51 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AE96A25A
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 17:40:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 28D4E301B633
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD7403F6A90;
	Thu, 22 Jan 2026 16:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="ji3bNfOb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE043F6FE9;
	Thu, 22 Jan 2026 16:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769098852; cv=fail; b=mU2P3arB878TrNmTjNUPXeHLed863z/vDrGWN55He1h+2Cf7dgKgAF4AWoI0nuv+xeK7t8NKuNUbUMz88/lV2ogtBEYVrhdmI0rwTvqtD9+eZI7xCUkUwnYgpxhMVsgux7KiQruj0rzJwX8HdubIDRAlynodUCKKg+vlc8+L938=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769098852; c=relaxed/simple;
	bh=UlLrXNSH8ZJadOFSyb2YztK1HJH8sf/AyIw4YGQ5y+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=OGRYO7eIMjvX2xg2L91/mBZe+dhWM0U5Eav2K7X+4e9PLVvml8xd+aiHLa/SeaJmADFJ7U+M1LC12bcD+vlfpM3CBxDvlQjYyXi4XWAP8zzybZD7WVOviaEsrRDeubOgNv2SMd6LliZoWVQYMlLS8WHEvcSCRNUXQ02VpRTTSRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=ji3bNfOb; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MGCMT03959006;
	Thu, 22 Jan 2026 17:20:25 +0100
Received: from am0pr02cu008.outbound.protection.outlook.com (mail-westeuropeazon11013011.outbound.protection.outlook.com [52.101.72.11])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4btkkxyxm1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 17:20:25 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C565yVegQ2YUew9zjJDebJk1bH98zSym76nCky2g/9oKEYLrtFeU0RrtCNpiltmy9f+yE5JKaGHZ8EQwHLk19t5B7Fk8WCmVMgB2dhYzW8JHzDnk70eMMnqdxS4ASWhDrzb6JQ8SQ1bIDLg/rcfz5ZbYDzYxsNEXyrM1Hjqutz3W5orzaaxXbm86eZOw4gtduIEpA2HMNK9HV48gP8bNWuoEdNyfIc6Z1Z3jCGT8KOMl70UfdwaTZOjiFgXo1pny1E4kObXaYP6EmTdojBWu0B7wzaBJnRn41VmEYWqpZWl8Izw6F/a9DPYDHVQompu+i73eEvSVYnXUyv5lxnyerQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+qQruqp/r8Hzekq2l/RZFNMp6cVsCEBVM5HG63tx6Y=;
 b=ITtJd6sZ6v/aM4/tanfz9n5M3W493h9tilgTstsrstD8E4o3KyihtX1wkYumuko53JXER8GpI0SuNHnDUzLW8LSLyn/rNvIDhX32kGLKO1OMsTHt8+wrZlW4XtNPX17IlsYAc0FbDfSd/LL75bD9rLhdDRgx3N1yibgP3WJwiZ6cSLtV4PZPcV1O/nj3IAXo0QkeZFkw85POnAm8RfXfl26Xa/ktTL60+so0kOBcj2bYA1IJW2umk87u0IUjuJQfMgpgKvT9CNmnMaDJxFkIaS2COS2EKgkZ8hfrWlF4DWSEXh3kmSBk133aK6yLfBPxxgrM9/8FWwh++vqCLC3l4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+qQruqp/r8Hzekq2l/RZFNMp6cVsCEBVM5HG63tx6Y=;
 b=ji3bNfOb1Ftb1SZGdamw7ye0j/cy/5Q4d0Jt0A3TunUYa0egnmxmwZSddUeMAP/rh6gsce9CiMBJf288xrCOe/IeQsysw3t+sq2IrrFYYH9J1ALKWWnMLVKTo6NIy8dTaIGNndXIwOV760YZjMlVD2byFnQmhAk96H+MoFqoNgsu7fsW7fDLwGdT0GrGfvB5KUIWWrY9a2e7+tqeoUe3FXoXB2TTcKVfTAXRk06jTTYkVdmA55SfPnGKoMpswA/D9ILaE0eWfTkkRCE2Y67YQxjtBFYoHrcpdldTt9Ea980ZTAqCfuThFHtVnRgeYynL9f9qDlny06JFmJnWbBoMLA==
Received: from DUZP191CA0020.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::7) by
 DB8PR10MB3308.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:113::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.9; Thu, 22 Jan 2026 16:20:21 +0000
Received: from DU6PEPF00009527.eurprd02.prod.outlook.com
 (2603:10a6:10:4f9:cafe::9d) by DUZP191CA0020.outlook.office365.com
 (2603:10a6:10:4f9::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Thu,
 22 Jan 2026 16:20:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF00009527.mail.protection.outlook.com (10.167.8.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 16:20:21 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 22 Jan
 2026 17:21:51 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 22 Jan
 2026 17:20:20 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 22 Jan 2026 17:19:18 +0100
Subject: [PATCH v4 05/12] bus: stm32_firewall: add
 stm32_firewall_get_grant_all_access() API
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260122-debug_bus-v4-5-28f0f2a25f2c@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF00009527:EE_|DB8PR10MB3308:EE_
X-MS-Office365-Filtering-Correlation-Id: f5a41695-4f69-4622-2bc0-08de59d22407
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|7416014|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RE05VEw2RXhzS2dVL0NOc1o5UGhWYXpiZGdUY3lxRitJMmxjV0V6eTdJQlpH?=
 =?utf-8?B?ZUZoOCt2U3dpVi9RZ0dCd1BDRWczbjFHMDdtQmZFNFNSMVZiSTJCdHRTVmdq?=
 =?utf-8?B?WWRLVGhSSmhQL0lLejNJYjFPM055RUpXWDQ2OVBnUWViSjg1VDlXbW1qYTVB?=
 =?utf-8?B?YkhvYVlwdUJWMUNiMkthRlZPUjNhUHVEZ2VIZnBrNUd3cWI2S2gzYTNLbFVp?=
 =?utf-8?B?aVNIR0tYbFhyNTlYVy9WdnRsNzVRazdaMEFKeDJKS2ZhVnNxYkpiZ3hua1lh?=
 =?utf-8?B?WS9ZdEhEODcyWlA1QVhmVkU4MUsyU3l3Q1U3aER5U3BHMDB2MXNxTkhTRkZx?=
 =?utf-8?B?dEVuZkY3TGI0c0wvcEd3K1BPOHRyN05jWmlWditPR2FVYW50QW1HTFdqVzVp?=
 =?utf-8?B?SjhENjlxOG8veG1oZ0pQeWVVUkhDanYzWUJVRmo0Qm5FUDhVQndneHlQZmlK?=
 =?utf-8?B?WDBkMnRRUGFVVStjVTdjRUVEOVFIeGxSUlpFMHE3Qy9hYkFLWENML2R5U2lh?=
 =?utf-8?B?elBLWFlKVXRtYnhjNzFmVFhzZThjcUF4eVo2YnhraVJxam1ZZXNEM1ZCWjBJ?=
 =?utf-8?B?UGtLbkErUVErQjRXd3YvZEZTbzczWUJuRklhdkIvcER5bmY0c1dlM2NLNEFT?=
 =?utf-8?B?SldUZFFoSUZsdHh5ZmZpZ3pLd2lyWS9JdlFqRncyWnZlUk5PMWFwemdKTnVX?=
 =?utf-8?B?L2g4QTN0VzkwaHVOMHVVT21Ea0Y2OTlxY3E0T045V0lHOG12RmZSSFpNZm8x?=
 =?utf-8?B?d1d5a1crRlZFaS94UXk3YnFFMmZQZm9qUUwxK25HUjkrbThtcDhqUURSL3NR?=
 =?utf-8?B?Y005d2ZZV3J3WW9JZHNJdG1Jdlduc2gyUVk4WUNWdXAvbzZzMHpBcnU1RUxF?=
 =?utf-8?B?K2x3bmcrb3hOM2gxZEdKZWlxU1VTVU9HeERBc0IzUFJINmJ3RjFnYnVFOUZy?=
 =?utf-8?B?T044S2Izdmw4UnFRcGRkSFlJUnZqUkxBSzhUekk5b2hnNHZxNXNxQTh0SkQr?=
 =?utf-8?B?YldSWWg3NHF5Z1JDWFNaQWVXT2ltOGVvZllweU81Uk9YUHJGN3NUVGsrWit1?=
 =?utf-8?B?dGRxV3hEaWtSYWsyYjhxNWlST2tOVHYramZmWjAxK1c2dEZlbERiSjNUNjli?=
 =?utf-8?B?UURiWk9vS1N0MDdpWHNtQzFYRk9qdDlTZDRnTlR0MERkYlgyNlJSODFLekgz?=
 =?utf-8?B?d2FydnU4QW1qRzdHYzN5VmpoNFZGdFdrWVA5WWl0U2R5RFJGQ3poZXpORU5u?=
 =?utf-8?B?V1FVT2t3RlF0d2JyQ0t0Kzk5cGZBdU1wekpuRzYxVWhlazBSYUE2eDRlK1B3?=
 =?utf-8?B?RkU1ZEM3cmdvTEliSldOZ1FiOHRQNnlibVp3QldlY3VQU29VU3J5dDU1SnJ5?=
 =?utf-8?B?Zk9vVTFHY3VPTkN0M3JFVFdCbmVjV1NocWZxSWxtYitEcXZrVmhlWGFXRFIy?=
 =?utf-8?B?QS9qS0pnUFpkWFgvREM2dTNGOHZTTHRZTUV2OFZvYzBDY1o4N1NkMXhKOTN6?=
 =?utf-8?B?TnNKSVFwL2pGNzNXSkdreUh2QzRtMnY1VlRUS0xZelJuMjdxRVZqTm9ZV05j?=
 =?utf-8?B?YWdRMDRlZWQ5TFJzYUhZOC9HM1BTTTVEODZTQk03bFlndXFzenFkN3dEZ0Vm?=
 =?utf-8?B?dXUzVjNMTmJxbTY2ZG44WGEzQkp1aXUzNHFDdW40d1VNaFlXdE1oeDh3dHVK?=
 =?utf-8?B?a1RBQWthWXBNWDJxTXNHRGpydXhWRTJFSTRmcFQ2V1I1QXRwZmYwQ0VRcE9u?=
 =?utf-8?B?MkV5WHExSmErWEMxK2pJYUVHSnY4S25OTkJZYTRva1UxMEd5TDF3M0lIV1Rn?=
 =?utf-8?B?RTBDMlVKTUQwUmZObXBRM3dNdTFxbWVkQzVHYjZsVGY3UkYvMHdUbkw0VVdO?=
 =?utf-8?B?ektCdTdSc2ozU1VRajRVT2xqRmVRT0ROU3RLNFFjeWFwMDVCdGxWWlZ3Mmps?=
 =?utf-8?B?aHRiUDc5KzFDWTlRdDJmSWUzMXZlKy9XZmgzeGRMQm0rWG5KTm1SVitsM0JD?=
 =?utf-8?B?SVhtWXZNa0QrMkFQTmd0aDY5U0JLcVUvNkRIQ2kzQi9RQU9pM2kyeWhqVkd5?=
 =?utf-8?B?SzVmTFdCYml3eVRpdnF3Z1dCZDUyVU9USkpUR2xNdVRnWUkwSnpSVmVkM0tu?=
 =?utf-8?B?SHQyR1hSV1FiVkRoZWFFUmdzVElOR1lZcW5XeU5yRCsrVzMvRFlHMEo1Y2ti?=
 =?utf-8?B?cE9JVjBzaEp3cVNhd21QOXZKVE5rY2kxYVNGRU55ajU5OFF5L3lDMGg4enJm?=
 =?utf-8?Q?Kyd4uZXEVo7ItJwlajZ/0/eRWnWBCtsm/5k3nXtlT0=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(7416014)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 16:20:21.4521
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5a41695-4f69-4622-2bc0-08de59d22407
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009527.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3308
X-Proofpoint-GUID: XKPQQcHdP4Xgqj1-vEDeNz1_vWc4i92T
X-Proofpoint-ORIG-GUID: XKPQQcHdP4Xgqj1-vEDeNz1_vWc4i92T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDEyNSBTYWx0ZWRfX0VEaz8hbCy2q
 4nLBObEjDOB8UTAvMaevsPcEL6GRd9eLr9BBuAZ0h42PspWphRX+9fxdSi9DKvkQaIyznDKztlz
 pBURPfA/zzBRlZAyWLxSUSPcOEhzXtTN2g/CCHC9d1ympzhEq/4XMkJowRIiHXLShjHQlgqLGgL
 DCzyNZJ14fs7od/nL+IZyJvJVQWGXIDNZypqE1ncoshXuwjsP8kjJZTB2LLN2pwX9ox89iO5lB4
 OUdUzozKps/cqj4bcTnp2pL5GRjNm2P2BSTDE53YBuTJB3J+UkNEDqP5whex/6w+hd3H2hqYcEN
 fla8yfI62s0oXethQwnblik9WwdtOJo0PMgab4Zbnr4ZNpvsvqXb8apeox0w+ZuJPFSmjBIq10I
 mVVxSjU3uX2CM9AQC8lnR81gaKFUo3aoqU2Iu96mett4Xzrey0nrhrBh3mBl/VUsq0HQwmggS6p
 MYLpIKKkQpyO80mZWEA==
X-Authority-Analysis: v=2.4 cv=F/Rat6hN c=1 sm=1 tr=0 ts=69724e49 cx=c_pps
 a=B+Oj3kq+jkWct0hkuf2T8A==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=7cbN4eHG_OvaAO0uNUwA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 priorityscore=1501
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
	TAGGED_FROM(0.00)[bounces-30932-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: E3AE96A25A
X-Rspamd-Action: no action

Add the stm32_firewall_get_grant_all_access() API to be able to fetch
all firewall references in an access-controllers property and try to grant
access to all of them.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 drivers/bus/stm32_firewall.c              | 42 +++++++++++++++++++++++++++++++
 include/linux/bus/stm32_firewall_device.h | 26 +++++++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
index 2717754d811d..c9e6299197c3 100644
--- a/drivers/bus/stm32_firewall.c
+++ b/drivers/bus/stm32_firewall.c
@@ -185,6 +185,48 @@ void stm32_firewall_release_access_by_id(struct stm32_firewall *firewall, u32 su
 }
 EXPORT_SYMBOL_GPL(stm32_firewall_release_access_by_id);
 
+int stm32_firewall_get_grant_all_access(struct device *dev, struct stm32_firewall **firewall,
+					int *nb_firewall)
+{
+	struct stm32_firewall *loc_firewall;
+	int err;
+	int i;
+
+	*nb_firewall = of_count_phandle_with_args(dev->of_node, "access-controllers",
+						  "#access-controller-cells");
+	if (*nb_firewall < 0)
+		return *nb_firewall;
+
+	if (!*nb_firewall) {
+		*firewall = NULL;
+		return 0;
+	}
+
+	loc_firewall = devm_kcalloc(dev, *nb_firewall, sizeof(*loc_firewall), GFP_KERNEL);
+	if (!loc_firewall)
+		return -ENOMEM;
+
+	/* Get stm32 firewall information */
+	err = stm32_firewall_get_firewall(dev->of_node, loc_firewall, *nb_firewall);
+	if (err)
+		return err;
+
+	for (i = 0; i < *nb_firewall; i++) {
+		err = stm32_firewall_grant_access(&loc_firewall[i]);
+		if (err) {
+			while (i--)
+				stm32_firewall_release_access(&loc_firewall[i]);
+
+			return err;
+		}
+	}
+
+	*firewall = loc_firewall;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(stm32_firewall_get_grant_all_access);
+
 /* Firewall controller API */
 
 int stm32_firewall_controller_register(struct stm32_firewall_controller *firewall_controller)
diff --git a/include/linux/bus/stm32_firewall_device.h b/include/linux/bus/stm32_firewall_device.h
index eaa7a3f54450..6c878f3ca86f 100644
--- a/include/linux/bus/stm32_firewall_device.h
+++ b/include/linux/bus/stm32_firewall_device.h
@@ -112,6 +112,25 @@ int stm32_firewall_grant_access_by_id(struct stm32_firewall *firewall, u32 subsy
  */
 void stm32_firewall_release_access_by_id(struct stm32_firewall *firewall, u32 subsystem_id);
 
+/**
+ * stm32_firewall_get_grant_all_access - Allocate and get all the firewall(s) associated to given
+ *					 device. Then, try to grant access rights for each element.
+ *					 This function is basically a helper function that wraps
+ *					 both stm32_firewall_get_firewall() and
+ *					 stm32_firewall_grant_access() on all firewall references of
+ *					 a device along with the allocation of the array.
+ *					 Realease access using stm32_firewall_release_access* APIs
+ *					 when done.
+ *
+ * @dev:			Device performing the checks
+ * @firewall:			Pointer to the array of firewall references to be allocated
+ * @nb_firewall:		Number of allocated elements in @firewall
+ *
+ * Returns 0 on success, or appropriate errno code if error occurred.
+ */
+int stm32_firewall_get_grant_all_access(struct device *dev, struct stm32_firewall **firewall,
+					int *nb_firewall);
+
 #else /* CONFIG_STM32_FIREWALL */
 
 static inline int stm32_firewall_get_firewall(struct device_node *np,
@@ -141,5 +160,12 @@ static inline void stm32_firewall_release_access_by_id(struct stm32_firewall *fi
 {
 }
 
+static inline int stm32_firewall_get_grant_all_access(struct device *dev,
+						      struct stm32_firewall **firewall,
+						      int *nb_firewall)
+{
+	return -ENODEV;
+}
+
 #endif /* CONFIG_STM32_FIREWALL */
 #endif /* STM32_FIREWALL_DEVICE_H */

-- 
2.43.0


