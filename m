Return-Path: <linux-gpio+bounces-9143-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F1795EAB5
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 09:42:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9C0928979C
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 07:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DE20139CEF;
	Mon, 26 Aug 2024 07:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="TQVpwzA3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2046.outbound.protection.outlook.com [40.107.255.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CA085654;
	Mon, 26 Aug 2024 07:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724658142; cv=fail; b=oBV2YJs/F9fmm5dID+eWckB/gPhRjVVgHFVVcO5YGTuY5MqFPTGuREsZv7EGUcrcS+B9QyLww6lNxPm64X+763K9YDK3+rUw8psWXW5MwjBxMGNFs+pj85v+ur00r+IHhCv89xvppMhXCRI8DPjOp1QXYCN5gune8H4dFjN29KY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724658142; c=relaxed/simple;
	bh=SBI2a1glY6p+lAVJ16z9AYF5z8V3yX/NwqUiVKrAJO8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GGeNN1RrU00cPEu41tTYrNpiCVFvxXFUjKvAYi+759GxlVm3iZaHbGmenf54arlNs7ixO6CuBlQsuKsLq0deE4RoWsTjxafyrReN+tKvONA0cOYdYax3tQ4YaWpUgYaT/AiZ8i9Z7AnW2E4OyLxpYPPdY/h7T32i5btHozcx540=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=TQVpwzA3; arc=fail smtp.client-ip=40.107.255.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nArA/Y1CN5ner9tRkkBnSOgvTCn4bLhTJx9pM2oATbKkS3ZoeF37yV1TavYQ3ketNVWTJffAcpxU+2dmIb5rfNKvhHm2WMbaeRvryTwpaViEKs+b2mJga31N1TEZPthLJ2LktIslvBRY62S3jbDFuS7HomYSpCdVus+pDsp59y7+G7cdf8InlGo/KnpTbo37MCM4A88q1t0MqiL3uKG1ZiVnv/6v3csB7pfZJd3roX1NNszbpy35ie2/t/E4pEfWB0jclezge0Cb3sW9MYZST7dymg8L8YvnCSb88/RF4H0coKX6f3qt6L9lIGdWjpO/H9FMbBZxPcl5Y/T5X6f2Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SBI2a1glY6p+lAVJ16z9AYF5z8V3yX/NwqUiVKrAJO8=;
 b=x1R78SY/k32YFR6klozZmgY7j/3spNLrGBITzwnFL8rMrc4F0eKd209Tsb50824KFeqKyahiRT8byl/MIVsF0ru5p6KXc7H2/VfmHdpoCUbiurrYZe6BaNJh3RpZ7mjcRVgsBW2QO2BJxhDrce53Uj9xuIc5aPVVzzyrwGbBjlieKYBDu51PMCbhDZCfa29RcnZ13zRh5OnQwGX6/aL/LRLsrayr5zJmHh7j6gBGwF5g6k9GkbVXkM+ovdQOJAnaQEC9eJkr3vmZRWGZ6ZCXNVNJCgeLmzuiDYThf+xr6bWz7c5x2zYrdKCycKtvWXGW8gch72FFj1S53PEmYyvGfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SBI2a1glY6p+lAVJ16z9AYF5z8V3yX/NwqUiVKrAJO8=;
 b=TQVpwzA3kDIdlo1hLwT55K5ioXld1L5OLONheYxc6lWtDMn/QWvYws9tDtACPWO1s42nSFpKJMse3iYHBKNJGq/JUEY+m6wfMTWPTeOS07xburS0mgHP7X5S1nNgD72he3x594NCy12e5IijiYSJ5X7jTLz42ReMglyltvVdhQ0TnKTvUWSd0Xs/ccOtWqXcf90VE4WpsOfa5+ODs8B5qa9uGpvZU1rg2O7BXtypvOb+EGnFAZN2lea2uPJF9DoL0tytPJVytT8OX1NUhntK4B9rUqVjS2lYZRd6gOsWZCI7Tah6nOgtG/m5e3M6EaxqDhTRBwiDIBfhGR9K+Wy1HQ==
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by SEZPR06MB5810.apcprd06.prod.outlook.com (2603:1096:101:ab::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 07:42:18 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%7]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 07:42:18 +0000
From: =?utf-8?B?5LqO5L286Imv?= <yujiaoliang@vivo.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
CC: Linus Walleij <linus.walleij@linaro.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, opensource.kernel
	<opensource.kernel@vivo.com>
