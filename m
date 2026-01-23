Return-Path: <linux-gpio+bounces-31003-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHiJOy9Rc2kDuwAAu9opvQ
	(envelope-from <linux-gpio+bounces-31003-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 11:45:04 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F1474837
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 11:45:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5DA4303EA97
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 021E136B065;
	Fri, 23 Jan 2026 10:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="XT14j1kZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3D3340290;
	Fri, 23 Jan 2026 10:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769164899; cv=fail; b=IxJrtpjLxP8fp9sZ7SlJUzYmVTCFQS7M8m2jKqWf/jWXXUoiqa+85AF96FAFp1813Q4c1WfB+9kCzNET861F9uP6EHLydgvd4N0Dm3Ho3JFnVOxjUYwNVSgryXOv9XdlK9soi4Jb6polNl2xLDQVBWA+y5kYOZVUmzp58g+kkG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769164899; c=relaxed/simple;
	bh=l6ZVfoWz5u4T3ZRCM94AGwRm1ba+4HRmvB4JiLZGWDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=tp+ugvlGUsUqRyES//6TGD4iZmpUOxp06u1vk6NPasEv+Od5OLJt0vnhHjEGFf/Z0Krbp4RuKlIv3WVnCjDuk0ItG3mwptflLrt9wNek0mIlYSHbp15bhaavnEQzCo5MAIVANA/vymlAf+Jsm6St6o/0PkFBbPg0z30ZEuqmPsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=XT14j1kZ; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NAcO702297805;
	Fri, 23 Jan 2026 11:41:27 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com (mail-northeuropeazon11011034.outbound.protection.outlook.com [52.101.65.34])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4but7btd6q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 11:41:26 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=THII54orsaZ25Re/7uIhNJFHRj9IjCKtqMbHncYjmq/0OoASbvYLdZHPelB1cMIaDGsRo+ndj9JMucg/sJUBeeqXYtxJd4Zh3pD+Qn3DgllD2Y3b1D9kEipMaaSwM/ddqTB+xOv6C3AANs+ANkig6xYYwAhCRfN60Iryh7yoyLzMeMFFkS+s9n5PHzGDQLtusK3zcHg3EvsOlAmvrtlKZcqqttqgy7cXayuoSnHqQvyucMrcVidmA8hPES/24t3+EILHl2CLYyC5h/8HIIrlJRrwBGbkb/eWNlsVilUf1aO3BBLN/ESyAP4ha6PA6mmNMpt1mKUU+AhSbLHbE9mIsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qHqeqowr6oP0AigY5SnPMenINrDk1GkoRAg0SCMO7jA=;
 b=tMnSWw80Mer8Jov1ufsxzMCO2fIJm2EHI+IYsIb38QfKcyak91sfGUeD6Qf10ADYavJB/iSW/RYZZAPBYMa6+qkn9IcVxhqQNU3g5z4nZ3wSOj4Bu+XJSu5ina5HhUyBgrknWCVjvS6zwZw35o8nQFjXmDNiHiJTMh9rd3goPwGYT3glXWzWzjnBFKe/u7NJQeiw0Dol1zdui8tc+N++W6vjMIyZxHrq4sQ2ajl3tooSpREe0gn9yNhJCTfQw6qJi5oqQCAPlbgSZBuoVu9W9bCdjBdQqRFXRwl1VkBviSzJ7cZSONrWJ/dXOLZqh0NxYJwfJ3vzkpLzAZdFFmHmmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qHqeqowr6oP0AigY5SnPMenINrDk1GkoRAg0SCMO7jA=;
 b=XT14j1kZs/e3mIrXoe42L5aq3o+CTEhf88ncaQm30OUOOrfNkosLhltEO0rRTGALazsQJ7WEbhLRo1jzpCVhIGGyybvEZpf348UrAouZpE74sQ36mRLTLaKmqJWPoL+UNjKU/NQnmJn0oiVqcYYYt/PzAqxX35NZFYfSXd3QwZGFACA2OBeqX1EDhloifxLM3+JF/AyXVKQEsxLEIqDc6qXhm7azLJwlQprc6A/+f7EjzKlxakMSlvg1jSXcBOc5ybr6+9r2oQeHJR4oZouIFM04lNECjUHW6R5htBIoAtPatxBBzQdmBBKP1Pu19wQEfKaTeI7u5wyKjULo+xEx8Q==
Received: from DBBPR09CA0026.eurprd09.prod.outlook.com (2603:10a6:10:d4::14)
 by MRWPR10MB9627.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:501:9c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Fri, 23 Jan
 2026 10:41:23 +0000
Received: from DB5PEPF00014B8E.eurprd02.prod.outlook.com
 (2603:10a6:10:d4:cafe::f9) by DBBPR09CA0026.outlook.office365.com
 (2603:10a6:10:d4::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Fri,
 23 Jan 2026 10:41:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B8E.mail.protection.outlook.com (10.167.8.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 10:41:22 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:42:53 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:41:22 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Fri, 23 Jan 2026 11:39:06 +0100
Subject: [PATCH v5 09/12] arm: dts: stm32: enable CoreSight on
 stm32mp15xx-dkx boards
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260123-debug_bus-v5-9-90b670844241@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8E:EE_|MRWPR10MB9627:EE_
X-MS-Office365-Filtering-Correlation-Id: f6ce0a85-4147-4eda-7df9-08de5a6bf3bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700013|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZTNlNEUwNWI1ZmRqSiswYnNGSE8rUkpveEN6SnpqQ2xZelIxaHRqVGI1bjdi?=
 =?utf-8?B?OG1ReWNpK1YyVEx4UlE4Vmw2aFptOHlha1JlQTBERTNsVTlnQStlQXdOQjJ1?=
 =?utf-8?B?RytaSGFzMEUvdkJBNnhyUHpVRFh5bmFqaUtlamtIbTNqSW0yMXBPMkhVL0dv?=
 =?utf-8?B?cEdxUVBZMDVXQVoycEg1b2lyRVFkYnI5czg0NndGRzRPZUJLL1REWGFWdVd5?=
 =?utf-8?B?VTh5Q0FNOFl5ajhSNVFnSnFSbytCS3dQQ2cwR3ZSRFJBdEo1SWk3YUlFQVh0?=
 =?utf-8?B?SThMKytsQ2pMRHdMQkh4Y0RpenJONUNYVnBlakV0bG95RjN2Y1BvVXFSYjBV?=
 =?utf-8?B?WTdQWXpMN2ZkNm1JZ0U3NmdWV3hhS2tmaFF6bFdNb3hGZk5oUzgxWjkrWFdZ?=
 =?utf-8?B?S3dZSnltNHN0Sk0zajdKOWR3Qm94M09BVnZycEdzdXdISjZtSlF0M09aU0s4?=
 =?utf-8?B?Y3ozUG5wZ2s2ZnNYUzlCUjl0Z2tOYW1ocVZ3VldhL0psVnVRSGdyRWFMU25n?=
 =?utf-8?B?T2pRbEp2U3REQkVJaDg3UVpUWUplc1RVenJrNjVXWTl6blJUTHFMYnlkdm9y?=
 =?utf-8?B?WmJiQ0l4TzlnL1dVWHRQMUozdlZuN3VIbjBiSGNkN3VhbFBRbTEvUStqSEln?=
 =?utf-8?B?bXBjbzlDcERaMXdtRTRlaWkyT3d6czFGNjJwTjJCYjVjY1pGcFc3OThqYmRV?=
 =?utf-8?B?R0ZaYm41V1poQ2RVaHZXWGtIdTc1K0RFUWkyN2tNanVwd3lyTDJTby9ldm82?=
 =?utf-8?B?NWtFUHZoSVo4NDBwR3QrOERoNzlFelB0MUVEcnd0bFIxaVd4MlliZXh3eTV0?=
 =?utf-8?B?eGZPNTdnNGRpTlFQYUV6WDludmwreXd2ZkZOQncrMVlvM1pHaDZyVlRSOVdV?=
 =?utf-8?B?NmxIUmRLeC8xZE1HL1lCYVRPMlhVTHo1bVgxMEdaRFpSMnI0cUNyMzN4QytF?=
 =?utf-8?B?TlBGc3lUcGFGNWppWE5ua0RwT0YrUlViSzJOajV6Ym9PQkRQeUo2RHA2OU9l?=
 =?utf-8?B?elEwdm04SWM3T01DWUVjS0pTalZsOXlMVkJlK0FzK25SWTRuZlRFdjFnMjAw?=
 =?utf-8?B?SFFrTmdxK1hBT1hBRGJjR1hKN0JoZUhuTThLSElDdTloU0lRTTF0M1ZwbDEv?=
 =?utf-8?B?T25qNG50N1g3bnhtU0VZUTZaQXpnVFdzQjR1V1VCV3NrL2d0OTRGVDYwQ1Vr?=
 =?utf-8?B?eGRMNDNTdVhyRjJDQWo4anVzSjFHZTBZKzBWZi9VYUgvUExFSlBVWTVTL2VV?=
 =?utf-8?B?dS9XeGtHNXJ3bFkvTzNUSnI5S3piem42RnVaRUxJY2VuVkc2eUJQaU1JaWdM?=
 =?utf-8?B?VmU4NnlpY3RQK0x2TEJBb3k2TlJDRTEyemNaRlU5NUxZK1Z5S2JsV2tTd1Ur?=
 =?utf-8?B?MFJTUWppU2F4Z0pZV1ZtMHhndDBrYlBCNFV5eCtKcU1vaGVmOCtVYUVUQU85?=
 =?utf-8?B?NXBrcUdhanYwbjV5SmF3Sk43WU5nRU5iWVZQSVFKR2p5THljTlhZbW4xMkdj?=
 =?utf-8?B?dWFOUTNoSFpMNVJiR3djbHVRaUxvOEF5NzkrbklpZFhiS1FOMFNkeU5HRWVL?=
 =?utf-8?B?cm93TmNnMTJCaXRuaXM2b0F6bThmK2FjS2VOYUpTRlpxdzlGdWNKVmVxM20x?=
 =?utf-8?B?NmZXU1FwR2lnbnNxMTQ2N3loWHlYWWxoRUtQVjNWV0IvVnhScnVQTHl2T3oz?=
 =?utf-8?B?dEJ3K2wxcWdIQTd1K3NUbkhBVzhkK1lSckU1UmFYUXpaNUFMQzRNa0lVWWpy?=
 =?utf-8?B?UlB0cDVEVk11TEFUQ3JPSk52SE5GRzFXazRPRmhVYmlEQ250MkZXRGFKem1O?=
 =?utf-8?B?bkNyR3hWWmZiRkhDczg5SkxjVGYxaDVpOU1MUHd1QUJ4YkZvUUlTYUZSaVJw?=
 =?utf-8?B?UXRIMmp3SUxvZGZOenl6ZEl4RHNiaXFGdGtBZDZaYkpVaDM4ZVY2cTZ6dFlQ?=
 =?utf-8?B?SUUwOWVoUDZydWFUZTJ3SlNPVFRoN3lXRVBLcDc5ZVpsWHUzbS9FRE8vNGJa?=
 =?utf-8?B?ZW1qQmtaK0plTGVqVmhPRWtQYUJ1Yy9zdDlwNm1Gd1J3SnZzTjU3aWxKbisz?=
 =?utf-8?B?N09KY21jQlZGNkxFTzNGNWI5UXY3cEF3RjBJL3NHNlMxZmJIdzMwelpZQmlk?=
 =?utf-8?B?L1dZYVVCSFdMMEFyUmJDTythZzBsY1Z1ZVFjcVB2cGs3bGhmaDFiOEhxYXFu?=
 =?utf-8?B?RkttZmpsNkJBWEVkbTNXVXlCVlJRZTJTeXVXN0hpL0s5TnFXaE1rbVZNL2l4?=
 =?utf-8?Q?mxpuMBl3xTdW2iZrVBE5upexYxN4e/YUcBket/LpGE=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 10:41:22.9259
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6ce0a85-4147-4eda-7df9-08de5a6bf3bb
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR10MB9627
X-Proofpoint-GUID: BLMIVekZbdE6g4o2i9JxTqKMH1dzc3JU
X-Authority-Analysis: v=2.4 cv=Fas6BZ+6 c=1 sm=1 tr=0 ts=69735056 cx=c_pps
 a=LJBxCQyVg3xmomCYv/4OGw==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=6OkPYWvNmkp-oGry5mkA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: BLMIVekZbdE6g4o2i9JxTqKMH1dzc3JU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA4NSBTYWx0ZWRfX6a06M0h8DIjE
 6hIo8IQaBorvW6X3boyuNfSnsE1xcAWfLN3EZBle8ieIO1T31z6yClCHgqBZP/8sMBxhEdyEyXI
 /POlZdD+zgSVoGz8GZyQy68cAjUzyeU3j9LSe9OOmcjfvTRA9IsqU9PBU2i+6EiBj8Vm5ZDx1Jq
 LlELtP9WijqKn/4PCbsvlIks7Ee8nZZXXm+Wu7e5NL1F2+WdYuarzclzWNLKkDpBKZD+GQ+LAto
 izCnD4lMvKNT5n4ITIaps0KqP9bgXQk0NRLcB6kyaTxeDSCyRIAqyYHPEwHhzZrOCnLNjskgq9f
 Q227KkxW1bh3l5/oP55N+sljFFmZqdJSq3Lo8/kCSJBZJ+++lf/5uDHwBCgE9nXkl2cVRb03Q6I
 +EdzqnyamObYDoKwSBNN5rP2okf0SPkChF5Z1PrjOsbJyOQ6WP74w85OBOFZ5emjbk/C1PNJhSG
 K5/5cOlmScHnMgtmRWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
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
	TAGGED_FROM(0.00)[bounces-31003-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,foss.st.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,st.com:email];
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
X-Rspamd-Queue-Id: 99F1474837
X-Rspamd-Action: no action

Enable CoreSight peripherals on the stm32mp15xx-dkx boards. All boards
including this file are embedding a dual core SoC so this change is
applicable.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi | 36 +++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
index fe2ab07ea4a8..c91204476161 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
@@ -140,6 +140,42 @@ &crc1 {
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
+&cs_cti_cpu1 {
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
+&cs_etm1 {
+	status = "okay";
+};
+
+&cs_funnel {
+	status = "okay";
+};
+
+&cs_stm {
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


