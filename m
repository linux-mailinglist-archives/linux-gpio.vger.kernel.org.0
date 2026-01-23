Return-Path: <linux-gpio+bounces-31006-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNzQEzhRc2kDuwAAu9opvQ
	(envelope-from <linux-gpio+bounces-31006-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 11:45:12 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DFD74847
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 11:45:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8DB083019334
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF09E37755A;
	Fri, 23 Jan 2026 10:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="m8NwfmBT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377C437472D;
	Fri, 23 Jan 2026 10:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769164979; cv=fail; b=TGoy4GvTfSGjUL4+WcCaQLepem5Mgrpmhh+jHJXP0HvGHITArf/MBfdOfSCOiTiEpFFUC0FLo4olfiBuwY2la3v5qDQ8kZZge+NR5KOmssy6wqcoYxOtcuoFcMGL1+jxpbZOMR6sJkko3DYcGZrQxroHMCM9Az+1jY8jRhrFYEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769164979; c=relaxed/simple;
	bh=ewEZODz90npyyYRi379HUBKf6SIxjR5Q5hb4xCINgd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=GRY0rJ7DwRk9WZ2+VWrKJiUD2GmD3/J4thsXrNqqD6AvFRnKEt+dqqp6eeAiZMPd9/b2fFlWkgNdX4lAXTFoWYQWrYhNFbuWYuYXrYuD+kE+lnV99Wn71B3aBezKZhGvGVZF00PivNCbS40NyN2MZjkRaUHKnGOSxDVUwOeeY2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=m8NwfmBT; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NAY4In2702085;
	Fri, 23 Jan 2026 11:41:47 +0100
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazon11012050.outbound.protection.outlook.com [52.101.66.50])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bv3yp10sm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 11:41:47 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w5Ky6DuTWEoV5aOZLh9nqJ+pOuMOeQV7Q/+6Q0bfHd8tMKlfJkZAeMw4rKPPeyX9+qYCLrpgiZXihIcMqwjBNvzCGuJr7B+cGNtiEAzIdLIhiZxT69PKFtjAxneeaPNEAwSkOCnhWMm3Z+2yoS7LY2WPNxWa1Jcbl7USkB9RO6ZP2h8q/4lykXtR7eM5K8UVgYVj5ai7IPCUYD800XIE+ApW0SLm2JucwyWINw5sr02GeNHFW5snMV8al2cur6ozCou/pTY2DWnE6bs6th7GBk95PaRltV4YV2IL9/aJUHzDnUjr/3jZH4P9Pfd3QncPAmEzR+baYlXvuyzAu3ICiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5er+eTox9cwQuYhpYmpkyJ+YK4aQrQb1NoDbSG6A+9U=;
 b=DiO/xLydXIWNKzGSnBrZlQoQwpfjEbBTA5mQGQUFu3TKj8zYfpQ3m+iFOHxIZ//S/T9LNc8DFg3ivmFen/o6R/X5oCantoouJT6xxhluIBdugVatBCEcveKsBMHlZGJ+1tudamCzuCew4pwgOmSvOeFRxSPZXFQngf/X2lJPWq164OhNrQxv74N9ibsBHiYd8GpB/5ufIkD2Fbyz6z2L9+yot5KeYXCSrZnngdZZV8oFJFbvsJbDoXP0pxR1+/IC5UzasUpQl9TjzBCU0huLyIlyDZkwSEnes8LCf+oNc2mXL6YwhXdRDx1YEzqtTtFWTM1fjyfXQNf3IRQs1n0/8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5er+eTox9cwQuYhpYmpkyJ+YK4aQrQb1NoDbSG6A+9U=;
 b=m8NwfmBTTKMo58MAhZ2yzjE4zVqmfduwhOaDPqnpPUDvu7WEk6cE+nOBEaSkuvqUXf1/FhH3ZDDBhDkWIubQ6v7rdcquz2kuYZZnZy3ybzFfBLb0+EX3AJipQD17CLnWGcoLqW1KGdg4ZrfNyuj38pdgoLkNs7PiQjU0prCkppZgc7dxQRbczil3r6S6NTqJ0czH+Z7vIj0wjnptgfU/quK1YhMZDuXTOSplyuvI0mqBNaFeto5/e5/9UPNRm1SlRrqdZOdNghhaUgxumR1Mk7fJLdLa10f+TUHozVFjL02gENG3hdfb8ZqnMNfMLAJXJYmyUcosG9fLvNjSdj6eTQ==
Received: from DUZP191CA0028.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::24)
 by PAWPR10MB8257.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:386::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 10:41:44 +0000
