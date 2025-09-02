Return-Path: <linux-gpio+bounces-25339-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9EEB3F222
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 04:09:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21F0D3B8B35
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 02:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A2B327E048;
	Tue,  2 Sep 2025 02:08:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023102.outbound.protection.outlook.com [52.101.127.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC7A194098;
	Tue,  2 Sep 2025 02:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756778936; cv=fail; b=kGvjsMr0KBmof+TfxsERsLK9W3RgEtrj9P0j9TwyfRYUbaVG338i4apEFOI9MiTCcmJpImBa3MCeCGuYOFfZhxGq407FV0ebh0b/RYuubgLc2dUjtya0tJtUEs7oC35VxlnAGtaqdaEiPwT0BATWgfDGU5f8J1wg0MKfrCYGdJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756778936; c=relaxed/simple;
	bh=HlS6WoB4GjTUHDkcuE2peQVrVvtb/U4soFDydSIPU6Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nZ5csTMeFkCTUwo3LNcf4YCYIVuCxOxGXbB0eujJxLDQ1WJDBXgT+gxokeqPBUHOeNn/iwQpEOiLc9/cc3SVVkSNx14xfykr/Rjh5KFJ0a4IbaFMVqF0/bRvJBFi78X5+KRMJHgJSUw+lcpWki1Y0pVjtHLWTg97iPqMy5Nj+MA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vH1xSExr1GsglLNPL9/7XylJqun1tqLhwhIrRYpB5jKd/LRebh4b5CNNjkZxcOLa8NwPV/0NXpRx5EF63Bf8Cs4iMPp1PJo4B3T+x2O+DWoI5I13bGzE5jwJ65VAMJgiMwRw2rwH9lLbWIp1L5h90gE3ZmPUQ+oCjB+/XHZVVcZ/DbTqlAjW85I36hzltAT6RGlnjT35bXuglqV+xhYgscKw9LgHhIX9mqiiu4QfGikQ5l6ml8xzXsFVN/QO+EmOUvkX2jkI3wssACF3faRXBYL8J6giOUf/UUzeuWrE/UJ/cNz9w4qBAzNSa//o8/fKN9VZlBkkFy/Kztar+0dF8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HlS6WoB4GjTUHDkcuE2peQVrVvtb/U4soFDydSIPU6Y=;
 b=mfRe1LCF8lRBzJSejyTlXB6xKywEKWwzVY2/lNnYBVXtpUJkH6k/oqi4IWM3bYxId2No4vJuWCy+05+7Zg7R1Va/kWBS9zhS0z7Fqji3BvT4k+xO5fkQzpUS5JyC5JhlLPUXgdnMsu+Tr7nQriLZBI3ZBwM0CCQfKiBfOM3Qhrrjx1nhuA8Poc/+vLJ7W1d1FfBO7y11upzL5wrYSrfglrGt97yIeirM4FY3CLeltL2IKTMxswEViNoxWt3eVnDc4/YM6VVZw3f/XM2oUOmT/LnO3UhWYwWtSjv5w+W7P4vYmUAc+vedNqP8lFK7kYjRU5l4sktxoeUTPUI3Ho0bHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com (2603:1096:301:117::13)
 by SEZPR06MB7186.apcprd06.prod.outlook.com (2603:1096:101:231::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.26; Tue, 2 Sep
 2025 02:08:49 +0000
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d]) by PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d%4]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 02:08:49 +0000
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
Thread-Index: AQHcGbDSnb3P6RHi50G00ttMBxj5IbR+TBSAgADR64A=
Date: Tue, 2 Sep 2025 02:08:49 +0000
Message-ID:
 <PUZPR06MB588797600D5B1BFF4178ED6AEF06A@PUZPR06MB5887.apcprd06.prod.outlook.com>
References: <20250827024222.588082-1-gary.yang@cixtech.com>
 <20250827024222.588082-3-gary.yang@cixtech.com>
 <0fa7e2cb-fa0b-4f9e-84d6-a4b2b3d8a4cf@kernel.org>
 <PUZPR06MB5887D9A879D16DC6A8C8ED58EF3BA@PUZPR06MB5887.apcprd06.prod.outlook.com>
 <25283b66-4cbb-4db9-9b1e-7a4e6e3db2a1@kernel.org>
 <PUZPR06MB5887887C93BFF42BC8417D96EF3BA@PUZPR06MB5887.apcprd06.prod.outlook.com>
 <CACRpkdYC-3qybKW7VH5MVfBc3oqSrOa2RTt1Q=p=HHsi5drGOQ@mail.gmail.com>
 <PUZPR06MB58871C2E108BF1AC057EF461EF05A@PUZPR06MB5887.apcprd06.prod.outlook.com>
 <CACRpkdYRTKHy0ace2o3NAeuSR3oai9fZMPrN6qQr3Lyqif4OSg@mail.gmail.com>
