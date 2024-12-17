Return-Path: <linux-gpio+bounces-13953-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E69659F475B
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 10:24:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8023B16E9B0
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 09:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D0E1DF992;
	Tue, 17 Dec 2024 09:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="UftTmauI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011044.outbound.protection.outlook.com [40.107.74.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BC91D63DB;
	Tue, 17 Dec 2024 09:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734427147; cv=fail; b=iTHpn6v9BGDEn/XswzJ7ZVGBIKDfa2iaFRxcz7OV2wQ7etyLVZfjNMHWgEUvotzS8VqrqkEhcopu4rmweHTZdYfzGhik/8uWHMg+tkZyc+uRGhZx6ntp2EsI2vNFmXYBmjxx29fdQHw9BrYdbGw9ga6btUTx218v89rQATdHd2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734427147; c=relaxed/simple;
	bh=NYFD9WewavYN5dSw1WkWi5xH2ZYokq43rnQxHXtxKhE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tF+i7uJd1b6uYI2Asbo3hBXTVEjqq2aGL8oA38BqgEItI1XjLRU3jXZrPGbDTsjC36DBFtoceal+vPqwiU9zTmZyLqxZmIppaSiR1oIq/6r2EXV/Fk7AJoOqHJMS69O/OmOmzN1h10h1Mp7xeoGgH8Ubv6P2rrqyB3pKfTym95Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=UftTmauI; arc=fail smtp.client-ip=40.107.74.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yH9tC2wrkVH+QqpI+nMC151AWsq5dP81GJmgAlA/PrgIDT48Yh8UmuYA77z75CbZpLYK11tmDaHDcnxxWh3aNjZOFzAnFdj7JIlxoit8km3UMs3Nmc97PHh/qzhrOUX9QwCN5WcfAzTpBqxYeAxLFLid2TwiHOPFy3oMgsaZz7K6u9tk34JWWcP2ZOb+JEMlu59zA9pHcHN2dDSKRnltsbOOTegW0fJmwbI3eh1cQ0yree4ZsUT1ti2rtv68+IrcCh1yI1kzmLkiSVL41g3nNTJxwqJCXkxpSp5vErq1dmBUUQqIO1qJPQ7ZhyB3sUEreOpOOEsAEFaScalw/Izg0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYFD9WewavYN5dSw1WkWi5xH2ZYokq43rnQxHXtxKhE=;
 b=D7FOl8mubKh+PbIF0TSr+C8vrrWlQ2sYQcp9m5FWKT6/qYPgLqWkm9LBMO0N0GNtUOue1p5NXGEaNCdCiUeGr4U0VECAseo7wUaWHYpnpRbgfImhHIA2VbWgNZmvgvd0tsb/t6HzrTUMaQ2Gxbyl1hWaNK2Ue+mbpW325t+aTwBOlQwRbvt6dq890eRoyez17NjXBW2/Xry4byxPY5FHnyMMdIDCBxICBSbwKku8M+18cfUFO1/w6O9h2GAi8JGC1uVZtKwnZDf0MIJHMTZgQJsOZWXcA1ZBLgrGULTh0y4ne539swmvBN1FBlOmJ9nvavH1nIPsOhJcPqHqwXVgkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYFD9WewavYN5dSw1WkWi5xH2ZYokq43rnQxHXtxKhE=;
 b=UftTmauIxxIYS4jIzDhL74ofdkHv/A17qFODWUYEaY5FXsu2iunUtuMNScVw7NCPW+Qihei2cCbbmfM7EQeWPsLCsRFKwlWIbpvEYLLjexD9dwB+GxubERk5NAUmutbzqyFSgdmiAYbyfAw7tMdgiOhWAxhxTnXNjx5Q07AouO4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB10542.jpnprd01.prod.outlook.com (2603:1096:400:303::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 09:19:00 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 09:19:00 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>
CC: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 1/7] dt-bindings: pinctrl: renesas: Add alpha-numerical
 port support for RZ/V2H
