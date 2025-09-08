Return-Path: <linux-gpio+bounces-25749-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9600FB4912D
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 16:21:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 350383C4CAE
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 14:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E42AC30BBA5;
	Mon,  8 Sep 2025 14:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="aztpUuXi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011062.outbound.protection.outlook.com [52.101.125.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489B02FFDC1;
	Mon,  8 Sep 2025 14:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757341247; cv=fail; b=XYq4stz3UUqUfXhIjYV/mT9doWsXPmPpt6SE5YztMIs+tTWgN85aQjmb8Up41/h8vZL5+GiupQC9bjgV1RL6x1YnULqm1anY6b3vQ0CYS4GKM8eAnCvqgxkXVh+URS+L9kDgEBmY41a8Z+TnCjy99tg+D2DLHR2KEnbWuF4Op0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757341247; c=relaxed/simple;
	bh=AV2DO0oZjB55GqDPDEX6uvSdY0o/Wkh2pRXRbQlmKbw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ijgEdiSkDV3oOQTIzIbtgY8soF9+o/kWBncpJubjvfQFDwJXhYcAACOHx83pZNNifR2GthgKo1OmfNBBZR0JaFecD0Sql/W0lsp/qxLLxtfWyzvTqGPTjoPdV56ZFBV7z01RCtU+JrqcgA/ZpoXD46ikWThM9p0vTJg+onfVBCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=aztpUuXi; arc=fail smtp.client-ip=52.101.125.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AvRlNWu1uPoWG4HZLL5zX3MvtlAYnOfdAs5Qcu8wKiC0cElJOxn0dru9ECepo5h8JoBI/bjQbRqBk8+tPTqOWWpa9HKWjg4IbdNedN9q4qnWRHhFJEkfYssj/6us0Zv6CKFrV2jQ0Fh0a8vJROkMg3+eeqen1vYjSYf8QVnzCZ+gPKcHD9TplbTwmtB4u7l3YsC5b4bJYw9k8vrnZN7rnH/+i6dxt4NObpyzAOArgLhWLPrRa7DNHd13q/IUyzannJy/YFvEaYyEQ3vCFimqkdUB8oNkpdwiCTlQV6GwJS6CMPWCZd07dj2FMGL0hiADn3RhYITDB5DchEeH0SFEoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AV2DO0oZjB55GqDPDEX6uvSdY0o/Wkh2pRXRbQlmKbw=;
 b=r+8tG6V97yFk0hPei4RT3T0h5Xs4WZ2D3PqQkc/0w+yIjI+KgINGw+E7Z2JWwaNGMhWQgTEDoNdU/Ur5l5kvMUichdKpPhItp43Z20sAxXXsXWSE4z4y7K+jvIY3bRBouEynQXpT3MSkBfP0Vz3CJVG9RUBUVJA1I8YjLMHtFGqL0oTBaOizMLGYAMJ8xHUMHjR48MTCzqI2FWCcvZM6sxLedv3VIERLWMmER0HsKxqcNK0UwN/20RQHRnKpnIqronuTCuOQ/rt9OA4x0fSJzzCI+BfdY0OwHt49x17sviUAX4fuujnXUJ8qycBOIynlc/AN1PPouT9fIu4Dpsxm0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AV2DO0oZjB55GqDPDEX6uvSdY0o/Wkh2pRXRbQlmKbw=;
 b=aztpUuXie/0W+c2T34O7qne1pW8gTfPGE1xV74rcdRNhIFipRWsGGTmHa1vji5DvKUkLfbm2svFNGvvhidJS3hpuBHSKx4Ai6Ufz/rbtZ/1uaGVoxnbqM68Q6O3EoDOZUENA0VaTkY8bVlKXNP+pYk0yxwsq/kRZT0ATU+w/GzE=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB15173.jpnprd01.prod.outlook.com (2603:1096:405:27b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 8 Sep
 2025 14:20:38 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 14:20:38 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Linus Walleij <linus.walleij@linaro.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] pinctrl: renesas: rzg2l: Drop the unnecessary pin
 configurations
Thread-Topic: [PATCH v2 2/2] pinctrl: renesas: rzg2l: Drop the unnecessary pin
 configurations
