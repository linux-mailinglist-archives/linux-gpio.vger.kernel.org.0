Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A70701AAD8D
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 18:31:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1415449AbgDOQPB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 12:15:01 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:37329 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1415444AbgDOQOz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Apr 2020 12:14:55 -0400
Received: by mail-ot1-f66.google.com with SMTP id z17so462372oto.4;
        Wed, 15 Apr 2020 09:14:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bg5RVnsOH1/BYZ54TEf38AsDwolBNR2BfaTkytyS7Z8=;
        b=F4B8M6HbQ2CuojScGQGbPEMi7O6Y92GDwhzBstzPNUPjByMZZU2IB9TSi8z2JZcq8E
         sUBAlhTQ5QM4T/JYKdKLQVRxBZOVYCFNkjlcQ8jfAFKxWDdT58mGOU5KvLuAlUV11hBV
         b9juXpsRi9w0juGuxUzyhZk844mQEtkyWWOOTr0c4oNwEikDxnFOchyKMJqdA5d873Xo
         mfAxDMSoowL4Eb5mBW6h8PRY4Aio9/aF/zNOS0HnvfNnNCkux7VxQcTXc6HsrUN4mN1R
         0NQJjYvcXMpRt8UzshXWlrbLQDAUP3ZPj3BvJxplL0d84QaQagTJ0MzCr0QxdlxP0eWn
         Y/mw==
X-Gm-Message-State: AGi0PuY5IoSZpHMd62uZs/2WHWG7ewiacLYwo4womDHbmZQI6zSV4puG
        /GTa2LXkDhAbmxb6GHeQ/Q==
X-Google-Smtp-Source: APiQypIlx96HhaaXRfiiMSUdYVxp6kZM1e7hlq3zvdmUNi2vlLOj0GAbBkzuY8DROgSdeQjlY4JIjg==
X-Received: by 2002:a9d:5545:: with SMTP id h5mr23831959oti.323.1586967293897;
        Wed, 15 Apr 2020 09:14:53 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 13sm2701531oiq.3.2020.04.15.09.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 09:14:53 -0700 (PDT)
Received: (nullmailer pid 19968 invoked by uid 1000);
        Wed, 15 Apr 2020 16:14:52 -0000
Date:   Wed, 15 Apr 2020 11:14:51 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        broonie@kernel.org, Linus Walleij <linus.walleij@linaro.org>,
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
        Shengnan Wang =?utf-8?B?KOeOi+Wco+eUtyk=?= 
        <shengnan.wang@mediatek.com>, linux-gpio@vger.kernel.org
