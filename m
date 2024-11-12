Return-Path: <linux-gpio+bounces-12849-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1204D9C5168
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 10:03:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 914A21F22AB4
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 09:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D20D20CCEF;
	Tue, 12 Nov 2024 09:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="RWv9+jz6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011003.outbound.protection.outlook.com [40.107.74.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9D61F7092;
	Tue, 12 Nov 2024 09:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731402199; cv=fail; b=F5JSQ8neH2beYpgM1RrGRrRmG5npMKsovgtFPhRGJq8H2ZZDHQsmTuF01LZwFgMUSBCNvD7KvUQNjEJH/bhKPlUygfeqesLpj5MbOCjjKFzywoK1Wut3r9wT+BHARIF0raaIBS+lQdQmWS39vJiSd7xSd78cJfSPpF0Shw5sKU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731402199; c=relaxed/simple;
	bh=bE4T2FU6l9ZyEDalq+ZjgSDqvd4uGZEeYdyRwOReH7Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LkqmgD6CEoFVoOg0RTF3l/D77rSaO4/7+UYTeqmDkSpQOVkN4DovMIgsK8yVkTMgo9NTqxeQBSfVBHI/441CT8EslFI8f+7XQ1ZoONNcaH10dQIWRQJnTajbCUNjyhtSCyMpKjPeRP8kw85FGHhgzTnx6aF9cIM5fifYR5qTAlU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=RWv9+jz6; arc=fail smtp.client-ip=40.107.74.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kf4V3bCmbGpFrMGpYXlsn9aEoE8UoJYOcMuY2ybo3ZEWWU9muAEutKi+NUZAiosUoJvCI20bzsaAfQ++sA1Mgx6TJi2ix5NBMqQ7s2M52drmwn1KXtY8BMu3ycelvOfOa7uMOJ+oSAPB4jb7U1rN4GQjldoLyddgZrsAtlevNPMkUMdKUDDhymbyMIgqsUOabB49nf7sT4t9svuspv/HX1fbXUq5UppAF/0F/rRYNmnTK9IMuYDU1eziRNMJ8ceYgRbzs0+c+BlScClQNNZ3j9sSRUrmkP9vuDuFyHitDQ3vxCHyzV1QyJQH2U75Y9H/UDUTZyh8rNKC5PB3FNW1Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bE4T2FU6l9ZyEDalq+ZjgSDqvd4uGZEeYdyRwOReH7Q=;
 b=G1zwlX+3DQGJ9OYhoDEcbA39lTd2ftI4FMjSt6ErDlZ7uyNW/WeyvDMXUjrav8Izfgqv/77A6+IoanqacRnyeGuEIw+qyb4rmmWdxXxYBE8K/Oiqu+LGUKj1u6nRDUfREO366fop+l6NU5Lbtc9lZfrVSAlZTcn2lNwurvjnidRtSqT5+SC+FifIMdI7UnjH1aN8+fmF90wiphZ6d1hmyEZkNxc8twyaNLt70HwqTSBATX9NjJBPcKUaY6GcxQq3awvtFQ3AaLBdy/76ciBYK9zo/9cPCGPy/7BwEaLEE9K+e/fjcfWE/g0GaO0Mys5SCsIvTfhZJZzD/9MuLxzEMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bE4T2FU6l9ZyEDalq+ZjgSDqvd4uGZEeYdyRwOReH7Q=;
 b=RWv9+jz68UWmrqhvWjlnnf0Eoyp2J0kl9yqmNWUSlFBHIh1M5BzXvfhEagSm6aSHaqn4MZ/fZJnNCw1lRio6RQkt3arozbaaDifZScI2p/bVCCsqDKIjH4bWl92ENevllV0PUSVnShrD0gvmbw9cEBzv0N2QndlDPzy+k6kBJQ4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB12882.jpnprd01.prod.outlook.com (2603:1096:604:33c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Tue, 12 Nov
 2024 09:03:12 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 09:03:12 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>,
	"magnus.damm@gmail.com" <magnus.damm@gmail.com>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH v2 24/25] arm64: dts: renesas: rzg3s-smarc: Enable SSI3
