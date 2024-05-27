Return-Path: <linux-gpio+bounces-6631-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AC88CFB9B
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 10:36:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A46D1C20B23
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 08:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D93A5787B;
	Mon, 27 May 2024 08:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="gLrlRFu9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2085.outbound.protection.outlook.com [40.107.22.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F56735280;
	Mon, 27 May 2024 08:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716798993; cv=fail; b=LZe5Jh+tlzumcxifYG0YEAF6tOkcuyLD7diDQS0AE0yv8Pau/tnPN+IwaTsy6mE8CVFMuhvW0CzeWVHqMZZOUxWLgecpAWEGGP9hBBOnHk/Bmtz3KhCLrOiBKrbfPmAx+ZjIQbMySJMSMRicJGdUDJ5HfLgSMfp+jCQDR7UcNls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716798993; c=relaxed/simple;
	bh=zRgQUQhVJYOXRJYwZQ8XvY8xdhav9dTItui7/GLzmGE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EA94zDYcJ0HQJyOV23fpvQ9WbrDBq/mw3pMQwHc/Yp9OmljHS1t8af1eetoad3eeB13wAPv9DC678VkILpodgOeMwBuFqizCureFge6D62RPaZP95lFa3/RuBVI47JDP9wj4NQFdj040e8iTrjtSbHQExcsDwjarl/CRvLDCK+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=gLrlRFu9; arc=fail smtp.client-ip=40.107.22.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mTu3naOHdqTPpioRvxSvA8Jg7Up77/45Id8rMrrCWJG7inAuUosvBRe/ZQ9kNykDwhqMpukmpuASwAzv898dRn66CFg0IAh+pkkJUrBvAKTwqFSIYkNCdLZZ7qKuZ8kyv9wZsqro5FYgTgM1WfA9Ve+5WVsGGCUWh6Nk0pXPjN1h2nyRzr3tCRDAGzz5vx9yV+2OJsmTXeIn9vyT5sCIbF3xClAdJ6jfw0h7ilkawO4T1VIJRU2FPw/aGW9orqfP2g3lMT1z+HblH+J1riUoeInWs2+CTyWNOlKbskXiuuMVoQsy3Stx7oPT0E57reOxVVc7TALdqfpuoFCnW1sXWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRgQUQhVJYOXRJYwZQ8XvY8xdhav9dTItui7/GLzmGE=;
 b=aO3ijUTQbUv8yzTeTqNAKwUDA6E50ZCSAR+bcrNfmA4uPcI2L/AKziq/D6PFuKwtGox4oSPB1ZNavNHohg/emOZ68qHkwTZECV3s7MzF0xqIxV2t7tXcsmJkg7IQheFYa77IasZvAvFHedIcTnB7q7RJx0YaNH607xdAL1le2l+jKXVhLNcvydiaXhqueivuTXEEfmc1s3ZOw/Z5+cdRQy4T1/j+YjY5iNZ0Gq4aOPOX9jvdUNrA1xkaBkV2DzCUSEyQj/yvCxyJY72ubztcHQvR7iARlFriFD5Po2D9Kfh9yy6s9cp5svsQFMTjczvsqLqMXbb6li4+hkNaHzo8Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zRgQUQhVJYOXRJYwZQ8XvY8xdhav9dTItui7/GLzmGE=;
 b=gLrlRFu9eYilHlDU9N0COgXhDNrHq0OoEYNATC23WVks0KkijCh3TyFun2gZCbHrT9i2vspgrf6p0qxQOZ++pKub0qOJTD7IPAY6tNZPlY38P65jwP5815u9yMTQens2AvPHTZ4KEJa0I7G7i/o18qo6D6DqAdQIqbUyBIchzDM=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by VI0PR04MB10231.eurprd04.prod.outlook.com (2603:10a6:800:23f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Mon, 27 May
 2024 08:36:27 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::557f:6fcf:a5a7:981c]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::557f:6fcf:a5a7:981c%7]) with mapi id 15.20.7611.025; Mon, 27 May 2024
 08:36:27 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Sudeep Holla
	<sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
	Aisheng Dong <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH 0/3] pinctrl: scmi: support i.MX95 OEM extensions with
 fsl,pins property
Thread-Topic: [PATCH 0/3] pinctrl: scmi: support i.MX95 OEM extensions with
 fsl,pins property
