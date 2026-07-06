Return-Path: <linux-gpio+bounces-39527-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oGRIB2W+S2ozZgEAu9opvQ
	(envelope-from <linux-gpio+bounces-39527-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 16:40:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A51971216C
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 16:40:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=xry111.site header.s=default header.b=HXpJQC9C;
	dmarc=pass (policy=reject) header.from=xry111.site;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39527-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39527-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B29B03041BCD
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 14:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAA3F37AA83;
	Mon,  6 Jul 2026 14:27:06 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B52379C5F
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 14:27:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783348026; cv=none; b=AMq0UUL0qY5ijuGkpcD95sahxW6Y2AvKynEuGChpLhK3EGmQAnac6a/IJLxuyXO2d1k0jcvXUgBamd7zwzU+pDVdn39WU3qkuYNkl4VfgZqvhQCfohMrj1sojIWNGA1fHhWrBo8QmR6aCvCAcZnPRjAmJHgqDoKYOcMcWjR+84s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783348026; c=relaxed/simple;
	bh=tz1/LcmtecATftjGClDliKFqAqilduyWGQlCmS9KX8s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i1w+75aoO9eq7OQhYo26LnpRtSrK8q37P1qVYlgJR56H3MDOZHlZI+0zCYkEI1A+DlCKtRMhSejN8+6Fd2gNffVikzgnhn/McEeHwSWz88QI74Z5wU9m1B5+VTeciqWjzr36/6xPLCo6y/lhZCvzv8zad1MGF+F29xMdVj8+/hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=HXpJQC9C; arc=none smtp.client-ip=89.208.246.23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1783348018;
	bh=Ty9dmTdVTJrN0pH+Hl2KZFPYl3zsJZppQNK1yBqUKRE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=HXpJQC9CrIdz53oqRKyYGJtd9jRx0RnZMTK3z1GdCGrPBWEFGsFLdI2171FGgHnAh
	 vGyjHtbkE7C7A66urGNzAWnrB463uoZuEitsE3NVrYY8D2j0mdEk2HS0FRpbIKN1bb
	 MZbHUjyp6ksbUdr4+62l1aNUwu65982HwnWc6HcU=
Received: from [127.0.0.1] (2607-8700-5500-e873-0000-0000-0000-1001.16clouds.com [IPv6:2607:8700:5500:e873::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id DB59565982;
	Mon,  6 Jul 2026 10:26:55 -0400 (EDT)
Message-ID: <fb6dbc208d771911988d60685f6145b6132c66b6.camel@xry111.site>
Subject: Re: [PATCH RFC] gpio: loongson-64bit: Add back the support for
 gsi_idx_map
From: Xi Ruoyao <xry111@xry111.site>
To: Miao Wang <shankerwangmiao@gmail.com>, Andy Shevchenko
	 <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Miao Wang via B4 Relay	
 <devnull+shankerwangmiao.gmail.com@kernel.org>, Huacai Chen	
 <chenhuacai@kernel.org>, Jianmin Lv <lvjianmin@loongson.cn>, WANG Xuerui	
 <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	linux-gpio@vger.kernel.org, Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij
	 <linusw@kernel.org>, Hongchen Zhang <zhanghongchen@loongson.cn>, Liu
 Peibao	 <liupeibao@loongson.cn>, Juxin Gao <gaojuxin@loongson.cn>, Mika
 Westerberg	 <westeri@kernel.org>, Mingcong Bai <jeffbai@aosc.io>
Date: Mon, 06 Jul 2026 22:26:53 +0800
In-Reply-To: <B6BABD9E-104C-405C-9D9C-8B063791B20F@gmail.com>
References: <20260630-loongson-gpio-v1-1-576908831fa0@gmail.com>
	 <CAMRc=MdtRj6c3Bg72QMaAEMPovNyUdqWL_qDPGb1p=Cu=cETvA@mail.gmail.com>
	 <akOxdBR_-rOweHXB@ashevche-desk.local>
	 <B77A4E49-774C-4DB2-9CA6-FFBE14F1EF94@gmail.com>
	 <akTDj-YJjuDOBc0i@ashevche-desk.local>
	 <A12FA264-0A0B-4CB3-BBCC-51380591F0E1@gmail.com>
	 <akTRyQqXuSU6pl71@ashevche-desk.local>
	 <AA7111AC-196F-41F7-A47B-E5118F7D26F2@gmail.com>
	 <akThvlKr5MdbNloj@ashevche-desk.local>
	 <73df1090f513777f3c0c4bfd1b9fc01f430ce9c3.camel@xry111.site>
	 <aks67K3v2VNIkyRF@ashevche-desk.local>
	 <B6BABD9E-104C-405C-9D9C-8B063791B20F@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[xry111.site,reject];
	R_DKIM_ALLOW(-0.20)[xry111.site:s=default];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:shankerwangmiao@gmail.com,m:andriy.shevchenko@linux.intel.com,m:brgl@kernel.org,m:devnull+shankerwangmiao.gmail.com@kernel.org,m:chenhuacai@kernel.org,m:lvjianmin@loongson.cn,m:kernel@xen0n.name,m:jiaxun.yang@flygoat.com,m:linux-gpio@vger.kernel.org,m:zhuyinbo@loongson.cn,m:linusw@kernel.org,m:zhanghongchen@loongson.cn,m:liupeibao@loongson.cn,m:gaojuxin@loongson.cn,m:westeri@kernel.org,m:jeffbai@aosc.io,m:devnull@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[xry111@xry111.site,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39527-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[xry111.site:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xry111@xry111.site,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,shankerwangmiao.gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,xry111.site:from_mime,xry111.site:email,xry111.site:mid,xry111.site:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7A51971216C

On Mon, 2026-07-06 at 19:43 +0800, Miao Wang wrote:
> Hi,
>=20
> > 2026=E5=B9=B47=E6=9C=886=E6=97=A5 13:19=EF=BC=8CAndy Shevchenko <andriy=
.shevchenko@linux.intel.com> =E5=86=99=E9=81=93=EF=BC=9A
> >=20
> > On Mon, Jul 06, 2026 at 01:55:57AM +0800, Xi Ruoyao wrote:
> > > On Wed, 2026-07-01 at 12:45 +0300, Andy Shevchenko wrote:
> > > > On Wed, Jul 01, 2026 at 04:56:11PM +0800, Miao Wang wrote:
> > > > > > 2026=E5=B9=B47=E6=9C=881=E6=97=A5 16:37=EF=BC=8CAndy Shevchenko=
 <andriy.shevchenko@linux.intel.com> =E5=86=99=E9=81=93=EF=BC=9A
> > > > > > On Wed, Jul 01, 2026 at 04:07:43PM +0800, Miao Wang wrote:
> > > > > > > > 2026=E5=B9=B47=E6=9C=881=E6=97=A5 15:36=EF=BC=8CAndy Shevch=
enko <andriy.shevchenko@linux.intel.com> =E5=86=99=E9=81=93=EF=BC=9A
> > > > > > > > On Tue, Jun 30, 2026 at 08:42:43PM +0800, Miao Wang wrote:
> > > > > > > > > > 2026=E5=B9=B46=E6=9C=8830=E6=97=A5 20:07=EF=BC=8CAndy S=
hevchenko <andriy.shevchenko@linux.intel.com> =E5=86=99=E9=81=93=EF=BC=9A
> > > > > > > > > > On Tue, Jun 30, 2026 at 07:45:52AM +0000, Bartosz Golas=
zewski wrote:
> > > > > > > > > > > On Mon, 29 Jun 2026 23:05:28 +0200, Miao Wang via B4 =
Relay
> > > > > > > > > > > <devnull+shankerwangmiao.gmail.com@kernel.org> said:
> >=20
> > ...
> >=20
> > > > > > > > > > > > This patch adds back the support for gsi_idx_map, w=
hich is used in the
> > > > > > > > > > > > ACPI DSDT table to describe the mapping between the=
 GPIO line number to
> > > > > > > > > > > > the index of the interrupt number in the declared i=
nterrupt resources.
> > > > > > > > > > > >=20
> > > > > > > > > > > > This property was removed in Loongson CPU Universal=
 Specification for
> > > > > > > > > > > > Interface Between PC/Server System Firmware and Ker=
nel v4.1 in November,
> > > > > > > > > > > > 2023, but still in use in firmwares released this y=
ear. A sample of
> > > > > > > > > > > > an affected DSDT entry from a 3C6000 board I'm curr=
ently using is:
> > > > > > > > > >=20
> > > > > > > > > > Oh my gosh, can somebody actually try to consult first =
with the Linux kernel
> > > > > > > > > > developers before adding non-standard and wrongly named=
 properties, please?
> > > > > > > > >=20
> > > > > > > > > Inferred from the time when gsi_idx_map was removed from =
the spec, I believe
> > > > > > > > > that the removal might be because the maintainers suggest=
ion against introducing
> > > > > > > > > gsi_idx_map. However, the firmwares "in the wild" have no=
t followed the change.
> > > > > > > >=20
> > > > > > > > But what is the outcome of not using that mapping. Do you h=
ave something wrong
> > > > > > > > or not working?
> > > > > > >=20
> > > > > > > Yes. As shown in the DSDT entry, when the mapping is given by=
 the firmware, the
> > > > > > > number of given interrupts in _CRS does not equal to ngpios. =
In my example,
> > > > > > > ngpios is 32, but the number of interrupts given in _CRS is 8=
, and the request
> > > > > > > for irq on gpio lines whose number larger than 8 will fail wi=
th -ENXIO. To
> > > > > > > clarify, the entry is taken from the firmware I am currently =
using, and the
> > > > > > > firmware is released on February this year.
> > > > > >=20
> > > > > > Right, so with the given example everything can be done without=
 using the (now)
> > > > > > unspecified property. Do you have more examples of DSDT of thes=
e platforms?
> > > > >=20
> > > > > Sorry, I only possess limited number of loongarch devices.
> >=20
> > > > Yeah, we definitely need some input from Loongson people.
> >=20
> > ^^^^
> >=20
> > > > > > > > > > > > Device (GPO1) {
> > > > > > > > > > > > Name (_HID, "LOON000F")
> > > > > > > > > > > > Name (_CRS, ResourceTemplate () {
> > > > > > > > > > > > =C2=A0QWordMemory ( // Omitted, not related
> > > > > > > > > > > > =C2=A0)
> > > > > > > > > > > > =C2=A0Interrupt (ResourceConsumer, Level, ActiveHig=
h, Exclusive, ,, ) {
> > > > > > > > > > > > =C2=A0=C2=A0 0x00000010, 0x00000011, 0x00000012, 0x=
00000013,
> > > > > > > > > > > > =C2=A0=C2=A0 0x00000014, 0x00000015, 0x00000016, 0x=
00000017,
> > > > > > > > > > > > =C2=A0}
> > > > > > > > > > > > Name (_DSD, Package (0x02) {
> > > > > > > > > > > > =C2=A0ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301=
")
> > > > > > > > > > > > =C2=A0Package (0x03) {
> > > > > > > > > > > > =C2=A0=C2=A0 Package (0x02) { "gpio_base", 0x50 } /=
/ Ignored by the driver
> > > > > > > > > >=20
> > > > > > > > > > Yes, it's non-standard property. It's a broken one in t=
erms of the style.
> > > > > > > > > > See DT binding documentation.
> > > > > > > > >=20
> > > > > > > > > To clarify, I agree that this property should be redundan=
t and ignored by
> > > > > > > > > the driver and global gpio numbers should be assigned dyn=
amically by the
> > > > > > > > > kernel.
> > > > > > > > >=20
> > > > > > > > > > > > =C2=A0=C2=A0 Package (0x02) { "ngpios", 0x20 }
> > > > > > > > > > > > =C2=A0=C2=A0 Package (0x02) { "gsi_idx_map", Packag=
e (0x20) {
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 0, 1, 2, 3, 4, 5, 6, 7,
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 0, 1, 2, 3, 4, 5, 6, 7,
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 0, 1, 2, 3, 4, 5, 6, 7,
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 0, 1, 2, 3, 4, 5, 6, 7,
> > > > > > > > > > > > =C2=A0=C2=A0 }}
> > > > > > > > > > > > =C2=A0}
> > > > > > > > > > > > }
> > > > > > > > > > > > }
> > > > > > > > > > > >=20
> > > > > > > > > > > > As can be seen in the DSDT entry, the mapping is es=
sential for obtaining
> > > > > > > > > > > > the IRQ number from a GPIO line number. Otherwise, =
when IRQ is requested
> > > > > > > > > > > > for the line numbers largers than 7, it will fail w=
ith -ENXIO.
> > > > > > > > > >=20
> > > > > > > > > > This doesn't look good. Why can't we simply hardcode th=
e proper behaviour based
> > > > > > > > > > on the _HID? The gsi_idx_map seems quite regular and pe=
riodic, do you have some
> > > > > > > > > > other examples with different mapping?
> > > > > > > > >=20
> > > > > > > > > According to the manual, the gpio controllers in HID LOON=
0007 and LOON000F are
> > > > > > > > > actually embedded into the CPU chip and the interrupt lin=
es are hard wired so
> > > > > > > > > that all the gpio lines of the gpio controller share in t=
otal 8 irqs such that
> > > > > > > > > the i-th line is wired to the (i%8)-th irq. So the mappin=
g for these two models
> > > > > > > > > are fixed. I have no idea about the behavior of other kin=
ds of controllers, which
> > > > > > > > > should be answered by Loongson personales.
> > > > > > > >=20
> > > > > > > > OK.
> > > > > > > >=20
> > > > > > > > > So far, there are known to be 2 styles of DSDT entries. O=
ne is defined by
> > > > > > > > > the latest Firmware Spec, to list all the irq numbers in =
_CRS, e.g. Name (_CRS,
> > > > > > > > > ResourceTemplate () { Interrupt () { 0x10, 0x11, .., 0x17=
, 0x10, 0x11, ..., 0x17,
> > > > > > > > > ... (in total ngpios entries) } }). The other is defined =
by the previous Firmware
> > > > > > > > > spec, to use the property `gsi_idx_map` to map the gpio l=
ine number to the irq
> > > > > > > > > number listed in the ResourceTemplate. The former should =
now be compatible with
> > > > > > > > > the current implementation of the driver in the kernel, w=
hile the later not. I
> > > > > > > > > believe that although being abandoned by the spec, the la=
ter should also be
> > > > > > > > > considered and supported by the driver, since it is used =
by the firmwares in the
> > > > > > > > > wild.
> > > > > > > >=20
> > > > > > > > This is clear. What's unclear is the necessity of adding th=
is mapping. Is that
> > > > > > > > mapping shuffled in an arbitrary way?
> > > > > > >=20
> > > > > > > According to the partial information I currently have, I don'=
t think the mapping
> > > > > > > would shuffle arbitrarily.
> > > > > > >=20
> > > > > > > > Second question, why one can't update firmware to fix this =
to follow the
> > > > > > > > specification? From above DSDT I do *not* see the need in t=
his mapping.
> > > > > > > > Everything can be simply deducted from the number of Interr=
upt() resources
> > > > > > > > and ngpios at run-time without touching the property.
> > > > > > >=20
> > > > > > > I have no idea why on the firmware side the spec was not foll=
owed for three
> > > > > > > years. When ignoring this mapping, there would be a problem i=
f the number
> > > > > > > of given Interrupt() resources is less than ngpios. When this=
 mapping is
> > > > > > > referred, there will be a ground truth for which irq number a=
 gpio line
> > > > > > > belongs to. To be specific, suppose the number of Interrupt()=
 resources
> > > > > > > is m and ngpios is n. In the current spec, where m equals to =
n, such ground
> > > > > > > truth also exists. However, when m is less than n and this ma=
pping is
> > > > > > > ignored, the mapping will become ambiguous. Should the irq nu=
mber be i%m
> > > > > > > for gpio line i, or i%8 and reject the irq requests when m is=
 less than 8?
> > >=20
> > > It's not true for the HID LOON000D (7A2000 GPIO controller) which is
> > > also handled by this driver.=C2=A0 In that controller, each of GPIO 0=
-3 has
> > > one dedicated IRQ line but the others GPIOs (4-55) share one IRQ line=
.=20
> > > See https://github.com/AOSC-Tracking/linux/commit/31bd7e208e5b=C2=A0f=
or how I
> > > worked it around downstream.=C2=A0 IIUC reading gsi_idx_map should re=
solve
> > > the issue for LOON000D as well.
> > >=20
> > > We can also hard code i % 8 or MIN(i, 4) but then we'd need to check =
the
> > > HID.=C2=A0 I can live with either way.
> > >=20
> > > But in either way I'd want to keep the big sticking-out warning, like
> > > "gsi_idx_map property is deprecated, consider upgrading your firmware=
"
> > > in this patch.=C2=A0 If we use the hard coded logic it can be "having
> > > Interrupt() resources less than ngpios is deprecated, consider upgrad=
ing
> > > your firmware."
> >=20
> > But I am not sure it would work for the case you just described. I don'=
t
> > remember if duplicates are allowed in the _CRS for the same device, id =
est
> > Interrupt(foo) repeated as many times as you need.
> >=20
> > > Some vendors of Loongson-based board firmwares have a bad tendency to
> > > only issue a firmware update if the OEM pays them for some money like
> > > $100,000 and the OEMs are often reluctant to pay.=C2=A0 Loongson itse=
lf does
> > > things better: their own board products receive periodical firmware
> > > update for free.=C2=A0 But Loongson itself does not produce laptops s=
o the
> > > laptops based on Loongson CPU often ships a firmware from such a rogu=
e
> > > vendor, and if the laptop uses a I2C-HID touchpad it will not work
> > > without the LOON000D hack as HID-over-I2C have to use a GPIO as
> > > interrupt source.=C2=A0 Then the users cannot use the upstream kernel=
.
> > >=20
> > > Yes we should try to punish the rouge vendors (maybe even changing th=
e
> > > warning to "please avoid any product from this firmware vendor in the
> > > future":
> >=20
> > We (Linux kernel) are grown from that type of nagging. The polite way i=
s to
> > dev_warn(dev, FW_BUG) or similar. But this should be confirmed by Loong=
son.
> >=20
> > > I do recommend the users to avoid one particular firmware
> > > vendor whenever I have to explain this issue to a frustrated user who
> > > just found the touchpad is not working).=C2=A0 But IMO we shouldn't b=
anish
> > > the users to some "commercial" distros with downstream patches: we'd =
be
> > > actually "awarding" those rogue firmware vendors by pushing the users=
 to
> > > a commercial solution, as the commerical distro vendors are likely
> > > affiliated with the rogue firmware vendors on the stock market.
> >=20
> > Right.
> >=20
> > So, let me state again, we need an input from Loongson on clarification=
 on what
> > to do with the property. Because what I read from your reply is that pr=
operty
> > must stay and specification update was a wrong move.
> >=20
>=20
> If Interrupt() repeated in _CRS is allowed, then I don't think it is a wr=
ong
> move, but we are considering about existing hardware and firmware which a=
re
> not following this change. If repeated Interrupt() is not allowed, then t=
his
> would be another story.

If repeated Interrupt() is not allowed (I'm unsure yet if it's allowed
too) we can still use the hard coded logic like m % 8 or MIN(m, 4)
instead of gsi_idx_map.  AFAIK these mappings are hard-wired in the chip
(i.e. not programmable by the firmware) so having the _HID is enough.


--=20
Xi Ruoyao <xry111@xry111.site>

