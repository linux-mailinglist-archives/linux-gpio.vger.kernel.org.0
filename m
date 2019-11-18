Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB97910022F
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2019 11:15:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbfKRKPO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Nov 2019 05:15:14 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:38959 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbfKRKPO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Nov 2019 05:15:14 -0500
Received: by mail-oi1-f193.google.com with SMTP id v138so14794329oif.6
        for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2019 02:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tONkO/6YMzJOt8aiznrydIU/ZcI9lGyQc6MwqJrMzxc=;
        b=YcPvVBOvikiGOQURsy9tI3jr/nkJ869/omy6aXRoCfnhCoMhPn1o8P+291G+XehKQC
         pDT7IIGNNdmSTEY6mWazFlfvPEEYSmz2PPi1MExhAnSc3STM5ZoDPMmBQVIF8uF5aeTI
         ADwKSbTbdJtTompjsvItCN3/lt5ncz1C2+T6eoHHVpNdzMbAfdhBtIP2QAepmmnmCIir
         aPtIKn7UfyMs/bvbobz4s3Lq9H+SHTaVm8xvcwCq/EeuNOIEzqvDjjRlp1ntppj2hKZc
         JuSODOmPJXDJWpH0sgc6nbbbZom7LSHs4d+P27+53culoDX27541mNNoCkKhVNTcbVey
         WlMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tONkO/6YMzJOt8aiznrydIU/ZcI9lGyQc6MwqJrMzxc=;
        b=oz0NyJ/dWtv9wyTV76Fd3OX16owYtHn8dwPwbQjw25AqXdXYlW8tlE1jwaviMizkQ+
         A1hZLvBS/3TjVf4J+ZPB8nmq96Kg1PobR3n/tuo75Md7alN6CS6mjz7oO/8T7mznml0c
         hFJOIJFI12Qs771FmYoFSKXuDAWFa9OD42dRyix0tZfAmwxJxq8WNpw0NgzGyDHJdbcd
         x0vW9IQNuyVshYVSta2ARcjvG7y9vTa7PcoscLmWggnWbmhGXSkPTExNMXbtFqCdOBnE
         yARDzyEgLPTX+x7A7ciSUAeOoIkz1J19Myy6k2yBk7CE2ajRk3R9kbd///DMQkmXTp44
         BhHg==
X-Gm-Message-State: APjAAAWV7r3VoerUjMxiwLh/1FO86c9LbOTMbjMBti2YT2fBEofYaboS
        FsbIr6ZgffwvAEVIw/Z4uNPXSy+D79h3bEXKLXCF3A==
X-Google-Smtp-Source: APXvYqziykcLRuw/aYXL+prNr+7LzJN2LtOQs3Yll15tPMmVUWaMlygbY4DBkRQRMCACl8yhuYbwinIWhF2JPDRTjZQ=
X-Received: by 2002:aca:d904:: with SMTP id q4mr19738694oig.21.1574072112940;
 Mon, 18 Nov 2019 02:15:12 -0800 (PST)
MIME-Version: 1.0
References: <1573560684-48104-1-git-send-email-yash.shah@sifive.com>
 <1573560684-48104-4-git-send-email-yash.shah@sifive.com> <CAMpxmJWcuV7goPWxOWv_Og9GwzGrioF62SfS1LCiHf9eDX=vdw@mail.gmail.com>
 <CH2PR13MB33680443C101511E66ECADF08C4D0@CH2PR13MB3368.namprd13.prod.outlook.com>
In-Reply-To: <CH2PR13MB33680443C101511E66ECADF08C4D0@CH2PR13MB3368.namprd13.prod.outlook.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 18 Nov 2019 11:15:01 +0100
Message-ID: <CAMpxmJU+P=nWe9fpp45Jw=GwX3+V0sVVshRcE7AD1Kyz_F0qJQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] gpio: sifive: Add GPIO driver for SiFive SoCs
To:     Yash Shah <yash.shah@sifive.com>
Cc:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "Paul Walmsley ( Sifive)" <paul.walmsley@sifive.com>,
        "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "jason@lakedaemon.net" <jason@lakedaemon.net>,
        "maz@kernel.org" <maz@kernel.org>,
        "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>,
        "atish.patra@wdc.com" <atish.patra@wdc.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sachin Ghadi <sachin.ghadi@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 18 lis 2019 o 11:03 Yash Shah <yash.shah@sifive.com> napisa=C5=82(a):
