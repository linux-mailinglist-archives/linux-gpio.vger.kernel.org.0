Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 869BE44CFD4
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Nov 2021 03:11:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234464AbhKKCMj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Nov 2021 21:12:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234434AbhKKCMW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Nov 2021 21:12:22 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EB28C06122D
        for <linux-gpio@vger.kernel.org>; Wed, 10 Nov 2021 18:08:18 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id b15so17901602edd.7
        for <linux-gpio@vger.kernel.org>; Wed, 10 Nov 2021 18:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x2f7mNHFGCNYaSYUTYmGvh1vF4I+NlTW7cZ0xXVFvLk=;
        b=R4e4rH97jtwiKe8JCRSPD7urIB71/MDTR7HT4WFDvsXO8IrUI4+548uXNHI9ID3lZu
         ctRbmW192o3CLs0qNxFTxBCye9EBSZkH+6BcdqEU6rVxRlFYKy040LsrwY9U2/e3N9jk
         g/4+qNNO3jPTFBzaQHv+vSZJo6HD1LXmlOdccw3xhoNNOq0Wx3YUYcQOgtpjf2QssKqf
         Ka0cbFDu8beL9hediOtMJ61ifIeAMkFmCOuTBo4KFiMKHUb/xX8WuLw/E1xpveb816UN
         Rf52hxvUYnbd0Oz9Zd1+EL7Mx4InKcoZh16Uy1SpFRE+cL0hPTYM5mCzX1zqW56R1I3Z
         6Z+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x2f7mNHFGCNYaSYUTYmGvh1vF4I+NlTW7cZ0xXVFvLk=;
        b=g159NZjRowTsJBH45uAzy0+Gp0sxW5aIXftgLMDkQM4nzq/NX/tXY/GAVnpGR8Fjn1
         fWULeIF7+Mr+Q2n/Y5a+QuRvKwdlkwiOEuxEocQA3RUzFA7On0CKiXn2MvamUR+H/HpN
         7JiVNVArRIQfQu1tyuV4AmaB70WvKNNKz85A4hZGE+cyI2uxgas64bvoJXiVSXiUDG1Y
         co7bNnqj41UdShEQ2zsGq06VszyjDluvQfNwdPGYaVEkr/tuUtgJrDcULRHP6lDnhWBa
         aDIhafcsuRGyrQR+Lvo2AIU4h0iNwBgLZamvnOi3yrBgL0L0xaovPBckaLwik8UQfNc4
         tPPA==
X-Gm-Message-State: AOAM532JcxFsEF0G2vk0mJQSSwFCrENy7i7jyXe5dDQuU60UKjXl7Cwd
        ipKfKjwruUMwEiaT5mtGwoBMPqY7o5d5qtcSrqZkNw==
X-Google-Smtp-Source: ABdhPJwJ+V96RLd1FGOaO5sgF7EbrYmQoVDLbepCA1fvbEiabgxL8IStUtFtpIgbWCwxk9FiIehcIWd/3jwLCeXjOIk=
X-Received: by 2002:a17:906:1451:: with SMTP id q17mr4784534ejc.36.1636596496906;
 Wed, 10 Nov 2021 18:08:16 -0800 (PST)
MIME-Version: 1.0
References: <20211025015156.33133-1-brad@pensando.io> <20211025015156.33133-12-brad@pensando.io>
 <YXnGkjXMmLdFHEIF@robh.at.kernel.org>
In-Reply-To: <YXnGkjXMmLdFHEIF@robh.at.kernel.org>
From:   Brad Larson <brad@pensando.io>
Date:   Wed, 10 Nov 2021 18:08:05 -0800
Message-ID: <CAK9rFnzRF_Tv-DRO3SvrcZz7PmzPQOGJLS6f_ZBJPR4QbjG-Dw@mail.gmail.com>
Subject: Re: [PATCH v3 11/11] arm64: dts: Add Pensando Elba SoC support
To:     Rob Herring <robh@kernel.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Brown <broonie@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Olof Johansson <olof@lixom.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob,

On Wed, Oct 27, 2021 at 2:37 PM Rob Herring <robh@kernel.org> wrote:
>
> > +always-y     := $(dtb-y)
> > +subdir-y     := $(dts-dirs)
> > +clean-files  := *.dtb
>
> None of these lines should be needed.

Yes, these will be removed.

