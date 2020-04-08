Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27EC21A224E
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Apr 2020 14:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728005AbgDHMtV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Apr 2020 08:49:21 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:33953 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727077AbgDHMtV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Apr 2020 08:49:21 -0400
Received: by mail-ed1-f65.google.com with SMTP id o1so8451298edv.1
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2020 05:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ImZqh6xFyWTP+hCLRseUGFfjvuATFwSzoN2jRckYzSk=;
        b=iuHWZKg+pIWEBlsACAQ4YXH2mS3QrCGDdCd463hpF4FaNiGuk9aFm0zDBV3zdeafgR
         3ZnImtuZ+wyMDDvmkR249YelH0aLXKbisp8ztrr4A0fBNyuZV+ObuE3T8OiMRRi340IU
         wd7vqFZZ9kxtDpuz9bj10oUv10rucFw5JlYIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ImZqh6xFyWTP+hCLRseUGFfjvuATFwSzoN2jRckYzSk=;
        b=Gkdq8bg9671+MiG1dD8rMQp5H/6GWxdI70UrX3G6MW6lNFmPFboabni7i7Buepuyem
         Pd5LeotJaxcrr9QGMEAJ6R6HTBpYJIWpvd1uJmbzZxfzKX6pYC6m6lxWiNiX1lTddG9K
         x0HT2aiOTWvOri5CunF73DgtLeVY/QAYIUnNU/6tFaTr7rLlzQfBrHJeU96KSyalcUxL
         rXQcZ4PFrySjx/djEAicUsPQ2Cct2cnaFFgrGBphYYa4bf5PS80hFnWd1yRCGWqA/ae9
         Qzle1A01V1S5uBzmYOPPhyeIpNhlWOM4xGdFsnkLEARq2vdU3liw4lryT0Shjql/xfsg
         Dp9g==
X-Gm-Message-State: AGi0PubqlpjKgtvyrmQURxuXcWqebWIrsjDvyd6LSO8FOaU4wcdn9YrE
        QtaA3Ge2bVq5sYoY3XeO/lkpOySJUTzZ2g==
X-Google-Smtp-Source: APiQypIaZRDiM57vLMN1oeMjViGn+YDVh/YISAf48t1eTh6aEPmXLnuL7TjL9TxmB200wi4DbGCt0g==
X-Received: by 2002:a17:906:8257:: with SMTP id f23mr480769ejx.196.1586350157158;
        Wed, 08 Apr 2020 05:49:17 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id h14sm3523375ejt.1.2020.04.08.05.49.16
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2020 05:49:16 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id r26so5318411wmh.0
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2020 05:49:16 -0700 (PDT)
X-Received: by 2002:a7b:c38b:: with SMTP id s11mr4529806wmj.55.1586350155398;
 Wed, 08 Apr 2020 05:49:15 -0700 (PDT)
MIME-Version: 1.0
References: <20191211112849.16705-1-dongchun.zhu@mediatek.com>
 <20191211112849.16705-2-dongchun.zhu@mediatek.com> <CAAFQd5AnWZqjQEVvw8gv7JzOBHxJvsOWaGrbY8CXQ_87ap-ahA@mail.gmail.com>
In-Reply-To: <CAAFQd5AnWZqjQEVvw8gv7JzOBHxJvsOWaGrbY8CXQ_87ap-ahA@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 8 Apr 2020 14:49:04 +0200
X-Gmail-Original-Message-ID: <CAAFQd5DHL3mXZGHW+XWMXTVfekamEvaEv3bLZt4Bg2UpKPohmA@mail.gmail.com>
Message-ID: <CAAFQd5DHL3mXZGHW+XWMXTVfekamEvaEv3bLZt4Bg2UpKPohmA@mail.gmail.com>
Subject: Re: [V6, 1/2] media: dt-bindings: media: i2c: Document OV02A10 bindings
To:     Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Cao Bing Bu <bingbu.cao@intel.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Sj Huang <sj.huang@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Louis Kuo <louis.kuo@mediatek.com>,
        =?UTF-8?B?U2hlbmduYW4gV2FuZyAo546L5Zyj55S3KQ==?= 
        <shengnan.wang@mediatek.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 17, 2019 at 4:15 AM Tomasz Figa <tfiga@chromium.org> wrote:
