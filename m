Return-Path: <linux-gpio+bounces-32224-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULVtCsokoGkDfwQAu9opvQ
	(envelope-from <linux-gpio+bounces-32224-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 11:47:38 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8411A482D
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 11:47:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6645C30F05ED
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 10:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4799E218AC4;
	Thu, 26 Feb 2026 10:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AB2WydAS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013046.outbound.protection.outlook.com [52.101.83.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B538034CDD;
	Thu, 26 Feb 2026 10:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772102790; cv=fail; b=Chccp7JIdSnIiV2G8chuId30/epRsjPaTQDoi3MswOObtwCMO0vnPL0VpGNJk0SAwiX1pLR8+JStEfyy1fllC4RAFpXFt22epe52W1MCHDe4mG7tVKlkKo1Lql0uJkTt4mmiUcUPHIMGjasIsJYavkAakCRAynSnHDBkcja7SsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772102790; c=relaxed/simple;
	bh=brsGmA1v94cC/4hp9mlVCjjIrfvOUwExKbws8UsNYJ4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BNvYqiLBj4bOHayRzYUNPM4S+0t0SMFCftIEBnKsKl6WhCGdoA8jdL7E9WyxnqDidAjqcOXECVNCj3/jgEepLEsFjl7bmoOS5F0lLBGR26xX6BcgRah9jCGuKyymsFq0JbFc34pNL+ZhB+AohAsAi9IBMY78/VaoDW+U779h17I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AB2WydAS; arc=fail smtp.client-ip=52.101.83.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KWCdKDzl8ecdPHYcKTWKTRibHi3XwcsP3uDt9yVJgA2RB5WJaZ/CUmScGHwXEo2HA1qkFNki48SjsEgxlEypXvGiqVh467316UTM/S5p0FAT3hT/o2R2Z/f9pTIhhDddcLx+G7aUwOfZKIFrlytAoRL5ktAn0lyC20hnXwMk19U5Lv4H53Hpd5FdPVTx0caJfMcBX+wDrZKWgvm1AdPK5pJk7K+nLPuzbop3QdOz/LMwvHCOuWcV1IRaiooGwPboIHzeZ9mc//iQzFUptneh9fSUu9tluU3TQ5ody5hNDos5fX01toiXMinQX9B5dPGt7w4EelZZdWOr6bY4SzS95g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLgmuz0kmcy93U5beUhUfHw/DSy+LxA0vGtvijta5L0=;
 b=ae/gw5sTjo1n0kLC+jRbMuYom12IDlisCj+Wir1os/X1aZB8HlaYwSqKUld2PSef0g4qsUPO8RobSIbaaYcp94DNryayVaMGQyr/tu71cA2pPvurpMIYW6HlVgm1d17qxfLeBlV+iI7FP2q9bMcFMB9c9CvIpNPXY7r6JOuT9wBd9GnX3Uh6VmIm+GDxlw3EFuHxKGgGkDOkuQsXDoPf34VZHwy7I20a/yb9OOKJVWn7SluJQHfSmQ6qFEOZnar3uz0Hqqmt0mOh75q8FCBquV2gtqWRlUDU8QoNLVL4ybyxqzidS0tf09pzxZp00GXlXsaduKlLkjFZ/mpn0+m22w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLgmuz0kmcy93U5beUhUfHw/DSy+LxA0vGtvijta5L0=;
 b=AB2WydAStgk6nJehVb0Q+W3Jl0ZS3yEHPaHl4nbAEk2AXA1/A86OsrkVbPpJMj+P4shWWw8OUVeBduHaUqBFVJt0ICSrx9PH3F8sni49eooDFxwPJw7k9uHpoeyW+Y7FVYGaQfBqm5f+dIL7CQnAD30820M9OuGzsguK4TwVQISuFyebhHL0u2b33BCMUvfdmXvZlXt5v64dlu68OBh4lSgy3feD3qblRcB/XywWA1nlQWVmSkDRhPlBkzngMGpW5OpBM3u+KM7nectFIbGD8hN92A6wSImmFNXGEm5/vq5QRhNXWD6j96PHT66UDBxAFjU66XfT+W9IXiDnVmKryA==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB10193.eurprd04.prod.outlook.com (2603:10a6:150:1a4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Thu, 26 Feb
 2026 10:46:25 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 10:46:24 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Aisheng Dong
	<aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, Frank Li
	<frank.li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, dl-S32 <S32@nxp.com>, Linus Walleij
	<linusw@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi
	<cristian.marussi@arm.com>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] pinctrl: imx: PINCTRL_IMX_SCMI should depend on ARCH_MXC
Thread-Topic: [PATCH] pinctrl: imx: PINCTRL_IMX_SCMI should depend on ARCH_MXC
Thread-Index: AQHcpwkWn2NCemsOUUqU8WHKbktVeLWUyr1A
Date: Thu, 26 Feb 2026 10:46:24 +0000
Message-ID:
 <PAXPR04MB84595BC43F3205ADFB00D95D8872A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References:
 <8ecad26c23ba35741f167b3753cd19e72c33c0b4.1772100926.git.geert+renesas@glider.be>
In-Reply-To:
 <8ecad26c23ba35741f167b3753cd19e72c33c0b4.1772100926.git.geert+renesas@glider.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|GV1PR04MB10193:EE_
x-ms-office365-filtering-correlation-id: 574014a4-d752-4376-4819-08de752449b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|38070700021|921020;
x-microsoft-antispam-message-info:
 aI3QZ9NR26oMi6+K8qJj1qUPp//6j84M8I/9bXz1mB+Ewh4qwHrctMDDpftLgN67mH91kgIT0n5tZEtU9mAfwbGkldiaaAUh5w6/AoErgS2wqfxUmGIra3yXvHR+HqB+tfZzmWWGl73kzdfrPT0FSHIPH+v1hA6eSsVZXHYJBGuXmsfYrlLKu4LibhgEWcTdztz0ul1CijSpql+dfjLj2jhKV3rJevRbObUfBOrF8raxl8vsYkZvot2EaR29ewGk+JIBwk8SF8N+iv7TX9c0/M2YzEe5X8WB033RAMe5P8ypLlu2NMg/Z2pLgAXg6HsoPzeI1/cvTJ/FsdCSpabiyl1S9wj/jTbZzc9ZqKjXU2cflIMSDGudPm15j7+pGRlVmNb6veSGNwAdZJIQlF3MpHFyzrtV0fXUy0t5s6cuCSocBvM/O5qlu2QZuHLP5BvL2r01QyzdB5i9x6L3Zm5+A32ZubENzTYrc6NjrdxCkiiZYv9XytTjA9e974+d/eXyUjpLTEx59dbVL220mXREWCnYrZsRyZYEqUErf8DnuMhD8dT1yb+YjdhFgpozOnGoHJluEoX6MoyWxm15WR3v94XdUtIlPJqx+M2okOKo04P6DWC5+9ToY3sh92AeKSdjxbTAG+WD9eenv+Lu7ndkVMn6nFH4sRQhBfDUo3doeOilRjgY/Z4iuwqK1iEZYJVWwH34BkprTrJWjt0OxdXxPtraKd1B1WC9t8T2R0CMBXSqCaV6e8zubRmIO0B/twQ5rrmwvCCfZAJsKLQIgAgxcrxLFpHs35FYIB8KRigjXY+x2+yArFuu99b+d2xrKVg4
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?j3prLx9LyhTYeO8Gmi4wR1Ko9ba5tQDZzih14UUOc2m5xGb+3SROo2xXX2wI?=
 =?us-ascii?Q?97H2BHc0n5veGi/3xTkgtQb+3TZ2Ks6WzpcByREDK6etewB+pccqBfx8x0um?=
 =?us-ascii?Q?IKCnwOEHTt+wmPtK9xO5aDhIZPOpBQ6oFjKJhjKM+/2ZNSAuz2ylF9fE0Les?=
 =?us-ascii?Q?itGUZ+uJFPPSfqwvvwF0bRzAiplTCisijYJuIfSDMBdGcXoIWgXG5O82aHti?=
 =?us-ascii?Q?IkaONkCqSi/xuFaUHJcQCmyprLM5OpKTZ0ANmpFv/Su/uEuVs4OL9OHidiwM?=
 =?us-ascii?Q?UYJxkZGbbattowh1+Z2T9u1yrTQvuB0GfnazkE4+Q5viZwDITCspNvTJQsmr?=
 =?us-ascii?Q?O0MDTAzoZHYZYWAyC9tWVnW9X3YsKelO66XinrBYD0U+w8mFQCFEEdXXYToW?=
 =?us-ascii?Q?YbMkhSh1CjUflA0oDI4LzV/J3DrvMqKwS4S1l74tUtYJKMEW830wDnhxJ/S3?=
 =?us-ascii?Q?pd9//vmGd5RxZ5Qn/PyKoPuKn/HObiHWLE8yd6ZxCHf7YUQtvlQgWQ6BxOsu?=
 =?us-ascii?Q?6SNtNVz1dDNMAu5Me7EslAjWES3mhzJE/cIu0Xo5n3prut8EgQ6gHCCkzQbN?=
 =?us-ascii?Q?hLpNp6h5iZW2yR5+j8YShqcpq2xrxRv1gxb6vkduGP5HUx9BXoXtFencVgSx?=
 =?us-ascii?Q?uGQUAvcNWe2+f33if+B0bxm0Kr52cfiZ8JtCh461RdFXwOct/abLtgJQ4za2?=
 =?us-ascii?Q?2rSTVp44AowCKrb2QFh8ResiURl7cEjpS7NWDhjNm3x9hwNvkmYOj8nPksnX?=
 =?us-ascii?Q?8B1C1bqnSJ4SV81SJuBY4akzqhUP3uEMpbTdBRERFkwU6iCqOJeCERxDgfwg?=
 =?us-ascii?Q?JTrcbIay4WVoDv9EcLoK4+KqF/RzpWPbHJy+F7G6h88tBm+7qBrJGPuFklbH?=
 =?us-ascii?Q?gRxUvypzxqk+ANnQ5Hce/WhhRHdqZPvOwgH6mtg44QtWUmRLatrbKo5Db7kk?=
 =?us-ascii?Q?zJUkE6OXy/3sIXNDAwsmk5460nu+oUYUXp4HhMcgjJdATN7wshgMc4gGQEOo?=
 =?us-ascii?Q?Lt+L2visiHc6cvo+jadAl5QPvoXaQRg1qkwkjIDCV61OnGxfIMD15im5/yYT?=
 =?us-ascii?Q?rIVGFAueLbn8lf8Ytb+9vydwmYaRH+aSa9CCux+E62lDT+dWrq2PjDIg/X0c?=
 =?us-ascii?Q?HKs9V6y6x5QF7IBQdlH/zBK8BrNHMMUrwedYnjEw6ghal6n5eiDsQPevxPAR?=
 =?us-ascii?Q?765dM1qCmyDHoKWlzXrFBG38+K0zGAX+RyxWVRyrhtIbLkkwzsNrMRCV9KPz?=
 =?us-ascii?Q?LuzaPwkHgSqM7ZpqH+IFgH/bYNbdslvYKVfVd9GhxF/PjWmMX4DhIAI47zRW?=
 =?us-ascii?Q?+/LlL4wwIjBQjaC2yFDDI2Q6hVYBo7RZzTKFLJl/m1OCZD8JdHG5Jk8AsWWT?=
 =?us-ascii?Q?8Go37sE2V2Olix5+3oNqFjp2YCdaLu19UyHaT8ayTD44C6by2PkZayWr/JNa?=
 =?us-ascii?Q?oYxD6Mv+ToOh1prxjtvNUejsNy3FuPRJGoPokYlJrgLPK5GiP6HpqAeVg5VO?=
 =?us-ascii?Q?Lxzs9Xcx23RQntmcDt/WjBE3IVTHfDT1FptxnCB0fEyAgaO6o3fZh9D0anu8?=
 =?us-ascii?Q?TjzS8B4NCsltWhgglEQyOt78tjr/tIxo/jlNqtAkIgB0ZMBbIczS5ppdT5Ly?=
 =?us-ascii?Q?QsJzfmGYv6o9VriDI+Q8pEqMSTzMhnrPj5Q4Stk+EZKopRGSVymkLu76weRg?=
 =?us-ascii?Q?nqaMR7JE9x9FC6SgFKzzVYmYRTUf3fMldHFuhhbkBpTv4YeM?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 574014a4-d752-4376-4819-08de752449b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2026 10:46:24.8684
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Erh9YJgZRaea5iFzCooZ+/F1qg22j87QawOvJE9wLt9xZmlMmn8pttGRybe6HCMuDiXS2e0P2nSK1G+9eXLmrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10193
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32224-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,nxp.com,gmail.com,pengutronix.de,kernel.org,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email,i.mx:url,nxp.com:dkim]
X-Rspamd-Queue-Id: 7A8411A482D
X-Rspamd-Action: no action

Hi Geert,

> Subject: [PATCH] pinctrl: imx: PINCTRL_IMX_SCMI should depend on
>=20
> i.MX95 SCMI firmware is only present on NXP i.MX94 and i.MX95 SoCs.
> Hence add a dependency on ARCH_MXC, to prevent asking the user
> about this driver when configuring a kernel without NXP i.MX SoC
> family support.
>=20
> Fixes: b755521fd6eb22ac ("pinctrl: imx: support SCMI pinctrl protocol
> for i.MX95")

Not sure this deserves a fix tag.

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/pinctrl/freescale/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/pinctrl/freescale/Kconfig
> b/drivers/pinctrl/freescale/Kconfig
> index 8d24decd3f074ece..64ca014ebfc17dfb 100644
> --- a/drivers/pinctrl/freescale/Kconfig
> +++ b/drivers/pinctrl/freescale/Kconfig
> @@ -10,6 +10,7 @@ config PINCTRL_IMX
>  config PINCTRL_IMX_SCMI
>         tristate "i.MX95 pinctrl driver using SCMI protocol interface"
>         depends on ARM_SCMI_PROTOCOL && OF
> +       depends on ARCH_MXC || COMPILE_TEST

How about this?
depends on (ARM_SCMI_PROTOCOL && OF && ARCH_MXC) || COMPILE_TEST

Thanks,
Peng.
>         select PINMUX
>         select GENERIC_PINCONF
>         select GENERIC_PINCTRL_GROUPS
> --
> 2.43.0


