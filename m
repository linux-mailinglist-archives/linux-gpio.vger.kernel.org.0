Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C37145F752
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Nov 2021 01:03:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234145AbhK0AGw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Nov 2021 19:06:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229919AbhK0AEw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Nov 2021 19:04:52 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F322BC06175D
        for <linux-gpio@vger.kernel.org>; Fri, 26 Nov 2021 16:01:38 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id v15-20020a9d604f000000b0056cdb373b82so16043372otj.7
        for <linux-gpio@vger.kernel.org>; Fri, 26 Nov 2021 16:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GFZrzA0jxjETYkF9aMTtWQdvIo/l4nQkw2oBR8HPmZc=;
        b=QnWxPOIS9lJyWpCmqDktsalfwrTmqnCHX272mQGdMx9Lb3/EA4+ub4x1+TNv71uDeE
         eu/maix1OK5j5y8BkAyUPsI7e8uy1NsWzz4doEemV5zaPLWAwvF3jgHlkV+r5bE6v4ZK
         RTjkQUMNBnayFxjEFAF3e8Da8UA5rsUmeYrIcIJ8F+DP0fuFoCFLX3l5+xxrKCNm0VQj
         na0hvoCPCNXbAB5kTrXao7rKuiJncw7ShXY+WxgC9CtSTVA/si5pLwsUC+exengAZHJs
         AcG9E2RPyVnbxECsM49pjv8hq9tJtP2mry7fyF42ChSjj6UaxVlA7vXtuT5GxoAOJ1/e
         tHMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GFZrzA0jxjETYkF9aMTtWQdvIo/l4nQkw2oBR8HPmZc=;
        b=Y2E2K43jRCTIzxbIuLp3XRuSJsiJ3+9ltccKLnNoUWpU8Jt/fkepV+tOew1nH7Zn0k
         bYCcSh07Pp/1kd/HESJGa+puJ7h4NJ/gF3wpmO+35vfeBBvplktmfrT+007REMI+xW/3
         eBb+UxvmS0pTKEK60hC1PDLC7RuGIHmIuiWZneNyKYr1MZjcIrEKcmiQf0bFmP1Bc6l6
         DvoZDFixO+srV69B7iuXiWOOJuVF2Vy9+lpKB0TuzWrt+kgZJ+UyXu6ZH7X05jZs73qd
         UqW1/W194Q7EVPwmhw/xr3ZAeh6aRlA34XWTe3O1AQ/JL4lXjT9k2/IGSVBBmkq0HJdF
         gBXw==
X-Gm-Message-State: AOAM5308C8XYzvxZCtrSKZqVvwjETPkJpbwF1F5shb0mB6fWSdfoppyH
        BY0wDrZxAXAuA6ocnky1Ik2fRcEuv0iBm2qru2MrSA==
X-Google-Smtp-Source: ABdhPJxDFKraB9n6M4yJpnw3WtaUG34JBo+a6sXyWQ64dy+9now2K7PA07DEHBuGA5p4SME3zVG7U30I7G2xMbllYaA=
X-Received: by 2002:a9d:74d0:: with SMTP id a16mr30020511otl.237.1637971298349;
 Fri, 26 Nov 2021 16:01:38 -0800 (PST)
MIME-Version: 1.0
References: <20211121165642.27883-1-joey.gouly@arm.com> <CACRpkdbbj_PapRXYv61Dt8369_qqQx97t3o=FyFUY7s1ThytMA@mail.gmail.com>
 <CACRpkdZO=8efvoVnSE_Oc26grv-UWNzN97f-SoUjm-jGG7AFzA@mail.gmail.com> <20211126223029.GA34315@e124191.cambridge.arm.com>
In-Reply-To: <20211126223029.GA34315@e124191.cambridge.arm.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 27 Nov 2021 01:01:26 +0100
Message-ID: <CACRpkdb3ReQKBPFh7FESdgsFUBu0=isaFVuqz3o-iq8w68EEsA@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] pinctrl: apple: misc fixes from post-commit review
To:     Joey Gouly <joey.gouly@arm.com>
Cc:     linux-gpio@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hector Martin <marcan@marcan.st>, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 26, 2021 at 11:31 PM Joey Gouly <joey.gouly@arm.com> wrote:

> Sorry, I see the problem now. I thought you were appling the patches on top of:
>   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=for-next

No that is a mix-down branch for next. I apply the patches on devel...

> Which has the commit by Sven (9b3b94e9eb14a "pinctrl: apple: Always return valid type in apple_gpio_irq_type").
>
> I can rebase onto devel, but you will get a (trivial) conflict when merging devel and for-next.
> If that's fine, let me know and I will send a v3 based on devel.

No need, I just merged in v5.16-rc2 as this has the required patch,
then applied these fixes on top, now it works!

Yours,
Linus Walleij
