Return-Path: <linux-gpio+bounces-20315-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A765CABCC8B
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 04:00:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48F0B17D138
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 02:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F5415855E;
	Tue, 20 May 2025 02:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AKTwmll1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2049.outbound.protection.outlook.com [40.107.20.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2855B7E1;
	Tue, 20 May 2025 02:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747706443; cv=fail; b=EECYU9JWp7yzfsJHsoJcajiqhw2+y7/tT/qb1yNkkCi1gMi93uMRpzwhcjjrqGZiu0xPqTsTY/9msVuQ2rXqhJDix4SBXL1cMPKoJ4/hL1u1al6tiDcH9KfFIBZlg1yMxIeecKQ/2vbW6tNH40NGGQR2rCthlFC10a7Z6xwZuj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747706443; c=relaxed/simple;
	bh=J/PPYDvuFR1bRHZnfveC5zXz1uYxzC2mwAC1MvU3N2Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PHgG0GaYkFxOgqrRo+Nndf9IkdAnbyIZqlVPVDMMVG41HgzIlWqfGieE9Gy2nR/i7UGCURwsUA/dCDoFknkSuVSbD68B9mbz5xTnDKxWJ2tiHo2uu5nVrzTOIImYQJZXrLH4kVRvyur5ir0Z81dj2A43+y7k70AkmruzdS5j1Uw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AKTwmll1; arc=fail smtp.client-ip=40.107.20.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BZXRdNfCqLeWyFgvhGKpYAlTbAG83c9+7/9c6AOBUvJL5O5deAB7RJYhyFtqX+CsAm9d/bOq8lXI8fCymRoYUefImM4hCG644iVdGkyIvpoSC2Fcvxt1daRI0v9s+UgLGP72eEfxbymUyvuBPxMs49BBx0jKfVPZ4TRXAFuAtqTkPg0MZTEC2Gt4JLvbw8ngV/YnCIMtCwz90H/NeOlUbuW3I6ZcMBqt5XgDJFUzslVvrA4HktavfNAOF09XSiImndki6XbGyLVZkt5ZP/VYcMQkYTMZezv3DRSCvaUus1j98z92ffzoxf12JUxhep+kKHIYrWKwd8D88/qhakNwkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J/PPYDvuFR1bRHZnfveC5zXz1uYxzC2mwAC1MvU3N2Q=;
 b=PcCakdtMuxQR6GmEVSpRtV90ir0Z4bRDvQhlK+1B5hEFLH1kfI4QVqld98aXa43+Rc6EXn0RC7wTNv3p6F0RCt3YwXDNbfHmeNHgh2Hdsvjg0+V9jA6WBsDl1f+I8wIBWgCfW8ups8yT9OzRA0Kl5sVNh3MLov3x+0gXPFGBA9SOtOQ7h/QaGahN24iNs5WTxEy7NWeVROXwKkdCIJA7e+P6JFa6W1/D9JL3eWUzRmM/v2WG+pEtYZws358FUXopR4BltgNZFqlgxv3YC4LC04Q10vl5nGe4d8VCE5zoni/OU+r37Ir+0+/c0Nku/Ga+w9+42Fh2uWWRXupYuyD7ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J/PPYDvuFR1bRHZnfveC5zXz1uYxzC2mwAC1MvU3N2Q=;
 b=AKTwmll1HUwK9SMj4iGY5MOW7Z8xqXQcbHnkEAoTODTMepvmKTgvchTs4SIoFogflKtIo7hFO1zLge9SMGNDTdAlEJ92oI87uzT2E8Myeqd/y6YSAcyolFURzNOXFoaCF4dSzFhmaUqvViknjwYiF3qyApSKxqAoyjsJa5kW69x0mbYdkgdXUzQH45LAk7JHm2b8jtVVSX3uBVjHDuSwCbBhZ8tXk1TCxm8ZuGTe+DD0twen9IE1Wm0KSqLQ1navylQ7CYif0pvQC9q83pGis5gl/YXi6GqgcQvvQ9jMUQi4ZKqMWzzSu1eBzlahKqjM5OIxYn9F2pTpJDPeNXr45A==
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by PA4PR04MB9487.eurprd04.prod.outlook.com (2603:10a6:102:27c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Tue, 20 May
 2025 02:00:37 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334%4]) with mapi id 15.20.8722.031; Tue, 20 May 2025
 02:00:37 +0000
