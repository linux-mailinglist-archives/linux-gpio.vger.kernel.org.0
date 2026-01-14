Return-Path: <linux-gpio+bounces-30531-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A01D1E0DB
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 11:30:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 68BDB300AC90
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 10:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80FCC38B7C8;
	Wed, 14 Jan 2026 10:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="owFxQGxc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B222138A9B9;
	Wed, 14 Jan 2026 10:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768386643; cv=fail; b=V1QSn27OYFS6g1o4q2YSg+1vtstXSChhnJcxxmmVdfwKc+VYZWXm0w0idyRrvAv5z/uE+tpNJmjC2GxKZoz/uy2BrgCShDPuIRsdlXZ6QJk6ERUsnzuLtRSb4mmp39x/WqmZi9IfzcqCzt4nP7TruTrciJIbZ4umi3W1wH8wOgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768386643; c=relaxed/simple;
	bh=ZaT2AuuGI/tW+bs/3INAx++P3p/pTbyh99z2D+oNgDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=sYoEQeK4iU3+1jhR/68k/MOHZ4zt7yHomEzLBZYCcuA/mFIm8wzSKfLW7g8QKfJzcz3hT7wx695WJUz7ZWc16IHFpUUY9uiIjWKz9yz94c104IwmGrxuEIygyOlY6osRfUSs93hlhBsBeIatOxccGiYTPpMKHcsLi1o0kFTxj2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=owFxQGxc; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EAKf8g657628;
	Wed, 14 Jan 2026 11:30:20 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com (mail-northeuropeazon11011011.outbound.protection.outlook.com [52.101.65.11])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bnrw7367k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 11:30:19 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CWQyycmrXmTf6f03MedvFpMYQNQYFn65VPoVW7SzzU2Zh8WUxC3aYhPjSagja8pfvApFnIzxDG37I8JxziBpymYPawN2NzupYIU1QVVIQLYp/FI0AIYf8WXt6MM7xzWJDapxdTvZkrhEyY0QlKkOJqQWWBwnd0fmPqTIbVoOFzCEO2CekulwCpW6UlaJatmpkwXblX3IUj0FIoikZQCj+/b23oQRunumrpLVyqNpydBMn2bSBt6b2WyyAw2t2rDZFnxyQqV7i7BuRIUe8QwKZHj4XGPu+fco6+CWsVSWF4/fXTz8pjsOLIg6fBXrqnYZjl3RMFAYswGvnnp14FsaIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97StyA7s2V+FwBdy7a0SiKzK3pkvy3JTCjITsQJc73Q=;
 b=UQR23YouqrTeM9Vo5FmbWsUA4l+RCd+QooaH7n7qNVl64p8R+KvxauHpAagKMHrZ8VBMxXWLztjcpQaOYcX5GsPI6SCwbnnonJeejsjTjaUuFtqqInhdgBsf4ds09fH4K7Zs3gtJxguxXIBYRaBRlELAMtleiY/iPkepUpf0zzNnIFdpj6CDsWF1QxYkvY24Vn5QwUd2Ul/b5U7htkTlmHwWkDqrndcXe+GRDGO8cQnsyF9zD+GRmK4Jm1PqMYX8J5AjVG4Q0VAQgwEi6byENUis39Jc7DchcTsx0uQqO0WK8RsGHYWmBwvvn4zd6v0sgdXDaBnufV7HfvJztyp/VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97StyA7s2V+FwBdy7a0SiKzK3pkvy3JTCjITsQJc73Q=;
 b=owFxQGxc2dJnjuQwLnmpqPCsNaVLxQ7NM/OjWGBByfkgHFhXnn9FhEEizc48cfOGXqNKqHg60oidZWDMXiEjptthwaCvpp1SjgkOUH5Jr2691RYbpkGe+7EAtKPTpp/B3dxvPNZN1Pisk5XQ+Ax2ghPb+pDpM2gobfyD453TDc5sOZPp6BdLE+h12ZJOSmvcT+cqMsPDYNcNVwAin3xKOHFxMctDJss9dp79zA0sU7y4YGh96qRVnIK45k62Zhq3sJmTPZ2lR2e1u25/3cVvuBmGI9HPzy2Q96cTQLRDglUywgK7ekeIgkqBIScdlObc5sGokbhy8stFjWxTIb0M0g==
