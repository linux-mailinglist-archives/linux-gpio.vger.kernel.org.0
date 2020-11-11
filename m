Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D5042AF459
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 16:04:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbgKKPEo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 10:04:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725900AbgKKPEn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2020 10:04:43 -0500
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B4BDC0613D1;
        Wed, 11 Nov 2020 07:04:43 -0800 (PST)
Received: by mail-pj1-x1042.google.com with SMTP id b23so881486pju.5;
        Wed, 11 Nov 2020 07:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Grx/FHoF4HwNpigvUXazam+sNATxKrPMmnm5JP6O6qY=;
        b=Lwzx9HUUsVn0HhFwlhAqIhE0zf86VhAopUutHuaxkRYqDSQC2p4nVA+Zjju9SiuIpn
         Vw3SLwEX5oAA/TBGgp+PcCPUyyJrO0xJj7PbKjg4TZjL77kWVWMg1hhYJRua54AK/5uw
         NIEbhxGHHtvDuCKGqysqv9Hicwqng+I18aQ9q0q6gdmBMbsfo0PdvuhtKOQGGIoexbtD
         cqAjI+jXCbTtq+pwZZyh50cF9ZvYherDF17jrrXG+eI6ytbHSoRUx6ztRUQdTWeIJuoR
         aKxKrn08IGgOIzlACXQXXR8YYjVLFktpbFEUHoiA6UI9lKqgikVRGQf4+lQUPdPqfW+W
         lkLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Grx/FHoF4HwNpigvUXazam+sNATxKrPMmnm5JP6O6qY=;
        b=TzHA3QIJ9L+8fxzNoDMzetxx7uhFAnqZvOu11KHLb4eIX8woTIyRuQIPCLLkvOTmpc
         t/QcUpV1hmdhWVIUB3CxA3C3VhJdVv5nwCO2mmx+1OZpmvKbiQToeyXOLalmPyten9ut
         7sWYjbHT221FIT28ESLA90x0QSL9qsaCMnwN8vH1OzYCG5SnZKFjnlGaV1RjCWy9YOrz
         IayzjJksJi/2ITvDwriPOlw+QyAuhUDhaAO8UL+7ZuMUhgNN/NRJB5XFtO+goE1YMCHL
         28smKwmJ8FhTWiZ4CYAB2flT7JoyO8oRFQK7KCG+c4rev56s/ojbNZBFI4/HE2Ci34J4
         TrjA==
X-Gm-Message-State: AOAM531eQoH+nMNAWoS8yt/ZkYgJmbQ0sSnJkKI+CWD8KDXrGbeqnQ3q
        E4HzwTlP/PardlCxV1o5DF/XsuefUaStJ5QaPE8=
X-Google-Smtp-Source: ABdhPJyDzbJ0pUakC+FcVnX2DRGtSr12b8GjpBi57vHU0n89QLTPkOcrxqwvgrrNv9W7ZHtwmSMJxjYubSszooEZsi0=
X-Received: by 2002:a17:902:aa8a:b029:d3:c9dd:77d1 with SMTP id
 d10-20020a170902aa8ab02900d3c9dd77d1mr21937964plr.0.1605107082957; Wed, 11
 Nov 2020 07:04:42 -0800 (PST)
MIME-Version: 1.0
References: <20201110093921.3731-1-brgl@bgdev.pl> <CAHp75VeRvO-PpNpcQHKXBRdWQqavfvQwqai2gRys+FbhBuVy4Q@mail.gmail.com>
In-Reply-To: <CAHp75VeRvO-PpNpcQHKXBRdWQqavfvQwqai2gRys+FbhBuVy4Q@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 11 Nov 2020 17:05:31 +0200
Message-ID: <CAHp75VdoptjHM8aSiiQ7BHpYE0Zf2-Ojy55H5hTv4c_68cS1vg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: devres: shrink devm_gpiochip_add_data_with_key()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 11, 2020 at 5:02 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Nov 10, 2020 at 11:42 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > If all we want to manage is a single pointer, there's no need to
> > manually allocate and add a new devres. We can simply use
> > devm_add_action_or_reset() and shrink the code by a good bit.
>
> Yes, it is possible to convert all one-function-based devm_*()
> wrappers to use this approach.
>
> The problem is, it will call the release() function on error which is
> new (and probably undesired) behaviour.
> I suppose you meant devm_add_action() here.

Ah, now it seems I got it. You need to release the chip in case if
devm_add_action() fail.
Dunno if devm_add_action() can somehow change the logic to be clearer here...

-- 
With Best Regards,
Andy Shevchenko
