Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E5371A6669
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2020 14:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729522AbgDMMoo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Apr 2020 08:44:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727797AbgDMMon (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 13 Apr 2020 08:44:43 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F20A5C0A3BE2;
        Mon, 13 Apr 2020 05:38:43 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id a81so9735858wmf.5;
        Mon, 13 Apr 2020 05:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=B3G3up+sacqGwrkeNRbiAPfpytPVgXOCXw+62EiaExE=;
        b=YDHHb9AWyoAkrefNdSOprNxlVoZH1mvo3GKu65RWs/01H8iAXcjWyyYMMqZGpUbbcA
         5psi/m9ze5mzyjEhPMD5Q3wBdaWVjPxwFCgdL/gFvLmBYFdRAuod0cXaXhUM7rLBBYw8
         W7J97Rma94EbonmB2BOzE9ufv6K4qteNE6PBz1+n3fYtIMDoensPf6fhMN/hdyojIjWK
         qWXxbfYVUlLIAOAE1mjlRwECSCIIY5Sk6WfZ7N1TULQ2IfCtFx1kVCRETSOh2F1tcxWC
         LuBepG8PRQExNgd46BAzrOz/mrG/NarelR4jzZ7v4D5Zs+UZkIHb9NtTQLTcxOT9iv5C
         rSOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=B3G3up+sacqGwrkeNRbiAPfpytPVgXOCXw+62EiaExE=;
        b=s+802lewxJYqDCnSbIv8812zNsMFa3830iA7SY+lFklOhIxmclX4D2jGNAQm3F+y95
         +zxV8vAu3D845l3E0MAwUGWJGSaal+uUVjf2sSNEMzvwnF/2evuDtROHJK0TXUFA83nZ
         k4I2JZvRtOEmhTFH35vVFxv6OTlRgtvaj7giMzU5jbtWEljHfg3CQAwnqFS8zSP+0AOo
         g6/ALqZsy2yPNgRwQwnXHPlXoYIopoUYMr09gTJDmW/PssywS0IkeyVzP9kH29fuUfgj
         Y7Pm6TgSeuKtbz24e0puVEnVjuC80B+l06aTsPuCPvoLkVSx6akcMGadFA9boR4KCenl
         4wew==
X-Gm-Message-State: AGi0PuZ9UOnDES3bbwSuwgg/hFD09QzzDTAjA46YyeNtbdxAz2ANxRtN
        iVoxcfFe4zqdZrSoSr0OmZQ=
X-Google-Smtp-Source: APiQypKINTvX+eUHVTxGsE/KYuvH4NMPf93w2kXDy3VYFzJa+K0tVZyS1i1tCFN7cTQRcjpPno6rzQ==
X-Received: by 2002:a1c:5fc4:: with SMTP id t187mr19384279wmb.181.1586781522392;
        Mon, 13 Apr 2020 05:38:42 -0700 (PDT)
Received: from x1 (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id w18sm14596456wrn.55.2020.04.13.05.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 05:38:41 -0700 (PDT)
Date:   Mon, 13 Apr 2020 14:39:21 +0200
From:   Drew Fustini <drew@pdp7.com>
To:     Haojian Zhuang <haojian.zhuang@linaro.org>
Cc:     Drew Fustini <pdp7pdp7@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Drew Fustini <drew@beagleboard.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Subject: Re: gpio-omap: add support gpiolib bias (pull-up/down) flags?
Message-ID: <20200413123921.GA32586@x1>
References: <CAEf4M_Du6Egn-3nZHtSnMMwohc+-DyEdtWU5DqSJi71+nDthFw@mail.gmail.com>
 <CACRpkdaPoMGZ7jGh6j4dYexx+qCcoMQ37vS7kbpf=3TtcA9zQQ@mail.gmail.com>
 <CAEf4M_B_sxOiKFnEVUrx00RE2MaMA98LpijNhp0EVY11eRAXHg@mail.gmail.com>
 <CAD6h2NT840zMfwaJatfKzai8QjZEQmF5v0xgE+9ngSJJ+Qy+6g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD6h2NT840zMfwaJatfKzai8QjZEQmF5v0xgE+9ngSJJ+Qy+6g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 13, 2020 at 01:23:15PM +0800, Haojian Zhuang wrote:
> On Fri, 13 Mar 2020 at 08:38, Drew Fustini <pdp7pdp7@gmail.com> wrote:
> >
> > On Thu, Mar 12, 2020 at 1:43 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > > Do we have a datasheet for this GPIO block somewhere? Should
> > > be the datasheet for the ASIC.
> >
> > I am looking at the AM335x reference manual [0] but I can not actually
> > find any references to pull-up/down or bias for GPIO pins.  I guess I
> > was making of the mistake of assuming this would be something the gpio
> > pins support.
> >
> > > We already have the required .set_config() callback on the OMAP
> > > driver, it's just that it only uses it for debounce.
> > >
> > > The driver is a bit convoluted with register offsets in a struct
> > > omap_gpio_reg_offs depending on variant, but if they have
> > > a register for this I'd say just get hacking.
> > >
> > > If the GPIO driver is using pin control as back-end you are
> > > looking at something more complex similar to what Intel is
> > > doing inside drivers/pinctrl/intel/pinctrl-intel.c: this driver
> > > is just calling up to gpiochip_generic_config() which will
> > > try to configure the lines behind the GPIO using pin config,
> > > which works if the proper ranges are defined so the
> > > framework can map a GPIO line to a pin control pin.
> >
> > Thank you for the feedback, Linus.
> >
> > Upon further review of drivers/pinctrl/pinctrl-single.c, I am not
> > certain it actually supports pull-up/down.
> >
> > I see there is pcs_pinconf_clear_bias() and pcs_pinconf_bias_disable()
> > but I don't see a place where the PIN_CONFIG_BIAS_PULL_DOWN or
> > PIN_CONFIG_BIAS_PULL_UP get set.
> >
> 
>                         /* 4 parameters */
>                         case PIN_CONFIG_BIAS_DISABLE:
>                                 pcs_pinconf_clear_bias(pctldev, pin);
>                                 break;
>                         case PIN_CONFIG_BIAS_PULL_DOWN:
>                         case PIN_CONFIG_BIAS_PULL_UP:
>                                 if (arg)
>                                         pcs_pinconf_clear_bias(pctldev, pin);
>                                 /* fall through */
>                         case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
>                                 data &= ~func->conf[i].mask;
>                                 if (arg)
>                                         data |= func->conf[i].enable;
>                                 else
>                                         data |= func->conf[i].disable;
>                                 break;
> 
> Because it does fall through, pullup/pulldown is set in the snippet of
> "PIN_CONFIG_INPUT_SCHMITT_ENABLE".
> 
> Best Regards
> Haojian

Thank you for the insights, Haojian and Linus.

I've added debug print statements and it seems that pcs_pinconf_set()
is never called on the BeagleBone (TI AM3358) either during boot or
when gpiomon runs with bias switch that invokes GPIO_GET_LINEEVENT_IOCTL
with GPIOHANDLE_REQUEST_BIAS_PULL_UP flag.

The pinctrl-single driver and gpio-omap driver bind as a result of these
device tree nodes in arch/arm/boot/dts/am33xx-l4.dtsi:

    am33xx_pinmux: pinmux@800 {
        compatible = "pinctrl-single";
        reg = <0x800 0x238>;
        #pinctrl-cells = <1>;
        pinctrl-single,register-width = <32>;
        pinctrl-single,function-mask = <0x7f>;
    };

    gpio0: gpio@0 {
        compatible = "ti,omap4-gpio";
        gpio-controller;
        #gpio-cells = <2>;
        interrupt-controller;
        #interrupt-cells = <2>;
        reg = <0x0 0x1000>;
        interrupts = <96>;
        gpio-line-names =
        "MDIO_DATA",    // 0
        <snip>

I see in Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt

    "pinctrl-single" means that pinconf isn't supported.

I believe this is why pcs_pinconf_set() never gets called.

Any suggestions as to how I could proceed?

Is it reasonable to change the compatible to "pinconf-single"?


Thank You,
Drew
