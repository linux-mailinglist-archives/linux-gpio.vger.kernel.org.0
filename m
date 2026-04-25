Return-Path: <linux-gpio+bounces-35521-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHS9IDt77GlaZAAAu9opvQ
	(envelope-from <linux-gpio+bounces-35521-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Apr 2026 10:28:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E515E46588C
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Apr 2026 10:28:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CFB8C301C124
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Apr 2026 08:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D71B933F5B4;
	Sat, 25 Apr 2026 08:28:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2112.outbound.protection.partner.outlook.cn [139.219.17.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF4A9460;
	Sat, 25 Apr 2026 08:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777105718; cv=fail; b=i5n66/r1m31Dl+d0DDcUdox9knu2LHXSuY6KT0xvGDzRhn8Ka3tqEU4ghiVJaQ0fwFzYcnphFIftZUoQBF7okZsjgdhv9M8NzVsNzYvzCLLZscNKRIm3pXLMmztbWIYgcfkAtKq4NADhYSB4vjco/SUCZlvxa3CXjjhoMbVbJvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777105718; c=relaxed/simple;
	bh=jmIEktV32QhVFiEAQwea4ElU+Jt6ykPB/wV/xN43UEk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KVY+imSCinR4+0mlgL0Xuz1L/f0dFNLeQ8RUO0/yCAQ66cLDwkpfKqz2OgftuGYMC1Js2gYYcTIQ66umlEIhMrBXlgwALP6AJakGcGl+EAU7YEdQFKsTvzePyirPDkzltJf72kxj5KuBe2Bf916bCm/0m8/LwdRDl4SmE5iHYHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eUm8NT48ngpIpjvh+KKkX6Lt04JkY0kyexkzPYJ+dLQbANzQ/OGbN9H0RPeW6mmPewGUAU4kCvFdHJwv6P4NxTU19YoSBfLQ+aDUH0MhN62fd3wGiIizWQMmUH5ETyKrUKEEQ0848FCTcmRNjBkQuCATg44as8H9fHTYlS/QSbY7so1StU3yE+qoOdxStrxFlGM88KQD8eJBsSWaSOfXgHitMooPS0qB1RTV8qgWF/urZAhj/4YaUSMkcB2mAMgbmcQaANTQcJ81ctmu7Ew1AOMRcdG2Lc3kltVEPE0iEySnkrM0vda/YI2oG01qS0iNkK1jpudLlDpy/HD/y/iOTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OpNm3gOCZiAuMiwmpL3Bcyi6BhvV1vSfmQOCo41qS+Q=;
 b=Hddsm+h0PrvDZWJOa6cEcW1gbimrCLa3XoqHRAbtaEytlOekpsGtcGRxce+PYALgzGC0FBaflAB8oQxcrTJMJYu90mI9JBZW5bmF91UUon/AXTNaU5hOQk6ljtRIWmsif5bH3vYk3zLliQ/OwdOLrkFwvJlsvaBbhVRqVv7ZfoBui6vkJe/sJe3lQXmWKygIjb07tePMl/ik0ceMi0N+U5ZSsn1RZ/s294FGQzOYR4emSu6udjSsYnHi/cDqCRCmFtgQLLQghHGkCwd3tzU4+PoiJhPs3fYJBK+T7H1V5+yFWd8bfd5ahpv1jFCjfkds/864u16zngFpBaEwNho/eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1162.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:11::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.23; Sat, 25 Apr
 2026 08:28:27 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::4386:5cc4:3bc4:4795]) by
 ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn ([fe80::4386:5cc4:3bc4:4795%4])
 with mapi id 15.20.9846.023; Sat, 25 Apr 2026 08:28:27 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Rosen Penev <rosenp@gmail.com>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>
CC: Emil Renner Berthing <kernel@esmil.dk>, Linus Walleij <linusw@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: starfive: jh7110: use struct_size
Thread-Topic: [PATCH] pinctrl: starfive: jh7110: use struct_size
Thread-Index: AQHc1FSOQCufTpFWXUS3Fp05cQifcLXvclCw
Date: Sat, 25 Apr 2026 08:28:27 +0000
Message-ID:
 <ZQ2PR01MB1307BDE655197786EA27A194E6282@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
