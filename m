Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92B3820BD99
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jun 2020 03:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbgF0Bei (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Jun 2020 21:34:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726446AbgF0Beh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Jun 2020 21:34:37 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CE49C03E97B
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2020 18:34:37 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id j11so6966615oiw.12
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2020 18:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1jpCExq+eHfFEMfkbsUn644B5k2G8+hh80ffAHW6PL8=;
        b=izHKJvh6y3TVjh4IG2BGh6jTU0K4C8jAoBJ0Pn1+ey5G0z6DZbBCnhiH3RhYvLrR5r
         0ELeduNA6e7CsEg5aaz3xr6dkf7ioiCwcaom5lzuGnLzoEyC1msnx4QbMYUvFgL5kMSp
         a6vjqg7OihGNuyN4mlaRBkzYrvrUidBnf96iqjcp0yrIfzjAnyrwDZkMuoKd42rKr20X
         bXLCLoxXPnkIYv2cJLLnXKkGLpOsFEluv/80WkBx75084FfBn3sZ15Gi9+fIDbBalhtJ
         sZICk71IYOGt9JzwQlVzXsoPSPUBcXrTYEHNfjW9WRjGuxr7skNRFMNwP0d7vshq6yFg
         9YMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1jpCExq+eHfFEMfkbsUn644B5k2G8+hh80ffAHW6PL8=;
        b=k0FEzCuR4+6h/VJ1Foz13K2CniJXdo9GUFaUTKHJss2+QgFy0YrquEVYY4a3eIZsGi
         JOwYaV45Tp5Tz5svt1K4PO1DyejS629SQefs+SDC4cn0OdLK6LvUBL6QM9e3seyarchD
         gEL+uBUK1pSHe7RxUpU8rOuzXFULDlJHwxAa/51MNDEyrmxyKSnP+qlhRgJxF1ZMhJBG
         atp12lcEQlHQuuoTaTaVeU2UW/5TY42mFTmuYPpw90IARAjtta8TGVXJCThYCVMaWwRa
         RN8tuMLNWbOhi7Zwm3VNQ9KB7wE66eEMRfimMhF1904McMOIjUC3IflLNv8RouigDb6Q
         nYEw==
X-Gm-Message-State: AOAM532IlkBs3QZdDVnV5YRcQk7AX4gbCSUq3NHp3Uex/Q4jZH/R9KsK
        boZngjRp+/aRrV5t38kHOx505kmmPPv/sa9zCM8hnA==
X-Google-Smtp-Source: ABdhPJyuXjLu+pU7DcszFUFYt5+y4us4RJUjkakZpxdm6Q+jQJSt+9NSjit4HO/Hh/mlFK2HxRLTWxOFjCAXsjqYfP8=
X-Received: by 2002:aca:2108:: with SMTP id 8mr4729470oiz.10.1593221676493;
 Fri, 26 Jun 2020 18:34:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200625001039.56174-1-john.stultz@linaro.org>
 <20200625001039.56174-4-john.stultz@linaro.org> <159315737502.62212.16093934831673347066@swboyd.mtv.corp.google.com>
In-Reply-To: <159315737502.62212.16093934831673347066@swboyd.mtv.corp.google.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Fri, 26 Jun 2020 18:34:25 -0700
Message-ID: <CALAqxLVNGar8g+FvHaVHN_e-MOZZ+=ZPmDt_GKKSC8AS-wLFGg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] irqchip: Allow QCOM_PDC to be loadable as a
 permanent module
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        iommu@lists.linux-foundation.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 26, 2020 at 12:42 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting John Stultz (2020-06-24 17:10:37)
> > diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
> > index 6ae9e1f0819d..3fee8b655da1 100644
> > --- a/drivers/irqchip/qcom-pdc.c
> > +++ b/drivers/irqchip/qcom-pdc.c
> > @@ -430,4 +432,33 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
> >         return ret;
> >  }
> >
> > +#ifdef MODULE
> > +static int qcom_pdc_probe(struct platform_device *pdev)
> > +{
> > +       struct device_node *np = pdev->dev.of_node;
> > +       struct device_node *parent = of_irq_find_parent(np);
> > +
> > +       return qcom_pdc_init(np, parent);
> > +}
> > +
> > +static const struct of_device_id qcom_pdc_match_table[] = {
> > +       { .compatible = "qcom,pdc" },
> > +       {}
> > +};
> > +MODULE_DEVICE_TABLE(of, qcom_pdc_match_table);
> > +
> > +static struct platform_driver qcom_pdc_driver = {
> > +       .probe = qcom_pdc_probe,
> > +       .driver = {
> > +               .name = "qcom-pdc",
> > +               .of_match_table = qcom_pdc_match_table,
> > +               .suppress_bind_attrs = true,
> > +       },
> > +};
> > +module_platform_driver(qcom_pdc_driver);
> > +#else
> >  IRQCHIP_DECLARE(qcom_pdc, "qcom,pdc", qcom_pdc_init);
>
> Is there any reason to use IRQCHIP_DECLARE if this can work as a
> platform device driver?
>

Hey! Thanks so much for the review!

Mostly it was done this way to minimize the change in the non-module
case. But if you'd rather avoid the #ifdefery I'll respin it without.

thanks
-john
