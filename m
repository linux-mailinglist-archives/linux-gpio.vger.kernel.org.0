Return-Path: <linux-gpio+bounces-26310-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB89B831C2
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 08:17:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C87F4A2E1B
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 06:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC6F2D73BA;
	Thu, 18 Sep 2025 06:17:36 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022117.outbound.protection.outlook.com [40.107.75.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2948F29A9FA;
	Thu, 18 Sep 2025 06:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758176256; cv=fail; b=MXU24QaccKue2JXhrun6LUzKlX/Cz7u6pkXpnnKiTI629CbsfaDHrFrb5OikQ2zwzugFzgdWygGp0lrLab0ymei8B0vDw4lNvhswwFJj5X6DvVmq6klWQQfIq9cW1O+FygZzL8EzSDrsWEzAqoXL+NTuQlb0nKDLvwc/1FeTc5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758176256; c=relaxed/simple;
	bh=jfrZ1E0UnLW+mgXyixnE9A7YAZV6ZoPnug0TMxVeV8Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eIMuumoenRzSx2CvGHeTXiYQxUPdWIgCGrM0fhPXn6nDkgfIiJG51seFx4o6dSD+s1zU6hPUlsrXCa9hSI361EnzQ3eWifgJ5tDpgLEkyLu/MdAu4n4WaT6kkvYxsbWJJ12VariivPTv6S0zlbmpYVest41/71NPT9isG1Q/mQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qkL8cQbj+/ar9+gdpdhQtCRJabm/8SPg0hM9MkH+NO4ZW6K+UTQ2g1fqfRTlWR6LkhSHD6waAuxNjBZRYpnYqNs0+wdI/gcbTEus42nqYuVVpfbE4byINrBo549NpQ1cDU4fHGiBZt08WrZIb8HNX3J6Jg13PZg/jCO78EeN46izPtW/bffgtYjmzpm4jj3qQrQQhwYTwyFUCJeuZWOGK0av7iSkUNrjWfEEpwUBGj+FuTPvpTa41fOuT8DV91xQr9S8+QzMVTyqRlDbmwP5fLVKkB080PNALEDGeKILAHNzoF2NGiW43T75mYCiQ2wB8k0o8nfcB+tO+vNGUQr7UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jfrZ1E0UnLW+mgXyixnE9A7YAZV6ZoPnug0TMxVeV8Q=;
 b=Jg5LBjZBFfR24wUToGewV109coFTYdzrT6PnzWWuUrbD/B/qMlj2tOldklpzfZiRJRKJ43iz4LsEdqnSrc3M1hXcWeTYHPZ47RG3h5o9yhM1wRA4cSawyxn1hFEOm4ly88F47fqWpXJx2tul6mHA/ekiPHRGmDh3oHxaYy8uIf9GxH5kXrNntKIUr2DJNgpFObWQc3NAxAHZ9FdOxzmxVRWiCgJy0Y5HsZ33oEMQEUc4CBUZc1Zn+a6ZtElT5YZOd6m/kZa3z0GahhgYOklxH1sbbCBT+DFqXt7d6EmjUsKqwe8T7djnf7294MKAooNJAyw5b+bEkiqDO1OPlKyIJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com (2603:1096:301:117::13)
 by JH0PR06MB6965.apcprd06.prod.outlook.com (2603:1096:990:6a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 06:17:28 +0000
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d]) by PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d%6]) with mapi id 15.20.9115.020; Thu, 18 Sep 2025
 06:17:28 +0000
From: Gary Yang <gary.yang@cixtech.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>
Subject:
 =?utf-8?B?5Zue5aSNOiBbdjIgMS8zXSBwaW5jdHJsOiBjaXg6IEFkZCBwaW4tY29udHJv?=
 =?utf-8?Q?ller_support_for_sky1?=
Thread-Topic: [v2 1/3] pinctrl: cix: Add pin-controller support for sky1
Thread-Index: AQHcI6tw6+x/ILBPUUWp4esQTXOPtLSPcekAgAQSvmCAAGttgIAEYAuQ
Date: Thu, 18 Sep 2025 06:17:28 +0000
Message-ID:
 <PUZPR06MB5887DA8FE0E128993F11E2B3EF16A@PUZPR06MB5887.apcprd06.prod.outlook.com>
