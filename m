Return-Path: <linux-gpio+bounces-28131-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95906C3695A
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 17:10:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4585C1A44920
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 15:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0286C336EDE;
	Wed,  5 Nov 2025 15:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xQJCFXZv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011069.outbound.protection.outlook.com [40.93.194.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEAA333740;
	Wed,  5 Nov 2025 15:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762357619; cv=fail; b=KVYrzz1aHq/JFYRKhlBxitbFGhasNU3x5Y91HFMw6xpa2e8glGOKlqHrn18BmMytNvyw0vcO8yYIpvwxF8OM4qDDXYHkFwoHuUzh868kU7h4DY2y1WmqxrMa8g2KtWsJrSIKOOH/7+YKWNELdqcC9CySHQzocnr6bXSsIZB9IM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762357619; c=relaxed/simple;
	bh=M2kOfgDli5v41BcOPKmUFJU+rZkRN0gaxTEAyN0cHLw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Sx3uTU0VeXOjqwATqf0wcsvz+3Cy5hyX5gMub7TX8m3YIrUg6aNVE4Pdt2hTwaNeg7wddRit9Dz4/3KmfT4kdlwhmvWOGp4dBPs/TJqcXmmNAdZCxQzVp7OB6u4KvEvtpZ9hm9/qxjOgbS082x1q0xBKFNSyJrMxXmef/V44qK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xQJCFXZv; arc=fail smtp.client-ip=40.93.194.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NbOXc9FhqWU2Pz0pNKvqrBwh6KLJhyPL0RVS7U4FYKPN+XinTTfsxoA2DnQFh+LR7605LCPfsE69IWqNm/dffvvsgav5lVNeb9xF4lLqvZfmnYsxUdS9dzhDd+JDHm+cKzlH/BVYEufalFP+ZmA0tZe3DJmPJQtxelJVZdXPehbp/BNZQGO+ei81tOoEt6EKYhf3pAXCrdii3cp7YUwu5t/IUv+LQjcScTXuMYhVmGNtAQ+6M5N2kEjzQUUCgtGh1s2kcKjBC+fxLwaRdOXT3507U5bKqMub7RSlUoUv7B82WKrtFhlXe9kimT5KqwmXdu/Y8RtHXb7N7Ov7Zz3/sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSZ73JmM8z/09Dc3c7CmgoKzZYL2gR/Dz+uT/qGHjtw=;
 b=PhpMootiCAEg7krqGIr+9KFy1vbH43qdYWWvVaQfmr4JoYsV1Ikq6+OWceXzszlBsX7HWjnY5BYRfCJ7RGGOj9Ks9FSpfL8zH0jpsGT3YzuKo58ExAumV+MMQEZXocrQ/ovZlb3d4j4ltk6n3EOiIqWv33Phy8utVitA6SkqYzT8uqArjMFNUl8YKZQzitOK9sSZbHB36pqa7BJT5QtuNoEaKk6PXrtUQ/7HhHEP0pHDvUwV3AS0gPqJLYDhzu6UFt57vdHMAbO3aBESFAajyzuCQncgswjRnBKD/S/BeJYcWz/9UBh8meCZfaxE8XdUp8CsIY6x1SS3L//ztmacCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=atomide.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSZ73JmM8z/09Dc3c7CmgoKzZYL2gR/Dz+uT/qGHjtw=;
 b=xQJCFXZvc2RnAGUy9JW51bbDqJMKWA//KOoX41CTRD0pSDWK6dHvyO1PDmQ6yBU2jWnMY+fZIsQmI6AK1yZChudOob5Q/os7hMEvcRRZNnoxqXK+wESIg+omXCcnBsg1kz17ye2OJrvKM4HHdVqFidbN0CmTu66rk7YyTWzWy4A=
Received: from CY5PR20CA0015.namprd20.prod.outlook.com (2603:10b6:930:3::18)
 by DS7PR10MB4832.namprd10.prod.outlook.com (2603:10b6:5:3a6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 15:46:54 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:930:3:cafe::e7) by CY5PR20CA0015.outlook.office365.com
 (2603:10b6:930:3::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.8 via Frontend Transport; Wed, 5
 Nov 2025 15:46:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Wed, 5 Nov 2025 15:46:52 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 09:46:46 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 09:46:46 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 5 Nov 2025 09:46:46 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A5FkkQr3944724;
	Wed, 5 Nov 2025 09:46:46 -0600
From: Bryan Brattlof <bb@ti.com>
Date: Wed, 5 Nov 2025 09:46:42 -0600
Subject: [PATCH v8 1/3] dt-bindings: arm: ti: Add binding for AM62L SoCs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251105-am62lx-v8-1-496f353e8237@ti.com>
References: <20251105-am62lx-v8-0-496f353e8237@ti.com>
In-Reply-To: <20251105-am62lx-v8-0-496f353e8237@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Andrew
 Davis" <afd@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "Tony
 Lindgren" <tony@atomide.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	<linux-gpio@vger.kernel.org>, Bryan Brattlof <bb@ti.com>, Dhruva Gole
	<d-gole@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1050; i=bb@ti.com;
 h=from:subject:message-id; bh=M2kOfgDli5v41BcOPKmUFJU+rZkRN0gaxTEAyN0cHLw=;
 b=owNCWmg5MUFZJlNZJ7C4aAAAZ3///77v/3e0qzr/8Pr21nh/aHRy/y/n//d7a3/tmvh++16wA
 RsYHagAYgeoAaA00BoAA0AAAAABptTQAAGgNqaNDQDTNQZHqeoMT1PU8mmp6RBkNANB6QGjINAG
 gDEGTI9QAAA00Bk0ZA2ibU0ZD9UxGg9JpoDIDT1DQ00aABlDTQ0yANGTTENGQNNGQ0MJoBpoxGQ
 00DBGAQGAIAaNDQaaADQGhpiACNEgzgWfOSMhbJI6WBy68isCbI/BCBt2DTLpQiIDAX4F71AcGh
 GL3A648IoVhvGhrIkO8KZ/UskF4loBHHkUi6mAMyEtBcxs54OGDap1vkV7Fj5DALhjuErjP1z4E
 x8opHLJC8v7PB9+I1NJozuYveJr1Ett52aQQJjQt/lCt3nRllEZjicqm1aFT9w4brE1kLN2Qd+4
 olHatw6phyDfyx6dL8apGToAMrP8QiV3r2ldNrcIgGIh9PUYprZqtSiHwTsF/HFDFkVrINeW8iB
 y130qBLpRcQ+nVuZoE+2QtAiQ+QJDgR1OMlVbW8w8ZkXJGJJe/f9DLGZjI7skc4U0MTAnmMjCIE
 XQVlhW8mJxLPABTaBfYDM6aSReCJmRF9zLyVwHw1WN0StOveFvH17Jhdd5mmWqRgapGHANRt1Gb
 dB/4u5IpwoSBPYXDQA=
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|DS7PR10MB4832:EE_
X-MS-Office365-Filtering-Correlation-Id: abd1aa6c-0bee-4eb2-8c7a-08de1c828a46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|34020700016|1800799024|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UDdmM1BNalFtWEpEUzZTVjBiY0RxUkRwSko0SGN5VkRFUC9aU0FqQmxCUkE1?=
 =?utf-8?B?ZVc4cGFsR2xNR1hCa0dSU2Y2RUNuTFNUNGszMXpFbkM5WUxycXdPTWlISlJM?=
 =?utf-8?B?bGJpNXZWK1dsaFpkSExjY0VRRkliMjZkY01UTXJ6ZjZNMVBoSUlsaGp4dHdv?=
 =?utf-8?B?dWl4MDExVmZkMjhmcjJSMXdkMER5aHk0WGh1QnNYSHQrWFhDcUpQZ1lBMEtk?=
 =?utf-8?B?TjRGQkM5SU1DWFNhWHpnRnFiNVZSa1FtTmJTcVplL1R0dHRFbXpOWVd1ZjBm?=
 =?utf-8?B?ZWhQTjN5b0o4TTdJVExvNTltS3RMTHJFZnZOZUJOTEhZUHFDdmp0RUJleGQy?=
 =?utf-8?B?WDhFaGQ1QVdvL0t6SXdPa3lQM2Y5Y0dxV3h3MVZ4ajdLUXRWaGR6V3lZTkJG?=
 =?utf-8?B?TFFHVlE2RWdYcVVYYkc0UURkeGV5RDM3b1VrTy9SK2FlVE12UmF4Q2drNFF3?=
 =?utf-8?B?Y0ZlNEhiRFFWa2IxUlRBVnVZUDY3aWJoemtOVVFrZldYREpsV3FVd0tZZ1Vs?=
 =?utf-8?B?YmxWSkgyWWJCcHBLRkNNOXA4YlRSZGZWaXl0eVJ3VmUxSGt1L2w1NExRNUow?=
 =?utf-8?B?TTE0c3R4a1NzNlZsZ3RqdEV4U2ptb0drY1dnYlJNTWYzV3hDWlFEM1dIZGhy?=
 =?utf-8?B?aUxkbTNYbDhPMWRmemF5L09qTlVsZlBOTWJDdGl1dlJqLzZ0aE9nUTNRdFpl?=
 =?utf-8?B?eWhFSXVtVm5aemZ6WnlDVHhwMEIwRGN2bjgvNkFrd29vK3RZdUc5Um9JelZS?=
 =?utf-8?B?WmV3dHExbU1selVyN29iTDVGeG9qUkRwS0F3Zk9OVGhMRHBnSDhnT3pvNm93?=
 =?utf-8?B?b25KdWRIaDZXSWNVN01HdHU4YitjaXVEUFJGZURwYzI0N2UydW1lelNMOFNn?=
 =?utf-8?B?TkwxYXEraVVPVWVod0lDbkcwaXBzWHN3V0kwZ3pMREhMWXJOK3Flc0JzWTBN?=
 =?utf-8?B?L0hxekdseTdWcjFvL3dGRmZlY3JxTSt5OUJCeEpvcmFsNTNCOFJCY0hDUkdl?=
 =?utf-8?B?Zk1NL1hvcnR4OUpTM0FpT1hEb2QweUNXcUY4ZnZDNnBrL1A3NEE1MDNCaU9F?=
 =?utf-8?B?RDhWWkxGQlVRVjJnZjREQ0lIVmxOS3d6TFZ2QTZHalIzTkNnYVVsc2VqdUsx?=
 =?utf-8?B?ay90ZmQwV1MrYjdTVUh5TE5pS29NUlhtV0pXcWh6VGl0Qk9hNmdZUEFxbWp1?=
 =?utf-8?B?VXVmTFlsd3BiZWJnY0pGNjVvVVkzNUg4RklVM0pBRUtFTTA1T2tQOFNGSG9D?=
 =?utf-8?B?OWgxeXhUcElmbWM1U1dONVlPM0Y4dWs4YnVwcUF4dytGUVB5cVZUamsvUk1s?=
 =?utf-8?B?Si8xSzJPUzY1WXdsYzAzYlJuYnhUc1dHMGZFT3RzbHJLUHQ0UGRscTFpUWZQ?=
 =?utf-8?B?Uk1Idm4vV1RaQ1pHcjEzbjJXMzNwRjdtcG5BTnJmNGVvd0k1RWQ2QnVpV1JW?=
 =?utf-8?B?L252MWNxYVVNRm10MVFUYW03WDdMTTJNR0dkaElMMUpJaGR0RU9uSmZGVkpl?=
 =?utf-8?B?RnNnM2h5b09UOUwwVXdzYm9MaVVodEpjeTZOeVFWSVRaYUV4U3dYWEZnQWNh?=
 =?utf-8?B?L1R1NzFVZzVSV1UyK0sxUVF3U0FZVy9MQVRCWEpnV1QxR0o2WU42MnRsRUJl?=
 =?utf-8?B?T1daZCtjaDM4eW9wbndXS2Vhc1hKV0QvYzdtZ2Z4Wk85Q3RJNjVYeU9BS3Yv?=
 =?utf-8?B?RnE3Qy9YWWFwa3JlblF3ZWViR2E1UWFxR0xoaE1MZ0szNVh6aHZTL0JPRHNL?=
 =?utf-8?B?RVAyVGtUN1MrREFDL2JOUU9hbFJpdnk1ZDRNWXJqSi91SUtOQ0k3bFFLTi9U?=
 =?utf-8?B?N1oxZnJvN214WTlJc2FjZEhiOC9uSXBtV2pHa0pWM250bEZzNzY3emtHc3ZQ?=
 =?utf-8?B?T28rT1IvL2hRbno0QkhGSTZsU0o2aVl6a1g3OHBsOUVOZ2JPaXNvTDd2TFl1?=
 =?utf-8?B?dEV6ak9WMllVRFRoOHJoZzhhNHR0dnZqSW9uNnZsbnBiUmszOXFITEhKRW5t?=
 =?utf-8?B?dVhXY3RtQmZVM3YzYWdVdFhEME5sVTllRit3Y3A0akxYSmNHOWo3clJXeTBw?=
 =?utf-8?B?eEZBajlrN3c2Y2VTeTJRZHVIUmdVZFFvVnB5S0dkZm9kTnZISVl5a3lFNERS?=
 =?utf-8?Q?7oOw=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(34020700016)(1800799024)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:46:52.3535
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abd1aa6c-0bee-4eb2-8c7a-08de1c828a46
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4832

Add the binding for TI's AM62L family of devices.

Reviewed-by: Dhruva Gole <d-gole@ti.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Changes in v1:
 - separated out devicetree bindings
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 2e15029dbc67760b34104ce20e512377b7da54e1..0c98235868d4775bccbd26c591db247d209421f2 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -37,6 +37,12 @@ properties:
           - const: phytec,am62a-phycore-som
           - const: ti,am62a7
 
+      - description: K3 AM62L3 SoC and Boards
+        items:
+          - enum:
+              - ti,am62l3-evm
+          - const: ti,am62l3
+
       - description: K3 AM62P5 SoC and Boards
         items:
           - enum:

-- 
2.50.1


