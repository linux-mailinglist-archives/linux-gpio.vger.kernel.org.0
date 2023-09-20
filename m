Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 948A87A7C2F
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Sep 2023 13:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234907AbjITL66 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Sep 2023 07:58:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234896AbjITL65 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Sep 2023 07:58:57 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79F64AD
        for <linux-gpio@vger.kernel.org>; Wed, 20 Sep 2023 04:58:50 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-59bc97d7b3dso11440057b3.1
        for <linux-gpio@vger.kernel.org>; Wed, 20 Sep 2023 04:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695211129; x=1695815929; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28NVMB+0dlMbpsiwqiZj7l1HrZYCzPyDliFSimomypc=;
        b=MyirAqSs6iwPogOMSjFSmMZW6kmtBmlFzmcdoNoHa0bvK7R77GpyFfsJ1VlGChhib2
         g0Z6EBMz12vUrwuNgE+Qumy8MJFJlpgnR9uXd4NeQGa5w/4ImJp9sa/7O0akFezK/PFs
         UWmpQNTXl5ChAknYZ6Dq6BxQf0/q4nk31F6ZeSf49J0H+TBZ2/XoH9oScFexSt4wbrqQ
         ReR26oZEgFK14qZ6Nvuvrdq6q10wBbDgPmHPVA/1EWmcp7hjFBcfEGb55REmoWY8vGsH
         6P1W8eWI6Qbfbii9tm2lIaKeiomz3g2bF84NyBEo4cy1I08xSwt+SbbN5EJkiQbigSjb
         2gAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695211129; x=1695815929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=28NVMB+0dlMbpsiwqiZj7l1HrZYCzPyDliFSimomypc=;
        b=RDu7P/t/X4nmRoqYAmemCFTBC3RiwPGQhb09lHrnQMWrABcuM/nDZf1+7HB/2AOkNI
         Q3cbQlZDNPlYZiP7e7mwR0DASJiA9OIl6Wd+bM+C6NN8rNZ+1kAVDFCGA/cDyluNdwaD
         3xWVNXuq3I3cFU6UnYxocZ6N9WVi4yXTiqDUP/3eqSWkg4aDXozB3flmW4ZsIbS29a29
         PcG+gIm/pd0uoBltZUmt11nOQrvWcAkbHsRLWwy+KnO2b5PEQy4AJ7/u5x1oVZTQgg1F
         kWGUheBXVfd+cdhH9psYV5ZtsU8Mx9Ty4m82NZw+LjjOvb1u9A20LV9JWCEgOP6PJH1p
         43Mw==
X-Gm-Message-State: AOJu0YypZnwbr3zhi8SDhnptb8EqasvZ14oA18c02soSvF3hSLK4BC50
        MGRYjr1qsDkmWmRNXxx85r/pKr6EnStl5Dzg805CDQ==
X-Google-Smtp-Source: AGHT+IE8vbmM9gsNvv5eIK7aReOFyJncsBadXLPvwPfbNKN5u+xyybv4rzhWNk7saer3TTfXdFvrofeVpAKmyQrcfCo=
X-Received: by 2002:a81:8301:0:b0:59b:d5eb:3a83 with SMTP id
 t1-20020a818301000000b0059bd5eb3a83mr5393467ywf.16.1695211129552; Wed, 20 Sep
 2023 04:58:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230919103815.16818-1-kabel@kernel.org> <20230919103815.16818-4-kabel@kernel.org>
In-Reply-To: <20230919103815.16818-4-kabel@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 20 Sep 2023 13:58:37 +0200
Message-ID: <CACRpkdY8GcDYEDg=w4_ggY7O7kj-_X4ejpXni-t8M3yMivU88Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] platform: cznic: turris-omnia-mcu: Add support for
 MCU connected GPIOs
To:     =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc:     Gregory CLEMENT <gregory.clement@bootlin.com>,
        Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Marek,

thanks for your patch! This is a very interesting hardware.

On Tue, Sep 19, 2023 at 12:38=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org=
> wrote:

> Add support for GPIOs connected to the MCU on the Turris Omnia board.
>
> This include:
> - front button pin
> - enable pins for USB regulators
> - MiniPCIe / mSATA card presence pins in MiniPCIe port 0
> - LED output pins from WAN ethernet PHY, LAN switch and MiniPCIe ports
> - on board revisions 32+ also various peripheral resets and another
>   voltage regulator enable pin
>
> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>

OK all pretty straight-forward devices built on top of GPIO
in something like device tree or ACPI etc.

