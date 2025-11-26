Return-Path: <linux-gpio+bounces-29089-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D5AC8A6D6
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 15:47:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD0B33B0E76
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 14:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FA703054CE;
	Wed, 26 Nov 2025 14:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="yF+bGYiV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77BF304BCB;
	Wed, 26 Nov 2025 14:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764168285; cv=fail; b=LMDVurbsiFNu8mRuX1w7LKrZb3xs20h0447VWvOb+n0ymjnh6llvF9awTkLOCgH7OTi6PAfX/4vFEiP1z/8n5bqLJSLmRvs8OygIgbVmaNU45Q3IXhUXT+2Oj/EfnSre84LJY887wSajhWzem82x6B/KvvvW35sXYNiZZbTgzTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764168285; c=relaxed/simple;
	bh=O7fLwf/OiQHnFCWj4aZkdIiO+wLjb0VTIq1hjEmKqmI=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=N9UUTRtnZiLhl/gjI9He+dfFlWQ19/9krCD3HdlCv1ap1ARTEP7DtHtSJywBghv4474TgaayuETVSixHxXqNMdxwHWo+oL3pglXeJ05SEpvTEcXaVR6ez5wy+sv8IV0jkjoEZC1kF/k7kjt3q5Yhdb62Xbp34HYV6zV0TZuAhYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=yF+bGYiV; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQCisTo3017902;
	Wed, 26 Nov 2025 09:44:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=O7fLw
	f/OiQHnFCWj4aZkdIiO+wLjb0VTIq1hjEmKqmI=; b=yF+bGYiV4rLusu4HMH6/H
	B8bQVMhNq20m409b+cBvil8C99OUDAgt+FjPrfdwo4iljAEe02DUe8HtqwSUXMZo
	PX+9Sh4Rq2RVqTfs9UetknpIKPi47SylokqT28E3dMPRYPzioRkOx5+uqin5XPXy
	4CDIFaiOdKlyG3SXQpWLUojAagtsFdywdaGeDhAxCCgexoT5hgVWqosB/t/uVzey
	ZavLV7JETR5Q17QbR3ddy44MRjUl6IiEur0e1P7pmUCD1reIFT+OPjVFiKdx1hsy
	kiGpsyhj6XXX1qv+kYUprbrTM2KSvFjoswYwAk6rc3MkjWw79t7mR6ch9J62uDgi
	w==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012071.outbound.protection.outlook.com [52.101.48.71])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4ana29edqc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 26 Nov 2025 09:44:25 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V6UTEmsxsqrRd7n45xUQdnjP5B5PLXYnTb2zbnAvNFv91VpW/kZu3+07tV8v0aXZ/TBWxuUx0XEUlYW+7capeTUZRZeRWCuRuHMBPvx5S9MMQLB0P/wCaS9FYwsqQXKJ9NvBpZ2EQs2CyvCI2FI3ae3redLQO8I2NFNdf/xiY4MMotoQvqBxFPgWm6fBgiu0HQSMNuOHSa8nvo9JIBYbumWeAEiAvivWmLKgFFF73vkMn8SDOfvlOmT3fDyZOPGcddXzgRJS9/4j9rSl3LsqEZWsgMjXC++ljG+fD/a6wuO/p61zUuS8oBnuj1hCzdu/Hmfp+IYCU267Z+SxApc00g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O7fLwf/OiQHnFCWj4aZkdIiO+wLjb0VTIq1hjEmKqmI=;
 b=mkC38cxMI3EYisFTcYXBrYN17JQhE8FSh5+IMZ0fmrNwMeV9fJsCqujx9gr0aUmDQIvbEL69cuTWJYIImTktzwonYpt21gchoK0WVSOG+G8Uj50vmoRlBkusqXEYt8X3zsN7aF31MulnxwsGsG+Rfg5fkvy3ALuq5mVe9dyzChOKkRcTo89tb0S4o//QPDQVqLE0dvnTAwiDpg85GxQsCPgKENgt/mas6WhZnuq3x3QA0dWm92uy20REgVpFECL7yFQFhjNtO3fKJJgrWmOn6A8CZYt+DJJdnVYYucYNdxh2ORowCrWoxPNjAbqR4aWkBukaeoirhjsC4j4esiCFhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from CY4PR03MB3399.namprd03.prod.outlook.com (2603:10b6:910:57::13)
 by SA6PR03MB7928.namprd03.prod.outlook.com (2603:10b6:806:42d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 14:44:23 +0000
Received: from CY4PR03MB3399.namprd03.prod.outlook.com
 ([fe80::1527:d313:16d4:2376]) by CY4PR03MB3399.namprd03.prod.outlook.com
 ([fe80::1527:d313:16d4:2376%4]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 14:44:23 +0000
From: "Miclaus, Antoniu" <Antoniu.Miclaus@analog.com>
To: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Linus
 Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Srinivas Kandagatla <srini@kernel.org>,
        David Lechner
	<dlechner@baylibre.com>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>
Subject: RE: [PATCH 0/2] mux: gpio: add support for ADG1712 quad SPST switch
Thread-Topic: [PATCH 0/2] mux: gpio: add support for ADG1712 quad SPST switch
Thread-Index: AQHcWt+RdaXk0xL3tEW1+Wt3cFfMvbT9vbQAgAdQSoA=
Date: Wed, 26 Nov 2025 14:44:23 +0000
Message-ID:
 <CY4PR03MB3399699BCF110D3E68E0A6479BDEA@CY4PR03MB3399.namprd03.prod.outlook.com>
References: <20251121115750.20119-1-antoniu.miclaus@analog.com>
 <0bda62bf-c0f1-49c8-2f86-8128b5c92a0c@axentia.se>
In-Reply-To: <0bda62bf-c0f1-49c8-2f86-8128b5c92a0c@axentia.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR03MB3399:EE_|SA6PR03MB7928:EE_
x-ms-office365-filtering-correlation-id: 51e138bf-8d8f-4ace-0151-08de2cfa4a36
x-ld-processed: eaa689b4-8f87-40e0-9c6f-7228de4d754a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?YUhVOHNrcG0vUG5peGxpaktsb2pLN0RvVkpVZ1JGR2IzWS9iSFV3ait2QzBy?=
 =?utf-8?B?bWlodXJsaHJhM1Y3R1crZW5VaW94K3lxWFJIcHNnZWt5VUpkZEM4bGNiSllN?=
 =?utf-8?B?Y0svTks2VEpWcGRQQlVnb3dSbFVrekR6UjB3M0hpczdkZmQ2cXMyb2p6Nkts?=
 =?utf-8?B?MXBpeVBwdHQ5OHpueDhnK2JZK29HaWcyd0E4MDBuRGpROS9Bd2IrMHQyMWN6?=
 =?utf-8?B?L3BOWmlIV01YeHB3MzNJbGtsRzh1NG5XRXFmbElwN2kycmNHVUN6cmtGVlJt?=
 =?utf-8?B?UTdleXpQMUpZNUt2YWI0bHk4TXdQMmxSNmcrSnZUQTBSeENXbzErVWRURFZq?=
 =?utf-8?B?SzRCOVYzTEd4TkxmNlJwTUNPZzVqcDlxMnh2OHBjbXlSSlRVZ2RwOXJrV1Ay?=
 =?utf-8?B?QnR1UGFMendFMmdBRVdBS0plTmZzMmdkNVIrNk9jL0w2RVNlenQ5enRWcWZl?=
 =?utf-8?B?L2F3dnd1NGtpQ1dFQ3pHRkpiS1R3TUVicXpOTUhKeFJVVFc2TzJHZ2svbXdp?=
 =?utf-8?B?eHVKMWFqcCtKOGNBdHpBYUdxanRJeUY2ZUF2ajNaLzAwZllpWjNtTlgxelR5?=
 =?utf-8?B?OUE4c1o3SGQwRm1Mb0tnb0hQM2g1TWh5Y2ZzYmdzYTkyNUZPYXUvd25xeVR1?=
 =?utf-8?B?dUVpM0hwK0Q3ZWx5R0VlSGI0Q3FxbGhObTlKb3ZORVhBSWxvWXI2QnNlYUJl?=
 =?utf-8?B?eGhFd0NmendmbC9jT0JYTWN1SWdiT3hLSC93V1NJVjRFaHB5Um5DOEE5SFV4?=
 =?utf-8?B?My9VV1M2bHVncVNiTEROMDcyME9wQkI3MkgvMlk0cmtKdi9TRERJWXlSSXVa?=
 =?utf-8?B?ZWF0blBXVTJOazI4KzkvaXVvYVcvYStiQ2JyOVluYnI3bTgvLzB0c2UxdXFa?=
 =?utf-8?B?ZXMzaWVRVmtiUVUyZnJOWHRZRjBiaXpxOUJVeUVpL2RLSk5leE5ocnhuQU53?=
 =?utf-8?B?Q1JvQjcvckk4dm1heGdVYU5iZXNrZnM0SXNnVkk5d3g5WnhZdHB6c0s3enRE?=
 =?utf-8?B?bzVwLzBFaUdjbVg3d1YxdTNyMUpPTUh5NXpHNnlvL1Y2N20yMm5XR3V3cGly?=
 =?utf-8?B?MGdkcTVCakkrTGg1M1dCQVkxNk10SWVPTEFlYS9TMUsxamJSV1I2TzBzL2pa?=
 =?utf-8?B?cXBaMDh6d0EySGlySTVoRTRoZStINk1rWDh6YlNITHNqSWhBUm5ZMzVqSEYy?=
 =?utf-8?B?UDV1ZGg2ZzJUUTlGVkoxcjdUR0pSelBFVlY1VzdVR1lQYjBpQncrNjdxbk1o?=
 =?utf-8?B?c2hVY0pQNnoxcWs4Ujh5c1JtdTBMUEhpUE9WWXR2R2FxdjQvbVVtTFpLZmc0?=
 =?utf-8?B?Z0lDSHNEMjdPeHU2YkU3VnhnZUlHdE1URlBudnNjTC9sYmg3UEwwUHd1SFh2?=
 =?utf-8?B?QjNJTEg1YVVIUkpFUHQyVXN0bm1zZ25CL0paTC9DYjNhd2hvUHVxNlBJU0xG?=
 =?utf-8?B?MGFDOEdCaWtGcTdCOXc3RWZYc2dqYXBtL3V6RGU5R3hZYTQ1YVpkOXByS1g0?=
 =?utf-8?B?ZGc4cnNKdnhhVHdqMXFHL3Q5TTZsTnlsRHVFWUlHVEJNYWNPa1c0Zitkb3pS?=
 =?utf-8?B?d1RVUHM2OWs0b25hcEM4bWZWaWNTZlVIRWJCcU03eUYxUmNRaTB0R3dxWGZ5?=
 =?utf-8?B?Q3h0ekx0YWc3aVZPQnV4d2pDWWNkUi8xcXlDbG9jV0lxM1hxbHZTWmI2cXNi?=
 =?utf-8?B?U2pFRHNVZnFxN1VPUUpmSzEzMnNZd1l3eVp6a25xcmFaVHIyek84cGtFZ1JE?=
 =?utf-8?B?K296aXRSeDM5VHY1cGlFUHJoUFFlendVckYyZ0s4M051dFhyQXg2SWs1RExH?=
 =?utf-8?B?aVJRYlMvVlBTQUtuSm1tdDE1S3lwdGhVUFhSa1lhWUZaZVVwTHhvMlFvaG1z?=
 =?utf-8?B?SnE1T0pEUmd5cHV1UmFsSkxZQjR4K2kwMmozMGdDelhJdkxkcFAvcDZxeXh6?=
 =?utf-8?B?amhvaS9PZGkwNlJheDJ6by9vbnNwdWxCYWw4QWRkdFV2T2dBT1VNVTI0QzMr?=
 =?utf-8?B?dEZCUjgwY0V3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR03MB3399.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M2FuTTdjYkNEZmYwYXpMeExFeU1CeU1rVDcwQWFTVktEVnh2NkxKZ2JGUXYz?=
 =?utf-8?B?SFhXSjJqN0FCaG5zeFNTMGtzUHUybWNtWkxEeFdVcVVLZEpLVmN4c3FUN3ZM?=
 =?utf-8?B?Z25SdHVmMm1KYWNHQzY5UWhYR0swVXY3Nnl6bHZXU0JxK0RZM1FlTUp5TWh0?=
 =?utf-8?B?UXVMTnVFMkMyZytmVzRVSGVrZ1M1bWlkckVJU0E5VlZubitMeHBrNEdDZjc4?=
 =?utf-8?B?Vm9TbSt4Nkl4UGRwWVpiQ1ZpZW1QVjduYmE5R3lXSnVpZVhoOHJkZitlckVN?=
 =?utf-8?B?cnRyMDVpU09ZbXQ2bUJINVVOc3JPTm1YRWFYM0FJZXVMeXlCVUNPUnkwSlpX?=
 =?utf-8?B?aStrNFY3SnFhbnZyMkxhLzNEZ0k0ZGlNeVRVbDFPRVJFUHlRbXhBN2ZXTlhu?=
 =?utf-8?B?bVpOelFQT0o3N2JDVis4NkxDbWkrZHllUUJ3eU9kR1F0bWtUY2NDakNleVEy?=
 =?utf-8?B?bEx1MTM5VURvL21VUWVna3J6NjhFM210Ky94d0JUN0MydURsaEl2dWE5clNF?=
 =?utf-8?B?VFNLMG5nTUxrZ2VLZnh4SjlrZ0RTVzBRRFVabDNnd1N3aksyTmI4ZGFPUjU2?=
 =?utf-8?B?Rk9pZElTUXMrVldqSEtvcUcrM3Y4M1Q4NENpOXdudkJNZWUveXhpQ1RFMFU0?=
 =?utf-8?B?Q3dRUVE1ZVp3RkVvTUxrbWdWWkllZTIxVmcrUEtvcjBHeUQ4TGhieE91eUNM?=
 =?utf-8?B?ejVFY2RsTXNYcklBTktFS1hxME40b21pOU1Rbk9PMUNPQnNXeWNmYzNkRmtp?=
 =?utf-8?B?aTNYK3ZiZDNaV3I2dG1Rc2pSbzhNQkRVazg2dGlscmo1K3ZMSitycnNkRDNF?=
 =?utf-8?B?eDJtcFdLcUliSkVYMWhxRFkxQUMzclB5SFBZcTM4Mnk5Z2RpMkFoMmZ1ZEta?=
 =?utf-8?B?dTNZNURnb2lySWxITnRjazhNUVhycTNjZzRVMnVJSHd6K0sxbkpPNGNWWVdO?=
 =?utf-8?B?cjZ2SFBObWl3RzRBZ0N0enc0YitZcXBhTWJPdjJaQXNKaGRhU1FqZDZRbUlx?=
 =?utf-8?B?MkxVcVNmM3I0OGVDSEo2My9aaDFmTVVKWUpmRmVTUXUxaU8yOTUvUURLNTI3?=
 =?utf-8?B?Skc1cE1ubklZUCtaVGVPNTdaQ0p3RFNrQmtLUm00NnlwZ1pLUEc2NkNqMWxy?=
 =?utf-8?B?dTRyYXhIVFd0Mk5XdEtFMHF3VXdWQWdGTDhHRFBHcWJVSHVEaEJncjQ2ZWlq?=
 =?utf-8?B?VytWeHVJRGMrbmFsK0Q0UHB3bGFOcG9rY2p5U0M4Wk9YYlI0eEM2S1l3RE0y?=
 =?utf-8?B?U3lIVEJyZVBCSkJsbWF1WkNzMEJnNzNrSmV4UUJhSE8vbytNWnlBY3ZYTlFH?=
 =?utf-8?B?MEhNN2NBQjR0N1UwTytreVl4M3ROSk9iYklNSzZ1VUllOTRDNTVEcEk3TXdH?=
 =?utf-8?B?eTZxcjlRWkdPVFR3Z0ZJRVNEUDBjSUZYc2ZSRno1T1cvT3RtR0EvcEdzbVNj?=
 =?utf-8?B?ZElkQWthYjhMMmc1MGMvR05qWStYeG54SEhUa0s4dnhNcG5BVjIvUm9jQWgz?=
 =?utf-8?B?SDl5VGRrRHdCZFdoTkUxWXpLcEUwS3hGOUU1TmEwOTRwdnN2bjFRWnJwdTR5?=
 =?utf-8?B?UG1KN1IzTUpVenlVQjVzVmhSRkpDV0R0aFh0WmVVcUFpcGJzWVZTc0VpUmo0?=
 =?utf-8?B?RmYySDJTU3NsWWoydmtIMkdCSnBSWU1Kc3drVlFhWWNaRXBlUkEwSUpxTU45?=
 =?utf-8?B?UklZTXo4TzBqWU1PcGIwUzI3ODZnT3o2NElWazhvc2V4R0ZrdVkvRFhzSFJi?=
 =?utf-8?B?endWNWhNYkFVSHprYlZxYStHV2VXbnlHQzd5NTl6V28rclFSREU2YXc3SGdY?=
 =?utf-8?B?bzY1OVpvd3BhNGJnTzIxK0UvT3BsbHJzZ0trWEZrY1M4OWRiRWhhdFJocmxI?=
 =?utf-8?B?YlAvV0lheElXeXF3Q0NQOFIvcldtNmEzRS9NWFk2cThtSjdTQXMvR2VTZGRh?=
 =?utf-8?B?L2hOY1NQOVd3OFRSN0dwRHVoLzFFZnJaRkQ4NU5MRjYvcDZSS012djcxK09v?=
 =?utf-8?B?OUZSeG0xa2lyL1RGbWNXYVNOb1V5dDVobmVzZHJVNU9xVDRiRzgrSGRXRzJ6?=
 =?utf-8?B?TlZIZTg2Y3d4NVpEMjcyQmRtYnRxTzdxaWVxL0NGcG1WTW1aQktDZFJ1Y1cy?=
 =?utf-8?B?clc1TTlHaXZXWE0zTm5iM0x6VjRFaElRcVNkaytZYVBXTjk4eFhSRUQxMW9R?=
 =?utf-8?B?Z2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR03MB3399.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51e138bf-8d8f-4ace-0151-08de2cfa4a36
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2025 14:44:23.1068
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2pm3Eyz41Qq6eWBqCUgxP0BNKXqvh0Q8S9lshy1YHA9WfUC1kQt0eprd1Fc9S8TGe6Jvg0QorJiBmJRDoYuOxhTPO73GBAk4L4IEN2FwJH8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7928
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDEyMSBTYWx0ZWRfX2Fp4juTkB0ZQ
 tG5mj1wAiHId54bQByiPDRp913at7xwzpP1hg+LNWN6N438AVWZAEtueNOioIvOD1e4z3c6v2Rw
 RVAtcok1TVyj2Qk1VDbYX9PkiQk4AI6Ay83bg5UwEKg7x4NP/5vzRSHc/VTH7R7vGJdzhwF9GRz
 /B8A6WAyu41JNC1zzPGCmXomraVjl7OPBIqLvnKI6j06XLO7usPezzc2XcRnX6ebx1kGTZ4PJf3
 Zxv6lq7rYCvIYnY6+58RLOevxPBcHdX7LZuP414OIATWDBEVsdsF4EreLHImRGgiPwJA6pvxiFT
 VQ0ktZJsb3AKp3h48u+tDAlIhh2mqE10IAkFduaYapUeio7HWIvKO1/kqvUhcMLXFHljz9Nqz/H
 NOmNKbokKNgjz9OTxL4K6yWEgEdelw==
X-Proofpoint-GUID: Bj7NGE5pkqJSSzOorZM03sefw4wuT1SP
X-Proofpoint-ORIG-GUID: Bj7NGE5pkqJSSzOorZM03sefw4wuT1SP
X-Authority-Analysis: v=2.4 cv=Hb0ZjyE8 c=1 sm=1 tr=0 ts=6927124a cx=c_pps
 a=3vo4EN8bzuoLd/SmvO3peg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=uherdBYGAAAA:8 a=_EeEMxcBAAAA:8
 a=gAnH3GRIAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=IpJZQVW2AAAA:8
 a=4aFhTA_dGyZuhm9iYt8A:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260121

SGkgUGV0ZXIsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGV0ZXIg
Um9zaW4gPHBlZGFAYXhlbnRpYS5zZT4NCj4gU2VudDogU2F0dXJkYXksIE5vdmVtYmVyIDIyLCAy
MDI1IDEyOjU0IEFNDQo+IFRvOiBNaWNsYXVzLCBBbnRvbml1IDxBbnRvbml1Lk1pY2xhdXNAYW5h
bG9nLmNvbT47IFJvYiBIZXJyaW5nDQo+IDxyb2JoQGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YgS296
bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+OyBDb25vciBEb29sZXkNCj4gPGNvbm9yK2R0QGtl
cm5lbC5vcmc+OyBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+OyBCYXJ0
b3N6DQo+IEdvbGFzemV3c2tpIDxicmdsQGJnZGV2LnBsPjsgU3Jpbml2YXMgS2FuZGFnYXRsYSA8
c3JpbmlAa2VybmVsLm9yZz47IERhdmlkDQo+IExlY2huZXIgPGRsZWNobmVyQGJheWxpYnJlLmNv
bT47IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4ga2VybmVsQHZnZXIua2Vy
bmVsLm9yZzsgbGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCAwLzJdIG11eDogZ3BpbzogYWRkIHN1cHBvcnQgZm9yIEFERzE3MTIgcXVhZCBTUFNUDQo+IHN3
aXRjaA0KPiANCj4gW0V4dGVybmFsXQ0KPiANCj4gSGkhDQo+IA0KPiAyMDI1LTExLTIxIGF0IDEy
OjU3LCBBbnRvbml1IE1pY2xhdXMgd3JvdGU6DQo+ID4gW1lvdSBkb24ndCBvZnRlbiBnZXQgZW1h
aWwgZnJvbSBhbnRvbml1Lm1pY2xhdXNAYW5hbG9nLmNvbS4gTGVhcm4gd2h5DQo+IHRoaXMgaXMg
aW1wb3J0YW50IGF0DQo+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2FrYS5t
cy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpbw0KPiBuX187ISFBM05pOENTMHkyWSE0OTZE
bEZVaWRuYTRTcWgxdGJLMlpGUjI2UkpPUUllalVkZUxrU3Q1QnVJelp0SjQNCj4geGx6QWlGWkdj
QnlhYTZOWkxOYlQ0QjJya1B4dEN5TkhfVm8kICBdDQo+ID4NCj4gPiBUaGlzIHNlcmllcyBhZGRz
IHN1cHBvcnQgZm9yIHRoZSBBbmFsb2cgRGV2aWNlcyBBREcxNzEyIHF1YWQgc2luZ2xlLXBvbGUv
DQo+ID4gc2luZ2xlLXRocm93IChTUFNUKSBzd2l0Y2ggdG8gdGhlIGV4aXN0aW5nIEdQSU8gbXVs
dGlwbGV4ZXIgZHJpdmVyLg0KPiA+DQo+ID4gVGhlIEFERzE3MTIgY29udGFpbnMgZm91ciBpbmRl
cGVuZGVudCBzd2l0Y2hlcywgZWFjaCBjb250cm9sbGVkIGJ5IGENCj4gPiBkZWRpY2F0ZWQgR1BJ
TyBwaW4uIFVubGlrZSB0cmFkaXRpb25hbCBtdWx0aXBsZXhlcnMgdGhhdCB1c2UgR1BJT3MgYXMN
Cj4gPiBiaW5hcnktZW5jb2RlZCBzZWxlY3RvcnMsIHRoZSBBREcxNzEyIHRyZWF0cyBlYWNoIEdQ
SU8gYXMgYSBkaXJlY3Qgc3dpdGNoDQo+ID4gY29udHJvbGxlci4NCj4gPg0KPiA+IEhvd2V2ZXIs
IHRoZSBleGlzdGluZyBncGlvLW11eCBkcml2ZXIgYXJjaGl0ZWN0dXJlIGhhbmRsZXMgdGhpcyBw
ZXJmZWN0bHkNCj4gPiBieSB0cmVhdGluZyB0aGUgbXV4IHN0YXRlICgwLTE1KSBhcyByZXByZXNl
bnRpbmcgYWxsIHBvc3NpYmxlIGNvbWJpbmF0aW9ucw0KPiA+IG9mIHRoZSBmb3VyIGluZGVwZW5k
ZW50IHN3aXRjaGVzLiBUaGUgZXhpc3RpbmcgbXV4X2dwaW9fc2V0KCkgZnVuY3Rpb24gdXNlcw0K
PiA+IGdwaW9kX211bHRpX3NldF92YWx1ZV9jYW5zbGVlcCgpIHdoaWNoIHRyZWF0cyB0aGUgc3Rh
dGUgYXMgYSBiaXRtYXAsDQo+ID4gc2V0dGluZyBlYWNoIEdQSU8gYWNjb3JkaW5nIHRvIHRoZSBj
b3JyZXNwb25kaW5nIGJpdCBwb3NpdGlvbi4NCj4gPg0KPiA+IEZvciBleGFtcGxlOg0KPiA+IC0g
U3RhdGUgMCAoMDAwMCk6IEFsbCBzd2l0Y2hlcyBPRkYNCj4gPiAtIFN0YXRlIDUgKDAxMDEpOiBT
VzE9T04sIFNXMj1PRkYsIFNXMz1PTiwgU1c0PU9GRg0KPiA+IC0gU3RhdGUgMTUgKDExMTEpOiBB
bGwgc3dpdGNoZXMgT04NCj4gPg0KPiA+IFRoaXMgYXBwcm9hY2ggYWxsb3dzIHRoZSBBREcxNzEy
IHRvIGxldmVyYWdlIHRoZSBleGlzdGluZyBtdXggZnJhbWV3b3JrDQo+ID4gZm9yIHN3aXRjaCBj
b250cm9sIHdoaWxlIHJldXNpbmcgYWxsIGV4aXN0aW5nIGdwaW8tbXV4IGluZnJhc3RydWN0dXJl
DQo+ID4gd2l0aG91dCBhbnkgY29kZSBjaGFuZ2VzIGJleW9uZCBhZGRpbmcgdGhlIGNvbXBhdGli
bGUgc3RyaW5nLg0KPiANCj4gTm8sIHRoaXMgaXMganVzdCB3cm9uZy4gSWYgeW91IHdlcmUgdG8g
dHJlYXQgdGhlIGZvdXIgU1BTVCBzd2l0Y2hlcw0KPiBhcyBzb21lIGtpbmQgb2YgYSBlZGdlIGNh
c2UgbXV4ZXMsIHRoZXkgd291bGQgbmVlZCB0byBiZSByZXByZXNlbnRlZA0KPiBhcyBmb3VyICpp
bmRlcGVuZGVudCogbXV4IGNvbnRyb2xsZXJzLiBXaGF0IHlvdSBoYXZlIGRvbmUgd2hlbiB5b3UN
Cj4gdGllZCB0aGUgZm91ciBncGlvcyB0b2dldGhlciBsaWtlIHRoaXMgd291bGQgYmUgYXBwcm9w
cmlhdGUgZm9yDQo+IGEgc2luZ2xlIFNQMTZUIG11eC4gV2hpY2ggaXMgbm90IGV4YWN0bHkgd2hh
dCB5b3UgaGF2ZS4uLg0KPiANCj4gU28sIHRoaXMgc2VyaWVzIGFidXNlcyB0aGUgbXV4IGRlc2ln
biBhbmQgaXMgdGhlcmVmb3JlIHJlamVjdGVkLg0KPiBTb3JyeS4NCj4gDQo+IFNpZGUgbm90ZSwg
cmVwcmVzZW50aW5nIHRoZSBmb3VyIHN3aXRjaGVzIGFzIG11eGVzIHdvcmtzIHBlcmZlY3RseQ0K
PiB3L28gYWRkaW5nIGFuIGV4cGxpY2l0IGNvbXBhdGlibGUuIEp1c3QgdXNlIGZvdXIgbm9kZXMg
Y29tcGF0aWJsZQ0KPiB3aXRoICJncGlvLW11eCIgd2l0aCBhIHNpbmdsZSBncGlvIGVhY2guIEJ1
dCBvZiBjb3Vyc2UsIHRoaXMgZm9pbHMNCj4gdGhlIHN5bmNocm9uaXplZCB1cGRhdGUgcHJvcGVy
dHksIHdoaWNoIEkgc3VzcGVjdCBpcyBpbXBvcnRhbnQsIGJ1dA0KPiB0aGF0J3Mgbm90IGEgcHJv
YmxlbSB0aGUgbXV4IHN1YnN5c3RlbSBjYW4gYmUgZXhwZWN0ZWQgdG8gc29sdmUuDQo+IA0KDQpU
aGFua3MgZm9yIHRoZSBleHBsYW5hdGlvbiENCg0KV291bGQgaXQgc3RpbGwgbWFrZSBzZW5zZSB0
byBoYXZlIGFuIGFkaSxhZGcxNzEyLnlhbWwgYmluZGluZywgDQoodW5kZXIgL211eCBvciAvc3dp
dGNoKSBldmVuIGlmIGl0IGp1c3QgZG9jdW1lbnRzIHRoZSBwcm9wZXIgd2F5DQp0byB1c2UgdGhp
cyBjaGlwIChmb3VyIHNlcGFyYXRlIGdwaW8tbXV4IG5vZGVzKT8NCkknbSB0aGlua2luZyBmcm9t
IGEgdXNlciBwZXJzcGVjdGl2ZSAtIHNvbWVvbmUgd2l0aCBhbiBBREcxNzEyDQpvbiB0aGVpciBi
b2FyZCB3aWxsIHNlYXJjaCBmb3IgImFkZzE3MTIiIGluIHRoZSBkb2NzIGFuZCBmaW5kIG5vdGhp
bmcuDQpBIGRlZGljYXRlZCBiaW5kaW5nIGNvdWxkIGp1c3Qgc2hvdyB0aGUgY29ycmVjdCBhcHBy
b2FjaCB3aXRoIGENCndvcmtpbmcgZXhhbXBsZSBmb3IgdXNlcnMuDQoNClJlZ2FyZHMsDQoNCj4g
Q2hlZXJzLA0KPiBQZXRlcg0K

