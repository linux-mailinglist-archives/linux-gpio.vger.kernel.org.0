Return-Path: <linux-gpio+bounces-13920-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF0F9F34E1
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 16:46:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BA1D18817FA
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 15:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 990951386BF;
	Mon, 16 Dec 2024 15:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="YNPC40Z5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010047.outbound.protection.outlook.com [52.101.229.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF10145C1C;
	Mon, 16 Dec 2024 15:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734363999; cv=fail; b=H2nX8qq6w/b1QM0nA2WbrLeYSQRWBIgZiht5tmOL+o7TP0LDtBS8UstJvGxFHZpYlfdDwvoPqoHMPi450+uS7nGOZF/oCIIOqjYb1+m9H2AcZtfYbgMSU2drOtySDDsmuytCgWQvNXEiqxPxd/5m0LDcOzE9CPO1uk7QZrPNjU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734363999; c=relaxed/simple;
	bh=2kQvaLUw6UMrWnNcPNgAgQzl3ruMnZFJR2d24xwjaQY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KBXzngsVZRtM66iluF3bYKVSm7alEhdt9HPZhlDkB/6FNi6mi6XSI5I+vAfZoKyGkTgYyta5KGAfPJcHKk0qFqhj2kWUAx/zbwP4r/lX13EdAP23NC5hLVugVhmEu+bvGG0cApeuImJlOWJbTdNhf35/YJOhtSaLZahr+3sRNdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=YNPC40Z5; arc=fail smtp.client-ip=52.101.229.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EgroidOff7OppWCj1f1bmgDXf47w745ZJxSEx45Ycxp/pnjexm0BMJVSFXwQdnjWv16ygowr/aiaGBe9Lhi1Qi9UygJdIpuXr6EA4dBmSEsndLGhDvnGFsr5oTNwaT1CZDdErJLDaReIJXWrrMlm/ObczJtCpYzNlQYvRbuS4OYGNrb+R3r/KFNy7R2nyCq0WebeGgFbEHo9E/8bZsTXH2W+IavVJraCVzeXg44o1/M6J26TsZWDsxx5Sr+FN7iVyf/idT+ttof7h7bZcCqTnRzznOIHotEY5Gee3kUcZSGZQFNTUwh8lZ0o+8a68pG4Mtrxi38bT/7vhNdQwbWbaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kQvaLUw6UMrWnNcPNgAgQzl3ruMnZFJR2d24xwjaQY=;
 b=H0/4ie0AjOrE461ry9TbAv3sZdaOP5Q6Ll6t7mAEBLJohbJyule1soPNpgQ60IFntu9ztSjFt+C2wXBSVy/+OFrYo8Gi2vWp6Woogm9mLySGK/AWPcOfpFbjzezuiE+6WpOjA5CCZz+bRjIagBJidmcBh8NBXayXZu2mnM9So5pxHtfpsULS8djXUrK/2ohUKDmHVub/OvgEU18Cc1DQa4yXE11Lf9qLRUkMrq6ZbCvie2SvqmUObeoZBT3TS+vVfsrMKudMZ0hdNynMalfT0ZbaUWPSpDuhw7EfHtaWGMVNe2A/A4n+zICVkNZUjiHeiwruZOMI5Rmtlft4NL5ZxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kQvaLUw6UMrWnNcPNgAgQzl3ruMnZFJR2d24xwjaQY=;
 b=YNPC40Z5GGJC5Zoa9yXg9HXDXK54FWqG0EqprPr3iCvkGpZ7IUozhVXqMYVasleNXIuPQe6mtewQ3Rze9qt1RAV269KlD6ArSzfzf9bk1/j4RfqEq7BCanJSQMgAN+a1qVaqhbRLHTztkVrTgKZj76YfA8oHJu7EDsKi80Ff4pU=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY7PR01MB13893.jpnprd01.prod.outlook.com (2603:1096:405:1ff::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Mon, 16 Dec
 2024 15:46:33 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 15:46:33 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, biju.das.au
	<biju.das.au@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: RE: [PATCH v3 2/7] dt-bindings: pinctrl: renesas: Document RZ/G3E SoC
Thread-Topic: [PATCH v3 2/7] dt-bindings: pinctrl: renesas: Document RZ/G3E
 SoC
Thread-Index: AQHbTYX2fcLfg8ppIE6mTsvK/ncv3bLpAYwAgAAF46A=
Date: Mon, 16 Dec 2024 15:46:32 +0000
Message-ID:
 <TY3PR01MB11346279B92112A41FB130B27863B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241213173901.599226-1-biju.das.jz@bp.renesas.com>
 <20241213173901.599226-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdWKQvfySPvrck8LL8dQ8E9_oMKEkN4tnk_JcLsRuZPYgA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWKQvfySPvrck8LL8dQ8E9_oMKEkN4tnk_JcLsRuZPYgA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY7PR01MB13893:EE_
x-ms-office365-filtering-correlation-id: 97802255-4b27-4ce5-09a7-08dd1de8d0ce
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?L3oyckdBblJGREZ6M1NDUWM1bitWdHVkRWhIdXJ2UmFZOU9ZR2o1VEgwalRD?=
 =?utf-8?B?ZWp4U0EwTnFQQmkzSVdXSXRIUHArUDlZSS8yK044RS8zZ0U4M1BrNDFCY2Jl?=
 =?utf-8?B?b0xQVU1wTlNCNG9GMnZLSGZhTHBsbmlhelViMk9YdE9aN3AwMjB1a1BYbWZJ?=
 =?utf-8?B?OWFUaHZ0MXZ2Mm1vOEhXVTVFZ1Z2MDN5OU5PeHZwZmMreElVeUE3SVpwUEVT?=
 =?utf-8?B?dWhNSXdRdEdocTdxVXhtMzZlUmZhNHpKNlE3WEQrc3dQMm5wdVJSNXZvc2VW?=
 =?utf-8?B?c0dyZlNScTFpRWl0Qit6NXhGb2poQlRSVUdmdklyaUNHNDNWR2VGMWJMd3R1?=
 =?utf-8?B?a1BHS1RtVDc5blZoOC8wZEthK3d3NjRMbytuRVhEU0p6SHBvMlMvRXhrOTZP?=
 =?utf-8?B?dkFQTmZNR0JKTFJhMVRNQkZ3eDVpbS9QNDlzK3N3RXJsY2FnenA4N2NqN0x2?=
 =?utf-8?B?ZHEwY01jb2NMZURPS1hYMU5CdTQzRXdwNm90VXEvcUhoRlpsRjBqRkhoVVhn?=
 =?utf-8?B?OUUrUnhseU1ERkZLTm03ekRrREh3MlhXQ3dzbS9UcjVNOExSWGJDdzJQN1VS?=
 =?utf-8?B?YTdaVFlFRkkxbFVnUkJGcTUzUDBxbEh1clgyVzZKUk01QWtSc3MwTk85Yjdr?=
 =?utf-8?B?U1krVS9nSmtGOGUxNTlnb1A2dzR2MmZQRGNRazJFZXZaTUhhNCtPQ1E3RzZB?=
 =?utf-8?B?aGpZQUZxb3BXUkM1c2ZPT2IxYW4xQ044K2xBUE1pR2JiOEVpRWlNNkpYQzVk?=
 =?utf-8?B?VStwYlBFSnNaMjUvUnRTaERLOFpWRjd5L1BUbjJnZkp1aWtheHY5R0NSK0cy?=
 =?utf-8?B?c3RjZzQ4emYzQ0hIeFJrVWtVeUtZaVVvaEVHMTI2REJZZmlLckgya25hS0lp?=
 =?utf-8?B?SndmVXdoWEpoTTFTQTAzNWN0MlZZR1lYVzVaQWQwK1podGFaSWNoc2hLL25u?=
 =?utf-8?B?bmkzek05d3gyZU9icG1DTVN2bi84aTFNcGtzZWs0eEVGK054NUNTSU9ZTlQ5?=
 =?utf-8?B?WklTVzhjVVBCek8wUEphN0JSejNPQjlWOWRMRkt1bUh1cUFybWhONG52eXVD?=
 =?utf-8?B?RmVSZzV3dEt5c0xqMmR3bnA3ME9lcmVYaGE3ckorRjV5cVM1d1hIajNxNG9E?=
 =?utf-8?B?bUVtRFp3SkxXUkNkczI1bVBNRkE5T3ByZHphOFoxRWtGeHpMcmx5OC9YOU9h?=
 =?utf-8?B?MFA2UjJ1eHc2djN3WXB1ck9nak1KclBSUHd1K3Z5N09veWw3TFFWU0FhbFlV?=
 =?utf-8?B?UFc0Unp4dnJyeWJpaVZaVno1QTZ2ZzBNNW94K1RTWE5wb0NqU1M0U2JvU3Zu?=
 =?utf-8?B?QWdraTBDaENwMmticmRtU1l4VDhyUHdESGhjcFhYRUptS3MwMU5RMG5BWG1W?=
 =?utf-8?B?UUpFTkJ4Vml1TGgwbXpCUHpIZVdId2tucjBEL1luL2FoaEFjNkx0OURlVUJ3?=
 =?utf-8?B?QmQxVE5sWHpJL3RCR3V5dHplSnlDS2ZSeGRCZ2ZLMFZ3U0JnRnZMdFFqNnBD?=
 =?utf-8?B?WE1QZHIyWEcwQ0NLb1FKZG1nb3BKcFdFZEEwYVJOci9OVmtkS0l1ZktVdU1l?=
 =?utf-8?B?c253ZURjbWNvb09WSW9HQU0xZ2p3c25nWHBLSUIwaGRrWTI4NTZWdzd2aUV0?=
 =?utf-8?B?UThGTml2WGtPV2JKNTFZazlQNkU2cFJ0V2hyYnR6aFI3RG15UDN6U25XTW80?=
 =?utf-8?B?d3NRSk51cHE2MVY0dklUc0ViQTNhT05XRCt2ZnFMQ0NJdXh3MG1KZVBtZ21G?=
 =?utf-8?B?MTNCZUtlU1JZa0FJR1hJMWhnNElCV2trNEU1d3hMY2lLcDhWclJBWklZaW9n?=
 =?utf-8?B?WUZ5OFM4Y1NkZ3BCUHFRdllGODJmZ3pZVXhxdGt4ZWI0dk1ZQzVjZGJKYUVK?=
 =?utf-8?B?dzE0blNWNHh6b1dadWMyRnh6d01RV2pteTFjVE5BdlB5RTdlZmhFaE5seGkx?=
 =?utf-8?Q?wRe5vAMefND+rzrYTOm2xiguIbFmF35D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Sno5cHJCT1hpaGN6SFF6eXpwcDJnVGFNMzNlYTBod2ZYODdBNVhxa0tLeStB?=
 =?utf-8?B?bUgyY1d6TGNJOUVoeGovUWVIRDRINkdJendQd2RFeW1WaS9DMndSbGVKVkEz?=
 =?utf-8?B?czYxVURlMmVWenFyeUVTVjFSM2t2RGVnWCs3RkFTeFdxMXJ0TVpGNndnTURS?=
 =?utf-8?B?bktkbkkxRUp2aTkzeHd5YWpYajlZa0VSQmlwcDY5aEJqVDlRU3hRMkQ5K1I2?=
 =?utf-8?B?YVBMY1ViRVBpT080c0dCVUpNSEZWZEg3T0NaZnZoTWRtM3hxaFUvSHhzY1lY?=
 =?utf-8?B?OVVxTkJGbllxMHZXT0NyOTRNeW4yZjFseXpON2Z5UlZNbHVxMTNYSU02QmV6?=
 =?utf-8?B?RVRZaHhXWGJyVFAyQzFSVGNFTEVzUWFGclZjS0lsMThqTTVjbm9UR0VQdTNQ?=
 =?utf-8?B?Z1J6TUZIWTF6bXc4RWxKMDFRYkg2ZFZFVXNQeGhLcDdBTEZQRjdKR2E2emtw?=
 =?utf-8?B?UUd1WXhZSENxUHhiMjhFbEFiVG1GZkVGZE5kbmNONnNLYWVwSnNhZHp5cU0y?=
 =?utf-8?B?RkxYbjBuRDFWV3dOcmg0MHNHVHZxNFVZbGlybVIzY0I2WTk2YlhyTXVucVJp?=
 =?utf-8?B?YXpocWgzTDRRS0EwUEd3SnEvREJ2OW0yVEtZU1dIL0dQVWd5WXRRTS9MNExY?=
 =?utf-8?B?ekxpTWl2ekVhTUE2NGxnZ01FWGN6M1FVZW0wYThoZTVGQWdleVVwZFZ0cjJO?=
 =?utf-8?B?Q2NlMXBJdkdlRFIwQU9jLzJQMUVqRC9uQjBHUUhIWlpGT1FjNnZkM01nR3ZM?=
 =?utf-8?B?VGcyMmwyUHdMd0Y4dlN1TnRuUnJhL1c0bGZxWW5qQWpQNTVXNkwvSFhkdTE2?=
 =?utf-8?B?QjlJSFB0RXBwMVhBNC9hSUFNa3NSVWNrd051UUFSb05MbzZxNFhEOHBqQnRM?=
 =?utf-8?B?SmxHcUxOaU1qL2tGVkxXem92YmtnMFJVUGtxOENlMDRKZ2ROMmNWVDl3MWc5?=
 =?utf-8?B?N1J4bGk3RkxjVTBJVklORGh5aUIxWUFCT1lKckV0dWpHd1dUdTg5Q0hTdFht?=
 =?utf-8?B?alpJRWRUMmVrZ1dqM2xyV0lhdFZXMHhwOUhLLy9taDBEdUJ2STVXdE1iU1dw?=
 =?utf-8?B?NEJVZkRwYklZeVJnbDZNUGdlRnhQdnd2R1UwT0lCTHlPdFBhSU9mcEliVFNS?=
 =?utf-8?B?Tk02VzJGVG8waDQ4c1VCUThnMlQvVi82OGxac0tNVnM3aXZXbG5pOUowZFNq?=
 =?utf-8?B?NngyM2orRkU4MHo0KzMrb0dDRlRqakRUZmZUYUVtYUFQaVp2RG02bU4wbUNu?=
 =?utf-8?B?MVlyeUFOYWxBN3BwZktiUkdGWXh3SFh1Tm1jMWFVM2I0b3NFQXRVV21Ea3FF?=
 =?utf-8?B?WnlpN3hVbzVoY3cwd2JTM1FNaGJhOVBrNDNrWjNGWGRNczViOHNHa1dISEJj?=
 =?utf-8?B?RzdXYmJudEphUDRuUmlMTWhSTHkzMjNpbkJ4MHJJMUtmMUZ2aFlLOG1RSjJM?=
 =?utf-8?B?STg2OXo5djM1Yzc5dWRrdmg0YVBzaVl2dU1NSHFublBaNDJ4a05NRWFOK0xW?=
 =?utf-8?B?TFRiTEhrc0hZMmFQTm5pbHNpaUJVbHV6SnFDcGl4NnNjSmpkQjZteXAzQVgw?=
 =?utf-8?B?SnNDajJ0dlRjNWZBMnJNSWdMYU9SdHNLNVlDaDkwRC96VDVzUjY1N0thUnNi?=
 =?utf-8?B?SzNaS3RhbEcwclVSYXlibWxobUpwNEVMZ0JjcG5HRjVXeXBxd3BQVVJqSEpF?=
 =?utf-8?B?Y0s1UGc4UXhEYmIyQnAwaHIxOEVqU2liMlFRMVBDeXlKQzhiRnRYMDNVeWRL?=
 =?utf-8?B?Z2ZMNHJmb2IxbzRZU1JIclJ3b2RVT1ZZR3F4UkpGWWEyS2s5WkpFbXdtS2Rj?=
 =?utf-8?B?UFVudWdsTlRpSHIxTmVuczZBNnFNazBGOTdPMEt3ZzZRZkJkcnBJdGNvSVZ5?=
 =?utf-8?B?WHF5VmFPNGlQSTF2MUJSVm5iU09lcWxaMEtPNk5vcWVKMzEyaGFaa3Mvb0E4?=
 =?utf-8?B?d1hFVVRWeXJJWkJyT3V5T29TZHBoMWF2OUFYTXBHUFBlbU9ZOEI1Yll0b3Ir?=
 =?utf-8?B?R2VqK200SjNVbUFhYlNvUEpwNkFhODNFaSt0bEo3NjgvWERsUEpMWnNNU3Fo?=
 =?utf-8?B?SHNmRTlvS3lEWlUrbTA1R1hPQlBRVVg0cHYvN3Q3Znp5c2ZUNlh3SlFibW5K?=
 =?utf-8?B?aXNyZmw4alpyZjRRVUZ3UW16NytaU2FGYlIzRExJaVhNWkJZbDdJNmdQQ1NC?=
 =?utf-8?B?WGc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 97802255-4b27-4ce5-09a7-08dd1de8d0ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2024 15:46:32.9073
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JQfje2SPoL8s+w8TmlM8Jc9JT48rluP/q7FTbc+vJArRx9ZZJ8S7aYctR+NOLUBvtzgwAgEmZGnFPNpuOq17pqcqahUxrJA6V8UJDIpS+OM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB13893

SGkgR2VlcnQgVXl0dGVyaG9ldmVuLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdl
ZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTZW50OiAxNiBEZWNlbWJlciAyMDI0IDE1OjIyDQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMi83XSBkdC1iaW5kaW5nczogcGluY3RybDogcmVuZXNhczog
RG9jdW1lbnQgUlovRzNFIFNvQw0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIEZyaSwgRGVjIDEz
LCAyMDI0IGF0IDY6MznigK9QTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+
IHdyb3RlOg0KPiA+IEFkZCBkb2N1bWVudGF0aW9uIGZvciB0aGUgcGluIGNvbnRyb2xsZXIgZm91
bmQgb24gdGhlIFJlbmVzYXMgUlovRzNFDQo+ID4gKFI5QTA5RzA0NykgU29DLiBUaGUgUlovRzNF
IFBGQyBpcyBzaW1pbGFyIHRvIHRoZSBSWi9WMkggU29DIGJ1dCBoYXMNCj4gPiBtb3JlIHBpbnMo
UDAwLVBTMykuDQo+ID4NCj4gPiBBY2tlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlA
bWljcm9jaGlwLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpA
YnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gdjItPnYzOg0KPiA+ICAqIFVwZGF0ZWQgdGhl
IG1hY3JvcyB3aXRoIGhhcmR3YXJlIGluZGljZXMgaW4gdGhlIGhhcmR3YXJlIG1hbnVhbC4NCj4g
PiAgKiBUaGUgY2hhbmdlcyBhcmUgdHJpdmlhbCwgc28gcmV0YWluZWQgYWNrIHRhZyBmcm9tIENv
bm9yLg0KPiANCj4gVGhhbmtzIGZvciB0aGUgdXBkYXRlIQ0KPiANCj4gPiAtLS0gYS9pbmNsdWRl
L2R0LWJpbmRpbmdzL3BpbmN0cmwvcnpnMmwtcGluY3RybC5oDQo+ID4gKysrIGIvaW5jbHVkZS9k
dC1iaW5kaW5ncy9waW5jdHJsL3J6ZzJsLXBpbmN0cmwuaA0KPiA+IEBAIC0yNCwxNiArMjQsMzUg
QEANCj4gPiAgI2RlZmluZSBQT1JUX1A5ICAgICAgICAgICAgICAgIDkNCj4gPiAgI2RlZmluZSBQ
T1JUX1BBICAgICAgICAgICAgICAgIDEwDQo+ID4gICNkZWZpbmUgUE9SVF9QQiAgICAgICAgICAg
ICAgICAxMQ0KPiA+ICsjZGVmaW5lIFBPUlRfUEMgICAgICAgICAgICAgICAgMTINCj4gPiArI2Rl
ZmluZSBQT1JUX1BEICAgICAgICAgICAgICAgIDEzDQo+ID4gKyNkZWZpbmUgUE9SVF9QRSAgICAg
ICAgICAgICAgICAxNA0KPiA+ICsjZGVmaW5lIFBPUlRfUEYgICAgICAgICAgICAgICAgMTUNCj4g
PiArI2RlZmluZSBQT1JUX1BHICAgICAgICAgICAgICAgIDE2DQo+ID4gKyNkZWZpbmUgUE9SVF9Q
SCAgICAgICAgICAgICAgICAxNw0KPiA+ICsjZGVmaW5lIFBPUlRfUEkgICAgICAgICAgICAgICAg
MTgNCj4gDQo+IFBvcnQgUEkgZG9lcyBub3QgZXhpc3Qgb24gYW55IHN1cHBvcnRlZCBTb0MuDQo+
IEhlbmNlIHBsZWFzZSBkcm9wIGl0LCBzbyBEVFMgd3JpdGVycyBjYW5ub3QgdXNlIGl0IGJ5IGFj
Y2lkZW50Lg0KDQpPSy4NCg0KPiANCj4gPiArI2RlZmluZSBQT1JUX1BKICAgICAgICAgICAgICAg
IDE5DQo+ID4gKyNkZWZpbmUgUE9SVF9QSyAgICAgICAgICAgICAgICAyMA0KPiA+ICsjZGVmaW5l
IFBPUlRfUEwgICAgICAgICAgICAgICAgMjENCj4gPiArI2RlZmluZSBQT1JUX1BNICAgICAgICAg
ICAgICAgIDIyDQo+ID4gKyNkZWZpbmUgUE9SVF9QTiAgICAgICAgICAgICAgICAyMw0KPiA+ICsj
ZGVmaW5lIFBPUlRfUE8gICAgICAgICAgICAgICAgMjQNCj4gPiArI2RlZmluZSBQT1JUX1BQICAg
ICAgICAgICAgICAgIDI1DQo+ID4gKyNkZWZpbmUgUE9SVF9QUSAgICAgICAgICAgICAgICAyNg0K
PiA+ICsjZGVmaW5lIFBPUlRfUFIgICAgICAgICAgICAgICAgMjcNCj4gDQo+IFNhbWUgZm9yIHBv
cnRzIFBOLVBSLg0KPiANCj4gSSB1bmRlcnN0YW5kIHlvdSBuZWVkIHRvIGtlZXAgdGhlIGRlZmlu
aXRpb24gZm9yIFBPUlRfUDksIGFzIGl0IGlzIHNoYXJlZCB3aXRoIFJaL1YySC4NCj4gDQo+IEhv
d2V2ZXIsIHRoYXQgY291bGQgYmUgZml4ZWQgYnkgaGF2aW5nIHNlcGFyYXRlIFJaVjJIX1AqIGFu
ZCBSWkczRV9QKiBwb3J0IGRlZmluaXRpb25zLCBsaWtlIHlvdSBoYWQNCj4gZm9yIFJaL0czRSBp
biB2Mi4gWW91IGFscmVhZHkgaGF2ZSBTb0Mtc3BlY2lmaWMgKl9QT1JUX1BJTk1VWCgpIGFuZCAq
X0dQSU8oKSBtYWNyb3MgYmVsb3cuDQo+IEEgZGlzYWR2YW50YWdlIGlzIHRoYXQgaXQgbWF5IGdy
b3cgdGhpcyBmaWxlIHdoZW4gbmV3IFNvQ3MgYXJlIGFkZGVkLg0KPiBCdXQgdGhhdCBjYW4gYmUg
bWl0aWdhdGVkIGJ5IHNwbGl0dGluZyBpdCBpbiBtdWx0aXBsZSBmaWxlczoNCj4gDQo+IC0tLSBp
bmNsdWRlL2R0LWJpbmRpbmdzL3BpbmN0cmwvcmVuZXNhcyxyOWEwOWcwNDctcGluY3RybC5oIC0t
LQ0KPiANCj4gICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9waW5jdHJsL3J6ZzJsLXBpbmN0cmwu
aD4NCj4gDQo+ICAgICAjZGVmaW5lIFJaRzNFXy4uLg0KPiAgICAgLi4uDQo+IA0KPiAtLS0gaW5j
bHVkZS9kdC1iaW5kaW5ncy9waW5jdHJsL3JlbmVzYXMscjlhMDlnMDU3LXBpbmN0cmwuaCAtLS0N
Cj4gDQo+ICAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcGluY3RybC9yemcybC1waW5jdHJsLmg+
DQo+IA0KPiAgICAgI2RlZmluZSBSWlYySF8uLi4NCj4gICAgIC4uLg0KPiANCj4gV2hhdCBkbyB5
b3UgdGhpbms/DQoNClllcywgaXQgaXMgY2xlYW4gYnkgdXNpbmcgc3VwcG9ydGVkIHBvcnRzLg0K
DQpJIHdpbGwgc2VuZCBuZXh0IHZlcnNpb24gYmFzZWQgb24gdGhpcy4NCg0KQ2hlZXJzLA0KQmlq
dQ0KDQo=

