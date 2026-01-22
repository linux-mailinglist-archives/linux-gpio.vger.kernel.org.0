Return-Path: <linux-gpio+bounces-30937-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MfMHppTcmnpfAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30937-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 17:43:06 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 582536A2E7
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 17:43:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D99783049CA4
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 801623F98BA;
	Thu, 22 Jan 2026 16:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="TakrZQwm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70073F9888;
	Thu, 22 Jan 2026 16:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769098899; cv=fail; b=YGXpsfyRP09XeCe/XG+kzPqCEv48WOMG+Qn9Qv9ANkp8QWt7jtJ0KIXK0tY9gYVFHS1Ix+JHFyCQHXFffH1ob83kAEG/f4jcd+W06yaccJcM0vk+qrC55+sEAjRWaQsG5zgZlOLc4KIDul/1/Wk/Z/jRwSLpzfsa8yX6xvMcbs8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769098899; c=relaxed/simple;
	bh=eX+g77IEhYspcCC8pFT3sIxfZq+hk1FVBzxINsgDVTk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=OJU8GTxBIXaEP+L9UML0QWooSfnQIjXTRZRk36nnCXgnZNv3fA99m7xKifhzExQEP37yFlEOA1PmxVS6y2+LEodZsw/EGDhHZcrE1OcLISbCSvQRZZVhOuGBoe3R74iW+lpVrFy0N5kxE72pLgYFEDxY0UDQ4E1/jiHIrTi/pHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=TakrZQwm; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MFx6wh3934717;
	Thu, 22 Jan 2026 17:20:11 +0100
Received: from gvxpr05cu001.outbound.protection.outlook.com (mail-swedencentralazon11013064.outbound.protection.outlook.com [52.101.83.64])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4btkkxyxk1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 17:20:10 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w+myBx/V0gYeHLN0M9v+aPE2p7AbDJ7dFpct9F2HHnh3iBTgOIpDNy7f7eYrKaGLiFLAVjfDoJ96VjwZxpGdhzz9ZFNAuEawhpqlgTFxOSZqTCrCbe6Nv1Ph6CUvwepmMXIgi8Y8DfRk5aLdxhYIUsPmlxSiZv0RxYJjdJVvy0vsF/dI4jQYiR9SZKjBxdy32+z6O3SzAhIWQW/LUxrPZSmNl7RrFIaAc73dfwsp0P7bHIVYRuDinCKUD5al2ZH3HNsG4h43FQsqdh/24pRB0AhUm/gqvlUyt4CKJ5mPXjAzkdqYMyKqMmbOxEa39TgfVsnWqjEW0xmdEwmo3xShJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+PXsxOueH2M/eugholVboeEYJLIsqvqUnBLc2VxxumI=;
 b=P7zow1xAz9RgAlROPXWnJrndLqjR/SY+G0/VwmjMwLCpM0pmzM29CiOFjJqfOK/SNUzA7d3H/hPjZ4uyy3ybOPC55LiJznjGJvKdi1iNDSSDKm4ZO0CEoo6JPl3+o5bmuTU3CLwKazm4FnsXkB5kqpdTo1ThhGiINARVxNQm14wh4cefj8uT3vL60l0UYultqYyEfMTprhSDmxIP/UoNukUW50rIOZHxBB8t5RyBkJI+BFEi71lV/I6sEMoOFxL10rdpkjVl5IkNQhk7dS3/+r8Du3VXcgVdksReoCxK0xNfBsAY5Ix0JPyl8/XEgRwae4QIbDqWFpi2yyi1LnEl0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+PXsxOueH2M/eugholVboeEYJLIsqvqUnBLc2VxxumI=;
 b=TakrZQwm7W1TXCaoQ50Z9dqmriYgBBIou5Zo0GMGeWyHq8jUo1FlgSPd+jz1fVu4RX/u5BQhhqxPGxaA0ZKXbqQ7RJi9gxkyVllrij7rBoMntSazIYvTgDC2JqNMPI+R/vfGy4oVdDqoaU6iACrdH360y+fHB37KE3yJot16tF5zFPHZ6FS/NPI2x0ds0Hjw6C0kLXlGht/+otquj+ve3sMETmIznmZZNl0rHZRj7+n4GAEtJ9plMyuW129ryYapT11MtZjjMkgXKB/tM55MavUNaUQexvr3JT9+BaqB/uq5tg4kfOwiiChBq0Bph5jWdp3hGDrukxHaPt0Qyidqgw==
Received: from DU7P191CA0015.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::7) by
 DB9PR10MB6521.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3d7::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.10; Thu, 22 Jan 2026 16:20:02 +0000