Subject: Re: [PATCH v1] pinctrl: nomadik: Use kmemdup_array instead of kmemdup
 for multiple allocation
Thread-Topic: [PATCH v1] pinctrl: nomadik: Use kmemdup_array instead of
 kmemdup for multiple allocation
Thread-Index: AQHa85aNOZK31vHAo0G/RuUkL2tjrbI0+ssAgAQ0+oA=
Date: Mon, 26 Aug 2024 07:42:18 +0000
Message-ID: <319dc757-2182-431a-8e60-bc37f640971a@vivo.com>
References: <20240821064958.4059221-1-yujiaoliang@vivo.com>
 <ZsiqasBNAdVWKrjf@black.fi.intel.com>
In-Reply-To: <ZsiqasBNAdVWKrjf@black.fi.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB4461:EE_|SEZPR06MB5810:EE_
x-ms-office365-filtering-correlation-id: f88a3449-7e70-4c2a-f720-08dcc5a29cad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VlUwV2NrU1FLUFp6bFB1VHBDT1Jqdk5aL0JSSStHa0ticlhxMis4L05IRENR?=
 =?utf-8?B?bnY1Q3hMcXBHdDAvRGV1WHdDeGlqaWNLSjhsR3NaUlMvTEJQUzhZNFBRZlJm?=
 =?utf-8?B?OHBrQTRMOGhTR0lDN1pEMzF3SUp2TXNKMy9PTVo5VEsvYnVxbkFRVWM0VS9F?=
 =?utf-8?B?RjJmRk9mYlIxRFNyM1VxOE10cFJqRk5xdE9oUThnT09ibGFoOVZQcWZ3Rnoy?=
 =?utf-8?B?elF1bVh1YklkYWNFZUFxejExcTZtbGFXZWprWFAyamlWaGt6aGM0UEJjbmFt?=
 =?utf-8?B?R1lPTU8rY2ZPQlQ2Sk45cnpXcEpvQzROcnBHdDNlRmdIVDJOQlUvUG5FbmVJ?=
 =?utf-8?B?cUJueXpyT3dwc0lHRjVIMEhKckFxamVVUjVQU1Q2dUhYd2xqR1EzNisxd0VL?=
 =?utf-8?B?NzNobEFKSGVBWk4wbllEY0N0SlZTY3NBVUdEcWdsUW1PNEg5bTlYZ2VFdC9B?=
 =?utf-8?B?a1oyelZnNG5VaHVEcnJkQXl5ejl6R1kwY1kxYUZUYzlFbVorWUVldFFKR2I5?=
 =?utf-8?B?NC9sbUt2VVFDVXF5aXNPMXJMY3pwZ1EwT1pQWHZxQVd3VHpVNlo1Y3EzK1Z6?=
 =?utf-8?B?QkFJMnZqSUVoWEJKcVp2VnpLRHc2N1FJakRYT2s2cU1NL1dBaHhDSS8wYkda?=
 =?utf-8?B?N3VrUVpHTEdvSER4cStHb1hUeXdjNzU3c29wQUt3MElNNWsyem41ZEdPYzdH?=
 =?utf-8?B?OC9mclZxb1JKYVFuQVlhOVVXUUd1MXZhOVJzTWZOaE9KVkdPeXR2cFVSemRC?=
 =?utf-8?B?TmFmeFJMeGpkTWNmMkpYOEJLNUtaWGpLRE9ocVJBWG4yWEVyZmxORFM0WU00?=
 =?utf-8?B?blpQTXorZHRoUm41NUJnZm9ITzA3aVc2TjBSRisxZXE5YkdYaFVXVDZ5MzZ2?=
 =?utf-8?B?YzFzTjlsNnpVVnZoU0h6dzN3Y0NxWHN0NGM1Si9FMVNmOU0zS0dtSExFa3JI?=
 =?utf-8?B?QncwM3pSNFdSTlhIbTJ5NUNNamkxRlpIUVVMZXFCakxPczJCejhaeFpvN1FP?=
 =?utf-8?B?a2lzdzB0Ukt4Uys3UWtmMmtOZTV5alAyQXQ2d3M0N0hNOFI0MmQyTWlPMXdr?=
 =?utf-8?B?Z1p6QXJkWGVTK0gvcFRucWlRbnQ0enNSZ05VdkxpNHNydWZrQytDRGN1Q280?=
 =?utf-8?B?OWxGTE53OVNoQjVRNTBmem94VnV3Sld3RFduczR5dCtLVXlOTk5BS0F2U1dU?=
 =?utf-8?B?OWk2KzdmWHd1K09TdGYwS0t3MUxKcGtYbHVmcytQYXMwWktNMFJGaHBHamQ0?=
 =?utf-8?B?WldoTnVkczdPV0lGOC83RUphbUo5VzF3cnljZElhZG1YOGpxUzRaY2NPNlQz?=
 =?utf-8?B?TVEyNGxtWVdMWTNXY0VnQmtoMjUyRlJCK1FHSTlSeXlUcWhLdVlxVTBSQnNX?=
 =?utf-8?B?aGxmS1lzS2gvMUtjMWdRSVA4ZmNFSGV2YllyUjBLZkdFZmdRRkFzZ1JNWlJk?=
 =?utf-8?B?VEorTHBjMFpFMWRLWEtEdU04aW1kMktyRVBZdVBtT1RlSlFjOG9oU3dnaEgz?=
 =?utf-8?B?N1FpNjJpeFFtaFpzNllCTCswVUlNT3dUb3pMYTAvVkVveWhoS3MxYUpoV2Jz?=
 =?utf-8?B?R2gyTFVRZDNjdnVDVGNJTHozLzVlZWNoMzY4dFg2ektPK2xQZFFqaDhKZEZv?=
 =?utf-8?B?SUpvU2NzL1JiMEFuaHhPSSttZTVVcWp0b0RVcS9jVzhaMU9HSGFaNmk0Tzl3?=
 =?utf-8?B?VjJCcEZEWUlRbllBZEQrUTJyNVZEUE9vTE5lSGRXWlZFZ3pYTHE5YitOMGdD?=
 =?utf-8?B?eWJTQ0dncVBvUzFyQXhlc1FxTUpucHA1UzB1YjdGTGRnM3BVRE4rYlRGNG9Y?=
 =?utf-8?B?SDNyM3k2U3M5ODlBdnZya2FoajAvWWY5NVR6WWN3NW5BbGoxRVpzam1OdjZS?=
 =?utf-8?B?cjQrd0hUeXd5MzJveFJwdjlqYVA5RFQ5SFl6OWVpdFcvQXc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB4461.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L0JUN2V2OGdkUGd4M0xOdldEL2dDMjNzTWVJd3lYcGQyQURCeXBORFZ2OG5v?=
 =?utf-8?B?Tjd4U0JnVWF3S3pmWkhjbm5GYWcvTlYvZ2JsNUxZbUozWlR0MUs1T04xVTI4?=
 =?utf-8?B?OFZXOHI5b1dHVmoxM2dIL3g2MUxuRUlEWlpoZHg4aDZHckNJVUVKSXZqQktW?=
 =?utf-8?B?cHNueGdsOGVSVTlPSjgyNXp0OWxqb1FIRG1RYWw5aFZnNEdxUVRaQ1Vxa29p?=
 =?utf-8?B?Wk1SUTcrb1JxMFE0WHE3TzcwWDh4ZHhUMlJ6WHJTSWpDRTFzZHZXL2ZQWjNI?=
 =?utf-8?B?MWlhWXZhMEhtYnBsMkNuOTJqOExFOHprSTVybGF3bjE1bTQvcmVHbksrajNY?=
 =?utf-8?B?VVFMcmlDYndXRC9QUFIwODkyQ1B2MUwrRDdNWk1hZldSbUUrMSt6ZlVuUWhB?=
 =?utf-8?B?SlF4MzZlV2hRa0hKWFVTUml1K25VdzFkcnRFVzBSbHVnSi9XWnJKMTR0OEhZ?=
 =?utf-8?B?YURoREhKbE1VcUR1TjEyREJuUzFqRkVRb3BuNU40VUZlTVpHWURBNVFnY1RC?=
 =?utf-8?B?QVlTZWVGWDZkd1ZLOWdCeW5NZEpJYVZaSFFoZHhkYVJyNzZiVElCNkE1Vk1O?=
 =?utf-8?B?clNDcmFXVHVnOVh3UWJrZWcraVVzMnZOamFRZzlTUTdRak1MVDdHS0taUDln?=
 =?utf-8?B?YlZIQytsNkdlYmVQNjQweTE4eVFienk1U1I3VzQ2a0RHZjliWUJ3WHRrZ3lw?=
 =?utf-8?B?WDBTMnlnQjBLaHJieGNYSm8vbGdrMXducmI2d2dzVEhuZVhUNm1UOWJ4TVZs?=
 =?utf-8?B?WjJ6M2l0c0dzYVFrQjNGaGh1NnpFN2pHOWRwMEhVRGZYblJrd2dRNmJPVVBC?=
 =?utf-8?B?dmM1eFpKemdZQmFpVUFZYWQ0b0FEWTBpN3lHWC9tV2NlbVNyOStTNDkzdUJX?=
 =?utf-8?B?N2s3VHRiUnRKQmZFeWFwbHluTll2bFJFVlc4V2N2RkU4VWhkQUVkTzVvY2d6?=
 =?utf-8?B?OTRnU2VDUko1NlY1elEvb05DT2RoSnJXUm9CSjkzMVBmd2FaSGFXMnN2WUNm?=
 =?utf-8?B?V0ZvTC9hekZ6elJ4emhnS21RSnYyWDdsS3BUOGhxRGc1RjgxQTlGdGd6TVcx?=
 =?utf-8?B?NFZzZXpWejhNWUx4NkE4WTJ3aDB2Snh1c3VaVGVmUHZSaUxNUHFuOHp4dFRO?=
 =?utf-8?B?eHVGNE1OWUVyelRDaDk2OXZRVW9EY3pEZVdsczlJNGtQNjYvWGYzL1VnYkNM?=
 =?utf-8?B?Y2J5QVFHWWQxdFlybXVvSWIyVklKUE03QWxjRTQ0SHVmQ0ZBd2MvWWVvbVhn?=
 =?utf-8?B?WUp4dkVpNUJRaG9hVnFZdTM3cGxlVW81MmVKRmtxU3Z0MnZwODhOYlo2NHZ4?=
 =?utf-8?B?NHBwbzRjVGhGSTIwbXFwN0V4VEhDS2xnVmUwbWhHY3JXS04zbXpkUi9vYTlr?=
 =?utf-8?B?OG5vYlZPMy9haWVtaTVEb1JjblNqbE8yOXFBZ3A0SEZUYzVHN014S2JBVlZ2?=
 =?utf-8?B?bHNac2NYWEkvcWFBcFlYMkFXSERYZG9IczRrY0g3cnRBRVJrbWtreWE0RUQ0?=
 =?utf-8?B?MkxRRnNJV1J6UlZaMWYvUVAwZjNlTjNseGZob3pGS3YrTlhqQ0FLdi8wdVNL?=
 =?utf-8?B?R3Y3d0IzOEtCcnp0Um1zVVQ1QmJTQUJvZFQzeFdNOGFvTDVpcDU5M3JFMjdu?=
 =?utf-8?B?MG1MQk9ad05WeEhZa2ZKK0R0blVMV2U4cFFZKzE4aUZIb0JwejdvbXRaTFdE?=
 =?utf-8?B?WmQ4anVqMzA5S2hVVUZWejFGajdaZ1Mwc1NoSzZwMmM0UFdDb3Q0M1YwelZx?=
 =?utf-8?B?dllxWGEzRU9HV2hBbDBud1BWZWNDanQ2QWR5WVV2TDhDanlEMU5yZG1zS0t6?=
 =?utf-8?B?c0g1Z3ZRMkI2Nm5xQlpnZzZLdCtQUGZEY3k4WUd5Wlk3d1kwZlRvTnFrZGhQ?=
 =?utf-8?B?RVlLRWRlVXJaWE1vMC9KbHk2dW85dnNGQXVJUWVLMTdTN1UySHBJcng4VDdp?=
 =?utf-8?B?WE1SL05mZVA0anB6UTRQMlB6cVJ2bHFkMDNuckdFaDdVbDRVd1VJRlRBdDY0?=
 =?utf-8?B?OWx1STcrYzJHT0RTM1RUSXZWZnJaM1dUbWVuNFE2bFJ0RCtkMXNtOGU0R3lz?=
 =?utf-8?B?VFRYZ2dBVnZycmdydXdRQmJhM2x3R2pja3dxQ1NjTUdHVThIOWlIalFiRzNk?=
 =?utf-8?Q?6HLQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <74640EF090246F499AF4C10C8EB1D80E@apcprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f88a3449-7e70-4c2a-f720-08dcc5a29cad
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2024 07:42:18.3676
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KfMlERFq2QpdO3Dn2X43OhJaTtxufi+yFKzgry3eQhPCo+8w0yhTk2SwL/M2hlY/ZkyJuY1NeaJBax4RBEhCkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5810