Thread-Index: AQHcHkvxEfhSU9Kr9EyQE0iJEZ8KCrSJWTrQ
Date: Mon, 8 Sep 2025 14:20:38 +0000
Message-ID:
 <TY3PR01MB11346A6C80A312D3A0E91331C860CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250817143024.165471-1-biju.das.jz@bp.renesas.com>
 <20250817143024.165471-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdVxQ_Mm0qNwDfBM=L7juHzkXsWAW=r-Ff1T5BtyMNP7mA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVxQ_Mm0qNwDfBM=L7juHzkXsWAW=r-Ff1T5BtyMNP7mA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB15173:EE_
x-ms-office365-filtering-correlation-id: aa6e0e08-92f3-4f06-d547-08ddeee2e2a3
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NW03MjJmN25IYUgyekVCY2w5Z01VZGJTT0l0Tk1IT3lvOVJ4a1N4ZGhlWThp?=
 =?utf-8?B?MlloMk8rUnNRTWlXMUhzc0g4a3E0L3ZGaTJXLzlrYWU2ak9Zb3dtT2xOZExQ?=
 =?utf-8?B?bHJaOVZpU2U2TDZjS092Rk5qbXlrdVVSOFAzYWExVFpRVkZVTDhZcnVUczRL?=
 =?utf-8?B?VlkzWkZyTXVwUWV1REZKRE5qVG5kaVRlbmY4V0hWMUVVK2h0cVFDVzc0NWhM?=
 =?utf-8?B?REc0ZHBZOEtpRmFGMHFpQlp5L0daaTRGZTFsYWNqSXBkL2J6bEZGdEZWUmZX?=
 =?utf-8?B?WENJU2ZveDdSOGEwRVpWd1FVQlJ4L3o2bzhoTHlYYUJFMnZHYkdtaENOQmFT?=
 =?utf-8?B?TWdwQTRnNnZpdkFQK25HNnMrNElBNU82QVBJZ0xQeW5HaGtSc3QyZU1LS2tw?=
 =?utf-8?B?MEpISEpjQVgzbWdkUlRqaFc4K3k1OUtpcDF5dC9TWTFiQWhMb1pDOFVUK1ZE?=
 =?utf-8?B?NWR1VGJoNXJzZFExZUJPdDB5YnNMOHRIcy9aaXlreU1PNzdyeTJacE5YdC93?=
 =?utf-8?B?Y0lKSzZmTk1iOWJDYTB3Z0hGNFhhKzEyMUZSazU2dzljUUF3TFVlOVVXQmI1?=
 =?utf-8?B?WklSejdYSkxlTTAwSllFSUgzQXFYZEdXMi9ZdUN1dHZINGpYdE9vUG9ycXBU?=
 =?utf-8?B?M2x2eUl1Z2NxNlpDOTRHSnZHMzhWU2QvYVhFd212N2FhVTdDVkNiRmhhUElk?=
 =?utf-8?B?RG14S1V6MzI1cGExbjBJNXEwWEFpdjRCZ1oxNTlzRXBJcDcxanVrZDVlWnVP?=
 =?utf-8?B?alFFRnIyd0FtRkhBQjAxaERjZm5RaVlGSzJNQkk4VFRFMGoyM0tkU04xdnIz?=
 =?utf-8?B?d2FmeXIxWWxNWlZWMitpMWlneWxFdjcxMWFndkgvODJxYzNmTlI2WU43YVMz?=
 =?utf-8?B?UGJrY1Z4aEZWY1J2SzlYTkVKcjhobTJoVkc3bzNFaXFkQzBTL2N3Mis3YVln?=
 =?utf-8?B?UHlmcGJVL3Z4TUFoQkFvTjBMb1ZFcXJHcjlVRlN5QURoWUp5N1h3N1N0UjFo?=
 =?utf-8?B?T2ZsTkhLVnBoRmI4aWRvT0pvVksrMnJLbUVMTGEvZmtTMjhSc05ieGRCZlRx?=
 =?utf-8?B?UE9kdWZmWUxyOEgxR2NBZXB1M0hlaHBsaDkxV2FPOXJLUUM0S2NFSWx6T0hn?=
 =?utf-8?B?YkY4UnJubFFxbjJoQWcwSHFxM1FSWlI3YnlvYTY4cTQrWEIzblg1MHR3U1lH?=
 =?utf-8?B?MmgxTjVMOVhkRmVraDNnR2IvR3ZjM0p0R2RuWmx0ZlVBMEl2VkNmb0I0cUZh?=
 =?utf-8?B?OXh0MmxxallvakZSdVFNOVZLWU56STc0V0M5OS9kQVkyM2JzK0JMaUZUNXVU?=
 =?utf-8?B?cW1HeVpYWVc5U0l4YmNzZ0NNYnJCZVFPeWNnb1VIUDdHVnQ5b3MzOENhajRG?=
 =?utf-8?B?QWw1RVlNT3BKWTd1OW45THFZaHJqQUIyQXg4ZndwNlp0UTZtVE9aODBFVVp3?=
 =?utf-8?B?eGphaDdzMm55WWFnQlVTdXZUeHZhaU9kKzZBcW1zS2t5QmJOV1dVVlBER3Rr?=
 =?utf-8?B?K2NNeC8yZWtXa0YvU3JCcXJjT1pwRlUvR3I0N0pQOGNMRWZtUkVTOVBibTVl?=
 =?utf-8?B?TVRzSWl1LzRPSE1CZXgzOStjVWlLRHJzVmhJZGZrMjVtYlVpUFdkV3ZTTXhF?=
 =?utf-8?B?RmlKMk54dlpaTG1qSEptWEI0QnlRYXZvaVBwOUhQVGZDV3JyUHF1K1pkZjIr?=
 =?utf-8?B?bjlEYTNYQVZXcHJoQ1lRaVFkdE9VeUI2RGQrMnVaWWtTQzFyOU1nbWxyZmY1?=
 =?utf-8?B?UG5sOFI5U3krNVdhcXQ3dXExeE53dER0eFVFZEVrclQrOGdrWWIyV3pNbDJj?=
 =?utf-8?B?K2E2MWRtcytXYjFoRHV1cXBiQ3d3VDlSNEljcGdqRFJEbWFBVlhtY1d3Mjdy?=
 =?utf-8?B?OFM4eTJGcVBLWStwOFBkUDc1Y01FbCtwek1JSXR1aCtjdWExcU9KL21ITy9O?=
 =?utf-8?B?VHZDY1praStJMnk0WmdNYVEvTEJoVGhNaGpWRGtMMXhrU2EyWmp6cm5HQ0VH?=
 =?utf-8?B?RTliSXBsanFnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZHlTSTQydXN5bzhUbjB6aUpITkVVNDhCbngwQlpyYWJrWENTS1BocVVzQlNu?=
 =?utf-8?B?THNyWEVPeGlteHZ0eFArRVFiK1dpYjRTZmFuWDJobklRNDFEaGpVdk5LOXRt?=
 =?utf-8?B?VDFyd29SYVZ2TFRDc1pqMDdWSDBVbElycnV3S29VVnF4N1Y4UDhPaEdENHN4?=
 =?utf-8?B?dXFwbjQ0LzJnbUluZm1uOEtleU8rU3I1VVhxZFBkVUk3NHZGdUNUL2VFQ2VP?=
 =?utf-8?B?MnQzcGZzSmpKcXVIN1czdVR2NkY1N0JJQjJ2eW1JR0NwaGlkZUsybVVQSjRO?=
 =?utf-8?B?a3doeDRGaWR1TEFkenRYdk5SZzhvWFlNdEd6RUFnd3dhdWxnN3BlY0V4WXlP?=
 =?utf-8?B?dTEvYXVZVGlEemFYZTg0V1hEZWNKeGFISi9xZXlZUUZUQ1lwVDhxVHJBa08x?=
 =?utf-8?B?UWJHbEpSdjRyTzJYU0ZMYUx2NEhiNG1OSENqNWdtVTFYY0I4SFBmQjViRDRh?=
 =?utf-8?B?WXM3OGFERUtobnAyRUtlM2QycTZBQUhiblcycnNuWVNRVzhqaFR3Q2FuZWl3?=
 =?utf-8?B?cWZzNXJHdkNHem9UTzJvTXY5K0Qwek9KMVMwMTZidzF2NXh0Z2lxay83eTdH?=
 =?utf-8?B?b2NGczc4Y2NkbEMxUTVRQnRjajg0TzdBUUFxNGxLSUpJVHVwNWxxQXVkNTFo?=
 =?utf-8?B?MnU1R1Znc3ZFMTcvWkh2RXhLamlqSkR2aDROdHY4UXZFa3hEYnpBQ2ZlOXJB?=
 =?utf-8?B?MFVzb293NFV1MzBmS3M5SzIwWG40RDUweXhJc0xCeFI5aGZzencxUTkyLzZt?=
 =?utf-8?B?ME9kd2dJSXZpNStrV1VRc1FCdEhXMlNJa1AwWXc3YmpnSk56eHBKQ01nMXV5?=
 =?utf-8?B?ZDgzT3hlMFpnajE4VHVKa3E2bktCWkcxZm4veG9XTTNleWJxdU5VK3NMemdF?=
 =?utf-8?B?SzNraFNFR3VqOU5MUUU4SlhrMVZJOWpOTEJzVGYrQ0J2VVVmaXZaRGEvZmRt?=
 =?utf-8?B?WlhPS2FMVng0R003UEpsRUt3Y21TZHNWcU81anViL1BIbFdKdzVFbmUwaFZC?=
 =?utf-8?B?eVFPM2FyZHRzcFk1ZE1wT1B4VWVHZk5rbEQxeHE3dTlzZTA3QjhYYmhpb3Iw?=
 =?utf-8?B?VklqUjljNzlFR2x3SmtweC9aUUlBc1Iyc2V1RjdTOTlyYVRnRmY1dXhVeVps?=
 =?utf-8?B?UFFFdFF0RmRSMHF1WnRQZ0gzeVY1V1hrMDAvaTBtYVFPOWlVRmZzUzF3ZHNh?=
 =?utf-8?B?alB2RnJQWG5jMWZwbCt3T1h0WGRXUElsNFFQcWFMa0dyYlJyNTRUQmZ4bXUy?=
 =?utf-8?B?R0F3SVArUlkvMkdUeWR4RzFvUWVjZnplWVdqZHAxQkRjd3F1b05YWVVqcTR5?=
 =?utf-8?B?RThUV2VUdXhFMFlDTmVLSFpWTHNIbE45d0pURXQxa21aQ1pTZ3ZlZHBOL2cv?=
 =?utf-8?B?MkI5RCtRVXFnS1FNclVRN2hPUkorZU5wZHdnK0JoT2JYRXArcDlmbkpDUDcr?=
 =?utf-8?B?bUlmV2NHZWRIS1NIdjVHd1VHRTdMcFEyWWdkdDdteC94UTdmanp0NzgyWXlH?=
 =?utf-8?B?RVRaVEtQQi9nWHBDMFk4Y2QxbnRhRzRnRlpGUzlwSDJtMGQ0ZXk4SWh6ZmlN?=
 =?utf-8?B?OHFZUXV2U3ErOGRrd3RPR2huZitPdit3TXRwWGZ6c0c3K2dwQ241NUd0T3VQ?=
 =?utf-8?B?UWtzYTBGM2NlYWw5Kzdia1AzSzdEeVZPQS9MRXNrcUpMcG1XNFhFM1NEWTRr?=
 =?utf-8?B?ajJYVkF4OW5WRDJHYm1qTG4rYUl3cENyU1BmQ1cxT1M2ZGdOZ2FTY2hYTEVM?=
 =?utf-8?B?cjhNRlhKZGZ1MEpIVFpwWUdPUWIzSE5DVFNPcXg1Q0o3NFcwYjBaYjJraEVZ?=
 =?utf-8?B?WGhBaFowL3BoTUVibUo0SXRBQ0pMTVRESm9WTHBsNGhncGJaOG5tUTN1QmVX?=
 =?utf-8?B?WDFuSERtVGRaak44Nk1tRW9KeDJHd3dTQ3BHM3Aya2drR25rZGw1THczdm9N?=
 =?utf-8?B?OTE3c2plQkQ2dlRrbmRUMWp1eFVIQlA2bGk0aDdaV3cxdHdjQ29OTFJTR1pE?=
 =?utf-8?B?ZG5OSjkwYU50SERsMTlVZjF2UW1sTW43WS9HeDUxNXBVVWdkYUphWVY1akpX?=
 =?utf-8?B?cjRWVzlaUjRVelNUN1Izb2s0SEVOemx3T3FYZlZpenZPZ0pBVHZEOHpVUjY4?=
 =?utf-8?B?R2k4TXpGVSs1Umx2bG1pOXNZVGtFYjF4ZWpwM2ZPeXErUlFveVJnejVDVUl5?=
 =?utf-8?B?U1E9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: aa6e0e08-92f3-4f06-d547-08ddeee2e2a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2025 14:20:38.8566
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gSULsJ0tYWZX/lGk/x1Fx8MmxY8hpZHJbtAFsuWixIla1t2woLPH3pwtI1NTY4MNi2zxTW9MdawWt9e6vqV4yYUZhJbrfborehOSMTnz8/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB15173

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDA1IFNlcHRlbWJlciAyMDI1IDExOjAwDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjIgMi8yXSBwaW5jdHJsOiByZW5lc2FzOiByemcybDogRHJvcCB0aGUgdW5uZWNlc3Nh
cnkgcGluIGNvbmZpZ3VyYXRpb25zDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gU3VuLCAxNyBB
dWcgMjAyNSBhdCAxNjozMCwgQmlqdSA8YmlqdS5kYXMuYXVAZ21haWwuY29tPiB3cm90ZToNCj4g
PiBGcm9tOiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiBU
aGVyZSBpcyBubyBuZWVkIHRvIHJlY29uZmlndXJlIHRoZSBwaW4gaWYgdGhlIHBpbidzIGNvbmZp
Z3VyYXRpb24NCj4gPiB2YWx1ZXMgYXJlIHNhbWUgYXMgdGhlIHJlc2V0IHZhbHVlcy4gRS5nLjog
UFMwIHBpbiBjb25maWd1cmF0aW9uIGZvcg0KPiA+IE5NSSBmdW5jdGlvbiBpcyBQTUMgPSAxIGFu
ZCBQRkMgPSAwIGFuZCBpcyBzYW1lIGFzIHRoYXQgb2YgcmVzZXQNCj4gPiB2YWx1ZXMuIEN1cnJl
bnRseSB0aGUgY29kZSBpcyBmaXJzdCBzZXR0aW5nIGl0IHRvIEdQSU8gSEktWiBzdGF0ZSBhbmQN
Cj4gPiB0aGVuIGFnYWluIHJlY29uZmlndXJpbmcgdG8gTk1JIGZ1bmN0aW9uIGxlYWRpbmcgdG8g
c3B1cmlvdXMgSVJRLiBEcm9wDQo+ID4gdGhlIHVubmVjZXNzYXJ5IHBpbiBjb25maWd1cmF0aW9u
cyBmcm9tIHRoZSBkcml2ZXIuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8Ymlq
dS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+
IA0KPiA+IC0tLSBhL2RyaXZlcnMvcGluY3RybC9yZW5lc2FzL3BpbmN0cmwtcnpnMmwuYw0KPiA+
ICsrKyBiL2RyaXZlcnMvcGluY3RybC9yZW5lc2FzL3BpbmN0cmwtcnpnMmwuYw0KPiA+IEBAIC01
MzksNyArNTM5LDExIEBAIHN0YXRpYyB2b2lkIHJ6ZzJsX3BpbmN0cmxfc2V0X3BmY19tb2RlKHN0
cnVjdCByemcybF9waW5jdHJsICpwY3RybCwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1OCBwaW4sIHU4IG9mZiwgdTggZnVuYykgIHsNCj4gPiAgICAgICAgIHVu
c2lnbmVkIGxvbmcgZmxhZ3M7DQo+ID4gLSAgICAgICB1MzIgcmVnOw0KPiA+ICsgICAgICAgdTMy
IHJlZywgcGZjOw0KPiA+ICsNCj4gPiArICAgICAgIHBmYyA9IHJlYWRsKHBjdHJsLT5iYXNlICsg
UEZDKG9mZikpOw0KPiANCj4gQXMgdGhlIHJlYWQgdmFsdWUgbWF5IGJlIHVzZWQgbGF0ZXIsIHNo
b3VsZG4ndCBpdCBiZSByZWFkIHdoaWxlIGhvbGRpbmcgdGhlIHNwaW5sb2NrIGJlbG93Pw0KDQpP
SyB3aWxsIGhvbGQgc3BpbmxvY2sgYWJvdmUuDQoNCj4gDQo+ID4gKyAgICAgICBpZiAoKChwZmMg
Pj4gKHBpbiAqIDQpKSAmIFBGQ19NQVNLKSAgPT0gZnVuYykNCj4gDQo+IFBsZWFzZSBkcm9wIHRo
ZSBzZWNvbmQgc3BhY2UgYmVmb3JlIHRoZSA9PSBvcGVyYXRvci4NCg0KV2lsbCBkcm9wLg0KDQo+
IA0KPiA+ICsgICAgICAgICAgICAgICByZXR1cm47DQo+IA0KPiBXaGF0IGlmIHRoZSBwaW4gaXMg
Y3VycmVudGx5IGNvbmZpZ3VyZWQgZm9yIEdQSU8gaW4gdGhlIFBNQyByZWdpc3Rlcj8NCj4gQWNj
b3JkaW5nIHRvIHRoZSBkb2N1bWVudGF0aW9uLCB0aGF0IGlzIGV2ZW4gdGhlIGluaXRpYWwgc3Rh
dGUgYWZ0ZXIgcmVzZXQuDQoNCk9rIHdpbGwgdXBkYXRlIHRoZSBsb2dpYywgRG8gbm90IHN3aXRj
aCBpZiB0aGUgcmVzZXQgdmFsdWVzIGlzIHNhbWUNCmFzIHBpbiBmdW5jdGlvbiB2YWx1ZS4gDQoN
CiAgICAgICAvKiBTd2l0Y2hpbmcgdG8gR1BJTyBpcyBub3QgcmVxdWlyZWQgaWYgcmVzZXQgdmFs
dWUgaXMgc2FtZSBhcyBmdW5jICovICAgDQogICAgICAgIHJlZyA9IHJlYWRiKHBjdHJsLT5iYXNl
ICsgUE1DKG9mZikpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCiAgICAg
ICAgc3Bpbl9sb2NrX2lycXNhdmUoJnBjdHJsLT5sb2NrLCBmbGFncyk7ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIA0KICAgICAgICBwZmMgPSByZWFkbChwY3RybC0+YmFzZSArIFBG
QyhvZmYpKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQogICAgICAgIGlm
ICgocmVnICYgQklUKHBpbikpICYmICgoKHBmYyA+PiAocGluICogNCkpICYgUEZDX01BU0spID09
IGZ1bmMpKSB7ICAgICANCgkJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmcGN0cmwtPmxvY2ssIGZs
YWdzKTsgICAgICAgICAgICAgICAgICAgICANCgkJcmV0dXJuOyAgDQoJICB9ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCg0KPiANCj4gPg0K
PiA+ICAgICAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJnBjdHJsLT5sb2NrLCBmbGFncyk7DQo+ID4N
Cj4gPiBAQCAtNTU1LDkgKzU1OSw4IEBAIHN0YXRpYyB2b2lkIHJ6ZzJsX3BpbmN0cmxfc2V0X3Bm
Y19tb2RlKHN0cnVjdCByemcybF9waW5jdHJsICpwY3RybCwNCj4gPiAgICAgICAgIHdyaXRlYihy
ZWcgJiB+QklUKHBpbiksIHBjdHJsLT5iYXNlICsgUE1DKG9mZikpOw0KPiA+DQo+ID4gICAgICAg
ICAvKiBTZWxlY3QgUGluIGZ1bmN0aW9uIG1vZGUgd2l0aCBQRkMgcmVnaXN0ZXIgKi8NCj4gPiAt
ICAgICAgIHJlZyA9IHJlYWRsKHBjdHJsLT5iYXNlICsgUEZDKG9mZikpOw0KPiA+IC0gICAgICAg
cmVnICY9IH4oUEZDX01BU0sgPDwgKHBpbiAqIDQpKTsNCj4gPiAtICAgICAgIHdyaXRlbChyZWcg
fCAoZnVuYyA8PCAocGluICogNCkpLCBwY3RybC0+YmFzZSArIFBGQyhvZmYpKTsNCj4gPiArICAg
ICAgIHBmYyAmPSB+KFBGQ19NQVNLIDw8IChwaW4gKiA0KSk7DQo+ID4gKyAgICAgICB3cml0ZWwo
cGZjIHwgKGZ1bmMgPDwgKHBpbiAqIDQpKSwgcGN0cmwtPmJhc2UgKyBQRkMob2ZmKSk7DQo+ID4N
Cj4gPiAgICAgICAgIC8qIFN3aXRjaCB0byBQZXJpcGhlcmFsIHBpbiBmdW5jdGlvbiB3aXRoIFBN
QyByZWdpc3RlciAqLw0KPiA+ICAgICAgICAgcmVnID0gcmVhZGIocGN0cmwtPmJhc2UgKyBQTUMo
b2ZmKSk7IEBAIC0zMTAzLDExICszMTA2LDE4IEBADQo+ID4gc3RhdGljIHZvaWQgcnpnMmxfcGlu
Y3RybF9wbV9zZXR1cF9wZmMoc3RydWN0IHJ6ZzJsX3BpbmN0cmwgKnBjdHJsKQ0KPiA+ICAgICAg
ICAgICAgICAgICBwbSA9IHJlYWR3KHBjdHJsLT5iYXNlICsgUE0ob2ZmKSk7DQo+ID4gICAgICAg
ICAgICAgICAgIGZvcl9lYWNoX3NldF9iaXQocGluLCAmcGlubWFwLCBtYXhfcGluKSB7DQo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHJ6ZzJsX3BpbmN0cmxfcmVnX2NhY2hlICpj
YWNoZSA9DQo+ID4gcGN0cmwtPmNhY2hlOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHUz
MiBwZmNfdmFsLCBwZmNfbWFzazsNCj4gPg0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIC8q
IE5vdGhpbmcgdG8gZG8gaWYgUEZDIHdhcyBub3QgY29uZmlndXJlZCBiZWZvcmUuICovDQo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgaWYgKCEoY2FjaGUtPnBtY1twb3J0XSAmIEJJVChwaW4p
KSkNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOw0KPiA+DQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcGZjX3ZhbCA9IHJlYWRsKHBjdHJsLT5iYXNlICsg
UEZDKG9mZikpOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHBmY19tYXNrID0gUEZDX01B
U0sgPDwgKHBpbiAqIDQpOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIC8qIE5vdGhpbmcg
dG8gZG8gaWYgcmVzZXQgdmFsdWUgb2YgdGhlIHBpbiBpcyBzYW1lIGFzIGNhY2hlZCB2YWx1ZSAq
Lw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmICgoY2FjaGUtPnBmY1twb3J0XSAmIHBm
Y19tYXNrKSA9PSAocGZjX3ZhbCAmIHBmY19tYXNrKSkNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGNvbnRpbnVlOw0KPiANCj4gV2hhdCBpZiB0aGUgcGluIGlzIGN1cnJlbnRs
eSBjb25maWd1cmVkIGZvciBHUElPIGluIHRoZSBQTUMgcmVnaXN0ZXI/DQoNClRoYXQgd29uJ3Qg
aGFwcGVuIGR1ZSB0byB0aGUgY2hlY2sgMiBsaW5lcyBhYm92ZS4NCg0KPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgIGlmICghKGNhY2hlLT5wbWNbcG9ydF0gJiBCSVQocGluKSkpDQo+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsNCg0KDQpDaGVlcnMsDQpCaWp1
DQoNCg==

