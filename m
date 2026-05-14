Return-Path: <linux-gpio+bounces-36808-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLhiBl5aBWomVQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36808-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 07:15:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E8B53DF08
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 07:15:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26CE13048084
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 05:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD1233B8934;
	Thu, 14 May 2026 05:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hiS5p4go"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E471F872D
	for <linux-gpio@vger.kernel.org>; Thu, 14 May 2026 05:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778735583; cv=pass; b=pEUffcE13X25h1O7QWhn9VyOIL488JM8aXdLoJleN1mn9UUD5e0fUhOC7yHKrlPhQoSzitU2ylom/iTZxHlvqZxHsR0KjaUSk0V8BEMdS2Ui7x2iAcLzsam7mNn6v5R7lTUy4qcWgiC76AQa+TOeeCmSErODWvOcE5tGxGitJ90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778735583; c=relaxed/simple;
	bh=OkdlTxJrIffafZLYBsN0a4k4dqZ5V+Hvm+XCe9BmCs8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AeNjFYup+f/dlLb6nCOLM+c68e5w7HFzwmf/Mp6e64dYg1usLuZ3XCUhEBqmis+KELWT7tg410Ic4u5+k7LWWXgEaW+FXfIQEk1yMsKYUgjZwxp/CciL5bLM+qg5dTHb4fk6o48YuUk/DC72NhbO6D1y96UsJ5Mw5pIchk3FT28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hiS5p4go; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-651d6347a69so7591514d50.0
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 22:13:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778735581; cv=none;
        d=google.com; s=arc-20240605;
        b=ROBlsmEz1GDC+iZk69NeJ6Ce+syc9KGxBmTdFsZwq3R6TC23uCLMjVbfmwldc5Aw3B
         HtjqScwnPQJCCTBt7XxBk38qo9xmL6IK3IS+FNymxnLCEMiY45ZgE7x0QvkUoXt3Clg7
         huR1TFPpoOUfQmm3OWx6Bw9ROJVfOThMyJIE7EeTjv41z/OeoCtxHNC65CN3NzyvxWm0
         fJBqngOFi6KGixpuYzPp+cj1YZ41aAfXPHjCtVHbTEL4oJaYHozLUclrtKdgV5nJwYHf
         omdAZkghQEzAl69gmrVWan1oapcnVsz2faQhf7PlJFkOxkvCKQHlj2/OkdTVlLbrQLtl
         Cd0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ldXGxXqstB4z6UJeQWyN/wPMyI1frnajQ+WrbjoPiwc=;
        fh=3FQBJu2cNBmdOXKycNfyB3cRghZr2NQKbvdFv2vKnic=;
        b=aOrcY+2OmGyaC5/RFUrLnMyRQp/p9mnLmZPm015QgXYUqCHoWLf1kNIL5LBh4tgOye
         TReLOhELFOhtaT2gUQITWixn8N6odjgC6FfXb2vuQCXXuoa6eLbudBrIj64bL0dBDzP3
         q2/ouqn1olxkpQQvoqEH9zusY6q4P1JL3/mcExm3gjXVyfeebGvLVF5mrpeiB1FpfLMW
         HXH+JDRdqMesn9/lKU6ZJI1RpOWmU43lxiDZLkPW8ipcOZ2P6ylkoLmZNeq6zZXMytvx
         qSV4xKOgKQeLzoC8gLgpXWphVg65nEqdMc7m419CCTdJtLAzcD+x/d+TvmuYA00CHScH
         I2eA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778735581; x=1779340381; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ldXGxXqstB4z6UJeQWyN/wPMyI1frnajQ+WrbjoPiwc=;
        b=hiS5p4goMt0l4WxvMvVZGaeSq1tky4CAXXrr59q1P/T+nMpvacmOHtMOSUqbAQxa7m
         wmu+o6FjMMaDd82J+jLaOZMO0gb4bF8hKWEGZrnXeuhEIvJoYUTu1klA/g0FRfrxemJn
         pB+FLEmQp0cf9jVPbECGLPAmLD0KWmjYmrWta2iKqj+cRypLjEORJeGA4J2dcGA8rlRf
         IIi8xuFdI48ZdA2r5dJ7BMQRPO/eup/NG5QU1fv3QV9VjLF6MTgQrBw2eZD47kCPIq/E
         AOZZ4OUcs+zsI0dcDEq9hTRg476jaRRwvZtW121lUFpNgFyAuw2d7h+Re8Njru69+BDD
         y57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778735581; x=1779340381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ldXGxXqstB4z6UJeQWyN/wPMyI1frnajQ+WrbjoPiwc=;
        b=JIbzr0h6uFNofz/G2BKb4+0CoxY1SvdAA/uldI/x6Y0WGAL7YwdNNJ9MNSqTYzvsWd
         OVjJ1nnvsvhrQ8xzR/xD5gCD0ttYh1TB0rWAdtgzUPoURngbA+4cXK9vHjiD6GBuFGI7
         kh3aljgek8cR86GNsoF5V54/4ZfjTNY8hcBqbrxKCYq2Bst5sQRyQgtq3CYJskKqD9Vm
         c6bx6lGLdmIq0isb+d4IVqSYl++n6Hun+FES6JzxV4Esw5GPmW7HKE0nM3d/dXkmIcrz
         1/Gs9CewhB0yY+jS9VjvY5mq1uSjfSlt1Or0l4FQ0cJdW4BmbYo2pUPlv48fPzZxWFDO
         5QEw==