Thread-Topic: [PATCH v2 24/25] arm64: dts: renesas: rzg3s-smarc: Enable SSI3
Thread-Index: AQHbMcwk+s13zfsAPEGSqJT9ouqgjLKwN5YwgAG8EACAAABHYIABYvwAgAAG2BA=
Date: Tue, 12 Nov 2024 09:03:12 +0000
Message-ID:
 <TY3PR01MB11346AF4A763ECF2D2F31588C86592@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
 <20241108104958.2931943-25-claudiu.beznea.uj@bp.renesas.com>
 <TYCPR01MB113329FE5E9E610BEF45DC001865F2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <c15bb621-6cd9-4be3-beec-20fecd411547@tuxon.dev>
 <TY3PR01MB1134600DEBF0096A67950441086582@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <ce074521-7d4b-4514-9b2b-59b246686210@tuxon.dev>
In-Reply-To: <ce074521-7d4b-4514-9b2b-59b246686210@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB12882:EE_
x-ms-office365-filtering-correlation-id: 84c9c170-ef2b-4e24-3557-08dd02f8d5f8
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?QXVqbmh6WFJNTjU5MTFTL1hSYjErMzQreVlCcjYzVCtZcmFXY0trMkRBdkhy?=
 =?utf-8?B?ZDRlVFJ5aUZFVHBvU1FyeGNjbXl4VzFyQ2xqMmdoZWZ1MDFVNUdWMjViSzhG?=
 =?utf-8?B?dXUrOUtWcnNIWjRrUGJNaWZXVXE1NGFyM2g5VVo4dXlWdUVqQXpRQ0JsbTMr?=
 =?utf-8?B?M205R2xlbzFWSG5qRUxMWEQrMHVKMmhwQzJHQWJuTEsvZi91bllFU3F5aGwx?=
 =?utf-8?B?NXBZODg3ZGUwaEE1cEw1MWVMQ1hFYWJDRm9ubmR6cTBzT3IrRE11aWJ6QXBR?=
 =?utf-8?B?YTY2WXpIZTdZZkJpZTkwdWtEVklsZlpLT2dtMXJwbXlHTGR1V09kNEppcUhw?=
 =?utf-8?B?SnhidW84SmVYeEIvS3Bqdm05clozT080SEdUTEVpM3NXMC84b1dDdmpjZnV0?=
 =?utf-8?B?dFE2SVVncGczYnBkeXlESUtmZWFsSkhMaWlmK29wdTFZS1hkQStZVWVRalRw?=
 =?utf-8?B?bnhWdjJSUEg0akkweDRQdldVM0tweG1MYTRLU1g2KzZVaXRrVzJkdGkrVXZW?=
 =?utf-8?B?MDNlV2lGczRzRkVKNWE1L09TVjA5NW1BNnlMWXZESzdjU1c2eDJGTHdRMkxt?=
 =?utf-8?B?RDhNZUhPSFc5bnpHSlFpdXg5LzgyTW9pa242U1QvbWVnR2c5SXZ6b3lHWUEz?=
 =?utf-8?B?TE5ZWGdScU5xUzZwMUpHb2JGMUpmNnpHSDdyRldQdHFnWVZEcDhEV0J5WmQx?=
 =?utf-8?B?S3hPcGxwUzUra2IvazV4b09tbHNoVlNoNlYrRkI1dEI2bkh4bEdCYzdPSmRm?=
 =?utf-8?B?WlV5NXU3VzV0ckNzditHS2NwTnNBTmtFdE5kTmdTc0szdm5vSGdUeWRmQk1v?=
 =?utf-8?B?bnhjS1g5VGRhV1pLei9qb0dmUzlFaEFUdUpoa2J3SjFib0h6bkpYV1RNbXlX?=
 =?utf-8?B?RmxTWkdVYXRqWHV5VU82RWMyaExRUU5OTmtiTWNydDhNU3RZYVVVaDlIVG9F?=
 =?utf-8?B?V0VlaWp2aFVRM05GRld2K1p5dHhKRDh3L3pDL1RGQnZzT3grclluMFZrY2JL?=
 =?utf-8?B?djNjRHpaQkRhUzNUL0cvVm9XMjYvelRMZ0lKUnRjckp0OUk4b2RMbUU5WjBY?=
 =?utf-8?B?N3RaZ2VhY0UrQUI4OTBSeWFidUhnN2lBeUVWUkpoTG43ZmlRV2RJOVZ4cFdB?=
 =?utf-8?B?NVBvNXYzbFlPLzN1VHcxbHpPcjFaam1GUUs1T0FxR1c4SS83djR1RW9HR0di?=
 =?utf-8?B?YUNKMzVvYktmR1VOVU1BRko4M3E2Ymo1c2UxcUFYTWRLZmhYZGo3QnlJc01w?=
 =?utf-8?B?dlpFemdpcjI5MzBycFRieEQrTGcrYXR0MlZrVGNxbGtSYmNXemZkN05QNDlN?=
 =?utf-8?B?cFpZeTZxQWx6WWtkZVpCaFJNSHNnRlpEL3RRcDVkS1hwcTF2QTVnN0JUS1Fq?=
 =?utf-8?B?L2t0QmlHWEJEZXphWXJHOHdPOFVGVUhBRFVtbFV0QWFUMUxPUGFqT3RPYnMz?=
 =?utf-8?B?bFVQOWtBdUIya09lWXdVQkZtSGhtTCt3ZzVVQm9SVU03WHRZMFZpaklkcjZo?=
 =?utf-8?B?Ry9raUU3TXNKT1M5NGZidGk1aDNvbGFDU0RmaWl2LzBqblVkTFZWcFgzVFk4?=
 =?utf-8?B?R01EZmFBYitZa2I0RWVhUTN5SVQxSy9EMytRUS9OeHBoMkFKUUhsNkFSenVl?=
 =?utf-8?B?eWRrMUcrZWJuQ1pjR3I4YlJ5WkkrWktWais2d3pETUEvdGFKdjBCMEY1c3Iw?=
 =?utf-8?B?dzM1K21CSFd1SGM1cEZEUEtYdWlMaVAxM2Q5VXUwMEtiQnBhSUtYN1dNNjVk?=
 =?utf-8?B?cFJkYm91elpTOFJDenZweW1LTzZsS2Facm12blg4NkFRR0RjVFVXbERxc0FN?=
 =?utf-8?B?WFVSam5KZWQ2OHZtdVBEdXR3Q1FrYTVlZnZ6allIMVhuRnNsb3ZadGJDK0di?=
 =?utf-8?Q?8dhZl5juRtDjd?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cTZZN2J2aWMvWWNTdkxBUC81djkyVlhIUDNkbW9ybTh6RTF6M0I0TkRZREQx?=
 =?utf-8?B?b28rV1NMeFNmbDNsV05pT0hLalJvOTNGcE9NUXVIRzhMRGhQZkpFaHgvREw3?=
 =?utf-8?B?Mjh2TkY4a1VSNVl0ZUlYT0RJcGMxckk5a0lRdGFqZ05velNZSlFncERhRzFY?=
 =?utf-8?B?RmZUUWJXU25MY2dqRkIxRmdSRGNnMXZQcjFqeHAwMk1lbXI5OUZnWDYrZVRK?=
 =?utf-8?B?YkNEUXlFeWNPTkNzeEYvVzNIUkhNdU9mV3Y2UTk5WTBpc0ZucFJVQzZsV2VN?=
 =?utf-8?B?dGJmTWhZUGEyY0U0NkxqYkRJLytzTWhzcXdSNVVJSFpvWEN3MWowRXQrcis4?=
 =?utf-8?B?cXREMm9CbDF3clRQYkNiQ0ZWbEY3dm1XeDhMYUdBTmFSU0VOWFlaeWNGaTNO?=
 =?utf-8?B?cy9LL2VIODV1ZjB4V01yNk4wclZXOG12NXhzckdVTFZ5U3pRUWRmd0Q5OWlz?=
 =?utf-8?B?RUZzK2JEMzVpUkJRc0pXM2tIcXRYOFNjclgyclZtQ013MFppTWxUdW5EcCsv?=
 =?utf-8?B?SGxzMVlhMzB1alFMSEhYdjJFN0NidmpoQUtTbU9kWDYvSEY2dWtDcVRNVmlE?=
 =?utf-8?B?TkZkWXJ5dTlZUENUTFEwdEVRd2JFbGVoZlNxWUpEbnpsbW5CeHlTUDhZQS9m?=
 =?utf-8?B?S2dkTFJqUkdKRW9GblpvbmdLLzJNVzM0UGlDMzVBekxTYUx1MUpRdFNTejNR?=
 =?utf-8?B?b21BbnN5SGFzTHlpMjNuamZWYUFUcmxXZWJMZnFiT0tnMGozWmNDdmRQOWtj?=
 =?utf-8?B?b05ydHMvV0tGK2UxUktMY1YxVnlzc090MTM4eHA5bUQ2WS9qb1d3eWJYd1JL?=
 =?utf-8?B?VDB4TWt4TWZjb01xdFJVM1VVNnpNblY5TUNRRDREWlFEc0FFMmRhalRpQWdJ?=
 =?utf-8?B?VkhNZWdDeHNGMFVHOFcwaE9QcUtPMGdRVG92d1lqNWRtQjY3VHNDUmJWL2p1?=
 =?utf-8?B?NCtFT05UUnV6MSt6b1hvL2ZGdi9KaVY1MlpUSm9QMWxxajFwZUR5QkVMNTU1?=
 =?utf-8?B?U0R6YTdSY1lZSXZEUVFRbWJVaEdyS3hISVR3a1FURlJJU2FJZlJCN0FMSWxV?=
 =?utf-8?B?Q2dJWFB6cG1WTXBaUnR0ckxOcExpdGZQRVQwM1BKVHZPWlpwM2lnYnVBM1k5?=
 =?utf-8?B?b05BeDBrcWVGRlo2dUUyQnVlemFpaDVPVlU2Um1NR1NrZWRWUHEvWjltUEVx?=
 =?utf-8?B?RUJCZXp2cXRaZW5CTisyR24vQkw3L0xBTkwraFJNS0NBUGRQUzNocUlKLzMz?=
 =?utf-8?B?Ymg5REk5SmduQUkrMDI4enpmNlhpbHJreDZIdzB4bTgrZjJsVy9MZVhhZU05?=
 =?utf-8?B?Nkx1TXFXWFdXWllidE15L1ZGOCtEMXptMTB3c3IyL2diMHFQdmNvWEo0aHIr?=
 =?utf-8?B?RUhKREhrYnppRlRsaXRaakNPVFladDhxMGdpNHE4K2R3QklvR2RnQmJiRXBp?=
 =?utf-8?B?bitkNGxoNytMRS8zTFdzbVFSNzgxeDBWalQ2ejdHRFlXbFR2NVB1M1NoNTlh?=
 =?utf-8?B?ZEtKRFhvU3hMb0VLcG9Ca2NLdGxXbE9MNTA2RVFDRUdYb0l1Z3FHRW4xMk1o?=
 =?utf-8?B?SXMvbWpKeW1raG9ITG4xU29xMnhVMEFkdVhMWnMzZXNMYUx1cmhMc3NLS1dT?=
 =?utf-8?B?bHZacmFYaWIrTCsvYjQ1V3IzL0ZQL251d0cwLzJZRU5lbEs0aGlRVEloZjg2?=
 =?utf-8?B?eTJTbm56QzlMMUR1bHJLTUJkcTlxdXVKZzVOajlvOGo5ZC82Z1RrNWx3SVNY?=
 =?utf-8?B?djJxUFo5VnB1bTV1d2RZZ2VjYkN4MjRCRy8zTTBRWC9xc2ZiT09JWGZpbHFs?=
 =?utf-8?B?MGpTZWgxcDg0bzdQQW16T3NTcmdNOEJmSUhqL1JHa0lXSXoxQ0FCVVk5alZ6?=
 =?utf-8?B?Q2RiYVFHQTM1ZHVEOFQ4V2hGbG1CMkttbjRIRythMDlqNU5xempacjdyNGhJ?=
 =?utf-8?B?SmNhWTVuRVRNdXpic3VqWU5iejRuME9UWVNabHFyaGEzamFtTG9lNVFFenRD?=
 =?utf-8?B?dnJ5TFJqQW15MVNVUEJsVDcvK2Vub1VEQUhXSEVaWG12RFVRWHhBQ29XQkMv?=
 =?utf-8?B?cjIwMlRlNXM5VElaUks0ek1SVDQwSTFGNHQ0WDdMc0hTQW16UTFqN2UwVy9R?=
 =?utf-8?B?Zzd1bXg3dTM1ajNNd1h2NStBU1dLQVFlQTRHemVqZnJJeGt2T3ljU3l2YTNY?=
 =?utf-8?B?TFE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 84c9c170-ef2b-4e24-3557-08dd02f8d5f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2024 09:03:12.1283
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zXfQjmIfna1p3TraHBAR352Mw62nlW+Cs6NbFjmNwYtbz7NRVtkCuNi/mXgJQmpibKgW7JIqm+x745HN8ZjcgA0gSOs3JGy1mepF73YCX5o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12882