> > diff --git a/arch/arm64/boot/dts/pensando/elba-16core.dtsi b/arch/arm64/boot/dts/pensando/elba-16core.dtsi
> > new file mode 100644
> > index 000000000000..acf5941afbc1
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/pensando/elba-16core.dtsi
> > @@ -0,0 +1,192 @@
> > +// SPDX-License-Identifier: GPL-2.0
>
> Do you care about using with non-GPL OS? Dual license is preferred.
>
Dual is fine, changing to this:
SPDX-License-Identifier: (GPL-2.0+ OR MIT)

> > +             psci {
>
> This goes at the root level.
>
Moving to the root level

> > +                     compatible = "arm,psci-0.2";
> > +                     method = "smc";
> > +             };
> > +
> > +     };
> > +};
> > diff --git a/arch/arm64/boot/dts/pensando/elba-asic-common.dtsi b/arch/arm64/boot/dts/pensando/elba-asic-common.dtsi
> > +
> > +&spi0 {
> > +     num-cs = <4>;
> > +     cs-gpios = <0>, <0>, <&porta 1 GPIO_ACTIVE_LOW>,
> > +                <&porta 7 GPIO_ACTIVE_LOW>;
> > +     status = "okay";
> > +     spi0_cs0@0 {
>
> Node names should reflect the class of device and use standard name
> defined in the DT spec. This probably doesn't have one. 'lora' perhaps?
>
Right, I didn't see a standard name and found many approaches in other files
so I likely based off of one of these below.   I searched the dts
files for 'lora' and
didn't find it.  Is that an acronym?  I can change it to what the preference is.

./microchip/sparx5_pcb134_board.dtsi:
&spi0 {
   status = "okay";
   spi@0 {
           compatible = "spi-mux";
           ...
};

./rockchip/rk3399.dtsi:
spi5 {
        spi5_clk: spi5-clk {
                rockchip,pins =
                        <2 RK_PC6 2 &pcfg_pull_up>;
        };
        spi5_cs0: spi5-cs0 {
                rockchip,pins =
                        <2 RK_PC7 2 &pcfg_pull_up>;
        };
        spi5_rx: spi5-rx {
                rockchip,pins =
                        <2 RK_PC4 2 &pcfg_pull_up>;
        };
        spi5_tx: spi5-tx {
                rockchip,pins =
                        <2 RK_PC5 2 &pcfg_pull_up>;
        };
};

>
> > +             compatible = "semtech,sx1301";  /* Enable spidev */
>
> What's spidev?
>
It's module drivers/spi/spidev.c which won't populate /dev/spidevB.C unless
there is a match which we need for the system to boot.  An earlier patch added
to the compatible list below and the feedback on that was to remove it.  Later I
noticed the compatible list expanded...

static const struct of_device_id spidev_dt_ids[] = {
        { .compatible = "rohm,dh2228fv" },
        { .compatible = "lineartechnology,ltc2488" },
        { .compatible = "semtech,sx1301" },
        { .compatible = "lwn,bk4" },
        { .compatible = "dh,dhcom-board" },
        { .compatible = "menlo,m53cpld" },
        { .compatible = "cisco,spi-petra" },
        { .compatible = "micron,spi-authenta" },
        {},
};

> > +             #address-cells = <1>;
> > +             #size-cells = <1>;
> > +             spi-max-frequency = <12000000>;
> > +             reg = <0>;
> > +     };
> > +
> > +     spi0_cs1@1 {
> > +             compatible = "semtech,sx1301";
> > +             #address-cells = <1>;
> > +             #size-cells = <1>;
> > +             spi-max-frequency = <12000000>;
> > +             reg = <1>;
> > +     };
> > +
> > +     spi0_cs2@2 {
> > +             compatible = "semtech,sx1301";
> > +             #address-cells = <1>;
> > +             #size-cells = <1>;
> > +             spi-max-frequency = <12000000>;
> > +             reg = <2>;
> > +             interrupt-parent = <&porta>;
> > +             interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> > +     };
> > +
> > +     spi0_cs3@3 {
> > +             compatible = "semtech,sx1301";
> > +             #address-cells = <1>;
> > +             #size-cells = <1>;
> > +             spi-max-frequency = <12000000>;
> > +             reg = <3>;
> > +     };
> > +};
> > diff --git a/arch/arm64/boot/dts/pensando/elba-asic.dts b/arch/arm64/boot/dts/pensando/elba-asic.dts
> > new file mode 100644
> > index 000000000000..131931dc643f
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/pensando/elba-asic.dts
> > @@ -0,0 +1,23 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +/dts-v1/;
> > +
> > +/ {
> > +     model = "Elba ASIC Board";
> > +     compatible = "pensando,elba";
>
> Normally we have a compatible for the board plus the soc compatible.

In this case there are currently five different boards/products that have no
variations needing a board level description.

Thanks,
Brad
