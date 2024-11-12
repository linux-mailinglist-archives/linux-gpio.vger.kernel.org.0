Return-Path: <linux-gpio+bounces-12851-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAB69C51E3
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 10:24:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F3D2B23098
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 09:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 167FF20DD5E;
	Tue, 12 Nov 2024 09:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="lHDsPoz+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011040.outbound.protection.outlook.com [40.107.74.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1F020822B;
	Tue, 12 Nov 2024 09:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731403306; cv=fail; b=gLbg8qP/Evkthg7lgQashzsHhu1aVhi77WvnMRYs02pQYC6WrnUa9g1LE0TJGY1cOYeLaezV96dD6LFJJvJrUHWyuRDUsixRhx8smf3+IewaFocAjdZOACI+P8RUMRGrDZdjGwHnl+Uwh0Ae5NdLcRWfqSH2tlgZmk6eJ8PMHDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731403306; c=relaxed/simple;
	bh=BLifJyPrMZtqi8xr08SqVwCN1ynRJaQtDfxojnJ+FME=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=O5fy+Jr/xO5PLxTWPp97m3L18NjN/DvsP2XSGlMH8/bRNXqTJBGaHZn0TKHtCjdgp5Ksewy+/XY1l04nux0sCvzGJzqSmuv70RX6v4j6dHR8dQS8Px6slXHOolpzDKe9E0nWmZvlOK9iktmDaSBC+HTheyi5uhfethTCx/nCLy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=lHDsPoz+; arc=fail smtp.client-ip=40.107.74.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YteslmQQTkExCKvj0Ua7QqX+qxn/nkRLHQMag0vl7sCznnSiJVUhMz1LxvN98eDbBax3kdNX766tc+M9Qrcr32wjhbrhd34sWeAl9V0RM8FeRGS8nqNUY+r7P36moWNsJiHGoinz1I1EhxWRANTk43Jhln2HcXEX4lc9LV4omEsdeLXiIwBAmrfRNhGeoTUVQzAMp75r5Oeh+gzvXqZyr16t/RXjBrvdBgq2O5vYVbCZ//1rlwt3rrw9vGNvD8/I/TThz8y+UfO/qWrKQojZXsFFox2wP3kNLHK1gVb4sOyMHHRBeh5bNzn423ODpb/dHHRTtpMQseDtFkN0kIa/WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLifJyPrMZtqi8xr08SqVwCN1ynRJaQtDfxojnJ+FME=;
 b=GwnqhaOpmZIN9Uaz8ihu+cxPUXFkOleg3wurH5WpkKCPe8a4bflWyALN1RZjMrQvQ3wdmkxE9ecTDVIEdK1vv8/amPeX54OfoIIlpIZ7rzCNgQSytPV3P/vakqvS7A3MFICqJb4f0G5+SBE25/4rHBaJepDo6pd971dCl2EXrKCDl6oTYqkdt/mqeBLnnfke1HEKRZsOvec25Kwsknwa4A3o6alRU6ybumWCNuRjkJ3haGUUCrOOpAQgPbTPugEno22ygtVoxHaKPFNz3HclsJw0YbXCohPsRrCxz9ExV+3g9cHiTaPSqijG5pR7sYg75uWAPQHjg+GWXFhCBBh+Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLifJyPrMZtqi8xr08SqVwCN1ynRJaQtDfxojnJ+FME=;
 b=lHDsPoz+I+5R1gRXX0JD4FdVRjCOChevXX15mUH+BPzmA0juE9eC2+THTZ3n6sGZMysy6doLI3lp0JOEGx0NvcAiEge7lejuOoSWgJwUrvezLkToFCr/3WrnFFkY8J+b/MO5bA2h0upmBQVy8edKlby+qf91/gjFM1fn+hD9XPk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB12135.jpnprd01.prod.outlook.com (2603:1096:604:2e9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Tue, 12 Nov
 2024 09:21:37 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 09:21:36 +0000
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
Thread-Index:
 AQHbMcwk+s13zfsAPEGSqJT9ouqgjLKwN5YwgAG8EACAAABHYIABYvwAgAAG2BCAAAR3AIAAAOsg
Date: Tue, 12 Nov 2024 09:21:36 +0000
Message-ID:
 <TY3PR01MB1134667106C11F27EA41C7F7186592@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
 <20241108104958.2931943-25-claudiu.beznea.uj@bp.renesas.com>
 <TYCPR01MB113329FE5E9E610BEF45DC001865F2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <c15bb621-6cd9-4be3-beec-20fecd411547@tuxon.dev>
 <TY3PR01MB1134600DEBF0096A67950441086582@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <ce074521-7d4b-4514-9b2b-59b246686210@tuxon.dev>
 <TY3PR01MB11346AF4A763ECF2D2F31588C86592@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <b109e943-7436-42ae-912a-e6f6e20a948e@tuxon.dev>
In-Reply-To: <b109e943-7436-42ae-912a-e6f6e20a948e@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB12135:EE_
x-ms-office365-filtering-correlation-id: 5a1b0c52-9f89-4de7-03a0-08dd02fb687c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?L2wwbHRaSlQ1UkRsM3hWTk95aUY0SnMzeGFudE5EKzkxNUJnSlEzYVMxYlM4?=
 =?utf-8?B?Tk5waDg1N01MbUFTYmVWciszZUxtbHdTTFRERFlrVDdHdGdNVy9DWm1Jallu?=
 =?utf-8?B?dmRqQzJiYXc1MTFLbkFlaW5Sb095dllUV3pYeE5Hb2o4RUNrNThGa2xCbmd6?=
 =?utf-8?B?d2ovakg1MWtOL001all0S1JzU2JFLzh0NStzSkdleGhYWnF6TW1TMlIrWTFY?=
 =?utf-8?B?MTcrWmI3dHNBZ08zcE4zcWZFSmtjODQvZkFCdWVqRXU1azFOQjZ6bG5XSEJC?=
 =?utf-8?B?ZjRoT2V2RnNUcXNjNUhTNFpMcE9IWDhaSFd5ejRJUGVWYVhRRXp4U3dtYUcw?=
 =?utf-8?B?TjBaeHcwVklRQUJlTFpnbFI3UWlwT3Y5NVRIUCtaUUlWVWhydUhYNFJkanQv?=
 =?utf-8?B?NnpnSlFHeUdGZUZ5aTQzcFpQay9jNTFobE1zUE1KNG53Z3F1b3UrbUE1VWpN?=
 =?utf-8?B?a01GT3ZFNXEzL0lIZ3hWSCtrVVU0bHd4K3pkSmV3MWJ4ZFRFUmdyQnNodFd5?=
 =?utf-8?B?TkVnVk5aNHFrbXprKzFOckVqTnkrWGUzZHRteHBMNWdxc1ZCUkdHaUtzWUdK?=
 =?utf-8?B?VkZCeEI3MHcvZHRuNy9jZHg3VGE3b2FCRUdnYXdET2VWRTJHcVd1YjZCTndm?=
 =?utf-8?B?aHlXYk80WjV2aisrWVJXK0ExK1hTZDA0Nm5GME0xZ0hzSnNHSkE5SklEWG1Y?=
 =?utf-8?B?eHYxZ0Z6c0h0dHQxRTR4NzQyY0c1Zm10eGppRzRIZmVLYnREbDhQbGlyTjRh?=
 =?utf-8?B?ZkprVGc5dkZIU21kQTVGZ3VZY2ZVYnNYUFA4d1VEUzgrbFBpbnVZdXdxSkg1?=
 =?utf-8?B?WVVUZGFCQ1c5QjM3eDREcTJ0QldTYmVZWlFWbWVFdU1kRjhSVFNjYmlGOHFw?=
 =?utf-8?B?TWRxNnZpWmRWL2Jsc3ZWZVcxcHZJLzFMTVVLZ1RrcXRud1Y0M25WN3RMZE1k?=
 =?utf-8?B?ajRGN2NYN0VHMkozMnN2LzlER0cydUY2WnFRTUFHSEtGc0JWVk14bm14T2V0?=
 =?utf-8?B?SmdIMElSTVNHWS91UnBsZ2VNZ0hBYTAzcEZuSkF2UDFjMTJYSGpZbzJJVGhG?=
 =?utf-8?B?ZFd3Q01zb0lXUFhHRmd3NVRPOWlEdDRXRTc5OUQ2S2JMNDl3c3NXSnBwZkNt?=
 =?utf-8?B?YXArQWltMXVSbUhPK1ZWQzFJWC9JSnY1MXZHeHc2K3BNNDlmSmljaGlOU1VT?=
 =?utf-8?B?WE9KbmIzUHUyRmk1S3JSaGtiRVRBUWlzLzBIbnV6eERrcnZxYWJFcUtYTlNC?=
 =?utf-8?B?TXZrWkNCaTU2SzJyMEFWc0pXcEFJRHdqb01vejd3eUUwcGt5TUw0NlZUamY2?=
 =?utf-8?B?UTVpazZyMEtlS0JVL1lCR0VCbExZaWRKYXVHSFFWUzFKblNsczg2R09halhM?=
 =?utf-8?B?MWtyWWQvYjZCZ291am1TNlYvNUFnRS9rUXZXQlIzTk1RRGFUdFlTalhKeHd2?=
 =?utf-8?B?dlM4amNIUWZtTGRoRkFZVE5hdFJJQ2RJNjBHbEhhZC9MNkc4Umd6U1hkTGtE?=
 =?utf-8?B?eWZ6NENXbHlTVkFiUkJlMzN5Z2N5bTExZCt4SW1kM0RYSXpqWHBEeUVLYUVa?=
 =?utf-8?B?VXBCMTRnL3dTemlyZkMwOSswYUYxM1EyZ3o3cHFpbEVEWXJXVGNZRyt5TzJI?=
 =?utf-8?B?VGIzKzYrVkRlaURSU1pHZFJLRWwvcUNHODgvQUx0Yk1KY2w2VStsUzBLRTRa?=
 =?utf-8?B?RUNvV1BOeFFqMk1pR1BqUXFha1FqdkFKdDBLeG5GbjQ4dVRjZk0xU0FRRWhr?=
 =?utf-8?B?UmNCczBpQXhDSDQ3YTYwNTJyYjNaQmQrTHEzanBRSFdLeHZrNElkZDltZzJq?=
 =?utf-8?B?eTlGdDk1cEVuQVpaUnEvcjU2UitVNXk5YnlHcDhyaWd2eUdNMEZZbkxSVW5z?=
 =?utf-8?Q?PgPtEH3oc59Hj?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RTJQbWJpNUY2eGJQdDgrekZzZ2JBdkwySXFFME80clQwd2pndExFaFFxcDY5?=
 =?utf-8?B?ZTRYcmtScG5QRWRndUlSTkNvUEhKOEtxQjgvSEdoZi9HYUZuT011anNkajRU?=
 =?utf-8?B?Znd3K1hmb0ZUcHRYeVVpd2FBOXIzN0RkeEIyVzlwN1hCc0haWUI1VE5pRXJB?=
 =?utf-8?B?NlU1S1cxeG5rS29XUmVRbytkQjdWeTd0WUludU9tNTNYOFNMNXlyc05URGpu?=
 =?utf-8?B?eEpJTVNUalozM2RQSTBqV3ZXUjV2ZUpOelVnUnhEdVhncjNPaUdoeXA4VzNI?=
 =?utf-8?B?QkdhL3U1RXJJVlFMYXUyMW10SVB2Tmo1ZlJSOUZCeWlyVWNqSmZsLzJiTFFr?=
 =?utf-8?B?MmIwS3lIcjhjNHZzNFpuN3B3UVk3N0hoTkNRUXNzS2lpRnVuUkh5cjdQQ2hz?=
 =?utf-8?B?TFpSenRINTVKL2hmcndqSzljNVhMdTA3Ykx0UkoyOEIxb29GdFYwL0I0djdr?=
 =?utf-8?B?MGdNNmZPT014QkhTLzRpeE5oWnBxZ3kyZVR4UEFuWHV2cEZQMnlLS1hJdTNJ?=
 =?utf-8?B?RVNjRTV2SkgySWg1UG1DTDhWWEt6cWZYWE9sU2ErWnY0YVMrOTJlczhuRVJy?=
 =?utf-8?B?YWNRS0pnbnQ0MEQ1NTkyOHlHN2QwSlVaNm9NKy9qNWZIZ3M5SjB0ZXB6WXlD?=
 =?utf-8?B?Y2IyZlhzYnVTa0l4b0tkNzBpZzFsTGNHR01ac0NTakNyYXBQQTZxMXF4SllK?=
 =?utf-8?B?aS9UVGxaeXp5RnhHTVZkU05IWTlUVkthZDJ4WFRmUHJVRWdwbEswVnBoVW5n?=
 =?utf-8?B?TWVscjhsM1dPbi90NmYwd0VyVVZnYkhyUGVHOFhYaEF3UEhVdzZ0NHRwai9G?=
 =?utf-8?B?bmNkKzJmLytDWnh2S1JpeHo3V3lsbDZQbFlGS1ZmeTJIUUhITFBxa0FYU0ly?=
 =?utf-8?B?eXl5U1N4T2QwU1lOYUVQZXVjRGhPUVVXSll5ci93RktCRk0rQTlsZmJEdC9s?=
 =?utf-8?B?SEJxN0xuWlFzanRXeWUxRWFMWmVzQ3hQOWlodjhURXJIa25IZ0hNMlkrdWlR?=
 =?utf-8?B?bHdhNXJ1MVoxdGhwdXRQTGpEVWVBRGVlT1IzQUlKYWhGbVdaRDZnbnZJRjRP?=
 =?utf-8?B?UmZPVDY3T3JUZFRkNzB2MlBnczlWNXhoMThLZk1WdFozVWdpNjNTakwyMnRU?=
 =?utf-8?B?MDJibWlvUUdDRndDb2t5NDR1RlljWXEzWDBQZ0NRVXVnTVhkMWVJTkhrOFZU?=
 =?utf-8?B?UlFhSmI3YXBKYUxrQW94d1AzQzNKdHp6TURPbGxXaEVXVGgvOFlSM3lxVXAz?=
 =?utf-8?B?NVdmSlFBYVpsOGM2Q1dwZXE4Uk5FM3RudjFCbE52eEp0dHBKUnJVWWc1RzN1?=
 =?utf-8?B?MHlBbUZacE9KUysyd1UzQjRaSzRPNXlmY3hWUG45SEpSenpJTktNM29zQ09M?=
 =?utf-8?B?cVc3blRsRWdvVmhOc0R6NVptYVlaWld1WDNFNGlHRDJDS2kweXJ1cW5oSUxj?=
 =?utf-8?B?U1F6YUk5NC9HbnlRaWtCYnNXeVhmWTdHaDcyRDJiTm9sZG40UDBpYXprTldG?=
 =?utf-8?B?RWlYR2x0NnhrZEt2Z1pJd2hpL0hSUWpadGtJYVM1R0tINXNwU3BISCtNTGN4?=
 =?utf-8?B?NGM4NzBtWm1UODk5ZG5oTFp0YnpnRUNZQXpKcHV3QzU0cFpJRjdZVE9sK2Zx?=
 =?utf-8?B?U1U4Vzc5ZkRBV0lDK1dlaFRORmprOElGbTVnTkp1MWFzazIrVGZPTS9DdHIv?=
 =?utf-8?B?RVJRc1NzUnVON3lPWXNOSnJWektGSDdyOWdFOWlFNVVpUllkV2ZFaG12SXlM?=
 =?utf-8?B?ZE9jeWZKN3pRZEpnbDBUdHB1NmkwcTNmcDBEM0RkNW5nYnU1bHVuU2JnWTBE?=
 =?utf-8?B?WnpvWURUR3lTNzdVNHlkNWErdzJiWG5iTHFzRnFCK1hYOG9vanhPQXBPMWNF?=
 =?utf-8?B?dU1QR3R1b1NJWUZtUXMvVVFrYzVJRisvYWVIQ2wwb3NvQlNTd0VvVnpwSnFq?=
 =?utf-8?B?MlBack9TS3pST3JUdUtwYVc5QVZXaHVndkkrRi9kTnRMY1JtNUFVY0RwSmw4?=
 =?utf-8?B?UDRiVU5OZVprTVA1VEEweGJlcUZ6dzkreXpOVFc5NEFTbkQya1BOWFE5aENa?=
 =?utf-8?B?cjVwR2RyeUsvUzQ2NnFQaml6bGs4d3NVV1ovaE9VR1lmdHRhZ1ZqQ1hoeG0x?=
 =?utf-8?B?TFdSR01vak1NSDY4MWp4RlBHT2RPLzkzZER4UmUvRG5NR2EzcVBoNERYWlZH?=
 =?utf-8?B?eHc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a1b0c52-9f89-4de7-03a0-08dd02fb687c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2024 09:21:36.8957
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BXteynN53fH+GuFWhwCkQpDaC0gw89w8y5FUvU5kmTcuKccsLQZFqRnQr5gs73piT4uzBC3Q4jZTMuBz9N2lW+oTLjyt4xs4S0iRW9d1czY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12135

SGkgQ2xhdWRpdSwNCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDI0LzI1XSBhcm02NDogZHRz
OiByZW5lc2FzOiByemczcy1zbWFyYzogRW5hYmxlIFNTSTMNCj4gDQo+IA0KPiANCj4gT24gMTIu
MTEuMjAyNCAxMTowMywgQmlqdSBEYXMgd3JvdGU6DQo+ID4gSGkgQ2xhdWRpdSwNCj4gPg0KPiA+
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBDbGF1ZGl1IEJlem5lYSA8
Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiA+PiBTZW50OiAxMiBOb3ZlbWJlciAyMDI0IDA4
OjMxDQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMjQvMjVdIGFybTY0OiBkdHM6IHJlbmVz
YXM6IHJ6ZzNzLXNtYXJjOg0KPiA+PiBFbmFibGUgU1NJMw0KPiA+Pg0KPiA+PiBIaSwgQmlqdSwN
Cj4gPj4NCj4gPj4gT24gMTEuMTEuMjAyNCAxMzozMCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4+PiBI
aSBDbGF1ZGl1LA0KPiA+Pj4NCj4gPj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+
Pj4+IEZyb206IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYUB0dXhvbi5kZXY+DQo+ID4+
Pj4gU2VudDogMTEgTm92ZW1iZXIgMjAyNCAxMToyMA0KPiA+Pj4+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjIgMjQvMjVdIGFybTY0OiBkdHM6IHJlbmVzYXM6IHJ6ZzNzLXNtYXJjOg0KPiA+Pj4+IEVu
YWJsZSBTU0kzDQo+ID4+Pj4NCj4gPj4+PiBIaSwgQmlqdSwNCj4gPj4+Pg0KPiA+Pj4+IE9uIDEw
LjExLjIwMjQgMTA6NTQsIEJpanUgRGFzIHdyb3RlOg0KPiA+Pj4+PiBIaSBDbGF1ZGl1LA0KPiA+
Pj4+Pg0KPiA+Pj4+PiBUaGFua3MgZm9yIHRoZSBwYXRjaC4NCj4gPj4+Pj4NCj4gPj4+Pj4NCj4g
Pj4+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+Pj4+PiBGcm9tOiBDbGF1ZGl1
IDxjbGF1ZGl1LmJlem5lYUB0dXhvbi5kZXY+DQo+ID4+Pj4+PiBTZW50OiAwOCBOb3ZlbWJlciAy
MDI0IDEwOjUwDQo+ID4+Pj4+PiBTdWJqZWN0OiBbUEFUQ0ggdjIgMjQvMjVdIGFybTY0OiBkdHM6
IHJlbmVzYXM6IHJ6ZzNzLXNtYXJjOg0KPiA+Pj4+Pj4gRW5hYmxlDQo+ID4+Pj4+PiBTU0kzDQo+
ID4+Pj4+Pg0KPiA+Pj4+Pj4gRnJvbTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhLnVq
QGJwLnJlbmVzYXMuY29tPg0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IEVuYWJsZSBTU0kzLg0KPiA+Pj4+
Pj4NCj4gPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5l
YS51akBicC5yZW5lc2FzLmNvbT4NCj4gPj4+Pj4+IC0tLQ0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IENo
YW5nZXMgaW4gdjI6DQo+ID4+Pj4+PiAtIG5vbmUNCj4gPj4+Pj4+DQo+ID4+Pj4+PiAgYXJjaC9h
cm02NC9ib290L2R0cy9yZW5lc2FzL3J6ZzNzLXNtYXJjLmR0c2kgfCAyNg0KPiA+Pj4+Pj4gKysr
KysrKysrKysrKysrKysrKysNCj4gPj4+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9u
cygrKQ0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRz
L3JlbmVzYXMvcnpnM3Mtc21hcmMuZHRzaQ0KPiA+Pj4+Pj4gYi9hcmNoL2FybTY0L2Jvb3QvZHRz
L3JlbmVzYXMvcnpnM3MtDQo+ID4+Pj4+PiBzbWFyYy5kdHNpDQo+ID4+Pj4+PiBpbmRleCA0YWE5
OTgxNGI4MDguLjZkZDQzOWU2OGJkNCAxMDA2NDQNCj4gPj4+Pj4+IC0tLSBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvcmVuZXNhcy9yemczcy1zbWFyYy5kdHNpDQo+ID4+Pj4+PiArKysgYi9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpnM3Mtc21hcmMuZHRzaQ0KPiA+Pj4+Pj4gQEAgLTY0LDYg
KzY0LDExIEBAIHZjY3Ffc2RoaTE6IHJlZ3VsYXRvci12Y2NxLXNkaGkxIHsNCj4gPj4+Pj4+ICAJ
fTsNCj4gPj4+Pj4+ICB9Ow0KPiA+Pj4+Pj4NCj4gPj4+Pj4NCj4gPj4+Pj4gJmF1ZGlvX2NsazEg
ew0KPiA+Pj4+PiAgICAgICAgYXNzaWduZWQtY2xvY2tzID0gPCZ2ZXJzYTMgeHg+Ow0KPiA+Pj4+
PiAgICAgICAgY2xvY2stZnJlcXVlbmN5ID0gPDExMjg5NjAwPjsgfTsNCj4gPj4+Pg0KPiA+Pj4+
IGF1ZGlvX2NsazEgbm9kZSBpcyBpbiB0aGUgUlovRzNTIGR0c2kgdG8ga2VlcCB0aGUgY29tcGls
YXRpb24gaGFwcHkuDQo+ID4+Pj4NCj4gPj4+PiBGb3IgdGhpcyBib2FyZCB0aGUgYXVkaW8gY2xv
Y2sxIGZvciB0aGUgU1NJIDMgaXMgZnJvbSA8JnZlcnNhMyAyPi4NCj4gPj4+Pg0KPiA+Pj4+IElm
IHdlIGZpbGwgaW4gdGhlIGF1ZGlvX2NsazEgaGVyZSBpdCB3aWxsIGJlIHVzZWxlc3MsIHRoZXJl
IHdpbGwgYmUNCj4gPj4+PiBubyBjb25zdW1lcnMgZm9yIGl0IGFuZCBpdCBpcyBub3QgYXZhaWxh
YmxlIG9uIGJvYXJkLg0KPiA+Pj4NCj4gPj4+IEFzIHBlciBTU0kgSVAgbmVlZHMgZXh0ZXJuYWwg
Y2xrcyBBVURJT19DTEsxIGFuZCBBVURJT19DTEsyLg0KPiA+Pj4NCj4gPj4+IEFVRElPX0NMSzEg
aXMgcHJvdmlkZWQgYnkgdmVyc2EzIGdlbmVyYXRvciBhbmQNCj4gPj4+IEFVRElPX0NMSzIgaXMg
cHJvdmlkZWQgYnkgQ3J5c3RhbC4NCj4gPj4+DQo+ID4+PiBDdXJyZW50bHkgQVVESU9fQ0xLMiBp
dCByZXBvcnRzIGEgZnJlcXVlbmN5IG9mIDEyMjg4MDAwIHdoaWNoIGlzIGENCj4gPj4+IG11bHRp
cGxlIG9mIDQ4a0h6IHdoZXJlYXMgZm9yIEFVRElPX0NMSzEsIGl0IHJlcG9ydHMgYSBmcmVxdWVu
Y3kgb2YgMC4NCj4gPj4NCj4gPj4gV2h5PyBZb3UgbWVudGlvbmVkIGFib3ZlIHRoYXQgIkFVRElP
X0NMSzEgaXMgcHJvdmlkZWQgYnkgdmVyc2EzIGdlbmVyYXRvciIuDQo+ID4NCj4gPiBPdXRwdXQg
ZnJvbSB2ZXJzYTMgZ2VuZXJhdG9yIGlzIGNvbm5lY3RvciB0byBBVURJT19DTEsxDQo+IA0KPiBB
Y2NvcmRpbmcgdG8gc2NoZW1hdGljcyB0aGlzIGlzIHRydWUuDQo+IA0KPiANCj4gPiB0aGF0IHlv
dSBkZXNjcmliZWQgaW4NCj4gPiBTb0MgZHRzaSBub2RlIHdpdGggdGhlIGVudHJpZXMNCj4gPg0K
PiA+ICsJYXVkaW9fY2xrMTogYXVkaW8tY2xrMSB7DQo+ID4gKwkJY29tcGF0aWJsZSA9ICJmaXhl
ZC1jbG9jayI7DQo+ID4gKwkJI2Nsb2NrLWNlbGxzID0gPDA+Ow0KPiA+ICsJCS8qIFRoaXMgdmFs
dWUgbXVzdCBiZSBvdmVycmlkZGVuIGJ5IGJvYXJkcyB0aGF0IHByb3ZpZGUgaXQuICovDQo+ID4g
KwkJY2xvY2stZnJlcXVlbmN5ID0gPDA+Ow0KPiA+ICsJCXN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+
ID4gKwl9Ow0KPiANCj4gVGhhdCBpcyBhIGNsb2NrIG5vZGUsIHBsYWNlaG9sZGVyIGluIHRoZSBE
VFNJLCB0byBtYWtlIGNvbXBpbGF0aW9uIGhhcHB5Lg0KPiANCj4gPg0KPiA+IFRoaXMgbmVlZHMg
dG8gYmUgb3ZlcnJpZGRlbiBieSBib2FyZCBkdHMsDQo+IA0KPiBPbmx5IGlmIHVzZWQsIG90aGVy
d2lzZSBpcyBhbiB1c2VsZXNzIG5vZGUuDQoNCkkgYWdyZWUgaXQgaXMgYW4gdXNlbGVzcyBub2Rl
LCBpZiB0aGVyZSBpcyBubyByZWxhdGlvbiBiZXR3ZWVuIHZlcnNhIDMgb3V0cHV0IGFuZA0KYXVk
aW9fY2xrMSBub2RlLg0KDQoNCj4gDQo+ID4gd2hlcmUgdmVyc2EzIGlzIHByb3ZpZGluZyB0aGlz
IGNsay4NCj4gPiBDdXJyZW50bHkgdGhlcmUgaXMgbm8gcmVsYXRpb24gYmV0d2VlbiB0aGlzIFNv
QyBkZXZpY2Ugbm9kZSBhbmQgdmVyc2EzIGNsayBvdXRwdXQgZm9yIGF1ZGlvIGNsazEuDQo+IA0K
PiBJIG1heSBiZSB3cm9uZyBvciBJIG1hbnkgbm90IHVuZGVyc3RhbmQgd2hhdCB5b3UgYXJlIHRy
eWluZyB0byBzYXksIGJ1dCBpc24ndCB3aGF0IHRoaXMgcGF0Y2ggZG9lcz8NCj4gU2VlIHRoaXMg
ZGlmZiBmcm9tIHRoaXMgcGF0Y2g6DQoNClRoZSBzc2kzIGRlZmluaXRpb25zIGFyZSBPSy4gYXVk
aW9fY2xrMiBub2RlLCB3ZSBkZXNjcmliZWQgY3J5c3RhbCBmcmVxdWVuY3kgb2YgMTIyODgwMDAu
DQpPdGhlciBhdWRpb19jbGsxIG5vZGUgaXMgdXNlbGVzcyBub2RlLCBldmVuIHRob3VnaCB2ZXJz
YTMgaXMgcHJvdmlkaW5nIHJlcXVpcmVkIGNsb2NrDQp3aXRoIDExMjg5NjAwLg0KDQpJIGFtIG5v
dCBzdXJlIGlzIHRoaXMgZGVmaW5pdGlvbiBpcyByZXF1aXJlZCBvciBub3QgYXMgSSBhbSBub3Qg
YSBEVCBleHBlcnQ/Pw0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gDQo+ICsmc3NpMyB7DQo+ICsJY2xv
Y2tzID0gPCZjcGcgQ1BHX01PRCBSOUEwOEcwNDVfU1NJM19QQ0xLMj4sDQo+ICsJCSA8JmNwZyBD
UEdfTU9EIFI5QTA4RzA0NV9TU0kzX1BDTEtfU0ZSPiwNCj4gKwkJIDwmdmVyc2EzIDI+LCA8JmF1
ZGlvX2NsazI+Ow0KPiArCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+ICsJcGluY3RybC0w
ID0gPCZzc2kzX3BpbnM+LCA8JmF1ZGlvX2Nsb2NrX3BpbnM+Ow0KPiArCXN0YXR1cyA9ICJva2F5
IjsNCj4gK307DQo=