SGkgQ2xhdWRpdSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDbGF1
ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiBTZW50OiAxMiBOb3ZlbWJl
ciAyMDI0IDA4OjMxDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMjQvMjVdIGFybTY0OiBkdHM6
IHJlbmVzYXM6IHJ6ZzNzLXNtYXJjOiBFbmFibGUgU1NJMw0KPiANCj4gSGksIEJpanUsDQo+IA0K
PiBPbiAxMS4xMS4yMDI0IDEzOjMwLCBCaWp1IERhcyB3cm90ZToNCj4gPiBIaSBDbGF1ZGl1LA0K
PiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IENsYXVkaXUg
QmV6bmVhIDxjbGF1ZGl1LmJlem5lYUB0dXhvbi5kZXY+DQo+ID4+IFNlbnQ6IDExIE5vdmVtYmVy
IDIwMjQgMTE6MjANCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAyNC8yNV0gYXJtNjQ6IGR0
czogcmVuZXNhczogcnpnM3Mtc21hcmM6DQo+ID4+IEVuYWJsZSBTU0kzDQo+ID4+DQo+ID4+IEhp
LCBCaWp1LA0KPiA+Pg0KPiA+PiBPbiAxMC4xMS4yMDI0IDEwOjU0LCBCaWp1IERhcyB3cm90ZToN
Cj4gPj4+IEhpIENsYXVkaXUsDQo+ID4+Pg0KPiA+Pj4gVGhhbmtzIGZvciB0aGUgcGF0Y2guDQo+
ID4+Pg0KPiA+Pj4NCj4gPj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+IEZy
b206IENsYXVkaXUgPGNsYXVkaXUuYmV6bmVhQHR1eG9uLmRldj4NCj4gPj4+PiBTZW50OiAwOCBO
b3ZlbWJlciAyMDI0IDEwOjUwDQo+ID4+Pj4gU3ViamVjdDogW1BBVENIIHYyIDI0LzI1XSBhcm02
NDogZHRzOiByZW5lc2FzOiByemczcy1zbWFyYzogRW5hYmxlDQo+ID4+Pj4gU1NJMw0KPiA+Pj4+
DQo+ID4+Pj4gRnJvbTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVz
YXMuY29tPg0KPiA+Pj4+DQo+ID4+Pj4gRW5hYmxlIFNTSTMuDQo+ID4+Pj4NCj4gPj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWEudWpAYnAucmVuZXNhcy5j
b20+DQo+ID4+Pj4gLS0tDQo+ID4+Pj4NCj4gPj4+PiBDaGFuZ2VzIGluIHYyOg0KPiA+Pj4+IC0g
bm9uZQ0KPiA+Pj4+DQo+ID4+Pj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemczcy1z
bWFyYy5kdHNpIHwgMjYNCj4gPj4+PiArKysrKysrKysrKysrKysrKysrKw0KPiA+Pj4+ICAxIGZp
bGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQ0KPiA+Pj4+DQo+ID4+Pj4gZGlmZiAtLWdpdCBh
L2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemczcy1zbWFyYy5kdHNpDQo+ID4+Pj4gYi9h
cmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpnM3MtDQo+ID4+Pj4gc21hcmMuZHRzaQ0KPiA+
Pj4+IGluZGV4IDRhYTk5ODE0YjgwOC4uNmRkNDM5ZTY4YmQ0IDEwMDY0NA0KPiA+Pj4+IC0tLSBh
L2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemczcy1zbWFyYy5kdHNpDQo+ID4+Pj4gKysr
IGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3J6ZzNzLXNtYXJjLmR0c2kNCj4gPj4+PiBA
QCAtNjQsNiArNjQsMTEgQEAgdmNjcV9zZGhpMTogcmVndWxhdG9yLXZjY3Etc2RoaTEgew0KPiA+
Pj4+ICAJfTsNCj4gPj4+PiAgfTsNCj4gPj4+Pg0KPiA+Pj4NCj4gPj4+ICZhdWRpb19jbGsxIHsN
Cj4gPj4+ICAgICAgICBhc3NpZ25lZC1jbG9ja3MgPSA8JnZlcnNhMyB4eD47DQo+ID4+PiAgICAg
ICAgY2xvY2stZnJlcXVlbmN5ID0gPDExMjg5NjAwPjsgfTsNCj4gPj4NCj4gPj4gYXVkaW9fY2xr
MSBub2RlIGlzIGluIHRoZSBSWi9HM1MgZHRzaSB0byBrZWVwIHRoZSBjb21waWxhdGlvbiBoYXBw
eS4NCj4gPj4NCj4gPj4gRm9yIHRoaXMgYm9hcmQgdGhlIGF1ZGlvIGNsb2NrMSBmb3IgdGhlIFNT
SSAzIGlzIGZyb20gPCZ2ZXJzYTMgMj4uDQo+ID4+DQo+ID4+IElmIHdlIGZpbGwgaW4gdGhlIGF1
ZGlvX2NsazEgaGVyZSBpdCB3aWxsIGJlIHVzZWxlc3MsIHRoZXJlIHdpbGwgYmUNCj4gPj4gbm8g
Y29uc3VtZXJzIGZvciBpdCBhbmQgaXQgaXMgbm90IGF2YWlsYWJsZSBvbiBib2FyZC4NCj4gPg0K
PiA+IEFzIHBlciBTU0kgSVAgbmVlZHMgZXh0ZXJuYWwgY2xrcyBBVURJT19DTEsxIGFuZCBBVURJ
T19DTEsyLg0KPiA+DQo+ID4gQVVESU9fQ0xLMSBpcyBwcm92aWRlZCBieSB2ZXJzYTMgZ2VuZXJh
dG9yIGFuZA0KPiA+IEFVRElPX0NMSzIgaXMgcHJvdmlkZWQgYnkgQ3J5c3RhbC4NCj4gPg0KPiA+
IEN1cnJlbnRseSBBVURJT19DTEsyIGl0IHJlcG9ydHMgYSBmcmVxdWVuY3kgb2YgMTIyODgwMDAg
d2hpY2ggaXMgYQ0KPiA+IG11bHRpcGxlIG9mIDQ4a0h6IHdoZXJlYXMgZm9yIEFVRElPX0NMSzEs
IGl0IHJlcG9ydHMgYSBmcmVxdWVuY3kgb2YgMC4NCj4gDQo+IFdoeT8gWW91IG1lbnRpb25lZCBh
Ym92ZSB0aGF0ICJBVURJT19DTEsxIGlzIHByb3ZpZGVkIGJ5IHZlcnNhMyBnZW5lcmF0b3IiLg0K
DQpPdXRwdXQgZnJvbSB2ZXJzYTMgZ2VuZXJhdG9yIGlzIGNvbm5lY3RvciB0byBBVURJT19DTEsx
IHBpbiB0aGF0IHlvdSBkZXNjcmliZWQgaW4NClNvQyBkdHNpIG5vZGUgd2l0aCB0aGUgZW50cmll
cw0KDQorCWF1ZGlvX2NsazE6IGF1ZGlvLWNsazEgew0KKwkJY29tcGF0aWJsZSA9ICJmaXhlZC1j
bG9jayI7DQorCQkjY2xvY2stY2VsbHMgPSA8MD47DQorCQkvKiBUaGlzIHZhbHVlIG11c3QgYmUg
b3ZlcnJpZGRlbiBieSBib2FyZHMgdGhhdCBwcm92aWRlIGl0LiAqLw0KKwkJY2xvY2stZnJlcXVl
bmN5ID0gPDA+Ow0KKwkJc3RhdHVzID0gImRpc2FibGVkIjsNCisJfTsNCg0KVGhpcyBuZWVkcyB0
byBiZSBvdmVycmlkZGVuIGJ5IGJvYXJkIGR0cywgd2hlcmUgdmVyc2EzIGlzIHByb3ZpZGluZyB0
aGlzIGNsay4NCkN1cnJlbnRseSB0aGVyZSBpcyBubyByZWxhdGlvbiBiZXR3ZWVuIHRoaXMgU29D
IGRldmljZSBub2RlIGFuZCB2ZXJzYTMgY2xrIG91dHB1dCBmb3IgYXVkaW8gY2xrMS4NCg0KQ2hl
ZXJzLA0KQmlqdQ0KDQo=