X-Forwarded-Encrypted: i=1; AFNElJ8KR4cJYTZDMrydtDCuPGL3xW6XYsEHOrkGLaMqBULS5BgNs6NMlKkdCny+ln6wJc6zNrfDe2XZ/BpW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+qGUAAc4p5YF2RHfKWo7MpzFWxqgxklEg+QkG56f4PC4X1+YI
	Bh8RXsqV5Jvkwru3BDVQ7x2MZQtZIZ8JJ1EZiRbBIn9fWbD4JfkF/KHArjnzqey6FiIt9DT2e1+
	rmdo038mCZ3OK3EDkNi0JHoEv6fcVZs8=
X-Gm-Gg: Acq92OGA7rTUfHOld1hbcdKjik7ShpdSRFTi/K/IOmKA8MGesCeYoKWlcvTrErSSkmB
	ZPEoQPkyXPeFlHShOVqottOvWkJj3ybTO9wz7jNjIoCYIE/ztKxgZUdhqCkjVrWbB3BuuaraAPP
	FCikJ2AX7b0EdkrdSqhoGLL8RJPwFfYj3sQNtng76hlWGQzceKLub+U9dFheKsjkw1sCbS09mv+
	RkYrqdC91WdNAKQSIxGRhHu5Vcg8ttbKi8n7X8l4EZ5fL8lERYCNhogml4jwevFLbsd4/lcCdK3
	K+1kb+mauhqz8Yct5E1SHaK2uy6TWVM6Y3NX/n8ICRa2r7ekn5DrOF+ddUgTaJzzBgOXwchVmhC
	WW9UiK3TjfKSpngMRMM55x1YO9xqQqoAF39x1G1DgLRNS42x2fyVVJHqSBj9IxX1WtsyJFUCAxz
	MQVoMz
X-Received: by 2002:a05:690c:c4e8:b0:7bf:1433:8f92 with SMTP id
 00721157ae682-7c7e5d9034amr20480207b3.7.1778735580968; Wed, 13 May 2026
 22:13:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513061338.9348-1-hardikprakash.official@gmail.com>
 <20260513061338.9348-2-hardikprakash.official@gmail.com> <dcd84a44-d52b-4810-a1a8-5865f80db1ba@kernel.org>
 <CANTFpSUr7KWMA5D7wh48f5-Ty9hDo7U7Ydsob32YZuZ83dRiiw@mail.gmail.com>