In-Reply-To:
 <CACRpkdYRTKHy0ace2o3NAeuSR3oai9fZMPrN6qQr3Lyqif4OSg@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR06MB5887:EE_|SEZPR06MB7186:EE_
x-ms-office365-filtering-correlation-id: 9b29188f-8a7e-4e3a-a0a4-08dde9c5a802
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NWZUdkUzMk1uWVdGY2lnSW42bVZhVXBHc1RuT3VJbFh6ODk0REJBSkJLZWFs?=
 =?utf-8?B?d1hJemsxU0dzTHpRZU84MVpWT0V2WmtvWFdaaXhmQTNFbUQrOUVCNkJRL0hP?=
 =?utf-8?B?U0ZFZXlCc2JEcm84S1kyeGZpQlR6NS9Bb3NUdGhPOXlHZmU0Qk1EK0hJSWhH?=
 =?utf-8?B?TXhTL3M3ZHRzc3F6VTdiVmQ4K1RRbS84d0kxUnNzMVZTWVMzRUlEOGdGMFV1?=
 =?utf-8?B?WHZtMkJ0RXRyMmcrRnNnMUh3WnZNNVl4NkxPYUxFNXp0MVNXTUJGaGI0c21F?=
 =?utf-8?B?US9oQ1lVMW5sNXUxUnZmNTF6M1VqWThpc0tCU0c2UUxvRkxWU2psUFY5ak5R?=
 =?utf-8?B?WG44dU0zcXR3SjEwT0p6bW9ySkY5c25ZTjRyN3g0aytpaHlpbTQ5ZVFxU2VU?=
 =?utf-8?B?RGI2NDc4cWorRC96TWJnSDNxZm9vYWppZlRvMTBVZ2JmZXZpZnFGdzFRZ09N?=
 =?utf-8?B?THV5MzNuNGoxckVjalRaRXk3a0t2cUR6NGFCNDdVME1tRG1SUGtSS3c0dVhO?=
 =?utf-8?B?bEZTZEU5L2VyVSswS24waXVrN042dnYxbTcvVldkcGVPQWpUZjg4ODlnd3ZE?=
 =?utf-8?B?SVZmcXFadE54ZDNvSGo0ZnEvb1EyTXUxSWhKQzJZeHVoVGlDMUpoNmdVajJx?=
 =?utf-8?B?ZjE0UWI3OXZyb0xGODBTUldYbWRic2RZa3Q0Q2lobzgwdysyaGQ4S1FzdUhr?=
 =?utf-8?B?UzZWdVN1SmNkTWNOM28xY0dvblcrcW5wc1BFWlZFZnA4YmtuZ1E0U1BENEh5?=
 =?utf-8?B?ajBhNk5Nc0hheTdpalJ3WTcyUjJoM1BnN3lyTWFoOVhSWG9RWTQ4WUF3S21J?=
 =?utf-8?B?cldoeGNqaEx0MGNiTDN2ZVlGcFpuWGg3ZDY2WW9Odlowa21QTTdvU3lUSFdD?=
 =?utf-8?B?ZHByVTR6QXRvaWpWSWFaa2tEY2RwaE9OcXhHVU4wZldsRmpvU1JCNFl6bGdr?=
 =?utf-8?B?OGpJcE1pR1Nkb01rWjFyVkhPdnZHSDFWTUpFKzk3SktaODJTbWpVNW9sVVpZ?=
 =?utf-8?B?bEROWEFPdlZrMkFBYm5xMlI3M3poaVpiSnBjL0Y3ZEVwMnBPM09EaGVTbWVO?=
 =?utf-8?B?NHJaOWNVcHNmOWpZTHE3Z1ovdG1zTG9DQVQ5Y3h0NjNRUzlIZThzaFZ2ZUpU?=
 =?utf-8?B?K1BnOW1UUkxFSnZVT29hRFQ2MlFkYnRMeGh4cDEyOUZDOHhxRFVxL1F4ODZw?=
 =?utf-8?B?MGRDODc2d3RpVThpam5kcU1DdHJGY3Y5TllxMFJmNnoxZE9Ud3BzNFo5LzlW?=
 =?utf-8?B?VHNyVG9obDMrdW85OVJLSERINWN4UjF0WXRxeVhPODdPZkpIa0VzRGphd3Ni?=
 =?utf-8?B?U2ZCUng3aGhMbUNhNTBtSjFqczNGRXdrQWhaREloUnBQd2RocWhHeERNSjlK?=
 =?utf-8?B?M3hyYkN2d2pNendaMldFV2ZOVlgwOUtQRGZvUFV1MnVDaXhieVVqUFdqbEcz?=
 =?utf-8?B?aGl0WFFVTmZzTldpUUwxZCtTMTBPN0ZOQWpUVmZ3bDAyMXdsYW12VTQ0eHVh?=
 =?utf-8?B?NDRuNk1pdVF6SGFtVXN5ZU9yRld3cFE4TENBb0pwWW9tV0FoR3RTWk9TVmlC?=
 =?utf-8?B?Q2JxMVlIdDhObWh5QVhiai9lWDViY2UwQ2FJNWR4cis5QUZtQk9kc2pScWsz?=
 =?utf-8?B?UkVCc1R6TmN5d0JjRVpzM21sZlZTV3pxRG95VzR3ZElxemRqY01PYXExdzB4?=
 =?utf-8?B?L2g1M1NSTERQTnBCU3EvSG1RMmVYSjlRd3Evd0ltNlRVa3p2OEN0Y29KVk5R?=
 =?utf-8?B?NmZmaWlleFJaWHBOa0d5dkRVMXVIMnVUL2V5NEhSempqM0NLdUQrTjdKWlRi?=
 =?utf-8?B?anFubVVOV2R0QkZicDRlS2NIYjJqT09Ib3dRRVZvNzVDZGRVajZrRzJ2OEJR?=
 =?utf-8?B?SXgwV2VmQU4zV0JxN1gxbkFNU0ppd0tWdHFTc2U2Vms5eXM5aDdZWGhzbXkx?=
 =?utf-8?B?TllIOEtpbCtMNDhsR2ZlYzV1ZVFkdVJ2bDhrMUlWT0RXTnorRy8ycUcvVHhy?=
 =?utf-8?B?TzQ1blhMSEpnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5887.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Tk9Jd1FzRldKdVJMaUdseTltSWtTMS96bXhOemdHcEJ2dmgwWWI1OGtSR1pB?=
 =?utf-8?B?L25oUE9WVFc4SVNpTzBUc0grRXlVb3p2LzFhc0FZcDRWUzRhcGdDemRwaWlZ?=
 =?utf-8?B?eWlxMkxYbXl0YWVqZnhtYStwdG0zMHVIdzQyVTZxdFBCTTJCVFZBdlo3TXpU?=
 =?utf-8?B?KzdMdUQxZEt4Y2Y2OWV6TTFxaHVNMmFMOUt2bE9OV0o2bTE1QUFoZUpvbG8r?=
 =?utf-8?B?Q0VZSGdXcEFla0ZJS29NRWM5SjlHbUN0cGNJZDljUnFmYnMvVjVISDQySXZJ?=
 =?utf-8?B?UWNQT20xa2FFcjBvQzI5MVgzN2ltT3RqWUo5M2hWc05aeG1KU3kyWEFNSkNU?=
 =?utf-8?B?ZDMyZUZnSG5VTGcyVHpBdnpHazNrNW1zSmtqaUNPWGZhVTEyR0lkQlcrb3Fs?=
 =?utf-8?B?NE5NdjV0ODVacUh3VTBzMEVudCtNTVUxMmxzZFZDS01sdzRacUFKc3AvaUd2?=
 =?utf-8?B?NitmTUVkdkZvZ0VET21rdlgxQkhiS01IQlhPZGRqRllXU0FjeWE4UzI4UkpN?=
 =?utf-8?B?bGFsSjNqMmN6YXJKelZuVDYvZE93UjliV2hWMnJMYUZTT0EwUkhscEhyenJG?=
 =?utf-8?B?VzI4VDJYWUFJTlRvdzZYWXBBWnY4RDh2T1hpNElGbnNuN0dXMlFiZExjWjAw?=
 =?utf-8?B?SXJGNXc1NnlRZjdHWnZ4TTE3bkhPdnJTdXdEK0JxaUZzQy9EY1k5RTZYckkr?=
 =?utf-8?B?NHlPRjNKdjhGZHYwUGNrcHY4bDBiaEIwUVczM1ZqUkFyczJOVEk0WVY2TURD?=
 =?utf-8?B?c21vOTM1YzZ3S1pselUxRXhxQ0Y2eXJxOWlQa2UwYkZCdko4YkhUU1Y5TjRF?=
 =?utf-8?B?dlNSV2h3N0cwZmliTS90YzUzc04zb3FLZVpJYjFidGNScHZzT3ZnbTNJNTRY?=
 =?utf-8?B?cTFndWw1VThHc3EveHpjUlVlVVlqbVZpeFBMblNlb3FveEZvcVdQaFBLSVNT?=
 =?utf-8?B?YjhTc0Uxckw2T0lDMlpjOHF5UDVHRndtTEdubjR6dnJWbWNmbzFnWVRTMDNq?=
 =?utf-8?B?cklwUTlDcXlrNTB4VTU0eTZicVVQcnVwZTRNeFZjMUpkOU0wNmtVTzBReS9F?=
 =?utf-8?B?dVVzNnUyYi96T2RXZnFpYnRMemtRM25JWHcvNENQVUVLbmowaDR1SHA2RVhx?=
 =?utf-8?B?RnBMeEpWOTl6UkVrN2d5Z2oxSkdFempLWlc3QlBhMGx1Zm93QjN0YnoxcWh1?=
 =?utf-8?B?S2V0OVhjdnVvdGFZZHllVS9IazcvdnpxNFlUOUE0YkdrcmFDeGhJLzZETFhs?=
 =?utf-8?B?enV6TXdkKzZWSER4M1FGaUtHZ1NnYzVFSFI3bE9ld2lTMGc3VUk1NTIwcGpw?=
 =?utf-8?B?dGFYNG15cGxUWFdlRXpwQlJNTUFhalBHbXAvdVJtMHFIOWVZSERCblVwaXE2?=
 =?utf-8?B?WTErY3lKc3JmK1dNWDNiZGVidG92RmpleEw4SHlvWW5IZFR0OXhORXppRlBS?=
 =?utf-8?B?citjalRxMDJ2MkhhdmU2N3VhYzhKMHhONFZObVFEQ2pqek1KZTB3UVhlczN3?=
 =?utf-8?B?TTkyUFczMHpYRGYxU2J6LzgrRVVCV0JDT1hUaC8xYmttV1Z3bzhkbGFMVG5E?=
 =?utf-8?B?a094dG9LK21lSG51UEdBck84TmVkenYvdFl4RjBpNHo5Q2VuM3VsQk5kTkJz?=
 =?utf-8?B?SGo3UkRiZGNNRHllakxDWmtXTlpvaVRxc3dkTkEwSjFWYXUwRW9VYjBEWkdW?=
 =?utf-8?B?TmZNMVVzb0ljWmlpQnhTSGQ3NThuREtzWmRnNkJqUjdjOEZWMDlnV0Zzd2dU?=
 =?utf-8?B?U0g3NnZhZTJPS3VIRkNYR1ZMYVJoOE1EeHA1UWlVTVRVSGs0dkpyeUpsbURF?=
 =?utf-8?B?V3NHZlluNlJzeWhlaDl5SXdqOEVXMG5RV0tYdGp2Z2krUUw1NUhTQWZXMyth?=
 =?utf-8?B?c3F5amZmbzBqejlDMHFXR3A0NzJwNWpGZUFneDlLR2NXLzcxUkUrMGxVYUVq?=
 =?utf-8?B?NTBGWmozbmlmK1RsMTNoL21TQWZNbXB4cmo2K1R1dnc3dkhMQ0FENGxVTjFH?=
 =?utf-8?B?L3cvT3BkNjBraVh3RmV6Rk9zMXQra0NsV2drNlJQUVI5V1lSR0E5eWxGTS8r?=
 =?utf-8?B?VzFHSkRlYkJhVXJkaE9TQUgxTS9GN09tejRwTWRjb2F0SXJvcmRveUx2N1Y4?=
 =?utf-8?Q?Ty1mj6WJJLZngcRpjTM9cYIQ7?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b29188f-8a7e-4e3a-a0a4-08dde9c5a802
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2025 02:08:49.2474
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p9FSk0CB0ynLXumStpw9u4P/uJO0cwqi9os3fKbPTHLCVo+gnEeOCRxv7O9c4qL0GVPf6kIoeLc2YkGuF7r2PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB7186

