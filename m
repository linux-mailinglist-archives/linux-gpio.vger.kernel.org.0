Return-Path: <linux-gpio+bounces-25941-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1764EB52EF1
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 12:48:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C148A02ED8
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 10:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B157531076B;
	Thu, 11 Sep 2025 10:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DrLoymcv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2595E26F2B9
	for <linux-gpio@vger.kernel.org>; Thu, 11 Sep 2025 10:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757587671; cv=none; b=NyTp/hHu2eCdHwRskXCVp3smkO8t3tPCzMVvX8hrG4Y2ovBPVDAdg78FYboKrxrgbNcCICZS+R7rVXkS5nKCEO+iwYZIzU13jetBE3e2wC9eJTt1+GqEew/1UGiujG6vj0pOf5A80TAyzZl1QXA9rAtrRXRz5EPsgZUE5fI+VOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757587671; c=relaxed/simple;
	bh=llKb4ipHcHyfqkAIQL5U+jOFXKk13xNneyFOZxJYqDY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nF1tjIfPhxnESjU3Uvcy67JpSHceNsqiznSXBSwMgWoDiP/qCFS0sxO+rqmb+qtMsBWNgT4enjdYTcjD0iO+++jdXkBSKEwx3VV7GhuOjLRFqOifHR7cuQUN5mFW1RbIe7hvGsIgZvyDxWqtsw5MUx0icHfus5OLXZwyaqNA0ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DrLoymcv; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-71d603b674aso3971277b3.1
        for <linux-gpio@vger.kernel.org>; Thu, 11 Sep 2025 03:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757587668; x=1758192468; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qn4R1pbzgofD6MTxiACftWXcks9s8P2JUQtoZ0XEQag=;
        b=DrLoymcv9KBKqtm3ton997wsJMl7WuuXR1iZUpi+pDwFdVdqJT0M6pLkV1PTG2jaGH
         wD9ymzNj7fAe2zjfTk6LjF5AdLUexG+XhdmtnuAYgPCaHevvs6PweHV4XnTWHYHHA/LZ
         vL8TBHilCq5U0mF78Qid3pa/HlTt1jQ6HS1+rIFPBgmotqRD+0LluA/L3oft0E8By6f8
         7e5a4Imsio2CpDNcMHesyRjXWYVBv+vCNHrXhbR+ugGyW2wWO5+akeGlQjZtQws3l9uv
         y3SHSoWxk3OQzj2HXIUd6CbOW4xffogT+U1TDP+a2Vi3M3Pjg55ROeqbxjrNDqm49SHg
         80QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757587668; x=1758192468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qn4R1pbzgofD6MTxiACftWXcks9s8P2JUQtoZ0XEQag=;
        b=bjjobljW2lEKS9UB6jgWBunifTawSTfYNDMyLHLBSLfJFdf5g3xGGjJdRiJ8CKlYFL
         awYqIdP0DEQXjfugbZHf1mQC2sTpFkM/aidqS46fbCG6D9u2+aIJ5Kf5yUqtsT5WD1fP
         GsfeZ2ajTt97PVdjG5RlVzJODXO1vmXIe5SweZ1p9PW6otouLBf9pq8mvmJMaTQK+OdK
         rHZzxdPPqBoyGlPUA3C0v2jYhLyf/mJVvKi3zjNiuVhVWXj32ZEt0qQHHX7toVLEubLV
         TuA1mG6L0HSg3H3tYhGBqgNopjKIe+3UIxkg3AIEF5++5QlW/c+pv+ZTRj3CAXfSp+w/
         bbkg==
X-Forwarded-Encrypted: i=1; AJvYcCUsnqYHNqkFslh3fgdvw069GKpNjjAECu7r7vgc6mjuCaLq8MdS4OGLKIUBv3X8rn78VCKaatnZNYLS@vger.kernel.org
X-Gm-Message-State: AOJu0YzZnxPyjhynndHYPYOsqbo8IVkC7f6gwRL17djawX09URTX9ADx
	qPq5NyxR7GIWd5hsrM4T2gI+Cr/JqRIhA1JJhHtJa4tP8XBPET/SLyfz6dir16prsqY0bDE6qKP
	dr547TbdDpAguSEwyByB+pJ3PHrTPUyE=
