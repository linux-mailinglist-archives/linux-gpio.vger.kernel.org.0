Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5956E223DCF
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 16:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbgGQOIu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 10:08:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgGQOIu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2020 10:08:50 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E677C0619D2
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 07:08:50 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id m22so6701149pgv.9
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 07:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9EdhZLMg1fsP3hTk7WnGlbqG7e0Hbg8ODFok4HW5IPc=;
        b=PcI6xKLULAOCSikTscY/ciNFx21KzAVcQR9/4N8Iea0dg+arke6X23SjDJ5Q7oV8iC
         78PKqWt5rg0dcAjBNNiUiT8o1sUS6ks5t+ysA5cXnvmqUtGKETYuJIStwdMRIwgVxY1I
         iutGMyPrd0kLcKK2G54B2NgqXxWna1DQaP39k8pxOBq3/vjj4nk4JujyCjxoFZaydwWc
         ziZlBebQ2UeQ7OijTPrUY6PqdkI4tF9b0F988f6uVmM5ZpWpNZV5C5IJgy3cJddBMOUm
         kdCqvVpwwzHIEt10zDiwRAM4LwDdvuFUWuHVJY8CVjQOf8EmURIrH1++TqYD78rWe5i/
         +4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9EdhZLMg1fsP3hTk7WnGlbqG7e0Hbg8ODFok4HW5IPc=;
        b=CoMgjCq99TkblDom3Z0rwQBJHc6UuswTFKkJKzId9KHg3bUkvVtX19JdaLX/FGj2w0
         rCtIR5xpctq9LUGb0j2H+Sb7RYw04C7/3JOsCwiUT4+/fhX2kZfbm/TSzTbcdWYO27Vw
         UWUoKW2cn+1T8qyWdAubMsJvxDnjehhEdBMbElOLSWZ3S9c51rNVuC5239VuC+8vb2pW
         JHHCmseq0GLRV+BgEp80c15tbQ+CizvwFcEj/dfUC6+IU2gQ/3435sTkdknVfGGjHyFs
         mM8FvWeRyArsDBqvpyzxMUQkWTTVoe9lotI1N81M4tPl/Gl0Lb5sHB3QncjZx5977OSo
         9rEw==
X-Gm-Message-State: AOAM5334g5jN4zYI3KuN4sMI8vPFupil1DixjbR0NnhaQE1VjJgSgkT3
        L6VXSxCD4sHb0ik8ur2yFZfNc63DWNIs6hGc2xU=
X-Google-Smtp-Source: ABdhPJwc1c96lm7e+EEpk1mIaXqR63vkDtr1ZMdDZbFo7rYNGcpR4L9/3yQF5jgRQ/8lZMErgFFCKhyUAnc52QM+SUE=
X-Received: by 2002:a63:ce41:: with SMTP id r1mr9018911pgi.203.1594994929535;
 Fri, 17 Jul 2020 07:08:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200717112558.15960-1-linus.walleij@linaro.org> <d97d8c70-528e-f06b-3bf6-4faf51857a9c@redhat.com>
In-Reply-To: <d97d8c70-528e-f06b-3bf6-4faf51857a9c@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 17 Jul 2020 17:08:33 +0300
Message-ID: <CAHp75Vdz3DSZY5v3h0Ff2ssPvq9+0FNYFZuFCF6Ak1Ptkm0Gfg@mail.gmail.com>
Subject: Re: [PATCH] gpio: crystalcove: Use irqchip template
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 17, 2020 at 5:00 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 7/17/20 1:25 PM, Linus Walleij wrote:

...

> Hmm, testing this might be tricky, I don't think any boards
> actually use any GPIOs on the PMIC (which this driver is for)
> as interrupts...
>
> So the best I can do is boot a machine and test there are no
> regressions I guess.

I was about to send a PR to Linus, but I will wait for your answer.
From my perspective the approach is fine. We might have needed some
kind of masking, but I have no idea what those GPIOs can be used
for...

-- 
With Best Regards,
Andy Shevchenko
