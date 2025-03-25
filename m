Return-Path: <linux-gpio+bounces-17959-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6A0A6F236
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 12:26:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8296916B894
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 11:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C7CA2517B3;
	Tue, 25 Mar 2025 11:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="V2ZKYAok"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2055.outbound.protection.outlook.com [40.107.22.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37722F3B;
	Tue, 25 Mar 2025 11:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742901991; cv=fail; b=nZqDgF0Lsn+qC5wP2d2HcwXGjk1/2mP2RjRy2h5/DSLvreeZT/Du2LRbTMxPyCZ7Vsxo/Bden8s/WyH63nf3l6ShCgcAgm1krFUeTLV17JmPLhKiFrsGiCdhvH1jXnDOaPzBUBSM5LPysutI1FVLDJcXHQLgGbvX2yMSa3wSrp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742901991; c=relaxed/simple;
	bh=R+xJ/Bg6YuQ+o8dPg8YSE4Q7qfDapT1yLsyAe350uoY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mu05pzuWyeZfAMNc5G7RFzGRPkA8bp8rcv3ct3L9UXUirLhzEthhIuwORdcTn+M4sIqgyCT8wVsUhbHSWwLevtqgTqQRDXBFGVz5l4Z7Crin5i/4jjbuKH0ZsbszV4BElJkqAHFS23oiLV45Oh5dwDLqWRAUWoJN41awmhY4GtE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=V2ZKYAok; arc=fail smtp.client-ip=40.107.22.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OksSnW3SxlvPmDSI9pAp3c1MZratNOCJvc5qWov4IcT1vWv609UOmXVrs9xCT9mQoMStn4gEJoDvCvybs29RZy0Xv2ZF86P+v3RuMeKnnJtdQz6zo4BUiV/H5i9pJj/zVcHIPrVAM24HN/yzaQMzFxRgYAKNkVeWyGl+/RiKYG4mpb1WRJY6JfTzj1zf382TrlAjKeIYE8352bf261aKVW/+247CTvJGPz1k/jsIOAuuJXcDYXZCADlYRNhG0VSWzYKS6jteL029Gck5QRNvsSwrzJXhoa8cLOrq9de387ZXqUYFBzIUX0O6Gg7gSJoVPLP0V3/SYyOrPmITdqmPXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+xJ/Bg6YuQ+o8dPg8YSE4Q7qfDapT1yLsyAe350uoY=;
 b=a2McbqgGTM1vUDHUqmEVH3mA58IVe0r4I0fO+abHHdXhTLSWCdaKt+aHgVshdZ+jrLD6DOwPp4S47k47xnVNGYnjcwsDODW140uzW3Tft7d+cuslQVXkG0EUaEZfO5WEg7esya6MeDzWT27aX7j+AFWgLr4vE0nw1ym5qKuRlDek1UNtJszjT4CRExeoxuNVKcG8TjrwuB01TWtUUtixMAo1lMXqdxIspyxWMKBmEIr/Zd29cUyGj7KKuN4qTPsQx5TjVnuUqKrTTx0IJy0dFxHCu/tSmWWRtxIIds/1vnYvQnykWf9TIgJz4n18BmV22fCMLoe0fZKpCGejgGWESQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+xJ/Bg6YuQ+o8dPg8YSE4Q7qfDapT1yLsyAe350uoY=;
 b=V2ZKYAoktqI9Bury9MjB8phDqXQ4wtfz5Sr/086gnwV+6cTZSur2fgAHku8KYdS0u7pv8McwgXeFrB8WBpi0Si9xKrnEE+bXJR5Jus3duSSLx7pZxxfA9UPiN4y4MHiZH6PAtUXULFZRjC2XCs0fbb8iwK6bhvKXPjUTsW7dNLG8AA0fYIOqi/koEGbi6vd0TaKa3wWO1iBdAov4fUSA6ytav/HFzSb12lyoqVie7NN21jt0mlECDx242U2ZjaKGsMkjgxhOyRpBbvxKd+tYbvvrbzzIdYbIqRR3jKGEahUXSsYz4S1ii6KEFPwYHrVO4DLN+bg3XTYP7kZY3IAlqg==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM7PR04MB6776.eurprd04.prod.outlook.com (2603:10a6:20b:103::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 11:26:26 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 11:26:26 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: Andy Shevchenko <andriy.shevchenko@intel.com>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>, "brgl@bgdev.pl"
	<brgl@bgdev.pl>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org"
	<linux-samsung-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>
Subject: RE: [PATCH] regulator: s5m8767: Convert to GPIO descriptors
Thread-Topic: [PATCH] regulator: s5m8767: Convert to GPIO descriptors
Thread-Index:
 AQHbl8aNtQhQNM9MgkKKKzIX+U7Uq7N4r1yAgAAjdTCAABZhgIAIz8oAgAHofwCAABxcwA==
Date: Tue, 25 Mar 2025 11:26:26 +0000
Message-ID:
 <PAXPR04MB8459BDF97DAA5FC1A3A8B7AA88A72@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250318052709.1731747-1-peng.fan@oss.nxp.com>
 <Z9lJETLh2y27934q@black.fi.intel.com>
 <PAXPR04MB8459A44864B9213E8265137188DE2@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <e3abe8cc-357c-471f-b489-e1a8625933e0@kernel.org>
 <20250324033038.GA9886@nxa18884-linux>
 <7f22be3e-908d-4036-ab92-97c6b0427d26@kernel.org>
In-Reply-To: <7f22be3e-908d-4036-ab92-97c6b0427d26@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AM7PR04MB6776:EE_
x-ms-office365-filtering-correlation-id: c911e3f0-a27c-478a-cc0a-08dd6b8fe16d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZDVEaytpQTlSNzRvNEdWQ21mWnlPMk5FVmgwNTBCbUNJQnJnU2FrQWZhd0Nl?=
 =?utf-8?B?OW9UcHZ2Q3REcTA5UFMvbFhuSFMvZldiMXZhR0NvenBONUVSZVU4ZzN3YUcz?=
 =?utf-8?B?YUhFZHBJVlN0VW1xTDZWRy9oTHpnM1ZOSVBGbWhpS2ZaMnh2VkwwZ2h5ZFFh?=
 =?utf-8?B?ZjF2aEdTQVJCTy9zeDZzSG9mK0tJM1poaHJ6UGMxQ0RiQzBMQzRKYXdYMzFx?=
 =?utf-8?B?Y2ZxS1RVUy9veFp2V2l4dU5pN2ZmTjNnUEVsZHY2V05hWXRYdHIzRmNBNkRX?=
 =?utf-8?B?QThZSWNldUloc1E0ekl1allBbmU1K0RoYVpGcDJnOFZ1R1hYWXZOTkdmbWJB?=
 =?utf-8?B?RmRPRE1XTUx0YmhNVnA4S2dFenpXbW0weXBINnRtOWtxKytWQ3gxMnIvRGJD?=
 =?utf-8?B?SmFDMTczYWErRGpyKzhndGd3UXFBQk1oMkFPbklJcDFOa1lKdm93dXI0bGE2?=
 =?utf-8?B?YzZJYUFMR1pHa2NpS3BnUElHL2RNOExIcUFSWUEwaCtSRS8vbTBNU1BFMlla?=
 =?utf-8?B?cjU0RlFDM0JHSEdaNHVZY1BYQ25UaENVL0N5QlByUmRkRjlBMVBFYXY3Q2gx?=
 =?utf-8?B?RGEwYzgxMWNSOFR5VWUwSVgwOGdoTUNWbUw5eHU1aUt2cjRpM1p4TXRMbmRu?=
 =?utf-8?B?VitpcFJMNlV5S0JMblcxOU8zbThiN05VdGhwZ3g1Tk9FQ3VhVmZYRGErdElw?=
 =?utf-8?B?ZTg1b2JEdEZrTndPeVdKKzA4UjREb1VZU3owUi9FZ2k3bmlSOWlEbkw4aDc0?=
 =?utf-8?B?cDhwQ1Y2MCtvbkdOcmlweEFQajVGdmptNTRpdVQ4UnRxWG8venlxam9OYTFX?=
 =?utf-8?B?TkdHaEN0ZEExOFBTWnVvRDZNZEprZEt6ckdqZGlQL1c0VTZ6cjFWWkpnSlhi?=
 =?utf-8?B?VUxaWC81bnpxUVlUZGEvc1NZWkNycUV3b1dqdlJLQVpqVkU3cmNwRnFEV1dt?=
 =?utf-8?B?ODdWWGlXa05TQnN6c1RYeVE4Q0FXdUNwck9jT2Q5K3ZScDk4ZTYwWXQ0RFR6?=
 =?utf-8?B?eExhZWYwK0I1L25BVldBb2preW9mRy9RelR0Z25oa0JWLy9ZQUdNT29PUTh1?=
 =?utf-8?B?VFpZM3ZZQTZGcGpNOFRkelZ1bDg4M3kyZmdXUlk3cVNybFBBb2o0R1RDdGtC?=
 =?utf-8?B?aXo5Um9xRE1PdGtDclJxSFN2eU1KcnpOOUsvSDNlSVAvT0wrT052TmFvdjFt?=
 =?utf-8?B?Nk5KNnRBZHVhYS8zM2tIZmhBUWtxVis0MDlVYVBCYUw3U05FWFZEWWZYWWZQ?=
 =?utf-8?B?ZlB5amx4aXgwbm1DUzJhWUdaMVllVjdodUtJYWtieG50d0d3Q3I5Z2pRL3I1?=
 =?utf-8?B?QjJET0FVVVNpVHFtdG5rVERJVU9xOUFuS1hIaXdnSVIyUzl6TDd4TFE4c3Yy?=
 =?utf-8?B?Mis5eHZxREZ6NDJYZndLanlJeXNtOERGZ21IQk5ualZZalBIODFXVTd3TzUw?=
 =?utf-8?B?NHZiUXVlNzJPOHBvQ21YcUZLZk1oRW45OGlLbGFxY1NIdGU0Vm8yZG9jODdh?=
 =?utf-8?B?RkFLNFFiMDhzOWNOOGdNTGJpQ0tqRXU5TSt4MWF3UmZHY21IYm5tcnVuaUpS?=
 =?utf-8?B?UkVYMlpvUHNOeEh3TjBkOGdOaTRoYVF4YTBEQ3VLM045ejhzSjlWZk9FUklT?=
 =?utf-8?B?azl6NXBWN3I1aEEzc3ZmSjNEa0pBMFRNMTk0aE4ya3dnMDRrWDk0V2tEM09F?=
 =?utf-8?B?RWQ5S2NhM0JSUC9MT2R2NUZOMjhnZDNaN05EWEVEL1U0dTkyYW5TMHptMDg0?=
 =?utf-8?B?Z0ZIcjR6QWFLNnYySkxLb0Fycm1WNzloZGZXQno5Z0NmRE1CekhBN3lzc0xm?=
 =?utf-8?B?ZnJUYVBVRGlvcWJpczR1Y2xnYUdsaUl2ZWZTQ2lMdkVXMll2UmpoOFZZSU9P?=
 =?utf-8?B?MW45R05ZcStLRFltOFlseGFDWEdoVEp0Tnpzeld2SENzeFh3ZG1SQmQxczhO?=
 =?utf-8?Q?tMnGzrQcEosefmVFyzdmP4h7PQ3tbBXe?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b0pjZjRLcGZySlUxSnhhN2FkVFVUTDNnVDhNOXJPY1pRRHdEckpRSU1uOTc1?=
 =?utf-8?B?SDZJTUFIVnZOU1htUVN1eHJGamp1azIwdVREbkM1UDRxeFQzeW4xVEo1YThu?=
 =?utf-8?B?MVNmbzQ0S1pOa0pBdk1TVGZWR2l6dmtrbmMrVm10V3crZDNUaUxibG81QTlk?=
 =?utf-8?B?bk03eHVsemZJWWlkcmI5bHNSZWJHZVZNZlhOL1BSUEhxQTA1OFVhdkRaU203?=
 =?utf-8?B?VEdyQW93VldRRk14SDNjYUREVUVHMjh1NXo3V2U4Smdzbm02VVF5Qk5hWVQv?=
 =?utf-8?B?a3d6TmlDamRwQmdYbjcwSnE4Rjg5K05WNHcxbk9KVVNYaWxSYWNhM3hEOG94?=
 =?utf-8?B?Y0UyNUNnY1pWcGQrdWlUQWVnNmE4TUpKU0NsdDRuSFhGMkZ3am50Ky84VHN4?=
 =?utf-8?B?aEZja3l6c25pUG1qTmR6NVdOdEdoNzVBWUVsWVhMQWhOWFZjYy95WHh2TUJI?=
 =?utf-8?B?a3BvV2J6R0I1bmJrSURjRWRlTXgzRDlqUmovNDdNd21Wa21zOW1nSmp2Zkps?=
 =?utf-8?B?MFpNczZWNGRZREJERWZZakwrQzBHbmxyOXFhdExLU1ZVUm5IUVlTQ3ZHRlpS?=
 =?utf-8?B?akVxdDFpR3RNaUZMYXFZT0lDTjdhdzNPci9WclpscHNLSzRjWHlBMW5sM2ly?=
 =?utf-8?B?U2xLSncyQU85bHpQRE9ZK3VuNUluaS9vTXpsNnlmTnFSR3dnaHZzMHl0ZDgr?=
 =?utf-8?B?VEpHaEw5WVgxSklUeU5BYzlEeDdvMHp2VXRkQWlZSk5paG4wdS96Q0Y1VGlt?=
 =?utf-8?B?ckF6NHNBdlhCYk1haHNTZkwyWlRoMXE0c0xvU056SnFzTFFkdU9rSUNKTm8v?=
 =?utf-8?B?dGV5ODFTWXZHY1ZlVGFpa0Y2RUp6VnlKOExJcm91aFl0SUJqeUxJS0ZMSTFF?=
 =?utf-8?B?ck5MaHRKbWVzTDNmNUptMkt1TlMzN3dKL1ltSmRhd2szRzNaT2J6amFEaUN1?=
 =?utf-8?B?N1RMektqZnB0dGtEZi9wSitndEVJSnU1bVAyRGN1NHNDWGZyU3BUTE9DRmJw?=
 =?utf-8?B?REM1MTNLLzl1TzUya2ZNMVd1OXZ1TGRaTURZakExUGs2UUZ2TTVKMWtOMVdh?=
 =?utf-8?B?MjZ0TG56QmE3QzRhcFdnYTJFT0JGL1ZEL25LMzBBaE1GL3RYcFh0enNlTUNE?=
 =?utf-8?B?enY5enMzdGtwdm9jMTFrbXNNQXFVeDRRUmIvb3BOTVJLSDE5Y3lyL0xzS1JX?=
 =?utf-8?B?YzBzcnRCcnhBM1U4ZHZTeGdLR0pMeVcxZkdzL1hLbUVib2VoOWo0MEdFREdv?=
 =?utf-8?B?czEwQVFIeHdFaCs4OE1IV1lNOW9LSmdOL2RweVdyeDFpRmkvTW9hVzd3MGZL?=
 =?utf-8?B?amF1OGhaVnE0T0U5RmZEa0FlZXMxb2hHS1BBRjNzL01VY1Y0VWJqeG1sWHdq?=
 =?utf-8?B?cWZEaXRhVXBicEdQUlhzTDZMUDdCVG5ER0tQUW5FR3pFc2UwK21ELzlmdDZM?=
 =?utf-8?B?QStsMnQwNXQwQlBjWEh6NXNESFh0cGV6Tkkwcm84a0JRSDBkR1Yxc2w3VWt3?=
 =?utf-8?B?L0E4L24zN0Fyb2Q2Q2hzWUxRb2NUZjIwT3NGazhXT3cyRGdMNnJ5UitPdjVx?=
 =?utf-8?B?a0pXY2JKTkFxNndoNFZZL25Gem85TWVlUGt5bk9vbVlxbmJYRW9MRDVJMkxH?=
 =?utf-8?B?NW9ORjN0bnovQkVoM3lPeDRzNWg1VGduaStxZmZMVnRLODkvcjU2eVdCL09U?=
 =?utf-8?B?UDJ4cEl3Z281d2pncm9vU1E2bDhKMVNsVHJKYjdUNnJSTitGU1RDakhxK2U5?=
 =?utf-8?B?WTNEOXJOYXZFUHp3Ukpza3ErYkhrZ0VHeDRkU1FTTjBxM2poNERsMk5RSk42?=
 =?utf-8?B?VDdabHljclluc25GaG9hM3EyRG5xSEdQZFVqRzBTMlpvWS9nVWVGWGthd0pv?=
 =?utf-8?B?czMyWWFlSktvNnpudllCTllLTG8xSWRxMG1CcXZXT05xNlJJZUJBVFdkaWM1?=
 =?utf-8?B?YUFOUHdDZkJ5cGdDaXVmZzJwYVdaeUFOd2N5ZHVSckFvYXphTXhTZXFhTHlI?=
 =?utf-8?B?ZWRSa3c0VnlNUm9oTXVIYTR5bWZYazBvVW5qcUh1NVAwdE5veEsxd0YzN1M2?=
 =?utf-8?B?Q3RNMGhzUkg5WTJDc3hDak5BOEdCeDJ6alFPbUVWL05WSXVmMEpiMy84eXk1?=
 =?utf-8?Q?xZmg=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c911e3f0-a27c-478a-cc0a-08dd6b8fe16d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 11:26:26.2689
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BDR/aXKL4RbjAWH+EGimseEF+7SEZSVYtBbkP4uaZhLQVBB5DYENDO8cLoQVSu8ARhz3UEjSywWBuOGmYgPj4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6776

PiBTdWJqZWN0OiBSZTogW1BBVENIXSByZWd1bGF0b3I6IHM1bTg3Njc6IENvbnZlcnQgdG8gR1BJ
TyBkZXNjcmlwdG9ycw0KPiANCj4gT24gMjQvMDMvMjAyNSAwNToyMSwgUGVuZyBGYW4gd3JvdGU6
DQo+ID4gT24gVHVlLCBNYXIgMTgsIDIwMjUgYXQgMDI6NDg6MDVQTSArMDEwMCwgS3J6eXN6dG9m
IEtvemxvd3NraQ0KPiB3cm90ZToNCj4gPj4gT24gMTgvMDMvMjAyNSAxMzozOCwgUGVuZyBGYW4g
d3JvdGU6DQo+ID4+Pj4gQWxzbyB0aGUgY29tbWl0IG1lc3NhZ2UgZG9lc24ndCB0ZWxsIGFueXRo
aW5nIGFib3V0IHRoZSBleGlzdGluZw0KPiA+Pj4+IERUUyBmaWxlcy4NCj4gPj4+PiBEbyB3ZSBo
YXZlIHRoaXMgZGV2aWNlIGRlc2NyaWJlZCBpbiBhbnkgaW4gdGhlIGtlcm5lbD8gRG8gd2UNCj4g
aGF2ZQ0KPiA+Pj4+IGFueSBnb29nbGVkIGV4YW1wbGVzPyBXaHkgSSdtIGFza2luZyBiZWNhdXNl
IG9mdGVuIHRoZSBpc3N1ZSBpcw0KPiB0aGUNCj4gPj4+PiBpbmNvcnJlY3Qgc2V0dGluZyBvZiB0
aGUgcG9sYXJpdHksIHdoaWNoIG5lZWRzIHRvIGJlIGNhcmVmdWxseQ0KPiA+Pj4+IGNoZWNrZWQs
IGVzcC4gZm9yIHRoZSB2b2x0YWdlIHJlZ3VsYXRvcnMgY2FzZS4NCj4gPj4+DQo+ID4+Pg0KPiA+
Pj4gVW5kZXIgYXJjaC9hcm0vYm9vdC9kdHMvc2Ftc3VuZy8sIGEgZmV3IGR0c2kgZmlsZXMgaGF2
ZSB0aGUNCj4gcHJvcGVydHkNCj4gPj4+IHdpdGggcmVzdWx0cyBmcm9tIG91dHB1dCBvZiBgZ3Jl
cCAiczVtODc2NyINCj4gPj4+IC4vYXJjaC9hcm0vYm9vdC9kdHMvc2Ftc3VuZy8gLXJuIHwgZ3Jl
cCBncGlvc2ANCj4gPj4+DQo+ID4+PiBFeHlub3M1MjUwLXNwcmluZy5kdHMgdXNlcyBHUElPX0FD
VElWRV9MT1cuDQo+ID4+PiBPdGhlcnMgdXNlIEdQSU9fQUNUSVZFX0hJR0guDQo+ID4+Pg0KPiA+
PiBUaGVzZSBhcmUgb2xkIGRldmljZXMgYW5kIG5vdCBtYW55IHBlb3BsZSBhcmUgYWN0dWFsbHkg
cHJvdmlkaW5nDQo+ID4+IHRlc3RzLCBzbyB5b3UgbmVlZCB0byBwcmVzZXJ2ZSBleGlzdGluZyBB
QkkuIElPVywgaWYgcHJldmlvdXNseSBHUElPDQo+ID4+IGZsYWdzIHdlcmUgaWdub3JlZCwgbWVh
bmluZyAiMSIgaXMgQUNUSVZFX0hJR0gsIHRoZW4geW91IG11c3QNCj4gcHJlc2VydmUgdGhpcyBi
ZWhhdmlvci4NCj4gPg0KPiA+IFBlciBnb29nbGUsDQo+ID4gTWFudWFsIFJlc2V0IGZ1bmN0aW9u
IGlzIGZvciBIYXJkd2FyZSByZXNldCBpbiB0aGUgQWN0aXZlIG1vZGUuDQo+IA0KPiBXaHkgYXJl
IHlvdSBtZW50aW9uaW5nIHRoZSByZXNldCBmdW5jdGlvbnM/IFdoaWNoIHByb3BlcnRpZXMgYXJl
DQo+IHRoZXNlPw0KDQpPb3BzLCBJIGdvdCBtZXNzZWQgd2l0aCB0aGUgQVNvQyBwYXRjaGVzIEkg
ZGlkLg0KDQoNCj4gDQo+IA0KPiA+IElmIE1SMUIgYW5kIE1SMkIgaXMga2VwdCBsb3cgZHVyaW5n
IHRoZSBWTERPMyBpcyBhY3RpdmUgc3RhdGUsIHRoZQ0KPiA+IHN5c3RlbSBtYWtlcyBhbGwgaW50
ZXJuYWwgcHJlc2V0dGluZyByZWdpc3RlcnMgYXMgZGVmYXVsdCBpbiB0aGUNCj4gPiBhY3RpdmUg
bW9kZSAoYXV0b21hdGljIHBvd2VyIG9uIHNlcXVlbmNlKS4gSWYgdGhpcyBoYXJkd2FyZSByZXNl
dA0KPiA+IGZ1bmN0aW9uIGlzIG5vdCByZXF1aXJlZCwgY29ubmVjdCBNUkIgcGluIHRvIGhpZ2gu
DQo+ID4NCj4gPiBTbyB0aGUgcmVzZXQgaXMgQUNUSVZFIExPVyBpZiBteSB1bmRlcnN0YW5kaW5n
IGlzIGNvcnJlY3QuDQo+ID4NCj4gPiBUbyBrZWVwIERUUyB1bmNoYW5nZWQsIHdlIG5lZWQgdXBk
YXRlIHBvbGFyaXR5IGluIGdwaW9saWIgdG8gZm9yY2UNCj4gPiBHUElPX0FDVElWRV9MT1cuDQo+
IA0KPiBIb3cgYXJlIHlvdSBnb2luZyB0byBhY2hpZXZlIGl0IGlmIG9uZSBEVFMgaGFzIExPVyBh
bmQgb3RoZXIgaGFzDQo+IEhJR0g/DQoNCldpdGggdGhpcyBncGlvbGliLW9mIGNoYW5nZSwgdG8g
Zml4IHBvbGFyaXR5IGFzIEhJR0guDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwaW8vZ3Bpb2xp
Yi1vZi5jIGIvZHJpdmVycy9ncGlvL2dwaW9saWItb2YuYw0KaW5kZXggZWI2NjdmOGYxZWFkLi5h
YTVkMTEyYzYxODkgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwaW8vZ3Bpb2xpYi1vZi5jDQorKysg
Yi9kcml2ZXJzL2dwaW8vZ3Bpb2xpYi1vZi5jDQpAQCAtMjI5LDYgKzIyOSwxMCBAQCBzdGF0aWMg
dm9pZCBvZl9ncGlvX3RyeV9maXh1cF9wb2xhcml0eShjb25zdCBzdHJ1Y3QgZGV2aWNlX25vZGUg
Km5wLA0KICAgICAgICAgICAgICAgICAqIHRyZWF0cyBpdCBhcyAiYWN0aXZlIGxvdyIuDQogICAg
ICAgICAgICAgICAgICovDQogICAgICAgICAgICAgICAgeyAidGksdHNjMjAwNSIsICAgICAgICAg
InJlc2V0LWdwaW9zIiwgIGZhbHNlIH0sDQorI2VuZGlmDQorI2lmIElTX0VOQUJMRUQoQ09ORklH
X1JFR1VMQVRPUl9TNU04NzY3KQ0KKyAgICAgICAgICAgICAgIHsgInNhbXN1bmcsczVtODc2Ny1w
bWljIiwgczVtODc2NyxwbWljLWJ1Y2stZHZzLWdwaW9zLCBmYWxzZSB9LA0KKyAgICAgICAgICAg
ICAgIHsgInNhbXN1bmcsczVtODc2Ny1wbWljIiwgczVtODc2NyxwbWljLWJ1Y2stZHMtZ3Bpb3Ms
IGZhbHNlIH0sDQogI2VuZGlmDQogICAgICAgIH07DQogICAgICAgIHVuc2lnbmVkIGludCBpOw0K
DQpUaGFua3MsDQpQZW5nLg0KDQo+IA0KPiA+DQo+ID4gcGxlYXNlIHNlZSB3aGV0aGVyIHRoaXMg
aXMgb2sgZm9yIHlvdS4NCj4gDQo+IEkgZG9uJ3QgdW5kZXJzdGFuZCBob3cgdGhpcyBpcyByZWxh
dGVkIHRvIHRoZSBpc3N1ZSBJIHJhaXNlZC4NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6
dG9mDQo=