References: <20250912060650.2180691-1-gary.yang@cixtech.com>
 <20250912060650.2180691-2-gary.yang@cixtech.com>
 <CACRpkdYgTjerG5mks_+3sjhKKYtCsFY=1NWhgw_YEuib7gZm3g@mail.gmail.com>
 <TYUPR06MB5876BB28E3C30EEB9BB05997EF15A@TYUPR06MB5876.apcprd06.prod.outlook.com>
 <CACRpkdYKnFAyq8C5h2=5NQ8AU92RmzShNHd6+=21rWednjv-fA@mail.gmail.com>
In-Reply-To:
 <CACRpkdYKnFAyq8C5h2=5NQ8AU92RmzShNHd6+=21rWednjv-fA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR06MB5887:EE_|JH0PR06MB6965:EE_
x-ms-office365-filtering-correlation-id: cc687d4a-7ce2-4261-3c85-08ddf67b0b0a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?YVN2U0kzYnFqU0k5YzRZRnRhLzhGdDVOdC9vTUpzb0g1WXJMY1JBN0RrL0xJ?=
 =?utf-8?B?YkhWQzJPOGR6aGc5N295d3hkUXBaUjBmWmtPOXg2RWdLS3RzR3pnZmcwWG9s?=
 =?utf-8?B?alErZXlSMjROSGQrUEJFWmxyeUtTUlRNYzcyZ1RaQXJNVUJPalBaSndtSUVT?=
 =?utf-8?B?WnMyNGszLzJkTW1iWk1rTU4rdmozT1JrWHQrVWxSZ0VnM2hGVHQ2SVl4OTcv?=
 =?utf-8?B?RXFUOEV6bTgveFlsVUc2WVA5MDBzRGRaMSsvbGVlTmU0NEx6RldkdGVpVVFt?=
 =?utf-8?B?Y0ZCZ3pSdHc5UUVUcnc5VThVYU1rdEFia0tkU05kQy9JeWtGcXQwWklLMHBZ?=
 =?utf-8?B?V1ZDODA3dTZsUDFTK3pvMkNta3FjVDRJR0h6a3lUVzhIYUlSRGFvSG9MYjhT?=
 =?utf-8?B?N2dCdU9sc0hWWmNjQXR0UGwxT2lOV203eURWcmczNXNIOHllTS9pQ3VnZmZ0?=
 =?utf-8?B?bFBvNDN3cGZrUDhSV2Y0dDVpUzJvU0V4WGYxQ2h3MTVSbXQrK01YdFRFZ0Ru?=
 =?utf-8?B?QklNL2l2N3JFendJbEF4RjdJSUlhbjZzNnNScGkvYk5BbUhRcnZxU0Z4WVc0?=
 =?utf-8?B?OGsxWlkzOGNvV204ZXJkTm5FNmtuUFZRSzdSeGo5ZWxjaGRpQjd4d0ZMZVZQ?=
 =?utf-8?B?YVhmZER4L3k1UHIxa1phMVAraTZia0VqRkpoblM5ZXA2VzdhVHFVMWxqcWtx?=
 =?utf-8?B?M1lhRWplY0FZR2kwKzJpc2NHK242M0w1OUhlUmFodFJMNmpIQmVncHNFRTZr?=
 =?utf-8?B?ODRYdzZSK1RiUnNHK3lCR0xpWndyYW1FclJlc3F6TnBiSExxcU9MWmtKMkJu?=
 =?utf-8?B?YWxteXlZcGNmMndxTU4wdGhrTWVNVDBGYndmVnQ1UDJjbEhWQ0tBS1RaZjl1?=
 =?utf-8?B?YkgwQkxFbW5rWEJCc2htcG84TWxLMDBsZzU5anZKcGVQcXYxZ211TlpVeExY?=
 =?utf-8?B?RmJpb013SHRqaVVyR0lNN1NUWHBVSm5GSHN0dDVqM3lzZmkwcXdNWVlGVEpG?=
 =?utf-8?B?MHpZeURlaktRYTRqVm4vekViMGNWdGQxUk1XOGN2QjNFNDFnb0NvNXYrWWRK?=
 =?utf-8?B?K3pSYkxQTmNWZWZtanlDYjRuaW9EcEJSVVlpc3R6Skd0ck9qZmxtZklYK3Vi?=
 =?utf-8?B?dHhHSWFWZUNkcDdLM1Q4OHlhRXFLU2V2MDBxNG5RV2MrWkl0SzE1THdBL0s0?=
 =?utf-8?B?Sm56YzFQeFgzMDNOeEsxTjVQWWEyZVRzNE1Db09ma05JU1hwVW40Ym4rZklE?=
 =?utf-8?B?K3Q0Z2Z4Z0FoSi9sczQyR1ZkR2k0U1lsRUgrK2g5THduNmVlSzF5dG1pQUxG?=
 =?utf-8?B?bTBWU09iZ3EzK2N2enU4L3lmeGlhcnY1M2FHRW1BWE90M3hOS1gxUHN6L25P?=
 =?utf-8?B?Zk5nTUx3WjBOdDZjb3oxQWRGbVJVRnNpTmNIMjJNZGRacHRwVlA3SFcvSjIy?=
 =?utf-8?B?TTdmdnRyY0x1emVXZlZJbURTNzNCc1owNml2emsrOHNzUTMvRHRMYjlhdDE2?=
 =?utf-8?B?WFVKTXYxUGRNU2llU01EeEllQU5WNjd1MU13ME9uWlhHdE9IemFESXQxODRp?=
 =?utf-8?B?blFkcmNKNkRJZitHeTkxZFhiY1lLUEQyL2haTWxEY3BMSnVBekY2RCtpNVE4?=
 =?utf-8?B?eFFFeUEzTnB3djczOGVYemRVTUpEaFByRStUNnM5QUVjLy9lQ1BpTzkvc1lB?=
 =?utf-8?B?eUkwUFBNcGJjd3FZTnREbkh5dmtIUlg1Tkpkc0tIcmNZVFc4TWd0VkZsTTYz?=
 =?utf-8?B?bi9EUVZGT2hjNDBtTy9SQVhvTFRyOE5XZXNEbVI0UnlIbDMyWnQvUGZaZzFm?=
 =?utf-8?B?d1NBeDJIendSRDFIc3NDcDlvRGxmRi9wYXBmVHV4eGR2RXphMWdybDlwVHBH?=
 =?utf-8?B?QlNWT0RRTHNrYWR5TE5XVXhBbXFqK0JGd2FEK0JxMzB6eFdqYndmS3ZIMjFP?=
 =?utf-8?B?aVhTQnVlc2k3cjdRN2pjWkptRllsZFFCWm1LSW5RVTBrNjcrVjBPWFJEU2h1?=
 =?utf-8?B?T1hIL2Z5S2tBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5887.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dVYxMVF3MGNZdXJ3cGVSRmk3c2FPK2pGQjlTTjVoMFordkxid05BcE5pdStm?=
 =?utf-8?B?WTJmZFNkMkxRUlJ2Z3Q2SURRTi9iN3NjNzhRSmtyWDdxdkplNklzTkFqYVFO?=
 =?utf-8?B?YkcwcHB0NWhad2NOSWM1eWl4RkhUcjdRUE5rSkRrVHVRQWFXOWIyVGtTMDlP?=
 =?utf-8?B?YjJydUJUTjdrR1B0VjNXWTFlY3k1cXp0bDVvcTRQNHJWam5MNHd3ZWJlYTJr?=
 =?utf-8?B?cWN1UTR4ZEtydGQ3TCs1S2pKUmRKRndnYmgxbEN1L2RRVnNKK2JzUElzdVZD?=
 =?utf-8?B?T2VOS3I2VW5OTFY3SU1mWVdsNm16YkVrVkJmRUpaNW5oMTVVcFhESnJ6bUNO?=
 =?utf-8?B?SVRIckRQSTU1UHJaZkZJNnpTYkdLNkQxYWN4a1JySlc3VFNFMkYrb2ZDQXV4?=
 =?utf-8?B?RkNNeUxVR2syNjNjaUJyZkd6cTQrSG01YzVFbWM0eGFHTGpHQ3ZMbU5WWXhV?=
 =?utf-8?B?VjU2REFlYzNHbUkwOE8rQ2FZakw0M2wreEFuM0dLVmduallpWFdOMmJLb29Y?=
 =?utf-8?B?TEJvYWJ1dVZGWmhzNlV4ODBUZ0hrWFZ4OTgyWUVVSmxFNVkrcE5lRDYxaWRX?=
 =?utf-8?B?NldrSFpYRWh4YnJnY1kxdHdJR2tvTzlRWW1sOGJQVmQ4SmpUZ3FMR2tTWllz?=
 =?utf-8?B?Vnlla1JvV2RvWUZuSzA3TGc1d0dmQXI3VXN5WXhOYWRWNW1RRjRmMWxzeUFx?=
 =?utf-8?B?cFloRStnbWc0M00wMG11NGtidmlzZG5zdDRyZ1BFY0REK2hBSDNXbjkzcGhP?=
 =?utf-8?B?a0g2ZkxDcnNPZ2RvZlJvdFQvaGdTaC9jVzRFQkhUMnZ6QTA0MDhTUklZQWts?=
 =?utf-8?B?YmdQMTNLWWcyNERtbjBNMTN1UFI1ZmJ3NVZTU0VacmQ4WFFiMUhLM1VDWlBQ?=
 =?utf-8?B?Qkt6RVRjdXpWcVd0OWVNMXkvZ2xsdFN4OGJFNTVuL1RWZEFSQldZOXBSZFZY?=
 =?utf-8?B?L095bzhqOHU0d0F2NkZLei95Sk1BYkZRcjJvTGlMcFAvQ0diVHBwY3UwQ1lr?=
 =?utf-8?B?MElSam9MTE16N2dsYStIRmRqTFhsV210THFFSUMxQm9LN2NLNm9qNGJTY1FC?=
 =?utf-8?B?SHFsODNPQlAvakxhR1l1NXZlUTUyOGlaUDRsYWk3ZzNERTh2WDA4Rnd4a0N4?=
 =?utf-8?B?czNRVzdMWmhpbFEyOEQvclVLZEZ6UGh5S29zTEZ6dG55c04vQnJjRVQwWHkw?=
 =?utf-8?B?TE1PRlc3Q2dKNllaOWFjZDcrUGVhVjdpZ3EwakozQzdITU9MN2JGdmpJZCtu?=
 =?utf-8?B?WjVUNmxTb1BXRC9tU1BxRDlndXdTZUkxa1JYdkszR2hVUTVodVIxdGlhWTRV?=
 =?utf-8?B?MVpPYUZzSC9ObndDZXhLcDc0T3FuOGFFQ0RHUlFLRFBkbk9YVmtPbGFTRjBG?=
 =?utf-8?B?TmIzUVdaSjlGcWZ5ZVZ6UExtTjhhZmV0TXpTSFZLS1hnaStnOVFGckxFdUla?=
 =?utf-8?B?cUpNOVBNU3I4WUtDdjIrNEUxSklmWmNZcGRmZ0JsemF5WlpIbENOUDdhNnVK?=
 =?utf-8?B?V1RGRTFSZDJ5SDVRQ3ViaUVMN0VGNlAxMm1pZGJwV1QxQTNGTHFXb0xLOEpX?=
 =?utf-8?B?Q3NvcnNPQTVzVWNYdHE4Tlo1NDloZVp1SWpkMEhlNWpNeStBdDVEYnZSWVoy?=
 =?utf-8?B?RUhIQkhSMFlmZzYzTytNSzA2ejIxc2hBSWR1Uno5MGNFNzkrQjJkK0tkSHFT?=
 =?utf-8?B?blVWZjZsM1lRQXkrMGtWWE00VEVJMWtPM2dXQzZZdDRsNkVET29ZRGVkVEdz?=
 =?utf-8?B?NEwwK0I0VEp0OGdscm1TVmRYQ3dOaDhCTitQbkQvTDV1b3FKQW03bEY0OFlX?=
 =?utf-8?B?N3VaTHl1eklrelFBQ0c2b2dSM2YxelpIK2djQTdDUVRURlIzYnJyaS8zcDdj?=
 =?utf-8?B?Y1h3UkNPL3R4NisyRXNvMFIwbFliaDNUVElZaGt1c1prMXZRclZWZ0dIek5V?=
 =?utf-8?B?SlVZajRJQ0k2YksyUXpheTFXaThHeWp6NTMxMk5saVlBN1czWWJKTEUrUzBY?=
 =?utf-8?B?cUozSFQya2haSERldEVkTVZqWjgxc2NualBnUXZaZTVzSHRHeW84MnhEQkc4?=
 =?utf-8?B?RlJOc1QyVHlHMkNJY0dUdE5UYUNZTSt4bXozQnBvODRRZnFmNVZDNU5yWGZW?=
 =?utf-8?Q?FEbW2psLOisHKHt8HEdDE1445?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cc687d4a-7ce2-4261-3c85-08ddf67b0b0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2025 06:17:28.2407
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2dvjCcY/mz965Y9vLN1BORHyphm057XgIwhGMEBPbr9SPNPwp2vs2qEj5Cjk3feYla5X0TaSNJ/gSMWfAlDBRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6965

