Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E9FA7C620D
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 03:08:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235248AbjJLBI0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 21:08:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233729AbjJLBIZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 21:08:25 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBF40A9
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 18:08:23 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-692af7b641cso106679b3a.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 18:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697072903; x=1697677703; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Hqg5K5lCDwesjzlytbXw7y9NPHtgi5OC1j95rwRDts=;
        b=h3Fais/epn5+luxL2Xsm/KMzuWv4DkBMrBixViTzH8w2KKThFVDBaXUT346npXFs3o
         QaWpAa24DXo3bdhrK+vBbEA4I/TKDDx7gMAcsfvudnWrZC13et+ymVfh8soevm2OOIH/
         1VfpjPSyKn5YfD62ovq1QWao1Q1h8vHpbmkXIyENParBdCoOkOdcjF3IMQA+d9m/dT8D
         0BkWH+aw35C0jsFIdFZtHZCYYTf77rtlWZyQJtdf0SM+DQfDHAebOO5m9J7SZB/Fxhd7
         6srr239OZfwqFvsd1x9lwdN/lZr+flhE9SEorA7xUIUGgGP/4bHeLntbifi0dnA+eiWI
         ZBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697072903; x=1697677703;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Hqg5K5lCDwesjzlytbXw7y9NPHtgi5OC1j95rwRDts=;
        b=Etu9XtnS/rA47QxpvSbjhMgO9RBQ2x0oq+90QDyoDQq1/XA0mSwS/zYf7bFS2qwr+i
         sSGk0cW+FZ2sy2afhwVae02hJj14KNs+ntQw1FyKJdnVuTNxjE8js1pc6sFSxENfRMuw
         KPAfWvMLdBwPrxCgUex+YHN39rM9Q5r9o33XAObNwkhbaiqvllyjBgCbhBvmiJTBEDi6
         iKPVL9x2mxZ4V6eWqeIE3T1mRpdxYec/m1UiW2FHtaAjNhL7vJmeIhrAiLqTvhsFtpi0
         tQZ2vpsxAUH+X/7hpip9P5Vh1FH+23t2WJrg1Gzkk49p6IMDh28Ng5F1dl5v1V/4st2L
         dTLA==
X-Gm-Message-State: AOJu0YwLiJxrQL8XwyYhTUYOD6ubbgtqY4kDNd4u0CyqhQfoG/ADkECa
        x6A3nsgmhRXbU42BE5mfPbtrtA==
X-Google-Smtp-Source: AGHT+IGpxl6YkWuTo1INXVAtkAIE60MX0AlQ4nrSuCV88LRkBuh+MynPfutMlVzITCYoPfp66FDd1g==
X-Received: by 2002:a05:6a20:8408:b0:172:55c1:f1d4 with SMTP id c8-20020a056a20840800b0017255c1f1d4mr6361133pzd.4.1697072903036;
        Wed, 11 Oct 2023 18:08:23 -0700 (PDT)
Received: from octopus ([2400:4050:c3e1:100:f7a8:3d44:f8cb:28e])
        by smtp.gmail.com with ESMTPSA id jd22-20020a170903261600b001bc930d4517sm526508plb.42.2023.10.11.18.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 18:08:22 -0700 (PDT)
Date:   Thu, 12 Oct 2023 10:08:17 +0900
From:   AKASHI Takahiro <takahiro.akashi@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Oleksii_Moisieiev@epam.com
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, sudeep.holla@arm.com,
        cristian.marussi@arm.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [RFC v2 4/5] gpio: add pinctrl based generic gpio driver
Message-ID: <ZSdHAYsmh/mzISKC@octopus>
Mail-Followup-To: AKASHI Takahiro <takahiro.akashi@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Oleksii_Moisieiev@epam.com, Bartosz Golaszewski <brgl@bgdev.pl>,
        sudeep.holla@arm.com, cristian.marussi@arm.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20231005025843.508689-1-takahiro.akashi@linaro.org>
 <20231005025843.508689-5-takahiro.akashi@linaro.org>
 <CACRpkdZ+QkZp7_se7vN7i_Nx_c3woT_OzVnj3YHju3mZS+Ku8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZ+QkZp7_se7vN7i_Nx_c3woT_OzVnj3YHju3mZS+Ku8A@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus and Oleksii,

On Tue, Oct 10, 2023 at 02:00:40PM +0200, Linus Walleij wrote:
> On Thu, Oct 5, 2023 at 4:59???AM AKASHI Takahiro
> <takahiro.akashi@linaro.org> wrote:
> 
> 
> > Some pin controllers provide not only a method to set up lines but
> > also gpio function. With this commit, a new generic gpio driver will
> > be provided. It is implemented purely by using pinctrl interfaces.
> > One of such pin controllers is Arm's SCMI.
> >
> > Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
> > ---
> > RFC v2 (Oct 5, 2023)
> 
> RFC v2 looks very good to me, definitely something that can be merged
> as a starting point once the hardware has been tested.

Thank you for your support.
I think the easiest and best way to test the code is that Oleskii will try
my patch on his platform, r-car, on which I believe that SCMI FW for pin
controller is already available since he tested his pinctrl driver.

@Oleskii, can you please take a time for the test?
(I will assist you in case of any error.)

> > +static int pin_control_gpio_direction_input(struct gpio_chip *chip,
> > +                                           unsigned int offset)
> > +{
> > +       return pinctrl_gpio_direction_input(chip->gpiodev->base + offset);
> > +}
> > +
> > +static int pin_control_gpio_direction_output(struct gpio_chip *chip,
> > +                                            unsigned int offset, int val)
> > +{
> > +       return pinctrl_gpio_direction_output(chip->gpiodev->base + offset);
> > +}
> 
> IIRC Bartosz is working on a patch set getting rid of this kludge having to
> call with base + offset in every driver, replacing it with generic calls that
> you can just assign in the gpio_chip.
> 
> When this gets applied these changes will likely be in place so you will
> get rid of this too.

I will try to keep eyes on Bartosz's patch.

Thanks,
-Takahiro Akashi


> Yours,
> Linus Walleij