Thread-Index: AQHaq0Z+AFfJc9w7tEOWjM+RsEK2hrGqyxrQ
Date: Mon, 27 May 2024 08:36:27 +0000
Message-ID:
 <DU0PR04MB941718F15619A907C15AA18588F02@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20240521-pinctrl-scmi-imx95-v1-0-9a1175d735fd@nxp.com>
In-Reply-To: <20240521-pinctrl-scmi-imx95-v1-0-9a1175d735fd@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|VI0PR04MB10231:EE_
x-ms-office365-filtering-correlation-id: 355c7078-e523-41c5-7bd7-08dc7e2819a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|366007|7416005|376005|1800799015|38070700009|921011;
x-microsoft-antispam-message-info:
 =?utf-8?B?S1UxR0ZycTZqYVg3YzZKc215Q21VQmpQNVVpUERyZk43WmNQWkxSbVF4bHpz?=
 =?utf-8?B?eXhONzB0d1VPbElZdmk3TkV4TGhGM1M1OXkrZk5vd2U5RERTV0xWTUxDeVJ5?=
 =?utf-8?B?VDhEbkVPeGNhb2RaMC9Ra3BIbUdQSWN5Y2NQR1E0VE5MelZrbU9jNWpidUJH?=
 =?utf-8?B?T2ViU1dxaUo0MzM0MlhnZ05nc0VCYkJiSG5QWTlZVHhWc0J4YUZma0l3emZO?=
 =?utf-8?B?YyttOTVJNitkU0cramtHTWxvVjM1cWk2d1p3RHBTNjVHeHdkNU5wdXRGSFNo?=
 =?utf-8?B?eGE0b2xPSGdyQmdyRWlGbktKeXVjSVVnMWRYRUp5ZUxSQUg0RFNuRUFCMWdv?=
 =?utf-8?B?MTVOYlpVWTM1eDBxQldCSW8ycWNVRDh4SFI5ME03UHhFSkNPdndzZzBXM2kr?=
 =?utf-8?B?elpNTHgzcjdTVVJzbks4em11VVpDekIwZVhLMzZEVXMxcDhlWEs4T1hvdHl1?=
 =?utf-8?B?OUZZWnNNQVlzUDk1QVlqVHowby9PWWYrQ29jZVVMSHVWVWdHSGIxa2tMTklW?=
 =?utf-8?B?ZXBEc0lVZ0JzVEhKRUhIODlOVDFQZC9ZcFBGcXJkelBJTlhZeU9TcUJ4Tkpq?=
 =?utf-8?B?SkZmVGVEWWdPem9peXR4dmR4ZUh5cE1sb2dZeGE2bmpVTGpKdlg0MktWSU1F?=
 =?utf-8?B?eEpYUlNDM1lkM2VHVG16MGZFQitNelJ6WDZZN09qS2tsWHFLcGJRSUdvYzZD?=
 =?utf-8?B?Y0J3WnBrQmRlRnNZVmVIRGIrT1V0Z1JZaTcwM0JOZ1pIaWhNYkY3ZlB4dXhk?=
 =?utf-8?B?WVR6dGYxRWkxVXZvSFgyTmdzdU1JVHJFbkpaM3NuRlk4cm1EMzJCQWwrZ3F3?=
 =?utf-8?B?MlJXZmt5YlI2OEJHcGt6ZGd6cUdPZUxaaFdINHVDNDBacml5a0tVQlZjSXR4?=
 =?utf-8?B?Ri9pOHdDZHdjWUFscFNhQW5qNHZNNURxMWlPemZQaUc4NEdKMjZHc3lwT2lW?=
 =?utf-8?B?a2Y0dGhOTkhNaEd1VkVDMkhsdkJyelI2ZklkQ2tUREJacGxScWxBUVNQRGN0?=
 =?utf-8?B?QmFTSjlvMHFnU3gzOFVkQ3hENDJKTmFLR05MTHB2am5GS3lJWnlMWkZpMWVD?=
 =?utf-8?B?UXVySzlIbjYvT2UreE5qVlNyWTYyY3REN0xld0hkOWNRZm0wZ2tHdnpCZjJy?=
 =?utf-8?B?YnUvSUU4dm9DcVJnR0MyQXdIWFpCdVY0UnphZGxIejNWampSZHJjR3cxNko5?=
 =?utf-8?B?K002eVl3RithSGlOMDRjZ251UVJlb2ZlSDFIdEErM003YmdhQUhHeFQ0Ny9q?=
 =?utf-8?B?c3NqQTJiVGxBVG10K04xMGNIb3NXYisxbDh6MjZzNzUvRExwVktEZmxrUndX?=
 =?utf-8?B?SklXZkZyMWVIeGdqYWRwTkN2aldESFlEN1ZsL1N4elJYVVB2RlJ1RW91K1JN?=
 =?utf-8?B?cDJjRFFFUERIaDluMXl6SmE4cHNOY05hM3hPVy9MVHBES05objZObkszWXRI?=
 =?utf-8?B?Q3FtUGFYZXMxYURUTHBiNVg5M1l1c3FCTlFtY2pnMnlERGh5K3dWdU5zbGxM?=
 =?utf-8?B?d2g1N1IvTlB3V3Z2ZlFPdldkVElMRFBIbmU5T3lZVzYwaUhlNElPWFBzOEtX?=
 =?utf-8?B?aERTNzlzcXVXTlJSbEZRb2tTU1d4U003Mm5QTzJpVmZJSTByMmFCVmZTRGJV?=
 =?utf-8?B?RFIzb1M4YnQxSVJwQldoTGRTdHE4czRUd0NoMCsyTEsyamlQSExzdjFHcWxK?=
 =?utf-8?B?bUZTaHRqQ1o4SFJqSGk3eUREQWtxTmd6dStzaGxRWld5ejJORzVrc3lqNU5w?=
 =?utf-8?Q?IY2M+sdb58n6CtPL7E=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(376005)(1800799015)(38070700009)(921011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MmlxbFM4dDBtRkp1WnJrOTFWQzcrYnR1Z3pZS0ZrUkY1ZGFJM1JlVE5CanNy?=
 =?utf-8?B?T3dxNVpiRnl2SmRVWkVwRjkyR1RQNk80L3JxZ1N2TUxRNkpWZjdFcDNWYkV5?=
 =?utf-8?B?bUJBYWFjcUZ6dCtuRXI2WkgzMlF5RDN2TllhTStQSTJCRmlhcGE1Tld5dTJx?=
 =?utf-8?B?ZklmRXR6VXhyWGwzZjVKQTJWeEhRbVFpeFVpZ3hwSWJ1WXlhODJaemR3WTg4?=
 =?utf-8?B?K1U1YXJDRElhS1ptcE9nbnV6alp4ZnhucVVUaGhlTkVmazhDajlTbC9selJO?=
 =?utf-8?B?L2FCN2NBd2dGeW1xUExIcHQwNkhrZW8rbXhSWm5nUTF3SmM0cDRJZHh5S0Y2?=
 =?utf-8?B?SXUyQTVnK0xkbFpFQ2VkL29WWDhYQXRuK0VpNDRkR0YyY2c5M29LeVFkdWJk?=
 =?utf-8?B?TzFSVTcza3hDRjJmNjlsM3c3L3hKQ3RCem5yYjIrZlZxSnRpN055VVZyTCsv?=
 =?utf-8?B?Y3AwUnF5aEN0SVh0RUhFSEpZWEdRaFkvOHl6cms3YkVkODZENDFqbG1hNkFN?=
 =?utf-8?B?NTR3QmV0N3lJblJPSmQ0VlVlcVdXRFUwZGN2Vm1BQjRrR0x6QXorWTZMSlVt?=
 =?utf-8?B?ODlUa1BpeWVJOW9CNDdEbWdJVDJjNXJoZXBtSFJ6Y1NjZ0FXcGxkVmVuRHZP?=
 =?utf-8?B?RVJaUXFJN0dIWHdNQ2sybklPOGx6b0gvSGQ4NWw5LzEyMy9kRG5pOXdYR3o5?=
 =?utf-8?B?TWtLSkdNOERtRTBGRW51OENqL3VJbWw2SU83Y2V3ZGdncHBGSnhYK2FZK1lv?=
 =?utf-8?B?a1hSMjllYU52MWthenR1anE4TTdQZmV6SnZsMFhkcll1MDgzQlZCSmY4cGd4?=
 =?utf-8?B?eHhuU255ZkRYOERadXZyQ0ZpSTNBZ05CdU03K3F3RFhKc2ZDcmRmMEVYaGpH?=
 =?utf-8?B?cjYxd1RaY25FT1U5VzF5Rk1xeFhzYVdMUHdoUGhwQ3FXSllHOEN2QUpSZThN?=
 =?utf-8?B?Q2U5VERnWU9FbVE4dEZCd0JBQVF6RXFqK0JoOUJEZ2Z5MVUvTnE1bXREWnBZ?=
 =?utf-8?B?TEFxR2FoSnl5ZDlVK1lKNEhnbi9kKzI0RUR1Wkt6eUcrRlJuOUpaKzVNemoy?=
 =?utf-8?B?VUg5dUdEWHVZNnBYeU9ORkdyTFYvM2NrMFlMakxoVzhYdkd4a1R0ODdRSnM2?=
 =?utf-8?B?dHA2TGlKbjdFRThMVm9LdXo4Yjc5LzJQRStFMmtTSHdJWW9iL3ZueUMzY2cw?=
 =?utf-8?B?eEI0TDMzdmk0d0Y5L2NwSXBKbnFXSHlJSkRybC8wTUo0UzJBeGd1WDBjZCto?=
 =?utf-8?B?L0VGUkRhVkJZTFcxYmlqUjBNdUUva1hYTVlFK1BmL2d4bzhJenpBV0dJd1dG?=
 =?utf-8?B?ZmVDejZYVDJha0VYcnVHSTIzUXdjME16SjkwbnpwdVYwNzNGUGJNb1Ira241?=
 =?utf-8?B?SjhFVWNWRzVEZUtzNnU1b3kxMUlnNFFGYUZyQitBcHo4NGlQQ1RPTjlXaWFi?=
 =?utf-8?B?QWxYdTBqSmlzM0Vidy9kRUFSN0JKcTl5S0lMbzdvdGhveUFqWWNybERsaFIr?=
 =?utf-8?B?RWhHOVlIMmdidFFtVVloT3JydHJFcEJWOGdaS2F1Qy9USmJ0UkdJWlJTWWNo?=
 =?utf-8?B?WjJ6THllNTF6QUgvQ2FZdWU5dzFrd29LYytaZ0V1TUJCVWRZbXRTdzVQSmtu?=
 =?utf-8?B?RWRuNHZrd0dtSkNmR1g1bjJjVzl6UWpjaDhNcXk2ZkFXcFdZS1RxdlVkSVEv?=
 =?utf-8?B?SVdqdS9YNEsrTzFQRkxtK1hoSlNYY1RNZkFBSXVXbExuZW1uSkk0eDhlV1hV?=
 =?utf-8?B?M3pveE04WmQ5NlNTK2JPamVzalF6K2tOcTB6TUlPckMzV0kwVDFQUmMvaTR5?=
 =?utf-8?B?NnJTNUM4QnY0aU9NNmVxODYwV0xVTTVMYW14MGxLdGJpOFRMc1o2WHk1MXdX?=
 =?utf-8?B?bzR2RUhVeUwzNHFzbHZkYmJxVDQ1Nk5wU1hhb3RneWV1Qmo0ckdNNnBlUk5q?=
 =?utf-8?B?US9BZVBycEthQ3hocUw5SnowdXJVYmRnSTdVWkp4NXp0ek5ZYnZDZWN6bHMr?=
 =?utf-8?B?ZHJrNjlwU1NzRzkrN3V1UFdNWGVrL01JSDNhVzRFSTlOcE9xYkRpMnh6WTBi?=
 =?utf-8?B?TFE2U0QzMmlMaVhERWlCa1A0SDdUV01XeW9wZz09?=
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
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 355c7078-e523-41c5-7bd7-08dc7e2819a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2024 08:36:27.2890
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L2Q40GbkkXSq3idO/t006JsrGPK6nkpv4i04wZ9fGKxk9RhncGnM3fLTKAp/H79a+SCjtpDeDDSWVpmCXc2XSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10231

SGkgTGludXMsIFN1ZGVlcCwgQ3Jpc3RpYW4sDQoNCj4gU3ViamVjdDogW1BBVENIIDAvM10gcGlu
Y3RybDogc2NtaTogc3VwcG9ydCBpLk1YOTUgT0VNIGV4dGVuc2lvbnMgd2l0aA0KPiBmc2wscGlu
cyBwcm9wZXJ0eQ0KDQpTb3JyeSBpZiB0aGlzIGlzIGFuIGVhcmx5IHBpbmcgdG8geW91LiBKdXN0
IHdhbm5hIHRoaXMgbm90IGJsb2NraW5nIGkuTVg5NQ0KdXBzdHJlYW0gc3VwcG9ydC4NCg0KQXJl
IHlvdSBvayB3aXRoIHRoaXMgcGF0Y2hzZXQ/IA0KDQpUaGFua3MsDQpQZW5nLg0KDQo+IA0KPiBB
bGw6DQo+ICBUaGVyZSB3YXMgYSB2NiB0aGF0IHVzZSBnZW5lcmljIHByb3BlcnRpZXMsIGJ1dCBh
dCBhIGxhdGUgc3RhZ2UsIE5YUCAgaW50ZXJuYWxzDQo+IGRlY2lkZXMgdG8gc3dpdGNoIHRvIGZz
bCxwaW5zIHByb3BlcnR5IHRvIGFsaWduIHdpdGggb3RoZXIgIGkuTVhzLiBTaW5jZSBuZXcNCj4g
cHJvcGVydGllcywgZHJpdmVycyByZXdyaXRlLCBJIHN0YXJ0IHRoaXMgcGF0Y2hzZXQgIGZyb20g
djEgd2l0aCBhIG5ldyBwYXRjaCB0aXRsZS4NCj4gQSBSRkMgcGF0Y2ggZm9yIGJpbmRpbmcgd2Fz
IHBvc3RlZCwgIHNpbmNlIFJvYiBzYWlkIGhlIGlzIGZpbmUsIHNvIHBvc3QgdGhpcw0KPiBwYXRj
aHNldCBvdXQuDQo+IA0KPiAgV2hldGhlciB2NiBvciB0aGlzIHBhdGNoc2V0LCBwYXRjaCAyIGlz
IGEgbXVzdCBhbmQgd2FzIG5vdCBjaGFuZ2VkIGZyb20gIHY2Lg0KPiANCj4gIFRoZSBwaW5jdHJs
IHN0dWZmIGhhcyBiZWVuIHBlbmRpbmcgZm9yIHF1aXRlIHNvbWV0aW1lLCBJIHdvdWxkIGJlDQo+
IGFwcHJlY2FpdGVkIGlmIGFueSBxdWljayBjb21tZW50cy4NCj4gDQo+IHY2Og0KPiAgaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwNTEzLXBpbmN0cmwtc2NtaS1vZW0tdjMtdjYtMC0N
Cj4gOTA0OTc1Yzk5Y2M0QG54cC5jb20vDQo+IFJGQzoNCj4gIGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC8yMDI0MDUyMDE5NDk0Mi5HQTEzNzQ3MDUtcm9iaEBrZXJuZWwub3JnLw0KPiANCj4g
VGhhbmtzLA0KPiBQZW5nLg0KPiANCj4gQVJNIFNDTUkgdjMuMiBUYWJsZSAyNCBQaW4gQ29uZmln
dXJhdGlvbiBUeXBlIGFuZCBFbnVtZXJhdGlvbnM6DQo+ICcxOTIgLTI1NSBPRU0gc3BlY2lmaWMg
dW5pdHMnLg0KPiANCj4gaS5NWDk1IFN5c3RlbSBNYW5hZ2VyIEZXIHN1cHBvcnRzIFNDTUkgUElO
Q1RSTCBwcm90b2NvbCwgYnV0IGl0IGhhcyB6ZXJvDQo+IGZ1bmN0aW9ucywgZ3JvdXBzLiBTbyBw
aW5jdHJsLXNjbWkuYyBjb3VsZCBub3QgYmUgcmV1c2VkIGZvciBpLk1YOTUuDQo+IEJlY2F1c2Ug
bnhwLHBpbi1mdW5jLCBueHAscGluLWNvbmYgcHJvcGVydGllcyBhcmUgcmVqZWN0ZWQgYnkgZHQg
bWFpbnRhaW5lcnMsDQo+IHNvIHVzZSAnZnNsLHBpbnMnIHdoaWNoIHJlcXVpcmVzIGEgbmV3IGRy
aXZlciBwaW5jdHJsLWlteC1zY21pLmMNCj4gDQo+IFRoZSBub2RlIHdpbGwgYmUgYXMgYmVsb3c6
DQo+IHBpbmN0cmxfdXNkaGMxOiB1c2RoYzFncnAgew0KPiAJZnNsLHBpbnMgPSA8DQo+IAkJSU1Y
OTVfUEFEX1NEMV9DTEtfX1VTREhDMV9DTEsNCj4gCTB4MTU4ZQ0KPiAJCUlNWDk1X1BBRF9TRDFf
Q01EX19VU0RIQzFfQ01EDQo+IAkweDEzOGUNCj4gCQlJTVg5NV9QQURfU0QxX0RBVEEwX19VU0RI
QzFfREFUQTANCj4gCTB4MTM4ZQ0KPiAJCUlNWDk1X1BBRF9TRDFfREFUQTFfX1VTREhDMV9EQVRB
MQ0KPiAJMHgxMzhlDQo+IAkJSU1YOTVfUEFEX1NEMV9EQVRBMl9fVVNESEMxX0RBVEEyDQo+IAkw
eDEzOGUNCj4gCQlJTVg5NV9QQURfU0QxX0RBVEEzX19VU0RIQzFfREFUQTMNCj4gCTB4MTM4ZQ0K
PiAJCUlNWDk1X1BBRF9TRDFfREFUQTRfX1VTREhDMV9EQVRBNA0KPiAJMHgxMzhlDQo+IAkJSU1Y
OTVfUEFEX1NEMV9EQVRBNV9fVVNESEMxX0RBVEE1DQo+IAkweDEzOGUNCj4gCQlJTVg5NV9QQURf
U0QxX0RBVEE2X19VU0RIQzFfREFUQTYNCj4gCTB4MTM4ZQ0KPiAJCUlNWDk1X1BBRF9TRDFfREFU
QTdfX1VTREhDMV9EQVRBNw0KPiAJMHgxMzhlDQo+IAkJSU1YOTVfUEFEX1NEMV9TVFJPQkVfX1VT
REhDMV9TVFJPQkUNCj4gCTB4MTU4ZQ0KPiAJPjsNCj4gfTsNCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPg0KPiAtLS0NCj4gUGVuZyBGYW4gKDMpOg0KPiAg
ICAgICBkdC1iaW5kaW5nczogZmlybXdhcmU6IGFybSxzY21pOiBBZGQgcHJvcGVydGllcyBmb3Ig
aS5NWDk1IFBpbmN0cmwgT0VNDQo+IGV4dGVuc2lvbnMNCj4gICAgICAgcGluY3RybDogc2NtaTog
YWRkIGJsb2NrbGlzdA0KPiAgICAgICBwaW5jdHJsOiBpbXg6IHN1cHBvcnQgU0NNSSBwaW5jdHJs
IHByb3RvY29sIGZvciBpLk1YOTUNCj4gDQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9maXJt
d2FyZS9hcm0sc2NtaS55YW1sICAgICB8ICAgNCArLQ0KPiAgLi4uL2JpbmRpbmdzL2Zpcm13YXJl
L254cCxpbXg5NS1zY21pLXBpbmN0cmwueWFtbCAgfCAgNTMgKysrDQo+ICBkcml2ZXJzL3BpbmN0
cmwvZnJlZXNjYWxlL0tjb25maWcgICAgICAgICAgICAgICAgICB8ICAgOSArDQo+ICBkcml2ZXJz
L3BpbmN0cmwvZnJlZXNjYWxlL01ha2VmaWxlICAgICAgICAgICAgICAgICB8ICAgMSArDQo+ICBk
cml2ZXJzL3BpbmN0cmwvZnJlZXNjYWxlL3BpbmN0cmwtaW14LXNjbWkuYyAgICAgICB8IDM1Nw0K
PiArKysrKysrKysrKysrKysrKysrKysNCj4gIGRyaXZlcnMvcGluY3RybC9waW5jdHJsLXNjbWku
YyAgICAgICAgICAgICAgICAgICAgIHwgICA5ICsNCj4gIDYgZmlsZXMgY2hhbmdlZCwgNDMyIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gLS0tDQo+IGJhc2UtY29tbWl0OiA2MzI0ODNl
YTgwMDRlZGZhZGQwMzVkZTM2ZTFhYjJjN2M0ZjUzMTU4DQo+IGNoYW5nZS1pZDogMjAyNDA1MjEt
cGluY3RybC1zY21pLWlteDk1LTg2N2JlYTk1OTVjZg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiAt
LQ0KPiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4NCg0K