SGkgTGludXMsDQoNCk5ldyBzY2hlbWUgd2l0aCBtYWNyb3MgaGFzIHZlcmlmaWVkIG9rLiBJIGp1
c3Qgd2FudCB0byBjb25maXJtIHdpdGggeW91IGJlZm9yZSBzdWJtaXQgY29kZXMNCg0KPiBFWFRF
Uk5BTCBFTUFJTA0KPiANCj4gT24gTW9uLCBTZXAgMTUsIDIwMjUgYXQgOTowOeKAr0FNIEdhcnkg
WWFuZyA8Z2FyeS55YW5nQGNpeHRlY2guY29tPiB3cm90ZToNCj4gDQo+ID4gPiBVc2luZyBhIE5V
TEwgZnVuYy0+bmFtZSB0byB0ZXJtaW5hdGUgdGhlIGFycmF5IGxvb2tzIGEgYml0IGRhbmdlcm91
cy4NCj4gPg0KPiA+IENoZWNraW5nIHdoZXRoZXIgdGhpcyBwb2ludGVyIGlzIGEgbnVsbCBwb2lu
dGVyIGlzIGdlbmVyYWxseSBhY2NlcHRhYmxlLiBBDQo+IG5hbWUgbWFwcyB0byBhIG11eCB2YWx1
ZS4NCj4gPiBJIHRoaW5rIHRoYXQgaXQgaXMgc2FmZS4gT2YgY291cnNlLCB5b3VyIHN1Z2dlc3Rp
b24gaXMgYWxzbyBhIGdvb2QNCj4gPiBpZGVhLiBJZiB5b3UgdGhpbmsgdGhpcyBpcyBub3Qgc2Fm
ZSwgd2Ugd2lsbCBjaGFuZ2UgY29kZXMgYXMgeW91ciBzdWdnZXN0aW9ucy4NCj4gDQo+IEl0J3Mg
T0sganVzdCBhIHN1Z2dlc3Rpb24uIFRoZXJlIGFyZSBtYW55IHdheXMgdG8gZG8gdGhpcywgZmly
c3QgZml4IG90aGVyDQo+IHByb2JsZW1zLg0KPiANCj4gVGhlcmUgYXJlIHRoaW5ncyBpbiB0aGUg
bGFuZ3VhZ2UgYW5kIHRoZSBrZXJuZWwgdGhhdCBjYW4gaGVscCB5b3UgdG8gY2hlY2sNCj4gYm91
bmRhcmllcyBvZiBhcnJheXMgc3VjaCBhcyB0aGVzZSBmdW5jdGlvbnMgc28geW91IGNhbid0IHdy
aXRlIGNvZGUgdGhhdCBpbmRleA0KPiBvdXQgb2YgcmFuZ2UsIGUuZy4NCj4gDQo+ICtzdHJ1Y3Qg
c2t5MV9waW5fZGVzYyB7DQo+ICsgICAgICAgY29uc3Qgc3RydWN0IHBpbmN0cmxfcGluX2Rlc2Mg
cGluOw0KPiArICAgICAgIGNvbnN0IHN0cnVjdCBza3kxX2Z1bmN0aW9uX2Rlc2MgZnVuY3Rpb25z
WzRdOyB9Ow0KPiArDQo+ICtzdHJ1Y3Qgc2t5MV9waW5jdHJsX3NvY19pbmZvIHsNCj4gKyAgICAg
ICBjb25zdCBzdHJ1Y3Qgc2t5MV9waW5fZGVzYyAqcGluczsNCj4gKyAgICAgICB1bnNpZ25lZCBp
bnQgbnBpbnM7DQo+ICt9Ow0KPiANCj4gSXQgaXMgcG9zc2libGUgdG8gdXNlIGEgZmxleGlibGUg
YXJyYXkgd2l0aCB0aGUgaW50cmluc2ljIF9fY291bnRlZCBieSgpIGhlcmUsIGUuZy4NCj4gaW5z
dGVhZCBvZjoNCj4gDQo+IHN0cnVjdCBza3kxX3Bpbl9kZXNjIHsNCj4gICAgICBjb25zdCBzdHJ1
Y3QgcGluY3RybF9waW5fZGVzYyBwaW47DQo+ICAgICAgY29uc3Qgc3RydWN0IHNreTFfZnVuY3Rp
b25fZGVzYyBmdW5jdGlvbnNbNF07DQo+IA0KPiBZb3UgY2FuIHVzZToNCj4gDQo+ICsgc2l6ZV90
IG5mdW5jdGlvbnM7DQo+ICsgY29uc3Qgc3RydWN0IHNreTFfZnVuY3Rpb25fZGVzYyBmdW5jdGlv
bnNbXSBfX2NvdW50ZWRfYnkobmZ1bmN0aW9ucyk7DQo+IA0KPiBJZiB5b3UgZ3JlcCBjb3VudGVk
X2J5IGluIHRoZSBrZXJuZWwgeW91IGZpbmQgbWFueSBvdGhlciBleGFtcGxlcyBvZiBob3cgd2UN
Cj4gdXNlIHRoaXMuDQo+IA0KPiBCdXQgZmxleGlibGUgYXJyYXlzIGlzIGEgYml0IGNvbXBsaWNh
dGVkIGFuZCBkYW5nZXJvdXMgc28gbWF5YmUgeW91IHdhbnQgdG8NCj4gYXZvaWQgaXQgYWx0b2dl
dGhlci4gQWxzbyBJJ20gbm90IHN1cmUgaXQgd29ya3Mgd2hlbiB5b3UgcHV0IHRoaW5ncyBjb250
YWluaW5nIGENCj4gZmxleGlibGUgYXJyYXkgaW50byBhbm90aGVyIGFycmF5Li4uIEkgbmV2ZXIg
dHJpZWQgaXQuDQo+IA0KPiA+ID4gVGhlbiB5b3UgY2FuIHVzZSBuZnVuY3MgdG8gaXRlcmF0ZSBv
dmVyIHRoZSBhcnJheSBvZiBmdW5jdGlvbiBuYW1lcywNCj4gPiA+IGFuZCBkZWZpbmUgYSBtYWNy
byBsaWtlIHRoaXM6DQo+ID4gPg0KPiA+ID4gI2RlZmluZSBTS1lfUElORlVOQ1RJT04oX211eHZh
bCwgX2Z1bmN0aW9ucywgX25mdW5jdGlvbnMpICAgXA0KPiA+ID4gKHN0cnVjdCBza3kxX2Z1bmN0
aW9uX2Rlc2MpIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiA+ID4gICAg
ICAgICAgICAgICAgIC5tdXh2YWwgPSAobXV4dmFsKSwgICAgICAgICAgICAgICAgICAgICAgICBc
DQo+ID4gPiAgICAgICAgICAgICAgICAgLmZ1bmN0aW9ucyA9IChfZnVuY3Rpb25zKSwgICAgICAg
ICAgICAgICAgICAgIFwNCj4gPiA+ICAgICAgICAgICAgICAgICAubmZ1bmNzID0gKF9uZnVuY3Rp
b25zKSwgICAgICAgICAgICAgICAgICBcDQo+ID4gPiAgICAgICAgIH0NCj4gPiA+DQo+ID4gPiBB
bmQgdGhlbiB0aGlzOg0KPiA+ID4NCj4gPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHNreTFfcGlu
X2Rlc2Mgc2t5MV9waW5jdHJsX3M1X3BhZHNbXSA9IHsNCj4gPiA+ID4gKyAgICAgICB7DQo+ID4g
PiA+ICsgICAgICAgICAgICAgICAucGluID0gUElOQ1RSTF9QSU4oMCwgIkdQSU8xIiksDQo+ID4g
PiA+ICsgICAgICAgICAgICAgICAuZnVuY3Rpb25zID0gew0KPiA+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgICBbMF0gPSB7MCwgIkdQSU8xIn0sDQo+ID4gPiA+ICsgICAgICAgICAgICAgICB9
LA0KPiA+ID4gPiArICAgICAgIH0sDQo+ID4gPiA+ICsgICAgICAgew0KPiA+ID4gPiArICAgICAg
ICAgICAgICAgLnBpbiA9IFBJTkNUUkxfUElOKDEsICJHUElPMiIpLA0KPiA+ID4gPiArICAgICAg
ICAgICAgICAgLmZ1bmN0aW9ucyA9IHsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
WzBdID0gezAsICJHUElPMiJ9LA0KPiA+ID4gPiArICAgICAgICAgICAgICAgfSwNCj4gPiA+DQo+
ID4gPiA+ICsgICAgICAgfSwNCj4gPiA+DQo+ID4gPiBiZWNvbWVzDQo+ID4gPg0KPiA+ID4gc3Rh
dGljIGNvbnN0IHN0cnVjdCBza3kxX3Bpbl9kZXNjIHNreTFfcGluY3RybF9zNV9wYWRzW10gPSB7
DQo+ID4gPiAgICAgU0tZX1BJTkZVTkNUSU9OKFBJTkNUUkxfUElOKDAsICJHUElPMSIpLCAgIkdQ
SU8xIiwgMSksDQo+ID4gPiAgICAgU0tZX1BJTkZVTkNUSU9OKFBJTkNUUkxfUElOKDEsICJHUElP
MiIpLCAgIkdQSU8yIiwgMSksDQo+ID4gPg0KPiA+ID4gSSBkb24ndCBrbm93IGFib3V0IHVzaW5n
IHRoZSBQSU5DVFJMX1BJTigpIG1hY3JvIGhlcmUgdGhvdWdoLCBjYW4ndA0KPiA+ID4geW91IGp1
c3QgcHV0IGluIDAsIDEuLi4/DQo+ID4gPg0KPiA+ID4gQW55d2F5IEkgdGhpbmsgeW91IGdldCB0
aGUgaWRlYS4NCj4gPiA+DQo+ID4NCj4gPiBGaXJzdCwgbGV0IHVzIHJldmlldyB0aGUgc3RydWN0
IHNreTFfcGluX2Rlc2MsIGl0IGNvbnRhaW5zIHR3byBtZW1iZXJzLCBvbmUgaXMNCj4gdGhlIHN0
cnVjdCBwaW5jdHJsX3Bpbl9kZXNjLg0KPiA+DQo+ID4gc3RydWN0IHBpbmN0cmxfcGluX2Rlc2Mg
ew0KPiA+ICAgICAgICAgdW5zaWduZWQgaW50IG51bWJlcjsNCj4gPiAgICAgICAgIGNvbnN0IGNo
YXIgKm5hbWU7DQo+ID4gICAgICAgICB2b2lkICpkcnZfZGF0YTsNCj4gPiB9Ow0KPiA+DQo+ID4g
UElOQ1RSTF9QSU4gaXMgdXNlZCB0byBpbml0aWFsaXplIHRoaXMgc3RydWN0IGluIGtlcm5lbC4g
SXQgbG9jYXRlcyBpbg0KPiA+IGluY2x1ZGUvbGludXgvcGluY3RybC9waW5jdHJsLmgNCj4gPg0K
PiA+ICNkZWZpbmUgUElOQ1RSTF9QSU4oYSwgYikgeyAubnVtYmVyID0gYSwgLm5hbWUgPSBiIH0N
Cj4gPg0KPiA+IFBJTkNUUkxfUElOKDAsICJHUElPMSIpIGRlZmluZXMgYSBwaW4sIGl0cyBudW1i
ZXIgaXMgMCwgaXRzIG5hbWUgaXMgIkdQSU8xIi4NCj4gDQo+IEFoIEkgc2F3IGl0IHdyb25nLCBz
b3JyeSA6KA0KPiANCj4gWW91J3JlIHJpZ2h0IGFib3V0IHRoaXMgb2YgY291cnNlLg0KPiANCj4g
QnV0IEkgdGhpbmsgeW91IGNhbiBzdGlsbCB1c2UgYSBtYWNybyB0byBkZWZpbmUgdGhlIGxvbmcg
cGluIHRhYmxlcz8NCj4gQWxiZWl0IG1hY3JvcyB3aXRoIGZsZXhpYmxlIGFyZ3VtZW50cyBpcyBh
IGJpdCBoYXJkIHRvIHdyaXRlLg0KPiBTYXZlIGl0IHVudGlsIGV2ZXJ5dGhpbmcgZWxzZSBpcyB3
b3JraW5nLg0KPiANCkluIGhlYWRlciBmaWxlOg0KDQpzdHJ1Y3Qgc2t5MV9waW5fZGVzYyB7DQog
ICAgICAgIGNvbnN0IHN0cnVjdCBwaW5jdHJsX3Bpbl9kZXNjIHBpbjsNCiAgICAgICAgY29uc3Qg
Y2hhciAqKmZ1bmNfZ3JvdXA7DQogICAgICAgIHVuc2lnbmVkIGludCBuZnVuYzsNCn07DQoNCiNk
ZWZpbmUgU0tZX1BJTkZVTkNUSU9OKF9waW4sIF9mdW5jKSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcDQogKHN0cnVjdCBza3kxX3Bpbl9kZXNjKSB7ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwNCiAgICAgICAgICAgICAgICAgLnBpbiA9IF9waW4sICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KICAgICAgICAgICAgICAgICAuZnVuY19ncm91
cCA9IF9mdW5jIyNfZ3JvdXAsICAgICAgICAgICAgICAgICAgICBcDQogICAgICAgICAgICAgICAg
IC5uZnVuYyA9IEFSUkFZX1NJWkUoX2Z1bmMjI19ncm91cCksICAgICAgICAgICAgIFwNCiAgICAg
ICAgIH0NCg0KSW4gQyBmaWxlOg0KDQpzdGF0aWMgY29uc3QgY2hhciAqZ3BpbzFfZ3JvdXBbXSA9
IHsiR1BJTzEifTsNCnN0YXRpYyBjb25zdCBjaGFyICpncGlvMl9ncm91cFtdID0geyJHUElPMiJ9
Ow0KDQpzdGF0aWMgY29uc3Qgc3RydWN0IHNreTFfcGluX2Rlc2Mgc2t5MV9waW5jdHJsX3M1X3Bh
ZHNbXSA9IHsNCiAgICAgICAgU0tZX1BJTkZVTkNUSU9OKFBJTkNUUkxfUElOKDAsICJHUElPMSIp
LCBncGlvMSksDQogICAgICAgIFNLWV9QSU5GVU5DVElPTihQSU5DVFJMX1BJTigxLCAiR1BJTzIi
KSwgZ3BpbzIpLA0KCQkuLi4uLi4uDQp9Ow0KDQpXaGF0J3MgeW91ciBzdWdnZXN0aW9uPyBUaGFu
a3MNCg0KPiANCj4gWW91cnMsDQo+IExpbnVzIFdhbGxlaWoNCg0KQmVzdCB3aXNoZXMNCkdhcnkN
Cg0K