>
> > -----Original Message-----
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > Sent: 13 November 2019 18:41
> > To: Yash Shah <yash.shah@sifive.com>
> > Cc: linus.walleij@linaro.org; robh+dt@kernel.org; mark.rutland@arm.com;
> > palmer@dabbelt.com; Paul Walmsley ( Sifive) <paul.walmsley@sifive.com>;
> > aou@eecs.berkeley.edu; tglx@linutronix.de; jason@lakedaemon.net;
> > maz@kernel.org; bmeng.cn@gmail.com; atish.patra@wdc.com; Sagar Kadam
> > <sagar.kadam@sifive.com>; linux-gpio@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-riscv@lists.infradead.org; linux-
> > kernel@vger.kernel.org; Sachin Ghadi <sachin.ghadi@sifive.com>
> > Subject: Re: [PATCH 3/4] gpio: sifive: Add GPIO driver for SiFive SoCs
> >
> > wt., 12 lis 2019 o 13:12 Yash Shah <yash.shah@sifive.com> napisa=C5=82(=
a):
> > >
> > > Adds the GPIO driver for SiFive RISC-V SoCs.
> > >
> > > Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
> > > [Atish: Various fixes and code cleanup]
> > > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > > Signed-off-by: Yash Shah <yash.shah@sifive.com>
>
> [...]
>
> > > +
> > > +static int sifive_gpio_probe(struct platform_device *pdev) {
> > > +       struct device *dev =3D &pdev->dev;
> > > +       struct device_node *node =3D pdev->dev.of_node;
> > > +       struct device_node *irq_parent;
> > > +       struct irq_domain *parent;
> > > +       struct gpio_irq_chip *girq;
> > > +       struct sifive_gpio *chip;
> > > +       struct resource *res;
> > > +       int ret, ngpio;
> > > +
> > > +       chip =3D devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
> > > +       if (!chip)
> > > +               return -ENOMEM;
> > > +
> > > +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > +       chip->base =3D devm_ioremap_resource(dev, res);
> >
> > Use devm_platform_ioremap_resource() and drop the res variable.
> >
>
> Sure, will do that.
>
> > > +       if (IS_ERR(chip->base)) {
> > > +               dev_err(dev, "failed to allocate device memory\n");
> > > +               return PTR_ERR(chip->base);
> > > +       }
> > > +
> > > +       chip->regs =3D devm_regmap_init_mmio(dev, chip->base,
> > > +
> > > + &sifive_gpio_regmap_config);
> >
> > Why do you need this regmap here? You initialize a new regmap, then use
> > your own locking despite not having disabled the internal locking in re=
gmap,
> > and then you initialize the mmio generic GPIO code which will use yet
> > another lock to operate on the same registers and in the end you write =
to
> > those registers without taking any lock anyway.
> > Doesn't make much sense to me.
> >
>
> As suggested in the comments received on the RFC version of this patch[0]=
, I am trying to use regmap MMIO by looking at gpio-mvebu.c. I got your poi=
nt regarding the usage of own locks is not making any sense.
> Here is what I will do in v2:
> 1. drop the usage of own locks
> 2. consistently use regmap_* apis for register access (replace all iowrit=
es).
> Does this make sense now?

The thing is: the gpio-mmio code you're (correctly) reusing uses a
different lock - namely: bgpio_lock in struct gpio_chip. If you want
to use regmap for register operations, then you need to set
disable_locking in regmap_config to true and then take this lock
manually on every access.

Bart

>
> > > +       if (IS_ERR(chip->regs))
> > > +               return PTR_ERR(chip->regs);
> > > +
>
> [...]
>
> > > +
> > > +       ret =3D gpiochip_add_data(&chip->gc, chip);
> > > +       if (ret)
> > > +               return ret;
> > > +
> > > +       platform_set_drvdata(pdev, chip);
> > > +       dev_info(dev, "SiFive GPIO chip registered %d GPIOs\n",
> > > + ngpio);
> >
> > Core gpio library emits a very similar debug message from
> > gpiochip_setup_dev(), I think you can drop it and directly return
> > gpiochip_add_data().
> >
> > Bartosz
>
> Ok. Will directly return gpiochip_add_data().
> Thanks for your comments!
>
> - Yash
>
> [0] https://lore.kernel.org/linux-riscv/20181010123519.RVexDppaPFpIWl7QU_=
hpP8tc5qqWPJgeuLYn0FaGbeQ@z/
