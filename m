Return-Path: <linux-gpio+bounces-30993-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6A0iARtQc2ncugAAu9opvQ
	(envelope-from <linux-gpio+bounces-30993-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 11:40:27 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B62AF7467E
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 11:40:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8EA653013EC5
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77711357721;
	Fri, 23 Jan 2026 10:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="UsJw4Afv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751781EDA2C;
	Fri, 23 Jan 2026 10:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769164822; cv=fail; b=BOpN2G++i8QjOG1+YTjij+382d6V0P/Ti9jyt3amum1qrdraZpP84dIPBf8hbo7E4QySZaScGzn0A8tvkJyRY1X8l2aKlrR1Slnn/Q3FTeVuHQql7/MGpwbNfcTS9R59N7PJlNlwMy6z6Fk+A9+Z9Zd6ufahsY/wca+yyRXWSto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769164822; c=relaxed/simple;
	bh=kWxnJDYO9AftrrNNS1t08lSBPaz4Xh10odqD9/Zoyuc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=MG022PFhqVqMVjg7OyOpG/A3a/UHSPWVcQE6QFde2IIVWFJAherHbJqvJ9b7J/80CuimzuEfOPPCpDlfvBYTAcPRUfiVCnXBn6pWyFA0KIYiiGIAIMGa/xWBd0d4IJjkFQSqupZ+VSzJuR+pYiywWlrUfGvW72BXMebtSob/TzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=UsJw4Afv; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NAVBBo1686769;
	Fri, 23 Jan 2026 11:40:03 +0100
Received: from pa4pr04cu001.outbound.protection.outlook.com (mail-francecentralazon11013021.outbound.protection.outlook.com [40.107.162.21])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bv1ww1bec-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 11:40:02 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AboKPHcAEtqW9prMCzvFE1/PqgVpgBHkBp3/zDBr1GFfa0MXw6BdM3GMXxhTsnz1CGGXrK7pm/MoTJ3XieA2GSl7OFcBQTicNXOFG0IgN+SF+HFYym57QvwjwDL5f6GWxwibKDVXPM5UJFvN7s4bRLpzlhE1B/f2LnXSnEfWgHDepkd+Npwl2Nn95nE/2xdE2O19zi9inP0dEIj+wE84eq6L+xS6HQtM3ipK+amYk1pMrwZRUnOzAGfwalEuT0Z+1UtZI9+rx3f0XGCCRz9I95Mo90he4wMxVz+/mmEvmv2UZtO/Z3mAyx5kL8HqWO4E3JoY69hsB0WSmaFXRby2Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=srWL9bt58H8X54p4YAG4fjaV9EEKOcR5MTMc7HXPiu0=;
 b=x8ix+3ZL910RKYPv56gN1acDFa8/JF3Aq+IcILRrBZ5/lYUhPVi3PJV2Sd1CeOx79mSqVF0P2YSf4UpXoHyLU48/e9a9qFPYRuzexNZ7sF5STbeIBY3TBdRdNhTVQdZu26lA+7nfnAjFw1uaKP7xvq/DmqWwSOo2TYKF0uGP7qELdzadeWPEYsGAUFUYUgnollgFYnSWHzWkZZXk/5oDZawci2nvQ/uHwSyUDVWEwHgdEp9eiGVo7RdgkAD6QZI4cQejJZQ8h5HpQFXBeS76Bl5iXjHXOqOWIjd4+WOPtXbwdZIDxht+h/tzZ2jIcwp6B2zZh3f7BhLb3adxQFbesQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=srWL9bt58H8X54p4YAG4fjaV9EEKOcR5MTMc7HXPiu0=;
 b=UsJw4Afv35D2PPnKOisxlh6meNxW578v6BnEH7KBdWSOFMxuTE7OLB4cvcLi1TwGWc4Npj5RnXnDbfrSYQqjawv3RPwfHIyGOshVH8vdllkyTVZ9UDs6/wnKocSkXsD171MDilRfuZ7knyZi8VV0pyK6oHRZCo7oip5vxfD/WMzAFmCqzJNh8VN64xJNkmYy0sAXUFTWu9WxgoC2DslbWQ2+tIpN8AU0yidoCDYl2iFCVmZXPD1FbnGDHu+8H3mu2Z8HdHX/m55gqXY05OYRhuTsIoyre0sVl8QcqScNrbmHE2gB6/RyiwSCj6Ip/Eh0/xwdLs3ZvwOwpFiHlDqyTQ==
Received: from DB8P191CA0012.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::22)
 by VI1PR10MB3341.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:13b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 23 Jan
 2026 10:39:57 +0000
