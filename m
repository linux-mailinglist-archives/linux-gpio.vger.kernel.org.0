Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10BC22D29F3
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 12:49:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728996AbgLHLta (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 06:49:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725803AbgLHLta (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2020 06:49:30 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 979F2C061749;
        Tue,  8 Dec 2020 03:48:44 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id h19so15572876otr.1;
        Tue, 08 Dec 2020 03:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5v6FBOoeRegHo5vDnA4XzRI57kyJzIqb3d2KbkiTU0E=;
        b=jNEjZYbiQ9JZkbHyANWh3ExdBRhzNwubMCx9nhTpdU2FREpqIoAt7RWqZmgMF0uhUf
         9jM0GgskjhBc/PyyVV9dIm79thYaYpMGiT2LPrXMHx9ub09rl4iElFRxz7Tmri2dbFOz
         0kD9tjQqshJDarxIRqs+KtTDAVL9epRkD/gGJG6XdMDTUFgWyxBYLqQvSLcW/E/KQvIN
         /WKf4gPwj1071msu6Zl4lhDg8Pm1orM/bQueXzey8IprI+cWmbNGYgHxtuCcJ+S5mie0
         smFFe3NQl17BeTqX8VsGfsDTuIT0mUuecd1KboaLc7QDGHK7kaTFQSDPLJMIpqXtiOFL
         evgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5v6FBOoeRegHo5vDnA4XzRI57kyJzIqb3d2KbkiTU0E=;
        b=f5ApYbBrurJm1kuBL2ra83DDGYE6xi3KYd7vBMq6LFX0POdxwBZq5PbFCRhjWi3J0E
         i8WF4oTln2vfsmbIik2cjeNAa/diYDjYwBOVckHdW0xdJbp2E64mylWycoty7KiE7KfD
         1fnrRdRCdfhEHJ9A9vzIbvkcb10fryXhO900T1SKfJnaLRqWA+LiEQrxnyQQPg1+M7vI
         JCxxYujHBUq6nHVwWxqiWTYHuQ+E6RupNSF5OFlPEAhBV5JUZsb7gPgEK6st+LKAC9Eu
         UqJQgDu/egskKgj8k7f/fvNTd0PwVmAqiAEtjr5QuRXc8pizLG41tWmDswIhFfuIHhQ4
         Hj1Q==
X-Gm-Message-State: AOAM533MkqBIhtaLUbEGU7tEsDpMx65bfag7Fv854vJwuwhHfR2FYTWm
        MQQ7xACwQvwpMtnRfO9TNsO/6Qh1+69JUphRpro=
X-Google-Smtp-Source: ABdhPJxAkFSI++SUxwvg9+vbDD+oTrbrz0lLiYN37nU9MCnvo8BUBdG5qFbO11ZYhrmO/AuTYL7p+MicUL/uUct6tME=
X-Received: by 2002:a9d:589:: with SMTP id 9mr16646748otd.72.1607428123796;
 Tue, 08 Dec 2020 03:48:43 -0800 (PST)
MIME-Version: 1.0
References: <20201207192104.6046-1-sergio.paracuellos@gmail.com>
 <20201207192104.6046-3-sergio.paracuellos@gmail.com> <20201208101728.GZ2767@kadam>
In-Reply-To: <20201208101728.GZ2767@kadam>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Tue, 8 Dec 2020 12:48:32 +0100
Message-ID: <CAMhs-H8G0A54J6csPLSuxs2Q-3vZQt363cZdui2SeJK4C2Yajw@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: ralink: add a pinctrl driver for the rt2880 family
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Jason Yan <yanaijie@huawei.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Dan,

Thanks for the review.

On Tue, Dec 8, 2020 at 11:17 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Mon, Dec 07, 2020 at 08:21:03PM +0100, Sergio Paracuellos wrote:
> > +static struct pinctrl_desc rt2880_pctrl_desc = {
> > +     .owner          = THIS_MODULE,
> > +     .name           = "rt2880-pinmux",
> > +     .pctlops        = &rt2880_pctrl_ops,
> > +     .pmxops         = &rt2880_pmx_group_ops,
> > +};
> > +
> > +static struct rt2880_pmx_func gpio_func = {
> > +     .name = "gpio",
> > +};
> > +
> > +static int rt2880_pinmux_index(struct rt2880_priv *p)
>
>
> This function name is not great.  I assumed that it would return the
> index.
>
> > +{
> > +     struct rt2880_pmx_func **f;
>
> Get rid of this "f" variable and use "p->func" instead.
>
> > +     struct rt2880_pmx_group *mux = p->groups;
> > +     int i, j, c = 0;
> > +
> > +     /* count the mux functions */
> > +     while (mux->name) {
> > +             p->group_count++;
> > +             mux++;
> > +     }
> > +
> > +     /* allocate the group names array needed by the gpio function */
> > +     p->group_names = devm_kcalloc(p->dev, p->group_count,
> > +                                   sizeof(char *), GFP_KERNEL);
> > +     if (!p->group_names)
> > +             return -1;
>
> Return proper error codes in this function.  s/-1/-ENOMEM/
>
> > +
> > +     for (i = 0; i < p->group_count; i++) {
> > +             p->group_names[i] = p->groups[i].name;
> > +             p->func_count += p->groups[i].func_count;
> > +     }
> > +
> > +     /* we have a dummy function[0] for gpio */
> > +     p->func_count++;
> > +
> > +     /* allocate our function and group mapping index buffers */
> > +     f = p->func = devm_kcalloc(p->dev,
> > +                                p->func_count,
> > +                                sizeof(*p->func),
> > +                                GFP_KERNEL);
> > +     gpio_func.groups = devm_kcalloc(p->dev, p->group_count, sizeof(int),
> > +                                     GFP_KERNEL);
> > +     if (!f || !gpio_func.groups)
> > +             return -1;
> > +
> > +     /* add a backpointer to the function so it knows its group */
> > +     gpio_func.group_count = p->group_count;
> > +     for (i = 0; i < gpio_func.group_count; i++)
> > +             gpio_func.groups[i] = i;
> > +
> > +     f[c] = &gpio_func;
> > +     c++;
> > +
> > +     /* add remaining functions */
> > +     for (i = 0; i < p->group_count; i++) {
> > +             for (j = 0; j < p->groups[i].func_count; j++) {
> > +                     f[c] = &p->groups[i].func[j];
> > +                     f[c]->groups = devm_kzalloc(p->dev, sizeof(int),
> > +                                                 GFP_KERNEL);
>
> Add a NULL check.
>
> > +                     f[c]->groups[0] = i;
> > +                     f[c]->group_count = 1;
> > +                     c++;
> > +             }
> > +     }
> > +     return 0;
> > +}
> > +
> > +static int rt2880_pinmux_pins(struct rt2880_priv *p)
> > +{
> > +     int i, j;
> > +
> > +     /*
> > +      * loop over the functions and initialize the pins array.
> > +      * also work out the highest pin used.
> > +      */
> > +     for (i = 0; i < p->func_count; i++) {
> > +             int pin;
> > +
> > +             if (!p->func[i]->pin_count)
> > +                     continue;
> > +
> > +             p->func[i]->pins = devm_kcalloc(p->dev,
> > +                                             p->func[i]->pin_count,
> > +                                             sizeof(int),
> > +                                             GFP_KERNEL);
>
> This can fit on two lines.
>
>                 p->func[i]->pins = devm_kcalloc(p->dev, p->func[i]->pin_count,
>                                                 sizeof(int), GFP_KERNEL);
>
> > +             for (j = 0; j < p->func[i]->pin_count; j++)
> > +                     p->func[i]->pins[j] = p->func[i]->pin_first + j;
> > +
> > +             pin = p->func[i]->pin_first + p->func[i]->pin_count;
> > +             if (pin > p->max_pins)
> > +                     p->max_pins = pin;
> > +     }
> > +
> > +     /* the buffer that tells us which pins are gpio */
> > +     p->gpio = devm_kcalloc(p->dev, p->max_pins, sizeof(u8), GFP_KERNEL);
> > +     /* the pads needed to tell pinctrl about our pins */
> > +     p->pads = devm_kcalloc(p->dev, p->max_pins,
> > +                            sizeof(struct pinctrl_pin_desc), GFP_KERNEL);
> > +     if (!p->pads || !p->gpio) {
> > +             dev_err(p->dev, "Failed to allocate gpio data\n");
>
> Delete this error message.  #checkpatch.pl
>
> > +             return -ENOMEM;
> > +     }
> > +
> > +     memset(p->gpio, 1, sizeof(u8) * p->max_pins);
> > +     for (i = 0; i < p->func_count; i++) {
> > +             if (!p->func[i]->pin_count)
> > +                     continue;
> > +
> > +             for (j = 0; j < p->func[i]->pin_count; j++)
> > +                     p->gpio[p->func[i]->pins[j]] = 0;
> > +     }
> > +
> > +     /* pin 0 is always a gpio */
> > +     p->gpio[0] = 1;
> > +
> > +     /* set the pads */
> > +     for (i = 0; i < p->max_pins; i++) {
> > +             /* strlen("ioXY") + 1 = 5 */
> > +             char *name = devm_kzalloc(p->dev, 5, GFP_KERNEL);
> > +
>
>                 char *name;
>
>                 name = kasprintf(GFP_KERNEL, "io%d", i);
>
>
> > +             if (!name)
> > +                     return -ENOMEM;
> > +             snprintf(name, 5, "io%d", i);
> > +             p->pads[i].number = i;
> > +             p->pads[i].name = name;
> > +     }
> > +     p->desc->pins = p->pads;
> > +     p->desc->npins = p->max_pins;
> > +
> > +     return 0;
> > +}
> > +
> > +static int rt2880_pinmux_probe(struct platform_device *pdev)
> > +{
> > +     struct rt2880_priv *p;
> > +     struct pinctrl_dev *dev;
> > +
> > +     if (!rt2880_pinmux_data)
> > +             return -ENOTSUPP;
> > +
> > +     /* setup the private data */
> > +     p = devm_kzalloc(&pdev->dev, sizeof(struct rt2880_priv), GFP_KERNEL);
> > +     if (!p)
> > +             return -ENOMEM;
> > +
> > +     p->dev = &pdev->dev;
> > +     p->desc = &rt2880_pctrl_desc;
> > +     p->groups = rt2880_pinmux_data;
> > +     platform_set_drvdata(pdev, p);
> > +
> > +     /* init the device */
> > +     if (rt2880_pinmux_index(p)) {
> > +             dev_err(&pdev->dev, "failed to load index\n");
> > +             return -EINVAL;
>
> Preserve the error code:
>
>         err = rt2880_pinmux_index(p);
>         if (err) {
>                 dev_err(&pdev->dev, "failed to load index\n");
>                 return err;
>         }
>
>
> > +     }
> > +     if (rt2880_pinmux_pins(p)) {
> > +             dev_err(&pdev->dev, "failed to load pins\n");
> > +             return -EINVAL;
>
> Same.
>
> > +     }
> > +     dev = pinctrl_register(p->desc, &pdev->dev, p);
> > +     if (IS_ERR(dev))
> > +             return PTR_ERR(dev);
> > +
> > +     return 0;
> > +}

This is already applied but needs more work in its correct place
afterwards. So I will take into account all of these comments and will
send patches to properly address all of them.

>
> regards,
> dan carpenter

Thanks again.

Best regards,
   Sergio Paracuellos