Received: from DUZPR01CA0330.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::26) by AS8PR10MB7798.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:63c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 10:30:17 +0000
Received: from DB5PEPF00014B8E.eurprd02.prod.outlook.com
 (2603:10a6:10:4ba:cafe::91) by DUZPR01CA0330.outlook.office365.com
 (2603:10a6:10:4ba::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.5 via Frontend Transport; Wed,
 14 Jan 2026 10:30:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB5PEPF00014B8E.mail.protection.outlook.com (10.167.8.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 14 Jan 2026 10:30:16 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 14 Jan
 2026 11:31:32 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 14 Jan
 2026 11:30:15 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Wed, 14 Jan 2026 11:29:17 +0100
Subject: [PATCH v2 03/11] dt-bindings: bus: document the stm32 debug bus
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260114-debug_bus-v2-3-5475c7841569@foss.st.com>
References: <20260114-debug_bus-v2-0-5475c7841569@foss.st.com>
In-Reply-To: <20260114-debug_bus-v2-0-5475c7841569@foss.st.com>
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
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8E:EE_|AS8PR10MB7798:EE_
X-MS-Office365-Filtering-Correlation-Id: d85637f6-20fc-484e-bba2-08de5357e8f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|82310400026|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WmRMQ1MzNFNHbHF4RGpEUzRZaXAxKzdDc3k3aG1va3Yza2ZrOW55dWxWK0kv?=
 =?utf-8?B?b2NXS1M4d2NNZ2N2MUJWTE42NEptSHFDcVRFWTZGbzlTTVNKMU4xZVNUTUI4?=
 =?utf-8?B?V3JCUFpiKzRScjJ1eTlyazR5MlJ5OEtsQ2hGWW9ZaW9GTzhlbm5PQVhxUkNi?=
 =?utf-8?B?WTZDR0x6dSt3OWliYzFhbkhpcUw2anBHQ21VYTBQSURHaHdHbWpNZGlmay8z?=
 =?utf-8?B?UXo3NkNtK0JBSVJreHUzQjE3TS9kYlRNaUl6Z2JaL0kvMDJSWHljUUF5M2pQ?=
 =?utf-8?B?VkgvRnF3YnZ4UUR5Ymw1NXoxOWI1NnNXRjZRQVVWeGdGZGlRVXpiNGdYVHNr?=
 =?utf-8?B?aWEzb1MwTHZXZDQvQ09iZFpzaXdxOTZCTzVlY05ENE9ZR0lLK2theDdTR3hx?=
 =?utf-8?B?SExlbm1mOVc3cVRwVXlZZndEKzl2MjZFcVByeXVVWTVScEVkMGpBVVoweUdS?=
 =?utf-8?B?OXduYkVKRlBvMWZVOFVrWlNpS1hnbjh3ODlpTFE1UFZqNmhkYkxnMklaUHNy?=
 =?utf-8?B?dmkvd2lnc20wN25UYmpIMUZHejhpQmQrZUZ3aFFPeXZTT2xZNlk5TDVmS05M?=
 =?utf-8?B?MEJnZ29pSGFFUDRZbytKMC80Mi9tb0lveTNQT2o2MFpNdVNoeTRnZmJzUFla?=
 =?utf-8?B?b3pQaHFoKzk4K0dxazgra09TQVZZazF4NmtPWXpSZCtlcDcwcEZjVUVnSzAr?=
 =?utf-8?B?MjZwVlN4MVdnQ2RLb3FIYkt1UFBCOFBoR0NEMW4yb3g1Ni9WaWQydjFGUUYz?=
 =?utf-8?B?MC80Q2x3NzZ2K1dhRG15NEo0Ylg1YkEwSHVaU2dibXZ5VUM5SEt1V1cvejI0?=
 =?utf-8?B?YUFZTGlDVXpnbXNQZUxNWHMzZE1BNElPQ3J2SWx3TEh1TDEwVDVsSXhGU0V1?=
 =?utf-8?B?N0E3c1NjVTVLVEx4b1VpMVZIVW1SNE9pY1o2T2pTM0RGMTFxVy82VHZsZEhq?=
 =?utf-8?B?VVlXNk5wTHBQaHo0ekxaUmczVFZBaHpmWmZmZC9qMk5RaU9yTlVRcVNnTU9j?=
 =?utf-8?B?VlNaZ29yNlNNY3VZcHFicDRlblVkM3pIWU9LS0M3SEVISGFoUWFtaEJPYXVy?=
 =?utf-8?B?dEJIMTU0aFg0MENsbS9udDBFSy9sK0hvVlFWcEJGVW9PMWRneUFsN2s3Y0x1?=
 =?utf-8?B?aDZkS05BVDJpQmFDQzVLcnpYZWJBYytxRHJVS2k2RjhGWlJicldxcVlDbVI3?=
 =?utf-8?B?eUhCdGtBZjFJbFJmbmtaMmFnNzdJaVRSVHA4c1owYjRZRitGMWFtSlZXQVFI?=
 =?utf-8?B?b01yK2hxckxwOTI3bzFuc0x6RVB6b0FORGlmelg5b1dic0dzczB2TVhrcnl4?=
 =?utf-8?B?RTFPcFpURXR3RW0yeXVyTGxtbW13QnUxaWh6MW9YWDNtS1RBYVYvbDV1QnBM?=
 =?utf-8?B?cG52NnNMRHkxU3NvOVJmVlNtcGNCS2s2TkRyQlhaNGxRZC9yZmU0Tm9GWmM5?=
 =?utf-8?B?WmJ1OG44NWx2VjNkU2Z0UEtyZERnajcxbS9iTFg2SjJuck5nQ0NuTzlER3Bl?=
 =?utf-8?B?M0RQbUt0WGhHVnQ5TE9OeVRvWEhVWkZPdUVsWEpiVStPbTNxY2EzNGJDV2Q3?=
 =?utf-8?B?WGdSR05iUUZiWGxVQmFyM1Z3WmMvT244QmVBY1lRK1lEVncveHFDV3dZOFZj?=
 =?utf-8?B?MUovblpST2ViTXp5Q3VqWndKNE5xbTZKWUFQSytCRUN6VGY2eFpwMHU2QUJR?=
 =?utf-8?B?YXFWQXBlM2REeWRBcC9ORFpJWjhQU0JRMHhLcDNkMHZmRHI0NEo5NmJFYnFu?=
 =?utf-8?B?c2p3WjFWMG1OTDN1b1BNVTBuZ1lpYnQzdzFYQzBpSUxQbUZNMjdjZ1RmT1l0?=
 =?utf-8?B?a1FodVpkbzRRT1NCMXhhWURidU90R2tZWUVzMS9tSXpPZ2ZqQ3MySW85Sjlo?=
 =?utf-8?B?QVFPcmVDWEtDalV3aldld0QwZG4zSStWaHJWV3VNcVJGanU5VG14WFQzS0h2?=
 =?utf-8?B?TmJ1ZS9JQUFTM01vT3lhQm43WlZnejJNRUtMMmt3ajVFaklRNU9TUm45VVB4?=
 =?utf-8?B?RkdMd09RSGVTakZqNmp1UGNRUGRsSW9ZNy9zSE1lM0dORXZOMUNVRTZIeFpH?=
 =?utf-8?B?OVFIeldmUFRGbUpGNmFTVHFrQlhmN2hzck8rM0VTaFEra2ZsbmcwN0lVMitC?=
 =?utf-8?B?Ky84dDk5aUJmMm92bFBQQjI3YjdZQm1LalVRenNrbVJYcTI4RzY1QUJtNGdX?=
 =?utf-8?Q?M7rPv01DucQWUAfbYzmR8FhNbSwga0mTUt7Ikael+fT1?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 10:30:16.7965
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d85637f6-20fc-484e-bba2-08de5357e8f9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7798
X-Proofpoint-GUID: kOl_aa5rUqZq6fZbAD7Tg_hSo2qJXwdO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA4NiBTYWx0ZWRfXxJHHONNSvyD2
 lfs20YkIxcPK2oKcDVZ3CYc5HM1nlySv8vMLdckEU4BGv1rcgWsTtSJFgZ/4+8S3J2j7AufWRp7
 DQ1x1uExmQeIM1M1LDH7jqY4QMabAfBkk229GYqIDgbofbpSrP9Mr2MQMyjbjkqDCUxPe5/cjyt
 YN7pbL1OPHeAJVd6B1afdeymOcHWBrwUZE/IWm2IGQ9pZw4a614iPHGAM117vXnQEZrzBW7jlML
 AKcuCViYTbbGIXXnJtTq/ru6G6ipOR45cMy8wxxRrCAlQgdnw+OT+Kf3+Fwhxat9EFwBpH23KPf
 L3zk9bl8N89W/CrOaeOR4gMxvETL8JRSIMVU+aeDICy8fXc9TlfrlZBahKnA2LL9wZfLMOLOFwF
 ThE8Wr4FcmJt98dQblJP3dL9/sxirkxabv3sx7MTDFdM2MHh34duLXduMs43lDUIGKJp96+EVYu
 gROwGcedaK/AJuw15CQ==
X-Authority-Analysis: v=2.4 cv=Sbj6t/Ru c=1 sm=1 tr=0 ts=6967703b cx=c_pps
 a=3vNDBRtW5GZAUHHjSUCJlQ==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=8b9GpE9nAAAA:8
 a=nQXd0E9VhXsRxXXh0-wA:9 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: kOl_aa5rUqZq6fZbAD7Tg_hSo2qJXwdO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140086

Document the stm32 debug bus. The debug bus is responsible for
checking the debug sub-system accessibility before probing any related
drivers.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 .../bindings/bus/st,stm32mp131-dbg-bus.yaml        | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
new file mode 100644
index 000000000000..2db35e41e76c
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
@@ -0,0 +1,79 @@
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
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+
+    dbg_bus: bus@50080000 {
+      compatible = "st,stm32mp131-dbg-bus";
+      reg = <0x50080000 0x3f80000>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+      #access-controller-cells = <1>;
+      ranges;
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


