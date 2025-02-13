Return-Path: <linux-gpio+bounces-15890-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 652E0A33806
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 07:39:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5F123A5A83
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 06:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09BF2207A03;
	Thu, 13 Feb 2025 06:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EXwBqY1e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2041.outbound.protection.outlook.com [40.107.21.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFBC8489
	for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 06:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739428762; cv=fail; b=C+9cjMuw96hnWoJEBn8c75LXlNpn5YTrtvt51KE5544ko8R6EnoD+iYxxcCWD5AhgG4fSONiTaFoLnjgsZldCwYibGjfqROsAaqrgFKzmbZezy+c+cEin56WkQsKaVthnbD8HnD6/Z/5zvUCOZovcWnpp+pzkL31oCNh/Kk5fAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739428762; c=relaxed/simple;
	bh=o/7RsGxVlAye18Mg7JLYL2F11Jq2KFCi39toIoshX08=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nLRWBTQBF2tKG8lk8ToUdSf6P4EpXHS4dZUVtdXTEbo5Jn6tmFoyTkU7nRfVGeb/dH2LQavedWLbOD2SegeaH7fBPQN/Nx2ugmoG49PYeG4PABOo/LrmGLsoFZPZ9ke+CFt8k/Ne6v5u8fqhnaEz/jaUrolM8GEylqxwZV9ge3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EXwBqY1e; arc=fail smtp.client-ip=40.107.21.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L3mdNLVN6A0o1bUW3SDIJpcCd9HjK/rEF3uou3y7KWCCNlObWZmzzk5jOeoCaNjrugymkACcyb4/bMrgjB6mChydbcBKQkaYNxknjhI/GuSPYIdyEbymd68BhBOPaN0ifJxfutd8mnd+x9w3lT6h1poYEsLFFqt8rWDql31SjDsdcGfNpZCk6aY9643GgZ8mtWa31LV4juAP708tKnMUxbTRhGx0UX5DPOkxCoiPy0mxAaEw4UGii7AByw32mGmEWFW2/TKWl0PnEb+/mxr4ar524xtTqNjw+oVlrdvLBCkyEKJzbo2SEL70D5NBwynZVr6zEi6fjXKeeJq3nWPNJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o/7RsGxVlAye18Mg7JLYL2F11Jq2KFCi39toIoshX08=;
 b=MVESHguKDtcAxNlNz3bORIKOGDchfQLuMSgyi5yMq/gLRnh9fJSoFkxlppp1kBaj9RTnMv20h+BT+pnre9PsLXNZs6QkVD70g7K2czHGYWv5QSdMzW5UivxhHuvT4MhxlC/05tkgwvCZslRIFob/Z29naFsRDvpg5Zl9MvV5Y5mwebAi6bi7pupgW5zavWOOmqdGBTqkn602xmvGuCs0IGBOeUngS+b3ecpolKkksT1KPnKbSAp+GW2aOxGAaHxgQy/rzWFQKjZ3AhJudRau/7bS3ET9UTkCenT2mpxbmrdTg2GBxq5DuajMErL/CygjGnXB0scGHH7KukO1UiKL/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o/7RsGxVlAye18Mg7JLYL2F11Jq2KFCi39toIoshX08=;
 b=EXwBqY1e4I6uLAEIeIaKOCeghf0O2xaW4pLUn9ru8GsbZBfoaBodn+t8Iq606yYy7OZTaP7gSpSXwFf7D2ChHf656JhacduFjkPvrcHmym5sgLKtLyXSjrN/NRC5L8HWh/gbM9vJH2JKLJ0Gw0H823K47uQs7c+GVss+FwPgPaKN8HIFPf5iQcVxhtBcVufGJeqaspyxHDWY+HOTeurpvHOJP1XZopuyhWJKEEFu8Od4m7twp7rQyXk42oP4uWpv8bVhBbIKnYWyqe/7yGeWD7eH3LxtQluZwyceQeufmHUaLIXjO4mCHXjrCjURxi15zh319PRhgNTucgsKfUli+g==
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by AS4PR04MB9552.eurprd04.prod.outlook.com (2603:10a6:20b:4fb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Thu, 13 Feb
 2025 06:39:17 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334%7]) with mapi id 15.20.8445.011; Thu, 13 Feb 2025
 06:39:17 +0000
