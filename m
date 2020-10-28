Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CA4929DD0B
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 01:34:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732116AbgJ1WUL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Oct 2020 18:20:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732113AbgJ1WUK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2020 18:20:10 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B22BDC0613CF;
        Wed, 28 Oct 2020 15:20:10 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id bl9so557968qvb.10;
        Wed, 28 Oct 2020 15:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LiActt/QR3lFvo7rRVBqlu54ttigfun7g4+qcOD7s00=;
        b=QE/ZRXrukwmpguz8Fsq0h1CFmEneEhqlnsM80Aok34g5UaeOJBoN/sbr0qr+048SVb
         mPKeXkvUqYwK+cupjxPL8RgonM68gZgyuZFunJvFiKCSv1rE1Li7MLrSCia7RiQKWc9/
         2dAQ9z8ZdVyUPmrp7ZCk9jjBE/bdbIPtKH96aJ6JnF1mHQ84OIseApuaQJNbkXqP3mKY
         3xElIY2UgsV6JLOrQ6Ax99Sa7nnHDIxrPgyPLU77iYHVi/rk3buCSR+Uad/QeNOXrG6B
         ru8m0VCBOFmosMs/2X+vKLXky+mFshFOzj5jbI7leG4eXi2sJWIlol17FwDG5gVbwOH7
         xEqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LiActt/QR3lFvo7rRVBqlu54ttigfun7g4+qcOD7s00=;
        b=SF+XDvo/zYek6qWtXUf6WhfaLXgL7JkrD5MgP/m54jY9tkF3FOfCbO3ABGZcAJRHgF
         qWm8hKm1IZbwVUtaDvMURV9ilSl9iluqVUmqybJCNWMg0Hh3JigVT1Y4dfDpSg0b+UdO
         +2zp95v4PLDQqx+KDi3RBxdfexEioDg1jWEimyOKwAXYLMlCcFanJVX0fdpIPuefUfNj
         xrkoLoY6TVFCmeyja5tpnVuihEldKaCRc/htVx9WEynXgY/40fgxMx0CdU+JNRTQmUJO
         Nlj7O7B5c5NQhHhCHg/pZ/GP6PEhKNt2+uZP/C111sxaVQQLx3SiADJ9I/m7hvMAWIWm
         H//A==
X-Gm-Message-State: AOAM533AvEIecwzM4LUwuT7R38P4gwfJ0tqk0lSbj27bTDCMmoI/M1dp
        cYEljWKKuOkrzV5+b+IozRUzcM1mjzyG3FMssxlZVZARxwI=
X-Google-Smtp-Source: ABdhPJxVnE52ylR7rhQf3AchvsFi7nrHeNHDnjVpiDA+ixWh48JI6oCIW3zrvGOkxYEJcEssoo90ba7uIqYxK783g48=
X-Received: by 2002:a17:902:bc4a:b029:d6:7ef9:689c with SMTP id
 t10-20020a170902bc4ab02900d67ef9689cmr772611plz.21.1603916744591; Wed, 28 Oct
 2020 13:25:44 -0700 (PDT)
MIME-Version: 1.0
References: <20201027135325.22235-1-vincent.whitchurch@axis.com>
 <CAMRc=Mdjm8tgxF_76T3f6r3TwghLKtrFtUv7ywtX3-nEQzVGtA@mail.gmail.com> <CAHp75Vff1AyKDb=JiocsAefnft+tcm+BnuWDrxViQqZAQZjuVg@mail.gmail.com>
In-Reply-To: <CAHp75Vff1AyKDb=JiocsAefnft+tcm+BnuWDrxViQqZAQZjuVg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 28 Oct 2020 22:26:33 +0200
Message-ID: <CAHp75VeQnYB79EyXbBDT1UN-ekCA_wWPuDoEenFUBdciGPzPkg@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mockup: Allow probing from device tree
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Vincent Whitchurch <vincent.whitchurch@axis.com>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        kernel@axis.com, devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 28, 2020 at 10:25 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Oct 28, 2020 at 8:41 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

...

> It's not so. If you drop ugly ifdeffery (and I vote for that, see also

It's not so -> It's not so simple.

> above) the of_match_ptr() must be dropped as well.
> Otherwise the compiler will issue the warning. So it is either all or none.

-- 
With Best Regards,
Andy Shevchenko
