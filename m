Return-Path: <linux-gpio+bounces-30862-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oO5kOZ3LcGkOaAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30862-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 13:50:37 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 702FC57141
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 13:50:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0C53C647563
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 12:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21E7E30DEA6;
	Wed, 21 Jan 2026 12:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="cvhICBPn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230F929DB88;
	Wed, 21 Jan 2026 12:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768999090; cv=fail; b=RR1bPmaRbdsYhd37v4Wi2OWlXQ+0KvP9u/tc0pWGtkaHop+EWLxszJF6Oz9rP0eflfe4RA1kXvuVH+J2XAY/Aoyex7E5NCAh3N9DrnEneSk8MqA1Yh6G739wJewh2r18EJaloJIyyRIQevb0Sb8E7Z3jGy2k1mnK9UoIr+FOWYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768999090; c=relaxed/simple;
	bh=ioy0+3FF7QhFQeInyzlQQC0YpF84Z2hqHUsncFcgBUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=qSJRIqTBcP0WetKca24hJwVHVCGEaoYgEkRkezhsSlVPcFj8Ejf5CGSy6PB0MLHvtT2i8NLSGp0ayvkWKqxOubIPn6WlPGk8f9smk78TuXXOBJFsUjpOuACIg90jl8snCG1W8EKkepP0q54g8iF2fe2GlCTka2AsPuPjSs4Q6bw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=cvhICBPn; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LCSN9J2310384;
	Wed, 21 Jan 2026 13:36:53 +0100
Received: from pa4pr04cu001.outbound.protection.outlook.com (mail-francecentralazon11013020.outbound.protection.outlook.com [40.107.162.20])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4btca6btc2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Jan 2026 13:36:53 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sNqXhuaEKa963TW0xN8NvTZW0nW7/Mkg1oTnpUOl5X9U1IH5oUQMaKIpSXAJje+/ngnAOn6rDcZG9tkbbjESc37XvBiP7d/o4QVG0+C8cEuFI5shNfPOV0tIk44FK3eG5G1EiGK3eXqBth4/S75mkDFXdUKE2xG9dgZfhky/ySdxuq2ZVobNIAiZLQFZtOIiPfZY9sV497XQmMkBc9wpJMNRvQyBtNVtICP4YKcqGOkRI6F2VdOL7QuPV+kL5d0pl3Gt9XFaNsQ98mdnS33JtaKxw1EMWr5EZTK/AV5l03yI2yOOXFaavrSgtVhLlPws1vORCWmDN4mPLD9oBYjxmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFR9s3knidTh7f75ywsXqW9oZcytAjSEBTQf3YUrRKY=;
 b=yI2JLZJnXifSjjdCxnf1ReWnhFWSB2T56ZTJNRGnCDTanRSUD2KwL43hkQso6kAX/qy48o8XkGnTsixNOvHKv2oRLAbq4mJkBy7+gdDJmK85oWwWUdVMFwif1pRU85EpcLHd2MGRc0DsMTJvkCycibQO0LIz0ijJ7lLCsA+gUYBjNnDW8ugIuT2wHy7asHzP5PTfgu93q2uh0yo3LgulXeaZnv042zefnGG2dBBj34Hfx7QlVb7ef4/jyM4sAgVj6TCoHmi0RaDbgLzf8OgucswZV/+A3zB4tHOXGVNAD9YKDjq6abCKTtd1KVcBFGL/L3igI7bT7QfvTiLT1W0qGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFR9s3knidTh7f75ywsXqW9oZcytAjSEBTQf3YUrRKY=;
 b=cvhICBPnl+to2MJ6jFPWkcypgjX7U7t5/NNweFyaeLT8Lv/ayLS3Adx13jJIz8Yls/O6Ee+tZh3MJKAfIZXsdNNkD9b0WPtFF1zLWFQsbboi+70uadfRM5hCplUFJsv/VMoCFwmatXa+rD+AG1XFm1yTHfEO6oHX1V8a4ie4bYnuOYddJCAsVf6gJh7jrvmExIZ/lcZR9ZEoYton9urCg0zsy1YUn5QtpDu8/5K1b/NUpCrfkg4g3/Y/nlXnVGWfJfvSvRlyMiuE0tCaUrdwR1oXcu4XLr2CgSlv9tLeBLh6UvK7I0/7s146NzAY6yg/hTOz+xl0n/bxBCkrm7MW7w==
