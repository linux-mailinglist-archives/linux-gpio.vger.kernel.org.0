Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43BAC41113F
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Sep 2021 10:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233996AbhITIrH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Sep 2021 04:47:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230053AbhITIrG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Sep 2021 04:47:06 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84B7AC061574;
        Mon, 20 Sep 2021 01:45:39 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id c22so58334082edn.12;
        Mon, 20 Sep 2021 01:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=kmcE7Z1ElpyHrjJi9RUm0ZSid4nUm1Xyra7E4BYgmGE=;
        b=NV4gucD7MReP3FF7x/gJoOhLOYrtDA/MvoRctdsxgQ1eUo2OLjuDDas1c9S5xmml5Z
         dT6sR++IFCQpBZl051riWNjU9mkESxIG5YQriG4LP6v5AsCj3HcSitYsVHNjjEC6yptK
         pMjXcomBW+xSFAcK+Hdr0r8w1VDHFUwGFy/Gg/jaYGpSNlNqrsnd4HcB0jTPOI049dAU
         xQrWRZ/REzcSIv3fyRcfnGz1V74aA+0bkSy83e8unFyXpFtMkjlLjYQQBws7AcmKls6L
         Nro6yhea2Pi0E3vJtrSNCCikAyqTytGAU3yBGLzX2uWgUXXjr8h9EWY0PuQUHUpaF4iU
         lTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=kmcE7Z1ElpyHrjJi9RUm0ZSid4nUm1Xyra7E4BYgmGE=;
        b=uX12lIVth7xBn8wG9buISMZnpVTWOp1ofXmyJiZuzHJMx69233e9tyu6Upk5W6P9LH
         jnZetagEWFPZI8vkbpmjBpG1d8LBc/owIFiFgFiCgkzRU8qybCBda1PqYZK7KeioLs3i
         8JeWxojApxkhrYMVzOkE3hkE4d+QVU4LnHC/cbsC7lhhhYWT8u2ZOU1Ym2HcEISoNMw7
         xL97A6XsCNleiNH+54PeuxqajJguLyQgMcxpMpSAZ+GK/ky0FDwmdeDRMQuWRE2PEolB
         Wjo3ZLK9BcWsZ1tZVdCIKNDqHV+2t9G+i2FsGa+5oylFaStE8r7hzynqOf9pKLaUc+K8
         5K2Q==
X-Gm-Message-State: AOAM532HxIbzYecjncAUsuyZX2Kt0I/gSJucoWldosMXVtMw3MNwLs13
        c3oMEDDqmqAa/HBfdiOS+fLDICpk1zef6BKHoQ7LBdWcMHo=
X-Google-Smtp-Source: ABdhPJyDMBh1TaduOrBHF9GXtxiMRPa/Z5Jh1pKlFBHwKS8S6CMru8DkvAY0SqSN1tqnFeb2xcKcjbRW+QMlf2D42Lg=
X-Received: by 2002:a50:be89:: with SMTP id b9mr25631604edk.240.1632127537896;
 Mon, 20 Sep 2021 01:45:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210918083307.3195-1-wsa+renesas@sang-engineering.com>
 <20210918083307.3195-2-wsa+renesas@sang-engineering.com> <CAHp75Vdv=0i05EitMi6JjbjML-jFD_1M0q7ps2KVHcN4UtFU-w@mail.gmail.com>
 <YUhGkBdXJUI3XadP@ninjato>
In-Reply-To: <YUhGkBdXJUI3XadP@ninjato>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 20 Sep 2021 11:45:01 +0300
Message-ID: <CAHp75VcXuYLM4cPAb+rv47wz0v+Q6tjek6tKuBj32K81XxkKaA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpio: add sloppy logic analyzer using polling
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 20, 2021 at 11:30 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> thanks for the prompt review again!

You're welcome!

...

> > > +       /* upper limit is arbitrary */
> >
> > Not really. I believe if the upper limit is > PAGE_SIZE, you would get
> > -ENOMEM with much higher chances. So, I think the comment should be
> > amended,
>
> ? Dunno, maybe it is not arbitrary that it is < PAGE_SIZE but other than
> that the value I chose is arbitrary. There is no technical reason for
> 2048.

I understand, but the comment is a bit misleading. My proposal is to
extend / amend the comment to point the upper-upper limit out. Perhaps
you need to rename "upper" for your case, or use a different word for
the PAGE_SIZE limit. Up to you.

> > > +       if (count > 2048 || count & 1)
> > > +               return -EINVAL;

...

> > > +       if (ret < 0) {
> >
> > > +               dev_err(dev, "error naming the GPIOs: %d\n", ret);
> > > +               return ret;
> > > +       }
> >
> > Perhaps
> >
> >   return dev_err_probe() ?
>
> Reading strings from DT can be deferred? I don't think so.

There is a new development, i.e. the documentation for dev_err_probe()
is going to be amended to allow this. But I can't quickly find a patch
in mailing list with the related discussion.

> > And I think it might be split into two conditionals with
> > distinguishable error messages.
>
> I think "something is wrong with the names" is helpful enough for the
> user.

...

> > > +       [ -n "$cur_cpu" ] && fail "CPU$isol_cpu requested but CPU$cur_cpu already isolated"
> >
> > For the sake of style (handle errors on the error) I would use
> >
> > [ -z "..." ] || fail ...
>
> I'll think about it. On first glimpse, this doesn't look more readable
> to me. "if this is true then do that" is super readable in my book. But
> yes, when calling external programs, I need '||' anyhow, true.

My point here, that in shell the usual pattern for error handling is
like '... || fail ...' And this is almost a regular style in your very
code.

-- 
With Best Regards,
Andy Shevchenko
