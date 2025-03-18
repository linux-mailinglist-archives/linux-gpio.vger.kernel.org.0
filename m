Return-Path: <linux-gpio+bounces-17735-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A9CA67419
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 13:40:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 276D37AD50F
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 12:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A81120CCED;
	Tue, 18 Mar 2025 12:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jPSDI6/l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (unknown [40.93.65.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E652620C46B;
	Tue, 18 Mar 2025 12:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.65.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742301501; cv=fail; b=PLPMcbocRTf0baDhbeW39a8yawTYav+fC3aR7zYV3USdCghCUeY8pniiXR4EjEZH4e7tfNViyp/Tl2IFuH6gBHHyb74StqWolEsC7wAGNsviRiKdf9E7gHCxL4vW2uw7R8CgSAuZExnu6SJgBhFos1I7QJtpZWynxqmzrVIrYWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742301501; c=relaxed/simple;
	bh=OY6DuL6eOO7eZn4f/kBRjW4wLqrwqh3nR/2LQ/8gpkQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XDIwhGirHeZRqR+eX8Jamt3aaLnE901PNYVggpyrEWTB8HeH5x+ccA5XJw9H48vCPXC8cjKTT7ypdBSap+RU4inBb+uO0Y13zNsa6dMhaDIIdUio6eVUGI0jif56LuUF3hHX0apWl2LAuNk1FD3waB7Hi1glLoTjCX1Uyfn33vc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jPSDI6/l; arc=fail smtp.client-ip=40.93.65.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KNV7X1chliQWFYFPR+IHUi4VaDj1hgDZGF27Xufk96ERkSFfBM2K9T4QBb+p/nD5cHOvBCvz7QYH425LzxBenfKUNsWWa4/zt8FCcumcPuE7qXW7ZhB8Wx0v9VLUabCWX9orQOUI51bunT/BwLFugkoMcf5aF7jX17JU+Cv1XIV4evyK+mXiVXHGkKlHiepqJCuAntUP8qnEj0hi7bJLbH+EGCpciwBBo30LkiYwY+9xMEFDsvYVdwLlcIur0/us/5bl3eJ9URk+5+7ATFJnqrqJ03g6rnBfcfm1SjvO6XUhqvJpUBsCuFFdMqQWyhZoTaRSm4yGNg/pzNWwMCTx6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KcwGUAOTTRcTaQa9YWI6M7ix+hqqQ9PXOut7XJGKFqs=;
 b=hwT3pPDkmy7fqpkPmz3xl/MjSx92RCw3gjtGzBKgRddCdzTl0CQmf/J9w3qXhVMxDmlT/7nBFS+37bMqRSF9joR9Z9GMZ672fLxsKfe3rC47WE3tYguRsoSL+cl44saSgtFSr8PE+u1IrdH8qhyMj86hY6gH/MdmRBn0tEg09QGAd731UEE/VHz0rN1Zpc86W4flgD6E8CpXnlB1q3eAd7p5YTRkXdyDmalP+n705h62j8q1CdEGc7bz7bbYAsAofpevKJ3eWBQW6Hzlomgu/dqnXSeB4lpuPzJHuVSb1sH601KEv8at+fGyHdDhfOHEmhUxFk62bITKzmGyE3eKxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KcwGUAOTTRcTaQa9YWI6M7ix+hqqQ9PXOut7XJGKFqs=;
 b=jPSDI6/lA+WabRs/fEWhchvfUkRvrfmA12MuOuLKMW597XY2KV1Sk9coH4kPmsdglF3G2mNp0Mjahgz3jy10rWIDYifO0EXRk5pyootGJ0RxSbp82dqByiR/7KJu1ByZ0Ol0wmUtOh3j5jFQvSuLJue/iGD0FoHVdM72XnGAG4CvHlNUb5Ak9/iMv0oS01SgAXvE+vTYACsDxWuuz7SsTl19RgK+ZNERypnzbgT7MC6fjqJZLHvgigPEkTprbnEWfmNxMJItep+3WSgsXhSZR8iktlowy+5C96SD6dWslYplK7Qm9F3QnPA+HeOkSvTeLSbAJzo6fN5sXlpRGMrqLw==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8195.eurprd04.prod.outlook.com (2603:10a6:20b:3b7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 12:38:16 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 12:38:15 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: "krzk@kernel.org" <krzk@kernel.org>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>, "brgl@bgdev.pl"
	<brgl@bgdev.pl>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org"
	<linux-samsung-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>
Subject: RE: [PATCH] regulator: s5m8767: Convert to GPIO descriptors
Thread-Topic: [PATCH] regulator: s5m8767: Convert to GPIO descriptors
Thread-Index: AQHbl8aNtQhQNM9MgkKKKzIX+U7Uq7N4r1yAgAAjdTA=
Date: Tue, 18 Mar 2025 12:38:15 +0000
Message-ID:
 <PAXPR04MB8459A44864B9213E8265137188DE2@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250318052709.1731747-1-peng.fan@oss.nxp.com>
 <Z9lJETLh2y27934q@black.fi.intel.com>
In-Reply-To: <Z9lJETLh2y27934q@black.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AM9PR04MB8195:EE_
x-ms-office365-filtering-correlation-id: 04485906-9432-4fa7-3522-08dd6619c131
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?OsXyRh80swJidBizcGkodnHt3IfScGzmI5EFJ9koyuiXorzFyQuZRS219ddl?=
 =?us-ascii?Q?tudpl9z/ivmnk+FpC5bz/PcLtuRzCO+rGWdFByH1kXTwvgZLls8vY0kx/vd9?=
 =?us-ascii?Q?JGyff7eHrgySaOXODsk+WAw+2WokW5mVqFYQL/rUX+rR4oEr+WJGsOrlxc4Q?=
 =?us-ascii?Q?cl/BWHP+YmyB8NJeo0Mcbod98eGnZX4dtmqyE4lKdPjwJvFvqKdGQHn/xQKx?=
 =?us-ascii?Q?6WjcQz/3lq9f4D6X2FSxHekq/j4OHNOHvfOkE2SDjjkMNcMVif9zoQnZAK5e?=
 =?us-ascii?Q?LNWceRIwLh5W57EhuqEhlCyjT/mZXgjg4KYPY6IUuEvvxa1xkz+DtUqQeiP2?=
 =?us-ascii?Q?/OZxA0FVoXHYQLW71SSHEGEt0nnw5b9pYTWBWf1Vy4x56v3TJ3qzGkMdAXQK?=
 =?us-ascii?Q?kXaJhrYDtmbeCM2nNkqPrrpUZZQCMz/mXHr865QQZO3Os5+dKajU4IM8qEom?=
 =?us-ascii?Q?QgQMlG4fSkksMLvpdUQoYHGmx3DOc+d5mqd9FJDlWQQ8mLmQHhlp2UpAuZs8?=
 =?us-ascii?Q?/I1kcWse3DTESNFUb07YiYKwK9uzlK9brYQCrI81rRBQva3kiiQwBQZjdhCa?=
 =?us-ascii?Q?fJIwYpGBtg6pOq50a5bbQXn0QX7qznHtxCy+mSTchRiYMFGWWYFZjcMCOf98?=
 =?us-ascii?Q?Su5xzRlQWItHcrQoqtctl55qjJSDeZx4PRcxVqhQ/0LzIbvsRzkmIcq/1r5u?=
 =?us-ascii?Q?9GKDRro42BQBpy3UtWzh5aHwN8t1uZ149a9Z4+WiREc1PzcAGiWC2+V3y7qp?=
 =?us-ascii?Q?W6ZSbprsXuJPdLJDiK2QcCw7hkrPo/AR+78cKVV23QBUZ9x1NZd0HVbF0ZoI?=
 =?us-ascii?Q?RsPzmbD/vs4Hjbva8PSLfeTEeN3lcAKbYR8TFXdV/BZWc9rI3oQiPn6NvxaB?=
 =?us-ascii?Q?ZFukW+ayPiW5bIK3DP77U6SQm90JxUn4QGIjBeWco6npnRZDnS9LM+Da2v4f?=
 =?us-ascii?Q?Nw8A5ydD+9A33+yYja2Mgreg9D3U6IcCpf5XCUVH9VkZEC3Awk3imayfVJq4?=
 =?us-ascii?Q?oHz1FvFnZ1+h2udbVPZY09bkfuJHylQudQjj+Da0CPH3lrmt8nN889EtV3fE?=
 =?us-ascii?Q?hLpb9BUxGPk1JcPzDmSWt41hBbtVQdT98l3pl/BwA+yNzE86K0kQgEK5NDkK?=
 =?us-ascii?Q?FRloqhyUV3ypgloxSoTPbLZRwyJuB7wrwrXUP7GCf/HULjjEoft1s9CKN4YA?=
 =?us-ascii?Q?clP/sKht/O2oG8PE5dEuTe3d9KdgIeFOPk2wYKWIWJbz7CkxDG1q5SKAhiPS?=
 =?us-ascii?Q?nVcfVB+kRU7BU0S7ipfMSPWtDq5A63JWcAoTlw4vfQkfpyF2IhuMjReuDkmR?=
 =?us-ascii?Q?gZ4XkIVw1PRnh1X/qCWabt7Ch0Io+bABsG44LdrJuncdWDXuSM5ShbB03PL2?=
 =?us-ascii?Q?f8XaEZF6vBTS982UCXGP7P2+TN1B5clYIg2iI8Jw32/ier2qrZvEiDQtsYEi?=
 =?us-ascii?Q?euSnjf6sU4OAi7tUT53s4BDSRpfd1OCv?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Kmysx404uKNvY/tt9NP1Q4UqUkKt/2TDC+90k6/phuoB2pZrjfqz/hikc6Xz?=
 =?us-ascii?Q?LOi7S3uW7YseTU6/xNZ8SjG/QV3xlymOPhuLQLNd+sEZAlF5aV+MsqXsEhbl?=
 =?us-ascii?Q?PUmOeOLl6g5WkK21uloCGVBxLWJWKYhcfXEZtKkHoISxjy+WkHxmnvMnc4Ox?=
 =?us-ascii?Q?PyTX44sLMEWzXbylHeNOBNCKkW7LqsHRWRMVzz+4lHeB3i/GCc2HRJRq8f1t?=
 =?us-ascii?Q?TNU8Tpme8gqbSpdxMNwFPVAnoigt7UVgtBUS0Qqq/4HJvuoFzUWjYR/GxBj/?=
 =?us-ascii?Q?Ah0UDgIiPlq74FIlilQS14jjwUWJnIdZOhGU4KjqwV1rhiBgmi8CdYrjoaep?=
 =?us-ascii?Q?SurzAKnFdldo8PgRgxgqU7S32YE8CSBE8RLCQkJnrwU+bHxHxiEs6qy1XEpO?=
 =?us-ascii?Q?gHph4wNzLdklBw102KoLzD7QIA1Xbjh2b+pGOSHrOVa7RzDouaMnstLxVdbe?=
 =?us-ascii?Q?KYeOhHjvk+h+plvZkNQYxFFtbQcJysSschgDhk8ooOGn1yfQTpXLvgg9vTBI?=
 =?us-ascii?Q?WCSQ8yUlgfdvZf0UTvjupiME1OTJZ60H7+yZwyH2KCtPOweMEfZc26SgEHUv?=
 =?us-ascii?Q?uUqlBSckmOkjtxwYR24gHuSGYZPHCwp6drFn96uoKdRTw8dh66q1mH8PoUWK?=
 =?us-ascii?Q?jFVmY61e9h3SYXbKjrSf2z9bq769CuP32XireQW3wbo+a7UYhI9K0xPaBmyw?=
 =?us-ascii?Q?2HOzcEuogBSbNUEA7GBObpR7YuXbnQ3P67ujxNWvRUufxNZ/afhXKRCF21ia?=
 =?us-ascii?Q?wXlyhpz81LPw04d1eZUvCjpRhZyvmHjnxK00zt8jOm15ZMu2w25Uhw/JRBH5?=
 =?us-ascii?Q?cUsMCXJpoFxDXczAFqCDE0Qtsi6sYbesBf6SIgSUBSFO2a6rDjo4+Uiqim4C?=
 =?us-ascii?Q?3ABfXQroFAgXPCsAvgMnlBew7nF4Dv7wPMbu2ZwMD46vip4HMVc7XYkWNRUH?=
 =?us-ascii?Q?WRAgOyP8XZGY35UoUx7Du7pF2ymH/3gWehZcr4gHNfWcpebNK+2kigs2gHRn?=
 =?us-ascii?Q?+yp/0byPGiRmXiLIGoCIKYsZOWZGTOsA0vuByXhkJU14XwVZJo/ggsMYqxXQ?=
 =?us-ascii?Q?KwGILSbguBY+KfXY0YgIHkXMffv8KhQKe2vcua15ntFvJ83C0L9dkhaHbC81?=
 =?us-ascii?Q?gf18AkhfV+N/1vOJWdNzvhjLuMujanTAOK+QZN9H3ARQx3nWca+NRScnDlCN?=
 =?us-ascii?Q?dnDcNBcWCh+bm5hKfUrYXTbyz6nyNfrv+cPDMVqDoLgOdEM8wiC8jRVHGmtG?=
 =?us-ascii?Q?yCZM1lzEWgGO6g4LRJ1DFsvU8SmxvmIXBUql1OikxfFdmvDnnDafPmryUnoN?=
 =?us-ascii?Q?IpgKW5/UU/2BIb2wcSg9N5j/CH41LY48/MwmIRM8Iad6wjsXg3XZeFlNAG+V?=
 =?us-ascii?Q?8eYH0YHOAALnUlBedsxfdTs7fxGxASr/WgZNcOgfCDqA0geAqYue2bq1rtOm?=
 =?us-ascii?Q?u94F0zVoq8AxNzYD0GjgWEDZnLgP7HqDW6cuLGZJjiphycYncBmCrZHjz5v8?=
 =?us-ascii?Q?oPArqOqeN388EiAVtZ13XR9p5sMMPQyhd/TFMTwWTJnrwOoiddP0a64sEIzq?=
 =?us-ascii?Q?aQgRjNpYWRfqsMyOgVI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04485906-9432-4fa7-3522-08dd6619c131
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2025 12:38:15.7324
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JWmubZ5IB9CB7AIY8zc6JjWf2yB6gtjS1rmgcWmzL4mzSiHPw1hf6xZFm/cGCshYOF8zSNUYeKB1PLk1JDyRxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8195

Hi Andy,

> Subject: Re: [PATCH] regulator: s5m8767: Convert to GPIO descriptors
>=20
...

> > +	gpiod_set_value(s5m8767->buck_gpios[0], (temp_index >> 2)
> & 0x1);
>=20
> Can be simply done as !!(temp_index & BIT(2)).
>=20
> > +	gpiod_set_value(s5m8767->buck_gpios[1], (temp_index >> 1)
> & 0x1);
> > +	gpiod_set_value(s5m8767->buck_gpios[2], temp_index & 0x1);
>=20
> Ditto.
>=20
> ...
>=20
> > +	gpiod_set_value(s5m8767->buck_gpios[2], temp_index & 0x1);
> > +	gpiod_set_value(s5m8767->buck_gpios[1], (temp_index >> 1)
> & 0x1);
> > +	gpiod_set_value(s5m8767->buck_gpios[0], (temp_index >> 2)
> & 0x1);
>=20
> As per above.
>=20
> ...
>=20
> Also the commit message doesn't tell anything about the existing DTS
> files.
> Do we have this device described in any in the kernel? Do we have any
> googled examples? Why I'm asking because often the issue is the
> incorrect setting of the polarity, which needs to be carefully checked,
> esp. for the voltage regulators case.


Under arch/arm/boot/dts/samsung/, a few dtsi files have the property=20
with results from output of
`grep "s5m8767" ./arch/arm/boot/dts/samsung/ -rn | grep gpios`

Exynos5250-spring.dts uses GPIO_ACTIVE_LOW.
Others use GPIO_ACTIVE_HIGH.

The current changing to using GPIO descriptors should be ok per
my understanding.

Not able to find any public datasheet for this pmic (:

>=20
> ...
>=20
>=20
Other non-replied comments are accepted, I will address them in v2.

Thanks,
Peng.

