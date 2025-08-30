Return-Path: <linux-gpio+bounces-25223-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CCFB3CB21
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Aug 2025 15:20:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A1D13BA4F1
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Aug 2025 13:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3854422156D;
	Sat, 30 Aug 2025 13:20:21 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022141.outbound.protection.outlook.com [40.107.75.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E15336124;
	Sat, 30 Aug 2025 13:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756560021; cv=fail; b=Dht1rnCASL/TF5xevaAucXFE5gwS2j78iZs0JS5kMOk42HK2HxFV7EfjlZsGZEpvMZCItmOb+zN77JlRhN2VkcN7eRJXsonuDm5HIbKxpn59ZCURQELXaIAAJX9J+4onyZ5rOP471Gfz9Mfq/ry4yZ5F5ov5we/H+STm5o8hSO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756560021; c=relaxed/simple;
	bh=VnAawR5bsp30a8N64YT7NpgJolQ7dw/1BYzTEFSUTj4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=c2wdMfhfubof1PN/oYuyjSUIqlx21ihvb+aNGqpRFyR9joglz3UcGc7V6mEpZsRjzgHmrrvGD8fT4+YI4ukSwjJAuHw4Bg5hFlE62NW5PJsANWtraJHHkO9C+7dFwn8f+4hNwPKAPGUsmk0/TisE809BTw76SedJehDvo97hYk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QPYh/6Trs6BmNyht/fqbM5bwZ6pZH5QXxAW7cADzs9eWK1lPHKiZeQsjRm6xPZC91etwH9MGkEkND4bvnX7QrlV3u3P9TyDkRyoq/tAjeivp4IYPlBkuJpPMiEbVigq9db2bapnvbj1C6TzQX1RjDLKjtlAoqWO87LUmMCFx0prkTIebEjan5ZGY0PVIWrKitAoPCEeejCaxKD3mo0MO8iNfJ89F0o1vFgJgV73D+SlALVpJIyb7p1fgAWBLHKdQ4156pCC5Gz62pyNmM0XVb0nSMS+0prDqr+IdEqY0cCkcuuqDYx9rWFoHEikuU9Bv2pUKkhG1Vk83HOKs7rH5EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VnAawR5bsp30a8N64YT7NpgJolQ7dw/1BYzTEFSUTj4=;
 b=Hg6JYlvyOl7iaqq8Bra53jftOgyKe9rNEBMKYUs0Xa8Xz4JUnJ17DhTPwesOKaP5QhIUlrLGN+lTFiBCOnn2zxgHWn2qpvDiPtyaP7vu9tt6AT2O9VaXqJlJTK9a/zUctpCK0LYPr5U9A0W/xecuuACpkj2K9ug6GfScilE7zv+1FT1TcX3Crf83UCo0wkXPjsWAna/dI9CJkh6Yc8g9aAgAFwSWqndyE6wgby+1xvLu9xh5oUGgPDCYzFiLU48/vlSzj4Rn4ZIxWNl3Cg8sHOT/9vZkYccJwomRKo1ji1i4QE5dkmy/7FQ6sZFwtG16YBqBnVnn7OSYdpmYRAGxBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com (2603:1096:301:117::13)
 by SE3PR06MB7982.apcprd06.prod.outlook.com (2603:1096:101:2e4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Sat, 30 Aug
 2025 13:20:14 +0000
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d]) by PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d%4]) with mapi id 15.20.9073.021; Sat, 30 Aug 2025
 13:20:14 +0000
From: Gary Yang <gary.yang@cixtech.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>
Subject:
 =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggMi8zXSBkdC1iaW5kaW5nczogcGluY3RybDogQWRk?=
 =?utf-8?Q?_cix,sky1-pinctrl?=
Thread-Topic: [PATCH 2/3] dt-bindings: pinctrl: Add cix,sky1-pinctrl
Thread-Index: AQHcGbDSnb3P6RHi50G00ttMBxj5IQ==
Date: Sat, 30 Aug 2025 13:20:14 +0000
Message-ID:
 <PUZPR06MB58871C2E108BF1AC057EF461EF05A@PUZPR06MB5887.apcprd06.prod.outlook.com>