> --- a/Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
> +++ b/Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
> @@ -1,3 +1,19 @@
> +What:          /sys/bus/i2c/devices/<mcu_device>/front_button_mode
> +Date:          August 2023
> +KernelVersion: 6.6
> +Contact:       Marek Beh=C3=BAn <kabel@kernel.org>
> +Description:   (RW) The front button on the Turris Omnia router can be
> +               configured either to change the intensity of all the LEDs=
 on the
> +               front panel, or to send the press event to the CPU as an
> +               interrupt.
> +
> +               This file switches between these two modes:
> +               - "mcu" makes the button press event be handled by the MC=
U to
> +                 change the LEDs panel intensity.
> +               - "cpu" makes the button press event be handled by the CP=
U.
> +
> +               Format: %s.

I understand what this does, but why does this have to be configured
at runtime from userspace sysfs? Why can't this just be a property in
device tree or ACPI (etc)? I don't imagine a user is going to change
this back and forth are they? They likely want one or another.

> --- a/drivers/platform/cznic/turris-omnia-mcu-base.c
> +++ b/drivers/platform/cznic/turris-omnia-mcu-base.c
> @@ -222,9 +222,20 @@ static int omnia_mcu_probe(struct i2c_client *client=
)
>                 return -ENODATA;
>         }
>
> +       ret =3D omnia_mcu_register_gpiochip(mcu);
> +       if (ret)
> +               return ret;

I guess it's OK to have a GPIOchip with the rest of the stuff, there
are a few precedents, such as drivers/bcma.