5ZyoIDIwMjQvOC8yMyAyMzoyNywgQW5keSBTaGV2Y2hlbmtvIOWGmemBkzoNCj4gW1NvbWUgcGVv
cGxlIHdobyByZWNlaXZlZCB0aGlzIG1lc3NhZ2UgZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20g
YW5kcml5LnNoZXZjaGVua29AaW50ZWwuY29tLiBMZWFybiB3aHkgdGhpcyBpcyBpbXBvcnRhbnQg
YXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCj4NCj4g
T24gV2VkLCBBdWcgMjEsIDIwMjQgYXQgMDI6NDk6NThQTSArMDgwMCwgWXUgSmlhb2xpYW5nIHdy
b3RlOg0KPj4gTGV0IHRoZSBrZW1lbWR1cF9hcnJheSgpIHRha2UgY2FyZSBhYm91dCBtdWx0aXBs
aWNhdGlvbiBhbmQgcG9zc2libGUNCj4ga21lbWR1cF9hcnJheSgpDQo+DQo+PiBvdmVyZmxvd3Mu
DQo+IC4uLg0KPg0KPj4gKyAgICAgZHVwX2NvbmZpZ3MgPSBrbWVtZHVwX2FycmF5KGNvbmZpZ3Ms
IG51bV9jb25maWdzLCBzaXplb2YoKmR1cF9jb25maWdzKSwNCj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBHRlBfS0VSTkVMKTsNCj4gSSB3b3VsZCBldmVuIG1ha2UgdGhpcyBh
IHNpbmdsZSBsaW5lLg0KPg0KPiAuLi4NCj4NCj4+ICsgICAgIGR1cF9jb25maWdzID0ga21lbWR1
cF9hcnJheShjb25maWdzLCBudW1fY29uZmlncywgc2l6ZW9mKCpkdXBfY29uZmlncyksDQo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgR0ZQX0tFUk5FTCk7DQo+DQo+IERpdHRv
Lg0KPg0KPiAtLQ0KPiBXaXRoIEJlc3QgUmVnYXJkcywNCj4gQW5keSBTaGV2Y2hlbmtvDQo+DQo+
DQpIaSBBbmR5LA0KDQpJIGhhdmUgcmVmb3JtYXR0ZWQgdGhlIGNvZGUgYW5kIHN1Ym1pdHRlZCBw
YXRjaCB2Mi4gVGhhbmsgeW91Lg0KDQpCZXN0IFJlZ2FyZHMsDQoNCll1DQoNCg==

