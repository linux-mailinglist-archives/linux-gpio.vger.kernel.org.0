Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E73C2280D3
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 15:22:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726120AbgGUNWj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 09:22:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbgGUNWi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 09:22:38 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76BE9C061794
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2020 06:22:38 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id d1so10263925plr.8
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2020 06:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QMHbDOJmbEX2TZA81GQ3KeJR4BBa4aGgyNwifQrshzw=;
        b=twBblmj1N9FbHbLCPIEFqIuMw2r1QcvUqf2lf0lFwuG0atq+0M4kJuUDPIdih0KByF
         +TupCL4HkBcAd9yaQjlhe2VW+JxrYb61FBNclmyojYH9+RrjCrfrNszJ195/XyDuThss
         QeO3ZxonK1OSRAMsNA7RX+/XxsspATsybFRcGfBULtUsyg6LIK6lm2VUc+wcjHWFZOtg
         MJhL7pfnwsUMO+BhjrVtEa0zOASKYE62is3o+/Ric/NzfpW8qus80T/cokourO7M9bvG
         02kZIQHwoy1gAm54WzNuWFKbxaxfSY1FYmzNF6O2pE3VUCT1w02Uz3E4WBfgYyxitkap
         kbMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QMHbDOJmbEX2TZA81GQ3KeJR4BBa4aGgyNwifQrshzw=;
        b=ccpu/acU5bI9Ko+1Y9LIaHnoaN26wHC3+jqH2jUbmwM18APCjGb8z3lF+IMpJYuirO
         GFIx4br6MhJSfi7OtCR7pP6O9eeccIQMjzBEKloicb8uDaAwN1ymNc3TQ/g2K9vrlGTJ
         hkMUu8i7zQwV2WEZg8y6HYncJEUDru+p4A6eWBEYDfiqh0b8m3spARU5iPEXJqge0iOw
         ee3cgU0LzaOq1qqCoxQ5eCbCalPGqc0gTRrtcXbGl8Atq40XoD6iCT3pkaUZMkRbI/OQ
         imVJ9vOG3JNBRzzgCgkDm2WwuvSkbVhFv9sEYTIDrWmMRCcurDvciEsHN2HKIve6qv3V
         sLqg==
X-Gm-Message-State: AOAM531OUL2b7/iBt8bQBMKJkV7zSVPJonZB0mTdfhO3QgUWuZRAFeNw
        mlh/W9pCYgGubZZZ6mTIhSS7cFV4MQ1ZWFNba+Q=
X-Google-Smtp-Source: ABdhPJy0HeDAi62wI6IjuHAxUJ5k79abCJSb6s6G5QEbucTCcK6/DGWzNj4QR7IV/CCcnhIcVSpuQaYsIj9qXAzOu2g=
X-Received: by 2002:a17:90b:3547:: with SMTP id lt7mr4731991pjb.181.1595337758071;
 Tue, 21 Jul 2020 06:22:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200721103634.2939493-1-abanoubsameh@protonmail.com>
 <20200721103634.2939493-2-abanoubsameh@protonmail.com> <CAHp75VehVVJ+1Lvo2EAGpp-e7wAG6qnCUmkKQ6Bd-CXx0VfBtw@mail.gmail.com>
 <KJiWuMiRy-lnVTyC0Ttc7ad50JVDNkGCDSZgxinuZOfZBjuekFIfa6pk6jY05fS1zpTLHTVFkYuYl0DBq1xMk-GxXt9_2-Op51hTw0mEfhE=@protonmail.com>
 <CAHp75VeXfrGm4NQYx639PzFyn1u6j3FxEUn+6=KuHdojUUf3Pg@mail.gmail.com>
In-Reply-To: <CAHp75VeXfrGm4NQYx639PzFyn1u6j3FxEUn+6=KuHdojUUf3Pg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 21 Jul 2020 16:22:23 +0300
Message-ID: <CAHp75VdWS4r0O9B8MjT3swo5XbeF_YGvaDbfpgR=_zxQPBwLWQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: fixed some coding style issues in gpiolib files
To:     Abanoub Sameh <abanoubsameh@protonmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 21, 2020 at 4:21 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Jul 21, 2020 at 2:04 PM Abanoub Sameh
> <abanoubsameh@protonmail.com> wrote:
> >
> > So I only need to write some commit message like my first patch,
> > and I need to include the subsystem and also the file name.
> >
> > so it should be like this for example:
> >
> > gpio: crystalcove.c: fixed some coding style issues
>
> Better subject please, something like "Replace unsigned with unsigned int".
>
> > This patch make the code more consistent and uniform
>
> Something better, please.
> Like: "The unsigned type is slightly ambiguous to read, switch to
> explicit unsigned int."
>
> >
> > Signed-off-by ...
> >
> > Shall I resend all patches?
>
> Yes, and don't forget to bump a version number and provide a changelog
> (the latter after the cutter '---' line).
>
> >
> > thank you in advance for you help,
> > Abanoub Sameh
>
>
>
> --
> With Best Regards,
> Andy Shevchenko



-- 
With Best Regards,
Andy Shevchenko
