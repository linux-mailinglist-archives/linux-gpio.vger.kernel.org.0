Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B75B245F2DD
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Nov 2021 18:27:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232537AbhKZRam (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Nov 2021 12:30:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231339AbhKZR2l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Nov 2021 12:28:41 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7421C061D6A;
        Fri, 26 Nov 2021 08:58:23 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id w1so41514336edc.6;
        Fri, 26 Nov 2021 08:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/cj12yNx+8MhDFy03xDOyf1KZM8MF6fnUqCuiicwspE=;
        b=FiYTkTldngnj2AjjXPfuese/k1KOh0xkon21keGZ2+iQlc6m/MPpNcHq4fD3AuxCXS
         9YIX0CvigSmnvYWKzYmWmFekWlPUpYWWoUczWKucPb1efzx42aYvFUpz6dlozkKJPlOt
         JYR3kv2fNkMpVsOklKCOgml+TiDIxevfofGUzsu8dOkxf/DW/1PmxcsGdbnRz6VwrvPP
         tKEXbnynEqHxIp/dDwvQf1Pkoglx/kPSzrn/EK5FWD3y/Tb3WHreIg124EiDkQAlb+YP
         ai9iwsCj/SNtcVfbWolFbvp3vvNQClvkrDqIPJPyrjkpI0mx8KAB+MGZWhU3o5Z/IuMm
         tQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/cj12yNx+8MhDFy03xDOyf1KZM8MF6fnUqCuiicwspE=;
        b=N5kmritKc/i5hpJCQag3bkobbkP32N/OkIdwWxWkKV2XcL/lftBbE+gNqgjr0nfyJe
         M6xFK6CjV/UhcB2Om36/dgVpDfIt8tU2IPteEuCp1y6l/zlv7PEhmlVzyfu6eJxqaUrB
         iDwu3fPyouHfOWjfJ7BzKRecP6qj85VtxC5iYRdRS/LsK5G+qJxNHaKpGjesHsr+1oVs
         YRjGgPsRNiZBQzByrwY1Rgqrp+Z6AgQ2FiePc7/35pFJ4lzg3w+02P4NTAPIZm0YWMk6
         7pSky2ruQaqlY0J8faR3669SgMQFg5KIlB6zHiZOABYFwSRJjAOMRnXv986rs5Ismlpj
         nH8Q==
X-Gm-Message-State: AOAM5305J9XCuwqgZHOIovN0aNQ0165MH8QFe/2uzfruuDDUjVptK7uv
        SWIfYATHW7MKwpa9ipiTubaBQefRqzjJi28u/9c=
X-Google-Smtp-Source: ABdhPJw2HiWX3hnwC3PefguvXtotwxycD8rkwoWSKOFfmIWSx0TtwRCADA82IHWFv2/GurbsAEEeFKgSAdXrll7+FYE=
X-Received: by 2002:a17:907:60d0:: with SMTP id hv16mr39403459ejc.425.1637945902315;
 Fri, 26 Nov 2021 08:58:22 -0800 (PST)
MIME-Version: 1.0
References: <20211125110738.41028-1-nbd@nbd.name> <20211125110738.41028-13-nbd@nbd.name>
 <CAMRc=MfEO-kvOq2aELO6LMSTTHykG8DxdJOf_zUdJSaz8tB8wA@mail.gmail.com>
In-Reply-To: <CAMRc=MfEO-kvOq2aELO6LMSTTHykG8DxdJOf_zUdJSaz8tB8wA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 26 Nov 2021 18:57:47 +0200
Message-ID: <CAHp75VcofiOE4LKqTjnXco26Yd5a4VWYkQE3gNU8Z3zr70woVA@mail.gmail.com>
Subject: Re: [PATCH v4 12/12] gpio: Add support for Airoha EN7523 GPIO controller
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Felix Fietkau <nbd@nbd.name>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        John Crispin <john@phrozen.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 26, 2021 at 6:40 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Thu, Nov 25, 2021 at 12:24 PM Felix Fietkau <nbd@nbd.name> wrote:
> >
> > From: John Crispin <john@phrozen.org>
> >
> > Airoha's GPIO controller on their ARM EN7523 SoCs consists of two banks of 32
> > GPIOs. Each instance in DT is for an single bank.

a single

...

> > +       err = bgpio_init(&ctrl->gc, dev, 4, ctrl->data, NULL,
> > +                        NULL, NULL, NULL, 0);
> > +       if (err) {
> > +               dev_err(dev, "unable to init generic GPIO");
> > +               return err;
> > +       }

Since it will be a new version you may have a chance to replace this with

  return dev_err_probe(dev, err, ...);

-- 
With Best Regards,
Andy Shevchenko