Subject: Re: [V6, 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
Message-ID: <20200415161451.GB4438@bogus>
References: <20191211112849.16705-1-dongchun.zhu@mediatek.com>
 <20191211112849.16705-2-dongchun.zhu@mediatek.com>
 <CAAFQd5AnWZqjQEVvw8gv7JzOBHxJvsOWaGrbY8CXQ_87ap-ahA@mail.gmail.com>
 <CAAFQd5DHL3mXZGHW+XWMXTVfekamEvaEv3bLZt4Bg2UpKPohmA@mail.gmail.com>
 <1586437408.8804.62.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586437408.8804.62.camel@mhfsdcap03>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 09, 2020 at 09:03:28PM +0800, Dongchun Zhu wrote:
> Hi Mauro, Sakari, Rob,
> 
> On Wed, 2020-04-08 at 14:49 +0200, Tomasz Figa wrote:
> > On Tue, Dec 17, 2019 at 4:15 AM Tomasz Figa <tfiga@chromium.org> wrote:
> > >
> > > Hi Rob, Dongchun,
> > >
> > > On Wed, Dec 11, 2019 at 8:29 PM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> > > >
> > > > Add DT bindings documentation for Omnivision OV02A10 image sensor.
> > > >
> > > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > ---
> > > >  .../devicetree/bindings/media/i2c/ov02a10.txt      | 54 ++++++++++++++++++++++
> > > >  MAINTAINERS                                        |  7 +++
> > > >  2 files changed, 61 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/media/i2c/ov02a10.txt b/Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> > > > new file mode 100644
> > > > index 0000000..18acc4f
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> > > > @@ -0,0 +1,54 @@
> > > > +* Omnivision OV02A10 MIPI CSI-2 sensor
> > > > +
> > > > +Required Properties:
> > > > +- compatible: shall be "ovti,ov02a10"
> > > > +- clocks: reference to the eclk input clock
> > > > +- clock-names: shall be "eclk"
> > > > +- dovdd-supply: Digital I/O voltage supply, 1.8 volts
> > > > +- avdd-supply: Analog voltage supply, 2.8 volts
> > > > +- dvdd-supply: Digital core voltage supply, 1.8 volts
> > > > +- powerdown-gpios: reference to the GPIO connected to the powerdown pin,
> > > > +                  if any. This is an active low signal to the OV02A10.
> > >
> > > On the hardware level this pin is active high, i.e. the device is
> > > powered down when the signal is high.
> > >
> > > > +- reset-gpios: reference to the GPIO connected to the reset pin, if any.
> > > > +              This is an active high signal to the OV02A10.
> > >
> > > On the hardware level this pin is active low, i.e. the device is held
> > > in reset when the signal is low.
> > >
> > > However, there is some confusion around how the polarity flag in the
> > > GPIO specifier is supposed to be used.
> > >
> > > As per [1],
> > >
> > > "The gpio-specifier's polarity flag should represent the physical
> > > level at the GPIO controller that achieves (or represents, for inputs)
> > > a logically asserted value at the device. The exact definition of
> > > logically asserted should be defined by the binding for the device."
> > >
> > > In this case it sounds like "logically asserted" means the device is
> > > powered down or held in reset, respectively, which would suggest that
> > > the specifiers should have GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW
> > > respectively. The latter would cause the GPIO subsystem to invert the
> > > values set by the consumers, which would then be confusing from the
> > > driver implementation point of view.
> > >
> > > Should the pin be renamed to "nreset"? It would change the meaning of
> > > "logically asserted" to "device is not held in reset" and so
> > > GPIO_ACTIVE_HIGH (or 0) would be the right value to use.
> > >
> > > [1] https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/gpio/gpio.txt#L83
> > 
> > + Bartosz, Linus, Sakari and the linux-gpio ML for a broader audience.
> > 
> > Would appreciate some feedback on what's the proper way of defining
> > GPIO polarity. Thanks!
> > 
> > Best regards,
> > Tomasz
> > 
> 
> I have another question about OV02A10 CMOS sensor dt-binding.
> As its text documentation was already reviewed by Rob on earlier
> version:
> https://patchwork.linuxtv.org/patch/59787/
> I wonder whether we need to convert it to DT in YAML.

Yes.

> In fact, I just submitted one conversion version.
> https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2143922
> 
> Unluckily make dt_binding_check still report errors temporarily.
> It seems there is something wrong with the port property in DT.
> Could anyone help provide some tips?
> $make dt_binding_check
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
>   SCHEMA  Documentation/devicetree/bindings/processed-schema.yaml
> Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml: ignoring,
> error in schema: properties: port: patternProperties: endpoint
> warning: no schema found in file:
> Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> make[2]: *** [Documentation/devicetree/bindings/processed-schema.yaml]
> Error 255
> make[1]: *** [dt_binding_check] Error 2
> make: *** [sub-make] Error 2

    patternProperties:
      endpoint:
      type: object
      additionalProperties: false

You need more indentation under 'endpoint'. Also, 'endpoint' is a fixed 
string, so it should be under 'properties' rather than 'patternProperties'.


> 
> In addition, as OV02A10 use one private property to distinguish
> different projects that adopting different register settings,
> I would appreciate the feedback on how to add private property to DT in
> YAML.

Like any other property. Submit something for review.

Rob
