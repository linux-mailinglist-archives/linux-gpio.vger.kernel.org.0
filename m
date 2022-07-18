Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2844C577D1F
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jul 2022 10:06:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233561AbiGRIGF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jul 2022 04:06:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233519AbiGRIGE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jul 2022 04:06:04 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D94BDEC2;
        Mon, 18 Jul 2022 01:06:02 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id p14so8222773qvo.9;
        Mon, 18 Jul 2022 01:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=2oqv9p5uTPdEJlmgQNnXU/cXJrUt6u3xwFlX5nKvKZ4=;
        b=DxLddlgUVAv8VKERY9UddsAGAuROSWYW7riSA26XWr6jmGC1vF0kGjPIH9VZqd/LI4
         Zc44cq3+Zn6gcgQ5HNjhpsMd6yIBQ4/2uEexodTm+9U791ZuFn32usdK9ls2CmBPUm5s
         NLJ2zmzh1C+LsIuOg88sg+wsirIrtsDI7NhjbybEnhlRQaV6LJ3nPR+uY9VY9d70+Hqt
         NQBhZOwxEuU6tHAszPI1bwPG/G6XF8U/AaxkxsFr2wnogUcwPE7sQRHV5NlCh05nV/EI
         a9vuc7FcLyLIZvkinBXpHlxyeTgTTy6RpjNGmk+TPhLoUsHxfz6CYv2DgnCyIHojqkBU
         dJnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=2oqv9p5uTPdEJlmgQNnXU/cXJrUt6u3xwFlX5nKvKZ4=;
        b=hF9l0sCoNICND8cudJjQFT4xhNxD9n9AH83ucWLVYr/0sgWBunztZxxNpZi66MHxQ0
         doOASxengbG5pdisxCmWjUwklG9fz+Qf3vO3BkvYmujtn3K3TIbmDfzvrQxWCtZNSMYC
         bSm2lLAm1JY6/02e1C7OMe+kFVFZ8qcm86jn2Qp/jQ0FZw6PtttdsqpfJfgAZsBpKbUh
         AJV9jjhfjaU9YEvTHrVYvJpXVxDIr/M4hFqtuJ1KoQ1w5i65CM85BaiaeKwvOXqQ0VYq
         fgKZN52J2me+XFJiq31FabG1VZffyG5Mlb1Yv9J/fD5ZuikmkYlVc+/tjDw9r46rEixT
         0SwQ==
X-Gm-Message-State: AJIora8ggUxhl3OItTMLSMtW/823bP+Oj/fMYqq+F7wS4Oyf4+Asp04+
        vQy+JzfVcGwsxTx8WXaxi4c=
X-Google-Smtp-Source: AGRyM1sG15eHtll24jiIJ/xZtKIAcm3In9Bq9zWFFa+FuxitXT5AmiQ3J8PC5KGx740TrW69MX2tmQ==
X-Received: by 2002:a05:6214:27cb:b0:473:5954:5951 with SMTP id ge11-20020a05621427cb00b0047359545951mr20284976qvb.2.1658131561283;
        Mon, 18 Jul 2022 01:06:01 -0700 (PDT)
Received: from p200300f6ef036f005de6a4d0d791ed01.dip0.t-ipconnect.de (p200300f6ef036f005de6a4d0d791ed01.dip0.t-ipconnect.de. [2003:f6:ef03:6f00:5de6:a4d0:d791:ed01])
        by smtp.gmail.com with ESMTPSA id he25-20020a05622a601900b0031ef67386a5sm314999qtb.68.2022.07.18.01.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 01:06:00 -0700 (PDT)
Message-ID: <3f82afed59abaf2f8088f8d4b600736ee666ad6e.camel@gmail.com>
Subject: Re: [PATCH v2 01/10] input: keyboard: adp5588-keys: support gpi key
 events as 'gpio keys'
From:   Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date:   Mon, 18 Jul 2022 10:07:02 +0200
In-Reply-To: <CAHp75VfWWP__yyWhG2urwu=k9V1_afiOwD-hynOjSa0LUHg9Tg@mail.gmail.com>
References: <20220715125138.378632-1-nuno.sa@analog.com>
         <20220715125138.378632-2-nuno.sa@analog.com>
         <CAHp75VfWWP__yyWhG2urwu=k9V1_afiOwD-hynOjSa0LUHg9Tg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 2022-07-15 at 20:59 +0200, Andy Shevchenko wrote:
> On Fri, Jul 15, 2022 at 2:50 PM Nuno S=C3=A1 <nuno.sa@analog.com> wrote:
> >=20
> > This change replaces the support for GPIs as key event generators.
> > Instead of reporting the events directly, we add a gpio based
> > irqchip
> > so that these events can be consumed by keys defined in the gpio-
> > keys
> > driver (as it's goal is indeed for keys on GPIOs capable of
> > generating
> > interrupts). With this, the gpio-adp5588 driver can also be
> > dropped.
> >=20
> > The basic idea is that all the pins that are not being used as part
> > of
> > the keymap matrix can be possibly requested as GPIOs by gpio-keys
> > (it's also fine to use these pins as plain interrupts though that's
> > not
> > really the point).
> >=20
> > Since the gpiochip now also has irqchip capabilities, we should
> > only
> > remove it after we free the device interrupt (otherwise we could,
> > in
> > theory, be handling GPIs interrupts while the gpiochip is
> > concurrently
> > removed). Thus the call 'adp5588_gpio_add()' is moved and since the
> > setup phase also needs to come before making the gpios visible, we
> > also
> > need to move 'adp5588_setup()'.
> >=20
> > While at it, always select GPIOLIB so that we don't need to use
> > #ifdef
> > guards.
>=20
> ...
>=20
> > +static void adp5588_irq_mask(struct irq_data *d)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct gpio_chip *gc =3D irq_data=
_get_irq_chip_data(d);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct adp5588_kpad *kpad =3D gpi=
ochip_get_data(gc);
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long real_irq =3D kpad->=
gpiomap[d->hwirq];
>=20
> There is a helper to retrieve hwirq from the IRQ chip data.
>=20

Will look into that...

> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kpad->irq_mask[ADP5588_BANK(real_=
irq)] &=3D
> > ~ADP5588_BIT(real_irq);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gpiochip_disable_irq(gc, d->hwirq=
);
> > +}
>=20
> ...
>=20
> > +static void adp5588_irq_unmask(struct irq_data *d)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct gpio_chip *gc =3D irq_data=
_get_irq_chip_data(d);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct adp5588_kpad *kpad =3D gpi=
ochip_get_data(gc);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long real_irq =3D kpad->=
gpiomap[d->hwirq];
>=20
> Ditto.
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gpiochip_enable_irq(gc, d->hwirq)=
;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kpad->irq_mask[ADP5588_BANK(real_=
irq)] |=3D
> > ADP5588_BIT(real_irq);
> > +}
>=20
> ...
>=20
> > +static int adp5588_gpiomap_get_hwirq(struct device *dev, const u8
> > *map,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned=
 int gpio, unsigned
> > int ngpios)
> > =C2=A0{
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int hwirq;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (hwirq =3D 0; hwirq < ngpios;=
 hwirq++)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 if (map[hwirq] =3D=3D gpio)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return hwir=
q;
>=20
> I'm sorry if I already asked, but can irq_valid_mask be helpful here?
>=20

Yes you did and I did checked it but never replied... So, IIUC, the
'init_valid_mask()' (I think this is the one you are referring too)
receives a bitmap that goes from 0 ... ngpios - 1 where I would set
some bits to 0 if I that line cannot fire interrupts. This is not the
case in here since all lines exported can fire interrupts. This mapping
is something else. Users might not want to have, let's say, pins 10, 15
and 17 (device pins) as part of the keymap matrix so that they are
exported as gpios than can be, optionally, "consumed" for something
else. In this case, the mapping is:

gpio line	device pin

  0		   10
  1		   15
  2		   17

This map was already on the original driver and I don't really intend
to touch it in this series (if ever).

> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* should never happen */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_warn_ratelimited(dev, "could =
not find the hwirq for
> > gpio(%u)\n", gpio);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOENT;
> > +}
>=20
> ...
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int hwirq;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hwirq =3D adp5588_gpiomap_get_hwi=
rq(&client->dev, kpad-
> > >gpiomap,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 gpio, kpad->gc.ngpio);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (hwirq < 0) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 dev_err(&client->dev, "Could not get hwirq for
> > key(%u)\n", key_val);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> Instead of having it signed, can you use INVALID_HWIRQ definition?
>=20

Can do that...

> ...
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 irq =3D irq_find_mapping(kpad->gc=
.irq.domain, hwirq);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (irq <=3D 0)
>=20
> '<' ? How is it possible?
>=20

Well, yes... not really possible. Will change it.


> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 desc =3D irq_get_irq_data(irq);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!desc) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 dev_err(&client->dev, "Could not get irq(%u)
> > data\n", irq);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 irq_type =3D irqd_get_trigger_typ=
e(desc);
>=20
> 'desc' is quite a confusing name for IRQ chip data! Please rename (we
> have IRQ descriptor and it's not the IRQ chip data).
>=20

Yeah, make sense.

- Nuno S=C3=A1

