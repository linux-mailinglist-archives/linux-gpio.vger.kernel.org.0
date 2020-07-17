Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C352822446C
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 21:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728559AbgGQTmx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 15:42:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728183AbgGQTmx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2020 15:42:53 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04D06C0619D2
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 12:42:52 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id z2so12308875wrp.2
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 12:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YwCxSEcwAukZgpIjHJHHQgDFuKliZ8qjPz1oTd88Sfc=;
        b=ccNy8qPAhFq6ENBj567N0D/K9drriblb+Q77lMPPwlYP8pck23wPSG2lF0V4l3ceVu
         sARBgPHwoZpogF/7FYfWmG3iUJFPqc948SozePqA91vAnShwsRt1POTKo7Cz9yYNvQoC
         nCcUeCN+Nhz+TOu+S2TzO3yC86En1kJVibWvQxP0GhOvWC3xz9zIG1vujhnjzBlvQKE9
         wTfQqk9hMWOR1LzcfBQEJAEFsng8qShsgD6Czh7e9KMDE+T6Kl8xqVJA7Cz3VQRjoWmc
         i/1Uy23Hth7h2nxY7M4EFoP5e41DQChUi7krEex/ylTZj6uP0doyze54GfOoDIcAYrcZ
         LGLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YwCxSEcwAukZgpIjHJHHQgDFuKliZ8qjPz1oTd88Sfc=;
        b=Drq8DK7cIeW2Ym6AF9cfstFgL3IDflGr5YyjdSLhEQr/qXLXld5A8dkC3GBL5NjNxu
         weS/9A7/SJmQcKJ3yXacpGE0piOCUGF5NnboCPp+b0K1aiyxTyJztQud6t8U19dyPvZh
         16bMIy9GjSqYNQUMDFskeu6+3LdAGwpKJjwRTB5WS94qN8Jh7Af3Hu4auV4qQ90/CVnd
         6hQCB2o1b3THjT2i5YWmPZlsRAWUKk4BQ2RCYTOg2Vi0sZ65CON9Ppss+E6NhO7J517W
         hBms/58IiNn8nSxpxMhkPo6uht72zE6X5drUQ0k/YRKENmkltnWFrbuiYIf8ZDC4CADK
         nZ8A==
X-Gm-Message-State: AOAM531iJlYVSE6dlX47omhJ+ojbryYRxNRgxi0oUya3uFLTYdMfruEy
        j30tWXWIEuRfDkR4zZsKLyNiPA==
X-Google-Smtp-Source: ABdhPJyml+kz4B6iblW+5vFa+XTAagruIO1V//5d1Lz6hRxXYOVAOqqu16XKhfhdFAxnk9LXAMHRlg==
X-Received: by 2002:adf:e482:: with SMTP id i2mr11480218wrm.75.1595014971595;
        Fri, 17 Jul 2020 12:42:51 -0700 (PDT)
Received: from x1 (92.40.249.21.threembb.co.uk. [92.40.249.21])
        by smtp.gmail.com with ESMTPSA id l15sm15787780wro.33.2020.07.17.12.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 12:42:50 -0700 (PDT)
Date:   Fri, 17 Jul 2020 21:42:46 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: Re: [PATCH v2] gpio: omap: handle pin config bias flags
Message-ID: <20200717194246.GA1775009@x1>
References: <20200715213738.1640030-1-drew@beagleboard.org>
 <CAHp75VfYXuZgtkUvrm0VGX7CcyZoC2mzC_x4mVhzVCeTjZpiJg@mail.gmail.com>
 <CAPgEAj4gJsZLWDEkjfF+THcD92y6HL8T00NWzpECLDdXQYLVfA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPgEAj4gJsZLWDEkjfF+THcD92y6HL8T00NWzpECLDdXQYLVfA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 17, 2020 at 08:56:45PM +0200, Drew Fustini wrote:
> On Fri, Jul 17, 2020, 17:15 Andy Shevchenko <andy.shevchenko@gmail.com>
> wrote:
> 
> > On Thu, Jul 16, 2020 at 12:38 AM Drew Fustini <drew@beagleboard.org>
> > wrote:
> > >
> > > Modify omap_gpio_set_config() to handle pin config bias flags by calling
> > > gpiochip_generic_config().
> > >
> > > The pin group for the gpio line must have the corresponding pinconf
> > > properties:
> > >
> > > PIN_CONFIG_BIAS_PULL_UP requires "pinctrl-single,bias-pullup"
> > > PIN_CONFIG_BIAS_PULL_DOWN requires "pinctrl-single,bias-pulldown"
> > >
> > > This is necessary for pcs_pinconf_set() to find the requested bias
> > > parameter in the PIN_MAP_TYPE_CONFIGS_GROUP pinctrl map.
> >
> > ...
> >
> > > +       if ((pinconf_to_config_param(config) == PIN_CONFIG_BIAS_DISABLE)
> > ||
> > > +           (pinconf_to_config_param(config) == PIN_CONFIG_BIAS_PULL_UP)
> > ||
> > > +           (pinconf_to_config_param(config) ==
> > PIN_CONFIG_BIAS_PULL_DOWN))
> > > +       {
> > > +               ret = gpiochip_generic_config(chip, offset, config);
> > > +       }
> > > +       else if (pinconf_to_config_param(config) ==
> > PIN_CONFIG_INPUT_DEBOUNCE)
> > > +       {
> > > +               debounce = pinconf_to_config_argument(config);
> > > +               ret = omap_gpio_debounce(chip, offset, debounce);
> > > +       }
> >
> > It's a rather strange indentation of the curly braces. Don't you run
> > checkpatch?
> >
> > --
> > With Best Regards,
> > Andy Shevchenko
> >
> 
> Thanks for pointing that out.  I should have caught that.
> 
> Linus - I submitted a v2 with the braces fixed.  Please let me know if I
> should send a patch just for the braces on top of what is already in
> for-next.
> 
> Thanks,
> Drew

Sorry for the noise.  I failed to realize that I had already sent v2
(regarding the handling of the return value).  I have now submitted v3
patch [0] to fix the braces formatting that Andy pointed out.

thanks,
drew

[0] https://lore.kernel.org/linux-omap/20200717194043.1774643-1-drew@beagleboard.org/