From: Bough Chen <haibo.chen@nxp.com>
To: Johan Korsnes <johan.korsnes@remarkable.no>, Linus Walleij
	<linus.walleij@linaro.org>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: RE: [PATCH] gpio: vf610: add locking to gpio direction functions
Thread-Topic: [PATCH] gpio: vf610: add locking to gpio direction functions
Thread-Index:
 AQHbeMNtV5WxXSj9skyddrTaKpnL5rM6mI4AgADC/gCABOU9gIAABMiQgASFfYCAAAdSEA==
Date: Thu, 13 Feb 2025 06:39:17 +0000
Message-ID:
 <DU0PR04MB949624E48F7833EC802836BB90FF2@DU0PR04MB9496.eurprd04.prod.outlook.com>
References: <20250206181714.417433-1-johan.korsnes@remarkable.no>
 <CACRpkdaNDJrGZ4Y2PPUWQfm6BprfNACYWD7srs3sYHMEsdX1Ew@mail.gmail.com>
 <DU0PR04MB94963632094E71ABE730631990F12@DU0PR04MB9496.eurprd04.prod.outlook.com>
 <cb75162b-de5a-475b-aeb6-9a3c39de108e@remarkable.no>
 <DU0PR04MB94964AA34ADC1564E685E13590F22@DU0PR04MB9496.eurprd04.prod.outlook.com>
 <7df4608e-8016-4b16-a837-4cd7c3dd8c82@remarkable.no>
