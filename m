Return-Path: <linux-gpio+bounces-30995-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHfSN0NQc2kDuwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30995-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 11:41:07 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2940746C6
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 11:41:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D74BA301B176
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02E9F36656F;
	Fri, 23 Jan 2026 10:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Cw1FFmMO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D4E352F86;
	Fri, 23 Jan 2026 10:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769164856; cv=fail; b=TFbj9lx8O9V2Vpf8Djqwr7aUgnCZ4fSuwAt4fUl0NnErigYBSF+gvZS08IYdN297E6q3g/vf675rRtokfHtAApgeyX9RE5pmwRw3GNP/QZ9Xwv4bnP0WRtIywnZzFXPnNApBf5Wa1rA9bKwnbGj1S1jDasFkfs9/KQOtBQUhJ3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769164856; c=relaxed/simple;
	bh=QqrMX0tU9Yq+AgB2si0zEDTOBzjdKZFT7Fl5WX0A7TI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=IG7UZnBUdqcHkQImSyym9wn0EKURXHjIbVn7OShWgt6iKKwKY6WuFRgm8Ex5VmCNLySVZSBVtAiJrrzx22WlVhFrYb+0pucSOObkjSWrd5ZsoksUlmZTBnAzpyzvpL3NJx//V4Ldh+jCNitYCjhQooI1zofmGr+5vbGQluBh50Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Cw1FFmMO; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NAbhXP2252247;
	Fri, 23 Jan 2026 11:40:34 +0100
Received: from am0pr02cu008.outbound.protection.outlook.com (mail-westeuropeazon11013030.outbound.protection.outlook.com [52.101.72.30])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bunggkjme-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 11:40:34 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p2wTLuJ0WdzRHpA3MWuiUsr4Zfjmw9wA3w+1uqYnbkqaa31MEojPsTKMDrx1p4u+lF/Af6HdrE7YUMUqKmvd2cau8eG67Vs8+jisoLgu/sRAbcQlhXnQWcAubl3gnk1a4k3pBNF8ddamYfZDhHHT8sHeokKnmoggPSslBBbqrnNhI1GhGlPm+lWLQ9LJRUYmbjEWBEPGDsIX2SDupJX4UDlPHiKQKG7cjYZVCpFD0lUOfNQMSa8PIm+vTkxpc/o9VqJp1Uh1x9WZBGuwJYtra51z7+lUSatsi2ICgwJifxc1LRxgPOCT7Vq28lkItGByzYa00hx31lrE6qrXYRhErQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WXg3iXMmpRHZCN2cjVNGSQhinaxSnLv1tVcF/S5ZuQ=;
 b=UCYLu9yubs/Lt24m+yATLrgdQRnHhzyBVlLZg+DQgOt9fc7VLnJqhOkr7dfDtkGNKEfexH4JRdxlNcXmFtf5p0bsvWTE/VwAXeu8zXqq3dQlH0HsCLtX0nfEf4283/Y7KCjQ2KslThxdnGiKBxaHjgSM5/smH+1sBkG2IeVLhveeWa6Fskw4x5Ip0xpPs6H24L5vmcIWH45Q3eIuOhWQmi1W1RmvqYy6fpTY0LxswwDCW2h24MZjpHyuLmM0VdaiabGqVw7X3esU1av4TNwufs0CFRYJmRlWnpIMva4FD0ojXeHViewQBNW1HUYZ6Jbx2TPu4krx098e7999Y9gODA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WXg3iXMmpRHZCN2cjVNGSQhinaxSnLv1tVcF/S5ZuQ=;
 b=Cw1FFmMO8v/ikBEXvP0GTwBXXmU5oKVmsbhHLmlmIFmAGDL0oYGf5eS4pQ3Lmpw6FvlWYr++sqSUvlTW7fawFXmbkoiqYml9AeVfgSMJY/IE5cn5FsFKWI8UUVSya3VWhSil+jYyq+RRpC1+HQlvPFtGaWZdHEgHd5tdqcIz6K50VWR0JQM31aqrWZ4jtl2LdrsBMbbH+mma7JuXki3JEQipC7sxJPrKhNw24S1PTiZ8f5jbu+N2zD25jUt1SOJHeIxHS16MwybR0syOqi8SGv05Tp3fasSJhtH97ySxIXcEPSL0gIwAdiDCr8fhTjdZZHQH8/v1bPNHD9DCxtF8pw==