In-Reply-To: <CANTFpSUr7KWMA5D7wh48f5-Ty9hDo7U7Ydsob32YZuZ83dRiiw@mail.gmail.com>
From: Hardik Prakash <hardikprakash.official@gmail.com>
Date: Thu, 14 May 2026 10:42:48 +0530
X-Gm-Features: AVHnY4IUclQrg64HYPwoPct4FtYH8ADNAzz1IlmeFEwXBPHV-KJB5t6DYYtuh7k
Message-ID: <CANTFpSWty5VGoaM2cq6-nn=eJJDy5r9NozGNyB4ryY4+TaODbg@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl-amd: enable IRQ for WACF2200 touchscreen on
 Lenovo Yoga 7 14AGP11
To: Mario Limonciello <superm1@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, wsa@kernel.org, linus.walleij@linaro.org, 
	basavaraj.natikar@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 76E8B53DF08
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36808-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

(Resending with full Cc list =E2=80=94 apologies for the missed recipients.=
)

On Wed, May 13, 2026 at 22:53, Mario Limonciello wrote:
> I don't understand.  Our design is that the interrupt is disabled
> initially when driver loads (we don't trust state of the GPIO
> configuration pre-boot), and then when i2c-hid loads later it is
> re-enabled via amd_gpio_irq_enable().
>
> Why isn't that flow working on this system?

The flow breaks because i2c-hid never gets to probe. The lost
arbitration errors happen on AMDI0010:02 at ~2.3s after boot, before
any driver reaches the HID layer. Without the probe ordering fix,
i2c_designware probes the bus while pinctrl-amd is still initialising
and GPIO 157 (the WACF2200 GpioInt per ACPI _CRS) has its interrupt
bits cleared. The bus transaction fails immediately, the device never
appears in /sys/bus/hid/devices/, and i2c-hid has nothing to bind to.

With patch 1 alone (GPIO IRQ fix), the interrupt is enabled but the
probe ordering race still causes arbitration failures. With both patches
applied, the bus comes up cleanly and i2c-hid probes successfully.

However, see my reply on the 2/2 thread =E2=80=94 there may be a deeper cau=
se
related to _DSM.

Thanks,
Hardik


