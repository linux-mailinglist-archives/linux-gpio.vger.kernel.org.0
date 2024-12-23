Return-Path: <linux-gpio+bounces-14180-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0CB9FB6A4
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Dec 2024 23:01:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A4061664EA
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Dec 2024 22:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D4C518FC89;
	Mon, 23 Dec 2024 22:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="nsI6NfLa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from USG02-BN3-obe.outbound.protection.office365.us (mail-bn3usg02on0047.outbound.protection.office365.us [23.103.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0302464A
	for <linux-gpio@vger.kernel.org>; Mon, 23 Dec 2024 22:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=23.103.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734991263; cv=fail; b=V1vRl/TSodUq+W6JN8NNE4MBxrc7Mw9GAfhmJn9iqPm6TPtM5Q0Wh85ip0jYMmshp4T9Ocydvc5XxMWbF+WzPwEJsDCYDB8BvsxK9GA+D7+judQca0nnNtFV99U7lWvrWaQBCG+mUS81ste8/b+ejZOPKQiI68hKwYjx9hKSOt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734991263; c=relaxed/simple;
	bh=op8Np0HK2aUKMHAk6JGE5rYdkI1Fy1ic59vg8N8f26Y=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ka/65dO4nbBMa7MM0Ig3a7nDY6Tm/grie5MTSIbJb+deW6rxBJBB+SXmC2PTW4QZQ6rb++3+iYbLYhdhJfgKK94L5VDi9BuPlpUXCN9qN/V34r+SHtzcDsano8AFDdAb38+I/TUXE2Sw9nMA36Fr30QcBnQaXLIfWguL+O9+6/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=nsI6NfLa; arc=fail smtp.client-ip=23.103.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=YIHPCkM9j/pqmVWj76njTFqtNcWARiG1HXUhvNAoXBdrlJ4SU4CxF9XnpkcbjI9JxTPPLds4t4PU3KZKcXEDKxQ0SWJoyRkWgRBxhySs8dkdfTqda0pajXuc8bP64BEYMtdW6dsgwvoj65XkE9Zt8TrD0GReZfSL+vUJvAIRr3T5Rwf8RMAQvnSw45JX6QQX+6IpK/04kvj1gvwvNGVqj+Qqba0havc0nHbJEKfjczkNRWTtAUDX1WYkLPqYe1vr7EDHj/loDOV6tO7LwKwchnHM8n/WGt2S4VKU82aayClsLke+xYcsUZ1s20YeFKj/st3sEUOMAoiEmABWUPfGKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=op8Np0HK2aUKMHAk6JGE5rYdkI1Fy1ic59vg8N8f26Y=;
 b=EJ76fBtpb2V9itwhNoNdsbHFBnb8DsxC59C9vsY/qr7sh4Ajua6w/43Re/Ai0Op7o6OMsEHoKpWCZYALmsezGpKM5ujzSLt5BVI9oceV+JzMiZZvE+FVOoLhZB8Jl0vsV3A94VdAoU1xOGV1WRGv4Sm+Vu38qjz5BxOri0V1be8yjlIhrs5P1S5EhlyhO+D28qbS7De0AzzP/EyLTtXmoS2oZoXTjI4ugHU8BbpYnR9h1NhoteqBdq714TCOjqrR99ZEa5DQxZd87bCYTDXgCqKFctGm8hZL8bxATMB/yuMXoVHXe2Cr1bVhaLNX3DJjYI9cEcC9htYBTg4UWxv6gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=op8Np0HK2aUKMHAk6JGE5rYdkI1Fy1ic59vg8N8f26Y=;
 b=nsI6NfLaP+aeQIu/CcDvwWAHq1gQluyYV/haxno5LUX/zCvM9NF4Bq0TcBXAELci34MfsQYuK3MKcA+vXlTJOzHtUx05kldCDobZX8EScRkL2XOnVsuQADo1lSTrDZfKFdQYzFlV3kuwaVHTrenIoF8t9fe6K6H5NfQoQKSl6KdHn7HaKqMVuTaftI9S9jH/hFAOLpNUX6HqDD77oIAz8thqSWuBKmliYxGBu/W7lU+NC4He0EktGj18bJIc/EoBiExfLpyuezFBG1tYUz7W/fOnK/inCmG0dzIk5F43EvRHqUkjDGmMT/N6EOClF9VbWYynfScIRjI+MD24yNaYKw==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1727.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:177::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Mon, 23 Dec
 2024 14:28:13 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%4]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 14:28:13 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>, Erik Schilling
	<erik.schilling@linaro.org>, Phil Howard <phil@gadgetoid.com>, Viresh Kumar
	<viresh.kumar@linaro.org>
CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH libgpiod v2 0/5] doc: improvements for ReadTheDocs
Thread-Topic: [PATCH libgpiod v2 0/5] doc: improvements for ReadTheDocs
Thread-Index: AdtVQSWBC1YacUrcQ1qh0z79JMbGbg==
Date: Mon, 23 Dec 2024 14:28:13 +0000
Message-ID:
 <PH1P110MB1603C49CC0A3B2E9CA3C91959F02A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1727:EE_
x-ms-office365-filtering-correlation-id: 6a286a1e-d54e-47c8-39dc-08dd235e08c9
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|41320700013|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OC9paCthclJtZk9wcEpueXhmbjhyQ0tnQlZUT2VIdXRQZ3J6Q0c2RU0vK3FI?=
 =?utf-8?B?TSt2Qkc0TmFVeE9TdFUxcENoR1piRUlVR214T2ljcGk4V0M3Q2pUYnJFT09L?=
 =?utf-8?B?dm5kRjF6ck1mVXA0RjlySzRaUHo1N0RBUkhmeGgzbmE0VzBQRXIyeERybEZr?=
 =?utf-8?B?aXBTS0NXM2F2VUJzc1VPcy9VMHJBdTdCZk8rWEI1VjVLY29vUzVWMnN0Y21B?=
 =?utf-8?B?R3pTV3JFdnd5R2pqSCtteFlObkNkZUovemJ4UkhNdW0wK1pwcHNwZEJQcEpr?=
 =?utf-8?B?ZGcvclY0aW8wUEM1TWU1bkRod0pZRU9UMG1KZ0JxRG5WUVNVd3BMaWFqN0Zj?=
 =?utf-8?B?d3h5U3Z6UW5VUy93ZVlRckE4UnFVL0tzRlVrL2VWSExqQ0FJOHVpSDFLTGxq?=
 =?utf-8?B?YTdwT0ljNlhGb1IwQmxWWGZ0cVNUenhaLzRRTDhkZk0xK3loYjdXNEZDK1hH?=
 =?utf-8?B?MDk4ZTI3V3hzZytvbTN0dDJNSDU4ZnhsTmtDRi9xOGxwNkp3ZHRjTHNDdUJR?=
 =?utf-8?B?RXp2V0JETkUzU0pqSXJQMUhWa1RzVU8wK3FNb1B4ZzFoN0ZKTFk3b1FxZW8v?=
 =?utf-8?B?YWlmV081ZHBWZTUzZ21SVmZneEJPdFJ5TVZFTmVFTXhqc3JBa3Q2NEhiNVBJ?=
 =?utf-8?B?V0tkL3dVUE9oYjlzUDZQMzFOQkFXZ2hQdWZuT3VZU29KMUVmWWh6OHVybjk5?=
 =?utf-8?B?Y3hkWUdiL3dSQ3hjQ0g3bXp2K3BOckFmNVA4dStVcE90VUVUVmtGczhsYVo4?=
 =?utf-8?B?eFMwUFpLNHRaemoxTDlRdXdIMHJSd0h6NnJkakI5aSsyN2pOVEoySWVJUEND?=
 =?utf-8?B?UHZWcmxyc1gwT0NWaUpuQ1N2c0tOL3hodnZsOGdielR0NDNtdDlROHE5Wjlw?=
 =?utf-8?B?d3ZCWjN6Umo1bTNrSVZlUTFLZG1Md010cFdaZllXRVFwc002cnI3VUJ5TCtS?=
 =?utf-8?B?TmM4V0pRLzh5U0F2VFB6YitncGhCSHVyTEdoVnY0ZlBYWU1kSkVWNWtNckND?=
 =?utf-8?B?RVR1SVluZFJuWW5ib1ljQ0daL3hxbi82bXlnblZGVmFMRUVFaVh6aVIyelpO?=
 =?utf-8?B?MWdDMFpuSUw0SC9WQTJENXRYMkN2aUJVdGFNSVVQMS9BcnltUHJqRU9pRzJv?=
 =?utf-8?B?eldiMm13VDR1Q2dBQ29NVkhRUmJ3K3dRNjJMRDgrUmg1cGZPWG9KdDVDM0Ix?=
 =?utf-8?B?RnQ4SXdFM05GcG9mdERLdHZudVg4M3NZckRmTWxDdEVvN003c0JjTGw3ZU4w?=
 =?utf-8?B?QjNlR3FRWUJGaU9xWWVtWDhvWVlDd1hIa0Fqa01ZT3FPdXAyc1Yza0JnMlND?=
 =?utf-8?B?RVNNaUxIZDZPME5IRjhSK0I2VHVhRVJwMnZsUENpSjFmSGx5TDFuenFJRTRE?=
 =?utf-8?B?aThWN1NiUXRnZWVTZVovbkdOU1BqbFdvcTcyZnhFMjB1ZjlJSWVTZy9tcnQ1?=
 =?utf-8?B?U1hHUHJBOSt6Q1lpZVJoOTIvVXNNakhVNWE4aUdiVjNMODFldUh6M1oyaDZv?=
 =?utf-8?B?WEVwcVdjcEEvVmc1VGxKM1o2dTRBRmdiTE56b0JGYkduWDVKZHNwNU9GeXQw?=
 =?utf-8?B?Nm1pMlVieEl5dnF2MWRRZGsvdStZY21zdmFRWkMxbHNBcXZkNEJ4ZVpzZ0JM?=
 =?utf-8?B?Vk55UFY4cHgyd0dMTE9jTFJ4bUoxTVdQWFpXK3RrM2lmRzM3M05mdzRoTCtQ?=
 =?utf-8?B?eWRXNC9NayszcWtmRm8rWWo4dm12NDIySjR1eHVKQngrazFQZlZUUjh0NnhN?=
 =?utf-8?B?OE1hVGV6QmxKK1RDam1DZVF2ZkpLVkR0M0RVREdQOFVpUnp1L2hSdFlOck80?=
 =?utf-8?B?TGtqd2U1K2tDWVRHc0ttTnVobzZvSlpzcUJMRGd6REQvOTUrK0w0Q2hncE1T?=
 =?utf-8?Q?9oP+L0BEItH5f?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(41320700013)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aW9EbnZhb2RQUGVacjlmRUJYY2hBRW9NeDl1M3lhRnpmTzJzd2VXekRiSTZE?=
 =?utf-8?B?bzYvOVdGRzVGQU80ODZiVGxySjhmNG42VnZDakMvdWFVTFp3bnNwYURWL2Ra?=
 =?utf-8?B?cmkvNTRIeDkzYkdkVC9CMEVvcENuSDc1KzdUaEVQRnFVc1NlVisvUHl3TkdK?=
 =?utf-8?B?K3VvekFoaGswdDV0ZWJpbXByT1hHU21MTXd4WXBMK1dLU211amZPcG1NcEZs?=
 =?utf-8?B?R1Z6RG1kUU53c0lhb1g5MVB1ZGZUSlZ3MTBwbzlIZXBQejNGZGJGYjFWdlNB?=
 =?utf-8?B?SDA5eDQ5YWxydkI2b3dUanIxSEtmWlcycjNuSzcxREJNL1p4TmlDSWdUYzhY?=
 =?utf-8?B?YmlSeUh3QXYzWHJVZmc5aE5uNFpPd0NSUUQrMmVCaGFtRUZHRGVSRFVCWXNz?=
 =?utf-8?B?R2RyT0drQzg5MHMyL3gvZVQzRDMwQ3Y5M2xVaktWbmpISDdubmtDNWtFV3FV?=
 =?utf-8?B?TEtFQ2QwMmMwZ29UZDN0TUNlNXR5THlxdXRYeDdEYWQ2L3VvWTFtbWFKamRO?=
 =?utf-8?B?ZlkzQVJ1dlNhSjdoNzRxVHcvYjZPYVM5L1FQcmJYKytkUTdBdHNrT09EZTN3?=
 =?utf-8?B?azA4OEszVTc3Q2ZUdW45ZjYwZkZDbW44bzhYc1M5clY4aFVKSk9aemt0dHI1?=
 =?utf-8?B?NStDL1h5WUJYcjJSa1lQWmRJamZzdnBjMGJ3NWhHUGpsc1JvRzEzbkpSeTBS?=
 =?utf-8?B?V3ZKdFFCWjdsYmdJR1Rlem94eFczR1pDRHRuNmpiQW90SEcreFVWaS9qamg5?=
 =?utf-8?B?ZzZINjdiaHM1dkxMc1JMRHFnUkphT2NWSWtaQ3pDNzc5YjZvcWlocStnbjRz?=
 =?utf-8?B?VmFVdjkrQU1MRDlKSDNHQUhXRDRodmxidHk1NEp5bnhTMHRaaWcwYXhUYkRt?=
 =?utf-8?B?YXBjUjB1Z0hod3Q3UThFbGlTYUE2K2hYSTVML0l6VEdSZTE0aVA4U0x4OFpV?=
 =?utf-8?B?VVVXaHVyTWxkQlRIMXlNSUhDR25rNmxiclI0c2dmMEJjSUNnR0ZZUUlJTTFS?=
 =?utf-8?B?eGlBMXozeDdqWDU3cXFiNm1Ka041dXAvY1R4TWhVTGFuOEY3cUVuRHpNZFQ3?=
 =?utf-8?B?dnVCUlV5TUU5N2hySk5yNXltbUdkOENtbjQvaUhEcmhNblNqRkVaWmxrMGI1?=
 =?utf-8?B?UnhhcEpzUE1aeVlXS0RXQVRuZUVqZkc2VUNNKytwb0VueUtzMldGY0dNSXJy?=
 =?utf-8?B?eVA2OUVMaDBxWG1IYmZha1V5RHFxUXg0SnYvV3k4MVowS3NHbnVHUlFIcS83?=
 =?utf-8?B?MTJoblZJY2lEc0Z3RVptTXMxa21ZcGZkbkN3WEI2OWlpN1QvZWkvNnBmcmsy?=
 =?utf-8?B?SkhieFplYnBLYVBPRXFlZTZjdkNZODB1S0l2dFpMNGd0RldrNnN0bklYRW1X?=
 =?utf-8?B?M1ZBNVdqMXpZckpGa0VzSXJFcW1qSStEWHFCUW5zYjVPMGtXS2FjWnRYV2Ey?=
 =?utf-8?B?bC84TU9JeXpwZHZwc1Y0TmpuL0ptYlZ4UGh3QU9ZRklTR2hjZVdSTkZWc25X?=
 =?utf-8?B?RlZIVXpmTVltRFhzbVF6a2pERUVYaWI2Qzc4b1VjNEd6UjBDZHVYbVNnTUZl?=
 =?utf-8?B?R3VRclk1RmRvOGNVeWVLZzlsejJPbXd0eHZrQnlZdlM0NFZSNGVlTjhJd1c4?=
 =?utf-8?B?YVM1YnFRYnFDMVplOUlSN25iZHVVWjJzdkhucEh5ZkphUk5FT09RRXltb2F6?=
 =?utf-8?B?NDVwS3JSMmwwa0JzeC9iMGkrYkFaOGZSK0pqeXZCK1UxSktkY2Z0dDlsWEIy?=
 =?utf-8?B?YjBidjlVdzVJT1VKNi9vRUFnVFFBS2J3Njl2TU5TU2loV3FyaHBmMGtBWlZq?=
 =?utf-8?B?YUoyT2hmNU05KzVMbDNMWko3ZStRcXBZQlR6TXZRcWpTT1dOSWZJTkF2dTVo?=
 =?utf-8?B?WnFINUNKb1MyaUZHNXVRd2JpS25VSXpNTlNZTEN3dVlTaWIwazMwamVFdENo?=
 =?utf-8?B?NlRCUlFGVDVVWHN0UjJ0NE55RktudkI4bmIxUDNXVXlITnhTVnExUUNEdlBz?=
 =?utf-8?Q?9XBOB2m5tgOTQVTHneezIkxKlgjL1o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a286a1e-d54e-47c8-39dc-08dd235e08c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2024 14:28:13.7489
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1727

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmFydG9zeiBHb2xhc3pl
d3NraSA8YnJnbEBiZ2Rldi5wbD4NCj4gU2VudDogU3VuZGF5LCBEZWNlbWJlciAyMiwgMjAyNCAy
OjA4IFBNDQo+IFRvOiBWaW5jZW50IEZhemlvIDx2ZmF6aW9AeGVzLWluYy5jb20+OyBLZW50IEdp
YnNvbg0KPiA8d2FydGhvZzYxOEBnbWFpbC5jb20+OyBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxs
ZWlqQGxpbmFyby5vcmc+OyBFcmlrDQo+IFNjaGlsbGluZyA8ZXJpay5zY2hpbGxpbmdAbGluYXJv
Lm9yZz47IFBoaWwgSG93YXJkIDxwaGlsQGdhZGdldG9pZC5jb20+Ow0KPiBWaXJlc2ggS3VtYXIg
PHZpcmVzaC5rdW1hckBsaW5hcm8ub3JnPg0KPiBDYzogQmFydG9zeiBHb2xhc3pld3NraSA8YmFy
dG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPjsgbGludXgtDQo+IGdwaW9Admdlci5rZXJuZWwu
b3JnDQo+IFN1YmplY3Q6IFtFeHRlcm5hbF0gLSBbUEFUQ0ggbGliZ3Bpb2QgdjIgMC81XSBkb2M6
IGltcHJvdmVtZW50cyBmb3INCj4gUmVhZFRoZURvY3MNCj4gDQo+IE9uZSB0aGluZyB0aGF0IHRo
aXMgcHJvamVjdCBpcyBtaXNzaW5nIGlzIG5pY2VseSBsb29raW5nLCBhY2Nlc3NpYmxlIGFuZA0K
PiBhdXRvbWF0aWNhbGx5IHVwZGF0ZWQgZG9jdW1lbnRhdGlvbi4gSSdkIGxpa2UgdG8gZmluYWxs
eSBhZGRyZXNzIGl0IGFuZCByZXBsYWNlDQo+IG91ciBzdGF0aWMgZG94eWdlbiBwYWdlcyB3aXRo
IHNwaGlueCBkb2NzLg0KPiANCj4gSSBzcGVudCBzb21lIHRpbWUgcGxheWluZyB3aXRoIHNwaGlu
eCwgZG94eWdlbiwgYnJlYXRoZSBhbmQgZXhoYWxlLiBJdCB0dXJuZWQNCj4gb3V0IHRoYXQgZXho
YWxlIGRvZXNuJ3Qgc3VwcG9ydCBkb3h5Z2VuIGdyb3VwcyBhbmQgSSByZWFsbHkgd2FudCB0byBo
YXZlDQo+IHRoZW0gZm9yIHRoZSBjb3JlIEMgQVBJIHRvIGF2b2lkIGhhdmluZyB0byBtYW51YWxs
eSBhc3NpZ24gZWFjaCBmdW5jdGlvbiB0byBhDQo+IHNwZWNpZmljIG1vZHVsZS4gVGhhdCBtZWFu
cyB3ZSBtdXN0IHVzZSBicmVhdGhlIG9uIGl0cyBvd24gdG8gaW50ZWdyYXRlIG91cg0KPiBleGlz
dGluZyBkb3h5Z2VuIGRvY3Mgd2l0aCAucnN0Lg0KPiANCj4gRmlyc3QgZm91ciBwYXRjaGVzIGlu
IHRoaXMgc2VyaWVzIGFkZHJlc3Mgc29tZSBpc3N1ZXMgd2l0aCBDKysgYW5kIHB5dGhvbiBkb2Nz
DQo+IHRoYXQgYmVjYW1lIGFwcGFyZW50IHdoZW4gSSBzdGFydGVkIGludGVncmF0aW5nIHNwaGlu
eC4NCj4gDQo+IFRoZSBmaW5hbCBwYXRjaCBjb250YWlucyBhbGwgdGhlIHN0dWZmIHNwaGlueCBu
ZWVkcyB0byBidWlsZCB1cyBhIG5pY2Ugd2Vic2l0ZS4gSWYNCj4gdGhlIFJURCB0aGVtZSBpcyBh
dmFpbGFibGUsIHRoZW4gd2UncmUgdXNpbmcgaXQsIG90aGVyd2lzZSBsZXQncyBmYWxsIGJhY2sg
dG8gdGhlDQo+IGRlZmF1bHQgdGhlbWUuDQo+IA0KPiBFdmVudHVhbGx5IEknZCBsaWtlIHRvIGV4
dGVuZCB0aGUgZG9jdW1lbnRhdGlvbiB3aXRoIGV4YW1wbGVzLCBkZXNjcmlwdGlvbnMgb2YNCj4g
Z3Bpby10b29scyBhbmQgREJ1cyBBUEkgZXRjLiBidXQgZmlyc3QgbGV0J3MgYWdyZWUgdGhpcyBp
cyB0aGUgd2F5IGZvcndhcmQuIEZvcg0KPiBub3csIHRoZSBkb2NzIGRlc2NyaWJlIGxpYmdwaW9k
LCBsaWJncGlvZGN4eCBhbmQgcHl0aG9uIEFQSXMuDQo+IA0KPiBJIGFsbG93ZWQgbXlzZWxmIHRv
IHB1Ymxpc2ggdGhpcyBicmFuY2ggb24gUlREIGZvciB0ZXN0aW5nIHB1cnBvc2VzLg0KDQoNCklz
IHRoaXMgaHR0cHM6Ly9saWJncGlvZC5yZWFkdGhlZG9jcy5pby9lbi9sYXRlc3QvID8NCg0KVGhl
c2UgbG9vayByZWFsbHkgZ29vZCENCg0KVGhlcmUgYXJlIG9ubHkgYSBmZXcgdGhpbmdzIHRoYXQg
c3RhbmQgb3V0LCBidXQgSSBoYXZlIHByYWN0aWNhbGx5IHplcm8gZXhwZXJpZW5jZSB3aXRoIHNw
aGlueCwgc28gZG9uJ3Qga25vdyBpZiB0aGVzZSBjYW4gYmUgYWRkcmVzc2VkIG9yIG5vdDoNCg0K
KiBDbGFzcyBfX2luaXRfXyBmdW5jdGlvbnMgYXJlIHJlc29sdmluZyBFbnVtcyBiYWNrIHRvIHRo
ZSBiYXNlIGBfZXh0YCB2YWx1ZXMgYW5kIEkgZG9uJ3QgdGhpbmsgd2Ugd2FudCB0byBwdWJsaWNs
eSByZWZlcmVuY2UgdGhhdCBwcml2YXRlIG1vZHVsZSAoc2VlIExpbmVTZXR0aW5ncykuDQoNCiog
RW51bSBfX2luaXRfXyBmdW5jdGlvbiBzaWduYXR1cmVzIGxvb2sgcmF3LiBJIHN1cHBvc2UgSSB3
YXMgZXhwZWN0aW5nIHNvbWV0aGluZyBsaWtlIGh0dHBzOi8vd2Vic29ja2V0cy5yZWFkdGhlZG9j
cy5pby9lbi9zdGFibGUvcmVmZXJlbmNlL3NhbnNpby9jb21tb24uaHRtbCN3ZWJzb2NrZXRzLnBy
b3RvY29sLlN0YXRlIGJ1dCBtYXliZSB0aGF0J3MgYmVjYXVzZSB3ZSBkb24ndCB1c2UgYEludEVu
dW1gPw0KDQoqIFdlJ3JlIGRvY3VtZW50aW5nIHRoZSBgTGluZVJlcXVlc3RgIGNvbnN0cnVjdG9y
LiBJZGVhbGx5IHVzZXJzIGRvbid0IG1hbnVhbGx5IGNvbnN0cnVjdCBgTGluZVJlcXVlc3RgIG9i
amVjdHMuIFRoZSBfX2luaXRfXyBkb2NzdHJpbmcgc2F5cyAiRE9OJ1QgVVNFIiBmb3IgdGhpcyBy
ZWFzb24gYnV0IHRoZSBjbGFzcydzIGRvY3N0cmluZyBpcyBiZWluZyB1c2VkIGluIHRoZSBnZW5l
cmF0ZWQgZG9jcyBhbmQgZG9lcyBub3QgaGF2ZSB0aGlzIHdhcm5pbmcuDQoNCiogSXMgdGhlcmUg
YSB3YXkgdG8gZ2VuZXJhdGUgbGlua3MgdG8gdGhlIHNvdXJjZSBjb2RlIGZvciB0aGUgY2xhc3Nl
cy9tZXRob2RzICh0aGUgd2Vic29ja2V0cyBkb2NzIGRvIHRoaXMpPw0KDQpOb25lIG9mIHRoZXNl
IGFyZSBodWdlIGlzc3VlcyBhbmQgY2FuIGJlIHdvcmtlZCBvdXQgaW4gc3Vic2VxdWVudCBwYXRj
aGVzIElNTy4NCg0KLVZpbmNlbnQNCg==