Thread-Topic: [PATCH v4 1/7] dt-bindings: pinctrl: renesas: Add
 alpha-numerical port support for RZ/V2H
Thread-Index:
 AQHbT/Q3WD6tdQXPjkGBdqOWiVuV17Lp+scAgAAL3NCAAAomAIAACu5wgAAIWICAAACiUA==
Date: Tue, 17 Dec 2024 09:19:00 +0000
Message-ID:
 <TY3PR01MB1134679D57AA7DDC185BCD3E286042@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241216195325.164212-1-biju.das.jz@bp.renesas.com>
 <20241216195325.164212-2-biju.das.jz@bp.renesas.com>
 <fq3q2tk3xfwd4p72b5wzo3gbfizrknxdt6zyc5ahm2cpnrtsbk@nlukbj3yy57c>
 <TY3PR01MB11346902114D33FA66F4C3BF686042@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <c57d3568-68f4-4e5a-874f-4d9f0cc1f2f3@kernel.org>
 <TY3PR01MB113469F4CE8DB86978C03E3D986042@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <78b28da5-db3f-493e-8159-8bdd565728bb@kernel.org>
In-Reply-To: <78b28da5-db3f-493e-8159-8bdd565728bb@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB10542:EE_
x-ms-office365-filtering-correlation-id: 2b2dad1c-fa46-44f3-87c8-08dd1e7bd791
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OEVjejNsbGVUKytLalhiZ0p6UTE3N3pENE5GZ05scEdocHlMQUlha2JzL1gz?=
 =?utf-8?B?bUJoSjRScUJ0YVRNSkx0T09Jd0ZKeTZtdlk5MVR4ZEVyWDl0QWp3am45NTR2?=
 =?utf-8?B?OGQ0bGkrVW5QYzRVU3k1amJEdm5QbDJ1QjlQalFleHoyelgzRG9Cd2FSbmNv?=
 =?utf-8?B?RlRDRWtwZjNXemllSDlwN1M0d2swejNROWJUU0NMamdXWnFQaDgzYnhaTUFm?=
 =?utf-8?B?UVhsYW9HdkVyMWM0Yk4wVVVKbG5tdGNQM0phRFdsMml5eDR6bjlVb0laeDcz?=
 =?utf-8?B?SHMvK3RhdEpuWTFVeG9yRUlPK0p0QXVkWGJqbllsRjQraXQrbm1WeUViVVgy?=
 =?utf-8?B?Tk50RkxVajRUYXN2TlJXZFl5RUFxRk9IMGxLa3RvMUh0QWlvV2Y3QlQrUlVu?=
 =?utf-8?B?Mk95QTdRTnA5bGRuOGpFaER5elVXNUZFT1VpWUdlc0lodkRhUDk3b2xVVktN?=
 =?utf-8?B?dnV0SXg3U3JBaDJFZzJZdldaTE9LMXpLSXZ4azY4eVo2Y0d5bllOL2wzalVu?=
 =?utf-8?B?VXU1c2NObktWOUFUM3phVzhHdjY3eUs2bjJnRHNnWHMwZTZwVFdCeWpaZXgv?=
 =?utf-8?B?R1lYMDJZWFNQclpzVWJLRldoL29UM0JQVmRJZmJndGN0dXNLUmsrSUJ2TEt4?=
 =?utf-8?B?SjR2N2k5VnpOdEdiR3VtTDJSQ1psY0V5Y2E1K0VIRWREM3FzSitnNVprbGlY?=
 =?utf-8?B?dWVrR1praFNRT0ZDZkxVOVFXZFJGRFVhWTVNUElESyt2ZjBuSUNBZXVEVW43?=
 =?utf-8?B?N2lTeUFreTNzMXlvK1IyV285S05jV004VUpmMU00NHJWcFlHbkU2TnNreUpZ?=
 =?utf-8?B?dm5jWDd3bFkzeUJMTXFiS2VIVlFqeVVwQXdsVnl2czZ0b01IYkp0aXhKNlQ2?=
 =?utf-8?B?OGg3T1hrNGV6MW53b2F5RkYxWkVVQlM5Sjg1a01PcXVDcnFQWHMzMG1rbktE?=
 =?utf-8?B?UU9PWFRCa0dpbDEzYkE3SlNmdExYSFFKWjJCZk9sWWVDWFVXMVNDVDJRaEpj?=
 =?utf-8?B?ZVVyZTFXUEJaaHZYZWY4eGIrNUNSUjFtZFJMQ2VKellwU0cxUlFVS3hqclVB?=
 =?utf-8?B?cUY4RmtnV3ROQVNzNXRudk94cW0yeE8zeEpLcE1Yd2NaWWM3QzBaZy84Vnlk?=
 =?utf-8?B?UlpORkFYZkJuNHk0VmZ3T0VTNXo3QXRCRmlGNjR4RkJsVFNSb0pTSVJDbXZz?=
 =?utf-8?B?OTJacHkyZG9JY2s3SEJVOG1YWUNZZmcwSStqQ2RtQ2pUMUMxbjVLQisvUy9a?=
 =?utf-8?B?L2lGRnZzV0ZUUXJ4QjR5dDY1WTkreWxTazJ0d3dYVkxiMFlnUDlreEpOTitG?=
 =?utf-8?B?SDlRWk80bldHYmNFcHJuS1Y3NEZzOVUvQTgwem9ZNXo5K1RwMFI2YXRXYlFB?=
 =?utf-8?B?VUN6T0s2UmVyNmFaT2l0c1Y1cjFXOTBPNkxEWWpqZFAyUW5wbDlNZnZhT1Rm?=
 =?utf-8?B?bGdoakFOZU5vb2ZUYlVuNkd5Y2ZldjRybC9DOWlUZC9yMUJYcjhnV0FleFB4?=
 =?utf-8?B?ZzAwRlNjUWJIRnp0cDNHRjZ0aUkxVzh3S203UDhWZXVKWTU4c295ZnZNVUhl?=
 =?utf-8?B?NjlNMWtnNEcvK0Z4NjNqTXRGcDFwZ2ZDa2lJRjB2d3NtQVFybko3Q0F0ZVVq?=
 =?utf-8?B?WTNuOVFuVWlHVFN3NmRXRnpxS1B4Nnp2SXBGcU5KelJYNzAyY292N0JYY1Nr?=
 =?utf-8?B?UFUvbWRYbmNIbzFkQXBQck1kbmtTazU2MkV2Q1pIVHQ3RUx2L0tUd2Z2RENH?=
 =?utf-8?B?VUp4dzgwY3BkMEgvYWZtajBxcVV0enNuNWZGL3lBMGlMRTNSenJQNVpxam1E?=
 =?utf-8?B?ajRjQlhBKzNNWUI3TGFoUUZ0ZTJ2Z21Pd0thRXI0SGZFd0hBTjFjd0ZsQ1hl?=
 =?utf-8?B?TFhaSlV0UUY2UzNOekNNak03M3htTmFwV0FxNkxTSmErNUFCWVVGR2xpSS93?=
 =?utf-8?Q?I6Uv5ULyyqZh51EW6xE0EfF/3/wUy57V?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R2JPSlhEdVNoTkoxQzFoWXlWSXdlNTh1bWR4aCtBVmpZSitySzRDUVlmeG90?=
 =?utf-8?B?WmJuQWQ0VVNMbFErdWgvYUFRMWxxSzZ6ZDJxQWtqa0U1NkZvUGQ5VTV3Mmkv?=
 =?utf-8?B?UWJiMmFSNXk4YVRtTzBTTnlnS01YSHFzQm9ENHdsVVJZNlc0M0V5dXhZV1pT?=
 =?utf-8?B?TXo5VlNhRmk5eXgzZ3VIQWhLS0dJWFkyRk5qcmdWSENudHQ5N1ovdlVDTzBW?=
 =?utf-8?B?aHYyRUdwZWRKdFVSb2dNL0JNSm1pOW9uR085WGk2b3NjY0kraVNwL0hMRkhh?=
 =?utf-8?B?ajNnUUx6STZsQUQ4QVphRC9nUG96WDZNTXBOajFoUytjN2IrMzJUbVRwRlZC?=
 =?utf-8?B?ejh5dzZSZUk4b053NnJIZ1BNaUNyL2lqNkMwZnZZUldvRDM1cU84WTlvcjNs?=
 =?utf-8?B?VWx3d05HTFRWQUpzeGtyeTFjdDN0Y2diL0tiUG1JOUE0Z0NzQVFzUVhpUVo3?=
 =?utf-8?B?VkNrYVhsMVM4MVVBZk1jVlhVVE02REhhR3lycGNTeTM0eEd2MHJFcXVNQlE3?=
 =?utf-8?B?Unpja2R0bXJGMGNTcWZDTDJ3M0hXcWMxZ0F1aCs3eEpJVnBCa1U5a0pob0xr?=
 =?utf-8?B?azhVRWFxendmRkQ2WG1GMmZ3cXdjQkVVTjVGdHJkOXFjRXpiaTBOVUR3S3kz?=
 =?utf-8?B?VndwYTI5SG1KdnVsRU9kVFJpTmFFazB1R2krWnBjTVIyeWhLTFNmc3BvcnFY?=
 =?utf-8?B?SlFKR3dLcDdURWR1djBwRWMrdDJxL2JmTndqSmdSY0l3M25VN3Z0Y25YS2kr?=
 =?utf-8?B?Q1FxQU1ubU9IZTJjVUdEanFZditwcXYxbDdNV09xQ3F2SVFrU0dvZWgwTXpk?=
 =?utf-8?B?TDNKMWtNWU5zdk4vRVhObTdNUVpseUJ6aThDdE16N2dnOGMxUlVHT1Q2SVcw?=
 =?utf-8?B?MmNiS3ZFQjRYTzBnVHV3YUZNZWwyUDM3ejh1Q2p0cU03WkV0L3BMTHhFK3lx?=
 =?utf-8?B?aURGVURoeGdPQXc4bTEzMlg0TFI5RDBVY1oyVlBROFlXSHNjSzRHWW9aZ3Qx?=
 =?utf-8?B?VmQ3MHFtYy8rZ1JlT3FTM3c0WGszUS83R2V5Mm5Qc21FTmszYTBicEVZNnU4?=
 =?utf-8?B?Ylh1bEc2Y0gyamlLSWN4ZXdLa1hscjgwcVJab2hHRXF5M2N0SXN0NlJrNGJz?=
 =?utf-8?B?U2Zoa2ZMMXNTamJYQkRiRlBPL1k4TzFvM2xMNjI3a0ZuK3BPSzFGTW4ranpL?=
 =?utf-8?B?QkRBYm03LzhoZTBkTFJaVVk2WUI1b0VPTnpsTkc4ZDBnR0dwdXpCanYvSVJr?=
 =?utf-8?B?b2c4ZHFmNHdKUWxZbFNpbmI2bkc2MEdraUIwb2ZUZG1pTVNkbXluaDV1cXl1?=
 =?utf-8?B?S0lCcHhSNjhQblZtTEJGc1pmaENsdXhZTTQ2OUFRNW9ETjV3bGZ5ZUlWSmZ5?=
 =?utf-8?B?RW8zeXN0NkloQkNNbGI5Ny8xZlRhbUgydXEyc1I1MjFUeGs5US9WL1l5bC9D?=
 =?utf-8?B?Tk9NNVBFa2l0UDNGcGFYZC9lanphN3gwbUNZQ3VNOERBaVRCaW84YzFyYzNH?=
 =?utf-8?B?NWRIQURqWmpnbWxEbGlIb2NSVVprV2Vna3RZTzNXbnRtb3ZpWWx3QW9OS0c3?=
 =?utf-8?B?c0FaQnhJR3lGdzU4eFIxcWJkWFA4RWY4cGtEbWczY1BTSUhkU3AybUdhQUly?=
 =?utf-8?B?VndNaklEVWl6ckVCNXFzeDJCWWo4aWtXRXBSNDdubTlDMzJqRG9UUXhnTTZ0?=
 =?utf-8?B?VW8wc2tTV3pvUi91aXRSK3U0NHJuT2ZNNEJBeElZNTI0cW9nM0h6NHhBeHFt?=
 =?utf-8?B?WGpBMGg3RnFTVGlmTkhpUWtrTWZQcGVHQTZOTzVwM21Eb01BTWhFajFVK2Js?=
 =?utf-8?B?TWw4Ujd4YUdMcGNmaGpXZWQrR0hCOW9nenVYVzRYS0NBVURSbUxxbytFOFNk?=
 =?utf-8?B?cHBIM3BYVUxmb3V6TXZrT1dQOTdMYjF5TlBqdUFreXU4SXE3NS9WZ2R0NHlB?=
 =?utf-8?B?WTFWVU9zTFR1Y1Y4VnVRODhrM1ZpU3p0bksxRUZFSnd4TzhqMnlFMHlsQ0Rh?=
 =?utf-8?B?N3UxT2M3TmtEbXVmdlBuVkM2cXJzd2RyTjVSemRSYnpUT2dkT3A3M1QzZWlj?=
 =?utf-8?B?T3EzT3NaK1lKWW1MYjE5VytNQWg3K3VNNGgxR2hHcXk2VURQYitMbTJKcWdZ?=
 =?utf-8?B?bHVkZndKdXRmZkFFc0xDNFovZWFHNUJweTNCRExndGxjQzVOTk52bjBnQzhL?=
 =?utf-8?B?c3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b2dad1c-fa46-44f3-87c8-08dd1e7bd791
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2024 09:19:00.2429
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JT9+dO+jsXjRQoEutpTafQLWP2qIqnkQPdF3B/kJOTh+SDW66uCj4DKT44xYmRDSNnia7Tm30dPuc8KUlscVE5ncB++J05ibvLC6lfnEziM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10542

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDE3
IERlY2VtYmVyIDIwMjQgMDk6MDANCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAxLzddIGR0LWJp
bmRpbmdzOiBwaW5jdHJsOiByZW5lc2FzOiBBZGQgYWxwaGEtbnVtZXJpY2FsIHBvcnQgc3VwcG9y
dCBmb3IgUlovVjJIDQo+IA0KPiBPbiAxNy8xMi8yMDI0IDA5OjQ5LCBCaWp1IERhcyB3cm90ZToN
Cj4gPiBIaSBLcnp5c3p0b2YgS296bG93c2tpLA0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+ID4+IEZyb206IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9y
Zz4NCj4gPj4gU2VudDogMTcgRGVjZW1iZXIgMjAyNCAwNzo1MQ0KPiA+PiBTdWJqZWN0OiBSZTog
W1BBVENIIHY0IDEvN10gZHQtYmluZGluZ3M6IHBpbmN0cmw6IHJlbmVzYXM6IEFkZA0KPiA+PiBh
bHBoYS1udW1lcmljYWwgcG9ydCBzdXBwb3J0IGZvciBSWi9WMkgNCj4gPj4NCj4gPj4gT24gMTcv
MTIvMjAyNCAwODoyOSwgQmlqdSBEYXMgd3JvdGU6DQo+ID4+PiBIaSBLcnp5c3p0b2YgS296bG93
c2tpLA0KPiA+Pj4NCj4gPj4+IFRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KPiA+Pj4NCj4gPj4+
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+IEZyb206IEtyenlzenRvZiBLb3ps
b3dza2kgPGtyemtAa2VybmVsLm9yZz4NCj4gPj4+PiBTZW50OiAxNyBEZWNlbWJlciAyMDI0IDA2
OjMyDQo+ID4+Pj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAxLzddIGR0LWJpbmRpbmdzOiBwaW5j
dHJsOiByZW5lc2FzOiBBZGQNCj4gPj4+PiBhbHBoYS1udW1lcmljYWwgcG9ydCBzdXBwb3J0IGZv
ciBSWi9WMkgNCj4gPj4+Pg0KPiA+Pj4+IE9uIE1vbiwgRGVjIDE2LCAyMDI0IGF0IDA3OjUzOjEx
UE0gKzAwMDAsIEJpanUgRGFzIHdyb3RlOg0KPiA+Pj4+PiBSWi9WMkggaGFzIHBvcnRzIFAwLVA5
IGFuZCBQQS1QQi4gQWRkIHN1cHBvcnQgZm9yIGRlZmluaW5nDQo+ID4+Pj4+IGFscGhhLW51bWVy
aWNhbCBwb3J0cyBpbiBEVCB1c2luZyBSWlYySF8qIG1hY3Jvcy4NCj4gPj4+Pg0KPiA+Pj4+IFNv
IHRoaXMgaXMgb25seSBmb3IgRFQ/IE5vdCByZWFsbHkgYSBiaW5kaW5nLiBCaW5kaW5nIGJpbmRz
IGRyaXZlcg0KPiA+Pj4+IGltcGxlbWVudGF0aW9uIHdpdGggRFRTIGFuZCB5b3UgZG8gbm90IGhh
dmUgaGVyZSBkcml2ZXIuDQo+ID4+Pg0KPiA+Pj4gUGxlYXNlIHNlZSBwYXRjaCBbMV0sIHNlZSBo
b3cgdGhpcyBkZWZpbml0aW9uIGJpbmRzIGRyaXZlcg0KPiA+Pj4gaW1wbGVtZW50YXRpb24gd2l0
aCBEVFMNCj4gPj4+DQo+ID4+PiBbMV0NCj4gPj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Fs
bC8yMDI0MTIxNjE5NTMyNS4xNjQyMTItNC1iaWp1LmRhcy5qekBicC5yDQo+ID4+PiBlbg0KPiA+
Pj4gZXNhcy5jb20vDQo+ID4+DQo+ID4+IEkgZG9uJ3Qga25vdyB3aGF0IGlzIHRoaXMgcGF0Y2gs
IGl0IGlzIG5vdCBwYXJ0IG9mIHRoZXNlIHNlcmllcw0KPiA+PiBhZGRyZXNzZWQgdG8gbWUgYW5k
IGNvbW1pdCBtc2cgc2F5cyAiaW4gRFQiLiBJZiB5b3Ugd2FudCB0byByZWNlaXZlIG1lYW5pbmdm
dWwgcmV2aWV3LCBtYWtlIGl0DQo+IGVhc2llciBmb3IgcmV2aWV3ZXJzLg0KPiA+DQo+ID4gVGhl
IGhlYWRlciBmaWxlcyBhcmUgcGFydCBvZiBEVCBiaW5kaW5ncy4gU28gaWYgaXQgaXMgd3Jvbmcs
IHdoeSB0aGUNCj4gPiBDb21taXQgIjk5N2RhYThkZTY0Y2NiYiIgImR0LWJpbmRpbmdzOiBjbG9j
azogYWRkIEV4eW5vc0F1dG8gdjkyMCBTb0MgQ01VIGJpbmRpbmdzIg0KPiA+IGlzIHBhcnQgb2Yg
YmluZGluZ3M/DQo+IA0KPiBJIG1lYW50IHRoYXQgZHJpdmVyIHBhdGNoIHlvdSBsaW5rZWQuDQo+
IA0KPiA+DQo+ID4NCj4gPg0KPiA+Pg0KPiA+Pg0KPiA+Pj4NCj4gPj4+Pg0KPiA+Pj4+IENhbGxp
bmcgaXQgYSBiaW5kaW5nIG1ha2VzIGl0IGltbXV0YWJsZSBhbmQgZ2l2ZXMgdXMsIERUDQo+ID4+
Pj4gbWFpbnRhaW5lcnMsIG1vcmUgd29yaywgc28gcmVhbGx5IG5vIGJlbmVmaXRzIGF0IGFsbC4N
Cj4gPj4+DQo+ID4+Pj4NCj4gPj4+PiBJIGd1ZXNzIG90aGVyIERUIG1haW50YWluZXJzIHdpbGwg
YWNrIGl0LCBJIHByZWZlciB0byByZWR1Y2UgbnVtYmVyIG9mIGhlYWRlcnMuDQo+ID4+Pg0KPiA+
Pj4gRFQgZGVzY3JpYmVzIGhhcmR3YXJlLiBUaGUgcG9ydCBuYW1lcyBhcmUgYWxwaGEgbnVtZXJp
YyBvbiBoYXJkd2FyZSBtYW51YWwuDQo+ID4+DQo+ID4+IFdlIHRhbGsgYWJvdXQgYmluZGluZywg
bm90IERULg0KPiA+DQo+ID4gQnUgdGhlIGRlZmluaXRpb25zIGFyZSBwYXJ0IG9mIGJpbmRpbmdz
IGp1c3QgbGlrZSBDb21taXQgIjk5N2RhYThkZTY0Y2NiYiIuDQo+IA0KPiBZb3UgbWFkZSB0aGVt
IHBhcnQgb2YgYmluZGluZ3MsIGJ1dCB0aGlzIGlzIGludmFsaWQgYXMgYXJndW1lbnQuIEhvdyBp
cyB0aGlzIGFueWhvdyByZWxhdGVkPyBIb3cgaXMNCj4gIkRUIGRlc2NyaWJlcyBoYXJkd2FyZSIg
cGFydCBvZiBiaW5kaW5nPw0KPiANCj4gWW91IHNhaWQgIkRUIGRlc2NyaWJlcyBoYXJkd2FyZSIs
IGJ1dCB3ZSBkbyBub3QgdGFsayBoZXJlIGFib3V0IERULCBkbyB3ZT8gV2UgdGFsayBhYm91dCBi
aW5kaW5nLg0KDQpPSy4NCg0KPiBJIGFtIG5vdCBnb2luZyB0byBrZWVwIHJlYWRpbmcgYWxsIHRo
ZSBleHRlcm5hbCByZWZlcmVuY2VzIHlvdSBrZWVwIGJyaW5naW5nIG9yIGRpc2N1c3Npbmcgd2h5
IHNvbWVvbmUNCj4gZWxzZSBkaWQgc29tZXRoaW5nLiBUaGlzIHBhdGNoIG11c3QgYmUgbG9naWNh
bCBhbmQgY29ycmVjdCBvbiBpdHMgb3duLCBub3QgYmVjYXVzZSBzb21lb25lIGVsc2UgbWFkZQ0K
PiBzb21ldGhpbmcgc29tZXdoZXJlLg0KDQpPSy4gQWNjb3JkaW5nIHRvIG1lIHRoaXMgcGF0Y2gg
aXMgY29ycmVjdC4gSXQgaXMgZm9yIERUIHVzZXIgYW5kIGl0IGRlc2NyaWJlZCBjbGVhcmx5IGlu
IGNvbW1pdCBtZXNzYWdlDQoNCiJSWi9WMkggaGFzIHBvcnRzIFAwLVA5IGFuZCBQQS1QQi4gQWRk
IHN1cHBvcnQgZm9yIGRlZmluaW5nIGFscGhhLW51bWVyaWNhbA0KcG9ydHMgaW4gRFQgdXNpbmcg
UlpWMkhfKiBtYWNyb3MuIg0KDQpHZWVydCwNCg0KUGxlYXNlIHN1Z2dlc3Qgc2hvdWxkIHdlIG1l
cmdlIHRoaXMgcGF0Y2ggd2l0aCB0aGUgZHRzIHBhdGNoIHRvIGF2b2lkIGNvbmZ1c2lvbj8/DQoN
CkNoZWVycywNCkJpanUNCg0K