Received: from DU2P250CA0017.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::22)
 by PA1PR10MB9412.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:4fc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 12:36:48 +0000
Received: from DU6PEPF00009529.eurprd02.prod.outlook.com
 (2603:10a6:10:231:cafe::7f) by DU2P250CA0017.outlook.office365.com
 (2603:10a6:10:231::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Wed,
 21 Jan 2026 12:36:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF00009529.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 12:36:48 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 21 Jan
 2026 13:38:08 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 21 Jan
 2026 13:36:47 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Wed, 21 Jan 2026 13:34:46 +0100
Subject: [PATCH v3 12/12] pinctrl: stm32: add firewall checks before
 probing the HDP driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20260121-debug_bus-v3-12-4d32451180d0@foss.st.com>
References: <20260121-debug_bus-v3-0-4d32451180d0@foss.st.com>
In-Reply-To: <20260121-debug_bus-v3-0-4d32451180d0@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF00009529:EE_|PA1PR10MB9412:EE_
X-MS-Office365-Filtering-Correlation-Id: fa8bf8b8-ffb5-4f6f-d1f9-08de58e9bef3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|7416014|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QXBTQXd6bGFkVU9NMml5YTNEcUdXTnJGcnFYMEZBb20zclpURW1JUXBqeE9n?=
 =?utf-8?B?d2ZzOVRKSFgzT3ZVQ3hvbHBhRTNiL2ZacE12bjdlZU1DcFhZenordERjQndo?=
 =?utf-8?B?YlNxUkpBK28zSmpXR1JHd0c2d1pIemJiYzBxckNxMzZ4WC92VTE5N2lqcXNm?=
 =?utf-8?B?WHRzNVNSVjIwamxxRzZPVnh5WHhBMjNKcXE0Z055bkZqOG85eVZ4cXFYMVgx?=
 =?utf-8?B?QjdHMFJCUVZINjVyOXI1UUprWkI3UGFEaEs1aytpOVQvNW9rYXViSU9PRk1z?=
 =?utf-8?B?NHIzbDlnK1YrZ2hxa0RVSlZvL1dEVVo4Q0N1Q1dnRlFTNG82Q3hIQ2R3bWNj?=
 =?utf-8?B?K29yMXhMQ0FKTDNua0R3NWNLNzhHdGhjcHBIVWRjRXFpNmFId2VxQks5RkNP?=
 =?utf-8?B?WERtaS9wY3RRaVdDSGYxV2pEVURTenpzVFJmOHNRbVhyM1MrSnVVWXlhRzBr?=
 =?utf-8?B?Z2hXeW96SUpDaFZ1aUtxK1lMcFYvVEdIVkVhYVdkVm9HcVJoS2dSaFpCd2oz?=
 =?utf-8?B?TkYwMGZiQmI4bHdWNWNuZ3VCOWZOSkNzSkdrVEdCWlh1RSs3aDVNOHBPU0Zy?=
 =?utf-8?B?SnFUUEVaSnZhMFhVa3c0cmQ1a2pLa09ZZlg3OFJBTnJvYXVBZm9lbnBNL0Ft?=
 =?utf-8?B?QVNpUHY1ZEd5Zk5sblVXR2NUR3J2ZlZuVnNVVHZ1QTJQR2hjaEl4aVpLekpY?=
 =?utf-8?B?SG4xa1ZYZVllNmdMNmc0RHNCNHNzWWlldXNFaE9FOWJpcjFzNHdYYWxqOEl6?=
 =?utf-8?B?anlEcnVxKzNLa2VLeEwwblZOdUlheUhTNkhqUjhCV1h4UFQ1ai9BOG9rbElt?=
 =?utf-8?B?MFJoN010aVV5L1hIQjB5blRsSng2ZVNsOEVUWU1jNThhVnhZYXMxSHpIejIy?=
 =?utf-8?B?WGN1ZGhjL29ETzh1UUUxYzhSY0Z5b1QzRHZsMnhDQmptSjhwZkU3SVBZazZu?=
 =?utf-8?B?aFBGWXhGdTRBZlV6aVI4NTRGYlJnbXlvWVZQQVREc1p4SHVtc29CYmJVWnZ6?=
 =?utf-8?B?ME92MFFHWGxDaWJ2MVdManlmRFJ5Q3B3djZ6aitHczA4QlJoUXl0NXI1clJu?=
 =?utf-8?B?NW4wMHFyN0ZlMURGUVRhSVJQcC9GR3ZsUm9UdlVkNUxRN21MWGRvZFNOVlpq?=
 =?utf-8?B?T3lqc01GY3JiQytRRkRVSjg5ZzJuN3RoNWNwN3V5UlJPUzZrSmhrczJsVXVj?=
 =?utf-8?B?a0NtRFo0ZkRJdEtQRENDbU5IblFTNW90a3E3RTYxQWVMNG1yckpvZXI3NjIw?=
 =?utf-8?B?dGRLNGgwcGZmd01CY3BBYTZOaDdLREJyWGd1YjgvdnFRazRrTWlNRXk4NEJv?=
 =?utf-8?B?bGRDUzE2cytWdWREdDRJUEw3OGEzVCt5R2JaSHhiWEpwVm02amhhWVF3UlJn?=
 =?utf-8?B?Z1BGSWVQTFFwN0Y0SVJCUThQUklxallhMlN0WFY3RTQ5enlQcUVIbnJ6T2dy?=
 =?utf-8?B?eWExdkJSOVo2Y3dmT3EyTWloaDh4dzdNTzI1Z2VJd0FJYllHOFZLdzFwWVM4?=
 =?utf-8?B?ek5jSE11T0tZT0dJbDJCM0wrWW80TEJ3YjlCUE5YZWNQS0h2Y3p2cklWMG1W?=
 =?utf-8?B?dllUT1dZaExCWS9WTUJ6YlRKNXhkbFN3ejh0OGF4YU1KbzliRWx3ekoyRFNR?=
 =?utf-8?B?UzkyRktEV0NVRFlycWNIMlZXeC9UWEpRWjQ5dUFkLzJSUkRINmFLUTF5ZHYv?=
 =?utf-8?B?MENuNmw2Vi9ldW82c2ozSTBXUXBVU1NvSGlReHpEeVV3NWJjbDVJL1BlYTlD?=
 =?utf-8?B?eXV2b2Z4WkFPWEtlcVdWVjVrbDRRYVpoQ2t3SnhWOXB5KzZrM3g4Tk93cW5H?=
 =?utf-8?B?QTdkbGlIRkR4ck1ITE1ONTJWRHBQUDFXSFIvOG1INEpzM1NWV1dkcUlJRDFP?=
 =?utf-8?B?MEZKM0xXWm5FOThOTVp2cHA3Tmh0VkpwbXRjSUJnM2UvNlRwN0ZIN25IekJQ?=
 =?utf-8?B?dzVMTnJtZjBZeW15c05qUDNrSEdJeCttc2hya2MxUlZSaHIwaEhIVGt5NCti?=
 =?utf-8?B?RERHMTBqckppU09mTHZIbFZOZS9MMHBwUEdlOUJUbks5bDgvalNRcXV3L3lj?=
 =?utf-8?B?TkRicTBsUU1VdjdNMlNVRzk0TVdMdktOdWVnTm03cE5FM1hQa0pvVFA4cmxo?=
 =?utf-8?B?aW9BNTRvVitwZFAvR1Y4MkV4QkFRUnRBSDE5YmZHTTJISlc4c3M2UGlMOWtU?=
 =?utf-8?B?UDNUejVtUjhtQVRUT2hwV3lyaTBDbDQ2b1JOemx2MVdMeWRUcWIrREV1OXcv?=
 =?utf-8?Q?16mhcAX/YFI+9XikdqLVzH+3d1pzC4WLXpOM6iKSXQ=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 12:36:48.6391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa8bf8b8-ffb5-4f6f-d1f9-08de58e9bef3
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009529.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB9412
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDEwNSBTYWx0ZWRfX79GDV8RorHro
 AJAlaBFN+BpLqyNhiJYQ3ixB3QKy6WDkJ+D1rWK7db0PleD+S1ydJS14xFBckRgFV7FolbuHxqD
 dxRATromr8MG2skjqT38f/Qp7n//MJ7PjXg32vzYYS+1LYDgHDELN/b90i3w3E3xvTJMjWyB8C8
 kaCKxb5ZmOmDvfAGIsB1rXVNQ6TbUd0uOau0FabiV0spYGVSW2OPRSi0YWom4Rt0Meo+1qBLqkz
 CotoLNNX5LXlOgmXJEsV+UAmXnu1bm0VdGusbTjplhXQFKWrc2jh+P4FsY996NzQ1UxQ9tcog1D
 ai/MYIeYzcozw+8oy4DgffXRo7rSHV5GcpcT761RVpKn9pDVP2GeatDGDZmrkjtHRTR9n0WfKnp
 HxuvStf30tW/BHp4i2zbCL5yn6vfeFI46rwMo4ESmL6Nxf0KzoQPg+MIOWvnCbEQ8R/Cd+tpIW9
 frhxGuqHPHpnsW9NdlQ==
X-Proofpoint-GUID: 8GSg-JxVck7afFgS6qkqaTkbyYeJB4Hr
X-Authority-Analysis: v=2.4 cv=dZqNHHXe c=1 sm=1 tr=0 ts=6970c865 cx=c_pps
 a=KLgfLrvyo2JQOIzkxevRWw==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=prQzqxCaf5vTWlbXWNoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: 8GSg-JxVck7afFgS6qkqaTkbyYeJB4Hr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210105
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-30862-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,st.com:email,foss.st.com:mid,foss.st.com:dkim];
	DKIM_TRACE(0.00)[foss.st.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[foss.st.com,none];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 702FC57141
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Because the HDP peripheral both depends on debug and firewall
configuration, when CONFIG_STM32_FIREWALL is present, use the
stm32 firewall framework to be able to check these configuration against
the relevant controllers.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
index 0b1dff01e04c..cce477e86ef9 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
@@ -4,6 +4,7 @@
  * Author: Clément Le Goffic <clement.legoffic@foss.st.com> for STMicroelectronics.
  */
 #include <linux/bits.h>
+#include <linux/bus/stm32_firewall_device.h>
 #include <linux/clk.h>
 #include <linux/gpio/driver.h>
 #include <linux/gpio/generic.h>
@@ -46,9 +47,11 @@ struct stm32_hdp {
 	void __iomem *base;
 	struct clk *clk;
 	struct pinctrl_dev *pctl_dev;
+	struct stm32_firewall *firewall;
 	struct gpio_generic_chip gpio_chip;
 	u32 mux_conf;
 	u32 gposet_conf;
+	int nb_firewall_entries;
 	const char * const *func_name;
 };
 
@@ -615,6 +618,13 @@ static int stm32_hdp_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	hdp->dev = dev;
 
+	if (IS_ENABLED(CONFIG_STM32_FIREWALL)) {
+		err = stm32_firewall_get_grant_all_access(dev, &hdp->firewall,
+							  &hdp->nb_firewall_entries);
+		if (err)
+			return err;
+	}
+
 	platform_set_drvdata(pdev, hdp);
 
 	hdp->base = devm_platform_ioremap_resource(pdev, 0);
@@ -670,8 +680,12 @@ static int stm32_hdp_probe(struct platform_device *pdev)
 static void stm32_hdp_remove(struct platform_device *pdev)
 {
 	struct stm32_hdp *hdp = platform_get_drvdata(pdev);
+	int i;
 
 	writel_relaxed(HDP_CTRL_DISABLE, hdp->base + HDP_CTRL);
+
+	for (i = 0; i < hdp->nb_firewall_entries; i++)
+		stm32_firewall_release_access(&hdp->firewall[i]);
 }
 
 static int stm32_hdp_suspend(struct device *dev)

-- 
2.43.0


