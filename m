Return-Path: <linux-gpio+bounces-28523-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E70CC5EAC5
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 18:55:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CA8BA4F2ECB
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 17:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7264344041;
	Fri, 14 Nov 2025 17:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="UVUy4lbL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012021.outbound.protection.outlook.com [52.101.66.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22656343D92
	for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2025 17:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763142315; cv=fail; b=eEGfiDpxyxxYmRrOnc5SzmlVRT/arplzliR6RwsDb/bp4PAYqbAPHpdzuSElPNrtMbuQ8yUb4dacP46ozoWEyZs1AzhXP88/iQCZBDsGV5Y0Adv3I5tzFKLfme/mFu3+z7ODtIltoUvqkui2QQ1W/4CbG2QPf9IkeRN6YxMDeLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763142315; c=relaxed/simple;
	bh=l7i/7wxr/VXibKh4SdEMiyku5aFa5aUvhyLrIKUzOmA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZuIdzxEG6F8nndTmvC3UoMaJm7NU7trczKgtGPlvnm5ZG5sCDd2DwwbIYS2maGrxEw4S7kAWODKJIWjgm4UEKphW0aQmDXQ8gbBoPQTTKbE+m7ws4o9iTqkQc3j29G7FA8Zn6pmGW5y4UGLd41UvyKeEIniAvdMjOyCxksYaA/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=UVUy4lbL; arc=fail smtp.client-ip=52.101.66.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kNz6JPddSByF5wJ3IwgxDYpVZQY1u6BzyR/elhp6EEsadbQ81iUoyaBKgaUD8rPa8lCAtVktiluYKACWA8UeA1QrH8ZtiXVo4HkiaECn7cK1i2t+ZJiF8YtvIUIvhxlqs6Wj2Wc69Ls2dFpk99p8qJk3iF4BKC2BK/IsrnYsWGLjVw1w2B3MAAH8BTnGf2/4Sq3mqp4tIdcUFvURScsKDl5thVcHKALAbNkzZxqLrGVoNegJqwrLGNSqXZaj/HTaZEym6+Yfa8pQU69NgQPdHxVVAg7MEtEEjbtVzimsO28fERP++JP9JzfYVk7sw9H232QFu1Tgz2KPckoNph7tYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l7i/7wxr/VXibKh4SdEMiyku5aFa5aUvhyLrIKUzOmA=;
 b=igtEtDEcUnvIS6NoHKjiyvNf4Yp4nKPsM3rysKv9aVnJlwgZWwFvNwUvWiPgNbv0/2xv/1rQeAc7u4K5UlOasWE+NO0dFUcz6KCkFJRjiZDhJk9rDLLBplitCJcQqmXAg4TVA1RYnd8o9giJqAIIDpRgWLnUCNIdKIqVR/qHKT0JRcQY4fpncS+V8Pl7dyYsDAMBzJMzVMYeZb6k2J9UZFt7plcaaLwY05qB5tf8clmtD1R6HPIIXPirhMt2uvj0Coyqju/v+2Guqap0/a6FnsctvlbcKrcMPuB0h8RbR3KaimHWr2Q84VuNHm756SePiAEeovTcSPgOiN8xVWDzRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l7i/7wxr/VXibKh4SdEMiyku5aFa5aUvhyLrIKUzOmA=;
 b=UVUy4lbLvENrYK3X5/8ChBMnGtWhP2V0RKk2czzjBfQuFXUWRqyNZ2SHDvuHEA+7fjV9t+Rr9drZcTQuyKyYEYxrMj8xRAlcGj2dHbCC2/kMvcZ31WZ3thEWdFtEVvHZTmzNZRpvzoOq3Ku293ifFFJXPndnzMaaHBXycf8ykDX3zGzBbONe4qGj4l38gB5SCNO54jnEbN29kGlj45TNP/yTITLQ6As0xp0W5ZKayrq2lUIRfZLduh66HhNwTNZjRMPNw55e3lg/mXu7wrpVaeGb2vvAB0oItywzvzM4l6NsRtyiZOIM7734sXFy3bk4iOVyMv68LkCIksNRt+TUUQ==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by PA2PR10MB8435.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:419::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 17:45:10 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f%3]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 17:45:10 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "brgl@bgdev.pl" <brgl@bgdev.pl>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>