>
> Hi Rob, Dongchun,
>
> On Wed, Dec 11, 2019 at 8:29 PM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> >
> > Add DT bindings documentation for Omnivision OV02A10 image sensor.
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > ---
> >  .../devicetree/bindings/media/i2c/ov02a10.txt      | 54 ++++++++++++++++++++++
> >  MAINTAINERS                                        |  7 +++
> >  2 files changed, 61 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ov02a10.txt b/Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> > new file mode 100644
> > index 0000000..18acc4f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> > @@ -0,0 +1,54 @@
> > +* Omnivision OV02A10 MIPI CSI-2 sensor
> > +
> > +Required Properties:
> > +- compatible: shall be "ovti,ov02a10"
> > +- clocks: reference to the eclk input clock
> > +- clock-names: shall be "eclk"
> > +- dovdd-supply: Digital I/O voltage supply, 1.8 volts
> > +- avdd-supply: Analog voltage supply, 2.8 volts
> > +- dvdd-supply: Digital core voltage supply, 1.8 volts
> > +- powerdown-gpios: reference to the GPIO connected to the powerdown pin,
> > +                  if any. This is an active low signal to the OV02A10.
>
> On the hardware level this pin is active high, i.e. the device is
> powered down when the signal is high.
>
> > +- reset-gpios: reference to the GPIO connected to the reset pin, if any.
> > +              This is an active high signal to the OV02A10.
>
> On the hardware level this pin is active low, i.e. the device is held
> in reset when the signal is low.
>
> However, there is some confusion around how the polarity flag in the
> GPIO specifier is supposed to be used.
>
> As per [1],
>
> "The gpio-specifier's polarity flag should represent the physical
> level at the GPIO controller that achieves (or represents, for inputs)
> a logically asserted value at the device. The exact definition of
> logically asserted should be defined by the binding for the device."
>
> In this case it sounds like "logically asserted" means the device is
> powered down or held in reset, respectively, which would suggest that
> the specifiers should have GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW
> respectively. The latter would cause the GPIO subsystem to invert the
> values set by the consumers, which would then be confusing from the
> driver implementation point of view.
>
> Should the pin be renamed to "nreset"? It would change the meaning of
> "logically asserted" to "device is not held in reset" and so
> GPIO_ACTIVE_HIGH (or 0) would be the right value to use.
>
> [1] https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/gpio/gpio.txt#L83

+ Bartosz, Linus, Sakari and the linux-gpio ML for a broader audience.

Would appreciate some feedback on what's the proper way of defining
GPIO polarity. Thanks!

Best regards,
Tomasz

>
> Best regards,
> Tomasz
>
> > +
> > +Optional Properties:
> > +- rotation: as defined in
> > +           Documentation/devicetree/bindings/media/video-interfaces.txt,
> > +           valid values are 0 (sensor mounted upright) and 180 (sensor
> > +           mounted upside down).
> > +
> > +The device node shall contain one 'port' child node with an
> > +'endpoint' subnode for its digital output video port,
> > +in accordance with the video interface bindings defined in
> > +Documentation/devicetree/bindings/media/video-interfaces.txt.
> > +
> > +Example:
> > +&i2c4 {
> > +       ov02a10: camera-sensor@3d {
> > +               compatible = "ovti,ov02a10";
> > +               reg = <0x3d>;
> > +               pinctrl-names = "default";
> > +               pinctrl-0 = <&camera_pins_cam1_mclk_on>;
> > +
> > +               clocks = <&topckgen CLK_TOP_MUX_CAMTG2>,
> > +                       <&topckgen CLK_TOP_UNIVP_192M_D8>;
> > +               clock-names = "eclk", "freq_mux";
> > +               clock-frequency = <24000000>;
> > +
> > +               dovdd-supply = <&mt6358_vcamio_reg>;
> > +               avdd-supply = <&mt6358_vcama1_reg>;
> > +               dvdd-supply = <&mt6358_vcn18_reg>;
> > +               powerdown-gpios = <&pio 107 GPIO_ACTIVE_LOW>;
> > +               reset-gpios = <&pio 109 GPIO_ACTIVE_HIGH>;
> > +               rotation = <180>;
> > +
> > +               port {
> > +                       /* MIPI CSI-2 bus endpoint */
> > +                       ov02a10_core: endpoint {
> > +                               remote-endpoint = <&ov02a10_0>;
> > +                               link-frequencies = /bits/ 64 <390000000>;
> > +                       };
> > +               };
> > +       };
> > +};
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index bd5847e..92a868c 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -12130,6 +12130,13 @@ T:     git git://linuxtv.org/media_tree.git
> >  S:     Maintained
> >  F:     drivers/media/i2c/ov13858.c
> >
> > +OMNIVISION OV02A10 SENSOR DRIVER
> > +M:     Dongchun Zhu <dongchun.zhu@mediatek.com>
> > +L:     linux-media@vger.kernel.org
> > +T:     git git://linuxtv.org/media_tree.git
> > +S:     Maintained
> > +F:     Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> > +
> >  OMNIVISION OV2680 SENSOR DRIVER
> >  M:     Rui Miguel Silva <rmfrfs@gmail.com>
> >  L:     linux-media@vger.kernel.org
> > --
> > 2.9.2
