Return-Path: <linux-gpio+bounces-8564-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE9F947346
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2024 04:08:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A15A71F214BD
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2024 02:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C84B037171;
	Mon,  5 Aug 2024 02:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JgX8q69b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2040.outbound.protection.outlook.com [40.107.247.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4A2EDC;
	Mon,  5 Aug 2024 02:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722823711; cv=fail; b=NJe0FwWmyu+oQyyMbkZ/qTNOoglsya69LAK/PdIqphxKEukhtnStA1e23iqp3tMgV+wYOYqU9ZwbMtVeJQvEUjFTX0BHJb209nSFhICXc6IPRVBD+uzCLgICqILR7Kt14rVQ/dLzjT2OFOcYaPw8PbtUHQLKws2aJ7DCwEptpjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722823711; c=relaxed/simple;
	bh=2YbvaC5h+j02yEOTZdeYjg4lgq0tZMe65qYKmMu4qmQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZCoGm+1FQRGTe784AXhIzousdbtEyKqWgZe9Ll8vQ33fpCiR3Bihpa585f4W8+S48bEvmaosB6P9y9Kp46GBtUEhHB0KUQ3aCf5feKlAdrZiYv3D0Jj9LldYyreG6wZTFdTfMKeKTWd852impUZNy4I4u09UTIDbbIW/eE7WUYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JgX8q69b; arc=fail smtp.client-ip=40.107.247.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bgvnbrpqhy8FWWfG9BVOtggWIy/T6bDWv6yX6GefOeGu64yy8xSLCrmoTJXEWz1Zo8BWBFcpC1lqJ+yvxxxczqOiH0+3BrYgHoJYXL3Pd/5otkZeZd4bw66HukQ00SDR0AXx56ainwjMse5Ig9Y4n8uAKF8Wv0j8J2j7p7U+mrLuGt8QKe2Vq1XmRcqJk04Zx5dHb9OvX70VlnYL4987wZsCEn36BBPyjnBdQkKsnEjmdyRyJt7MwSnPd71audVtHIXKPYzRQnXKqdwsBziY34CuN8aCk55mi8ezlF2PDqx052t0Ni/lbQINe43LLDzYf06U6Bx3a74P62eFnM+hbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2YbvaC5h+j02yEOTZdeYjg4lgq0tZMe65qYKmMu4qmQ=;
 b=PnD+R7wRbzpoPkcyWEjQN5LL2WJoSvAb5NgRWoyQ6mgAS+Dr41YOK2vcofSB4FMddClQDy1x0Vq2YiJHFLT00CiM3uM07zvI/6VykKJznBaY6zPn45qZNN+8JKzV0Ph2X5iGLVueJFdppJj5a7GdkwebaMcAbCostfhIIucV+VP6Mt6CIDqWrYE1+3aOIwCsbzmNlYAQSOuVPUN/hs4pGOmt5DTCsILBMJnjwK67EsIW+BtyTJdaXnjEvi68RTQy4xr9VR+2GTK6aS7IWouhD9Mz/9MwC8dt9ywjZZTR/3SM8blxkgBhwCJ08YMkS5k02xzHG7i4pS2SRbRmd2gfeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2YbvaC5h+j02yEOTZdeYjg4lgq0tZMe65qYKmMu4qmQ=;
 b=JgX8q69bNfjpOxvK4/48oUtrrL3EZh/5t9+xES2AQhxHip3zVVY3qnA6BTOHeEKQcVorl7qs+WOwsnNXVUS6+NHPFH/49MFNUQVr5Emi68Fr//bF/9Oy3PiOLYFM8y39410anIdVO3Gbvjm+aNHvswlEWQJInuh/mJf610j4XsiqenKba/lYtcLj6k7ILUd4kYOSfnVFoWZ2e14okjYQvMG/bJ+jOhDIWWVrbzlWEoaBnkzBqKzDSZ7kx4dbu6wy5tu4GJ5ULPedF7JnytExbMarmnMk/rPkLtWbRHjd0Tr6NYzNQ8TyQ4aLl5Ypxx2XYYWv5iOoJab1JanS7MpoOA==
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by GVXPR04MB10900.eurprd04.prod.outlook.com (2603:10a6:150:21c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.24; Mon, 5 Aug
 2024 02:08:26 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334%4]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 02:08:26 +0000
From: Bough Chen <haibo.chen@nxp.com>
To: Stefan Wahren <wahrenst@gmx.net>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH v2 2/2] gpio: vf610: add get_direction() support
Thread-Topic: [PATCH v2 2/2] gpio: vf610: add get_direction() support
Thread-Index: AQHa4/V1L25YqFOP0UC/QKipx5gaSbIT9gKAgAP58yA=
Date: Mon, 5 Aug 2024 02:08:26 +0000
Message-ID:
 <DU0PR04MB949645FC8DDB14D7976D594E90BE2@DU0PR04MB9496.eurprd04.prod.outlook.com>