References: <20250827024222.588082-1-gary.yang@cixtech.com>
 <20250827024222.588082-3-gary.yang@cixtech.com>
 <0fa7e2cb-fa0b-4f9e-84d6-a4b2b3d8a4cf@kernel.org>
 <PUZPR06MB5887D9A879D16DC6A8C8ED58EF3BA@PUZPR06MB5887.apcprd06.prod.outlook.com>
 <25283b66-4cbb-4db9-9b1e-7a4e6e3db2a1@kernel.org>
 <PUZPR06MB5887887C93BFF42BC8417D96EF3BA@PUZPR06MB5887.apcprd06.prod.outlook.com>
 <CACRpkdYC-3qybKW7VH5MVfBc3oqSrOa2RTt1Q=p=HHsi5drGOQ@mail.gmail.com>
In-Reply-To:
 <CACRpkdYC-3qybKW7VH5MVfBc3oqSrOa2RTt1Q=p=HHsi5drGOQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR06MB5887:EE_|SE3PR06MB7982:EE_
x-ms-office365-filtering-correlation-id: d8a3a4a7-d6e8-4260-9f5b-08dde7c7f4b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?YkVTWlQxSnFtd1kvOUJmTXhJWi9UWDRURmo4Q0MzVzFGelF3ZmtuSnA4TjBB?=
 =?utf-8?B?L3psY21tejg2UjdVVXE4Q2J0N2o5YlFaQlgwblRqVUpiQVF1K2VTTDNrdzc1?=
 =?utf-8?B?ai9VWUtUTG1MYkdqc05vVDQyWVBSZE8wRjRRaEpDTUtVUEZldnhVcjUvMmFG?=
 =?utf-8?B?eGJGWlFPcXF4VHdKOFdoTytIVnl1T1h1ZjdPVW90bmNUZ3VNeUNxQ25UTkVx?=
 =?utf-8?B?N1lKeTZrVnBjR0R0VXBuektkcnlvRWVnUDE4VkVLd0xHVWhIR0RiZnpINzhw?=
 =?utf-8?B?Tldiekd5WjJRNG9SaldDTjQ3MUQvQWVWci9IU002SjYxQzVwa3poTEdBTFRW?=
 =?utf-8?B?ZG5aZjVlejhsNnlnb0RlRXVXNGpJTGFBWFArcTB3RUFkQmRHS25JWFM3OGtF?=
 =?utf-8?B?Zm5WOUxYcUxKeENVMU9EblJnUWV5bVJVNDNEYXMrdGREdlllVE1mTUJ6Y0JW?=
 =?utf-8?B?em5RN1pxK0pkZFNoT3pwK0JnNDY4d0MzMzQ5bHJPR1U1RHptQnhmd2hRcFB5?=
 =?utf-8?B?Zm41RUg0anIwNlRwSnh5cHRHMzcybUlCS2NRNGN5MHVnWTBsVTBteElScXFj?=
 =?utf-8?B?ZGZ0MHlRUWs1dk1wRWc3WUdqSGpRbmdlcHB3bVNhS1EyKzNrQSt4YzBwYlNR?=
 =?utf-8?B?c2Z0aG14aEpoTlJtL29hQmJMY2hMVW9rRXgrTTQvcE94aWovdy9rY2x0cWlT?=
 =?utf-8?B?ZjE3MHc0TGpFWnVLbmFRUnhRM1FhajRaTzh3MG5NaVg5TjlOQi90V0cwUTJD?=
 =?utf-8?B?MldONjdBMmtqNURmN1AxbUppTjh6aDFRaFI3VFhwdTVSKzVRTFhvdlB5d2Ez?=
 =?utf-8?B?VktOaTRmVXk5TEtjZ09adytmQjdFK1BJRWF4WkJQcnE1UUtFbjRSRHBtRkZZ?=
 =?utf-8?B?SlVOdlRnc0E5dmhZZUNCUDlVMnJtTGx5dldTeHkvQ2c1RzhNWTF1MlF2TEw0?=
 =?utf-8?B?NVRqanV2dzFPK0RSV0Q5SEQzd0lnQ0MxS3E4aWMzWStYMnYxRjN3bDdUenEz?=
 =?utf-8?B?dGpFSVJ0d0p1MXovQnAyQ1BPcEx5RnMvcFc0UldiREEydlorczNnSHJHZDFE?=
 =?utf-8?B?enhSRkw5QW1qajlwdkw4LzFjcTJaeStLUG4wV1g1VW9OMHNKSFl1N3pHS0RP?=
 =?utf-8?B?Wi9xaVUrWDJXS2lVVXpkRTZRZ2RQMjgyUGEvNytFZFZxUDVta2hEejhnb0tY?=
 =?utf-8?B?SWhhem1RWWxMRTdQQ0hNSUZFeFVwdGFteldaeHhvcmZmbVNyUFpzSmZ6eFpl?=
 =?utf-8?B?dTY5dVpQZTRpbngyYXc4TEdzdCtIQTVjaWdzc0NNQmxBdURNNU1ZQ3BXSnRW?=
 =?utf-8?B?MG5hYUh0dVZCODQrVG9wVjE5VDg0TUVWUE5zWlluenVpTjJuMXFjMzFTbmZk?=
 =?utf-8?B?MHNIOXYzd2ttdkZjWHJ4N29nVXlmTjI1WDJwbEZwam1SWFE5WmZPbUE4eEow?=
 =?utf-8?B?d24vVlgxMVdQQlNqbVovWVo5OFVCbXdGZTlsakVTdnhzSTdqQ1FUSVcvYUI5?=
 =?utf-8?B?M2ttWHhTSHVVQkwxenloVFJ2bEFhU2hyamlWRUphbHRzK1JJQXIxM1YvbVpp?=
 =?utf-8?B?Qm9tZzVZbmVLNG85bUZDT0VpOTRFTTF3a1ZoT0RTQWJNeEpDY0M4Zmw5c3h2?=
 =?utf-8?B?d3JWaXNHRGFqcC9CSzhNVmNpTzFpcTFCcnpwSkxhaXJDNnl5L2dpdWN4SXpS?=
 =?utf-8?B?NFhOeGlsNXg1d0tTNUMxcll3QXQyRDd2WGowSEVrTmhFN0s3bnluNTNiM3B5?=
 =?utf-8?B?N2k5c2FLQjVGei92THBVWVhGWEFCRyt0ckg1eGNKc3BGc01NbDdzYmNIVXhj?=
 =?utf-8?B?NkV5dFhjdEtzWjg1dW1HZFdqSjcrQStuc3BMaXNkZHdHU0FScGFHdWhzS2tX?=
 =?utf-8?B?QmdVUHlxS1d2Q0VUT2xxcGx4TnpXQ3IxYkVlRGZRd3BaK1NLSVNDSjJ2K25S?=
 =?utf-8?B?Njc1QS81cm8zWXptM3B4NnV1QVg3YUYvaERpK2JPTHM1UnlDbWFsbXY4dEt5?=
 =?utf-8?B?SWw2UXNRR0lRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5887.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SGQwb2Q2bkh4TisrcUJIV3VMZFdUTVhpRVUrTVh0anNmRzY2eXJLYWs0Ymcv?=
 =?utf-8?B?dGt3UG8rMDRhV2lwYXVlU1RYN0VaNThWVy9LWkZ4NVd4eCtCbEVHbnV6ZGlm?=
 =?utf-8?B?Y0E4Y09xc0o1MGNRaTVvQ3NWOVJ4YU0xK1RRMndPRkpRVnFXMCtFYjNGZXpr?=
 =?utf-8?B?aHFvOW9lK1QrTjh6N0sza2dEVjkvU3RnV0RSK2w1RU5SaUVoRkZTbUFOMHV4?=
 =?utf-8?B?YXJTbjJmdVd6dUhFT0ZIZlU5a3BUTGlWSWZHdGJXSjdsR21NTS9VOHp1THd1?=
 =?utf-8?B?UW9acVQ4K21mbXcvMEFqZnVUcmVqazhManVzOU9QUnE5cS8vb3lpZVJjU1h0?=
 =?utf-8?B?STdRYi9YMjZxZkFnb1lCVVE0b2lZVllKclhmNW9mZGkwNVRoYnF0NVRWQlVF?=
 =?utf-8?B?cXZaNDFRRzJNZ3RpRXFxcFg5SWlSUUVEMmc0YlM4T055L3hUekNzRDl2Q2J0?=
 =?utf-8?B?VkwyRElFRVNPdkVZbzZwVDhmTTROcldsZjQvNjBGR1pCTnAxNEg0c2xnVmU1?=
 =?utf-8?B?QjhIalpaQXlKU1dYYW9hbk9aYW1IVG1Cd3NiS0pZUXJWZWtFSHN3TFl4d1U5?=
 =?utf-8?B?SWJZODZOcXJXL2hpajZzeDFVaWVKS25uK3VZRDBkR0c0azQyTjErbnVIUUcr?=
 =?utf-8?B?eTVZVWh1NGc3VUpGVUVQZ0dXL1psUXFmd0FmbDIvcWwvd01wYW5xaE1wa212?=
 =?utf-8?B?R3RPS0I5VFkzdEd6SG5LWFZwcGZpMUZhSFVpN2o2WFR2RzVEZmp0N3lub3ZJ?=
 =?utf-8?B?NlhOL2FteFFOZDBCME9YZWV4Q3ppWmNiaXQ0ZGxhbzVrRXFDTDlEelJ5WDE5?=
 =?utf-8?B?VlVPNU5UK0pFcTlaUVpoRmNFVndSNUxQSEdCUjV3V0RiZzNpcFdYdGRyRjBr?=
 =?utf-8?B?MEZOK0FkVWpBd3hEMWhLVnNndUZzNFNHV3FKSTR2RVYzUzNlSVNVVEhubGVW?=
 =?utf-8?B?UnM4RVNrRnA5ZE1UT21vbHd3c2FtbDNMY3JmYlo0T1VmVGNJK05MajdQNUg5?=
 =?utf-8?B?K0RYN1NMRXpNaTdxS2NOdHFVaE1WaGRkNEh1WXlDNVJJNGhqUndwY2xpQlZ4?=
 =?utf-8?B?ajAyTWRDS1B2WDVuYk1FeVQzbHlkblIwSXZmMnlQczVaRlk0RkdpUHNkWW5y?=
 =?utf-8?B?UFc4VHRLazZ6MUxvWTdOM0NlaHhZUGxKdDFpY01OREs1UTk4YWlIS2lOYW5p?=
 =?utf-8?B?ajdYR2hhUitpVWEvMDNNOEJIRG4vMzN3L1Z3M2gvWWQ2Y216T1RMenEreHRM?=
 =?utf-8?B?MVFndENDL3dvcWxUS0lVdC9heVdUNG9TT3dXRVlFcEpOUS83cWVIN2ZtTlJO?=
 =?utf-8?B?VTB0Y2lYSktIbkJucUlGaElaaHF0TGg2Z1VQWndLWUU0RGc3cjA2cmRsbDhL?=
 =?utf-8?B?Ty9VU0FVaGRrZUc4Yll2TVB2SWhzMzRiN0xWZzNKbHpITFZzS3ROV0tSSkwv?=
 =?utf-8?B?TGJUYzdzcHFyUlpkWXRpRWlUQ0s2dXZiSXV6RitabmFwMG9VaVJmMWp2d1dn?=
 =?utf-8?B?eW95eXR0anVHWEEzNittZHBqRU9na3hxN1FpSjR4ZE5KaTdsek8wcXlscmFi?=
 =?utf-8?B?N2UxeHc2T1R6QVhFR2lPR3B3cFhrS0ZjSE13NStpTmFkTDMxU1IwUm9waDhE?=
 =?utf-8?B?OFpJRHpKUWU5dE1sb2orMHNESGxrZ1JyaUt0dzFMNWNvZWlIRnhIOURhTCs2?=
 =?utf-8?B?MXN5QURjbVlGblRqVFJodHhXNDM5ZnlBMlJYdDVRV0c0dUxqY1FMd0tRV0lB?=
 =?utf-8?B?V0wrQWZ4S3NEeTFsUXl4VkhpOWZENWFYSFVMSHBMWG12QlpIWEdaSTNkMDlQ?=
 =?utf-8?B?dnNseHNlR2V2Y3hQNmpiWU5BRklHNjRnNm9aVGxvbDQvdXVWazlUOW1uTWUr?=
 =?utf-8?B?UGpQdjFIUHcvNlZuaWZmVlBhanBTSUY5d2JWK2UzM2hkdWRPL2xwTXptVjYy?=
 =?utf-8?B?WXk5RDhwVzUxNkRIcGF3NnI3ek5KdjZwejN2azh4djZYTVJ1Qk5qNkJQOW03?=
 =?utf-8?B?TXFvOFIzUFk3NXcvMUFkdHV3bWNVeVhjdjQ4TEhIWm1kcFl3N2E3ZVAvdStQ?=
 =?utf-8?B?dGpObmpUU0RweWduVUtKb1lvMmpkMVN3dFJTazJJeWFsM25EQnJ2cFNoNzRy?=
 =?utf-8?Q?GG9Q1crsaOtBL1K635Viu6ClU?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5887.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8a3a4a7-d6e8-4260-9f5b-08dde7c7f4b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2025 13:20:14.5978
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eSJII3+f0fFXABtUbYGZUCbbS39pnbVz4eZrTZekfIJh9Pe/v/m2pHS8dU+enzY1hPeF7DywnovrIJp7XmLQ7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB7982

