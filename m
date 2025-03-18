Return-Path: <linux-gpio+bounces-17722-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D979BA67097
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 10:59:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7BB1E7A8A15
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 09:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F36BB206F10;
	Tue, 18 Mar 2025 09:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lTSCgy26"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2055.outbound.protection.outlook.com [40.107.22.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1B0207DE3
	for <linux-gpio@vger.kernel.org>; Tue, 18 Mar 2025 09:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742291932; cv=fail; b=gtGLru5baO8m4YDa0uYnlnvr482wC1Xn+OR/XBkKBf5XkhTe/uCB9E4WUDUa+qj8/v1mtvx1nIuogMkhqtqleSe8bFSOUtfdF+MjHY0AAZiIbKaUcJGY+I5oiOSFlnNrxO20TZKki0mefGbWg4NsuLLUKo/WFG1P7w+WntGYrPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742291932; c=relaxed/simple;
	bh=olHuFm2F7XZUXaoj+tZekoSCruXxTVv+cAjxE0ZEHi4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZcT69d3A4BPDUPFKmmK/WDYGx1sj4vRrzPZd29Y4Za8xWEZkVuhKfcr/YCJg6pw3npR0jwRJUdwojNMQq9vZyleUyXDn9F1TxBQhYpEg6OdrqTlEfXtBSV88nbC8J444zq9PkZpHJdFpQPMq/cwzNiS5ZTrPSVr0njw6OeMhDKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lTSCgy26; arc=fail smtp.client-ip=40.107.22.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HumTecNHWU9SPR20jUV5b8cWPJKT7NJDBEI9xwzRNYQ2gFGkPOEzpIKFzmCRnB6aLyk/Dk0ijfbX8NJWpRJ6HDegF1gS9P8JCrQUAG6KKcX58pthyaD0t2cESgW679OAqrf5qGqNSd+eXvP9L7NqjN+P+H/KbH0YVIF8oKntXL1uVctdlghWKebKt78G6n4tYUfWg28FN0gAKKmtGtbkh2Ue0g1NETxAe8QXt/n0lOIsMtIMLPIuBK3nqVVAOAgWij7NWOBZGSTQbLUXS4bHPsU9oYoONOSzJbteKKYu94MiKv6D1F7c0edKrv1ukmjLY3pwJ7wKUd/xVz6vlOMFrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=olHuFm2F7XZUXaoj+tZekoSCruXxTVv+cAjxE0ZEHi4=;
 b=E3Nd51jt8qjbsptmwb91+xi9ASpevvv21g1o7BBKXoQirIF5GmYyzSNc2mQRlIFuODFmOpjHQLpczK/W2phIoaf2uFxifXFwW3V3ew2is8OZuh8k5JgYSAQfjpJ2I1ysr2JLqL5VuAwv3rQ7C55tZXYmKQdbbCf4XHBmbfMlpMz5q2K4hh+seweEeUll56Tmypz5bAV/MQ/RZp3dYdyxz/hqxgVCT5CDaxD8G/NEDISSK7pbxrLkDEGSQM4CER6c4w8iSnKfa/M6zHb8EOs+xFStnfGzeAvRJVlm+FZ2HtjivRG1pEGWLHrX5N6RiluFwH+a7r/AHJO0wihviqGeXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=olHuFm2F7XZUXaoj+tZekoSCruXxTVv+cAjxE0ZEHi4=;
 b=lTSCgy26pFv++FxdD+jSvTl38H/ZEryJEgiXtrn7JqfPVte+yWrKb+S3cPrp+49/qZ1kkHXQxNe6ctnjHcasO/LZ94+gjrLTkWzaXhbddTAk95j3MBst71X5RzeUpVgls+apXXhOrd3bDM4TUwhvPE7LXGfs29z8WODSHxT0Cnk06KxtWFte/16Al9ffa8DJGbsjBrwOr5S9jVO2LryH3UssBLgksoY6eGltr1htnJlLKtF+3IMF/cpB5u72Dd147oyfHTyllQrMOFbKoPyOr1nYD4j5+i/eerV1EIMMhIw4shZOTbcHsdGXNKtxFCH9w90KoFacX5Rie3Eah+3NpQ==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI2PR04MB11052.eurprd04.prod.outlook.com (2603:10a6:800:272::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 09:58:43 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 09:58:43 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Linus W <linus.walleij@linaro.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: GPIO TODO
Thread-Topic: GPIO TODO
Thread-Index: AduX2JVnMdEdC/ApTkOWXjYXYxLUeAADr/IAAAEVgAA=
Date: Tue, 18 Mar 2025 09:58:43 +0000
Message-ID:
 <PAXPR04MB8459E4734C7390AB4F83178E88DE2@PAXPR04MB8459.eurprd04.prod.outlook.com>
References:
 <PAXPR04MB8459BEB700FB66FE693EF1CF88DE2@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z9k7cL8W-TCBLK1f@smile.fi.intel.com>
In-Reply-To: <Z9k7cL8W-TCBLK1f@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|VI2PR04MB11052:EE_
x-ms-office365-filtering-correlation-id: 5dbae264-ec09-45ac-283c-08dd66037768
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?S9yleTKe+v/GcPLsoQjM9/xiGUjY1h8HKkHPHe47VUvyXgzGWqr3DpfK86cn?=
 =?us-ascii?Q?RNcfpHnwkTGgyF/+fva9zpsjs6zMO66gld6xQi3NERe0jpRG5K2I7Wml063h?=
 =?us-ascii?Q?+tYuF0N2hUg2DsZSgnBn6Efy0KUaMdmz7ChSQLczOq48sgD9zeHRhLwt1yKg?=
 =?us-ascii?Q?t8F/Q++8EEaoJsYhL8d9aUXOGrx4JwnMCCdZTlKDqX0rLxmq5ymFue94a8Tn?=
 =?us-ascii?Q?3xNGsHCdyZ0ybj7bkzO6e/r0RlvUk49gD6ZtHGgX2LV5IDwWLTQA3NWuXH45?=
 =?us-ascii?Q?MhY9NH6D3fc3JMofwf4y2ZsGGzw3R4Nkb/kzp4C4l3p6VSqyCp8MxUOmotW9?=
 =?us-ascii?Q?xv2dgpjtijW+eWRkpl773G1GuQn4FTC1ahsx2UcSc+j5vQx63IJpST8QWOjl?=
 =?us-ascii?Q?q05J/ML0Fzau0quaaFycJ6FC8wbD/CZeg40kqPim9ydZsww6C8sXyFNyBxGV?=
 =?us-ascii?Q?l3TG3EAP0noEcSjbVaOzq3bvytv7BU4opQJsE+ltIyC7JETWoEk0sfu5UyDt?=
 =?us-ascii?Q?SDSbmX0jCrxvIWo6Kc6Hap+mrlouAOrGwNTHh59BiEdhM78CNMJem+pp7GiB?=
 =?us-ascii?Q?uuNJkMfA/T9EBCyfZLuivXLrjMny16mykH8SbJe76tT0sfNG6qhkLn0yu2As?=
 =?us-ascii?Q?FhxGT83IfgS8D7Zs0CkRqdEB3ZQjdCrYPNuBv5S7udhbCOWxj1694bGPToRT?=
 =?us-ascii?Q?vE6SJ1q+2v9SwAeNYBR94v8etG1Bsclk7WZfckUFCbrNyswdAjxAS4a9krlU?=
 =?us-ascii?Q?i+yjIMfldutthksANnwACSmzEDVGVkTlrHfaYLeHdlErTbMNTliVRXIyhsAa?=
 =?us-ascii?Q?6gXwjgd1GnpgSr96z2fNjyThxFbpHzfd6be2mP7znaDIui+d1Qmkk8kjN2GT?=
 =?us-ascii?Q?dG4Dyn+ah80e/vH4HklpnZhJWRCOFoyzy/veMOuq59ET1wqQEiDKvUI8967U?=
 =?us-ascii?Q?SP4jvHctGIgNGUXgNo0qM7Us1pmhhrCFGQAXlaoar1MqI4UTpcHvZ8TmpT8e?=
 =?us-ascii?Q?moxDcw0rebZOdwYvN8OLLo85aC/3uoZfc2GvKg13Eoq9LryE6r0rp247wTEq?=
 =?us-ascii?Q?oj+GBJFq8NNqvnqGXvKjkLuC14C4JhCe5n7Xk5huD2vYSPuKwxCcxIgLxIso?=
 =?us-ascii?Q?WVaeNRZ+kDeT+2eRaG046FVjsmIkqHgcTROeTRwD+acrhkyJxQZEed4U/Jow?=
 =?us-ascii?Q?ZptBuSmI1glUIlsmgo4e77lE8U5jrf3BIcQ6r2d2oRLehgIZ9WUDe/r6BYDW?=
 =?us-ascii?Q?Ov3lnUBNfErZP4M7oXC/GYT8LTRj3AhesfRx2G5gWp9fOoY9+A6xUUKgI9+h?=
 =?us-ascii?Q?rgkds8fkaIXzJrGqu95SC3r+hy9FqXV7IjBIJ5Qkj2vxfuRixvBus6RBMbsA?=
 =?us-ascii?Q?6Ok8mthCjSuhpy/uGCIyN91ObAZtVPOc4HOTZO3m28X2owCSTXcWU/AbX1uS?=
 =?us-ascii?Q?sm0JDGrdzaTWbg2YE4dmiGo1MvLHRebE?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?C5H2Z32+epKVu5fD6dC+hjhUGBMAIJf0njPY63jBTSRxz44jDczm+acHjnL3?=
 =?us-ascii?Q?O5d0eshEVwjfbp8D+vJFYCrqr1YaA+10mhWzXGnXsQt8b/LmAinhM/W0h018?=
 =?us-ascii?Q?tpc+OWkZVX7TvwycbfTY16Jyh23nYi6/AN8wMARighsasBqTNR/S7CFkrpv0?=
 =?us-ascii?Q?Voppv0uQHs6pqFMiFTRKOP24aM0jkHj9+D50X8+7UQGGUWDGl+vWS235TCt+?=
 =?us-ascii?Q?lKFijZBOQPNGopQGtFa8ezJbapIq1fiC2OJFKiCtNAeqNOlBHq/nNFpiaODv?=
 =?us-ascii?Q?iMy1T/StycFMTlmSa6zVP4+Z9bev7VwBD6zGbAmeerxA/+WDmR6HA1NM/Or6?=
 =?us-ascii?Q?TWJsa5J9t0bJ8sg6p9GQWVINtoFoUTLD1QBVk/bJEM+4M/Ii9rV7PgcbDhfl?=
 =?us-ascii?Q?E01f5woZwFeAJ1fdCmTqOxcAtHCn1i0TAz+MOwsfB1aFzNyOf2Opq81RSALp?=
 =?us-ascii?Q?fSP0WMEmvZm5+JLfuqST00QQ09cfZABqD75+UVeeF00oLLp4gHHLnn0My3Cu?=
 =?us-ascii?Q?5lTITzJ3sOZKMTIG6KvsJlx6ERR8RMhYHUxrSmWH0mgqmby+4+6VYRUzpPo6?=
 =?us-ascii?Q?xFiYtX2SlN8xQkSLh4vTkUU5L9Nt36UfVt/GVVnLpNzhkW245U/3eEbrXkTN?=
 =?us-ascii?Q?DZT93IiyWw8y+dzLjPr47HY1ccL6t7ZG4kjSHGa7Mv3G2HVhSbIWlzEV0Mlx?=
 =?us-ascii?Q?U5fuH6/T4ceUbSBNCOSMT3GxT5/poqdsokz5W4juJSX5ZtN04SbgefPxn3zn?=
 =?us-ascii?Q?qnR4zlEZmpC3DNVCb1w1evAhHKEd166LcVjyCgGnQmrIGZh9YAh0/Wcy/7pf?=
 =?us-ascii?Q?yOOYfv9hjl8fm8sHtkunKrGHOLvcMVm32YuhikqRkBR3QqkrfOE2miEXLRkN?=
 =?us-ascii?Q?uYXX55Go7weLoaawVkkjtCRaPe2BFKaGqtozedc+EGme+175nWoeMeryuxqp?=
 =?us-ascii?Q?JVuqEZFjD8t7uKd5XiKx43wbWt7mYUv4cEM1P5SGonSy9tkwReLhugE8vga/?=
 =?us-ascii?Q?U1V7PL6NZJRefAh1pz4TT01ySHAxNYuWbZPHCfvAKeeQH3E9k4aQmqMcmuY0?=
 =?us-ascii?Q?jXT02hDImmEW1VRbIo5J2HkzG79bbKjPww5mLYYaGM1hJwhkFFGy87RoK1+o?=
 =?us-ascii?Q?WW/FloHYHdTiOr2CzdrNLazAsUradaV9J9qIQFVnQgLNrEIa8P/xI0Coby7N?=
 =?us-ascii?Q?bLZ+IliCDoZg+VapX/iA91o370QS3n2ygyehbSwQCSZQzIr3V0LkVS7jJ8rx?=
 =?us-ascii?Q?HuE6jmjVAUvV3bkEtU8iCpj0On+7h2pMRJqWw26CXlLcMSof+LJr3gY1danE?=
 =?us-ascii?Q?DXs/AlOx2/lAn2tj8LdsQuPL4CbOWi7JHwTQsH770HOUL3i3O6wR4Lx3+Lel?=
 =?us-ascii?Q?umuSU0ayVYi51Y2tgaP9tb3INTgJIgImFW0FdZacSiJ5imL4a4hZFSZnHGlu?=
 =?us-ascii?Q?cGqnioMQy7USkQFeRpD8BLQiF4bqirV/xcsvTmEfMpzaOcMnSlhwRlTJIhpS?=
 =?us-ascii?Q?eU6AExSHD6nSY9Wgtp98S31jPG56bh6wiTSKpQpAzVS06MXuz82E+tz/ndd2?=
 =?us-ascii?Q?+RfWMJmdKm0XnSfx4n8=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dbae264-ec09-45ac-283c-08dd66037768
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2025 09:58:43.0610
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QILbauatjIy6XNN1bqL72edZZlIyec3ztbi1IdADC1ZQt9qgQREfbM7hX0QAy38KhyJVLl6H88ohoE6q9xwSFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11052

Hi Andy,

> Subject: Re: GPIO TODO
>=20
> On Tue, Mar 18, 2025 at 07:37:59AM +0000, Peng Fan wrote:
> > Hi All,
> >
> > I did two patches to drop of_gpio.h for drivers/spi/spi-stm32-ospi.c
> > and drivers/regulator/s5m8767.c.
>=20
> Dropping of_gpio.h from the latter is not just that, one needs to
> convert it to use GPIO descriptor APIs first.

Yes, I did that. Not have device to test, just my best practice to
do the convertion.
https://lore.kernel.org/all/20250318052709.1731747-1-peng.fan@oss.nxp.com/

>=20
> > But when I search lore.kernel.org, I see Andy did some work on the
> > cleanup, hope there is no duplication with your work, and I wonder
> do
> > you plan to cleanup the remaining ones under drivers/net/
> drivers/nfc
> > sound/ ?
>=20
> There is no duplication for sure, any help will be appreciated.

My pleasure, just have spare time on various stuff.

>=20
> > Besides the of_gpio.h, anyone working on immutable irq_chip?
>=20
> As far as I know that work has been staled. Again, it would be nice to
> continue.

I will give a look.

Thanks,
Peng.

>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20