Received: from DB1PEPF000509FC.eurprd03.prod.outlook.com
 (2603:10a6:10:4f8:cafe::4b) by DUZP191CA0028.outlook.office365.com
 (2603:10a6:10:4f8::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.12 via Frontend Transport; Fri,
 23 Jan 2026 10:41:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509FC.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 10:41:44 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:43:04 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:41:43 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Fri, 23 Jan 2026 11:39:08 +0100
Subject: [PATCH v5 11/12] arm: dts: stm32: enable CoreSight on the
 stm32mp135f-dk board
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260123-debug_bus-v5-11-90b670844241@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FC:EE_|PAWPR10MB8257:EE_
X-MS-Office365-Filtering-Correlation-Id: e6471d01-ce42-4e67-789a-08de5a6c0088
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S0UwUnVtR1ZmbUcrMzFDK0FjWVBENVBaZG9KQkpkK0I5bzUwc3hiODArcTFV?=
 =?utf-8?B?N3Q3SmpTR09GejBRNUNCRnVyTGNmMVhYc2dLSGJhSmo4RHZmK29vN0tNajZv?=
 =?utf-8?B?bERmVEVSemtrOVQyRG1QcXYwN09uQ1NOUW9DemNIZmNSeDc5RDhzU0dCUUN2?=
 =?utf-8?B?OTczSDNrdGRpb3lxUmdMMVF0eGV4M2d0M29pREl3aTRZNEExSUJ4Mmxta0pV?=
 =?utf-8?B?ajZTM1EwUHByVStYSWpMTytWS2tIaHlPZ0Y4VlpFaWJYK29hSGFVL0RuQmZj?=
 =?utf-8?B?MTI3ck1yc1NrTVkwbG05aWYvWUEzMHZjSWFybzVLK1h4bFFpTUMvOVdVakZY?=
 =?utf-8?B?SmxudXRqM0N4RFpkTG5HajBTbnJWWFY1SmNqNlM4OFdLek5NNUNVN0xuRnFD?=
 =?utf-8?B?U0tnUE1VRVFNc3J0VjRaUmJ6MVRTMGRQdURRcCt3UHM3LzNxaWN2WlVSSXMz?=
 =?utf-8?B?aDR4MytrYlVDZHF1WkxkU1pwNEFHdW5QS3ltSHB2MlQ1VmpHdFJXM09LV1g3?=
 =?utf-8?B?MnNhOXB4T0tSdFF5NjY0ZFloUUcwSDBPMS9LNlZ0NFk5VE5nRlpzY0d1ZHd3?=
 =?utf-8?B?QXNWeFFmQXRYeGlmY2pYbzdxdUtmKzFLdGlNaGpTbW5naERLZjl5L0phR1RX?=
 =?utf-8?B?UWppTjdaM0JHMlc3U2V6RjE4eFZBS0d1eStkUGkyWlBxK1owREdYR1hYNEQx?=
 =?utf-8?B?WVNpeEtQYk85YzZFR29ZVVJiS1dUZk0wRnpTeGxlWks0bzVEdzFocFh1WTFl?=
 =?utf-8?B?ZkNDQ1F2VTBXaWJFVHlBOXlENlFTUWUzM2JKSTA1ekUrZjV4bkhNbXZNMHlq?=
 =?utf-8?B?TWxBOWgxdkRUdnY2OEliTzQrZXNodEVZaWVYcHQydTFiRnk5Z3pVRC9jbkc1?=
 =?utf-8?B?cUUybzhWSXBLakRiSy80SjJBY3dOV0tKblA4R2lObkxEZ3lEdDJsdkdqdzNF?=
 =?utf-8?B?UkY1WW1YWEl6Z0psZEVlRUwrbCtVdGs2alNDdkxNVGpZU1c1VmZhaXZaTSs1?=
 =?utf-8?B?UmVpY0dxTnhFWUpWQkVRbnVzS1JsRHV0cnpGZUZkUUQ4RGRZN1VtU3g1amhz?=
 =?utf-8?B?b2x4cXo5aWd5Yy9Gc1c0WW9CRzdRQWtyOWJadnR1N1I3TzBJVTVPNmRSSDgy?=
 =?utf-8?B?YTVLdHZib1RzRDJtbUN1QjVFRkpCT2tYN0tiSVdaNlJBVFNYMVFrWFArT3NH?=
 =?utf-8?B?dEJzZk13L3FRQlFvZUtBOHVEV1dtL2dFYWw2OGxEemZGc2piRUFLU1FVNDBz?=
 =?utf-8?B?MDB1NGQxeWMrSVBQbm9ETVdIckNUWDdZSGx2QVNHMUlrQlVNVTgyb25Samlq?=
 =?utf-8?B?N1kycExnejlvSTlSZnhDQVQxUjV1alhhenBzV0tBN0V3emF6ZHpRTUhWRE1t?=
 =?utf-8?B?WUhkYlJPM0Y2RHBSRTB4YXhUYmE2V01ZelJ5VjdqeEdWdjNNSHRMVlJmT1JN?=
 =?utf-8?B?ZDZZUHBLd2RzdmVIa0RHa1lzWEJDTHdVTjdYQkpYUTBvTlA5dXc1d0xYNUdP?=
 =?utf-8?B?a1N1R3VKZzc2RndtK3lqY01OVG5PSE5sYmIveDFVTFRyUlNLa2VUMmxZUXBC?=
 =?utf-8?B?RktxM1VROG1kdm9PV2gyem9tcVpqSUdseWZCUWVMbkVZUUx2RFBwUFFyREJS?=
 =?utf-8?B?VTkzSERrdVhjN2VoRE1yTzVuVDc4UjhXTEZ0R3RsV1RZaGp3OURVZVVlT1JR?=
 =?utf-8?B?SFZwb0pzTHhzVGtwVXh4QVVKY3p4S1BLYVk4TmxCVGlhcG42M0VzZk1HdjJK?=
 =?utf-8?B?MHJrUUFmQXNGNVBFclZsazJKUG0rSVBPVUtBNVJoaDhyZlZDMXFoRDh5bXpu?=
 =?utf-8?B?S1JJaDh4b3VnS0dWdW5UU3pVNDJSSXZZZjVydGZQRUU0SDIxZGJWT3J4TUNw?=
 =?utf-8?B?dG1oMFRtd0NJZnYwUktuRW5YUzAxQWVUaXNuWTJ4dVdwNkJ3Q3JUa0VXZXpF?=
 =?utf-8?B?UjNwcFRaZUxlWVpUazdDa0orbVNwWitsV0pVVGw4RS9tdTBqSlVuOC93cGwr?=
 =?utf-8?B?YnJYWlpES2dRZFM5UnJPMHBMaFY5OHpxWXFQWTBSUml0SFV2Z2gzdVFlcGp2?=
 =?utf-8?B?VEdlc0srODZhMDJZdGtVTzcrZUN2WURBSTQ0NmMwUTI3ckxjSUh5dmxTL0VE?=
 =?utf-8?B?elBIZjg5MHEvZmZYVlVCREhPbXNxdHpmc3hRa05QTVo2QzlwelAxaGhITXUy?=
 =?utf-8?B?YmJKNlhUdmd1dE9OekhyWGg5VEZuWUY1VWUrYzltSWFkamwrYXB3dmVMWEhQ?=
 =?utf-8?Q?7TTtcnSSt9dm73O0VLZ+9ODCZYZ2a321qf6I+HSmkE=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 10:41:44.4018
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6471d01-ce42-4e67-789a-08de5a6c0088
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB8257
X-Authority-Analysis: v=2.4 cv=DLiCIiNb c=1 sm=1 tr=0 ts=6973506b cx=c_pps
 a=383bDpamuXABF3/M3Waz+A==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=134C2J0RlIERMqBQ30UA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: _TyJFIUrZh0lPhG-GgkgK9DUmiHjQofW
X-Proofpoint-ORIG-GUID: _TyJFIUrZh0lPhG-GgkgK9DUmiHjQofW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA4NSBTYWx0ZWRfX6pqNX8XGX+Xo
 IfVn0LNB7KnrqyltfRKldlCUJsC8InBR5VbiobN3nAhSGjRQ9TIC9Q0UNMRDCNLi8rMTO3bzgLP
 9tP6kLN4BhTuwPUMrihx2WgpqQQlysDhmuRqxcaBjHGRg8YU7D7vldi2VUReImXvq9kUPhbnX7A
 k0YpOn+lOSihobTq7a/2hHbBHwsW9zNzOabTJrplqcwVbgJLvKjPvpEawVd9cjpRw8CfesVZAEf
 PJNtj+2MghyrXdnYQ/yi4SIYXDrnKaV6txQvkervUpFvSDmUYFQGsfnajFM5BpnqJj7Pkex9Tfj
 jhZvabBHpyED/PhO9OdLiTT1uuivkkJxgQ+rhmI2v4gewb3ETFIa+uidcqJn/ix+JWdPrBYq4FI
 lyXJkNigEHin9NC+ARj7a2uY42EMwQWjFobPD1qD2+VL4eVv0lVL059rnHGcWKpxyyX1aUohSJv
 XVMUU2FPl9TlFlRJ8KA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31006-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,st.com:email,foss.st.com:mid,foss.st.com:dkim];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A0DFD74847
X-Rspamd-Action: no action

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


