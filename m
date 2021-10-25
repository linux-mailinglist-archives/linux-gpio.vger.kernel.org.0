Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 837B943926B
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Oct 2021 11:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbhJYJe7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Oct 2021 05:34:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232320AbhJYJem (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Oct 2021 05:34:42 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9A82C061745;
        Mon, 25 Oct 2021 02:32:20 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id g10so15829618edj.1;
        Mon, 25 Oct 2021 02:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UAli0jdgIw7ZEZPKO1/D78zXBVMiesduKkFlQEa1Www=;
        b=mbfJHsRvUMVs6OgFZPScM6wbjlhebjovgSPupT5YszMCJWe8ZerZjrW1yE9iY/4a+r
         jh0FF6z+udGmw/Z1vGYhWoD08gu/MUDqAGY5rpK28beWut8jLjCo92A8SW6WMmtNCyPY
         fl0U5O6zGYrK9xBULAhm58koUg0Vmlp++XaecM9u5D99YKARKzpacF6U3501jq+rnZrp
         U5k5cbQax4FSx9cCcLCCiFaSGfQkI9stx1Ip6FqtVTuN/u2Vpw3Q0tVbB5ujSY76SL60
         aX+vesXn4E9atjaCKV7D3xGEKBPfD7KpTiY4hPqE7ykEUiQKlimwx+d9IcAN1hA+FlKK
         LWIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UAli0jdgIw7ZEZPKO1/D78zXBVMiesduKkFlQEa1Www=;
        b=AKhDWLP5wtt4GpmG5Bui+q01tCjcy3F2b4jrrA7LFynvfTHcl3dFQbwkyGQGRQv9Jq
         QeX5JVsAOW/lp+90vk094aNi2mgJIJSnbno4XXEHhKXtXwBDvplVP5ob3FywouDeUvkk
         Ojq1ttT1LI/ZxrgKG04qNtrpT7TZXrbB1dxWQZjwQnpKDhq7dpUaA7/knD1uath8+cAi
         VzcUYxuPEOnCnzXjdR61XOra79t6mbj3wX9c/V+y7b49AS1wVGXSUnK73b6eUvlBR2hP
         mqF9AcmYHrKa5etyCHkDDs7rrIsfSmYh05XE4K2HTopp3EA7+wGxbmjFEkBvuWCb4U8a
         hqnw==
X-Gm-Message-State: AOAM5320bOgn4VjQJIKSU37pAwamSrPmc+ujdhMbYQ4evx+dfMWnLNmo
        VkBf7hVpwa9tZXH9QH9ratrydWgiZ9Jljja5o8E=
X-Google-Smtp-Source: ABdhPJwNCo2XDCoCwqqoGK8rle99/DTO6+wC/+5t1pICLUNzeS85/k4skOrrPqkvdQP3MB/Ujgh0m0J0PfaIW56xzps=
X-Received: by 2002:a17:906:d553:: with SMTP id cr19mr13627592ejc.128.1635154337298;
 Mon, 25 Oct 2021 02:32:17 -0700 (PDT)
MIME-Version: 1.0
References: <20211022134438.12083-1-asmaa@nvidia.com> <CAMRc=Mfzh8MK=aNzd=hKUOUrQO03K0tWmeMRkt5t8ubVmj4ATw@mail.gmail.com>
In-Reply-To: <CAMRc=Mfzh8MK=aNzd=hKUOUrQO03K0tWmeMRkt5t8ubVmj4ATw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 25 Oct 2021 12:31:23 +0300
Message-ID: <CAHp75VeS7fpPXH_Dop=8y8=T6HsXw_favZpVs49d9tujQLf-PA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: mlxbf2.c: Add check for bgpio_init failure
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Asmaa Mnebhi <asmaa@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 25, 2021 at 11:15 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Fri, Oct 22, 2021 at 3:44 PM Asmaa Mnebhi <asmaa@nvidia.com> wrote:

A nit-pick that may be ignored...

> >                         NULL,
> >                         0);
> >
> > +       if (ret) {
> > +               dev_err(dev, "bgpio_init failed\n");
> > +               return ret;
> > +       }

> > +

...can we utilize an empty line before if (ret) { instead?

-- 
With Best Regards,
Andy Shevchenko