References: <20260425014029.438186-1-rosenp@gmail.com>
In-Reply-To: <20260425014029.438186-1-rosenp@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1162:EE_
x-ms-office365-filtering-correlation-id: 054cd05b-2a5b-451a-002a-08dea2a49fee
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 qhxrzWj7rVkq67IIUmGr9YpEuHsiWtyyvfWzWRmCChxu91mIcrHVq66tidHhCVIJ/9Crg/a2FLFsdyc8IW65ujqUzS+yPUrqf7HlW3xrm5xDSESJ/TQ17s9UkAT9qG8HsdAfbu6g9a0BCP6MMMpUJLynxRG0w7jpq1Bkfujv+lb1kNbLhhc8xK/Nd0xohNqcbSJjqkhioBAKOIUIBoHOlsixvrXpmLM+8CzKGpYWpb8Jrtp0QkUTphQt2+MuY7WjL4XOlUyj2JgFGYPDhIVaETnBKTnUp5FXw1Vn539COVwtSagMO+ZsdyA9XpGfS4nC6axEzvUhQrr/4KZ4ZDRVE4E7Sxpwuv8KLcw+MGclENvVsIKLf9gD8WcMHdhmc5ulqGJ4UUFKVXyqcE2TnjAF8rkVJ1CMAWzWzWtmSza73t/T7ZgCoIq663zouNQ0R0+b8CD2SFEsp7sDfryxGRIk/q12sd+d6pdwuxzT40e9AGkvu5+myhiNx+9oQdHOu//4wkwr5gJOJqmw5Fa5vpHksaLne9Me7rLgUu/O+iAIxgRWsamFmFYviVQ7oomxADzj2PQu3uTvCA1cIyKkZ17wm50jCdIHOnsYfgw2+M2rGhs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?kjHDxBiClisBQis6iTYmgvfqk+e5urUWGKFkfeMTcidULdWpuemYu3M0bEoH?=
 =?us-ascii?Q?oH0DFOE3wF7xbGXLDY7n6IeDh7S7Ru1ztqC+R1RrQDrItjyAQs7TZpaWd4Ih?=
 =?us-ascii?Q?tQ0Gxs0p7v/QmB0xlozBcvVUSd0ZgLQSTvbof5RFh78l/E4q9nUT7PJRSIOp?=
 =?us-ascii?Q?tOjOETjEb0F3ll8XQ7yVsdfnfZQkz584ReXgM2Jw8DkKdhLEKs7g3ZGzQuvC?=
 =?us-ascii?Q?v92ll3rO4nNmKRTycGidXy6W9ElP68lsKlrmiKiPZAvsySUYRMCVKuYGCXoR?=
 =?us-ascii?Q?Il+CzKU/wX98gB6Ewb3JBo7mmu3/HV0oEMA94XU8f70T0+GapJwIbEABwri5?=
 =?us-ascii?Q?nskV12NahsX7PJNyzZISIPCgaCvDS6l/pERSFp3yMFfgQ/U1h78uNzcTfbIY?=
 =?us-ascii?Q?SWPRnlo1CoVybPhMU+0jSmkMqfGD1piryrmBestKsN0VF3JenPgw++gjcqwR?=
 =?us-ascii?Q?kJ6FqblO4mpFWXTyFBeu7mdw3xQjuDQU2tcvagvnxee6TY1MpI5YiuDt1CLg?=
 =?us-ascii?Q?Nv/KB71JlySiweQS0rZFKYtemhVyZna2IoXm86EWNuXBUcZftI66piRz/Tcc?=
 =?us-ascii?Q?21yOqpX8skBmaqjFPWIeeCUrYYk4uEMoj+4z9cDfcqxEEtA35lfKWZCGZwf5?=
 =?us-ascii?Q?kTNnqkp0cqTEt4wNmzpRaOOhUUaej2ldFivMPXJ6U9utWSnzIDfPS8rx/Oil?=
 =?us-ascii?Q?BE1nkDLUIrTk/jkQnllHpY/rc91Wa9c9wLYbU07LEjL915TzMnDn3Eimfl5p?=
 =?us-ascii?Q?fNetqx0T6jYeIEuuTUE1OKAVJBDJsLvNeX5s967IHqpCOTvB1TYWFiJA+uaZ?=
 =?us-ascii?Q?B7phvsLY42ec8Ktv5R/oJKsbKxsi3JR1PeJH7Wr0xZjawmcOXOelmV4dYqKa?=
 =?us-ascii?Q?H+f6Y9vheEqfGzQK8+xi8y2diY6cxJZxF+mMWWQSnN8eFaaXh1pi5P5z9mzD?=
 =?us-ascii?Q?1nSUaKunMcUj+M2CbCE55/JJ71S7SBk6shxh4p1qmw4sqe/s2mAfGoifX23d?=
 =?us-ascii?Q?43ScGZ8Uf+PjFkevw6coX4M2vL9FSNzmO++XmLPQHKrXXMGq9yOvQB8WxujJ?=
 =?us-ascii?Q?BEnk9vhhNBpbecvc6H/6cvkC0oU3/JBsbgMaj4enK6gr0Pk8zM+PIdMh+1Js?=
 =?us-ascii?Q?mUH19pbBuOsuQHsbg35TFO+NMAzHmk3msB1b7KxbfscKHlV4u+glVEwMwYmi?=
 =?us-ascii?Q?O2qC42iHXRM6ERZITSWDiSDizfnttvAqr2J3SPtl2MBS7OUs9JR2DJztG0AH?=
 =?us-ascii?Q?24JGIcnfAc6tVZVAmw4LEze+oZxMcU11h/V6xE6HBaXeoYr2Tr3cXzlaKHaq?=
 =?us-ascii?Q?JLVf/bO10arfTQl5YuqWRQp0PIZr598XghKpcunQIMK9Pif4psptwqH1SRbk?=
 =?us-ascii?Q?XtKgKCturTxuDvZ2HUOY0C8iH/PpvXNHFB0qIBZscsNPeGXqKlpdl4fo/idQ?=
 =?us-ascii?Q?erl49wLOrQRIeQEil8no5brbeUyI6B9FhrazDLhoocW1CyDSPd6+eW7ruJ9m?=
 =?us-ascii?Q?zQnTVOm31N/QAOtO3xFLfAGmklEfGL/1xRr52JFV2ERVjKC8Q4/TMVwFpghp?=
 =?us-ascii?Q?CD53Pn/rb2x34RANxKHSGKr6J+wnrTQYEZKqmIywbrmJ3V2/D2GJAmVjuvM1?=
 =?us-ascii?Q?pEEWI6jImPKpP3p4la6uD8hzO8depySRzV8nXfylrj5xuuvRISxvLsqH/0t8?=
 =?us-ascii?Q?VZ3ma+wTYAyVfEzbNyvzfzGIfGqAUaLoPHfxYq8XKllsDZtZivLT4DHxo6Xs?=
 =?us-ascii?Q?SOW8NTK6Yw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 054cd05b-2a5b-451a-002a-08dea2a49fee
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2026 08:28:27.4470
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iRNYVe6uul6ctCRUqCHAJzoq0nm3BpwE9fAhzJgvxKbrFmkrc+SmAKqZrbE/eZd6CzjpdqEIcW0FLv45rSOHZMYfMaxJDbb4ThG7jO4+ZUE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1162
X-Rspamd-Queue-Id: E515E46588C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-35521-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hal.feng@starfivetech.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,starfivetech.com:email,ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn:mid]