X-Gm-Gg: ASbGnct7Z+j9CFjVKTjdZ6gY+RS4o4+LHOOKVaAmFIrskcE2WWOvkATcrUy4kMffyCo
	a5Y3EImOLqKSS5Dcm/SLpTzurQDnkHtngDUGxwEuv2rvmjYWyF5tLHUjorGg6JQC7CtQ7AwH0rs
	DUHo66GrezZhP+lwvygcGveEOBd5w4/dj3zdoYjE04a3fFEfo01LFjrj+7lShhFb/7haFnxLMcA
	mTPrEjJ6ndtY7+pQdwLi/oa+utvsfJq+1HUHLzryO/zt1Oho+4u
X-Google-Smtp-Source: AGHT+IF2eGTYJAKVreu091MVH3moUSvTghJyuC0dRIIVCC2sh+snH/czvNQpCqcspY1v7mXB/0XTLNiU8L7M5ftwMpY=
X-Received: by 2002:a05:690c:450e:b0:721:1649:b041 with SMTP id
 00721157ae682-727f2dbf5e4mr180137607b3.2.1757587667843; Thu, 11 Sep 2025
 03:47:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904015048.1801451-1-a0282524688@gmail.com> <20250911100043.GH9224@google.com>
In-Reply-To: <20250911100043.GH9224@google.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Thu, 11 Sep 2025 18:47:36 +0800
X-Gm-Features: AS18NWAGX3WtCQoVZDVAI9xUo0zmugnI0RXp3sT2snc3J7PbhZfKY4UJ-0j4Eb0
Message-ID: <CAOoeyxU+ZrMsRMpn2oTGy4aCHgDwu_CNJYXJ5cjokS7tt8XuGQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v14 0/7] Add Nuvoton NCT6694 MFD drivers
To: Lee Jones <lee@kernel.org>
Cc: tmyu0@nuvoton.com, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, jdelvare@suse.com, alexandre.belloni@bootlin.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Lee,

Thanks for your feedback.

The series applies and builds cleanly on my local tree based on commit
8f5ae30d69d7 (v6.17-rc1).
My branch currently looks like this:

1ba54e97c6fe (HEAD -> mfd_v14_v6.17-rc1) rtc: Add Nuvoton NCT6694 RTC suppo=
rt
6a71b8c05f1f hwmon: Add Nuvoton NCT6694 HWMON support
bf0b59ad47d3 watchdog: Add Nuvoton NCT6694 WDT support
36a8e58f7368 can: Add Nuvoton NCT6694 CANFD support
8cf61471f368 i2c: Add Nuvoton NCT6694 I2C support
f0d3b273fd93 gpio: Add Nuvoton NCT6694 GPIO support
e86e2fb37ed7 mfd: Add core driver for Nuvoton NCT6694
8f5ae30d69d7 (tag: v6.17-rc1) Linux 6.17-rc1


To be absolutely sure there is no mismatch, I will rebase onto the
same tag once more, rebuild, re-test the kernel, and then RESEND the
series.

Please let me know if you are applying on a different base tree or if
there are other prerequisites I might have missed.

Thanks again for your review and your time.


Best regards,
Ming