> +static const char * const omnia_mcu_gpio_names[64] =3D {

I would name these _templates since it is not the final names
that will be used. Very nice with all debug names though!

> +#define _DEF_GPIO(_cmd, _ctl_cmd, _bit, _ctl_bit, _int_bit, _feat, _feat=
_mask) \
> +       {                                                               \
> +               .cmd =3D _cmd,                                           =
 \
> +               .ctl_cmd =3D _ctl_cmd,                                   =
 \
> +               .bit =3D _bit,                                           =
 \
> +               .ctl_bit =3D _ctl_bit,                                   =
 \
> +               .int_bit =3D _int_bit,                                   =
 \
> +               .feat =3D _feat,                                         =
 \
> +               .feat_mask =3D _feat_mask,                               =
 \
> +       }
> +#define _DEF_GPIO_STS(_name) \
> +       _DEF_GPIO(CMD_GET_STATUS_WORD, 0, STS_ ## _name, 0, INT_ ## _name=
, 0, 0)
> +#define _DEF_GPIO_CTL(_name) \
> +       _DEF_GPIO(CMD_GET_STATUS_WORD, CMD_GENERAL_CONTROL, STS_ ## _name=
, \
> +                 CTL_ ## _name, 0, 0, 0)
> +#define _DEF_GPIO_EXT_STS(_name, _feat) \
> +       _DEF_GPIO(CMD_GET_EXT_STATUS_DWORD, 0, EXT_STS_ ## _name, 0, \
> +                 INT_ ## _name, FEAT_ ## _feat | FEAT_EXT_CMDS, \
> +                 FEAT_ ## _feat | FEAT_EXT_CMDS)
> +#define _DEF_GPIO_EXT_STS_LED(_name, _ledext) \
> +       _DEF_GPIO(CMD_GET_EXT_STATUS_DWORD, 0, EXT_STS_ ## _name, 0, \
> +                 INT_ ## _name, FEAT_LED_STATE_ ## _ledext, \
> +                 FEAT_LED_STATE_EXT_MASK)
> +#define _DEF_GPIO_EXT_STS_LEDALL(_name) \
> +       _DEF_GPIO(CMD_GET_EXT_STATUS_DWORD, 0, EXT_STS_ ## _name, 0, \
> +                 INT_ ## _name, FEAT_LED_STATE_EXT_MASK, 0)
> +#define _DEF_GPIO_EXT_CTL(_name, _feat) \
> +       _DEF_GPIO(CMD_GET_EXT_CONTROL_STATUS, CMD_EXT_CONTROL, \
> +                 EXT_CTL_ ## _name, EXT_CTL_ ## _name, 0, \
> +                 FEAT_ ## _feat | FEAT_EXT_CMDS, \
> +                 FEAT_ ## _feat | FEAT_EXT_CMDS)
> +#define _DEF_INT(_name) \
> +       _DEF_GPIO(0, 0, 0, 0, INT_ ## _name, 0, 0)

Ugh that's really hard to read and understand, but I can't think of
anything better
so I guess we live with it.


> +static const struct omnia_gpio {
> +       u8 cmd, ctl_cmd;
> +       u32 bit, ctl_bit;
> +       u32 int_bit;

If they are really just ONE bit I would actually use an int, encode
the bit number rather than the mask, and then use BIT( ..->int_bit)
from <linux/bits.h> everywhere I need a mask. No strong preference
though.

> +/* mapping from interrupts to indexes of GPIOs in the omnia_gpios array =
*/
> +static const unsigned int omnia_int_to_gpio_idx[32] =3D {
> +       [ilog2(INT_CARD_DET)]           =3D 4,
> +       [ilog2(INT_MSATA_IND)]          =3D 5,
> +       [ilog2(INT_USB30_OVC)]          =3D 6,

ilog2 is a bit unituitive for a programmer, are you a schooled mathematicia=
n
Marek? ;)

It is also a consequence of using a bitmask rather than a bit number in
the struct, all ilog2 does is fls-1. So what about just putting the bit num=
ber
in the struct and then all of these assignments will look natural as well.

> +/* index of PHY_SFP GPIO in the omnia_gpios array */
> +enum {
> +       OMNIA_GPIO_PHY_SFP_OFFSET =3D 54,
> +};

I would just use a define for this, the enum isn't very useful for
singular values.

> +static int omnia_ctl_cmd(struct omnia_mcu *mcu, u8 cmd, u16 val, u16 mas=
k)
> +{
> +       int err;
> +
> +       mutex_lock(&mcu->lock);
> +       err =3D omnia_ctl_cmd_unlocked(mcu, cmd, val, mask);

We just discussed this on an unrelated topic: *_unlocked means it should
be called without need for the appropriate mutex to be locked, since it cle=
arly
requires &mcu->lock to be taken, this should be
omnia_ctl_cmd_locked() as in "call this with the lock held".

I did a quick grep _locked to convince myself about this.
Obvious exampled include wait_event_interruptible_locked_irq()
or wake_up_locked() in the core kernel infrastructure that clearly states
(include/linux/wait.h for wait_event_interruptible_locked():
"It must be called with wq.lock being held."

> +static int omnia_gpio_get(struct gpio_chip *gc, unsigned int offset)
> +{
(...)
> +       if (gpio->cmd =3D=3D CMD_GET_STATUS_WORD &&
> +           !(mcu->features & FEAT_NEW_INT_API))
> +               return !!(mcu->last_status & gpio->bit);

So I expect something like return !!(mcu->last_status & BIT(gpio->bit));

> +static int omnia_gpio_get_multiple(struct gpio_chip *gc, unsigned long *=
mask,
> +                                  unsigned long *bits)
> +{
> +       mutex_lock(&mcu->lock);
(...)
> +               if (err)
> +                       goto err_unlock;
(...)
> +       if (err)
> +               goto err_unlock;
(...)
> +       if (err)
> +               goto err_unlock;
> +
> +       mutex_unlock(&mcu->lock);

This function is kind of a good example of where using scoped guards
from <linux/cleanup.h> can simplify the code. After the initial lock you
can just return on error and let the cleanup handler unlock the mutex,
just guard(mutex)(&mcu->lock);

In the beginning and then it's done, the lock will be held until the
function is exited.

> +static void omnia_gpio_set_multiple(struct gpio_chip *gc, unsigned long =
*mask,
> +                                   unsigned long *bits)
> +{
(...)

same here.

> +static int omnia_gpio_init_valid_mask(struct gpio_chip *gc,
> +                                     unsigned long *valid_mask,
> +                                     unsigned int ngpios)
> +{
> +       struct omnia_mcu *mcu =3D gpiochip_get_data(gc);
> +
> +       bitmap_zero(valid_mask, ngpios);
> +
> +       for (int i =3D 0; i < ngpios; ++i) {
> +               const struct omnia_gpio *gpio =3D &omnia_gpios[i];
> +
> +               if (!gpio->cmd && !gpio->int_bit)
> +                       continue;
> +
> +               if (omnia_gpio_available(mcu, gpio))
> +                       set_bit(i, valid_mask);

Speaking of locks, isn't this where you should use __set_bit()
rather than set_bit()?

__set_bit() is incomprehensible shorthand for "set_bit_nonatomic".

> +static void omnia_irq_shutdown(struct irq_data *d)
> +{
> +       struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +       struct omnia_mcu *mcu =3D gpiochip_get_data(gc);
> +       irq_hw_number_t hwirq =3D irqd_to_hwirq(d);
> +       u32 bit =3D omnia_gpios[hwirq].int_bit;
> +
> +       mcu->rising &=3D ~bit;
> +       mcu->falling &=3D ~bit;

Yeah so here it would be BIT(bit) etc.

> +       if (type & IRQ_TYPE_EDGE_RISING)
> +               mcu->rising |=3D bit;
> +       else
> +               mcu->rising &=3D ~bit;

And with bits in place of bitmasks these would be

if ()
  __set_bit(bit, mcu->rising);
else
  __clear_bit(bit, mcu->rising);

etc

> +static void omnia_irq_init_valid_mask(struct gpio_chip *gc,
> +                                     unsigned long *valid_mask,
> +                                     unsigned int ngpios)
> +{
> +       struct omnia_mcu *mcu =3D gpiochip_get_data(gc);
> +
> +       bitmap_zero(valid_mask, ngpios);
> +
> +       for (int i =3D 0; i < ngpios; ++i) {
> +               const struct omnia_gpio *gpio =3D &omnia_gpios[i];
> +
> +               if (!gpio->int_bit)
> +                       continue;
> +
> +               if (omnia_gpio_available(mcu, gpio))
> +                       set_bit(i, valid_mask);

__set_bit()

> +static bool omnia_irq_read_pending_new(struct omnia_mcu *mcu,
> +                                      unsigned long *pending)
> +{
> +       u32 rising, falling;
> +       u8 reply[8] =3D {};
> +       size_t len;
> +       int err;
> +
> +       /*
> +        * Determine how many bytes we need to read from the reply to the
> +        * CMD_GET_INT_AND_CLEAR command in order to retrieve all unmaske=
d
> +        * interrupts.
> +        */
> +       len =3D max(((ilog2(mcu->rising & mcu->mask) >> 3) << 1) + 1,
> +                 ((ilog2(mcu->falling & mcu->mask) >> 3) << 1) + 2);

Really hard to read, and again easier if we store the bit number
rather than the bitmask.

> +       mutex_lock(&mcu->lock);

Scoped guard?

> +static void button_release_emul_fn(struct work_struct *work)
> +{
> +       struct omnia_mcu *mcu =3D container_of(to_delayed_work(work),
> +                                            struct omnia_mcu,
> +                                            button_release_emul_work);
> +
> +       mcu->button_pressed_emul =3D false;
> +       generic_handle_irq_safe(mcu->client->irq);
> +}
(...)
> +       /*
> +        * The old firmware triggers an interrupt whenever status word ch=
anges,
> +        * but does not inform about which bits rose or fell. We need to =
compute
> +        * this here by comparing with the last status word value.
> +        *
> +        * The STS_BUTTON_PRESSED bit needs special handling, because the=
 old
> +        * firmware clears the STS_BUTTON_PRESSED bit on successful compl=
etion
> +        * of the CMD_GET_STATUS_WORD command, resulting in another inter=
rupt:
> +        * - first we get an interrupt, we read the status word where
> +        *   STS_BUTTON_PRESSED is present,
> +        * - MCU clears the STS_BUTTON_PRESSED bit because we read the st=
atus
> +        *   word,
> +        * - we get another interrupt because the status word changed aga=
in
> +        *   (STS_BUTTON_PRESSED was cleared).
> +        *
> +        * The gpiolib-cdev, gpiolib-sysfs and gpio-keys input driver all=
 call
> +        * the gpiochip's .get() method after an edge event on a requeste=
d GPIO
> +        * occurs.
> +        *
> +        * We ensure that the .get() method reads 1 for the button GPIO f=
or some
> +        * time.
> +        */
> +
> +       if (status & STS_BUTTON_PRESSED) {
> +               mcu->button_pressed_emul =3D true;
> +               mod_delayed_work(system_wq, &mcu->button_release_emul_wor=
k,
> +                                msecs_to_jiffies(50));
> +       } else if (mcu->button_pressed_emul) {
> +               status |=3D STS_BUTTON_PRESSED;
> +       }

I feel a bit icky about this, would be best if Dmitry Torokhov review
such input subsystem-related things.

It looks like a reimplementation of drivers/input/keyboard/gpio_keys.c
so why not just connect a gpio-keys device using either device tree
or a software node? (Dmitry knows all about how to create proper
software nodes for stuff like this, DT is self-evident.)

> +       mcu->gc.names =3D omnia_mcu_gpio_names;

Do we really support format strings in these names? I don't
think so, or I'm wrong about my own code... (Which wouldn't
be the first time.)

>  #include <asm/byteorder.h>
> +#include <linux/gpio/driver.h>
>  #include <linux/i2c.h>
> +#include <linux/log2.h>

I think we want to get rid of log2.h from this driver.

Yours,
Linus Walleij
