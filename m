Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B23431BDC73
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2020 14:37:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbgD2Mh5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Apr 2020 08:37:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726628AbgD2Mh5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 Apr 2020 08:37:57 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65464C03C1AD;
        Wed, 29 Apr 2020 05:37:57 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id 7so2291388pjo.0;
        Wed, 29 Apr 2020 05:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wEFj1LbbBZbuf64ktJeqB0BNoaslLRMTHF58cVKJVS0=;
        b=TptblHra4+AZt0TguWbljkKi6DxQrlS/2/vpgendjeSnrE/wFRa+ylLRYbndB0+I2m
         rQ22rgQs5KvnHi6W6X0Zoz4HqXgdPXjverIgghrkyMQWxZ/yY45FOq0tItfxBzKvfVJk
         BP16C0I4maFq3tneQ7ITZBCmdI6S2EHwdJSHttPJ6pLXnTNMAYAnKaNmryYpSGZ1y3oF
         dsMPdFxLKoCPJBbGX3wLlL/Jdieuag3Z3JNBFrXG78ahVqEILanbHCYggXOur9DaQuNa
         HpxDyxjcKte68ZX8dRT3pRu8HdYCguwkiHVxbN9jEOXI9b4cCJIFgrNpB2CYC2Q0gcxX
         e8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wEFj1LbbBZbuf64ktJeqB0BNoaslLRMTHF58cVKJVS0=;
        b=j9WAAfF8tPSRoqbMN83BMWPkcjfSrQc1x/jiUj8ncq6zTLVZ1YpC3LbqsOdEh/dsbL
         3JhWiceIpz18ax00l3S6Ps3CL9EHu63QrbD07fbbOwPLF1oyQI/4dDkFMP5FaKjV56z/
         H52BLAMf/fvlbfMc1JiINn45lzktvdyIq3gX/05xI090XIBSKx92bEscmJaYP8/vZdz+
         JOdnlMEzEmKKX3/4qLRuRgVOjOPm+ezwX7P8GO9JRa49yJrW2azG1LDXVQVjJvkPlaRm
         sD9+nvoanwmRfJkV9nnpcNp5nrMEPNuamz6tyj2HEi/proFf3xiLSQ8Ve1AGH8u6O3Mt
         z5WA==
X-Gm-Message-State: AGi0PuaZfnElqaXAfS4LJYJpPn7EA6uNPKE2mZc0Ox+q/1WgrTDrvg9E
        KP/JlDX0IzgvlkRFepiJ4IC8DwIPpuLEi7oSBWE=
X-Google-Smtp-Source: APiQypIFpnZdkxuhU0+p6m2FgZDl2Wuu2ZFCmn25lT6Qu2Esq/RjJvVUOMrO+4djlRQBgV7Eefx4VlzoK6cDWruxP78=
X-Received: by 2002:a17:90a:364c:: with SMTP id s70mr2915977pjb.143.1588163876955;
 Wed, 29 Apr 2020 05:37:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200320093125.23092-1-brgl@bgdev.pl> <CACRpkdZgWUwmmuXn12DS3TsQS0yQxcweqK6HGxBm=V_2LBLBMw@mail.gmail.com>
 <CAMpxmJUb09KGreHw6Bdz79rbnQE7oZnWg_5qN_FhzoS2-XccFA@mail.gmail.com>
 <CAHp75Vdpb=hNiR3c7G_yTeSt70Vcy3DWHin0B5+WYV1hbRMBJQ@mail.gmail.com> <CAMpxmJVT4wm26hQB-_BV73tC5_nqH5JG9KmDuNQ2OJe+tE+gLg@mail.gmail.com>
In-Reply-To: <CAMpxmJVT4wm26hQB-_BV73tC5_nqH5JG9KmDuNQ2OJe+tE+gLg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 29 Apr 2020 15:37:50 +0300
Message-ID: <CAHp75VeGQzXfzzRR2EM5zwb8EfiyxAOJFqQuAFH-C2zdNAGjYw@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: don't call sleeping functions with a spinlock taken
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 29, 2020 at 9:40 AM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> wt., 28 kwi 2020 o 17:53 Andy Shevchenko <andy.shevchenko@gmail.com> napi=
sa=C5=82(a):
> > On Tue, Apr 14, 2020 at 6:35 PM Bartosz Golaszewski
> > <bgolaszewski@baylibre.com> wrote:
> > > wt., 14 kwi 2020 o 14:00 Linus Walleij <linus.walleij@linaro.org> nap=
isa=C5=82(a):
> > > > On Fri, Mar 20, 2020 at 10:31 AM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

...

> > It looks like we need a mutex less function which can be used here and
> > in the call you are considering racy.
>
> The thing is this mutex is in pinctrl - we'd need to export it too so
> that gpio can use it.

Oh, I see now. So, something like

pinctrl_ext_operation_begin()
....
pinctrl_ext_operation_end()

perhaps.

--=20
With Best Regards,
Andy Shevchenko
