Return-Path: <linux-gpio+bounces-39482-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KRBKFoGcSmpFFAEAu9opvQ
	(envelope-from <linux-gpio+bounces-39482-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Jul 2026 20:03:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB6A70AC54
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Jul 2026 20:03:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=xry111.site header.s=default header.b=WSluJmn0;
	dmarc=pass (policy=reject) header.from=xry111.site;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39482-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39482-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D7EDB3007E1C
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Jul 2026 18:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAA4332B113;
	Sun,  5 Jul 2026 18:03:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439643254BB
	for <linux-gpio@vger.kernel.org>; Sun,  5 Jul 2026 18:03:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783274605; cv=none; b=WGgF9W/S+6o6eUXrWndM+K2nBrBRHpcNtmfi9un8+j7bIfc+TGelaeB1bkIja7lFTwlfXInMR3uwqs83TN3fsLf9aTebDgvNtua9gzY67F32V5dhwC9vlsm0LM0D8F2ACe2QDUl+NrEXvjoqxo8hGsAnhQvgT4aQAyRoTsMtSzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783274605; c=relaxed/simple;
	bh=MveZ4Ol7qzqAcDSzGi/Y3Le9EFNgAexw2kB7GQbojiU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jceNCmOPvous6QX4W3d5iOq5tBLtDtZd4dyzZKUYYwuDeY01YgAhoNCv+5X0g9DQOxYX6fjAd3MDnb9aWOPrPOHrd4Z+QWtXU4hWbn5S4x/S31RS5C5RslQVYldzhYoACUyOn/c0ZAk2Av19Q+4/9Yl/d1b0YO9quTArYks9b20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=WSluJmn0; arc=none smtp.client-ip=89.208.246.23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1783274179;
	bh=u0q7o5lFDSJORhKylMwI7pS0XmiEGdux1Ifs70DJZP0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=WSluJmn0UyfsSDv2DX4B0NHU3PgKkg1YidHIRPEk9WeCV99oJX04SMgCwYRaKY8TB
	 VfsQOcMvzzN2BxQmHPBz32KI35RjpSPLFGvH+xg0MND/dVm2+Ayxn4YHNUdniB/Hfj
	 6m5S4y+Czj2JTW52jmiiZ2SaPVswcwKyVb2FUHyo=
Received: from [IPv6:2408:824e:306:931:c427:8c70:2426:a] (unknown [IPv6:2408:824e:306:931:c427:8c70:2426:a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 3909D65982;
	Sun,  5 Jul 2026 13:56:07 -0400 (EDT)
Message-ID: <73df1090f513777f3c0c4bfd1b9fc01f430ce9c3.camel@xry111.site>
Subject: Re: [PATCH RFC] gpio: loongson-64bit: Add back the support for
 gsi_idx_map
From: Xi Ruoyao <xry111@xry111.site>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Miao Wang
	 <shankerwangmiao@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Miao Wang via B4 Relay	
 <devnull+shankerwangmiao.gmail.com@kernel.org>, Huacai Chen	
 <chenhuacai@kernel.org>, Jianmin Lv <lvjianmin@loongson.cn>, WANG Xuerui	
 <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	linux-gpio@vger.kernel.org, Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij
	 <linusw@kernel.org>, Hongchen Zhang <zhanghongchen@loongson.cn>, Liu
 Peibao	 <liupeibao@loongson.cn>, Juxin Gao <gaojuxin@loongson.cn>, Mika
 Westerberg	 <westeri@kernel.org>, Mingcong Bai <jeffbai@aosc.io>
Date: Mon, 06 Jul 2026 01:55:57 +0800
In-Reply-To: <akThvlKr5MdbNloj@ashevche-desk.local>
References: <20260630-loongson-gpio-v1-1-576908831fa0@gmail.com>
	 <CAMRc=MdtRj6c3Bg72QMaAEMPovNyUdqWL_qDPGb1p=Cu=cETvA@mail.gmail.com>
	 <akOxdBR_-rOweHXB@ashevche-desk.local>
	 <B77A4E49-774C-4DB2-9CA6-FFBE14F1EF94@gmail.com>
	 <akTDj-YJjuDOBc0i@ashevche-desk.local>
	 <A12FA264-0A0B-4CB3-BBCC-51380591F0E1@gmail.com>
	 <akTRyQqXuSU6pl71@ashevche-desk.local>
	 <AA7111AC-196F-41F7-A47B-E5118F7D26F2@gmail.com>
	 <akThvlKr5MdbNloj@ashevche-desk.local>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39482-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:shankerwangmiao@gmail.com,m:brgl@kernel.org,m:devnull+shankerwangmiao.gmail.com@kernel.org,m:chenhuacai@kernel.org,m:lvjianmin@loongson.cn,m:kernel@xen0n.name,m:jiaxun.yang@flygoat.com,m:linux-gpio@vger.kernel.org,m:zhuyinbo@loongson.cn,m:linusw@kernel.org,m:zhanghongchen@loongson.cn,m:liupeibao@loongson.cn,m:gaojuxin@loongson.cn,m:westeri@kernel.org,m:jeffbai@aosc.io,m:devnull@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com];
	FORGED_SENDER(0.00)[xry111@xry111.site,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xry111@xry111.site,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[xry111.site:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,shankerwangmiao.gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,xry111.site:from_mime,xry111.site:email,xry111.site:mid,xry111.site:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9FB6A70AC54

On Wed, 2026-07-01 at 12:45 +0300, Andy Shevchenko wrote:
> On Wed, Jul 01, 2026 at 04:56:11PM +0800, Miao Wang wrote:
> > > 2026=E5=B9=B47=E6=9C=881=E6=97=A5 16:37=EF=BC=8CAndy Shevchenko <andr=
iy.shevchenko@linux.intel.com> =E5=86=99=E9=81=93=EF=BC=9A
> > > On Wed, Jul 01, 2026 at 04:07:43PM +0800, Miao Wang wrote:
> > > > > 2026=E5=B9=B47=E6=9C=881=E6=97=A5 15:36=EF=BC=8CAndy Shevchenko <=
andriy.shevchenko@linux.intel.com> =E5=86=99=E9=81=93=EF=BC=9A
> > > > > On Tue, Jun 30, 2026 at 08:42:43PM +0800, Miao Wang wrote:
> > > > > > > 2026=E5=B9=B46=E6=9C=8830=E6=97=A5 20:07=EF=BC=8CAndy Shevche=
nko <andriy.shevchenko@linux.intel.com> =E5=86=99=E9=81=93=EF=BC=9A
> > > > > > > On Tue, Jun 30, 2026 at 07:45:52AM +0000, Bartosz Golaszewski=
 wrote:
> > > > > > > > On Mon, 29 Jun 2026 23:05:28 +0200, Miao Wang via B4 Relay
> > > > > > > > <devnull+shankerwangmiao.gmail.com@kernel.org> said:
>=20
> ...
>=20
> > > > > > > > > This patch adds back the support for gsi_idx_map, which i=
s used in the
> > > > > > > > > ACPI DSDT table to describe the mapping between the GPIO =
line number to
> > > > > > > > > the index of the interrupt number in the declared interru=
pt resources.
> > > > > > > > >=20
> > > > > > > > > This property was removed in Loongson CPU Universal Speci=
fication for
> > > > > > > > > Interface Between PC/Server System Firmware and Kernel v4=
.1 in November,
> > > > > > > > > 2023, but still in use in firmwares released this year. A=
 sample of
> > > > > > > > > an affected DSDT entry from a 3C6000 board I'm currently =
using is:
> > > > > > >=20
> > > > > > > Oh my gosh, can somebody actually try to consult first with t=
he Linux kernel
> > > > > > > developers before adding non-standard and wrongly named prope=
rties, please?
> > > > > >=20
> > > > > > Inferred from the time when gsi_idx_map was removed from the sp=
ec, I believe
> > > > > > that the removal might be because the maintainers suggestion ag=
ainst introducing
> > > > > > gsi_idx_map. However, the firmwares "in the wild" have not foll=
owed the change.
> > > > >=20
> > > > > But what is the outcome of not using that mapping. Do you have so=
mething wrong
> > > > > or not working?
> > > >=20
> > > > Yes. As shown in the DSDT entry, when the mapping is given by the f=
irmware, the
> > > > number of given interrupts in _CRS does not equal to ngpios. In my =
example,
> > > > ngpios is 32, but the number of interrupts given in _CRS is 8, and =
the request
> > > > for irq on gpio lines whose number larger than 8 will fail with -EN=
XIO. To
> > > > clarify, the entry is taken from the firmware I am currently using,=
 and the
> > > > firmware is released on February this year.
> > >=20
> > > Right, so with the given example everything can be done without using=
 the (now)
> > > unspecified property. Do you have more examples of DSDT of these plat=
forms?
> >=20
> > Sorry, I only possess limited number of loongarch devices.
>
>=20
> Yeah, we definitely need some input from Loongson people.
>=20
> > > > > > > > > Device (GPO1) {
> > > > > > > > > Name (_HID, "LOON000F")
> > > > > > > > > Name (_CRS, ResourceTemplate () {
> > > > > > > > > =C2=A0QWordMemory ( // Omitted, not related
> > > > > > > > > =C2=A0)
> > > > > > > > > =C2=A0Interrupt (ResourceConsumer, Level, ActiveHigh, Exc=
lusive, ,, ) {
> > > > > > > > > =C2=A0=C2=A0 0x00000010, 0x00000011, 0x00000012, 0x000000=
13,
> > > > > > > > > =C2=A0=C2=A0 0x00000014, 0x00000015, 0x00000016, 0x000000=
17,
> > > > > > > > > =C2=A0}
> > > > > > > > > Name (_DSD, Package (0x02) {
> > > > > > > > > =C2=A0ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301")
> > > > > > > > > =C2=A0Package (0x03) {
> > > > > > > > > =C2=A0=C2=A0 Package (0x02) { "gpio_base", 0x50 } // Igno=
red by the driver
> > > > > > >=20
> > > > > > > Yes, it's non-standard property. It's a broken one in terms o=
f the style.
> > > > > > > See DT binding documentation.
> > > > > >=20
> > > > > > To clarify, I agree that this property should be redundant and =
ignored by
> > > > > > the driver and global gpio numbers should be assigned dynamical=
ly by the
> > > > > > kernel.
> > > > > >=20
> > > > > > > > > =C2=A0=C2=A0 Package (0x02) { "ngpios", 0x20 }
> > > > > > > > > =C2=A0=C2=A0 Package (0x02) { "gsi_idx_map", Package (0x2=
0) {
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 0, 1, 2, 3, 4, 5, 6, 7,
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 0, 1, 2, 3, 4, 5, 6, 7,
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 0, 1, 2, 3, 4, 5, 6, 7,
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 0, 1, 2, 3, 4, 5, 6, 7,
> > > > > > > > > =C2=A0=C2=A0 }}
> > > > > > > > > =C2=A0}
> > > > > > > > > }
> > > > > > > > > }
> > > > > > > > >=20
> > > > > > > > > As can be seen in the DSDT entry, the mapping is essentia=
l for obtaining
> > > > > > > > > the IRQ number from a GPIO line number. Otherwise, when I=
RQ is requested
> > > > > > > > > for the line numbers largers than 7, it will fail with -E=
NXIO.
> > > > > > >=20
> > > > > > > This doesn't look good. Why can't we simply hardcode the prop=
er behaviour based
> > > > > > > on the _HID? The gsi_idx_map seems quite regular and periodic=
, do you have some
> > > > > > > other examples with different mapping?
> > > > > >=20
> > > > > > According to the manual, the gpio controllers in HID LOON0007 a=
nd LOON000F are
> > > > > > actually embedded into the CPU chip and the interrupt lines are=
 hard wired so
> > > > > > that all the gpio lines of the gpio controller share in total 8=
 irqs such that
> > > > > > the i-th line is wired to the (i%8)-th irq. So the mapping for =
these two models
> > > > > > are fixed. I have no idea about the behavior of other kinds of =
controllers, which
> > > > > > should be answered by Loongson personales.
> > > > >=20
> > > > > OK.
> > > > >=20
> > > > > > So far, there are known to be 2 styles of DSDT entries. One is =
defined by
> > > > > > the latest Firmware Spec, to list all the irq numbers in _CRS, =
e.g. Name (_CRS,
> > > > > > ResourceTemplate () { Interrupt () { 0x10, 0x11, .., 0x17, 0x10=
, 0x11, ..., 0x17,
> > > > > > ... (in total ngpios entries) } }). The other is defined by the=
 previous Firmware
> > > > > > spec, to use the property `gsi_idx_map` to map the gpio line nu=
mber to the irq
> > > > > > number listed in the ResourceTemplate. The former should now be=
 compatible with
> > > > > > the current implementation of the driver in the kernel, while t=
he later not. I
> > > > > > believe that although being abandoned by the spec, the later sh=
ould also be
> > > > > > considered and supported by the driver, since it is used by the=
 firmwares in the
> > > > > > wild.
> > > > >=20
> > > > > This is clear. What's unclear is the necessity of adding this map=
ping. Is that
> > > > > mapping shuffled in an arbitrary way?
> > > >=20
> > > > According to the partial information I currently have, I don't thin=
k the mapping
> > > > would shuffle arbitrarily.
> > > >=20
> > > > > Second question, why one can't update firmware to fix this to fol=
low the
> > > > > specification? From above DSDT I do *not* see the need in this ma=
pping.
> > > > > Everything can be simply deducted from the number of Interrupt() =
resources
> > > > > and ngpios at run-time without touching the property.
> > > >=20
> > > > I have no idea why on the firmware side the spec was not followed f=
or three
> > > > years. When ignoring this mapping, there would be a problem if the =
number
> > > > of given Interrupt() resources is less than ngpios. When this mappi=
ng is
> > > > referred, there will be a ground truth for which irq number a gpio =
line
> > > > belongs to. To be specific, suppose the number of Interrupt() resou=
rces
> > > > is m and ngpios is n. In the current spec, where m equals to n, suc=
h ground
> > > > truth also exists. However, when m is less than n and this mapping =
is
> > > > ignored, the mapping will become ambiguous. Should the irq number b=
e i%m
> > > > for gpio line i, or i%8 and reject the irq requests when m is less =
than 8?

It's not true for the HID LOON000D (7A2000 GPIO controller) which is
also handled by this driver.  In that controller, each of GPIO 0-3 has
one dedicated IRQ line but the others GPIOs (4-55) share one IRQ line.=20
See https://github.com/AOSC-Tracking/linux/commit/31bd7e208e5b for how I
worked it around downstream.  IIUC reading gsi_idx_map should resolve
the issue for LOON000D as well.

We can also hard code i % 8 or MIN(i, 4) but then we'd need to check the
HID.  I can live with either way.

But in either way I'd want to keep the big sticking-out warning, like
"gsi_idx_map property is deprecated, consider upgrading your firmware"
in this patch.  If we use the hard coded logic it can be "having
Interrupt() resources less than ngpios is deprecated, consider upgrading
your firmware."

Some vendors of Loongson-based board firmwares have a bad tendency to
only issue a firmware update if the OEM pays them for some money like
$100,000 and the OEMs are often reluctant to pay.  Loongson itself does
things better: their own board products receive periodical firmware
update for free.  But Loongson itself does not produce laptops so the
laptops based on Loongson CPU often ships a firmware from such a rogue
vendor, and if the laptop uses a I2C-HID touchpad it will not work
without the LOON000D hack as HID-over-I2C have to use a GPIO as
interrupt source.  Then the users cannot use the upstream kernel.

Yes we should try to punish the rouge vendors (maybe even changing the
warning to "please avoid any product from this firmware vendor in the
future": I do recommend the users to avoid one particular firmware
vendor whenever I have to explain this issue to a frustrated user who
just found the touchpad is not working).  But IMO we shouldn't banish
the users to some "commercial" distros with downstream patches: we'd be
actually "awarding" those rogue firmware vendors by pushing the users to
a commercial solution, as the commerical distro vendors are likely
affiliated with the rogue firmware vendors on the stock market.

--=20
Xi Ruoyao <xry111@xry111.site>

