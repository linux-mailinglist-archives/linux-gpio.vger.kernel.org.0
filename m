Return-Path: <linux-gpio+bounces-35636-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKHmLFIb8GkoOgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35636-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 04:28:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 190D847CC17
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 04:28:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C53BB3033FB1
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 02:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 864E4392811;
	Tue, 28 Apr 2026 02:28:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2109.outbound.protection.partner.outlook.cn [139.219.146.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D73F2D7817;
	Tue, 28 Apr 2026 02:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777343302; cv=fail; b=OW624C5skTYxUaQYKfNXU2NszTAJQbtiKI+GNU21UZt+2+5s3CQLUxS829lUd0ipvXPrGcJ5bv5IVJHQv/9kHcaEBTwExr2llioFFlpxnNvm/ukPiQy2pMhCxRSsYnzNoFsi8G3+Sh5uRPrSTGUrzDAfhw4ANGHu/2uahVnpEnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777343302; c=relaxed/simple;
	bh=LywohSS1L/5z34XKSOPH7b9Citw/lqRDI80r4X+1Vs8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kGLUl3veiV0G29lReMSms6a+8JXMbbzEQaVOofUBexVqk69iVHa3+pjIkZu2AtudccQDG7aeYGjxpGSkma5LuxE+h6ZQTXmDoW3E3OjiLEsBtN7XLvi0XjbE350A8Ruks90N7n/g6IgiFREPSVHIYD/eWOcGnAaZB1AQZ9IGmxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B6Y3kFUbPp4xP3WYaNZZ6O5A9KmLSVHPmhoAEjQjuzFEnPBzqEuFbW7f1+XWeId99/cZB6qOOaY2y3i8ob34aAfKyaXMYWDUIRQt+NhV9tamjIcr3uBuz9DtfTLGtZJjzUnAulR3G0U8QeL2rYS4zCQe9gTfbrBnqHyCWNbkLgzilMNacCMa3e4YAxRbQKOnXoDYa6k1rnieFYOF9KCDq6JLoUmV/6lR2RvS7/Y2phspD3s1KIxxWM0Bgee/b+RhTd7YlkvtOe5a5kYzJp1fG4rl5FAHRgBc8RGXhnjR0SdGalBIWLfq37qBDIZSa6LOh3/HefmvmxAA/PC0y9cXMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bVmKU0y9H6DvB1VoYbFSPvXvSmhG4TBrz1vlWZ2Uq1c=;
 b=oBLYgbPKnnY9YpFSx6IJpb1iqTb8lnNQ7lW+kTL9+d/NlpAI8MW2r+Vl1MYF2KIQzFt4I6LsrAJJAdZ+glQFa83SV+CIPZNJSmG4kacOZgj9XnArkySdq2HMXb+72YvvH+uInLvXmirnkB1D+uCdqmuP2HNVtMBQscPiDb+3pTqejO9HarKwNPnbT6C4ldOPj8h0Lklp548Ci3oF34wUPGvK8sxoQtqWsAyMS5YAOWQt0gD55jLURsEyZAAuQybXct5S1YGabglGroHhc/y/zW5hznV2srmyfBiazaVqj7iETH0Jdh59Sccc1ZPSlTeZJjY6QFfpothjHUSsQOx+dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1220.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 01:53:50 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9846.025; Tue, 28 Apr 2026 01:53:50 +0000
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
Subject: Re: [PATCH v1 20/20] riscv: dts: starfive: jhb100: Add pinctrl nodes
Thread-Topic: [PATCH v1 20/20] riscv: dts: starfive: jhb100: Add pinctrl nodes
Thread-Index: AQHc09t2Y3oqygSoBU6DDuGHz8ReWLXucGEAgAVLnpA=
Date: Tue, 28 Apr 2026 01:53:50 +0000
Message-ID:
 <ZQ4PR01MB1202D54EC635F8200E02A3FCF2372@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260424111330.702272-1-changhuang.liang@starfivetech.com>
 <20260424111330.702272-21-changhuang.liang@starfivetech.com>
 <20260424-bok-storm-4f4583686777@spud>
In-Reply-To: <20260424-bok-storm-4f4583686777@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1220:EE_
x-ms-office365-filtering-correlation-id: 57102905-c65a-4568-08e5-08dea4c8fea6
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 FaEV/1DpsAbJ+nzLpl1a0aI6MGMycQNYh4HU9JdaedSjZY07tH6mCYxhQAGEG/GeGUGsn1+5Dxt9qGauCFCSzyvB1pruduMHgEggLHqgiSmtj79aS3HbK1jovHs+XnAB0R4lksY83HWEoTYwUM4ZZgEZSqquWW7SBp9zF77mhw5P3HaoYYGNJAe4AgHZ5SYMkcGB75dtE1pMqxlOE7ucIlWYnHOr1L0LhRR5g0MCL2d8jGxQi89EpZh3PtZ65xPsiJDodgAsyrELF33xC9SARgSMC8gmmEjzTVDfgmONXwbiJJ2KkWeg2o0XF41rgjZn7rQSUdndN9xAp998ufS3CLGTGRwaiMiVtumTjfNfK/LGk1pa3JaOUYgTkiJ9ToM0T5qMW1ro9NZM0vQ+j3Rd/d4NzZ8HPeje1V9eTCL5aqzXTuAw/6NPqovSsA+VCFK/lm36KmP2bVyM2mtyUn+05+IWuGkeWn7Ox7mvKstPlYfDggcBgn3TrsJ8slVZMPnxbnceQfSLDDJAasz6WSpX+MHJD04hW2chjiDyrB43SZ57DiyxTpw4K+Bthetp3Ag9g2Z+mqDSzoO4l7BqAEVnS6QLjIlRJg2U2SN0M9qEqU0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?aFHkTyQNrdNpb06jHpJo+8VbOq1xRQsYwCjn67Bck0xwtYPEsjDo6mcFQUVm?=
 =?us-ascii?Q?zQvRo1J0uOan0M0EFvHfN/38q9ZMc5iDn7XnERL8WDatULWLvubQTIVrAKPi?=
 =?us-ascii?Q?avLftUSJyBDG6lQPptOhXqJf8mAZ/mDymQJaVxnhO9yln3pi3/4dx66uLqOL?=
 =?us-ascii?Q?yGdFprMVucSLiaap1Yosg1lR05E7amCPC6/YMGkrLvvrSF0Jmwmbdkh5GXwB?=
 =?us-ascii?Q?snEJNRiXm7xy6LAXXpZgGl+6rFb07ONWnDLxvsf/o4vd1yVHZsdtuU1mjObG?=
 =?us-ascii?Q?XvRuz7hVai9hUZirH8HRp+OA+oGLVmH2Sp1s4xuHwfZA3JMrEAlfBd3fabIU?=
 =?us-ascii?Q?PUEPf77gGsBq0iOxJQRoRFCIFJq7aV3p5kMaZGs6Z0E2yjrXDnWIoxMkugoV?=
 =?us-ascii?Q?bGfJoMjbGWwwqlZkt3AV0eoP+oefwIomIHoSeWqXl9MCJZXiQA61hzeg6CAb?=
 =?us-ascii?Q?efOfe9mtXZqsYMTSx7Q5ENIRYIHgKrViV/FnFsTSef1+q16A5WpuLOjLDdyl?=
 =?us-ascii?Q?OuPr9ie0L8eTvgDeJbgv+YWU9/6/WMR7tjv50w72oqGbohR5SOxfzqfkxhSt?=
 =?us-ascii?Q?BHxUWTqmCTVBkFRTEhnt3OImUX//S1oE6pJjKc8DxLecTyhgPtyAFqPk4oYQ?=
 =?us-ascii?Q?gk/5RgtwtAK4lxe4RW+MfoMPEFM8u1T6mXkxbVhDTojvMBDMDmISZOi8mgtd?=
 =?us-ascii?Q?+uHJdLMJQ5JlxQm0+uMNqpGM16Xr8Aax6DXTgQbG/nqZ4XZawMYOgGMy8IwV?=
 =?us-ascii?Q?O1CoUpFlDWh0YuG4xYRC8i3vj03QJHjcJvs02u0lcLMYXX4pJ2zbm5NzJWG1?=
 =?us-ascii?Q?h61zk4IH46AINecInCN7f1/7OathL6Jj5G+NFxhUQq+RgANDIhspPJOyTsln?=
 =?us-ascii?Q?xHUIX6aqrOCZOvY6GjdWZU/4fDn/H5VWs02qjhnqIXEX3EYne0wHUt/qOqV0?=
 =?us-ascii?Q?vbTM+aN8hYGuBxYc+SuK4F4DFjope7/yiCCIqezq3bg3oSVQ/o/ENA8XP8EC?=
 =?us-ascii?Q?QW27lx6zTXkdeAm0TitO5IEvY0jgiTTE/7fbQWwn2i4ewiNryKiUZFU2LfrZ?=
 =?us-ascii?Q?k+Om9iwEo+EQRofnkaL8AGRlSYi4ENerPzrXN1Vhe1JpoAUdgcUXkXZFDEV4?=
 =?us-ascii?Q?6+dCxWZgB26IoCaCHVwvg68W51Wf4j9uSWVWa7eEM5HfKGQ/SN+D/+FAFmbC?=
 =?us-ascii?Q?0xn0q/i52KfZ4glzR3e4GU7GH1ebSrlsiRHMS8cKHEafkl+gVdpmuZ0JeB3u?=
 =?us-ascii?Q?BvbrcBn0XYayph16INCApS4j4lyFN3dteP8/FMFHVaR0xJ+AoCdudls9KsGs?=
 =?us-ascii?Q?XLj5OOu8pC8jmqOW9EX9QyRrr+tXoaj5Fn2w5OuCSxjcJLP8lyULNl94ohIU?=
 =?us-ascii?Q?llAJackiMdTo4wbxkBXDkC7XjBMI3SS7NAy3R3cTIsmjvFN3N/0XMn8sCL6X?=
 =?us-ascii?Q?Ve2LoBppdOqXQU8Xzppp36hpQwRxsOYz7Bzwa9U6Qg0nnj3I+Srfhei8qJIh?=
 =?us-ascii?Q?BbLxe3OIQmvfloxwdnbgqAXkohQV4ckIDbN1LqOnihOQRGWvXF/HwyLtRVBp?=
 =?us-ascii?Q?IWog6ydfZQmm7A0I+evjriHf09HI7vC2f/Jy/X6v96JYwq25VZZIGo4/0wx0?=
 =?us-ascii?Q?iHrhDwl0Nu6IQaVHhwOnwXpPgbm/tGAdAWMJPNlC2CBK7JdYdZAmec50ZWut?=
 =?us-ascii?Q?d/NN/vuLQF5BP63omAANr9IzpoVehMIkoN9e3tm//S1jieVHraQmSfoz58by?=
 =?us-ascii?Q?pKIiDAyymIzke51fJVnB/1os1unFNzk=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 57102905-c65a-4568-08e5-08dea4c8fea6
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2026 01:53:50.5340
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: inQPQPsb4nbR/sGmpHKCexIdzdWxhF3q7wQr7n0x3ja9gMSjc+7s4WjwsCV2D2UWOV2g/jtpv6ktEFEY2AWWV0N17j649kjBr03EJAKIi8/WTE0Gqn+9HmuRY58UiOPm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1220
X-Rspamd-Queue-Id: 190D847CC17
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35636-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[2.98.90.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn:mid,starfivetech.com:email]

Hi, Conor

Thanks for the review.

> On Fri, Apr 24, 2026 at 04:13:30AM -0700, Changhuang Liang wrote:
> > Add pinctrl nodes for starfive JHB100 SoC. They contain
> > pinctrl_per0/pinctrl_per1/pinctrl_per2/pinctrl_per2pok/pinctrl_per3/
> > pinctrl_sys0/pinctrl_sys0h/pinctrl_sys1/pinctrl_sys2.
> >
> > Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
>=20
> What did Lianfeng do? A signoff alone suggests something is incorrectly
> attributed here.

We worked on this part together and will add the Co-developed-by tag.

>=20
> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > ---
> >  .../boot/dts/starfive/jhb100-evb1-eth.dts     |  27 +++++
> >  arch/riscv/boot/dts/starfive/jhb100-evb1.dtsi |   4 +
> >  .../boot/dts/starfive/jhb100-pinctrl.dtsi     |  19 ++++
> >  arch/riscv/boot/dts/starfive/jhb100.dtsi      | 107
> ++++++++++++++++++
> >  4 files changed, 157 insertions(+)
> >  create mode 100644 arch/riscv/boot/dts/starfive/jhb100-pinctrl.dtsi
> >
> > diff --git a/arch/riscv/boot/dts/starfive/jhb100-evb1-eth.dts
> > b/arch/riscv/boot/dts/starfive/jhb100-evb1-eth.dts
> > index 62cd046e1224..f7e82f9d0ff1 100644
> > --- a/arch/riscv/boot/dts/starfive/jhb100-evb1-eth.dts
> > +++ b/arch/riscv/boot/dts/starfive/jhb100-evb1-eth.dts
> > @@ -4,3 +4,30 @@
> >   */
> >
> >  #include "jhb100-evb1.dtsi"
> > +
> > +&pinctrl_per0 {
> > +	gpioe-i3c0-vref =3D <JHB100_PINVREF_3_3V>; /* VREF for GPIOB8-11,
> 32-33 */
> > +	gpioe-i3c1-vref =3D <JHB100_PINVREF_3_3V>; /* VREF for GPIOB12-15,
> 34-35 */
> > +	gpioe-i3c2-vref =3D <JHB100_PINVREF_3_3V>; /* VREF for GPIOB16-23 */
> > +	gpioe-i3c4-vref =3D <JHB100_PINVREF_3_3V>; /* VREF for GPIOB36-43 */
> > +};
> > +
> > +&pinctrl_per1 {
> > +	gpioe-spi-vref =3D <JHB100_PINVREF_3_3V>; /* VREF for GPIOC0-4 */
> > +	gpioe-qspi0-vref =3D <JHB100_PINVREF_3_3V>; /* VREF for GPIOC5-11 */
> > +	gpioe-qspi1-vref =3D <JHB100_PINVREF_3_3V>; /* VREF for GPIOC12-19
> */
> > +	gpioe-qspi2-vref =3D <JHB100_PINVREF_3_3V>; /* VREF for GPIOC20-27
> */
> > +};
> > +
> > +&pinctrl_per2 {
> > +	gpionw-vref =3D <JHB100_PINVREF_1_8V>; /* VREF for GPIOD19-30 */ };
> > +
> > +&pinctrl_per3 {
> > +	gpios-vref =3D <JHB100_PINVREF_1_8V>; /* VREF for GPIOE0-10 */ };
> > +
> > +&pinctrl_sys2 {
> > +	gpiow-vref =3D <JHB100_PINVREF_3_3V>; /* VREF for GPIOA36-39 */
> > +	gpiow-inner-vref =3D <JHB100_PINVREF_3_3V>; /* VREF for GPIOA40-43
> */
> > +};
> > diff --git a/arch/riscv/boot/dts/starfive/jhb100-evb1.dtsi
> > b/arch/riscv/boot/dts/starfive/jhb100-evb1.dtsi
> > index 462b6fb7953b..acd5949bcfdb 100644
> > --- a/arch/riscv/boot/dts/starfive/jhb100-evb1.dtsi
> > +++ b/arch/riscv/boot/dts/starfive/jhb100-evb1.dtsi
> > @@ -3,7 +3,9 @@
> >   * Copyright (c) 2024-2026 StarFive Technology Co., Ltd.
> >   */
> >
> > +#include "jhb100-pinfunc.h"
> >  #include "jhb100.dtsi"
> > +#include "jhb100-pinctrl.dtsi"
> >
> >  / {
> >  	model =3D "StarFive JHB100 EVB-1";
> > @@ -29,4 +31,6 @@ memory@40000000 {
> >
> >  &uart6 {
> >  	status =3D "okay";
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&uart6_pins>;
> >  };
> > diff --git a/arch/riscv/boot/dts/starfive/jhb100-pinctrl.dtsi
> > b/arch/riscv/boot/dts/starfive/jhb100-pinctrl.dtsi
> > new file mode 100644
> > index 000000000000..d12b79376521
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/starfive/jhb100-pinctrl.dtsi
> > @@ -0,0 +1,19 @@
> > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > +/*
> > + * Copyright (c) 2025-2026 StarFive Technology Co., Ltd.
> > + */
> > +
> > +&pinctrl_sys2 {
> > +	uart6_pins: uart6-grp {
> > +		uart6-tx-pins {
> > +			pinmux =3D <PINMUX(PADNUM_SYS2_GPIO_A38,
> > +					 FUNC_SYS2_UART6_TX)>;
> > +		};
> > +
> > +		uart6-rx-pins {
> > +			pinmux =3D <PINMUX(PADNUM_SYS2_GPIO_A39,
> > +					 FUNC_SYS2_UART6_RX)>;
> > +			input-enable;
> > +		};
> > +	};
> > +};
>=20
> Could we get some more examples, to exercise each pin controller?
> Is that impossible without adding more peripherals other than uart?
>=20

Yes, providing more examples for each pin controller would require adding=20
other peripherals beyond UART. Currently, we only have UART available.=20
We can add more examples once other peripherals (like I2C, SPI, etc.) are=20
enabled in the DT.

Best Regards,
Changhuang

