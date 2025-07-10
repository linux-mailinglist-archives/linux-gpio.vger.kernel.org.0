Return-Path: <linux-gpio+bounces-23083-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC08B00232
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 14:42:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EF3E584E3B
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 12:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22A08257ACA;
	Thu, 10 Jul 2025 12:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TO4z6Mwv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013021.outbound.protection.outlook.com [40.107.162.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081292571C5;
	Thu, 10 Jul 2025 12:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752151333; cv=fail; b=BE7BQi4NSSSJCqL/V94TAsYGPiGbcX6NWILzVqx6je+NU102UAbIQiYG5NPVwubR+ZgGBlNeEYvi2/8rG+LnsXsi0BCqudJ9BtX6oUEF3Ozc0GZpQQRVseXJ4MDgYIcFNo43iMKejpItx/ouv6WLxei6PUTHPHVtDOW/t01JRF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752151333; c=relaxed/simple;
	bh=CdWxi32zJXsfq3JtCuZLyHtILfM3WMAHGq45Lp6VO3A=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=JOEEIkvrmym8p1UDFsPxvsEH1vQuyYg8/LONZOxIHFHuE7CGj89GtKCj5JLex3eQxo4b1jLfPBd1XhrPtD5PeqzRofwY5YQNNuv5yah1/SrhighdA3IMy7BGZ5zZlepcyGZUC/TnMVKn92j6TgAMa8qdVFAdCG7un5vlsWJy+6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TO4z6Mwv; arc=fail smtp.client-ip=40.107.162.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aTiRsvs/cO0DJnIbo8S+kPsZsW38T9DjsIUUciO0ePnR/JT0smviWA65jsMznOk0QA03D9rHhyb96IfeRSh4b/+Yk1wS6F4Dsd7q8YwwhqFI29ybwpdRYQTt9v8g/ErAWUHOyOZWwi9ZEBCBL1FvfLjoNYmdfkaAian79jULCsPscfytKpcr3UBo0oPJohrybFRYbOu4j97BWF3Bx5QPs+GIRLVGlqkJSvzM5DmeDQ3oxH8RjnoGMWgZojHyBYA52G/lo1ucXTpHdHhYNQx8O8Kn6jiUBJ3MuNoR0PogDR7Y6bupzZQ+yfkPFz0a2caAJQaKZCxtc8/dbW4xdsp8uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nfcx3eO5EFkOgU9HEyUw1Rl8ToGIh1V7MsQxnigb5wE=;
 b=aACMhhPtpbPm/S+m8nM+HKfPIED4V4VSrRV7Jb4/BQoMI4gTRrMF9ZINvteUw4T1YJXKFbvKXY44CFQU/XeHR3/z0PW1VR9TzVb7u1FHw+0lHLhks8ww06bkfMmimedCa6BmCVrOFLnkCxxOD2WQ01rPKG2O6PEC1CypJ/8wMy+eoB9SME2m1ZUkydNlDgHeO9QqwYhYZOWBM7Yt7EE3lQxyYZS3qgn8fKy8zW7E7V8nPodBPUzIeIUmcEw/IZeNUyz+BPiX7U17MIhX98VUODDhtIhZnrRPedfU7cpmCg5RGyg/xoFn7oWeP9FVUYGOU87I2PiNS1aweMVw2jTlbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nfcx3eO5EFkOgU9HEyUw1Rl8ToGIh1V7MsQxnigb5wE=;
 b=TO4z6MwvTrt3gLD6v2YLTbfYoH/J1eUjOeChiAOs0fY8XZn5kCkSp7SU0WURUIkL8FgBQJDfwzlLd/a8bmkicUCwAJrMkt4IKWGnHx7FEPUSpDnTTI0H9k4v/m7tDrJXmhJYsShyKTpzqK/bGWNrZMPR9oDcyZYJH4OxMCf9l82BcJkdHgy5kQXutHpKUzkQQxeLHP/lCvUgjkptUnaSB/kgNMGfKmgtYrdhc5qTf8x2ACvld/6Vf+SE43YO9SxkqHckIZe6DKjGOj/c2hJ3i3dmZqdTPXvysN2w9N4lzHE3CsIhHyxXe79Wwn0ECpYlt8bY7kOXBVbnvWHIrXrx+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI0PR04MB10291.eurprd04.prod.outlook.com (2603:10a6:800:245::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Thu, 10 Jul
 2025 12:42:06 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 12:42:06 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Thu, 10 Jul 2025 20:40:02 +0800
Subject: [PATCH v2 2/3] ASoC: codec: tlv320aic32x4: Sort headers
 alphabetically
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-asoc-gpio-1-v2-2-2233b272a1a6@nxp.com>
References: <20250710-asoc-gpio-1-v2-0-2233b272a1a6@nxp.com>
In-Reply-To: <20250710-asoc-gpio-1-v2-0-2233b272a1a6@nxp.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752151210; l=1503;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=CdWxi32zJXsfq3JtCuZLyHtILfM3WMAHGq45Lp6VO3A=;
 b=xAl3h8aEUag0x1JWKeprHfeatWZuYoLH1VJadeFOUF+9sBZXof9bc//sYxz/PUBoow8nKshSF
 XmMWLytnzgqAmf/+ikp8n+VCLV+PYT/0nwIhQDoa5mcREpiLLBIXEW3
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MA0PR01CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI0PR04MB10291:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c990420-9bcd-4a5d-51e3-08ddbfaf2d9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cTBNZUx1K1dpOE1NYkJnN2Z1K3QzWmNCTld3NUxMeGhpc2VlYmxoYWFOWm53?=
 =?utf-8?B?WmFjSDlSZVFzUjNZQVRlaDBESGF0TG5NTWtobURvQXpJWDBXZmdrR0lvME9C?=
 =?utf-8?B?MEs1NUFHNE5INjY4YVNwRWExQVNiZkFpeWxha1pPVUI5Z29xMHN0TjdmdENx?=
 =?utf-8?B?MFlKR1FZTG9LM2dpNEhZaUQ0RjVJWE53Y3NtaWRMK05lMHpVbWNxakFMa1NK?=
 =?utf-8?B?N0dtcUlwZnIzU2pCc1VhaE8rM0NnVDZHQ0VxNnVYSzdpeHRDNDlPMnNZSXlt?=
 =?utf-8?B?bTZzd2VYYlB4cmd4ZjJsQnloOFdvbEFqU2d4MEhDQ1JQRVBYV2RCeGZ0KzJL?=
 =?utf-8?B?QlQwZHBoYVJZQVFnaVFzMXlLN1czM0ZXN0U2U1VYQ1B1TnlaMXF0VWtwdEVT?=
 =?utf-8?B?T08wMzBWZ2w0cUtVNnBaN2VWRldtc2haSWdacXcvSFVsTldCQ0xxUVJvb1B2?=
 =?utf-8?B?eG1ZOXkvb1MwTVhZQ2wyUUk0REc3SmZHQUpFUkxjaHZOMnM3VmpGbzNLS0JE?=
 =?utf-8?B?WDhVcExQLzBsZWhDVnRRcjQvNzg1K014NFNGbnBJQnBXZUh3QTVzZWxSUm1P?=
 =?utf-8?B?aGU0OTVSYmEzemQ4a0t4VkhmNzJ4R1l3UWd4OENEWUdKR1YwaGlHL1ppQ0Yr?=
 =?utf-8?B?aHgyb2MvN2ppeDlZTnFSWkV6RzRCSmY0b2FzUkloTHdOQjVkMk9MaExVb2dS?=
 =?utf-8?B?TEZLZThZbzlhekRGNEIvYUFvUFVDZTBXMWlMcGhLWnZZK21QanRVdDJUQmRt?=
 =?utf-8?B?eXhMbU54eEhqZXBjRkZPa3FBSEE2VUh1a2phakxxTUtMNDR5eFJUbFRqWWxa?=
 =?utf-8?B?aVlEUXd2Uk1BWG45K2oxU0xIK1B1dkdtdHYrT09EaVhmT3hHQzVlYVZDbEpt?=
 =?utf-8?B?SU90VVppT2c2Ymd1SW9leFZ1NDM4WjVPVkM0SWpSMmxHcE5UMTR1ajIyUnBD?=
 =?utf-8?B?S1BWa3AzTnJyUXhzUzAreWpubzFucUlnWEFQaGxLU3Z5N2xWa0RiRThaTWNJ?=
 =?utf-8?B?ZTd4K2ZxcFNlRVhra1B6WGN0QkhEbkN3VHpUZmUvNEk0d2toVjE4cDdheFBm?=
 =?utf-8?B?REVXNFJ0VnNTTFQ2RWppeDRZdndOaGE3V3l4TXBUM1RNdkhKM3F6b3VWL3cy?=
 =?utf-8?B?bXVTT3RsQUxxa21DaDhUZlJHM0tnbjFvVm1iai8wOGFkUmFkbjZjY2VVQUJL?=
 =?utf-8?B?ck1kVmtaNjdZY0F1dFVheXk3VEtCS0VidnZSYTQ5bC9NanN0bkhMWHdYMDZ4?=
 =?utf-8?B?K2I3eXIzWTNDQVZSbCswR2xaa2ZIQTdpTGRiWHZ4cmljYjU2RmYrcXI3S09r?=
 =?utf-8?B?aHdkVEhVVEg3WVhMNTFEM2l3VnlMOVllQllra2RDNzVvTDJ3L0xsWG5PSk9h?=
 =?utf-8?B?enR5aWNjQVRJQ2wxYkpCcmJtV2QrUk9RQ3dwK3ZsVFphWURJOEVvNy93QTZW?=
 =?utf-8?B?ZmpCNEVOaFBoa3U4bGpoaWZLdmhjUGNNc3dSeXhCT21lZ0Q2cmtLNUh4K1pL?=
 =?utf-8?B?cXREaGdUbXlFcHJNK2NRQTdrN21LWXRucWF4SlhqYmEyOGFoZDIrVkhJWFdZ?=
 =?utf-8?B?MmFNeTQ2T0RIZm11V25LeWVyc3hScHJuUUlYdlM5ZElza21HSXhlTFcyMFll?=
 =?utf-8?B?R0tEVnZtMklaenJydVpkVm9FMEE4VEsrZWFjSlo5WTZ2bFJzUGtXTmExNmJo?=
 =?utf-8?B?STRNbDRibWZNTG4veHk0UTVkOTE0Nk1nb2EvblV6SEh1VXhVdWpsUmNFeG9j?=
 =?utf-8?B?WDVpNnJscHRNYUo5OEdFMnJiTjBjQzNDWkxBdHhMWjc3QTV6MG1XMDJuM3pZ?=
 =?utf-8?B?bmNQQ3dXdEVLS2JkcVZHTzdhK1JEaEY5SWYrRGlvTS9pSVh0ZTJOd1ZlZVB4?=
 =?utf-8?B?RkY3dnhWSWF3S2N6Tkd0V2dRbGl3amx0QVorWFhxWU96aEJxb0tIRWFqbTJD?=
 =?utf-8?B?Vko2SXc3bVJENy9oR0JtbzMrb0NkNGVGb1RjaHFHemxscGllNG0ycUJiWjlO?=
 =?utf-8?Q?Yp+USux+dw50jgUg1ruYn9a/okpICY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmpDZVMyc2p2VjF6VGlzUVJaTUp1QmJ4Y0ZWZU1MV1RNcWtoQ3lhZjgyVTJZ?=
 =?utf-8?B?eEpSbmEyaFpUS1k0d3d6VC8rVnR6Ui8rQTJObWhMNUZKVDRRRFBIRXQ5d0NK?=
 =?utf-8?B?dkxoa2FJazNBUlR2eU1odlUxR0xYNFlhanBBOFR2bG5PT0dMNUVQbFFwUXIr?=
 =?utf-8?B?V0lvMTlSa0h2TndjQytDOUxsL1NVWXNSNnBnVkVoT2hpcEdFdStmY25FMkEr?=
 =?utf-8?B?bjRlUVQxWU15eENmWEJSaUJ3OWZWRUJUUDZQSjFlSVJWVlMvZW4raERlRW1h?=
 =?utf-8?B?OWNTeTQ2cFNTZ1J4QlFtc2RyYm9GRW94VU9RZCs4KzdXQnpVUUhvUUptNE82?=
 =?utf-8?B?NDNnYzBIVzVxZ2FlVnp4SWk0MEZTRG80TWtWT2xXY1FjcXovT2YyaDFiN0VZ?=
 =?utf-8?B?UEVYYSsvNjFCYUJnL1huS1ZGank3RUlhdXhoUWI5NnozSWQ5dExGQWY0cWJ1?=
 =?utf-8?B?WmloUG5HZWsyN1RURnMyUDU5OWJZV0xFblUyYy8zdmNjT1ZYaEF2Vk85ZEox?=
 =?utf-8?B?SkdyL1BYSTJJODY2OWk4SHpRK0hnd0J1cXJEcXExbGpWNCtnYjBQRDJsU1RW?=
 =?utf-8?B?OFR3V2RFQWh5cW1nbjRDdDE2STBuTVBOWWFyNVNXOGtpNURuQzBabktIZGwx?=
 =?utf-8?B?dFhjbmZpMXFWbVdtdXQ1b2NYQXNyMEhBYkN1dzdmVHRzRkpJYktlWGJHbG1k?=
 =?utf-8?B?andESWFzdGpTWXdaZW5ZYm9RTStSb1VrRzVrbEcvNHRKbEx3TUF4c3oyVDls?=
 =?utf-8?B?SmxPN0oxU001clp6Unp1MWJDaHNpSjVHMzBsYUw1U2dtZ0NKTG1lQy9KcG9M?=
 =?utf-8?B?eEFNMGYxYkxTOHZFekJIYXhtNVdjY3pkY0k3RnRmMEhCYXFGSUhqam0raFJT?=
 =?utf-8?B?bFFpYmJBVmdDcitHcnBQM3FyQUVXQ2ZER3ZEem5vVGJwdGRpeGdQT0Fha1FK?=
 =?utf-8?B?SFZoQWIwUy9vN1pPQmNOVW5QdEduNmVkUjk2Q2hEYWluRUVpSkVrREhoUTND?=
 =?utf-8?B?TFptUjY3amgxZHVlczQ1azFSamM5YjMvck1LR2RsbEt1R2dLNUxJZERQWWY2?=
 =?utf-8?B?MmpBQk1TNDVzRE9Bc1dLa2lnU05yb1FwUHkrRnJEN0xCUkJJWHR5NnZFcHVI?=
 =?utf-8?B?eDh5ZlVna2dBdi9xdVd1S21qdkRQMUtSZHAzRlFxaVdwQjl6bUpKQTNrNFpU?=
 =?utf-8?B?S0ZWK3lVbFErTzdQdi9qb1JXTXpZbXhiSnBVTzFXUXFaMFdZakd1Mm9vVnV4?=
 =?utf-8?B?UlQ1b1Q1NnJnUjhOVk1zZUZ6NzE4Zi9nVk1wLzdFazQ5MlVTa2NtS2U2aWJT?=
 =?utf-8?B?T3doTGNKZTZjVXBaMjZyMERKVmhOdmtiaS9RU2gyeXk5M1JTSzVyOG1YM1pV?=
 =?utf-8?B?c243RGl3SEd4THB0dUJ1SGcrZm1PQzVFaVh5MXp3UjZ1WlhvVUhvTlVESXJE?=
 =?utf-8?B?aGxBVU9SQW9tTUxSeWNaK0ZmOWw4NC85REcvYzhPY2c4eTJrdXRtdHJVVmZm?=
 =?utf-8?B?WjJGcFRiVXFNV1ZEcXkyVEExMjlkN3pnOXIyVHJBVjBRVm9zVGhJbWdZUEJH?=
 =?utf-8?B?MnFTS0VRUGRCTENnZHJULzZhb1BHSnRSek9DQmRhVVRQb2d3SENWUlVNbGVq?=
 =?utf-8?B?R2FJNlEvYlpTdG9YMEVSRmRLM2REeTNNbXBiZytJdmU0K3d4ZWhyT2ZobnNh?=
 =?utf-8?B?NVM4UFJIcitwZHhlZEQ3MFl6U1YwcnhYVUcwQjkvcjVtWUZOSjdRcE9QYU5Q?=
 =?utf-8?B?S0RMY1lwNkh4RUFvQXV5TmdLN3NwNG1FVGZ0aUtQZFZhMGo2bGVpbGZQb3ha?=
 =?utf-8?B?OHloeGNlZ1VKdmlUNnQwZ2MwaDBsTVdmblUvSkw1R2QxMUw2ekxCUCs3cUdF?=
 =?utf-8?B?akZGVENPSUdwbTYyOStlblREaTlvS3FuYytoL1BSZnJSRXdwL3lxNUMvNURi?=
 =?utf-8?B?ZmVpdjI3QVJ0ZzBueGtvNUxydmNaa1JFbzBOcEtaOUpJKzFmKzdzNlJUWmhQ?=
 =?utf-8?B?U0hMZFRnTi9EWlJSNU5xNW55bzB4OTh1OHdUYmZWM2RFWkNobFBkTWh5V09v?=
 =?utf-8?B?bSthS1g1RWFiR0t6V091dW55Sm9lVUY5bTBTSlMwRHEwK3ZBU0ZnUkpwZ1Yy?=
 =?utf-8?Q?aKymM1JippCw19F21+JlP+sGJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c990420-9bcd-4a5d-51e3-08ddbfaf2d9b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 12:42:06.3142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VJ4TbBzrwNAcDivx+8uIuYQOH038a59ZESWktcm0WyNdMLN/K2Rkgf/EMkBLgx5KTOEK5KGiP9vPPTFXRZg+MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10291

Sort headers alphabetically to easily insert new ones
and drop unused ones.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 sound/soc/codecs/tlv320aic32x4.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index 7dbcf7f7130b04a27f58f20beb83eb3676c79c3d..2f4147387c4f802bdac983c81b104c000b1fd6ed 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -9,27 +9,27 @@
  * Based on sound/soc/codecs/wm8974 and TI driver for kernel 2.6.27.
  */
 
-#include <linux/module.h>
-#include <linux/moduleparam.h>
-#include <linux/init.h>
-#include <linux/delay.h>
-#include <linux/pm.h>
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
 #include <linux/cdev.h>
-#include <linux/slab.h>
 #include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/gpio.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
 #include <linux/of_clk.h>
+#include <linux/of_gpio.h>
+#include <linux/pm.h>
 #include <linux/regulator/consumer.h>
+#include <linux/slab.h>
 
-#include <sound/tlv320aic32x4.h>
 #include <sound/core.h>
+#include <sound/initval.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
-#include <sound/initval.h>
 #include <sound/tlv.h>
+#include <sound/tlv320aic32x4.h>
 
 #include "tlv320aic32x4.h"
 

-- 
2.37.1


