Return-Path: <linux-gpio+bounces-5948-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 600008B78E9
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Apr 2024 16:19:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E3E5B247BA
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Apr 2024 14:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97E4317BB1B;
	Tue, 30 Apr 2024 14:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eGz5zzFp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA7617BB1F;
	Tue, 30 Apr 2024 14:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714485914; cv=none; b=ILkgOmkXzkDcKn6+ZDt1eL7HnqX0V0sBl3YGlv5y4FFWvqD8UE4tAA5yYNuviZz26XyhCYb2gSz93M3rm0WBk28fU5DB1wxonRapyTbPCunIRPZERDSlzaq4yE1Nrqbnw8KSg8A27g03OWsf7We2XOXyGcN/6SyzUxf3ZBuyrgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714485914; c=relaxed/simple;
	bh=DUnJWm8gamc5lGV9dWeg7/dtnUKrEX/1OMhbRJ1DYLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tpiyNSG07WWsEJSCS2qEaZr1yV+1JnatEZUfLZQQjSDiKf0mnSDDHyJ2zbXfJDSW2kYQmlv/fPK6w3GsZ0WiKEaP0iRipJdRGsjNogBlv88BEuf9qOmxoSTx0A1W7/Mg7NVdlR/BC+F/mnXZwoePrEIXKTmAp/U2dwRkbL3rsrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eGz5zzFp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F0A3C4AF19;
	Tue, 30 Apr 2024 14:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714485913;
	bh=DUnJWm8gamc5lGV9dWeg7/dtnUKrEX/1OMhbRJ1DYLQ=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=eGz5zzFpsA0W95hVQxjwprkhCNEW1kEfAUzd8j2kx1U61TvSwytxj1AQc8S5acLUh
	 kwnXE/nFmyNka9E2iTSGQ0nEg9gWPXg1T7MI34OTx7f0BSL5uRiAninFpnZ+PA4Ncr
	 EXoC6PPhxqRKwuypfGJvEyFTE/z1uZpQS0I2NsqjgVMYsbjL1N+RE8fAeLvTz5hMlU
	 Iz616KYO7JhuDfaMbVnNwBq1P+ra5Z0CtTNNsICqsirz6LAolVXmehYx7/xz72l+4w
	 EhrMXSGkOnQAV6RZ/MCCPCliPKES9tsfNUIwfQ4C1iGJt5/2kdbtL1Tb0tBuHPND6t
	 cfy4e9nYgooQg==
Date: Tue, 30 Apr 2024 16:05:07 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann
 <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, Andy Shevchenko
 <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Ilpo
 =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-gpio@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-rtc@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v8 2/9] platform: cznic: Add preliminary support for
 Turris Omnia MCU
Message-ID: <20240430160507.45f1f098@dellmb>
In-Reply-To: <CAHp75VcgfvyZ9rcNev9CpQEN3CkUVozEkv+ycaQggPbE4tx+1Q@mail.gmail.com>
References: <20240430115111.3453-1-kabel@kernel.org>
	<20240430115111.3453-3-kabel@kernel.org>
	<CAHp75VcgfvyZ9rcNev9CpQEN3CkUVozEkv+ycaQggPbE4tx+1Q@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 30 Apr 2024 15:53:51 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Tue, Apr 30, 2024 at 2:51=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.or=
g> wrote:
> >
> > Add the basic skeleton for a new platform driver for the microcontroller
> > found on the Turris Omnia board. =20
>=20
> ...
>=20
> > +What:          /sys/bus/i2c/devices/<mcu_device>/serial_number
> > +Date:          July 2024
> > +KernelVersion: 6.10
> > +Contact:       Marek Beh=C3=BAn <kabel@kernel.org>
> > +Description:   (RO) Contains the 64 bit long board serial number in he=
xadecimal =20
>=20
> 64 bit long --> 64-bit

ok

>=20
> > +               format.
> > +
> > +               Only available if board information is burned in the MC=
U (older
> > +               revisions have board information burned in the ATSHA204=
-A chip).
> > +
> > +               Format: %016X. =20
>=20
> It's strange to use capitalized hexadecimal here and not in other
> files, but maybe it's something special about "serial number"? Dunno.