In-Reply-To: <7df4608e-8016-4b16-a837-4cd7c3dd8c82@remarkable.no>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9496:EE_|AS4PR04MB9552:EE_
x-ms-office365-filtering-correlation-id: ffcae1f0-d360-4969-2c69-08dd4bf923a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TGdvSGRFRzF5TXhBVGVLTFZLNzlHNXVlNkF0TXdtUG5XYnF3NWJ1aFh2dndn?=
 =?utf-8?B?dlc3K01LTm15S2F6L0g5RkxFbG9WbWdRTTVpdG12ZmQxOE00VndVbVM4eG5u?=
 =?utf-8?B?UFA4NkJCSmdZVTA4dHZmYmNiK2Q2MkgwREN4WHFVOWQ5bjdJM3hqS3U0OVVW?=
 =?utf-8?B?SDlwVFVtUExYRGxMcTV2SUxHYmEyLzlZbnlqMXhHWUJGMXpMZ1VZV05MM2VM?=
 =?utf-8?B?dk9zNFU1OFA4cmEwdW9mVWxBMGxvNjQ5UkprYkpSTUhQYkJ4Q2pzaGRxZHNW?=
 =?utf-8?B?cTJNMTUwL1AxMEJHRzViUml3cVR4S2prSEExbWtpTm92aUtTM1BtRkR6aklV?=
 =?utf-8?B?RWN4UlpBZnRQV2xqM01nVldxM05DRWhvckZRWG95ODM1WFVYUThqQ2ZNaHh1?=
 =?utf-8?B?RmNWNzBHeFE4ZWVhcnZmSUZUc0RoUW9uTkpVT0JMTVQzelcyMHVHVWVQSUln?=
 =?utf-8?B?SlRtRlpDRXlKNTZFVjZlMjNibS9HZGpvOG5TTEJEWk9xak1SMzduMEhGQXpC?=
 =?utf-8?B?R0hzWGFhRlQ2WVV3NnVsNkc0WmZBT0tmWmRnanFPUEY5YzBMV0p1cVBkaGZK?=
 =?utf-8?B?YXYvcmUrZHlIUlRaMVBRaU9vOGpZejM5WjBrd0RQVXNNeisyU3ljK0JnSWsv?=
 =?utf-8?B?aVNBSzlCN1U1aDc1NmltZGROazAzRk94Zy93a3NIdXpRMjFkWE43VmFMSnlJ?=
 =?utf-8?B?ZWdKMERVWVFHYmtiVTAyWFpIeEV1V2tmMkpzL1MvcDJhNjhYc3dZVTZmeWFt?=
 =?utf-8?B?bm1sZEhYbzFXL29BOFNWRnpXdHEzSGZWcHh0ZEx0RHFac0E4Rmg1dElORUpC?=
 =?utf-8?B?c2ZZNm9GaE93ZVZLZCtYOVNUM2ZXMGhYcjMrSDYvOUxNUGVaR3dLaDJ1VDEv?=
 =?utf-8?B?VlBDZ3hLeWRIUjJ6aEtEdllFWDNjMm1xL09rQ2JQQjU0b0hJTFk1TG5lQXFx?=
 =?utf-8?B?TGwxR3VnVS93ZEhLWEZyYzhSTlF5TG1qQnRLN2pZQm1xNFNiR2hmZUlsMXRi?=
 =?utf-8?B?Z2tXS01mTDk3VTBmVGoxWVVTQnlpdGZwYXQrenYyUFJjYlE4OEZraG1SQmo4?=
 =?utf-8?B?V3Z1NTVQaFgxS0lYL0hzYmQrSUtzSFpFczRqQnJENVpLWkUyZzd6cCtnNUZO?=
 =?utf-8?B?WExjTU1nZlNaNXNqQXQ4SUtvcE9vU1lValRTZWJBVFdwTGhpMlNhT2Z5NDF0?=
 =?utf-8?B?TE9QdEVIQXBFRVdyVVVpVzNuSkpHYmZrRTFKVVFoaXk5V1lOUWlVK3F3MzJq?=
 =?utf-8?B?Y2pYaEdEZEZ2dzdUQzJnR1BqSlNmTS9LNTEyZ3FGSk1MSlhYOEFoZTNNdkF0?=
 =?utf-8?B?OFQ5WGE0eFpldjFsWXhzbnl3RUtyYnhtbjJoQlhaZ2oyVkdTYThxVk1jeVNZ?=
 =?utf-8?B?emVtbnZrYnVGcHRBZ1AyN1JEclcxelhDYm9lRXB0L3VxTVpnaFIwT1R3WEJn?=
 =?utf-8?B?amFwM1kxN0VOb3c1L1FsZ25FdnpjNlpuR2Z2Z2hhd1JscGZCSmRsUm9hYXlj?=
 =?utf-8?B?d0d4ejB6ekNEUHFwSVZQSXdCSVlTeDFQMUxjNkE1SGxFNHZ2ODF5TFl5QWRW?=
 =?utf-8?B?SWx6Z0cyNVRFNGhSK0dLdTZGUDdaUkhndXhEVGQzTTg1UElsaEdVVlJZYlFN?=
 =?utf-8?B?bWpZNDI0cUh4cGx0ZXlUZ3VuY0hpSjMyMjloWS9KTEhFZHVQd0hUL0VLZEl4?=
 =?utf-8?B?d0FaeDFFRDJqVFozZi9BVThUdUJGcGdQYnlKclRIMC9RRXVkcjM3L3dQd3ha?=
 =?utf-8?B?cVExQm1qZkdCUEhSejZsYVRENmw2RnRHNEl6L0dwWkRrcXVLdHJDZkxxTmtQ?=
 =?utf-8?B?dFg4aWZsaFd0WG5SY29TVjJnNEdrZ2krU0pOeXQ2TmsybnQrbG5KbEtmcUpv?=
 =?utf-8?B?QVRGMFlheWxwL1JGQk05QVJnV05NUjFDWnlDY2tvT3hWODRqRkN3WmZNZk9a?=
 =?utf-8?Q?uMgxfX6jKsXqobSXN+FtL341ml1m/CjP?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R2ZDazAyYjBsUDcrQlhOT2NCd3Bod1l5ZEFPNkp6N0pWNE1KY3FXcnJLRXI2?=
 =?utf-8?B?ZUVRcURLQ051SWRwNjBpeDRVVkwzS0tPQXhsZFNDd1lHSDE5UVFHNWFTcEpN?=
 =?utf-8?B?K2Y0UmJnZW9LNVVyTDloSHMzMUsxb1ExYXZxMDJFWjhMbGlVSHlaQ2Z3dDBk?=
 =?utf-8?B?RGdoWlZDQVJQR0VZVmE5UG1HVW1XTTlsQ3Vnd2Y2c2VrWFBjQi9Ha0g1NHhl?=
 =?utf-8?B?K0ZCbXNtR1Zud2lLcnJMSVFKRmRkYjBZcTRjcSs1MjUzTHFmY05WcndaNXlW?=
 =?utf-8?B?ancvSUlNNVVBYWlpWnIvcWFvK2lJNVRhUDBabGZaN0RWclEvVE8zU2dUbEZu?=
 =?utf-8?B?S2FtZmxxOUduVkROMmMyMFBFOWhoRTQ2SVV6OGJObm5hK0tOTEd1MjNSQ3hM?=
 =?utf-8?B?dXdwemhDMkFKSVdaYkhRRndVanFuR3pxRjN4UFFubXB6dmpTTUZKNGRnbUI5?=
 =?utf-8?B?MTVEQm1Da1Y3ek5xdDVLQTFyOHdZaWtmWXZieWUwVU9GQmxPNDBCaWRsTGVG?=
 =?utf-8?B?N3c4UnlkZkJNN3ZLeTlqRndaSzVXV0tLTlZ5L2tES1ljTTJMdkd4bUsyUENu?=
 =?utf-8?B?UThyQVhiTkxKKzVZRis0MDlGM0JjSFhGRXl6T29ZUDlCbjVJNVNHczhzRFlM?=
 =?utf-8?B?UklHSVpDU0lWcDZtYStickZWV09QcDVEYlZoc1d3aWl6alNvSU44bG9aZFNo?=
 =?utf-8?B?UGZnZ3gxWXR5QTZVaHpCMWJNdDZmVzFtZE02RUM4dFFjSVFOVXd0UE1raWdZ?=
 =?utf-8?B?UllLWVhUMVJZanRWL1B1QnFPVlFXRXBISkhYa1JrOE9iYXVtV3lvcUxVWGhJ?=
 =?utf-8?B?a0FhM0xORE1ZTjNQSzNwOEtFaU9ObFBwdllmK3dpeXNkUkhTblIrSlQ2U2Rw?=
 =?utf-8?B?UmdRcHdVa1QxaGJvYnBKTjlGMDdieENNOUlENVZIdG5HT1hNc3pnWGs4TlZI?=
 =?utf-8?B?NUpkNGZTbGh4Y0hsL3oxb09oeEl6bDY0ZUYrYWtVZ1l4ZGFwNWo5eVhpeUpJ?=
 =?utf-8?B?YXZKZVcwSW1oaEZUWWVTdmFuSVNYQ2VrcE1YR21wWnRuM3pQMXlvOTNkVENN?=
 =?utf-8?B?SWNTdGswenBSNjVRRHdrbXMwcUpOMjJFeXFtdzB4SDdNZm9UdWFBY3ZCdDZs?=
 =?utf-8?B?a1hpdkVHdU41bWsrcGxROW4zMlBnbE9lL3JWbW1YUENZTlJpN3FRcG9wTldM?=
 =?utf-8?B?K004WEoxM05HMTAxeTZLU3JBMzRjTVdDR2gvRit4RGVNME1GSERRRjdBYXBy?=
 =?utf-8?B?U2ZzTmZkbjg2cGVMdW9rb3kwT1V2TWlBOUFCM0ZYM0txUTJnandKNEpla2Vk?=
 =?utf-8?B?SVFOU3ZaQUp2clJKcGRuVzIyY3hrbE56eVVRelhZMmVYUVgyV3lQc2EyYmh2?=
 =?utf-8?B?dUFXcXJVY1ZrbTg3alBnMjAxWXFlbnBQNlY2UWRoaWQ3S1c5NjNPTXhFY2lh?=
 =?utf-8?B?QlJkZ1VOQVgvVUhscjVVY1dnSC9Sb0ZVSWpWY1Y3aDFuNVAwSzlyUkx0TkZN?=
 =?utf-8?B?RFJEeStaMG1oYlRNeWFTU1RCLzVibi9pY1hSR1JaajY5YzN2Vm5jNitpbGRH?=
 =?utf-8?B?ejdFNll5alY3RXY3MWttdUhRekQ3bmQwNlVNbGFZQzAxRFNtOEcwT3hFNTdT?=
 =?utf-8?B?S3FFTmJzUkpGYzgyMG9kRlc4dTRRdE93czRpSzI5RFB4Z3NSTHl1RlQxNzJV?=
 =?utf-8?B?dm9NOGVZekIrTWM0V3VoSm9KWlQ3R2MyeHN4M3h6K2dzREhXelpud1QvMUhB?=
 =?utf-8?B?MXc1T01HWUpyV0oyREpkTzQ2eVp2UldPMWV2b3dPanRYQTdtUjFNb3l2L0Yv?=
 =?utf-8?B?RnRKQUxxbU40Rm5CZzRZRFhyRU1UTjhhaG9yQ1VuUEpUcWRGYlphVDFjelFr?=
 =?utf-8?B?bDhpV2lmaDgyTDROeHZJMTZIMlMwWUxyeVFRZE5Xb3BaTHhudHE2WkhjVDBM?=
 =?utf-8?B?dDBWVGtabkx5L2J4bnpkRHBCSHBNcWRFUDFLTDVsMUM0eFpEODRXTmM4b0I4?=
 =?utf-8?B?TkQ4SGF4Yk5GdjBWd0JzOURzQUNVbFRvalRTajVoY2l4YkxjaHJVR1dhdjRM?=
 =?utf-8?B?cFdiYVp0MDVNeEkya3R4c01qc2s2S1lKbERiNUhmNXNkanJ3QjZMcXkvS0NQ?=
 =?utf-8?Q?n2Z8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffcae1f0-d360-4969-2c69-08dd4bf923a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2025 06:39:17.3341
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xbNtszUZkSxsSdr2/HzP5HbmBVtI8j0VO83Hs6dn2GHHSpbo90VAGKdGrRKn160DP4Fpl1YxlOhtOzHjKPRlNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9552

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKb2hhbiBLb3JzbmVzIDxqb2hh
bi5rb3JzbmVzQHJlbWFya2FibGUubm8+DQo+IFNlbnQ6IDIwMjXlubQy5pyIMTPml6UgMTQ6MTMN
Cj4gVG86IEJvdWdoIENoZW4gPGhhaWJvLmNoZW5AbnhwLmNvbT47IExpbnVzIFdhbGxlaWogPGxp
bnVzLndhbGxlaWpAbGluYXJvLm9yZz4NCj4gQ2M6IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3Jn
OyBCYXJ0b3N6IEdvbGFzemV3c2tpDQo+IDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+
OyBpbXhAbGlzdHMubGludXguZGV2DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGdwaW86IHZmNjEw
OiBhZGQgbG9ja2luZyB0byBncGlvIGRpcmVjdGlvbiBmdW5jdGlvbnMNCj4gDQo+IE9uIDIvMTAv
MjUgMTA6MzUgQU0sIEJvdWdoIENoZW4gd3JvdGU6DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+ID4+IEZyb206IEpvaGFuIEtvcnNuZXMgPGpvaGFuLmtvcnNuZXNAcmVtYXJrYWJs
ZS5ubz4NCj4gPj4gU2VudDogMjAyNeW5tDLmnIgxMOaXpSAxNjo1Mw0KPiA+PiBUbzogQm91Z2gg
Q2hlbiA8aGFpYm8uY2hlbkBueHAuY29tPjsgTGludXMgV2FsbGVpag0KPiA+PiA8bGludXMud2Fs
bGVpakBsaW5hcm8ub3JnPg0KPiA+PiBDYzogbGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmc7IEJh
cnRvc3ogR29sYXN6ZXdza2kNCj4gPj4gPGJhcnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz47
IGlteEBsaXN0cy5saW51eC5kZXYNCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZ3BpbzogdmY2
MTA6IGFkZCBsb2NraW5nIHRvIGdwaW8gZGlyZWN0aW9uDQo+ID4+IGZ1bmN0aW9ucw0KPiA+Pg0K
PiA+PiBbWW91IGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIGpvaGFuLmtvcnNuZXNAcmVtYXJr
YWJsZS5uby4gTGVhcm4NCj4gPj4gd2h5IHRoaXMgaXMgaW1wb3J0YW50IGF0DQo+ID4+IGh0dHBz
Oi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdDQo+ID4+DQo+ID4+IE9u
IDIvNy8yNSA3OjIxIEFNLCBCb3VnaCBDaGVuIHdyb3RlOg0KPiA+Pj4+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+ID4+Pj4gRnJvbTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBs
aW5hcm8ub3JnPg0KPiA+Pj4+IFNlbnQ6IDIwMjXlubQy5pyIN+aXpSAyOjI5DQo+ID4+Pj4gVG86
IEpvaGFuIEtvcnNuZXMgPGpvaGFuLmtvcnNuZXNAcmVtYXJrYWJsZS5ubz4NCj4gPj4+PiBDYzog
bGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmc7IEJhcnRvc3ogR29sYXN6ZXdza2kNCj4gPj4+PiA8
YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPjsgQm91Z2ggQ2hlbiA8aGFpYm8uY2hlbkBu
eHAuY29tPg0KPiA+Pj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGdwaW86IHZmNjEwOiBhZGQgbG9j
a2luZyB0byBncGlvIGRpcmVjdGlvbg0KPiA+Pj4+IGZ1bmN0aW9ucw0KPiA+Pj4+DQo+ID4+Pj4g
SGkgSm9oYW4sDQo+ID4+Pj4NCj4gPj4+PiB0aGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+ID4+Pj4N
Cj4gPj4+PiBPbiBUaHUsIEZlYiA2LCAyMDI1IGF0IDc6MTfigK9QTSBKb2hhbiBLb3JzbmVzDQo+
ID4+Pj4gPGpvaGFuLmtvcnNuZXNAcmVtYXJrYWJsZS5ubz4NCj4gPj4+PiB3cm90ZToNCj4gPj4+
Pg0KPiA+Pj4+PiBBZGQgbG9ja2luZyB0byBgdmY2MTBfZ3Bpb19kaXJlY3Rpb25faW5wdXR8b3V0
cHV0KClgIGZ1bmN0aW9ucy4NCj4gPj4+Pj4gV2l0aG91dCB0aGlzIGxvY2tpbmcsIGEgcmFjZSBj
b25kaXRpb24gZXhpc3RzIGJldHdlZW4gY29uY3VycmVudA0KPiA+Pj4+PiBjYWxscyB0byB0aGVz
ZSBmdW5jdGlvbnMsIHBvdGVudGlhbGx5IGxlYWRpbmcgdG8gaW5jb3JyZWN0IEdQSU8NCj4gPj4+
Pj4gZGlyZWN0aW9uDQo+ID4+IHNldHRpbmdzLg0KPiA+Pj4+Pg0KPiA+Pj4+PiBDYzogTGludXMg
V2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPg0KPiA+Pj4+PiBDYzogQmFydG9zeiBH
b2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPg0KPiA+Pj4+PiBDYzog
SGFpYm8gQ2hlbiA8aGFpYm8uY2hlbkBueHAuY29tPg0KPiA+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBK
b2hhbiBLb3JzbmVzIDxqb2hhbi5rb3JzbmVzQHJlbWFya2FibGUubm8+DQo+ID4+Pj4NCj4gPj4+
PiBMb29rcyBjb3JyZWN0IHRvIG1lLCB2ZXJpZmllZCBieSBsb29raW5nIGF0IHRoZSBtb3N0IHRl
c3RlZCBkcml2ZXINCj4gPj4+PiBncGlvLW1taW8uYyBhbmQgc2VlaW5nIHRoZXJlIGlzIGEgbG9j
ayB0aGVyZSBpbmRlZWQuDQo+ID4+Pj4gUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVz
LndhbGxlaWpAbGluYXJvLm9yZz4NCj4gPj4+Pg0KPiA+Pj4+PiB3aGVyZSBhZnRlciBhIGNvdXBs
ZSBvZiByZWJvb3RzIHRoZSByYWNlIHdhcyBjb25maXJtZWQuIEkuZS4sIG9uZQ0KPiA+Pj4+PiB1
c2VyIGhhZCB0byB3YWl0IGJlZm9yZSBhY3F1aXJpbmcgdGhlIGxvY2suIFdpdGggdGhpcyBwYXRj
aCB0aGUNCj4gPj4+Pj4gcmFjZSBoYXMgbm90IGJlZW4gZW5jb3VudGVyZWQuIEl0J3Mgd29ydGgg
bWVudGlvbmluZyB0aGF0IGFueSB0eXBlDQo+ID4+Pj4+IG9mIGRlYnVnZ2luZyAocHJpbnRpbmcs
IHRyYWNpbmcsIGV0Yy4pIHdvdWxkICJyZXNvbHZlIiB0aGUgaXNzdWUuDQo+ID4+Pj4NCj4gPj4+
PiBUeXBpY2FsLiBJIHdvdWxkIGluY2x1ZGUgdGhpcyBpbiB0aGUgY29tbWl0IG1lc3NhZ2UsIHBl
b3BsZSBjYXJlLg0KPiA+Pj4+DQo+ID4+DQo+ID4+IEhpIExpbnVzIGFuZCBIYWlibywNCj4gPj4N
Cj4gPj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3ISBJJ2xsIGluY2x1ZGUgdGhpcyBpbiB2Mi4NCj4g
Pj4NCj4gPj4+PiBMb29raW5nIGF0IHRoZSBkcml2ZXIgaXQgc2VlbXMNCj4gPj4+PiB2ZjYxMF9n
cGlvX2lycV9tYXNrKCkvdmY2MTBfZ3Bpb19pcnFfdW5tYXNrKCkNCj4gPj4+PiBjb3VsZCBoYXZl
IGEgc2ltaWxhciBpc3N1ZSwgYm90aCB3cml0ZSB0aGUgc2FtZSByZWdpc3Rlci4NCj4gPj4+DQo+
ID4+PiBJbmRlZWQsIGFuZCBhbHNvIHRoZSB2ZjYxMF9ncGlvX3NldCgpIC8gdmY2MTBfZ3Bpb19p
cnFfYWNrKCkuDQo+ID4+Pg0KPiA+Pg0KPiA+PiBDb3VsZCB5b3UgcGxlYXNlIGV4cGxhaW4gdGhl
IHJhY2UgY29uZGl0aW9uIHdlIGZpeCBieSBhZGRpbmcgbG9ja2luZw0KPiA+PiB0byB0aGVzZSBv
dGhlciBmdW5jdGlvbnM/IEYuZXguIHRoZSB2ZjYxMF9ncGlvX3NldCgpLCBpbiB3aGljaA0KPiA+
PiBzY2VuYXJpbyB3b3VsZCB0aGUgbGFjayBvZiBsb2NraW5nIGNhdXNlIGFuIGlzc3VlPyBJdCdz
IGEgc2luZ2xlDQo+ID4+IHdyaXRlIHRvIGVpdGhlciB0aGUgc2V0IG9yIGNsZWFyIHJlZ2lzdGVy
LiBJcyB0aGlzIHJlbGF0ZWQgdG8gaG93IHRoZQ0KPiB3cml0ZWxfcmVsYXhlZCgpIHdvcmtzIG9u
IGRpZmZlcmVudCBhcmNoaXRlY3R1cmVzPw0KPiA+Pg0KPiA+DQo+ID4gU29ycnksIEkgdGhpbmsg
dHdpY2Ugb2YgdGhpcyBjb25kaXRpb24sIHNlZW1zIG5vIG5lZWQgdG8gYWRkIGxvY2sgZm9yIHRo
ZXNlDQo+IGZ1bmN0aW9ucy4NCj4gPg0KPiANCj4gSGkgSGFpYm8sDQo+IA0KPiBNYXkgSSBhZGQg
eW91ciBSZXZpZXdlZC1ieSBvciBBY2tlZC1ieSBpbiB2Mj8NCg0KWWVzLCBzdXJlLg0KDQpSZWdh
cmRzDQpIYWlibyBDaGVuDQo+IA0KPiBLaW5kIHJlZ2FyZHMsDQo+IEpvaGFuDQo+IA0KPiA+IFJl
Z2FyZHMNCj4gPiBIYWlibyBDaGVuDQo+ID4NCj4gPj4gS2luZCByZWdhcmRzLA0KPiA+PiBKb2hh
bg0KPiA+Pg0KPiA+Pj4+DQo+ID4+Pj4gQm90aCBpc3N1ZXMgY291bGQgYmUgZml4ZWQgYnkgY29u
dmVydGluZyB0aGUgZHJpdmVyIHRvIHVzZQ0KPiA+Pj4+IGdwaW8tbW1pbygpIHdpdGggYmdwaW9f
aW5pdCgpIHdoaWNoIHdvdWxkIGFsc28gaW1wbGVtZW50DQo+ID4+Pj4gZ2V0L3NldF9tdWx0aXBs
ZSBzdXBwb3J0IGZvciBmcmVlLg0KPiA+Pj4+DQo+ID4+Pj4gSSBoYXZlIG5vIGlkZWEgd2h5IHRo
aXMgZHJpdmVyIGlzbid0IHVzaW5nIGdwaW8tbW1pby4NCj4gPj4+PiBOb3QgeW91ciBmYXVsdCB0
aG91Z2gsIGp1c3QgcG9pbnRpbmcgb3V0IG9idmlvdXMgaW1wcm92ZW1lbnQNCj4gb3Bwb3J0dW5p
dGllcy4NCj4gPj4+DQo+ID4+PiBJIGNoZWNrIHRoZSBjb2RlLCBmb3INCj4gPj4gdmY2MTBfZ3Bp
b19kaXJlY3Rpb25faW5wdXQoKS92ZjYxMF9ncGlvX2RpcmVjdGlvbl9vdXRwdXQoKSwgdG8gbGV0
DQo+ID4+IHRoZSBpbnB1dC9vdXRwdXQgcmVhbGx5IHdvcmtzLCBuZWVkIHRvIGNhbGwNCj4gPj4g
cGluY3RybF9ncGlvX2RpcmVjdGlvbl9pbnB1dCgpIGZvciB2ZjYxMC9pbXg3dWxwL2lteDh1bHAg
U29DLg0KPiA+Pj4gUmVmZXIgdG8gZHJpdmVycy9waW5jdHJsL2ZyZWVzY2FsZS9waW5jdHJsLXZm
NjEwLmMsIGl0IGltcGxlbWVudA0KPiA+PiBncGlvX3NldF9kaXJlY3Rpb24gY2FsbGJhY2suIEFs
c28gZm9yIGlteDd1bHAvaW14OHVscCBwaW5jdHJsIGRyaXZlcnMuDQo+ID4+PiBUaGlzIHNob3Vs
ZCBiZSB0aGUgcmVhc29uIHdoeSBub3QgdXNpbmcgZ3Bpby1tbWlvLg0KPiA+Pj4NCj4gPj4+IFJl
Z2FyZHMNCj4gPj4+IEhhaWJvIENoZW4NCj4gPj4+Pg0KPiA+Pj4+IFlvdXJzLA0KPiA+Pj4+IExp
bnVzIFdhbGxlaWoNCj4gPg0KDQo=