SGkgTGludXMsDQo+IA0KPiBPbiBTYXQsIEF1ZyAzMCwgMjAyNSBhdCAzOjIw4oCvUE0gR2FyeSBZ
YW5nIDxnYXJ5LnlhbmdAY2l4dGVjaC5jb20+IHdyb3RlOg0KPiANCj4gPiBJIHVuZGVyc3RhbmQg
eW91ciB0aGlua2luZyBhbmQgdHJ5IHRvIHN1cHBvcnQgdGhlIHN0YW5kYXJkIHJlZmVycmVkIHRv
IGFib3ZlLg0KPiA+DQo+ID4gSSBvbmx5IG5lZWQgdG8gc3BlbmQgc29tZSB0aW1lIHRvIHJlc2Vh
cmNoIHRoaXMgc2NoZW1lIGFuZCBkZWJ1ZyBpdCBvbg0KPiBSYWRheCBPNiBib2FyZC4NCj4gDQo+
IFRoYW5rcyBHYXJ5LCBJIGhhdmUgdGhpcyBib2FyZCB0b28gc28gSSBob3BlIHRvIGJlIGFibGUg
dG8gdGVzdCBpdCBkaXJlY3RseS4NCj4gDQo+IEkgaGF2ZW4ndCBmaWd1cmVkIG91dCBob3cgdG8g
Ym9vdCBpdCB1c2luZyBkZXZpY2UgdHJlZSwgZXZlcnl0aGluZyBJIGhhdmUgZ29pbmcgaXMNCj4g
dXNpbmcgQUNQSSByaWdodCBub3csIGJ1dCBvbmNlIEkga25vdyBob3cgdG8gYm9vdCBpdCB3aXRo
IGRldmljZSB0cmVlLCBJIHdpbGwgYmUNCj4gaGFwcHkgdG8gdGVzdCENCj4gDQoNCkknbSBnbGFk
IHRvIHNlZSB5b3VyIGludGVyZXN0aW5nIG9uIFJhZGF4IGJvYXJkLg0KDQpJIGhhdmUgdW5kZXJz
dGFuZGVkIHRoZSBuZXcgc2NoZW1lLiBJIHN0YXJ0IHRvIGRlYnVnIGl0IG9uIFJhZGF4IGJvYXJk
IHllc3RlcmRheS4NCg0KT2YgY291cnNlLCBJZiB5b3Ugd2FudCB0byB0ZXN0LCBwbGVhc2UgZm9s
bG93IHRoZXNlIHN0ZXBzOg0KDQpGaXJzdCBzZWxlY3QgIkNpeCBTa3kxIG9uIE9yaW9uIE82IChE
ZXZpY2UgVHJlZSkgIiBvcHRpb24gb24gZ3J1YiBVSQ0KDQpTZWNvbmQgcHJlc3MgIkN0cmwreCIg
dG8gY29udGludWUgYm9vdCwgYW5kIHVzZSAicm9vdCIgdXNlciB0byBsb2dpbg0KDQpUaGlyZCBw
bHVnIGV0aGVybmV0IGFuZCBleGVjdXRlIHNoZWxsIGNvbW1hbmRzOg0KMSkgbW91bnQgL2Rldi9u
dm1lMG4xcDEgL21udA0KMikgc2NwIGFyY2gvYXJtNjQvYm9vdC9JbWFnZSAvbW50L0ltYWdlLXBp
bmN0cmwNCjMpIHNjcCBhcmNoL2FybTY0L2Jvb3QvZHRzL2NpeC9za3kxLW9yaW9uLW82LmR0YiAv
bW50L3NreTEtb3Jpb24tbzYtcGluY3RybC5kdGINCjQpIHVtb3VudCAvbW50DQo1KSByZWJvb3QN
Cg0KRm91cnRoIHNlbGVjdCAiQ2l4IFNreTEgb24gT3Jpb24gTzYgKERldmljZSBUcmVlKSAiIG9w
dGlvbiBvbiBncnViIFVJIGFuZCBlZGl0IGl0LCANCg0KYW5kIHRoZW4gcmVwbGFjZSB5b3VyIGR0
YiBhbmQgaW1hZ2Ugd2l0aCBza3kxLW9yaW9uLW82LXBpbmN0cmwuZHRiIGFuZCBJbWFnZS1waW5j
dHJsDQoNClBsZWFzZSBub3RlOiBhZGQgY2xrX2lnbm9yZV91bnVzZWQ9MSBjb25maWcgaW4gZ3J1
Yg0KDQpGaW5hbGx5IHByZXNzICJDdHJsK3giIHRvIGNvbnRpbnVlIGJvb3QsIHRoZW4geW91IGNh
biBzZWUgd2hhdCBleHBlY3RlZC4NCg0KSWYgeW91IGhhdmUgYW55IHF1ZXN0aW9ucywgcGxlYXNl
IHBpbmcgbWUgYW55IHRpbWUuIFRoYW5rcw0KDQo+IFlvdXJzLA0KPiBMaW51cyBXYWxsZWlqDQoN
CkJlc3Qgd2lzaGVzDQpHYXJ5DQoNCg==

