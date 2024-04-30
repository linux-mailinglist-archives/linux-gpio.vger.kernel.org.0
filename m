Return-Path: <linux-gpio+bounces-5942-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3198B765A
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Apr 2024 14:54:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AA191F23641
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Apr 2024 12:54:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0D09171658;
	Tue, 30 Apr 2024 12:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fOunWnSF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31FD17106E;
	Tue, 30 Apr 2024 12:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714481671; cv=none; b=ZJIyguwBBCR6jCHJwiH2a+QUvUeqSbIiK6tyIYwF4yKHumCaHPVyIveDgDNv+isP+3YbpmFKD7nJlFL3kFem8SsxSLzOoyqgWZR7RNzXEZ5Wcp5aOe9EOjq3pU6NxUme79m+CffKSqm2anKgtCkdttxcTCopw8+3zqU7rqbkBCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714481671; c=relaxed/simple;
	bh=IXqSSEEa53cqMmLQ2JMXnOsLZM0nx+pixJzCSlr6zSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=skjFwxyXWW1UvVa5lJOYeoTzqey3rXk0irz5N7NSjttT7zgbNWxVxsZytaUw+bVZrBmRDh5I6i0NI5ZaySBZu/Gu/b0/kZK9O6YkW4gNuW3aBGGq4H5dwlN0VTRL/H2npa0L7NvSeOkVkGWWDu0vwJs/qQXhtsrlsr/aUacZNco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fOunWnSF; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-571bddddbc2so6683005a12.1;
        Tue, 30 Apr 2024 05:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714481668; x=1715086468; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XUKw3zCotkBrEJ53HxbMFGbGGHTqC2IglxBradvfgLg=;
        b=fOunWnSFN5VLh+tNJAcko89Bln+YUwulWsJKuYUanVL3xiqlvAQ7Edlhv0xE2K6NeO
         H5hidzefCbDP2QZbqZ6O1EOMSH4mUVEhbtW8xEk4tJ8RKxwXICGPfEyfp7mJbnJdtMSz
         rzDGvckf+5rWsVUAg+0hTNvENMS6vubIsPaRvrOf9sU/9DrJCWURn8uHu4m/AibJs1nm
         u+u6dxt8I3mlj6Qi/F9g3N+VC1QWvrADgtLs5IJWGZhaK+K6mvrs8HEJviZKFPYs8j01
         +qKkrZsxeFSpYRgdSuVLr9C6BmQIxjOk5jL6dR9XWPVlbNSc1a0fX+PVk1jeFz1Xuy42
         QJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714481668; x=1715086468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XUKw3zCotkBrEJ53HxbMFGbGGHTqC2IglxBradvfgLg=;
        b=jcWeRQdvffkvxdJpEu3LZ5qf4TxPF7sY/jlnhHaLx/kZR0++TDtoigd6LtQzaFSyiD
         6rGXv7S113c8HBmQi/xJb5TDU/IvrVjupv74gYFzA5KckdVoA+IpyFQA7KYZqu/tIOUp
         2UkxFxOeDil6l/kVnUBwFVkZn4ot53cwyZL/Rh3DROyVhk+wR1fnIrgOl7ZkACjzxwB9
         0p4onNHesKLEOkkEcrTr4LIKb8HcBTGAtBul4NNmFx/PZqPEZJSH9cEoyeyrJUskjTYq
         sAAR236CpA69JOVrxsLqSl+nAj4Sg57QClCR14xCQ4DfZXCwPzIrcYEVI7Ff0aGNMmQl
         ACKw==
X-Forwarded-Encrypted: i=1; AJvYcCXv4VsPXW9HNtD29oPCOfJ7NIdQWldb+89GPeR0h1Ajmq2rtELiGB/x/41SawyuK3JJaRurZv6I8yGQmKTwQ4dFEEO0kznP3k6NjRjPaKeQd5ThpbEFa8bYK07T+cwZJeqkb2LVAAktAU/HlKSCnPzuG54K5+LVmtKP6XXT339rk+Eb3OM1
X-Gm-Message-State: AOJu0Yw9nN9FDr9/TA4CRaWRZEo7bwe1iK4fyDRZAscekQnv5M+ktxQ4
	MHj47c1ciwLErtNIG6aTwurInEjcHxijjGxGDVFaMhzl4Wbl/QNAS22Buk4GgqO9oqj73Q5AU3/
	ggkGDbt2UqslutRoWblbeuKniLPQ=