On Thu, 14 May 2026 at 10:36, Hardik Prakash
<hardikprakash.official@gmail.com> wrote:
>
> On Wed, May 13, 2026 at 22:53, Mario Limonciello wrote:
> > I don't understand.  Our design is that the interrupt is disabled
> > initially when driver loads (we don't trust state of the GPIO
> > configuration pre-boot), and then when i2c-hid loads later it is
> > re-enabled via amd_gpio_irq_enable().
> >
> > Why isn't that flow working on this system?
>
> The flow breaks because i2c-hid never gets to probe. The lost
> arbitration errors happen on AMDI0010:02 at ~2.3s after boot, before
> any driver reaches the HID layer. Without the probe ordering fix,
> i2c_designware probes the bus while pinctrl-amd is still initialising
> and GPIO 157 (the WACF2200 GpioInt per ACPI _CRS) has its interrupt
> bits cleared. The bus transaction fails immediately, the device never
> appears in /sys/bus/hid/devices/, and i2c-hid has nothing to bind to.
>
> With patch 1 alone (GPIO IRQ fix), the interrupt is enabled but the
> probe ordering race still causes arbitration failures. With both patches
> applied, the bus comes up cleanly and i2c-hid probes successfully.
>
> However, see my reply on the 2/2 thread =E2=80=94 there may be a deeper c=
ause
> related to _DSM.
>
> Thanks,
> Hardik
>
> On Wed, 13 May 2026 at 22:53, Mario Limonciello <superm1@kernel.org> wrot=
e:
> >
> > ++
> >
> > On 5/13/26 01:13, Hardik Prakash wrote:
> > > On Lenovo Yoga 7 14AGP11 (83TD), the WACF2200 touchscreen controller
> > > is wired via I2C2 (AMDI0010:02) with its interrupt on GPIO pin 157
> > > (confirmed via ACPI _CRS GpioInt decode). After amd_gpio_irq_init()
> > > clears all GPIO interrupts at boot, pin 157 is never re-enabled,
> > > preventing the touchscreen from signalling the driver.
> > >
> > > Windows keeps GPIO 157 INTERRUPT_ENABLE (bit 11) and INTERRUPT_MASK
> > > (bit 12) set after initialisation. Add a DMI quirk to restore these
> > > bits after amd_gpio_irq_init() on this hardware.
> > >
> > > Signed-off-by: Hardik Prakash <hardikprakash.official@gmail.com>
> > > Assisted-by: Claude:claude-sonnet-4-6
> > > Assisted-by: GPT-Codex:gpt-5.2-codex
> > > ---
> > >   drivers/pinctrl/pinctrl-amd.c | 35 ++++++++++++++++++++++++++++++++=
+++
> > >   1 file changed, 35 insertions(+)
> > >
> > > diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-=
amd.c
> > > index e3128b0045d22..64315b0edf2a6 100644
> > > --- a/drivers/pinctrl/pinctrl-amd.c
> > > +++ b/drivers/pinctrl/pinctrl-amd.c
> > > @@ -26,6 +26,7 @@
> > >   #include <linux/interrupt.h>
> > >   #include <linux/bitops.h>
> > >   #include <linux/pinctrl/pinconf.h>
> > > +#include <linux/dmi.h>
> > >   #include <linux/pinctrl/pinconf-generic.h>
> > >   #include <linux/pinctrl/pinmux.h>
> > >   #include <linux/string_choices.h>
> > > @@ -39,6 +40,39 @@
> > >   static struct amd_gpio *pinctrl_dev;
> > >   #endif
> > >
> > > +static const struct dmi_system_id amd_gpio_quirk_yoga7_14agp11[] =3D=
 {
> > > +     {
> > > +             .matches =3D {
> > > +                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > > +                     DMI_MATCH(DMI_PRODUCT_NAME, "83TD"),
> > > +                     DMI_MATCH(DMI_BOARD_NAME, "LNVNB161216"),
> > > +             },
> > > +     },
> > > +     { }
> > > +};
> > > +
> > > +static void amd_gpio_apply_quirks(struct amd_gpio *gpio_dev)
> > > +{
> > > +     const unsigned int pin =3D 157; /* WACF2200 GpioInt per ACPI _C=
RS */
> > > +     unsigned long flags;
> > > +     u32 reg;
> > > +
> > > +     if (!dmi_check_system(amd_gpio_quirk_yoga7_14agp11))
> > > +             return;
> > > +     if (pin >=3D gpio_dev->gc.ngpio)
> > > +             return;
> > > +
> > > +     raw_spin_lock_irqsave(&gpio_dev->lock, flags);
> > > +     reg =3D readl(gpio_dev->base + pin * 4);
> > > +     reg |=3D BIT(INTERRUPT_ENABLE_OFF) | BIT(INTERRUPT_MASK_OFF);
> > > +     writel(reg, gpio_dev->base + pin * 4);
> > > +     raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
> > > +
> > > +     dev_info(&gpio_dev->pdev->dev,
> > > +              "Enabled IRQ for GPIO %u (Yoga 7 14AGP11 touchscreen)\=
n",
> > > +              pin);
> >
> > I don't understand.  Our design is that the interrupt is disabled
> > initially when driver loads (we don't trust state of the GPIO
> > configuration pre-boot), and then when i2c-hid loads later it is
> > re-enabled via amd_gpio_irq_enable().
> >
> > Why isn't that flow working on this system?
> >
> > > +}
> > > +
> > >   static int amd_gpio_get_direction(struct gpio_chip *gc, unsigned of=
fset)
> > >   {
> > >       unsigned long flags;
> > > @@ -1219,6 +1253,7 @@ static int amd_gpio_probe(struct platform_devic=
e *pdev)
> > >
> > >       /* Disable and mask interrupts */
> > >       amd_gpio_irq_init(gpio_dev);
> > > +     amd_gpio_apply_quirks(gpio_dev);
> > >
> > >       girq =3D &gpio_dev->gc.irq;
> > >       gpio_irq_chip_set_chip(girq, &amd_gpio_irqchip);
> >

