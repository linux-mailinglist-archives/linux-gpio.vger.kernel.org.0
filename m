Return-Path: <linux-gpio+bounces-37916-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id e68MHsreIGrK8gAAu9opvQ
	(envelope-from <linux-gpio+bounces-37916-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 04:11:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D16C563C65F
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 04:11:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37916-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37916-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=starfivetech.com (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9E5A302B396
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2026 02:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CDA928AB0B;
	Thu,  4 Jun 2026 02:10:21 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2116.outbound.protection.partner.outlook.cn [139.219.17.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8541B4224;
	Thu,  4 Jun 2026 02:10:17 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780539021; cv=fail; b=s5qSBbJM4qlchHAvxdUC28F4WMTA0myQs9BxzhQa5ArHc1V/gGSsf2cljxK4e3O6pRQuzCJudvDQMzqqdxa25fmkL9mtuBwbfaEGVB8YgtNnQ9Tvteo/Z2cif4UmIEjejTvfed4vqo1a8gIu8lk7jVplvpa7MVHbIoWLgU+Bgzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780539021; c=relaxed/simple;
	bh=ZGN88Mg8HyqLMvzsaExyTrpKGQbbcK3ecjFce/FxiRc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ui6DbdQkKnjIrs1V7b/VkAYwfEhVoomN0ry0NYCwlE+25ATvxYXNt2sOcrRhmAnUtzeS0T/bzwdS1CvYFs0l+aiZhZy6fkf8TlpCdawQ2JyDn4DYL7L33i2cD9w00qqjUhN9Vdqf8aXGdmfuhZvHfkw9zMxV7hhBzHyk7NQL1+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.116
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=etYmupaaIGWkV0uGDZXkFht2DKVSnfItVFdbaP+50QU+jayxJd/1AGM6/IlCdT9u2/8og+BpLd2ojjHbWCdm/Zsn9bwRAOb7G47QZPCLLiZ92TU4fyhGKO0S3YJ9VmiTG2EVwzUPAum6/c6qrJygwFQVWEeqYoR0yk9sp4Up1qjkmxnYfoHMhANTJH9cXmcBrurJnCPyDEVXhApBg6c6sdPS9hFf7P0Q6aZUfpKWa3r5lbbDGJblZVp24Jl5iu/CM4+eAcRIk1LF4q4W9b3zx+oV7F+p+l0FFs4E8y/PK9ZO7x5PkEglbQiiypnLfGJKJoNQL62EbpRjBcP4BJZGFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1SwlBrsDshKVkGkQpFT5G8DbmmYXdviiRXqzU4btQyg=;
 b=LQ8aOrVpl0VXevkM6r7c00fDQ0aBf432cCHziPVP6apObOKYXcUcSQ3TZiZ2UVadMCuAbKBzVzmiIs+vtFfVc03BRu/TUy+NI+ZN0Qq+l9chEV/FhkmJhJ2+4Limx9gE4ck4vY2JBvFT9XZn1jiWXOqTxb9rZh/YfPsALqTzUNYR2Lm+5d8SpBfAK8eSQzqT54bN+lP8J8FoEoAJ/9GlzYcHoQyScCj2EazkensKmWoMr7B14YLKUVXVkYVtSuf5HO6Arn1CihXnGD5+vyzK/QTpeslmfcr0Bj+13NxuuDtwKtD3XrHzPshHOll1muQY0EpNdr1YcFa4/Tfn8dlZaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1267.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 01:37:00 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.21.0092.006; Thu, 4 Jun 2026 01:37:00 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Lianfeng Ouyang
	<lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v3 03/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Thread-Topic: [PATCH v3 03/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Thread-Index: AQHc8x1i0QxsrZUKB0iH+Mtg4VCWKbYtCeWAgACVJWA=
Date: Thu, 4 Jun 2026 01:37:00 +0000
Message-ID:
 <ZQ4PR01MB12022B5C460A34260ABFCE9FF2102@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260603055347.66845-1-changhuang.liang@starfivetech.com>
 <20260603055347.66845-4-changhuang.liang@starfivetech.com>
 <20260603-groin-valid-a1d4445f7a6b@spud>
In-Reply-To: <20260603-groin-valid-a1d4445f7a6b@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1267:EE_
x-ms-office365-filtering-correlation-id: b5833999-4197-4d14-0719-08dec1d9c5f5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021|56012099006|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 bVTVwPdnHI9RuFD3pWO8mNfNa6H8oy9wal/W8ZFt1zHJqu9tTbbyiotJdm79vqDOunPbsNj7xw8NxHO41MCkh4cGseuW7FTWpIbZaffo/8bQRrLMT5DnEqJmbTLflbtAMOeMGTR/yWa88970UGCNFF7KGtL23wknHsPoa+QuzVCZ8Y9GmkgKF5RcncDzVqL1nHJJN67wTQwj9lkVDGsI+nILT24QhhTJ+CmEmyeI700dSxSPBlJAs5Kr7uD1JcD4nlBo22++N2LnHZGmERUhdzhpPloECYX6qb9bAr2nqZN4BBFEU/xp8iua6TQwl7jkvLaLzg4PnYha9/prkU9XP6XFb9ONpuXKxmdxorkBRP6ALRRWenMDm/JJoNvilimvxMBzGLo6+F+j6a5w2+q/hgJdaqqinKKL2U+tXXB2GaFTgB6hTeiaDAxrBD+fdgvS63MCtV0LLL8Q8pNeQELnrkw7t94JOzVp1F5AU9xCbxur3M+smkG7Reldcemw2dueBtY0dPuDCI2oq+UM+1IUI6KUZcLLDHhf4y2pbawhafk+tWX41yx0A3SYvWEb6RsY
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?BB9m94dKs7aZIHhP7fOWCGjAm4jTHjofM//Jfl4oAz5oWc6HX2aZgOEOghXJ?=
 =?us-ascii?Q?jbkIYwQ/E9TPpBleFNgQamxizy46/djLmZ/lwt5uSd5FbALLtyEzzWBI91so?=
 =?us-ascii?Q?4MF0cJcXJdO0MOwAB8yCLgkMxM4Tdtwm2sngAj1V1pGyN3E/BSP6Y+RuZ9ev?=
 =?us-ascii?Q?iSE1ClWIYmTJ7NkY59An++rbY50wCKUQordGsDMrZW5iOPd8a2d3cjyij8y1?=
 =?us-ascii?Q?aofe1ULRDrpChB3QT0Ujx6lyomWGOab3sKX/P9YK5XU3kIDL6Wg7Rjs2OqMr?=
 =?us-ascii?Q?sXp6yrVbTQFjec1P34MWNWQr1egbjI5nEuGP35kmAt9L1zDpNpuJk1ZR0LXH?=
 =?us-ascii?Q?DlEo3Yc6iPrdMtw1fRTEqQxmmZZ9wfB4/ORu2bxmMUDdhF3Ko29HxpmumFZa?=
 =?us-ascii?Q?PiORcMEQa1ivOcz3QTx4odS+JMav4O09X8fykXrYL+oB/YkrF3K0A1GC0OHx?=
 =?us-ascii?Q?pQxVsLbW6BYlP06D2TNfQdWLH4pk2KkyyhEvPKXVpC44tXZRk3LINGbcKcKf?=
 =?us-ascii?Q?1HHpMwP1qwZT5FrQZ8bX0+TotNom1z2oT1F5BcYAlLmE1bjZ8CBU3ijHGgrf?=
 =?us-ascii?Q?ivLY7AsSi93x5mv11QWtvibBvEczA1KVlWlRjeCyeSerAp1ozY2Ui6YWUHOC?=
 =?us-ascii?Q?ndh0lOmZjxSkCkJ80W8Ilq1ykMX8k0TrSwsInbrNg+MK27q4tAhHSxUdTfIT?=
 =?us-ascii?Q?F+Pp8g6F9WmsG+dkYryOWkuRJSvn5ellV6DJUJEkxT0tDJfXh1d8/VEkdQs5?=
 =?us-ascii?Q?Iwp2Vm9xRdN7WsGujZxZ/SAjPcDmTbpyFatSU08YF9+Ush35MXnlMnJCckDq?=
 =?us-ascii?Q?9/l2cHR0QeQqgGI2mn59PidKQryFL9avKg0zJmFj5SLlp4+9GGHLDY8Prl0y?=
 =?us-ascii?Q?nZs9IFLHwtwwcnULmVnkDEq/3uxnKwDh2i7xenB4YHLqFItjg7txPFGUx4Al?=
 =?us-ascii?Q?nyKKTxatEa7NdzVT0Dyqln9L3qAVTMBEOiaNPI67aE/LsGoLjmhnjIzVQrJ6?=
 =?us-ascii?Q?T+zQEHZ2LrjueGcpo+vaZBzorkDDD8Df784s+WQPTo/a+NqYRKfhTEhmoWe9?=
 =?us-ascii?Q?X892XGG+8hjn1dhGwWk9526bFg87oSJFhEMsLXyVOnIwqaOKsB6/NyjjEVYF?=
 =?us-ascii?Q?7WZ3rjdsYXE2vx24qROOJubtBEeKjh/2/4w3BGNAEvxucSyjObEzp8jipaH1?=
 =?us-ascii?Q?g5xINK95kByx+yqaIqRHe5YU4Jp41KO3X8EF/rWpPxwTkTGVtNiqT/TasqHv?=
 =?us-ascii?Q?FN1jZRlwwn+zlpqjXOQOWyrjX4/Gt8/Dd31Si/BGRk7o+rPsyiXN8WpDXdZG?=
 =?us-ascii?Q?EWXCKNBfa3v1rJIYxaunwpXO5YULleqXU3jfSI9hF+TtgBIsvCQfD/mlxw1t?=
 =?us-ascii?Q?WNX/XdoXFpXODSziGTUm19GlyFGfDt9VMuBQ+G7PXQSvt/+dWSKLGNcXdtel?=
 =?us-ascii?Q?srdhUYWVxpJE6OEJ7Q9trKhRw6mfUOp8k4nDqP7htSmrVGxvRWdG8EZswiY0?=
 =?us-ascii?Q?dpge/mJDMBhbA5t6ww3Yk1RgdLIKHG+Ufffh4Gv98d4w7SYDPVAgAnJrqgdv?=
 =?us-ascii?Q?mrhxsuqcbr9LFWlr7asXC0Uaz0nlg3p9rYzRfLwax3cbuweU5qxDCdG1xcZU?=
 =?us-ascii?Q?gmt3fvC8nNUtNe2N90As/AMVB9eFYR5SEJdQop1yCjzML4j8d9rDSJpUkyL1?=
 =?us-ascii?Q?Dfa4rf9eHQx8IoM+ooww94voqMZTonXDJUYktg3IHnKjJbLU2+8eO/N3R4Zy?=
 =?us-ascii?Q?BLF11ZRSH6SfhRxXbaoxy4H6vMaLXMo=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: b5833999-4197-4d14-0719-08dec1d9c5f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2026 01:37:00.6059
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I3sXz8f9m47fmKQoV6Ia2WR1o3ClW2xoUrMVsNaqn/nHtAPN78IEsh9a294WUNhOrjoaYiYoN+2U3LFYnVIfm/IdaPpuMZTySZE4rcrrVqI+RphCJ28NWU9iA5MIDuH7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1267
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37916-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:conor@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kernel@esmil.dk,m:pjw@kernel.org,m:aou@eecs.berkeley.edu,m:palmer@dabbelt.com,m:alex@ghiti.fr,m:p.zabel@pengutronix.de,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:lianfeng.ouyang@starfivetech.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn:mid,starfivetech.com:from_mime,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D16C563C65F

Hi, Conor

Thanks for the review.

> On Tue, Jun 02, 2026 at 10:53:29PM -0700, Changhuang Liang wrote:
>=20
> > +          slew-rate:
> > +            enum: [ 0, 1 ]
> > +            default: 0
> > +            description: |
> > +                0: slow (half frequency)
>=20
> Half frequency? Slew rates are usually measured in volts per second, not =
hertz.
> Do you know what the slew rates actually are and could put them in here a=
s
> the real units? Or is it just "slow" and "fast" in your docs with no prec=
ise
> numbers?

Yes, there are no precise numbers in our documentation. I will remove "(hal=
f frequency)" in the next version.

> I've got no questions other than this, so once this question is sorted, I=
'll be
> happy to ack all the bindings provided they're effectively the same.
>=20
> > +                1: fast

Best Regards,
Changhuang