Yes, the serial number is printed with captial hex letters.

> > +menuconfig CZNIC_PLATFORMS
> > +       bool "Platform support for CZ.NIC's Turris hardware" =20
>=20
> > +       depends on MACH_ARMADA_38X || COMPILE_TEST =20
>=20
> This...
>=20
> > +       help
> > +         Say Y here to be able to choose driver support for CZ.NIC's T=
urris
> > +         devices. This option alone does not add any kernel code.
> > +
> > +if CZNIC_PLATFORMS
> > +
> > +config TURRIS_OMNIA_MCU
> > +       tristate "Turris Omnia MCU driver" =20
>=20
> > +       depends on MACH_ARMADA_38X || COMPILE_TEST =20
>=20
> ...or this dependency is redundant. I think one would expect that
> these platforms will not be always based on the same platform, hence I
> would drop the former and leave the latter. But you should know better
> than me.

ok

>=20
> > +       depends on I2C
> > +       help
> > +         Say Y here to add support for the features implemented by the
> > +         microcontroller on the CZ.NIC's Turris Omnia SOHO router.
> > +         To compile this driver as a module, choose M here; the module=
 will be
> > +         called turris-omnia-mcu. =20
>=20
> ...
>=20
> > +static int omnia_get_version_hash(struct omnia_mcu *mcu, bool bootload=
er,
> > +                                 u8 version[static OMNIA_FW_VERSION_HE=
X_LEN]) =20
>=20
> Interesting format of the last parameter. Does it make any difference
> to the compiler if you use u8 *version?

The compiler will warn if an array with not enough space is passed as
argument.

>=20
> > +{
> > +       u8 reply[OMNIA_FW_VERSION_LEN];
> > +       int err;
> > +
> > +       err =3D omnia_cmd_read(mcu->client,
> > +                            bootloader ? CMD_GET_FW_VERSION_BOOT
> > +                                       : CMD_GET_FW_VERSION_APP,
> > +                            reply, sizeof(reply));
> > +       if (err)
> > +               return err; =20
>=20
> > +       version[OMNIA_FW_VERSION_HEX_LEN - 1] =3D '\0';
> > +       bin2hex(version, reply, OMNIA_FW_VERSION_LEN); =20
>=20
> Hmm... I would rather use returned value
>=20
> char *p;
>=20
> p =3D bin2hex(...);
> *p =3D '\0';
>=20
> return 0;

OK. I guess

  *bin2hex(version, reply, OMNIA_FW_VERSION_LEN) =3D '\0';

would be too crazy, right?

>=20
> > +       return 0;
> > +} =20
>=20
> ...
>=20
> > +static umode_t omnia_mcu_base_attrs_visible(struct kobject *kobj,
> > +                                           struct attribute *a, int n)
> > +{
> > +       struct device *dev =3D kobj_to_dev(kobj);
> > +       struct omnia_mcu *mcu =3D dev_get_drvdata(dev); =20
>=20
> > +       umode_t mode =3D a->mode; =20
>=20
> Do you need this?
>=20
> > +       if ((a =3D=3D &dev_attr_serial_number.attr ||
> > +            a =3D=3D &dev_attr_first_mac_address.attr ||
> > +            a =3D=3D &dev_attr_board_revision.attr) &&
> > +           !(mcu->features & FEAT_BOARD_INFO)) =20
>=20
> > +               mode =3D 0; =20
>=20
> return 0; ?
>=20
> > +       return mode; =20
>=20
> return a->mode; ?

ok

>=20
> > +} =20
>=20
> ...
>=20
> > +static void omnia_mcu_print_version_hash(struct omnia_mcu *mcu, bool b=
ootloader)
> > +{
> > +       const char *type =3D bootloader ? "bootloader" : "application";
> > +       struct device *dev =3D &mcu->client->dev;
> > +       u8 version[OMNIA_FW_VERSION_HEX_LEN];
> > +       int err;
> > +
> > +       err =3D omnia_get_version_hash(mcu, bootloader, version);
> > +       if (err) {
> > +               dev_err(dev, "Cannot read MCU %s firmware version: %d\n=
", type,
> > +                       err); =20
>=20
> One  line?

I'd like to keep this driver to 80 columns.

>=20
> > +               return;
> > +       }
> > +
> > +       dev_info(dev, "MCU %s firmware version hash: %s\n", type, versi=
on);
> > +} =20
>=20
> ...
>=20
> > +static const char *omnia_status_to_mcu_type(uint16_t status) =20
>=20
> Why out of a sudden uint16_t instead of u16?