CC: "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH libgpiod] dbus: manager: don't try to export the same chip
 twice
Thread-Topic: [PATCH libgpiod] dbus: manager: don't try to export the same
 chip twice
Thread-Index: AQHcVWrJiIxc8vuKkkSx3HGVJLRr8bTycgGA
Date: Fri, 14 Nov 2025 17:45:10 +0000
Message-ID: <74df5acf4a8c78921a0a918331522aad997f8706.camel@siemens.com>
References: <20251114132957.33750-1-brgl@bgdev.pl>
In-Reply-To: <20251114132957.33750-1-brgl@bgdev.pl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|PA2PR10MB8435:EE_
x-ms-office365-filtering-correlation-id: 5642be31-74b1-42da-fcf3-08de23a58ec9
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Nkxac1RQZThMMGkvUURaUHhTcDJBVDZFZno3VStmcXRpVDZIN09PM3FIRFNi?=
 =?utf-8?B?ZDU2SE00MzFrQklSMWVuUDhKcE03SnVTbCtvZ3JaMVRYK2UxeFJjUHVjVjYv?=
 =?utf-8?B?aGNzcUVaWDlaZWQwcTBFVXVWZ1FmYXJpUXhUS0JQMWJOZjhOOXV2VGJJeGN2?=
 =?utf-8?B?eGNpN0RpREM2bmJMTjVtUjAvekZ0OE5Oa1NPRVRlUTRYRzk4K2ltR3FYY1pM?=
 =?utf-8?B?YnBORkN2dVlEa2haaTBpYW1zSDd3ekVXOUVQbFFROXAyL2hVMXFGa2MxQVpx?=
 =?utf-8?B?THlzY1dBRWhDVTZ1M1M0UGZvZkRURWY1OVlOb21FNTBmMzl3R3ZJWHN0dkdZ?=
 =?utf-8?B?V2xMTEpvYjljakYxOWViK2g3bGlYVC90ampaTlpOL3JoRzRjM2QxczhWOGRD?=
 =?utf-8?B?YTluRS9SaEtnQ0g0WEhuZHJFMWZjWmYxLzBJSkhnb3M1aWU5TzFWRkpHZHlL?=
 =?utf-8?B?alNOdURGcHpCaHJDTDVyUHN0VG9yc3RxL01Jc015NjJIVVg1VytqeXZpWjgx?=
 =?utf-8?B?UVh1cEd3WUpZbnE5ZDUzaXJYUWsyYlZZY1Y4YTNVT292a2kxS29iR2FOMmZU?=
 =?utf-8?B?RzhFSTVXWFJRN2p4c0lubXZWS1ZXZXFoZ3dnTHZScUFrazI2dHBaRWlScHlx?=
 =?utf-8?B?WFdVZG1GdHhPTEdycWllUmVkb2pBV0ZxNExlQS8xd1BuQVFPNDhUSlczQ0Rr?=
 =?utf-8?B?ekpTK3FpUlVKWEpjcGc3Y0Y4dzk5SlUyZkt4VG5ZSmoyU3lHaU1OSGpETGl5?=
 =?utf-8?B?bVA2eEtVYWxwQ3J4MTJaL0pjZXorMm5zeXhIVGxsdFFtVTE0bTVWblQyamtr?=
 =?utf-8?B?WE1ock51d3FvS1JCRDYzRE1sMWZnclZaM2hQS0J0b1c5WkRqcWF1TlphNDQv?=
 =?utf-8?B?bFl6UldkRjlYU2U4M3VGR3FTc1RPNDBFOHNJNXhJdkVwakx5YlF6OVZzRzg2?=
 =?utf-8?B?Vjh0Ykk2RGNsZHJhQzRSWVJNQ25UckxhcTJRRG5CVlY1aHdTMU0vVFVUVjBH?=
 =?utf-8?B?KzR2VU5xNE9NaE0vVHFMZGwwdzRSbW5ySTNoWlBKUFI2UFRteUVqdlZNZnpI?=
 =?utf-8?B?NjI4bGp1cXpKakpxQkgxcTh3L0lCWnVHU1BBRWFyTVZHTFY0Y0IvTkZPVkVX?=
 =?utf-8?B?aEd6eDZWejF3dXdkNzBJT2NkbXlUZjJYeXNWUUNYU3dISCtTZFUxcmRHS2NE?=
 =?utf-8?B?RnVuS29IQWV2bVBDdHdLa0tGN1kvOHZqVzFnUjFyNG4yelpERXdqb3JyamF5?=
 =?utf-8?B?NVlOeFlzV0RQbFJ1cTJKU1VZeGFRQ3JtZjE0Mkx6eXZOQVRUZys2VFF2RG0v?=
 =?utf-8?B?d0FET09tTkpZd0NMWFVaYlZnK3dEV2pjemZFUWcyK3g5dEx3VFhaMUtBU3VL?=
 =?utf-8?B?QlVSbjhNQXducWRSb1BFYk1CYjlnRmJ2dFpvVkpOTjBSRksyYmY4U1RKL0U2?=
 =?utf-8?B?S1diQVJnV0t0Tll6QUZwN052cDJCanVIZEcwZEpMQ0N6UUlVb0lmS0QySzBv?=
 =?utf-8?B?a3Axb2VKaG5iRkp4QlpvT2NHUEQxekcyd3Z2RmpudmxtTjIrNW1hTm1LaXFy?=
 =?utf-8?B?MUtadGhwRnJndERGYjR1VWFzWDV4eWZMdHNxMGhBcFU4cUlKSWRkRHpHTkg0?=
 =?utf-8?B?NTIzN21RblQrN3FXaFIzL3FXN1N6VysvbzY2bGtqamNld3AwckNnVVVLamVV?=
 =?utf-8?B?VUZJSXhMWGpwN3J3VzlVTzhiTjF4SmNIZy9ncHFJOHpaTDRSaXFkcFI2ODNx?=
 =?utf-8?B?WlZMTXkvaHRCZ241eEJWVHVvcXNuYktLem5TRTdmakNKd2o2dm5YUU5RRFhN?=
 =?utf-8?B?TzVuQklqL09EcXBSZzhBM0htbWZnalRSTWJjNDJiYTExOEFoYjlqUEZBeEhG?=
 =?utf-8?B?aXJ6aUVWN09oM0ZCTThia3Bjb2dacW9MS1phazd4WnBXSi9hRGM3RXlsZFE2?=
 =?utf-8?B?WkRGL2VQcy92b1hZR24vYUM0d0kzOUlHcUR4R1hwaXorcWthbmNDeHc4Ullr?=
 =?utf-8?B?c0N2TUg4RVJnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RGFWbjM5bkZiV3NBMDdSTytMYnNmYmtjTkc2RHZzMEJCT3g2V0RWRHdFc1pN?=
 =?utf-8?B?eTNtRFNkZ1lXbnlraGJmL1JHUDlqK1pJWXgwTE4xeGlJbXMxMWIvR3QxUGRU?=
 =?utf-8?B?OUtCTnlXay9jcEgzNkQzNjRpc29GdHkvN2hFR2RndUROSkxpa0pRSWJkSThH?=
 =?utf-8?B?cnFSVmR6R253SVVMRmx6S0htdlJMQTZrZlNoM0toOGlMOEl3Z0FITUxrcGFV?=
 =?utf-8?B?Y2pueXFCb1NYcVNodDE5eit1RkVydVVWYkRtcDJpT3dOSFNncEtMQktEaEFa?=
 =?utf-8?B?ODJoOEh0VXNlQlVpbEQ2bkxLeXluNTBUTmlXdlZVd0lDT0hjTWhRR2dqYTRr?=
 =?utf-8?B?cnF5NEhsK1djdTBRWGdIelFZa2ViLzlFZktTK1cxK2hDeEh1WTFxVy9QdmV6?=
 =?utf-8?B?ZHRRVjg2djIyei9wR2tIdGlNL2FDaXFOSlN5Nnpnbm9RdFdFTjdVL3ROa2hs?=
 =?utf-8?B?S3MyR3VEZHdmNm42ZGJLQ21XV2gvdld1R0hqMVFDUFpTMnFEZloxd1Y1a3Rn?=
 =?utf-8?B?RWVpS2R5RTR4Z2ZkMGM4M2tHMjBqaXAxZUtEM3JPelUyUDJyRUtUSHhQQTlC?=
 =?utf-8?B?MUxRV1lLNTZzaWdjRElXam4ySTB2Vmhja0UyVmRTRENNRURna0l3YWR4MEZH?=
 =?utf-8?B?djlZTHJZOE5DR1dSUTVTRUJkSzRHYXl6ZUhHa0lKNFJueGxPSU55cmJ4QUhZ?=
 =?utf-8?B?bnV1TzVOY3pETHNLeUFTTU9ySU9TNkIvKzZkV0FrOHZOUGlVVmp5YjlXRHBl?=
 =?utf-8?B?ck55YlFWZGdyRmI0U282RDkrbVpMMEZhVmFBejdKbGFvdGdUUFkzTzhKbVUx?=
 =?utf-8?B?RHkwbWphV0Z1eVlPaUd0cllrR2RsOEh2alh0RHhuN0J6RXdONzBYTENxZG9m?=
 =?utf-8?B?Ly8rRVZGZlV1QUZRM21lTjh6L1dOWXZYNW1vazQwYVVDejBmeUFIbHZUcUto?=
 =?utf-8?B?VlE1eUduSnVxUkJ2eGQzQXFMVEpsWDNxM3VaL1ZwREVaQ3V1QkF6T2xJVVdl?=
 =?utf-8?B?dStOMDhES2pPRldyM3N0UnhqOEV2enVIaC9wWFlhR05YdnR2NGdBaDVpU0x6?=
 =?utf-8?B?dkhDUTBLU2d1dzNYc3FRVHlkSGtnVUFhbjVJMnFEMngyUUdtUFc2Ym45YWpC?=
 =?utf-8?B?dzh4ajE2S3JoazZtaXZuNlBxU0c3WnQvUWhxWld0a0xZUTQrRXRuMVNDcXY5?=
 =?utf-8?B?ajdOZzE1ZCtiREsyT1cxVm9sSGZVcWlGWGxJcHFiT2NoYndDdG5UdGtEc0Va?=
 =?utf-8?B?SWY5NEZiUFc3SzdYRk0xL1JRSHg0S3UyYUJ5VDBRQit2K0dvOEJoUGI5REJi?=
 =?utf-8?B?L0g4KzFtN1RxMjRVWE1FWXNGOTBrV0hsdzNZZWwrMnVoakd4aEwxZ052MS9s?=
 =?utf-8?B?QmNSd0VEek95UmJMd05UNUhCUUhObGxMOVRrTFpMd2NPQTAwSldJRkduQ0hK?=
 =?utf-8?B?RFlGT2Jac1hQcVg0K3lDbG44QkxYa0NHU0tpRFZWcTNES0JmVStaN29WdXp1?=
 =?utf-8?B?bktDajc3Wm8yQ0UzNlR2bURDU2lQME1iUmtwaHlTNFlIMnhNdDkvcTNDVHVk?=
 =?utf-8?B?SXpLUTF6anBjb1k1WTlXQ1FOWUFCbjc4V0U5aXVwSmJMS1Ryb3N2ZGxyd1hT?=
 =?utf-8?B?eUxCM1BwVmxiTDdTaTExRmxzZzJycGZrclhQZzZpOWNxQXNRREZkK1BlRjNS?=
 =?utf-8?B?SG5nSnZ1MUxVNUZrQlQ2Rys5V09DTU5td0pSL0VEblkxdjRWOW9GNXY0RC83?=
 =?utf-8?B?d0tkQmlEeDkveUozYloxUmFSRHVHYlg5NUR5SklhSjlhWHR2UUtYMytMM0ht?=
 =?utf-8?B?NitvVUlNUlp6cDQrKzhCdnRzV2FOVENWWXFPbUtLWFVKSjQ5K21jSkNnVkV2?=
 =?utf-8?B?d08yYjgxZTRXUWZzb2E4WTdMZmFxdlRKTnBYZE9TNDFpcDlaYnNYODhzWlRQ?=
 =?utf-8?B?WnEzNDVWV2Nydm5DT3VCZWFmcUcwS3RVdmkza3huRklreHNYLzR3RWVTekJN?=
 =?utf-8?B?amgxQ0VDZjRLdnFEM1BxQ3VhWURLQWJDdWtwRkZTTEIveEhLZjdEWFRLMURP?=
 =?utf-8?B?bzB3QlZqRVVheHRXUmlVQ2FCRWlzcm1VSCtxTit0NFdXV25CTUR4dWxMM20r?=
 =?utf-8?B?NDdFSWFqbEJpd0piUnEyR2F1UDFianRXWEFFUmNITlNFaEZxdno4Zy9ndzVt?=
 =?utf-8?Q?J1qaWxxDVDI0fyusYdMJEM0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E13FC18C76567948ACA18DDB3BE91641@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5642be31-74b1-42da-fcf3-08de23a58ec9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2025 17:45:10.5029
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +B4vzpg1icJaXAtFOKPzz1yNI+CnJnNiPjEZIrHCKpDAw1JNVojqL3+Z+IY3KHAzoj+JiViZfiobh/RthGxKYw81nDcqlllfCPPOgnHtf6k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8435