Lee Jones <lee@kernel.org> =E6=96=BC 2025=E5=B9=B49=E6=9C=8811=E6=97=A5 =E9=
=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=886:00=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Thu, 04 Sep 2025, a0282524688@gmail.com wrote:
>
> > From: Ming Yu <a0282524688@gmail.com>
> >
> > This patch series introduces support for Nuvoton NCT6694, a peripheral
> > expander based on USB interface. It models the chip as an MFD driver
> > (1/7), GPIO driver(2/7), I2C Adapter driver(3/7), CANfd driver(4/7),
> > WDT driver(5/7), HWMON driver(6/7), and RTC driver(7/7).
> >
> > The MFD driver implements USB device functionality to issue
> > custom-define USB bulk pipe packets for NCT6694. Each child device can
> > use the USB functions nct6694_read_msg() and nct6694_write_msg() to iss=
ue
> > a command. They can also request interrupt that will be called when the
> > USB device receives its interrupt pipe.
> >
> > The following introduces the custom-define USB transactions:
> >         nct6694_read_msg - Send bulk-out pipe to write request packet
> >                            Receive bulk-in pipe to read response packet
> >                            Receive bulk-in pipe to read data packet
> >
> >         nct6694_write_msg - Send bulk-out pipe to write request packet
> >                             Send bulk-out pipe to write data packet
> >                             Receive bulk-in pipe to read response packe=
t
> >                             Receive bulk-in pipe to read data packet
> >
> > Changes since version 13:
> > - Update to guard(spinlock_irqsave)() in nct6694.c
> > - Add struct i2c_adapter_quirks in i2c-nct6694.c
> > - Rebased on top of v6.17-rc1 as requested
>
> I thought you were going to rebase this onto v6.17-rc1?
>
> It still does not apply.
>
> > Changes since version 12:
> > - Implement IDA in MFD driver to handle per-device IDs
> > - Use spinlock to replace irq mutex lock
> > - Use same email address in the signature
> >
> > Changes since version 11:
> > - Use platform_device's id to replace IDA
> > - Modify the irq_domain_add_simple() to irq_domain_create_simple() in
> >   nct6694.c
> > - Update struct data_bittiming_params related part in nct6694_canfd.c
> > - Fix the typo in the header in nct6694-hwmon.c
> >
> > Changes since version 10:
> > - Add change log for each patch
> > - Fix mfd_cell to MFD_CELL_NAME() in nct6694.c
> > - Implement IDA to allocate id in gpio-nct6694.c, i2c-nct6694.c,
> >   nct6694_canfd.c and nct6694_wdt.c
> > - Add header <linux/bitfield.h> in nct6694_canfd.c
> > - Add support to config tdc in nct6694_canfd.c
> > - Add module parameters to configure WDT's timeout and pretimeout value
> >   in nct6694_wdt.c
> >
> > Changes since version 9:
> > - Add devm_add_action_or_reset() to dispose irq mapping
> > - Add KernelDoc to exported functions in nct6694.c
> >
> > Changes since version 8:
> > - Modify the signed-off-by with my work address
> > - Rename all MFD cell names to "nct6694-xxx"
> > - Add irq_dispose_mapping() in the error handling path and in the remov=
e
> >   function
> > - Fix some comments in nct6694.c and in nct6694.h
> > - Add module parameters to configure I2C's baudrate in i2c-nct6694.c
> > - Rename all function names nct6694_can_xxx to nct6694_canfd_xxx in
> >   nct6694_canfd.c
> > - Fix nct6694_canfd_handle_state_change() in nct6694_canfd.c
> > - Fix nct6694_canfd_start() to configure NBTP and DBTP in nct6694_canfd=
.c
> > - Add can_set_static_ctrlmode() in nct6694_canfd.c
> >
> > Changes since version 7:
> > - Add error handling for devm_mutex_init()
> > - Modify the name of the child devices CAN1 and CAN2 to CAN0 and CAN1.
> > - Fix multiline comments to net-dev style in nct6694_canfd.c
> >
> > Changes since version 6:
> > - Fix nct6694_can_handle_state_change() in nct6694_canfd.c
> > - Fix warnings in nct6694_canfd.c
> > - Move the nct6694_can_priv's bec to the end in nct6694_canfd.c
> > - Fix warning in nct6694_wdt.c
> > - Fix temp_hyst's data type to signed variable in nct6694-hwmon.c
> >
> > Changes since version 5:
> > - Modify the module name and the driver name consistently
> > - Fix mfd_cell to MFD_CELL_NAME() and MFD_CELL_BASIC()
> > - Drop unnecessary macros in nct6694.c
> > - Update private data and drop mutex in nct6694_canfd.c
> > - Fix nct6694_can_handle_state_change() in nct6694_canfd.c
> >
> > Changes since version 4:
> > - Modify arguments in read/write function to a pointer to cmd_header
> > - Modify all callers that call the read/write function
> > - Move the nct6694_canfd.c to drivers/net/can/usb/
> > - Fix the missing rx offload function in nct6694_canfd.c
> > - Fix warngings in nct6694-hwmon.c
> >
> > Changes since version 3:
> > - Modify array buffer to structure for each drivers
> > - Fix defines and comments for each drivers
> > - Add header <linux/bits.h> and use BIT macro in nct6694.c and
> >   gpio-nct6694.c
> > - Modify mutex_init() to devm_mutex_init()
> > - Add rx-offload helper in nct6694_canfd.c
> > - Drop watchdog_init_timeout() in nct6694_wdt.c
> > - Modify the division method to DIV_ROUND_CLOSEST() in nct6694-hwmon.c
> > - Drop private mutex and use rtc core lock in rtc-nct6694.c
> > - Modify device_set_wakeup_capable() to device_init_wakeup() in
> >   rtc-nct6694.c
> >
> > Changes since version 2:
> > - Add MODULE_ALIAS() for each child driver
> > - Modify gpio line names be a local variable in gpio-nct6694.c
> > - Drop unnecessary platform_get_drvdata() in gpio-nct6694.c
> > - Rename each command in nct6694_canfd.c
> > - Modify each function name consistently in nct6694_canfd.c
> > - Modify the pretimeout validation procedure in nct6694_wdt.c
> > - Fix warnings in nct6694-hwmon.c
> >
> > Changes since version 1:
> > - Implement IRQ domain to handle IRQ demux in nct6694.c
> > - Modify USB_DEVICE to USB_DEVICE_AND_INTERFACE_INFO API in nct6694.c
> > - Add each driver's command structure
> > - Fix USB functions in nct6694.c
> > - Fix platform driver registration in each child driver
> > - Sort each driver's header files alphabetically
> > - Drop unnecessary header in gpio-nct6694.c
> > - Add gpio line names in gpio-nct6694.c
> > - Fix errors and warnings in nct6694_canfd.c
> > - Fix TX-flow control in nct6694_canfd.c
> > - Fix warnings in nct6694_wdt.c
> > - Drop unnecessary logs in nct6694_wdt.c
> > - Modify start() function to setup device in nct6694_wdt.c
> > - Add voltage sensors functionality in nct6694-hwmon.c
> > - Add temperature sensors functionality in nct6694-hwmon.c
> > - Fix overwrite error return values in nct6694-hwmon.c
> > - Add write value limitation for each write() function in nct6694-hwmon=
.c
> > - Drop unnecessary logs in rtc-nct6694.c
> > - Fix overwrite error return values in rtc-nct6694.c
> > - Modify to use dev_err_probe API in rtc-nct6694.c
> >
> >
> > Ming Yu (7):
> >   mfd: Add core driver for Nuvoton NCT6694
> >   gpio: Add Nuvoton NCT6694 GPIO support
> >   i2c: Add Nuvoton NCT6694 I2C support
> >   can: Add Nuvoton NCT6694 CANFD support
> >   watchdog: Add Nuvoton NCT6694 WDT support
> >   hwmon: Add Nuvoton NCT6694 HWMON support
> >   rtc: Add Nuvoton NCT6694 RTC support
> >
> >  MAINTAINERS                         |  12 +
> >  drivers/gpio/Kconfig                |  12 +
> >  drivers/gpio/Makefile               |   1 +
> >  drivers/gpio/gpio-nct6694.c         | 499 +++++++++++++++
> >  drivers/hwmon/Kconfig               |  10 +
> >  drivers/hwmon/Makefile              |   1 +
> >  drivers/hwmon/nct6694-hwmon.c       | 949 ++++++++++++++++++++++++++++
> >  drivers/i2c/busses/Kconfig          |  10 +
> >  drivers/i2c/busses/Makefile         |   1 +
> >  drivers/i2c/busses/i2c-nct6694.c    | 196 ++++++
> >  drivers/mfd/Kconfig                 |  15 +
> >  drivers/mfd/Makefile                |   2 +
> >  drivers/mfd/nct6694.c               | 388 ++++++++++++
> >  drivers/net/can/usb/Kconfig         |  11 +
> >  drivers/net/can/usb/Makefile        |   1 +
> >  drivers/net/can/usb/nct6694_canfd.c | 832 ++++++++++++++++++++++++
> >  drivers/rtc/Kconfig                 |  10 +
> >  drivers/rtc/Makefile                |   1 +
> >  drivers/rtc/rtc-nct6694.c           | 297 +++++++++
> >  drivers/watchdog/Kconfig            |  11 +
> >  drivers/watchdog/Makefile           |   1 +
> >  drivers/watchdog/nct6694_wdt.c      | 307 +++++++++
> >  include/linux/mfd/nct6694.h         | 102 +++
> >  23 files changed, 3669 insertions(+)
> >  create mode 100644 drivers/gpio/gpio-nct6694.c
> >  create mode 100644 drivers/hwmon/nct6694-hwmon.c
> >  create mode 100644 drivers/i2c/busses/i2c-nct6694.c
> >  create mode 100644 drivers/mfd/nct6694.c
> >  create mode 100644 drivers/net/can/usb/nct6694_canfd.c
> >  create mode 100644 drivers/rtc/rtc-nct6694.c
> >  create mode 100644 drivers/watchdog/nct6694_wdt.c
> >  create mode 100644 include/linux/mfd/nct6694.h
> >
> > --
> > 2.34.1
> >
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]