This was a mistake, thanks.

> > +{
> > +       switch (status & STS_MCU_TYPE_MASK) {
> > +       case STS_MCU_TYPE_STM32:
> > +               return "STM32";
> > +       case STS_MCU_TYPE_GD32:
> > +               return "GD32";
> > +       case STS_MCU_TYPE_MKL:
> > +               return "MKL";
> > +       default:
> > +               return "unknown";
> > +       }
> > +} =20
>=20
> ...
>=20
> > +       static const struct {
> > +               uint16_t mask; =20
>=20
> Ditto.
>=20
> > +               const char *name;
> > +       } features[] =3D {
> > +               { FEAT_EXT_CMDS,           "extended control and status=
" },
> > +               { FEAT_WDT_PING,           "watchdog pinging" },
> > +               { FEAT_LED_STATE_EXT_MASK, "peripheral LED pins reading=
" },
> > +               { FEAT_NEW_INT_API,        "new interrupt API" },
> > +               { FEAT_POWEROFF_WAKEUP,    "poweroff and wakeup" },
> > +               { FEAT_TRNG,               "true random number generato=
r" },
> > +       }; =20
>=20
> ...
>=20
> > +               omnia_info_missing_feature(dev, "feature reading"); =20
>=20
> Tautology. Read the final message. I believe you wanted to pass just
> "reading" here.

No, I actually wanted it to print
  Your board's MCU firmware does not support the feature reading
  feature.
as in the feature "feature reading" is not supported.
I guess I could change it to
  Your board's MCU firmware does not support the feature reading.
but that would complicate the code: either I would need to add
" feature" suffix to all the features[].name, or duplicate the
info string from the omnia_info_missing_feature() function.

> ...
>=20
> > +       memcpy(mcu->board_first_mac, &reply[9], ETH_ALEN); =20
>=20
> There is an API ether_copy_addr() or so, don't remember by heart.
> You also need an include for ETH_ALEN definition.

Doc for ether_addr_copy says:
  Please note: dst & src must both be aligned to u16.
since the code does:
  u16 *a =3D (u16 *)dst;
  const u16 *b =3D (const u16 *)src;

  a[0] =3D b[0];
  a[1] =3D b[1];
  a[2] =3D b[2]

Since I am copying from &reply[9], which is not u16-aligned, this won't
work.

> ...
>=20
> > +#include <linux/i2c.h> =20
>=20
> No users of this, you may replace with
>=20
> struct i2c_client;
>=20
> Am I right?

OK.

>=20
> ...
>=20
> > +       CMD_GET_FW_VERSION_BOOT         =3D 0x0E, /* 20B git hash
> > number */ =20
>=20
> Git

OK.

> ...
>=20
> > +       /* available only at address 0x2b (led-controller) */ =20
>=20
> LED-controller

OK

>=20
> ...
>=20
> > +enum omnia_ctl_byte_e {
> > +       CTL_LIGHT_RST           =3D BIT(0),
> > +       CTL_HARD_RST            =3D BIT(1),
> > +       /* BIT(2) is currently reserved */
> > +       CTL_USB30_PWRON         =3D BIT(3),
> > +       CTL_USB31_PWRON         =3D BIT(4),
> > +       CTL_ENABLE_4V5          =3D BIT(5),
> > +       CTL_BUTTON_MODE         =3D BIT(6),
> > +       CTL_BOOTLOADER          =3D BIT(7) =20
>=20
> Keep trailing comma as it might be extended (theoretically). And you
> do the similar in other enums anyway.

ctl_byt is 8-bit, so this enum really can't be extended. In fact I need
to drop the last comma from omnia_ext_sts_dword_e and omnia_int_e.

Thanks, Andy.