X-Google-Smtp-Source: AGHT+IHVJkSsDjsW6r6/7AKH8NcIEvtzbu9axtrLp0aBUfYr7aAPPHDLcl+8227ox+KdfBMIsCmZgVIT3XXnVZK0qLY=
X-Received: by 2002:a17:906:f288:b0:a58:872b:20e5 with SMTP id
 gu8-20020a170906f28800b00a58872b20e5mr9031758ejb.28.1714481667961; Tue, 30
 Apr 2024 05:54:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240430115111.3453-1-kabel@kernel.org> <20240430115111.3453-3-kabel@kernel.org>
In-Reply-To: <20240430115111.3453-3-kabel@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 30 Apr 2024 15:53:51 +0300
Message-ID: <CAHp75VcgfvyZ9rcNev9CpQEN3CkUVozEkv+ycaQggPbE4tx+1Q@mail.gmail.com>
Subject: Re: [PATCH v8 2/9] platform: cznic: Add preliminary support for
 Turris Omnia MCU
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, 
	arm@kernel.org, Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-rtc@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2024 at 2:51=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org>=
 wrote:
>
> Add the basic skeleton for a new platform driver for the microcontroller
> found on the Turris Omnia board.

...

> +What:          /sys/bus/i2c/devices/<mcu_device>/serial_number
> +Date:          July 2024
> +KernelVersion: 6.10
> +Contact:       Marek Beh=C3=BAn <kabel@kernel.org>
> +Description:   (RO) Contains the 64 bit long board serial number in hexa=
decimal

64 bit long --> 64-bit

> +               format.
> +
> +               Only available if board information is burned in the MCU =
(older
> +               revisions have board information burned in the ATSHA204-A=
 chip).
> +
> +               Format: %016X.

It's strange to use capitalized hexadecimal here and not in other
files, but maybe it's something special about "serial number"? Dunno.

...

> +menuconfig CZNIC_PLATFORMS
> +       bool "Platform support for CZ.NIC's Turris hardware"

> +       depends on MACH_ARMADA_38X || COMPILE_TEST

This...

> +       help
> +         Say Y here to be able to choose driver support for CZ.NIC's Tur=
ris
> +         devices. This option alone does not add any kernel code.
> +
> +if CZNIC_PLATFORMS
> +
> +config TURRIS_OMNIA_MCU
> +       tristate "Turris Omnia MCU driver"

> +       depends on MACH_ARMADA_38X || COMPILE_TEST

...or this dependency is redundant. I think one would expect that
these platforms will not be always based on the same platform, hence I
would drop the former and leave the latter. But you should know better
than me.

> +       depends on I2C
> +       help
> +         Say Y here to add support for the features implemented by the
> +         microcontroller on the CZ.NIC's Turris Omnia SOHO router.
> +         To compile this driver as a module, choose M here; the module w=
ill be
> +         called turris-omnia-mcu.

...

> +static int omnia_get_version_hash(struct omnia_mcu *mcu, bool bootloader=
,
> +                                 u8 version[static OMNIA_FW_VERSION_HEX_=
LEN])

Interesting format of the last parameter. Does it make any difference
to the compiler if you use u8 *version?

> +{
> +       u8 reply[OMNIA_FW_VERSION_LEN];
> +       int err;
> +
> +       err =3D omnia_cmd_read(mcu->client,
> +                            bootloader ? CMD_GET_FW_VERSION_BOOT
> +                                       : CMD_GET_FW_VERSION_APP,
> +                            reply, sizeof(reply));
> +       if (err)
> +               return err;

> +       version[OMNIA_FW_VERSION_HEX_LEN - 1] =3D '\0';
> +       bin2hex(version, reply, OMNIA_FW_VERSION_LEN);

Hmm... I would rather use returned value

char *p;

p =3D bin2hex(...);
*p =3D '\0';

return 0;

> +       return 0;
> +}