> On 25.04.26 09:40, Rosen Penev wrote:
> Instead of an extra kcalloc, Use a flexible array member to combine alloc=
ations.
> Saves a pointer in the struct.
>=20
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Looks good.

Acked-by: Hal Feng <hal.feng@starfivetech.com>

Best regards,
Hal

> ---
>  drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c | 12 +++++-------
> drivers/pinctrl/starfive/pinctrl-starfive-jh7110.h |  2 +-
>  2 files changed, 6 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> index e44480e71ea8..3572e8edd9f3 100644
> --- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> @@ -857,17 +857,15 @@ int jh7110_pinctrl_probe(struct platform_device
> *pdev)
>  		return -EINVAL;
>  	}
>=20
> +#if IS_ENABLED(CONFIG_PM_SLEEP)
> +	sfp =3D devm_kzalloc(dev, struct_size(sfp, saved_regs, info->nsaved_reg=
s),
> +			GFP_KERNEL);
> +#else
>  	sfp =3D devm_kzalloc(dev, sizeof(*sfp), GFP_KERNEL);
> +#endif
>  	if (!sfp)
>  		return -ENOMEM;
>=20
> -#if IS_ENABLED(CONFIG_PM_SLEEP)
> -	sfp->saved_regs =3D devm_kcalloc(dev, info->nsaved_regs,
> -				       sizeof(*sfp->saved_regs), GFP_KERNEL);
> -	if (!sfp->saved_regs)
> -		return -ENOMEM;
> -#endif
> -
>  	sfp->base =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(sfp->base))
>  		return PTR_ERR(sfp->base);
> diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.h
> b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.h
> index 2da2d6858008..188fc9d96269 100644
> --- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.h
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.h
> @@ -21,7 +21,7 @@ struct jh7110_pinctrl {
>  	/* register read/write mutex */
>  	struct mutex mutex;
>  	const struct jh7110_pinctrl_soc_info *info;
> -	u32 *saved_regs;
> +	u32 saved_regs[];
>  };
>=20
>  struct jh7110_gpio_irq_reg {
> --
> 2.54.0