References: <20240801093028.732338-1-haibo.chen@nxp.com>
 <20240801093028.732338-3-haibo.chen@nxp.com>
 <50b97539-cef2-4a75-a750-96adc2467f67@gmx.net>
In-Reply-To: <50b97539-cef2-4a75-a750-96adc2467f67@gmx.net>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9496:EE_|GVXPR04MB10900:EE_
x-ms-office365-filtering-correlation-id: 2b550491-127e-47c5-97ea-08dcb4f37dde
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?L1BtUWxLNURULy94STJ1QWdaTy9MOVlEeFlmWXp2SUxDb2diVWVzRTJxWk9H?=
 =?utf-8?B?UTJSOVR5aXU1TXNmcjNxSG5VbjdadHJjOFBtYmpCdDh4U3lmVkNJRnlCT1B0?=
 =?utf-8?B?SnZTamo4RVlsajZ3QVBTNHI1VWVXQ3ltY29uZHRCUXpzakN2U0s3MmIyMkpR?=
 =?utf-8?B?ZCtNYjhDZ3ludEhlRDh4UlZDME9UU09LSzFEbHh5RHRaNVplRnZWNURzcmhp?=
 =?utf-8?B?RXh4WStPNnZoVVV0RG52KzBjR0FVZlJ0T005cjVRNlFpa01uNWo2SDM2TzhH?=
 =?utf-8?B?QnNWc2o2QkRTSVpndXNhZSs4aEpDYWlyaEpMUk9vbFdzM1M1bFJhQXpZaEhI?=
 =?utf-8?B?UFFNYlg1N3VxdE5FYUx0aDBBaXNjME5DdC85bEI0eFMzZFgwQTUvRy9qM1Fv?=
 =?utf-8?B?UVRMc3k4S0hQZ2dFZVRFZVpJUmVjdGNIdjZpejVCV1RZTHZ2aE1CT1dOVDZk?=
 =?utf-8?B?MlBKamluTjZPL2dLenVNWXpIUTE2R3lLQ2wwWmR3c2l2aXpPWU1sRnZta1BT?=
 =?utf-8?B?RjNXRlBqbndrZktCckl2aC9ZanUwMDFJSUtybGlqUXBncFVJTUNCZzJtNzFi?=
 =?utf-8?B?aEt0aVh5OWdMbHErcmxGeDlWUnJFaVZMYzVSbkVUUXlhbStJb1QyelNxSzhz?=
 =?utf-8?B?UnFzVXBTUkhDTHdQV25Gc3UrV000Zm11aHA3d2tPTlJnQzlYSWs1dGl2bDly?=
 =?utf-8?B?YlhBTzNudzJ2bGVjZXVHRjJETnZJVWxsR2ViR1hEWXJXbnN5UllaZTRXNWdT?=
 =?utf-8?B?OXJEQU9oL2hMS1NiWjQxNWZteFJaU3hNakFqbE56NjNhc1FYcW1rNmQ1bFV4?=
 =?utf-8?B?eGFPTk5zNGxvQXdtcU1nblZkK0xlOG0rcHpjakNlR21PSFlSTzZzK3ZOQW9l?=
 =?utf-8?B?K2dHcVdrRVc0dUlQSy9tclRlRll1Z1hKdW52MDUyRzdKelllZWZoMEljdk1N?=
 =?utf-8?B?NDhEeWJVNGVrRys1cmtEQzg3T3J5cXIzZ3BHdzRCa2dpUjcwUlhrT0dKQ054?=
 =?utf-8?B?NzI2Q2JLenJqc0ZEZnNXN2k1Z3EwbkhTeTg1Tmx1dEVZTEdwdk1GSUNOWTMw?=
 =?utf-8?B?V3h4eVRqM2p3UEt1ZE9SRXovLzhFWlRkVDZVcHpGL21ROWFxeDlaQ3pnaEhH?=
 =?utf-8?B?S09nYlNYSFJPT2NnR1VxRDUzQ29RRlBveGJxZjB6WlczdnNKdmVNZHd1U2lX?=
 =?utf-8?B?Ky9PWVVKR2NGbzNSNTBHMVc0SXowK1E5alA4WHJZR0JjeDYxakYyTWpGeXI5?=
 =?utf-8?B?cUJIdGwyajViUFEyM3owQXpwRzhOOEh4WE1PdmFGa1pzemdzSGlpc0o2ZmJJ?=
 =?utf-8?B?b1NSVTVCWUR6REVCZDJncytUZUMzTGowclVHUFQyelZXRE01ZVArNGNiZW8r?=
 =?utf-8?B?L3VCZHlZNU95VVVTcjc4SCs1dktKQVdKVXJBRWwyS25uNXYzUkRUcUdLQXhL?=
 =?utf-8?B?cit1UitHUXhsdXhPZktZc0ZwcktwQTZLeTJiQ1BMS0gwVGVTQk9mUkswUDVZ?=
 =?utf-8?B?UXNnd0Y1MjMwa2ZZK2FETzFVeGFuNFRmejFScURhZnRnVko0blFYRmVCZnY5?=
 =?utf-8?B?N01uZmNXb0VkNWhFU1ZwWjY3Uk52azQraHZ5Q0VWbmlZOVFDK0hiWXdhUk9l?=
 =?utf-8?B?Rmp4ZGIyaFNjUXdhUjNWY2wyM203MzA4Y1lBZ3BMdEVQN2xVaE1UVkNlMFpS?=
 =?utf-8?B?KzZWRTlvUFp1aVJmdnZLRllOSGpvMkRXMmFaY1EvLzBRdEl6NnRER29qN21h?=
 =?utf-8?B?KzgzdVNGWm8xdVpObzg1eVJ4UGpaTVhMc3ZvSXAwSmdUcFJxV1F4dDB6TnFh?=
 =?utf-8?B?S0lwS1d1TkZGWVBqR05WYW5oRHJhZVBDUHVpaDJUMkE1emN5bzFWWFNENnhZ?=
 =?utf-8?B?OTdOcTRTem5qRWZaQmpteGREVXpNT3NNSE0zQmNLM20xdEE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cERuSkJ5ZHFKQU85cS9pSy9HYVc2bGlGSnBGTGtENjV3VG1mMDhYK1ZKd1dB?=
 =?utf-8?B?TnJ4Wi9KdlVaSVFiTjhOdTFla1hhSWFHQWVpVFlMbklmcC8rdnVlVm52aXNS?=
 =?utf-8?B?ZGo3Y1kyMlhUZDYvdWFibnJKTDZpSFBhQ29tKzZBVm9POFg4eHUxWHBUZmRN?=
 =?utf-8?B?RUJQVjY1ZUlubVlNTUJhNlIwQnYxUEdFZzlodUJhV0UyMkNzVTVMTHQvOWI3?=
 =?utf-8?B?K2ZVQWZQQUVwMnh0eEV2Uk9FYWdTWVRabWRGUGhrRU0xNUtVYXJwOGhNc3BQ?=
 =?utf-8?B?M2tka0N1UXpYQUlwSEkza3NQSnhHMjZ2NVRkUFpmQWZjQ0l2allWVUt6d09u?=
 =?utf-8?B?enZqckJDSXZHSVFHR2Jja1YrL0hyc1cyNkdIblljQWR6YmRES00wZzYrR1I1?=
 =?utf-8?B?Sm8remlnUXJtNFFpb0N2UEcyRE9zNHZIU0N4TW52WUFUT0l4c3VzVUhLWXNT?=
 =?utf-8?B?MUVQRFZ0T1Y3NXhCUmF0ekhqdW1odkppalJodjZWajhGM0JpQU9jbGV5bGVz?=
 =?utf-8?B?Nm1LWm9OSTgyazZLL3duNGJseTJlRFNreUZaMmlKaHBLQ0Rkc3U0MFNNNEJh?=
 =?utf-8?B?T0E2ckdYMkhuM0FRQnR6bFNCb3JZTDhxc0NQeEdSTjFyZ1lNRm1QL0xyYTMv?=
 =?utf-8?B?dk5XN1VUNGZLQy9mUWc2NXF6ZVRNNTRGNVdvVkpMb2VldW42QWFvaGRkR0la?=
 =?utf-8?B?NlNvYTBHSVA2Ym9ZMVlKeUhQUkt6U2NDWnNXc3kvUXh4RUlhc1JRcVNJQWEx?=
 =?utf-8?B?U1AzVW43dStiZGszdm9NT2VDSnNFMm0vendOQW1qMkRnamswMXUxcWo5NVdL?=
 =?utf-8?B?SUpKUFA1VG5ZUGZTU1pCNFplMXFvSUVsa1h3cU00SWlPcDBYUTJXNEhGRWFx?=
 =?utf-8?B?dE16ZllWQzNEU0R4RUJ1RG5FS2hnVTVUa0Y4Ly9FOFc4cVovdURlckRsTTU0?=
 =?utf-8?B?RlQ5eTNtbTlCam9LNFNvRXgxWFF6VTZHeFBpblBJL293UHRXM1ovNjFERVkx?=
 =?utf-8?B?bGRKdThvQmhIKzI5SktqaTV2L2R0QW1KZHZrYnZ4Mkc5VjljVTRBaHRPRmpS?=
 =?utf-8?B?TEEvYWJGekVLYVBmN3RUR2ZIVDg0MFdQMVBaeFI1K0FiVlk4NjJkRUxid003?=
 =?utf-8?B?U2tGeTVENldIT1dpeVJCc1R0RXptQTNjcHdkcEQ4QUNtK29lbzVtRVR2Z29I?=
 =?utf-8?B?eFBqSFRvWDE2c0lxSmc4Y0xDZTB5U1JELzAvSHJ3N2ZQbUlzODJxRXU5Wjhu?=
 =?utf-8?B?bnZlSlNUWmxGZlpvS2NLWk04OE1QUkYyTzN0MTl0MVhGbGdyYmlHbm8xVUZI?=
 =?utf-8?B?b3dONGk2bVFFTThVSzZyK1JLZVlGR1o1N255TCtTc0MrWXVBZ2ZHc2thTmph?=
 =?utf-8?B?MmdWNi9uZHgxMkxmSElxdnJ1TmxjNDFDeFMrZ2pvUXkvaHdPL3BOVjJ5THBP?=
 =?utf-8?B?V29pK3hoRzZjcHN6NzdkN1VJQnZZZGp3Kzc3akp1c0h1OHgzQzJpdUFkVXRZ?=
 =?utf-8?B?MHA5SllRY2p4c3FqZ2pBL2Frbi9BLzQyaU1RcWNraWM4V3BMSTJGTjRzUG9t?=
 =?utf-8?B?NGFqZFN0WVRicTloU2FBWWl4MDJWNVExcjZSaVlwcmM4VXNOTzdwNXVSdU1v?=
 =?utf-8?B?TFp3SFRMeTVtUEpCRlFXR1dOMTFCOG51TnJHaDZDazZiUnNSc0JRK0EwaCtx?=
 =?utf-8?B?VVYxY01aK0pSdWxhaHJ3SHNGUEtPRm1aUmdDVU9zYVhEL3lmWkpDN1VLdlB5?=
 =?utf-8?B?dm52cVRYVHpSdXlBdG4xL05qNGxheWx2OENXdWwvd3QxaVZDWTZwcTEraUdZ?=
 =?utf-8?B?c2tReVZIbWc0a0taalNxeTg1TkcrYWxHOGlSb0ZIaE91c1Z2bkd1a0JjN29z?=
 =?utf-8?B?S2pGM25HTS9DblVGUHhqOU5HWmlwd1d0YS9VKzhZemsxWHNvMDBkYnZsYXhm?=
 =?utf-8?B?YjdFdUNUYU1FVkpNZW9mZVBCUm16SnJ2YTI0Ujl5Y0tTSGdPckVyMFNMc2Nt?=
 =?utf-8?B?dmJqdDlvd2JWd01zeEhzVVZ5aU5RS0FwMDI5SGxIa1UxZ2VNNUFMZVV2Nkxp?=
 =?utf-8?B?YkVYQ1g4V3orcHBHclo1bmRXVjFxek1BQU93M3FPT3R6ZVFvbWxDR0dBMlly?=
 =?utf-8?Q?pCAw=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b550491-127e-47c5-97ea-08dcb4f37dde
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2024 02:08:26.1537
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +pOmKy44zV1DYnbnlOhWssMm76sYqCuIIARsUwnPoWdR8gz4gPDVGXNgaa0WtD8ib5FQ2l6+2XvQ/UgqmDi+cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10900

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFN0ZWZhbiBXYWhyZW4gPHdh
aHJlbnN0QGdteC5uZXQ+DQo+IFNlbnQ6IDIwMjTlubQ45pyIMuaXpSAyMToyMg0KPiBUbzogQm91
Z2ggQ2hlbiA8aGFpYm8uY2hlbkBueHAuY29tPjsgbGludXMud2FsbGVpakBsaW5hcm8ub3JnOw0K
PiBicmdsQGJnZGV2LnBsDQo+IENjOiBsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZzsgbGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gaW14QGxpc3RzLmxpbnV4LmRldg0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIHYyIDIvMl0gZ3BpbzogdmY2MTA6IGFkZCBnZXRfZGlyZWN0aW9uKCkgc3Vw
cG9ydA0KPiANCj4gSGkgSGFpYm8sDQo+IA0KPiBBbSAwMS4wOC4yNCB1bSAxMTozMCBzY2hyaWVi
IGhhaWJvLmNoZW5AbnhwLmNvbToNCj4gPiBGcm9tOiBIYWlibyBDaGVuIDxoYWliby5jaGVuQG54
cC5jb20+DQo+ID4NCj4gPiBGb3IgSVAgd2hpY2ggZG8gbm90IGNvbnRhaW4gUEREUiwgY3VycmVu
dGx5IHVzZSB0aGUgcGlubXV4IEFQSQ0KPiA+IHBpbmN0cmxfZ3Bpb19kaXJlY3Rpb25faW5wdXQo
KSB0byBjb25maWcgdGhlIG91dHB1dC9pbnB1dCwgcGlubXV4DQo+ID4gY3VycmVudGx5IGRvIG5v
dCBzdXBwb3J0IGdldF9kaXJlY3Rpb24oKS4gU28gaGVyZSBhZGQgdGhlIEdQSU8NCj4gPiBnZXRf
ZGlyZWN0aW9uKCkgc3VwcG9ydCBvbmx5IGZvciB0aGUgSVAgd2hpY2ggaGFzIFBvcnQgRGF0YSBE
aXJlY3Rpb24NCj4gPiBSZWdpc3RlciAoUEREUikuDQo+IGp1c3QgYSBxdWVzdGlvbiBhYm91dCBo
b3cgdGhpbmdzIHdvcms6DQo+IA0KPiBmc2wsaW14N3VscC1ncGlvIGFuZCBpLk1YOTMgaGF2ZSBQ
RERSLCBzbyBHUElPIGdldF9kaXJlY3Rpb24gaXMgaGFuZGxlZCBpbg0KPiBncGlvLXZmNjEwIGRy
aXZlciBmc2wsdmY2MTAtZ3BpbyBkb2Vzbid0IGhhdmUgUEREUiwgc28gYWxsIEdQSU8gZGlyZWN0
aW9uIHN0dWZmIGlzDQo+IGhhbmRsZWQgaW4gcGluY3RybC12ZjYxMCBkcml2ZXINCj4gDQo+IElz
IHRoaXMgY29ycmVjdD8NCg0KWWVzLCBjb3JyZWN0LiB2ZjYxMF9wbXhfZ3Bpb19zZXRfZGlyZWN0
aW9uKCkgZGlkIHRoYXQuDQoNCkJlc3QgUmVnYXJkcw0KSGFpYm8gQ2hlbg0KDQo+IA0KPiBCZXN0
IHJlZ2FyZHMNCg==