From: Bough Chen <haibo.chen@nxp.com>
To: Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Stefan Agner
	<stefan@agner.ch>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] dt-bindings: gpio: vf610: add ngpios and
 gpio-reserved-ranges
Thread-Topic: [PATCH v2 2/2] dt-bindings: gpio: vf610: add ngpios and
 gpio-reserved-ranges
Thread-Index: AQHbyIOJtotboVfnW0K2Klb8iuZMaLPaHj0AgAClrsA=
Date: Tue, 20 May 2025 02:00:37 +0000
Message-ID:
 <DU0PR04MB949631B73BFE4C08D77D5D2C909FA@DU0PR04MB9496.eurprd04.prod.outlook.com>
References: <20250519-gpio-dts-v2-0-b9e77173e9c5@nxp.com>
 <20250519-gpio-dts-v2-2-b9e77173e9c5@nxp.com>
 <20250519-bucked-revolt-2b93a9a31422@spud>
In-Reply-To: <20250519-bucked-revolt-2b93a9a31422@spud>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9496:EE_|PA4PR04MB9487:EE_
x-ms-office365-filtering-correlation-id: 31283fda-fd65-4e9a-40f1-08dd97421d74
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?gb2312?B?dERnQkFBVHR2QVZYYW9DTnlaV3o0Y3VRMGxkMjZ6MENXc0xtN3BkZ2J0bWMx?=
 =?gb2312?B?ZjQrcEo0RTI1V2pmc0V5WElZcnFFSDB2TE5QN0JqMFVqNTF4cFV5b1NhTkFF?=
 =?gb2312?B?U28yWWsvc1hXak9CSVBFZGMvUEQ0T1p1TzFydjU0RzFsdXZUMWcwd1hDdHVO?=
 =?gb2312?B?dGpXbkpzMlpCVWE4ZkJSVUFUOUg1Q0E3bEpuN0krUUE4eFJQN1ZFcml6cGRY?=
 =?gb2312?B?SnU5Sjg1cmhYR3J3YUxvMWJvVW5xR2RuMEg4SFNZSGIzVjJ4VG0wcUV0bTQr?=
 =?gb2312?B?YXZwU3hDSzhvYVBhRHBKY0dHRWFlY1FQRTV2SXBTUk9DV2IrUkFsWUdlUTY5?=
 =?gb2312?B?UmFBQkliRmpMYVA1dXNXY0NDQXc0REd4Vk1zaDdVZlNaN2xKMXFMdlpkd1Y5?=
 =?gb2312?B?UXAwUDZ2V0lGVWtoMmlVRDVLbUZveXdVd3BvY2piNkdiT1ZrY1ZMWXlxM3px?=
 =?gb2312?B?a0xjSWtZMlgrc3NNclIvaWpmY0ZZeGk4TnZOdi94dmpiTGx3b0ZWTEdqMXJr?=
 =?gb2312?B?V2lMaUE0ZCsrMkJMRUIzN1JYQWhYaXVNczAzdWhaZ2tYMVVBZUZRVTgvQUJT?=
 =?gb2312?B?NkZlZCtLclNTZVdWbm52QkRVTFFyZUFHRzZDOXhyL1NIT2V2bnZtMnYyL0FV?=
 =?gb2312?B?NzdwbXBtNzVNU2VseFpKdjZ4aUlTRm1hc2FHOGpxZkdxdEE1RjdnSHoxUTJQ?=
 =?gb2312?B?NnlaRWRCa3JpNGpqdldHUk1ESW1QZFZIblpHZ0lXMVFuZTRWU2V5VEVTVmI4?=
 =?gb2312?B?WTR0cThNVUdDSWxvMVR6OGJ0SHV0S3RTMktUdDRmRnhka1lQcHFsWEFKMFJC?=
 =?gb2312?B?M2ErNTdGQTgzZEpSbDIrZllDQ0VUNnRkNUhSZ0tHNkwyaUxvZGNqSFJwS1Jn?=
 =?gb2312?B?QTY3ZXg2blJMYUsxWGdDWVNXaU5IVWh5Wm1lcTEySFFDREdTck9PUkE4WDBE?=
 =?gb2312?B?bHpNWHNOZzFWUDZRRFpkVkxoY3JmalZZZGh0QkZCeG9sTXlvcWhXOTlKZUkz?=
 =?gb2312?B?UlpnWm5VYXlpeXAyN1l0aElmWmZScjdQYllPNDNkNHNZKzlHaTVWbTFxTkZF?=
 =?gb2312?B?MzRjODBYS3oxQXNnRUcrV2ZOMEhodTVmY2wzemxQR2J6dUdYWEl6bmhSQmU5?=
 =?gb2312?B?Q3ZLdWd0YkRNSjM1SWFYT0EybUhxMU00dzh1V0dRNHlqdjJrbVVQcEFhdXFP?=
 =?gb2312?B?ZXZCWEZrYUV2cit4cG5YWm45bVptbEdBUHAvKys1VDhTNFJNRGJOVzVpKytk?=
 =?gb2312?B?cmVWRWtVSktSOS9DZUpYRC9XQlUyT2dNeXRzdHYxTHI3amRsNDJaZ2d3QmNh?=
 =?gb2312?B?ai8zbThwVnFCOGxqUzUyRGwwZTRLZlJaNlZmUXNRbXBldUI4N3VQRlU3aTZ3?=
 =?gb2312?B?OFFTTkU1YzhVRG9naDRJdXhIYlRJSDhLUGNMZVBKd040M3lPSUlkR1B3U2U0?=
 =?gb2312?B?VnU4TlBQNzlnOWx3anhtMzlncjhmVy9sdjc5Z1Z1REZyNkFscmdhUm51akg1?=
 =?gb2312?B?Ty92bTJSRmw1THlRZVJGOVkzb3k2RlZzNkxnbjZudmphdE1DUjVwUytlbG9U?=
 =?gb2312?B?NDhYSnJjeEFXbUJQQk1Fd0dxWWRHaU8xVG1xeUU1aStSbm1UUW1wRUxRUENZ?=
 =?gb2312?B?bUo4MnowMVJtcjJ1QzdqdkJXV2M0V2pTSnpEbU8vSDgrZkhnUUdVd2I1QndO?=
 =?gb2312?B?SmdPd1VNWlQrUExaY2UzNnJHb2lybVhjUTBGMExMcGVDNE9TUjVRTXkvN1FM?=
 =?gb2312?B?blNQWjhxdUhQSlVxSS9SVDVpSHA3RnNHeUtCSFcvVmowY1Z5azM0V2xPUE9r?=
 =?gb2312?B?cjhheExmU0hHMlR1c0oyQll4UDhGYkdxVzlNYWs5MVdOU0I3ZGpLbVc5Y3lE?=
 =?gb2312?B?K0VXSm1neSsrajV3ZWxCeTd5V0VPR2l4bkhDc1NFeEVHeXkwQjVLa0t3UTJI?=
 =?gb2312?B?VzRJcFM3ME81SHVBZ2hORHpvUGtJanhwSHhsWnB4YnNYQVBWRmZIU2lyOTcv?=
 =?gb2312?B?QXZlTDNHSEdBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?QW8zMmM1Sm1ib0psZkhyZnZQNXdnWm1vSVhCZlR0N2FJYS84TUlITEg1eE00?=
 =?gb2312?B?RjVWeUg4NlVPdnJlTlNTVW9yam1XN25GUFlSdFpXVUZGU1V4bFdPN3A5dGQv?=
 =?gb2312?B?Mmg1dy9uZXNUMC85K3lkeFh4RERha2lHR1l5R2NqdnNUb1ozeE13ZkEzYXVE?=
 =?gb2312?B?YVl0U1BBWGN6bXdtM0o2S1VtVEIwWHJ5T05hS0U2bmZHSlQ3MlJ2SDZhSjFt?=
 =?gb2312?B?V1BJa0JWRXNSVXhTYkpUWU1ZRHJQS01SNEFtTytUSVhBbC8xdFFBdmdnRXZk?=
 =?gb2312?B?V0IvTVNPd1R3am5USTNMNDFEekpER0JqZko2WFFvVzRHbjFkbjJxYmZFV2tm?=
 =?gb2312?B?MFlCbnlqK04wMmhnbDMyTmxNNXRheHRPdWxGR05EelZiRjJKTUh6K2lQbGY3?=
 =?gb2312?B?ZGFHKzFSOFZ6UEVsUXgzRWp2cWFLbFFlVnlFNk5hdE11ZC9WbFF1R0tPUGM0?=
 =?gb2312?B?c0xGaFZkYmFHVGRubzlXQ1QxbDdQZjBmNFBUWlBicGFMUVdKRVpEK1hjUTdn?=
 =?gb2312?B?R3JOV2dRdVdhVkdieFo0SWJGYUVhQzdldFIrbzdHYiswR3M5VGpHWktRS0t2?=
 =?gb2312?B?T2xJU1RNa2NWMk5vcGpqdkJ2V2hHRndTeCtXT3BwZHAxbUd0VHpnMngyQXQv?=
 =?gb2312?B?SW9LUDNDdHdRM0N5WXpDTE9veG1IekRYTGoxNzNPTGxaZXo0eFArNDNwbzda?=
 =?gb2312?B?V3cyVmhNZkM4SVRsc2VpeFRuMTA4WFFQR3VkaHovMDg1dFdrS1Z6WFl3d2xZ?=
 =?gb2312?B?dmRGeTliWlNCSjZXL0VSVThyckVDUEVRUXV6aGxQQzUvSmVUNksrbnNxZkJL?=
 =?gb2312?B?TUhoYTllR2JpZmhuNFFLNFdXbHQveFAvSmNkV3JjUEdmZ3BCS0R4M2ZxdE00?=
 =?gb2312?B?YkVrYkVIYlBDWkJQSXRGc0Vkak5ENkttd2c0WXVsWXdPdHQxNE5oSU5iWlV3?=
 =?gb2312?B?RldlZG1QU0JRNXdrT0F3M05XMi9VTjQxK1N1OXJxRmJXcnd4SG1QTEd0eExP?=
 =?gb2312?B?ZmVONyt4VmkxdUp2SGRTamFNWDR5TW1FT1dmc09USUM1eENEZS8ySEJrQTRz?=
 =?gb2312?B?M3FFTWRUVmpZOGxqUFVKWUpBR3RHeHRhTGtrVXlaUHE2Y3U3ZkFVZlVxMXI5?=
 =?gb2312?B?ZiszY2Q4T3FGYlBEN3hJRjRiZFErTHp4Ulo5S3VYdHFYQlNtRDdtMU1xV1B4?=
 =?gb2312?B?VEpaTkFkc05DVkdHZkJQalJLeWhPREFEeFg4WWM3VDRiVDJVSlppRjBIeFJu?=
 =?gb2312?B?QTg4dlRORUViQTlMMGNzZ21relgxTWpaVzBHOFZMT0tmQmMxSUFUZkVpT3FT?=
 =?gb2312?B?STE4TzdsTlBjV2lXaGd1SWM4VHpRNlBwQ2tLTWpuRC9RdVVacTB5N0MzaGVw?=
 =?gb2312?B?V01EQ0R6cWtmL1ZjK2dRcU5IaHB5RFpaSGIzbXRaSGVvMUNCeGlZblJXeHJW?=
 =?gb2312?B?cTh4Rk9UNlJ1aUFFMjg2M0VGZlFnelkvdi9vYkJtbWk4Y1RsN3Z4QnRzYkZq?=
 =?gb2312?B?czFvaWQxMXYzZUJtNWpjV1UyTlFvaktVYlBDbkZLaWU1ellvTXBaZjFMbDUz?=
 =?gb2312?B?WE1aamltNjBZT3dRNkJDR3NselBFRDM3bjl1dGRrRDFuMUxHMjRpaGI4a2Zj?=
 =?gb2312?B?aFZiSVRyS1FGblFBT0pLUHQxMVl2bS9xWjg3QllkVzB1d3MwSTIxcWt2SWg2?=
 =?gb2312?B?UW9aZFpneFRMM2ZxOFNtWlB6ZEtyZGNEZERWQWNiWGtDZHNnRXRPZ2NrcXh5?=
 =?gb2312?B?NEVMajNNVWxwR3pWN3RObURrSHN6UHorWjhIcFk2akdka3VkV0tIaDZrcnk2?=
 =?gb2312?B?UFNrSHlXcHZvMWQ5L1pTZFAvcVJzaTJxNE1WNjFqaERMTWtuK0FsR3FFUU0z?=
 =?gb2312?B?NDkxeGY3azJyaTlHZDhEVTdMclJVYkszMzJXMGJ2OHJRYUpuamIvemNKaDdi?=
 =?gb2312?B?Tm9vUWlEM3BqaXl4U0hEV1BqYWtJS1FKN0RXelRSRE9DdG5yZ3p1Rjg1djhk?=
 =?gb2312?B?SzNEb2NyRWE1c0ZDWGUvWGw3dlhXVUxETXNxRHRCRGROdE5oV1dTaDJKWVIw?=
 =?gb2312?B?L1lMTnRqcVRYc2VqSjVaL05hbkRhWU1Jb25UWU9OYU02cUV2M1MwaGt0RmhX?=
 =?gb2312?Q?6hoM=3D?=