Received: from DU2PR04CA0184.eurprd04.prod.outlook.com (2603:10a6:10:28d::9)
 by DB4PR10MB7016.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3f4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 10:40:29 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:10:28d:cafe::44) by DU2PR04CA0184.outlook.office365.com
 (2603:10a6:10:28d::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 10:40:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF00050A00.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 23 Jan 2026 10:40:29 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:41:49 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:40:28 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Fri, 23 Jan 2026 11:39:01 +0100
Subject: [PATCH v5 04/12] bus: stm32_firewall: allow check on different
 firewall controllers
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260123-debug_bus-v5-4-90b670844241@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A00:EE_|DB4PR10MB7016:EE_
X-MS-Office365-Filtering-Correlation-Id: 359ad3b5-2992-4d44-d0ee-08de5a6bd3a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OGFZQXJyeGlkSnhadEYycm11N2dqeGlYdy8yYU9QakF5NEdVblNiRjFCa2Zi?=
 =?utf-8?B?SEQ5K1JrakZDMXdvWGlDNWZ0ZC9tZytHYlBXN2xtL2EvTGgrUEJaQkJBMHRS?=
 =?utf-8?B?QjNLMWlmVEVCdUlQcWlFNHZraVlXelZMQUh4cHpTbjY4Q2M4emdHLzZpdUhT?=
 =?utf-8?B?M1cwMUNOSUI2QWtDdUQ2c2tBSDRwUGlDWk9senBPWlFhVGpTZWxHMHNTdXdy?=
 =?utf-8?B?Qmk2dVJmNDdxOFJoamFoOUxCYkp3N25TOUdFYTF4WWo2cXcyRlFIOW9hU1Vt?=
 =?utf-8?B?NUZKRDZiRVp1U3g2eWtuUTU5VnRjQlk1dVVLVTNuclBuTnRWd2E1ZXRPVlIy?=
 =?utf-8?B?UWZVZmtySkYxSmRlQnl1Q0NaMS9ZOUJLa1g1VlJLOFpGSm5zWlY3Rk9ZMXV2?=
 =?utf-8?B?NjlWVFYwV3dZOWd5QkRhOVphaWI5T0I0ZTE5cDdxWW9QQ1l1VEdORmZQRVJW?=
 =?utf-8?B?c1QzS2RuVTlMZTBBWStBUkU2ck9UbHhwSWxJeURScEl2Rk1XZ2IySjBVYkky?=
 =?utf-8?B?a2VHRCtOTEFxOGVrMzVhcnpnRnQyMysyUnNCTjB0b2ZWUHE4SVB2WFJGZHBh?=
 =?utf-8?B?S1BSYWdqVUtvSXZjeW1HM0lCTWJjbUIrV2FiZmh0YUpuZDBPZ0hlMDFpaUJD?=
 =?utf-8?B?SDM4YWt0VmFNR2ZEVjZyWDlvd2liRER4NStkZzF6SkVMRE9ZUWwxQTd6Uysr?=
 =?utf-8?B?L2s2ajhmeGdURVpvaVorcyszOGZsdGZKazlNNkc1K0gwQm9Nbmg1ZUtEZjlQ?=
 =?utf-8?B?dlpSRFlTZElBSG5KL3E5V2Rhank5bkpLYStZUk44bVhsSDhXcjFvc1hlazJH?=
 =?utf-8?B?M0orSzJiL1drUXpFNTdPano2VzlTT0JSUHVxWmxjR09lU1g1eFczcFlJNkFy?=
 =?utf-8?B?Ty9SWHh3NGhlcXYrN2xRNlpvcEVpSXc5SlkySm5MalFrMlRia2RUZGVNUEJV?=
 =?utf-8?B?aUIzR1UyZWVqbXdkVEgzM0QrUHUvcnd0aDYzWWd1dGtOdmRCNERCYjFhbjVI?=
 =?utf-8?B?Z1R5SzhkU3FrWXhINW5WelRnSzNWc2VLaFFKTGdQelowU3hXaFVrcDlON2Z1?=
 =?utf-8?B?VWlEd1ZiajRmV3ZVbUhPdVQraTB3OWhiZXNXVTJhZXpEYkRwS3hhb2hidlhq?=
 =?utf-8?B?dVRLUmZpWVJxQTFHUldCOUg5RU53MlJ4K1pCR0pVWU9EVDFYYVpoamMxTVMx?=
 =?utf-8?B?UE1QcU9xczJmajdrY3JvSDRxenpsaDJtOWV6Wnlld0ZjT2E0V2JYcmliNXAy?=
 =?utf-8?B?U2hsR0R0d2ZFYXJIR1VEcllMbzhqeDlvVkY1Q0hCVStkQTQxc2tYN2JWVGJ3?=
 =?utf-8?B?WS9wbXFIS0U5Nm1hdTZYLzFGYVR4UzRPOExvcWtoYWIxM05IR1dtQ3Qya2pX?=
 =?utf-8?B?ckRmRnJNSU5vOCtNa1RVNlBKYm8wZUVlV2xJVUx3Qk5sKzVUV2FvK2hwOUdO?=
 =?utf-8?B?OUpBNFR1VjB0akpwRnlIR2tCYktCVFd2TWhMWmVRazdUNHpDZUlXNnhqS1Fx?=
 =?utf-8?B?YUh0VmdVbmg1eVRNZzhkZGdEZ0lINVdpMmhtOFVKcGlXL01CTnJna2FwL2ZJ?=
 =?utf-8?B?ZDNRRkYyellIR3FJRkRaTm16Q0FDUkxOQk5oVlVLZitzY0hjODk1YStwVWtJ?=
 =?utf-8?B?aG5BRTZ1SlBsbHdkcnRGZGVVeFFhU0Q0MTZOaWFCeWhqei9UeWJ2YnRrbFBv?=
 =?utf-8?B?Ly94eXgrSEJnOFpyWmNVdmpCM2JjTlA3aDIyMy81dHZLWFNNQy9PY3NjU0I4?=
 =?utf-8?B?eFVpaDNuWW9SRzdBYUV2L3UyMDhab1lwdHc1d21pTUs1WHVQckdyUEVQVWtR?=
 =?utf-8?B?Y3A2V01hdXR3emJqZDFVaTVXbnZWQVJnbWRlR0dLdmZVTUVNY1pobXMybG55?=
 =?utf-8?B?R3RrME1UdjIxQzVZM255UEk5VDBoWWhBdmJmaUExdnRWYUZEMjBLR2FHM3d4?=
 =?utf-8?B?N2R6ZnM5d25Id2ZGUHN1ZllNVEtXUTI2ZUU1d2VydjhQN21BOUR5bWxZeUtP?=
 =?utf-8?B?NUV6MEc0ckZ0dEtpWEdPK25maXk2RmpHZjEyVHprM1A0Q0JadlFHZnhwZlB2?=
 =?utf-8?B?dmJ2VHhBYU44TU14Q055Ry9JUVl2QlhweUdHSEVpYXU0SHdXaWF1ZGVSZW1S?=
 =?utf-8?B?TkhOUUVxT1ZnQmtVaDl0TVdjNGIzVXdzRkxldEZJSWlnOUxuOE9CZlkvb0ps?=
 =?utf-8?B?elNQYlArZHRlZTJYOXpoVEZSTVprVWU4UWh5VFc4bTVONk94T1JPanhQK1J1?=
 =?utf-8?Q?AUdIQfm3VP/6t/v1CaOGPoefYFBBs+0nIoFA6VMOXc=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 10:40:29.1002
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 359ad3b5-2992-4d44-d0ee-08de5a6bd3a5
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB7016
X-Authority-Analysis: v=2.4 cv=VdD6/Vp9 c=1 sm=1 tr=0 ts=69735022 cx=c_pps
 a=nf5VWOPwvPMO08Lxccx+zQ==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=E_Tl1f5C0o25NIMeFyMA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: 1Y8UeHSTGc33WknI8Fbo2waQp6bVKWS-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA4NSBTYWx0ZWRfX/Ilf3gxWgBl/
 QSi+7ITCnEezl0gYWXTPH74IZQnC/2vtdY0rkWEi5XUNHZ4b4xr9KeLKzVn2LkboO39aVJpRLNR
 E5rvVCjC6xeS/79h4aKa/9SG5GV+F5PZikO+cK0PKwbyzU+Fyl3b5S7Tq8QfaB/hhWb7VvTZ4as
 YunXwhFfLpnCwUy7Jl6Vvz4rTAyM/HXbdPXSMX3npiKT2wInibriq5wZUN/9srNyOebLzwivUQv
 ws/95kDqQyRCgRNPs5/7IjrvJo2FyucahstDxS+wfcl0mqumTGOZ4HJ77LYb49JywAxTUsa0OI2
 hj1Bc9QvSKYMlnxtkTpY5QyhA8TOJcbiAbKrhFkh9bghL8hYjQesvxLyk0/rD9NDysP/I26yfbF
 B5dXLVRSAcOO/QS3TNqpocUvhbi9e0VSkcCrjGq5ErrK4dTNBrvt2WFBryg0M+3g20Sw7NL45Ym
 KJYoZuKVoTcQS/kpg/Q==
X-Proofpoint-GUID: 1Y8UeHSTGc33WknI8Fbo2waQp6bVKWS-
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30995-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,foss.st.com:mid,foss.st.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A2940746C6
X-Rspamd-Action: no action

Current implementation restricts the check on the firewall controller
being the bus parent. Change this by using the controller referenced
in each firewall queries.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 drivers/bus/stm32_firewall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
index 2fc9761dadec..2717754d811d 100644
--- a/drivers/bus/stm32_firewall.c
+++ b/drivers/bus/stm32_firewall.c
@@ -274,7 +274,7 @@ int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_contr
 		}
 
 		for (i = 0; i < len; i++) {
-			if (firewall_controller->grant_access(firewall_controller,
+			if (firewall_controller->grant_access(firewalls[i].firewall_ctrl,
 							      firewalls[i].firewall_id)) {
 				/*
 				 * Peripheral access not allowed or not defined.

-- 
2.43.0


