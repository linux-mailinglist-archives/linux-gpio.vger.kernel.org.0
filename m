Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE3301A9BF9
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 13:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896856AbgDOLSh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 07:18:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2896761AbgDOLSB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Apr 2020 07:18:01 -0400
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6F86C061A0C
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 04:17:53 -0700 (PDT)
Received: by mail-qv1-xf41.google.com with SMTP id p19so1474187qve.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 04:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=feV2bfBxxbRz9+Alrhi5EqfX3O6Wn6W/wr8fXtE4YSA=;
        b=Fj8WXxi86X8auQybw/OfKsjTNuvnyx51VnD1J+AjHTRJL5dtbCQqcjsM2JMG/otZTu
         qZ6yEfqWiD3tVQH2PDWzT3pMc6ib72NoVp0BVgWGgac7huBcVi1UsxlsNiATmphjhRfq
         uLQ6yU/wAB6FI0ysICsPWzzDFp7sdcc0aeICT5SlEnmNE1/cnJHYx4OIZzsvBAuPvBrW
         mZof5BPo8SnCN9UHGPRfdqLKroaU+Hhj42QsFKndch8k+05u6WAdMZ962hI7YZtC2Lpl
         tUl1OBf7SWcW4mXzCnKqd/0/T4VEVQ3MMmbQ2nI1Ra050W+dBw5k5FfM4ermcGIyXaFu
         Nu9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=feV2bfBxxbRz9+Alrhi5EqfX3O6Wn6W/wr8fXtE4YSA=;
        b=lm5Fy2ujeKOH121dv+MYjOFESEfjivzVwt6uDVbTGI1w/I5njQSn2+Fa5Jr+IpePiv
         7HowmYQ129WP7eO3330Kf9aU8sV07/9ymlCIeVla5TmVdpTN79Cj+t5ExHuy9SSMLf1J
         uxIw4Wylz+xwJ28fXv9VIPK2kWUR8cr/uKgPy9kmcRjb1H9o03BovK+LTcXyHkrJboSY
         OxvSFYHc2gHIFFfeNtV6hHeXqlEExmF1uL2W/9xY7t7ZtoQgirr2AvevtoUzE1qTWV12
         V56NXQtIVLVAzRF2Un/lFXuo9jseV1PyDE+HQ9ee9TmVn5+nQ0vt2tNipKfKuqMYi0L3
         YVbg==
X-Gm-Message-State: AGi0PuaOeQdkr7mdYGQW+kxrgcmqOZvh4sv2+ya/x/ntw7NzIeYAaZYy
        jeeA3gu4hDMwX5U1ZB9RcGQ/4nm56d7tPKKUQnPaAA==
X-Google-Smtp-Source: APiQypINys0AQn1PI9NDzEEn4khDRYDJl+Lm17jRF32JKmhVLtO+QxljSmtXmjezj2K8gjBeQWOXXNvOvc4fQ/qLEzg=
X-Received: by 2002:a0c:d7c8:: with SMTP id g8mr4293396qvj.148.1586949472852;
 Wed, 15 Apr 2020 04:17:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200402201859.35832-1-andriy.shevchenko@linux.intel.com>
 <CAMpxmJVxQFUBkvQ8aDiybRab_xk+xy2GBgz0g=A6TVEDanRTfw@mail.gmail.com> <20200409150921.GG3676135@smile.fi.intel.com>
In-Reply-To: <20200409150921.GG3676135@smile.fi.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 15 Apr 2020 13:17:41 +0200
Message-ID: <CAMpxmJWvkC0_c8ehrYbbALOXQrtx5GcCX0FuDmBCRObhkzy7dg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] gpio: pch: Use BIT() and GENMASK() where it's appropriate
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 9 kwi 2020 o 17:09 Andy Shevchenko
<andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
>
> On Mon, Apr 06, 2020 at 09:23:30AM +0200, Bartosz Golaszewski wrote:
> > czw., 2 kwi 2020 o 22:19 Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
> > >
> > > Use BIT() and GENMASK() where it's appropriate.
> > > At the same time drop it where it's not appropriate.
>
> Thanks for review, my comments below.
>
> ...
>
> > >  #define PCH_EDGE_FALLING       0
> > > -#define PCH_EDGE_RISING                BIT(0)
> > > -#define PCH_LEVEL_L            BIT(1)
> > > -#define PCH_LEVEL_H            (BIT(0) | BIT(1))
> > > +#define PCH_EDGE_RISING                1
> > > +#define PCH_LEVEL_L            2
> > > +#define PCH_LEVEL_H            3
> >
> > If these define bitmask values for some fields in registers, then I'd
> > suggest to write it as hex numbers. I find it much more readable this
> > way.
>
> You meant
>  0x0
>  0x1
>  0x2
>  0x3
> ?
>
> But what the benefit comes out of it? There are sliding 3 bits (3 bits
> per each GPIO line), so this numbers in hex, in my opinion, will add
> a confusion: "Are they always in position 2..0 or not?"
>
> That said, I'm not against the change, but I would like to be sure
> what is the benefit.
>

Frankly this is just my personal preference. I think it's consistent
with the majority of codebase in the kernel but I won't block this
patch for that reason. Feel free to leave it like it is if you prefer
it.

Bart
