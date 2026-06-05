Return-Path: <linux-gpio+bounces-37999-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9OC4JLRbImq1VQEAu9opvQ
	(envelope-from <linux-gpio+bounces-37999-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Jun 2026 07:16:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E313A64524E
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Jun 2026 07:16:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37999-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37999-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=starfivetech.com (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30A423013791
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jun 2026 05:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DAC53BAD99;
	Fri,  5 Jun 2026 05:13:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2125.outbound.protection.partner.outlook.cn [139.219.146.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A01C356765;
	Fri,  5 Jun 2026 05:13:50 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780636435; cv=fail; b=X3tvdi891w0An9FAtZCCk6uAYJrduCnfnrprWHVW0ZRRIRh1U4rthqWfWl5HXGTbQhXbwhTW0wRcJdn4vfBT+NSc5rytDQVNT1k2619tPUjmq1/hcWNamzPWxaUiF6yprtPJs2HbOnDFDphCizgjvT61RlZ+RU3viq/RaSnpd6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780636435; c=relaxed/simple;
	bh=E/Ok+PEb/lcbV8z4urjJfJ9RZZ6HOdXFbBX1d3lonaA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=U5rmdU8xPxycLQIqXo3/NjQIgiqaTsdELMMWLuft3qYuDBgjWbEMh0nj56PMvKTN/j2ME1BINp7nLSoe8D20+0SE8ldWh66WVDvJGdfcMXjxKvouXbdsEBCySIxLBgph6YBE43Jm0Gsi2Ebv2TIzlFQYlmh/J3xyY28V9GAnwyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.125
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N2gZ/m0yp7pRQapUHTkd6P39Hy0p7GwE30iTJKhtYSzlUW8JOklqwXejBgjK7ypWzhD3fdjgVdgQEszfsTfW8fpo7O83VfKIJToHZ8x0COl4CmEW6Z3Z7wcEcuUJ5FBuRM/n0QtEi3WpM+52xgwoc1Pk+Eg1rLHn2fcdppIr+WjSQyInhsRYSeo+xcgzMei/0w02vLCXbQ+5V3Sdd7npzFZXmeGUQDxjJKjFIeQVPM1IynEhzrK5Mc7SoiACVNPxpLrY2Zxi9Mf9BjmT+dBrjP2Q+BdIx71uN2VEujGHBeXnznJmR0Ij5nXskMAjkzetKG+hJJrIav12MW1kuwSYLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D6G25yZMse2l4vDeQL+cwybm1IYx1cQBMYExu1ZE7sE=;
 b=TAmKhsAcruUs2dxcRqqUo3Gz0V/Vpf2wM4StK2AbnFIdwqzdaMC8csU2anxFKkWIERtxKze5zLHqBemmzM39c7WrkobRmzmlI/XbYE95tRdjbWf3TXi8UKs4fil/Ecg43O66upXWuzhqBlCUMT3x2i5ame2s1d32p2xEEPaVpUejUYW1g3SkIg0iLX7gC25VwnHXeIhk/d990vQ4uGZ8FdY9xzIlmfadU5U4LeFO7HKAyK25DyMxPdAk5RMf0Trc5arba/ig8Az6rQjBH+QQIURpQ4C29H2RnNGUq8pij0rnc4YXkAsA7QbrKhb48V6o2XNnwJUKkTk7at2Th/OhEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1267.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.9; Fri, 5 Jun 2026
 05:13:39 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.21.0092.007; Fri, 5 Jun 2026 05:13:39 +0000
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
Thread-Index: AQHc8x1i0QxsrZUKB0iH+Mtg4VCWKbYtCeWAgACVJWCAAQO6gIAAyx9A
Date: Fri, 5 Jun 2026 05:13:38 +0000
Message-ID:
 <ZQ4PR01MB12021C09262AEBEC976D7642F2112@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260603055347.66845-1-changhuang.liang@starfivetech.com>
 <20260603055347.66845-4-changhuang.liang@starfivetech.com>
 <20260603-groin-valid-a1d4445f7a6b@spud>
 <ZQ4PR01MB12022B5C460A34260ABFCE9FF2102@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260604-sprout-zips-c2c29e26fe1d@spud>
In-Reply-To: <20260604-sprout-zips-c2c29e26fe1d@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1267:EE_
x-ms-office365-filtering-correlation-id: 93cce37f-55ce-4bae-fe0a-08dec2c13400
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|4143699003|18002099003|22082099003|56012099006|38070700021;
x-microsoft-antispam-message-info:
 2BiEhI0fPo+zFLzNbMN0oQa1oWpqlJJCrrMf3S2AdR/vBerzqyVL6k+pr5TEm1wNqOLBkp8548BMfEL+TRGmcPGym43FI+2QNWWZqZx8FHnd3RqEXqXFNppfsziCyJTpInVf0cxX9UvGv1GOD9U2JaUE4UFwaA0Ip3S8T73ZRgGAz4bq0DYmDKs77CRE3Ne+dKAUnSGHsUWuQbZrDhqvv2ZCo1pvm+QnhN0AEwkF3FiuDv26KOIUBmqm9xLKwbBOOftY/QTPlVRzPHejWZK50G/9xd+t/fC/bn9VXKYld1L+RI7R75eZ1QJBDO3epawgPsh83HGGHwqw7mTa2kKmTzEAq2HFGQBNdX52eIvae6MTEypq7xREqbHTZKsiZqB2j3ondPvQm5wMClWYWjCoZlUB4d2utuEn1/P6sGK8zh2RsjQBvJHJQI5/fMp8+kmti9TS4oo6cIBnpgAwAOfukR5qZrB/eFJYkzAD+a84wBXaNdhXo8v/utxwUt13kz0iwkY1FZFOwzqrle+PcHF55B2JSs3ufa0d4WisvaTRYJGzWClAph6pHXfca1jZKCNO
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(4143699003)(18002099003)(22082099003)(56012099006)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?LfbR13eyqara5TDp99QbxZon3kg+F7dTDbZ6Zz28/PkjtSt4HHvf1gg25Co0?=
 =?us-ascii?Q?oAppAuZeIye66k5SEqNHUP36rwqAXdKTZvegcyiITF8i3OH9WiTQvoY1tL/Q?=
 =?us-ascii?Q?hhCxEh+8hW7k+OIvHjxYq3Q6FY0ZG1rcCtiPhMLrFo/ZEWxPf1X/icXoJq5S?=
 =?us-ascii?Q?7jTUxZgm8rIkg8nX3G9BLwdZ6lXWqT71nPu3ve2mmzdOzKbVpEW6ORK7Y/hF?=
 =?us-ascii?Q?AUa6a9OAC0ApmFMta5ldkqBHZa2YZ1WV/V9YfFzXRAeNEN/Lj2AxfAYIgx8Q?=
 =?us-ascii?Q?94AfJgTkxX7ixIMXbEOEaGpyyBZze5Ou0IbpFlDAmZuBTDLDhtXTmYjjfo1K?=
 =?us-ascii?Q?nBHk4WyKITHkZqppBt+94El625K4R6b1hTynue5AkKBdma5e8Wama/c2Sgyq?=
 =?us-ascii?Q?0lRBVRI2SRy57yZugtMYo23X9WVH0A0jBjPPYaq8GYBvqW+Bzfb96zOTJu2M?=
 =?us-ascii?Q?L3AwvYJfoan4FyRv5e9gtv72cgUxsZQBdxUffQd4SXhD5Ei9Uy+jYeMGR8M5?=
 =?us-ascii?Q?dUC9dprpSPiEQsXcBHPswmorcgzhZihta8vl/Yl8qPRrmQU4P6lK3MCDOOgC?=
 =?us-ascii?Q?82FCIHKaKKMKV8I83OdovK617/8Yqv9fuWD5iHTwEsOwQht+8F7hiBgeSwTu?=
 =?us-ascii?Q?5KOdwKq1jxMQEoPx8pigeR8VANQZnx4sR9L/Ot905UpdhEhBsEMKyHSVzXui?=
 =?us-ascii?Q?AVSHz6hqlxYa3xp82OKeuYHMOGMC5NR02pklNYSL+7nm/j6DxkUU8lHN+sZu?=
 =?us-ascii?Q?UsIztDmES1YpIKKctqtXAd9jnVx7VQ7XMTbXWSbhON2S7lvsbVbSK5oUR6RO?=
 =?us-ascii?Q?bTzOizW0VPSXaSKSiEexffAvPyKyIpVlMGkkKp5F5Mze+Z+Jk2tDDrtnCUWP?=
 =?us-ascii?Q?qj2bHTTu7J44t7vcCLEIeyUsPVEg9esB31wtY3i85o+eKnoqY5UlvCOccvHX?=
 =?us-ascii?Q?1oZY7eGi8kCXqw1tvULa7kTBDw615nDKUSaCkF2ZdRLPQfCQdI3/uy8HLh0T?=
 =?us-ascii?Q?xFbgb8+6a/LKn4KXO/rsS4vjNPCVu9zfxxmISHHn2QgezSUbu8faTxnWVnYk?=
 =?us-ascii?Q?+B1xjoici3tuUJNI0NVcmkrZ/sdd2kxL820HmTpBj3jg56mZKUZ5QK4YC1pH?=
 =?us-ascii?Q?bEm0bT+QD+pYOdithpdIiebXGAjLhfGa3hQeg2TOtMkFF9Rz4GlZoK7YAf0N?=
 =?us-ascii?Q?biGD9W9Ud+F8B+Dz4ghpLXw+C7zssDr67E2jr/Vm/JVQv+3QfrJySi5BeI+3?=
 =?us-ascii?Q?KCZu15Gamfl6Dn2x0FPRnQJnF7eAi8n5aF/F33419u59u3RNE544oqbNlq7q?=
 =?us-ascii?Q?SeIrBzbeA54P2AmB3WuWZXmbYF4dXGvtSDKqk3dp0s6XMn1DFqDfj2pQ7dPa?=
 =?us-ascii?Q?4W8Of4KVGf6MrY1QM0cmSHRJwZJcAVr3XgERLuZih1YBOR2QMJmRovojiPSJ?=
 =?us-ascii?Q?RPpE4JanWnNJWxoXA64R2xjw+9mlatEDO1l5U4DycEnsMYqKpLonMR6UdEot?=
 =?us-ascii?Q?Dx9Aihr7qbV7uzHt5XlQvRuazSCmHKmYMIuVtomsHcbxKoPSS5kNwFK9faZK?=
 =?us-ascii?Q?B66ZMeJRL671ZeU0uCTsoMhG8M8N4VbWw2atelyAeJ/A0X2f9asdFuG0VbmE?=
 =?us-ascii?Q?DL6cT/7+q4QI4sA5XxStZzmAGZXNRG1NZVw9fc9vKdA+gC+scw/gZKBpo1oI?=
 =?us-ascii?Q?1tqiubWOHTNvTYIWogmlyIpC9U7fQqsBqwxg0aCnOzaHQjYQwUv5CsJ7QjPg?=
 =?us-ascii?Q?/0XUBNqcF9H+e9pvNMBPqwuhjQAOli8=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 93cce37f-55ce-4bae-fe0a-08dec2c13400
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2026 05:13:38.9903
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: svdPdoIK1jO7AjzW8ZRCLFO/BUZBVZPtK6eDKaU9nwED8BTQzn9R6tVIT8i4SdB0SfxSeztuLg80i98TpRa+3zR779nxpFgJnZPXPvjpQ197eS6cizNPUOCPM+I+jWc5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1267
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:conor@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kernel@esmil.dk,m:pjw@kernel.org,m:aou@eecs.berkeley.edu,m:palmer@dabbelt.com,m:alex@ghiti.fr,m:p.zabel@pengutronix.de,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:lianfeng.ouyang@starfivetech.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37999-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E313A64524E

Hi, Conor

> On Thu, Jun 04, 2026 at 01:37:00AM +0000, Changhuang Liang wrote:
> > Hi, Conor
> >
> > Thanks for the review.
> >
> > > On Tue, Jun 02, 2026 at 10:53:29PM -0700, Changhuang Liang wrote:
> > >
> > > > +          slew-rate:
> > > > +            enum: [ 0, 1 ]
> > > > +            default: 0
> > > > +            description: |
> > > > +                0: slow (half frequency)
> > >
> > > Half frequency? Slew rates are usually measured in volts per second, =
not
> hertz.
> > > Do you know what the slew rates actually are and could put them in
> > > here as the real units? Or is it just "slow" and "fast" in your docs
> > > with no precise numbers?
> >
> > Yes, there are no precise numbers in our documentation. I will remove "=
(half
> frequency)" in the next version.
>=20
> If the rate is actually half, then you can say that. It's just "frequency=
" I was
> objecting to.

I checked the documentation. It doesn't explicitly mention "half"; it only =
describes "slow" and "fast"

>=20
> >
> > > I've got no questions other than this, so once this question is
> > > sorted, I'll be happy to ack all the bindings provided they're effect=
ively the
> same.
> > >
> > > > +                1: fast
> >

Best Regards,
Changhuang