Content-Type: text/plain; charset="gb2312"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 31283fda-fd65-4e9a-40f1-08dd97421d74
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 02:00:37.4064
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QN1StcoDBfIRaSFL5cac7gFXkqRvdDJRlAF3qFp9DkQO1XhAgGbfNYioce63Bhw7LWq/q7JWufexRidK8T/yEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9487

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9y
QGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjXE6jXUwjIwyNUgMDowNA0KPiBUbzogQm91Z2ggQ2hl
biA8aGFpYm8uY2hlbkBueHAuY29tPg0KPiBDYzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9y
Zz47IEtyenlzenRvZiBLb3psb3dza2kgPGtyemsrZHRAa2VybmVsLm9yZz47DQo+IENvbm9yIERv
b2xleSA8Y29ub3IrZHRAa2VybmVsLm9yZz47IFNoYXduIEd1byA8c2hhd25ndW9Aa2VybmVsLm9y
Zz47DQo+IFNhc2NoYSBIYXVlciA8cy5oYXVlckBwZW5ndXRyb25peC5kZT47IFBlbmd1dHJvbml4
IEtlcm5lbCBUZWFtDQo+IDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+OyBGYWJpbyBFc3RldmFtIDxm
ZXN0ZXZhbUBnbWFpbC5jb20+OyBTdGVmYW4NCj4gQWduZXIgPHN0ZWZhbkBhZ25lci5jaD47IExp
bnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz47IEJhcnRvc3oNCj4gR29sYXN6
ZXdza2kgPGJyZ2xAYmdkZXYucGw+OyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgaW14QGxp
c3RzLmxpbnV4LmRldjsNCj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiBsaW51eC1ncGlvQHZnZXIua2VybmVsLm9y
Zw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDIvMl0gZHQtYmluZGluZ3M6IGdwaW86IHZmNjEw
OiBhZGQgbmdwaW9zIGFuZA0KPiBncGlvLXJlc2VydmVkLXJhbmdlcw0KPiANCj4gT24gTW9uLCBN
YXkgMTksIDIwMjUgYXQgMDI6MDM6NDNQTSArMDgwMCwgSGFpYm8gQ2hlbiB3cm90ZToNCj4gPiBB
ZGQgb3B0aW9uYWwgbmdwaW9zIGFuZCBncGlvLXJlc2VydmVkLXJhbmdlcyBwcm9wZXJ0eQ0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogSGFpYm8gQ2hlbiA8aGFpYm8uY2hlbkBueHAuY29tPg0KPiA+
IC0tLQ0KPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3Bpby9ncGlvLXZm
NjEwLnlhbWwgfCA2ICsrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2dwaW8vZ3Bpby12ZjYxMC55YW1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZ3Bpby9ncGlvLXZmNjEwLnlhbWwNCj4gPiBpbmRleA0KPiA+DQo+IDRmYjMyZTlhZWMw
YTM0MWE1MDA4OGYzZTQzNTJlZDRkMzZmNjQ5ZDMuLjViOTgyMjg0NjZjNjQxNGJlNjgxYzQ5NA0K
PiAxN2JiDQo+ID4gZGQ4MmYyYzQ1NzU2IDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlvL2dwaW8tdmY2MTAueWFtbA0KPiA+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlvL2dwaW8tdmY2MTAueWFtbA0KPiA+IEBA
IC03MCw2ICs3MCwxMiBAQCBwcm9wZXJ0aWVzOg0KPiA+ICAgICAgbWluSXRlbXM6IDENCj4gPiAg
ICAgIG1heEl0ZW1zOiA0DQo+ID4NCj4gPiArICBncGlvLXJlc2VydmVkLXJhbmdlczogdHJ1ZQ0K
PiA+ICsNCj4gPiArICBuZ3Bpb3M6DQo+ID4gKyAgICBtaW5pbXVtOiAxDQo+ID4gKyAgICBtYXhp
bXVtOiAzMg0KPiANCj4gRG8gdGhlc2UgcGxhdGZvcm1zIGhhdmUgYSBkZWZhdWx0PyBJJ2QgZXhw
ZWN0IG9uZSB0byBiZSBhZGRlZCB0aGF0IGNvbnRhaW5zIHRoZQ0KPiBkZWZhdWx0IHZhbHVlIGZy
b20gd2hhdCB0aGUgZHJpdmVyIGRvZXMgbm93Lg0KDQpPa2F5LCB0aGUgZGVmYXVsdCB2YWx1ZSBz
aG91bGQgYmUgMzIsIEkgd2lsbCBhZGQgdGhhdC4NCg0KQnkgdGhlIHdheSwgSWYgYWRkIHRoZSBk
ZWZhdWx0IHZhbHVlLCBmb3IgdGhlIGdwaW8gcG9ydCB3aGljaCBjb250YWluIDMyIHBhZHMsIHNl
ZW1zIG5vIG5lZWQgdG8gYWRkIG5ncGlvcyBpbiBkdHMsIEkgd2lsbCBjaGFuZ2UgYWNjb3JkaW5n
bHkuDQoNClJlZ2FyZHMNCkhhaWJvIENoZW4NCj4gDQo+ID4gKw0KPiA+ICBwYXR0ZXJuUHJvcGVy
dGllczoNCj4gPiAgICAiXi4rLWhvZygtWzAtOV0rKT8kIjoNCj4gPiAgICAgIHR5cGU6IG9iamVj
dA0KPiA+DQo+ID4gLS0NCj4gPiAyLjM0LjENCj4gPg0K