Received: from DB5PEPF00014B9A.eurprd02.prod.outlook.com
 (2603:10a6:10:54e:cafe::53) by DU7P191CA0015.outlook.office365.com
 (2603:10a6:10:54e::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Thu,
 22 Jan 2026 16:20:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB5PEPF00014B9A.mail.protection.outlook.com (10.167.8.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 16:19:59 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 22 Jan
 2026 17:21:20 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 22 Jan
 2026 17:19:59 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 22 Jan 2026 17:19:16 +0100
Subject: [PATCH v4 03/12] dt-bindings: bus: document the stm32 debug bus
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260122-debug_bus-v4-3-28f0f2a25f2c@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9A:EE_|DB9PR10MB6521:EE_
X-MS-Office365-Filtering-Correlation-Id: c52d0eea-5d57-4545-3c90-08de59d21737
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|7416014|376014|82310400026|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QTlFNTk3NC91bFBzdzV0ejU5ZzFYYm1wWVBMNGZUcWJ6N0xqeXdkQU45cmFW?=
 =?utf-8?B?aDd2NktsVUVkZmNvNy9rWWoyV0RnMVdIaWF0anM4WjREYTBLamlhK0JiSTY0?=
 =?utf-8?B?bFRPNlBJaTJtVW1ycHJpKzlqOWZTeWdERHA5b2dVNERIbktEaGo4Vzl0MW9J?=
 =?utf-8?B?bUFMOUtCV3BWVXErUGdmMkVVRmJDcTc2YldZcnF6TnNLbG5VU3lwdEJTUk42?=
 =?utf-8?B?WDFud1VDTmMvdWhSWWtDb0xhcXRQWGxTbnc5cWRBWExMSC9YTldaTTJOQ2VZ?=
 =?utf-8?B?V3B3ZlE4c1hyY2c4ckorekhyRUo2L1E3bm9ic1NweXlTSTF6cWdTMlJOVVJh?=
 =?utf-8?B?R1U2d044akFteUdSR3I0SzNkRXJYLzFtMU1BUGdNTXQwVFlLak5rK3VNL1B0?=
 =?utf-8?B?b3BUQUlMZWszdmRYY0p0R0gzYkZuWkJvc0FFWDF4VUp2YjAxenZFY1kvR2Yv?=
 =?utf-8?B?bG5sS1FabGtGNC9SeHh4bTZqNVlaZTViWTVTREUxRXJCS21tcE1iS2RCRFR6?=
 =?utf-8?B?YjMrWXdOT2pBM2xVZGI4cFArbVlzSGxIWXVNYjJCN01ac2V6UUtYWHZQUFJR?=
 =?utf-8?B?WC8ydS9kNTg3OVJ4VlBHWnFNV0xkOUtaL0VJaXFEaCtHdXp0bkZITG1qdWht?=
 =?utf-8?B?VVZPSWZ5cW5PNHhNSXQ2b0hGYk81Ny9hbm03NjA5ZFQ1SW9UTkRYSVRGcGpV?=
 =?utf-8?B?NGlHSjE4WXl6OXZKTGlxOEFkWktTd1FzaFVTd2NwQ3V4b3NWWDJwVFVhRDBY?=
 =?utf-8?B?amxBdnJ5UkR3NzFFcEMybkVvMmxxdW9lcy9UT3l5RDRRYk11R1dYZzdWQkhv?=
 =?utf-8?B?QmRlZVdMMCs5Q2VMVGx6R2MzakhXQWk3c0o3bkwrSERHYUFQZVg2WXU1eWk2?=
 =?utf-8?B?ajJJK1pYam5UdVZ0bnNtNmJGTVZZM0NtZDVGT1dhV0l3ZXFCZ2d3d3pCTmJU?=
 =?utf-8?B?VVhUQ2tmdllFZ1hJeDFsL1MxamJMQ2FRelJBNVR2cE1kYkh2Ly83ZkxNdk42?=
 =?utf-8?B?OWdDeWVXaUlWbTUxZlc1RGUycStmT2RacUFFSCs1czhOR0tid0l5S0o1dnVE?=
 =?utf-8?B?Yklza0hNY3JzK3RXSHMvZkpMbWpCcmx2aVNnU3BTbnlmb0dJYUdoT0MwZDhj?=
 =?utf-8?B?L2k5YmtGOWhnOFFQZG1CajRlT1ozUG9FTUxuMVlpYjJ1a2RiaGpaRENoQU85?=
 =?utf-8?B?ZGd2OElUOXk1S0tqampmL0cwOVJOYXE0TDVRcU8zZ2lYWDFQU2Y3T1lFWDV3?=
 =?utf-8?B?WG1VQ2tZN25WNDhjcWVlTFFlc2svdlhIRWw2bis0OEZxUk1UVENVN2dOVUd1?=
 =?utf-8?B?MnNXVjNZcDZYYVpuKzlQRjZTT0d3VTk3ZGFLNllEU3BRaC9FUWRsYStXWHNn?=
 =?utf-8?B?N1ZVSDlBaldSMXJUWFllM0RKRFhWa1kxdUZXNUpsdDVQNU16Nmh1TWU4QXg5?=
 =?utf-8?B?Ymp4bHRvOStxbEJqNm42Wi9ZRVEwUG4xemlib3d5eVdjWEpwc2RHQXVST1FV?=
 =?utf-8?B?THBXVCthUjhuTTJwTWJHeVVQNHpxeHdndGYybXh3dlBYZm1BRzJQWndUTStr?=
 =?utf-8?B?R3JHK21sVEY1MnNhQ3JYcjVHN2x1VzR4cjl5NEg0cUc1NjJLKzdnNjZyR01K?=
 =?utf-8?B?MkdvTlBQZTVhUWJUVWd0K2NTMXkvWlBXUGNBaXp6MU00aUpyNEM5M20rN3BG?=
 =?utf-8?B?dkt3ZTBaSmxvdENid291aVpTZjhGZ000K1pZa3lkbUx6UktlcHVUVzVXYjV1?=
 =?utf-8?B?b1IwZk55eGdqL3ZtRmlIOFcwcWkzbCtLbEFTTk5iUTJUZlZKTXVIaTlQU3Z0?=
 =?utf-8?B?MmZ0ekdaK3Q3UE56OGpscVdFWTJBMm11S3U5RG05ZVl1bWl2R1Z4RTFrQjNO?=
 =?utf-8?B?bWlVZXZzM25UdDduYlJQRjdLOVlFS3NybTZpMDJGSlQrQys0NEVvcmZaT0Vn?=
 =?utf-8?B?aDJtckg4M1hHYW83UnE3cnFzekM4cnpPL0hEK1JpWEFmVEcrajJtamU5bUds?=
 =?utf-8?B?VU1aem9meFNhd05taXhLcHEzK0pyeWhveVpKV2tOQ0RqM2NESC9nclp6YkpT?=
 =?utf-8?B?RHptMktkSTBSR0lOdnZsTGFHWmZWNkt3ajNvYm5CeVJZWGpUOGFNT3FtTWpG?=
 =?utf-8?B?M2c4SEdMQU43SkRSY3BlUzRheUJKb2kxbm4rRzR2VFhFS3IwK3VwR3lER1po?=
 =?utf-8?Q?o8GpwLSctRRInEgPuJgKGm+x/5NBI7RnAj9RYzh1qp4M?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026)(13003099007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 16:19:59.9596
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c52d0eea-5d57-4545-3c90-08de59d21737
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB6521
X-Proofpoint-GUID: v9kMd9vIeLxzr8s_gOH4FCiM3dST0SBS
X-Proofpoint-ORIG-GUID: v9kMd9vIeLxzr8s_gOH4FCiM3dST0SBS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDEyNSBTYWx0ZWRfX0OzQY9jlhEX+
 ppoVEMY7wcHnBryfMvMKj8gN3VHoL5aQEuseQWsRK835gun6sJbyC+YTb3yItMN1dyzTlzzP0hv
 y70aUIBW8+Unsc1eAjzKL6hu55sgemQNwG/66anzKt6ZgsDwpJGMAVLcFRf6M8IicE0NxmQgRVm
 3MCTye2QtYiToc3YsjKFi6dNtVVpB5GSfEQ1Bz0R59WWCTpjuN9ADkh/WpdGJ3GK47Yiyq4blNk
 21S7YvNX8RQ4xVxjtdmh4hNMWrqDhfn+VSM0MHTq51eLZ8fSy4l5Rgc12vkauvN+7KtLgrAind0
 XhK58QRXfLXgycNI1LQpNbc/QkcjPjb0eal4ltkC+RlCkoshwaHDUevPc4ipdJ9Jdqjj/NcM17u
 tV8BNZM0u/GJjSlNGDBLxHlO+RepAaZAOhMizvrlTGCasVE6BnvQMPdosNrzzRw75SYrhjpPfY5
 n/PnBmMXPhLJmYCbTRw==
X-Authority-Analysis: v=2.4 cv=F/Rat6hN c=1 sm=1 tr=0 ts=69724e3b cx=c_pps
 a=RSP5wjQe9cmB1/5ZhXI0tA==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=8b9GpE9nAAAA:8
 a=nQXd0E9VhXsRxXXh0-wA:9 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22
 a=T3LWEMljR5ZiDmsYVIUa:22
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30937-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,2.252.95.176:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,foss.st.com:mid,foss.st.com:dkim,2.252.41.0:email];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 582536A2E7
X-Rspamd-Action: no action

Document the stm32 debug bus. The debug bus is responsible for
checking the debug sub-system accessibility before probing any related
drivers.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 .../bindings/bus/st,stm32mp131-dbg-bus.yaml        | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
new file mode 100644
index 000000000000..57f01d301e75
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
@@ -0,0 +1,77 @@
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
+  ranges: true
+
+  reg:
+    maxItems: 1
+
+  "#access-controller-cells":
+    const: 1
+    description:
+      Contains the debug profile necessary to access the peripheral.
+
+patternProperties:
+  "^.*@[0-9a-f]+$":
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
+      cs_cti_trace: cti@50094000 {
+        compatible = "arm,coresight-cti", "arm,primecell";
+        reg = <0x50094000 0x1000>;
+        clocks = <&rcc CK_DBG>;
+        clock-names = "apb_pclk";
+        access-controllers = <&dbg_bus 0>;
+      };
+    };

-- 
2.43.0