Received: from DB5PEPF00014B89.eurprd02.prod.outlook.com
 (2603:10a6:10:130:cafe::62) by DB8P191CA0012.outlook.office365.com
 (2603:10a6:10:130::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Fri,
 23 Jan 2026 10:39:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B89.mail.protection.outlook.com (10.167.8.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 10:39:56 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:41:27 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:39:56 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Fri, 23 Jan 2026 11:38:58 +0100
Subject: [PATCH v5 01/12] dt-bindings: document access-controllers property
 for coresight peripherals
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260123-debug_bus-v5-1-90b670844241@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B89:EE_|VI1PR10MB3341:EE_
X-MS-Office365-Filtering-Correlation-Id: 39ff67b5-e0af-4483-e25d-08de5a6bc06f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NTB1NGRSRXlnUW1tNUpEZ0V0WE1Pb1dnQ2d2aUd3dmRRcE9JbHdVZDVLaElV?=
 =?utf-8?B?VFRiSDBaVmVmTUpMaHZTL2dRV25ydmlON3lsOExVajhOZUlnZTFOakUwUHdL?=
 =?utf-8?B?MDEwQ09LVUYrWDRYcHBBaURzZ2g5aXArRFFjSklYTFo1SWZHSENENk9TeVZi?=
 =?utf-8?B?S3JuSDNEM1NEQjl2Ukh4OTNIdm5GQWdzUVo5VjBBa2tYcFBKNDNEU0tCeUlY?=
 =?utf-8?B?TDk3K2xBNngzL3dkVHF4R0ViWXBWWVJ0cTc4eXp5cVNhWTdkT2ZnUGdZR2Vh?=
 =?utf-8?B?M2tMeVYvNnJyV2VPbS9IOXNaMXlYWkxhUWozb0o4b00yRTgrcXlMbVUrenRm?=
 =?utf-8?B?YzBKQWxkNnVtNVJwUlhPektCYldka0xGdHhpLzNaVWNHbW9hN05iWHp4eGRF?=
 =?utf-8?B?UElEb3JnVXBwLzRkSTl1c1BPUkJmWk5JTmwxMjUvWmZ6VXp2MFhGUHpuMEZK?=
 =?utf-8?B?ZkU4WVJjMmsvd0crM3dsUFJFVXZiRnRzamdVZHlURUdqR095Q09KdEZsSlpQ?=
 =?utf-8?B?S2ZWeTNOVFNTZUlFMjVWakFwdFFOdVd1M3U4N2lrZ25BWE1MMnZ2REFNanA0?=
 =?utf-8?B?M3NRRTk4T0VsTG9kbHIzbE5xdDNnbmNHRVN2eFduamF0RzdOdnRqZVkrU2pL?=
 =?utf-8?B?QXNUZ2hpTUJFKzBrSXlrRFp2eHo5UWptSXZMSEQ1VS9kS2dBRk5hMi9UTnVR?=
 =?utf-8?B?UnBUS1NPWmh3VWp3RjFrSE9qZW85aGJCWU5mM3R4NmlGSFdvL1ZzM1VsVWg3?=
 =?utf-8?B?MFp2bjIrMTI2a2l0R09IdGhUSE8wOVo5VXltMkUyZ3RacDBjQTA4endUSXRi?=
 =?utf-8?B?K09YT3FHZ2NjTi82T2krUnYwVzBQUGFBaTl2bEc0YjVVRHVXOTBVbHpheEJz?=
 =?utf-8?B?OGdyMjFLb2NjZGliQmNXMnZKREhGelI3ZkZxNkRwd2JBbWhNUFdOQXhCWGJJ?=
 =?utf-8?B?NURvRGRsVXlHWFVkUTRBRHBlSzNjYUE1NFNlRWlLK3Jwa1VqUHdxM2ZpTVNB?=
 =?utf-8?B?bjg3aklKc05zc0ZWb1NEdWF4YXB5QW44ZWRhM1NhZ09ucVBaeTY3V1dndzNV?=
 =?utf-8?B?L0l0bTlyYzRrRnBaTWhGa1BzVDl0OVQ2Z2VtbWQ2Qm1Sd29MVCttcGthaVVQ?=
 =?utf-8?B?WmJ3UWkyb2ZFYVdmeC9Za3Y3WlNvbjk5Y09WaDc2Tm1vekNjWjNKNzlHVkVJ?=
 =?utf-8?B?aXVFbi80Wi9ZaVdvR3lxUmJvYXZzYlp0QVRkblo0Z2N1aFRNeDdvZkNHS3VZ?=
 =?utf-8?B?c2U3YVNFSjVlM2FtOU5nVGtIdXpQRFJsRWRlUS9aUVdheFEzMGRKMHk0M2pj?=
 =?utf-8?B?bk9YaFZMQU9kdWRKWlQzSmx3a0ZOMnBZUU9GRGJPNFF3akZ4UmNhQ2ZDc2Ez?=
 =?utf-8?B?bHJNRW12SVU0VnJCak4waGNmTUd2SWtSOGZ4Sis0ODMxM3hyR20zcHVOOHpr?=
 =?utf-8?B?YndUcW5Dcnc4K25ROENFL201YjdvR0N6MXZjOGk2MHZ5ZTE5UmZ0Ni80ckY1?=
 =?utf-8?B?L1FwNU92NzJJV2lBU2hjWjYyQ0hpcHFRSFNUdWhPTElCaC80cEV3R3ozK3pi?=
 =?utf-8?B?anVERGRodDVvUzJSdmt1eHlZclVKL0J1QVZBSVFKRm5QQ3NURmVCU3dBNkNY?=
 =?utf-8?B?WkZXUEhJQUVuTzVKOXFJQVF6VjNQZnZsNU1TRDZOWmFGR1o4dTdHUTVBd2hH?=
 =?utf-8?B?YksxMjRmRnRqTGdDUmRQRGJ3N3IvVmNUSmVxZEZZaHYyZnN3S1ZONTBEbk43?=
 =?utf-8?B?TE5GdndjVm11S0lzTDloNUR6Y3BHRWpnVjZHYUMxMUFhVUJlTzUxd2xPYmZn?=
 =?utf-8?B?bG8yYjFMaE1CQUJkb1czSU5laFNMUXhadVBJUmtnWi9PL0h6eFRHdDgrVmNv?=
 =?utf-8?B?SDNzZGFCeUVnSGlpMVlqTkJiaTIxTTZzOHhpWC9naitqTndCRkVLQ1RiaE5l?=
 =?utf-8?B?WGREWkViZ0tHdytBdjN4NFRVMytITGJXMjRjOFJkWStMNG1UdzAxQUlzcFBN?=
 =?utf-8?B?QWV5TTdHWFY5aGtFN3JZeTRKWVErSGI5WHJTWXIvQStVaXpWbDVPWWxkazFR?=
 =?utf-8?B?bGp6ZVNvNDJPRU9Db014Q1hNL1dVRG5qVDJqOVBrWkNmWGp5bnA2a3o5ZllM?=
 =?utf-8?B?K1Z2Vmh5K3J0REJXbDJRS29OZjBnSWovdWFEVHpLODVCdWxHajV5ZElhS1o2?=
 =?utf-8?B?dDVWTDZaZXoyYmdyYmE1ZEVsdW1BWC8yTjBXN1ZGM0I3TlI2RkVXQVNCMHp2?=
 =?utf-8?Q?q2VBOKIbCTdsjS4u1v3GtXWO4pcMk4kPrNMJuoGbtk=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 10:39:56.8633
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39ff67b5-e0af-4483-e25d-08de5a6bc06f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3341
X-Proofpoint-GUID: bf4bDEgtLo4OEi_lH9rldfUd3ogQhSjW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA4NSBTYWx0ZWRfX0WOWWmMMZ8EP
 4o+mzjCe2z9ppKPaKza14qHoQRv4pvxZGg4ORuEkrldT6d9qJAn9/naM0zltSdEHpNJ/tch1SpS
 dUdihATjX7n+UbD2Z4cjnw65HOOIGunC2GN3fK2KgmCF10okatytzgvsgeKV33lXX+eov3lO3nO
 SotP25yAk0yfLIMTYEogqj61gdJuoTJL9QAgvNUUVFDsmO/sQvV8NoCTExSHNcgxDEs5x1Ujczk
 lAZ9DnzJUT3Skq3b4xn/G0/qjLlclnFDb1mOXKaInjAtzMCkNosxpU39p40rwLf1+sc7fmNqduu
 oe70ZyFVZqBJTXXEWjMbd+GH7a8WBV4iJlALy+CqJNPnq5XqcAbqddj3MM0MYlRgte29SQ9qD0k
 ncjpy011J9tHOg7VHuSmc6sBGKjGoG2kTny1/gzfCGi231O8YTZ9iPLrMbyEws1S6dhucr6Sn3d
 hSl26D0wYISMbH9F3lQ==
X-Proofpoint-ORIG-GUID: bf4bDEgtLo4OEi_lH9rldfUd3ogQhSjW
X-Authority-Analysis: v=2.4 cv=NqLcssdJ c=1 sm=1 tr=0 ts=69735002 cx=c_pps
 a=lY8KjCQ9O7Y0HqcpAT++Bw==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=VwQbUJbxAAAA:8
 a=zA8jFupHd_524mN9yHMA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30993-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,foss.st.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B62AF7467E
X-Rspamd-Action: no action

Document the access-controllers for coresight peripherals in case some
access checks need to be performed to use them.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml           | 3 +++
 .../devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml          | 3 +++
 Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml           | 3 +++
 Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml           | 3 +++
 Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml           | 3 +++
 Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml          | 3 +++
 6 files changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
index 2a91670ccb8c..949444aba1f8 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
@@ -128,6 +128,9 @@ properties:
   "#address-cells":
     const: 1
 
+  access-controllers:
+    maxItems: 1
+
 patternProperties:
   '^trig-conns@([0-9]+)$':
     type: object
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
index b74db15e5f8a..b0693cd46d27 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
@@ -78,6 +78,9 @@ properties:
         description: Output connection to CoreSight Trace bus
         $ref: /schemas/graph.yaml#/properties/port
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
index 71f2e1ed27e5..10ebbbeadf93 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
@@ -118,6 +118,9 @@ properties:
         description: Output connection from the ETM to CoreSight Trace bus.
         $ref: /schemas/graph.yaml#/properties/port
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - clocks
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml
index 378380c3f5aa..f243e76f597f 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml
@@ -73,6 +73,9 @@ properties:
         description: Output connection to the CoreSight Trace bus.
         $ref: /schemas/graph.yaml#/properties/port
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
index 96dd5b5f771a..9dc096698c65 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
@@ -128,6 +128,9 @@ properties:
       - const: tracedata
       - const: metadata
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
index a207f6899e67..29bbc3961fdf 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
@@ -70,6 +70,9 @@ properties:
         description: Input connection from the CoreSight Trace bus.
         $ref: /schemas/graph.yaml#/properties/port
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - reg

-- 
2.43.0