...

> +static umode_t omnia_mcu_base_attrs_visible(struct kobject *kobj,
> +                                           struct attribute *a, int n)
> +{
> +       struct device *dev =3D kobj_to_dev(kobj);
> +       struct omnia_mcu *mcu =3D dev_get_drvdata(dev);

> +       umode_t mode =3D a->mode;

Do you need this?

> +       if ((a =3D=3D &dev_attr_serial_number.attr ||
> +            a =3D=3D &dev_attr_first_mac_address.attr ||
> +            a =3D=3D &dev_attr_board_revision.attr) &&
> +           !(mcu->features & FEAT_BOARD_INFO))

> +               mode =3D 0;

return 0; ?

> +       return mode;

return a->mode; ?

> +}

...

> +static void omnia_mcu_print_version_hash(struct omnia_mcu *mcu, bool boo=
tloader)
> +{
> +       const char *type =3D bootloader ? "bootloader" : "application";
> +       struct device *dev =3D &mcu->client->dev;
> +       u8 version[OMNIA_FW_VERSION_HEX_LEN];
> +       int err;
> +
> +       err =3D omnia_get_version_hash(mcu, bootloader, version);
> +       if (err) {
> +               dev_err(dev, "Cannot read MCU %s firmware version: %d\n",=
 type,
> +                       err);

One  line?

> +               return;
> +       }
> +
> +       dev_info(dev, "MCU %s firmware version hash: %s\n", type, version=
);
> +}

...

> +static const char *omnia_status_to_mcu_type(uint16_t status)

Why out of a sudden uint16_t instead of u16?

> +{
> +       switch (status & STS_MCU_TYPE_MASK) {
> +       case STS_MCU_TYPE_STM32:
> +               return "STM32";
> +       case STS_MCU_TYPE_GD32:
> +               return "GD32";
> +       case STS_MCU_TYPE_MKL:
> +               return "MKL";
> +       default:
> +               return "unknown";
> +       }
> +}

...

> +       static const struct {
> +               uint16_t mask;

Ditto.

> +               const char *name;
> +       } features[] =3D {
> +               { FEAT_EXT_CMDS,           "extended control and status" =
},
> +               { FEAT_WDT_PING,           "watchdog pinging" },
> +               { FEAT_LED_STATE_EXT_MASK, "peripheral LED pins reading" =
},
> +               { FEAT_NEW_INT_API,        "new interrupt API" },
> +               { FEAT_POWEROFF_WAKEUP,    "poweroff and wakeup" },
> +               { FEAT_TRNG,               "true random number generator"=
 },
> +       };

...

> +               omnia_info_missing_feature(dev, "feature reading");

Tautology. Read the final message. I believe you wanted to pass just
"reading" here.

...

> +       memcpy(mcu->board_first_mac, &reply[9], ETH_ALEN);

There is an API ether_copy_addr() or so, don't remember by heart.
You also need an include for ETH_ALEN definition.

...

> +#include <linux/i2c.h>

No users of this, you may replace with

struct i2c_client;

Am I right?

...

> +       CMD_GET_FW_VERSION_BOOT         =3D 0x0E, /* 20B git hash number =
*/

Git

...

> +       /* available only at address 0x2b (led-controller) */

LED-controller

...

> +enum omnia_ctl_byte_e {
> +       CTL_LIGHT_RST           =3D BIT(0),
> +       CTL_HARD_RST            =3D BIT(1),
> +       /* BIT(2) is currently reserved */
> +       CTL_USB30_PWRON         =3D BIT(3),
> +       CTL_USB31_PWRON         =3D BIT(4),
> +       CTL_ENABLE_4V5          =3D BIT(5),
> +       CTL_BUTTON_MODE         =3D BIT(6),
> +       CTL_BOOTLOADER          =3D BIT(7)

Keep trailing comma as it might be extended (theoretically). And you
do the similar in other enums anyway.

> +};

--
With Best Regards,
Andy Shevchenko