SGkgTGludXMsDQoNClRoYW5rcyBmb3IgeW91ciBjb21tZW50cyENCg0KU29ycnkgZm9yIGRlbGF5
IHJlcGx5DQoNCj4gDQo+IE9uIFRodSwgQXVnIDI4LCAyMDI1IGF0IDEwOjU44oCvQU0gR2FyeSBZ
YW5nIDxnYXJ5LnlhbmdAY2l4dGVjaC5jb20+IHdyb3RlOg0KPiA+ID4gT24gMjgvMDgvMjAyNSAw
NzozNywgR2FyeSBZYW5nIHdyb3RlOg0KPiANCj4gPiA+ID4+IFdoYXRzIHRoZSBkaWZmZXJlbmNl
IGJldHdlZW4/IFlvdSBoYXZlIGVudGlyZSBkZXNjcmlwdGlvbiBmaWVsZA0KPiA+ID4gPj4gdG8g
ZXhwbGFpbiB0aGlzIGJ1dCBpbnN0ZWFkIHlvdSBzYWlkIHNvbWV0aGluZyBvYnZpb3VzIHRoZXJl
Lg0KPiA+ID4gPj4NCj4gPiA+ID4gQ2l4IHNreTEgaGFzIHRocmVlIHBvd2VyIHN0YXRlcy4gUzAg
bWVhbnMgd29yayBzdGF0ZS4gUzMgbWVhbnMgU1RSDQo+IHN0YXRlLg0KPiA+ID4gUzUgbWVhbnMg
U0Qgc3RhdGUuDQo+ID4gPiA+DQo+ID4gPiA+IFRoZSBwaW4tY29udHJvbGxlciBvbiBza3kxIGhh
cyB0d28gcG93ZXIgc3RhdGVzLiBUaGV5IGFyZSBTMCBhbmQgUzUuDQo+ID4gPg0KPiA+ID4NCj4g
PiA+IFN0YXRlICE9IGRldmljZS4gUGxlYXNlIGNyZWF0ZSBiaW5kaW5ncyBmb3IgZGV2aWNlcywg
bm90IHN0YXRlcy4NCj4gPiA+DQo+ID4NCj4gPiBTb3JyeSwgbWF5YmUgSSBkaWRuJ3QgZXhwbGFp
biBpdCBjb3JyZWN0bHkgYmVmb3JlLCBhbmQgdGhlbiBtYWtlIHlvdQ0KPiA+IG1pc3VuZGVyc3Rh
bmQNCj4gPg0KPiA+IFRoZXJlIGFyZSB0d28gcGluLWNvbnRyb2xsZXIgb24gc2t5MS4gT25lIGlz
IHVzZWQgdW5kZXIgczAgc3RhdGUsIG90aGVyIGlzDQo+IHVzZWQgdW5kZXIgczUgc3RhdGUuDQo+
ID4NCj4gPiBUaGV5IGFyZSB0d28gZGV2aWNlcw0KPiANCj4gSnVzdCBleHBsYWluIHRoaXMgaW4g
dGhlIGRlc2NyaXB0aW9uOiBhbmQgZXZlcnlvbmUgd2lsbCB1bmRlcnN0YW5kIHdoYXQgaXMgZ29p
bmcNCj4gb24uIFNpbmNlICJTMCIgYW5kICJTNSIgY2FuIGJlIGVhc3kgdG8gY29uZnVzZSBmb3Ig
InN0YXRlcyINCj4gaXQgaXMgZXh0cmEgaGVscGZ1bCB3aXRoIHNvbWUgZXh0ZW5kZWQgZGVzY3Jp
cHRpb25zLg0KPiANCg0KWWVzLCBJIGhhdmUgcmVhbGl6ZWQgdGhpcyBwcm9ibGVtLCBUaGFua3Mg
Zm9yIHlvdXIgcmVtaW5kLg0KDQo+ID4gPiA+Pj4gKyAgICBwcm9wZXJ0aWVzOg0KPiA+ID4gPj4+
ICsgICAgICBjaXgscGluczoNCj4gPiA+ID4+DQo+ID4gPiA+PiBObywgdXNlIGdlbmVyaWMgcHJv
cGVydGllcyBmcm9tIHBpbm11eCBzY2hlbWEuDQo+ID4gPiA+Pg0KPiA+ID4gPj4gWW91IHNob3Vs
ZCBhbHNvIHJlZmVyZW5jZSBpdC4NCj4gPiA+ID4NCj4gPiA+ID4gRGlkIHlvdSBzdWdnZXN0IHVz
IHRvIHJlZmVyIHRvDQo+ID4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGlu
Y3RybC9waW5jZmctbm9kZS55YW1sPw0KPiA+ID4gPg0KPiA+ID4gPiBNYWtlIHVzIHN1cHBvcnQg
ZHJpdmUtc3RyZW5ndGgsIGJpYXMtcHVsbC1kb3duIHByb3BlcnRpZXM/DQo+ID4gPg0KPiA+ID4g
YW5kIHBpbm11eC4gVGhlcmUgaXMgYSBzdGFuZGFyZCBwaW5zIHByb3BlcnR5Lg0KPiA+DQo+ID4g
T2ssIEkgc2VlLCB0cnkgb3VyIGJlc3QgdG8gc3VwcG9ydCBzdGFuZGFyZA0KPiANCj4gVW5mb3J0
dW5hdGVseSBtYW55IHBpbiBjb250cm9sbGVycyBoYXZlIGZvcmdlZCBhaGVhZCB3aXRoIGN1c3Rv
bSBmb28scGlucyA9DQo+IDwuLi4uPjsgc2V0dGluZ3Mgd2hlcmUgdGhleSBzZXQgdXAgbXV4IGFu
ZCBlbGVjdHJpY2FsIGNvbmZpZyBieSBPUjppbiB0b2dldGhlcg0KPiBkaWZmZXJlbnQgYml0cywg
YW5kIHRoZW4gdGhleSBqdXN0IHBva2UgdGhpcyBpbnRvIHNvbWUgcmVnaXN0ZXJzLg0KPiANCj4g
VGhpcyBpc24ndCB2ZXJ5IGhlbHBmdWwgZm9yIHVzZXJzLg0KPiANCj4gSSBpbml0aWFsbHkgd2Fu
dGVkIGFsbCBmdW5jdGlvbnMgYW5kIGdyb3VwcyB0byBiZSBzdHJpbmdzIGFuZCB0aGVuIHRvIGFz
c29jaWF0ZQ0KPiBncm91cHMgd2l0aCBmdW5jdGlvbnMgdXNpbmcgc3RyaW5ncyBpbiB0aGUgZGV2
aWNlIHRyZWUuDQo+IA0KPiBCdXQgSSBoYXZlIHJlYWxpemVkICh0aG91Z2ggbXVjaCBwYWluKSB0
aGF0IG1hbnkgZGV2ZWxvcGVycyBkb24ndCBsaWtlIHRoaXMuDQo+IFRoZXkgd2FudCBhIG1hZ2lj
IG51bWJlciB0byB3cml0ZSB0byBhIHJlZ2lzdGVyIHRvIGNvbmZpZ3VyZSBhIHBpbiwgYmVjYXVz
ZQ0KPiB0aGVpciBoYXJkd2FyZSBoYXMgb25lIChvciBzZXZlcmFsKSByZWdpc3RlciBmb3IgZWFj
aCBwaW4uDQo+IA0KPiBTbyBub3dhZGF5cyB0aGUgbW9zdCBjb21tb24gaXMgdG8gdXNlIGEgY29t
cHJvbWlzZS4NCj4gDQo+IEEgbWFnaWMgbnVtYmVyIGluIHRoZSBwaW5tdXggcHJvcGVydHkgdG8g
c2V0IHVwIHRoZSBtdXhpbmcuDQo+IA0KPiBGb3IgZXhhbXBsZToNCj4gDQo+IGFyY2gvYXJtL2Jv
b3QvZHRzL21lZGlhdGVrL210NzYyMy5kdHNpOg0KPiBwaW5tdXggPSA8TVQ3NjIzX1BJTl83NV9T
REEwX0ZVTkNfU0RBMD4sDQo+ICAgICAgICAgICAgICAgIDxNVDc2MjNfUElOXzc2X1NDTDBfRlVO
Q19TQ0wwPjsNCj4gDQo+IFRoZW4gdGhlIGVsZWN0cmljIHByb3BlcnRpZXMgbGlrZSBiaWFzLXB1
bGwtZG93bjsgdG8gc2V0IHRoZXNlIG9uIHRoZSBzdGF0ZToNCj4gDQo+ICAgICAgICAgaTJjMF9w
aW5zX2E6IGkyYzAtZGVmYXVsdCB7DQo+ICAgICAgICAgICAgICAgICBwaW5zLWkyYzAgew0KPiAg
ICAgICAgICAgICAgICAgICAgICAgICBwaW5tdXggPSA8TVQ3NjIzX1BJTl83NV9TREEwX0ZVTkNf
U0RBMD4sDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxNVDc2MjNfUElOXzc2
X1NDTDBfRlVOQ19TQ0wwPjsNCj4gICAgICAgICAgICAgICAgICAgICAgICAgYmlhcy1kaXNhYmxl
Ow0KPiAgICAgICAgICAgICAgICAgfTsNCj4gICAgICAgICB9Ow0KPiANCj4gVGhpcyBpcyBhIGdv
b2QgY29tcHJvbWlzIGJlY2F1cyBpdCBsb29rcyBzaW1pbGFyIG9uIGFsbCBTb0NzIGFuZCB5b3Ug
c2VlDQo+IGltbWVkaWF0ZWx5IHdoYXQgaXMgZ29pbmcgb246IHdlIGVuYWJsZQ0KPiBTREEwIEFu
ZCBTQ0wwIGFuZCBkaXNhYmxlIGJpYXMsIHNvIHRoZXJlIG11c3QgYmUgZXh0ZXJuYWwgcHVsbC11
cCByZXNpc3RvcnMgb24NCj4gdGhpcyBidXMgc2luY2UgSTJDIGlzIG9wZW4gZHJhaW4uIFZlcnkg
ZWFzeSBmb3IgYW4gZWxlY3Ryb25pY3MgZW5naW5lZXIgdG8gZ3Jhc3AsDQo+IHRoZXkgZG9uJ3Qg
bmVlZCB0byBiZSBjb21wdXRlciBlbmdpbmVlcnMgb3IgZGV2aWNlIHRyZWUgZXhwZXJ0cy4NCj4g
DQoNCkkgYXBwcmVjaWF0ZSB5b3VyIGNvbW1lbnRzLiBZb3UgYXJlIHZlcnkga2luZCBhbmQgbmlj
ZS4NCg0KSSB1bmRlcnN0YW5kIHlvdXIgdGhpbmtpbmcgYW5kIHRyeSB0byBzdXBwb3J0IHRoZSBz
dGFuZGFyZCByZWZlcnJlZCB0byBhYm92ZS4NCg0KSSBvbmx5IG5lZWQgdG8gc3BlbmQgc29tZSB0
aW1lIHRvIHJlc2VhcmNoIHRoaXMgc2NoZW1lIGFuZCBkZWJ1ZyBpdCBvbiBSYWRheCBPNiBib2Fy
ZC4NCg0KSWYgbWlzcyBhbnkgaW5mb3JtYXRpb24sIHBsZWFzZSByZW1pbmQgbWUuIFRoYW5rcyBm
b3IgeW91ciBraW5kIGFnYWluLg0KDQo+IFlvdXJzLA0KPiBMaW51cyBXYWxsZWlqDQoNCkJlc3Qg
d2lzaGVzDQpHYXJ5DQoNCg==