SGkgQmFydG9zeiwNCg0KT24gRnJpLCAyMDI1LTExLTE0IGF0IDE0OjI5ICswMTAwLCBCYXJ0b3N6
IEdvbGFzemV3c2tpIHdyb3RlOg0KPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6
LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+DQo+IA0KPiBJdCdzIHBvc3NpYmxlIHRvIGdldCBhIHNl
Y29uZCBiaW5kIGV2ZW50IGZyb20gdWRldmQgKGZvciBpbnN0YW5jZToNCj4gbWFudWFsbHkgdHJp
Z2dlcmVkIHdpdGggYHVkZXZhZG0gdHJpZ2dlciAtYyBiaW5kYCkgb24gdGhlIHNhbWUgR1BJTw0K
PiBjaGlwIHNvIGl0IGFscmVhZHkgZXhpc3RpbmcgaW4gdGhlIGhhc2htYXAgbWF5IGFjdHVhbGx5
IGhhcHBlbiB1bmxpa2UNCj4gd2hhdCB0aGUgY29tbWVudCBpbiBkYWVtb24uYyBzdGF0ZXMuIFdl
IG11c3Qgbm90IHRyeSB0byBleHBvcnQgdGhlIHNhbWUNCj4gY2hpcCB0d2ljZSBhcyBpdCB3aWxs
IGNyYXNoIHRoZSBncGlvLW1hbmFnZXIgb24gdGhlIHN1YnNlcXVlbnQNCj4gYXNzZXJ0aW9uLg0K
DQpJJ20gc3RpbGwgdHJ5aW5nIHRvIHVuZGVyc3RhbmQgdGhlIGluaXRpYWwgcmFjZSwgd2hpY2gg
bWFkZSBtZSB0byByZXBvcnQgdGhlDQppc3N1ZSwgYW5kIEkgbm93IHRoaW5rIHRoYXQgdGhlIHBh
dGNoIG1heWJlIGRvZXNuJ3QgdGFja2xlIHRoZSByb290IGNhdXNlLg0KDQpJbml0aWFsbHkgSSBz
dXNwZWN0ZWQgdGhhdCB0aGVyZSBpcyBhIHJhY2Ugb2YgZ3Bpb2RidXNfZGFlbW9uX3Byb2Nlc3Nf
Y2hpcF9kZXYoKQ0KYWdhaW5zdCBncGlvZGJ1c19kYWVtb25fb25fdWV2ZW50KCkgYmVjYXVzZSBJ
IHRob3VnaHQgdGhlIGdwaW8tbWFuYWdlciBjcmFzaA0KYmVjYXVzZSBvZiB0aGUgc2FtZSBhc3Nl
cnQoKSBpbiBpdHMgc3RhcnR1cDoNCg0KZ3Bpby1tYW5hZ2VyWzU4OF06IGluaXRpYWxpemluZyBn
cGlvLW1hbmFnZXINCmdwaW8tbWFuYWdlcls1ODhdOiBncGlvLW1hbmFnZXIgc3RhcnRlZA0Kc3lz
dGVtZFsxXTogU3RhcnRlZCBDZW50cmFsaXplZCBHUElPIG1hbmFnZXIgZGFlbW9uLg0KZ3Bpby1t
YW5hZ2VyWzU4OF06IC91c3Ivc3JjL2RlYnVnL2dsaWItMi4wLzIuNzguNi9naW8vZ2RidXNvYmpl
Y3RtYW5hZ2Vyc2VydmVyLmM6MTEyODogRXJyb3IgcmVnaXN0ZXJpbmcgbWFuYWdlciBhdCAvaW8v
Z3Bpb2QxL2NoaXBzL2dwaW9jaGlwNTogQW4gb2JqZWN0IGlzIGFscmVhZHkgZXhwb3J0ZWQgZm9y
IHRoZSBpbnRlcmZhY2UNCm9yZy5mcmVlZGVza3RvcC5EQnVzLk9iamVjdE1hbmFnZXIgYXQgL2lv
L2dwaW9kMS9jaGlwcy9ncGlvY2hpcDUNCmdwaW8tbWFuYWdlcls1ODhdOiAvdXNyL3NyYy9kZWJ1
Zy9nbGliLTIuMC8yLjc4LjYvZ2lvL2dkYnVzb2JqZWN0bWFuYWdlcnNlcnZlci5jOjExNDg6IEVy
cm9yIHJlZ2lzdGVyaW5nIG9iamVjdCBhdCAvaW8vZ3Bpb2QxL2NoaXBzL2dwaW9jaGlwNS9saW5l
MCB3aXRoIGludGVyZmFjZSBpby5ncGlvZDEuTGluZTogQW4gb2JqZWN0IGlzIGFscmVhZHkNCmV4
cG9ydGVkIGZvciB0aGUgaW50ZXJmYWNlIGlvLmdwaW9kMS5MaW5lIGF0IC9pby9ncGlvZDEvY2hp
cHMvZ3Bpb2NoaXA1L2xpbmUwDQpncGlvLW1hbmFnZXJbNTg4XTogL3Vzci9zcmMvZGVidWcvZ2xp
Yi0yLjAvMi43OC42L2dpby9nZGJ1c29iamVjdG1hbmFnZXJzZXJ2ZXIuYzozNjA6IEVycm9yIHJl
Z2lzdGVyaW5nIG9iamVjdCBhdCAvaW8vZ3Bpb2QxL2NoaXBzL2dwaW9jaGlwNS9saW5lMSB3aXRo
IGludGVyZmFjZSBpby5ncGlvZDEuTGluZTogQW4gb2JqZWN0IGlzIGFscmVhZHkNCmV4cG9ydGVk
IGZvciB0aGUgaW50ZXJmYWNlIGlvLmdwaW9kMS5MaW5lIGF0IC9pby9ncGlvZDEvY2hpcHMvZ3Bp
b2NoaXA1L2xpbmUxDQpncGlvLW1hbmFnZXJbNTg4XTogL3Vzci9zcmMvZGVidWcvZ2xpYi0yLjAv
Mi43OC42L2dpby9nZGJ1c29iamVjdG1hbmFnZXJzZXJ2ZXIuYzozNjA6IEVycm9yIHJlZ2lzdGVy
aW5nIG9iamVjdCBhdCAvaW8vZ3Bpb2QxL2NoaXBzL2dwaW9jaGlwNS9saW5lMiB3aXRoIGludGVy
ZmFjZSBpby5ncGlvZDEuTGluZTogQW4gb2JqZWN0IGlzIGFscmVhZHkNCmV4cG9ydGVkIGZvciB0
aGUgaW50ZXJmYWNlIGlvLmdwaW9kMS5MaW5lIGF0IC9pby9ncGlvZDEvY2hpcHMvZ3Bpb2NoaXA1
L2xpbmUyDQpncGlvLW1hbmFnZXJbNTg4XTogL3Vzci9zcmMvZGVidWcvZ2xpYi0yLjAvMi43OC42
L2dpby9nZGJ1c29iamVjdG1hbmFnZXJzZXJ2ZXIuYzozNjA6IEVycm9yIHJlZ2lzdGVyaW5nIG9i
amVjdCBhdCAvaW8vZ3Bpb2QxL2NoaXBzL2dwaW9jaGlwNS9saW5lMyB3aXRoIGludGVyZmFjZSBp
by5ncGlvZDEuTGluZTogQW4gb2JqZWN0IGlzIGFscmVhZHkNCmV4cG9ydGVkIGZvciB0aGUgaW50
ZXJmYWNlIGlvLmdwaW9kMS5MaW5lIGF0IC9pby9ncGlvZDEvY2hpcHMvZ3Bpb2NoaXA1L2xpbmUz
DQpncGlvLW1hbmFnZXJbNTg4XTogZ192YXJpYW50X2lzX29iamVjdF9wYXRoOiBhc3NlcnRpb24g
J3N0cmluZyAhPSBOVUxMJyBmYWlsZWQNCmdwaW8tbWFuYWdlcls1ODhdOiBnX2RidXNfb2JqZWN0
X21hbmFnZXJfc2VydmVyX3VuZXhwb3J0X3VubG9ja2VkOiBhc3NlcnRpb24gJ2dfdmFyaWFudF9p
c19vYmplY3RfcGF0aCAob2JqZWN0X3BhdGgpJyBmYWlsZWQNCmdwaW8tbWFuYWdlcls1ODhdOiAq
Kg0KZ3Bpby1tYW5hZ2VyWzU4OF06IGdwaW8tbWFuYWdlcjpFUlJPUjovdXNyL3NyYy9kZWJ1Zy9s
aWJncGlvZC8yLjIuMS9kYnVzL21hbmFnZXIvZGFlbW9uLmM6NzQ0OmdwaW9kYnVzX2RhZW1vbl9l
eHBvcnRfY2hpcDogYXNzZXJ0aW9uIGZhaWxlZDogKHJldCkNCmdwaW8tbWFuYWdlcls1ODhdOiBC
YWlsIG91dCEgZ3Bpby1tYW5hZ2VyOkVSUk9SOi91c3Ivc3JjL2RlYnVnL2xpYmdwaW9kLzIuMi4x
L2RidXMvbWFuYWdlci9kYWVtb24uYzo3NDQ6Z3Bpb2RidXNfZGFlbW9uX2V4cG9ydF9jaGlwOiBh
c3NlcnRpb24gZmFpbGVkOiAocmV0KQ0Kc3lzdGVtZFsxXTogZ3Bpby1tYW5hZ2VyLnNlcnZpY2U6
IE1haW4gcHJvY2VzcyBleGl0ZWQsIGNvZGU9ZHVtcGVkLCBzdGF0dXM9Ni9BQlJUDQpzeXN0ZW1k
WzFdOiBncGlvLW1hbmFnZXIuc2VydmljZTogRmFpbGVkIHdpdGggcmVzdWx0ICdjb3JlLWR1bXAn
Lg0KDQpVbmZvcnR1bmF0ZWx5LCBJIHN0aWxsIHRvIGNvbWUgdXAgd2l0aCBhIHdheSB0byByZXBy
b2R1Y2UgaXQsIGl0J3Mgc3RpbGwgbm90IGNsZWFyDQp0byBtZSwgYmFzZWQgb24gdGhlIGxvZ3Mg
SSBoYXZlLCB3aGF0IGluZmx1ZW5jZXMgaXQuLi4NCihBYm92ZSBpcyByZWFsbHkgYSBmaXJzdCBz
dGFydHVwIG9mIHRoZSBncGlvLW1hbmFnZXIsIG5vdCBhIHJlc3RhcnQpDQoNCj4gRml4ZXM6IGE1
YWI3NmRhMWUwYSAoImRidXM6IGFkZCB0aGUgRC1CdXMgZGFlbW9uLCBjb21tYW5kLWxpbmUgY2xp
ZW50IGFuZCB0ZXN0cyIpDQo+IFJlcG9ydGVkLWJ5OiBTdmVyZGxpbiwgQWxleGFuZGVyIDxhbGV4
YW5kZXIuc3ZlcmRsaW5Ac2llbWVucy5jb20+DQo+IENsb3NlczogaHR0cHM6Ly9naXRodWIuY29t
L2JyZ2wvbGliZ3Bpb2QvaXNzdWVzLzE2MQ0KPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFz
emV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+DQo+IC0tLQ0KPiDCoGRidXMv
bWFuYWdlci9kYWVtb24uYyB8IDcgKysrKysrLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kYnVzL21hbmFnZXIv
ZGFlbW9uLmMgYi9kYnVzL21hbmFnZXIvZGFlbW9uLmMNCj4gaW5kZXggOGUxZGU4YS4uNDYyN2U4
YyAxMDA2NDQNCj4gLS0tIGEvZGJ1cy9tYW5hZ2VyL2RhZW1vbi5jDQo+ICsrKyBiL2RidXMvbWFu
YWdlci9kYWVtb24uYw0KPiBAQCAtNjg4LDYgKzY4OCwxMiBAQCBzdGF0aWMgdm9pZCBncGlvZGJ1
c19kYWVtb25fZXhwb3J0X2NoaXAoR3Bpb2RidXNEYWVtb24gKnNlbGYsIEdVZGV2RGV2aWNlICpk
ZXYpDQo+IMKgCWdib29sZWFuIHJldDsNCj4gwqANCj4gwqAJZGV2bmFtZSA9IGdfdWRldl9kZXZp
Y2VfZ2V0X25hbWUoZGV2KTsNCj4gKw0KPiArCWlmIChnX2hhc2hfdGFibGVfY29udGFpbnMoc2Vs
Zi0+Y2hpcHMsIGRldm5hbWUpKSB7DQo+ICsJCWdfZGVidWcoImNoaXAgJXMgaXMgYWxyZWFkeSBl
eHBvcnRlZCIsIGRldm5hbWUpOw0KPiArCQlyZXR1cm47DQo+ICsJfQ0KPiArDQo+IMKgCWRldnBh
dGggPSBnX3VkZXZfZGV2aWNlX2dldF9kZXZpY2VfZmlsZShkZXYpOw0KPiDCoAlvYmpfcHJlZml4
ID0gZ19kYnVzX29iamVjdF9tYW5hZ2VyX2dldF9vYmplY3RfcGF0aCgNCj4gwqAJCQkJR19EQlVT
X09CSkVDVF9NQU5BR0VSKHNlbGYtPmNoaXBfbWFuYWdlcikpOw0KPiBAQCAtNzQwLDcgKzc0Niw2
IEBAIHN0YXRpYyB2b2lkIGdwaW9kYnVzX2RhZW1vbl9leHBvcnRfY2hpcChHcGlvZGJ1c0RhZW1v
biAqc2VsZiwgR1VkZXZEZXZpY2UgKmRldikNCj4gwqANCj4gwqAJcmV0ID0gZ19oYXNoX3RhYmxl
X2luc2VydChzZWxmLT5jaGlwcywgZ19zdHJkdXAoZGV2bmFtZSksDQo+IMKgCQkJCcKgIGdfc3Rl
YWxfcG9pbnRlcigmY2hpcF9kYXRhKSk7DQo+IC0JLyogSXQncyBhIHByb2dyYW1taW5nIGJ1ZyBp
ZiB0aGUgY2hpcCBpcyBhbHJlYWR5IGluIHRoZSBoYXNobWFwLiAqLw0KPiDCoAlnX2Fzc2VydChy
ZXQpOw0KPiDCoH0NCj4gwqANCg0KLS0gDQpBbGV4YW5kZXIgU3ZlcmRsaW4NClNpZW1lbnMgQUcN
Cnd3dy5zaWVtZW5zLmNvbQ0K

