Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85370388CC6
	for <lists+linux-gpio@lfdr.de>; Wed, 19 May 2021 13:28:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346273AbhESL3W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 May 2021 07:29:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350640AbhESL3O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 May 2021 07:29:14 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17C9EC06175F;
        Wed, 19 May 2021 04:27:55 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id q6so7172215pjj.2;
        Wed, 19 May 2021 04:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FSH6O+80A3wo/ivtXXwOmyWUlPQ03Zp0wKm42ionk8s=;
        b=CqUSodm9Z8jO18w0IjUEIZkYHPe19OzUDy5rXTjhBiQDHftdcPdsdHeXmQHvHfGZCz
         4JK8jBkvZyqlfJBKHLdsR3knXqD5qS/EZtJuHYQIxyT+6/hpa3skDagG1zmhoLJlu6bf
         j8M3ks+bRRwqbHdqrlc5kcnAhTqqzkv9WNylSHIEXv+qdo+Yj2Vw2XzL/Jv8uoYNOiUu
         Jc3V79eFgL1r173MAQJlUYm/R2t2QVO75GqQRrcaxmHuskoj+OVQnJHppIj/CSyavXdD
         mWvIZtGZfpKcBncmWG6mGSltkb/w4eb3PhppdnAzosXm9cNvRJk7IzcFCDJo+IGJkSJQ
         psrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FSH6O+80A3wo/ivtXXwOmyWUlPQ03Zp0wKm42ionk8s=;
        b=EsFsSjGKmsJMrwPynEqCCs8EiHsdLPByaviuEc6XsVhQs3E0jmpgsrFtQN6Kxuxilh
         pBVJH0XvsmQMpZVjhlpgdS9bEKr3AZUl2unrRIQkyuyWNE4DwwGHbbAoIpkV0LSlOL00
         riwRoNyPjL0suRdkmhnlcuFV+0QNp0Faiy9ndTpAAVjX5OQYfRZWpIPC0j/yU+Mpqumi
         dALGuEJx1BZZxTICrsKQXgxJmcYqMIgqms2o+P95CahKWituQMPnrAX7Ua6EjpgVmsO2
         47PaTNClqzV4lSCzE8JQpo30ox3IMKVNjJQX/mZVAakJ9jEB8nhly1wt72ieO8fetVb3
         C4qg==
X-Gm-Message-State: AOAM533Kuo75GUO/HoZkzUaN5m3dIkpI8Y4RKFDeVxnH3I+p1Tz0IR5o
        RxOjAqdLts4qrpSNuWN3/Bv1xWPQIUW0rSolcdQ=
X-Google-Smtp-Source: ABdhPJyP1HNBiZ2lW0jaNnCTaTSQkThhbcODAxJ4yukhbFbL2DAB/9CWeluHHZynJGgoB0KlGOw64vNBGmC5YjznZIU=
X-Received: by 2002:a17:90a:af8b:: with SMTP id w11mr7040718pjq.228.1621423674579;
 Wed, 19 May 2021 04:27:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210516135531.2203-1-dariobin@libero.it> <20210516135531.2203-2-dariobin@libero.it>
 <CAHp75Vd8875hRNk1JK6gkmfxjqxBSu4cRNE1zJt9TyEW7TvsMg@mail.gmail.com>
 <1735504854.166374.1621346262270@mail1.libero.it> <CAHp75VeADiRKdfnsXQ=y3z1WAJBbtZ+P=8tdyYtVQpJrSrQ63Q@mail.gmail.com>
 <20210519100235.GA3063522@x1>
In-Reply-To: <20210519100235.GA3063522@x1>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 19 May 2021 14:27:38 +0300
Message-ID: <CAHp75Ve5sonh1qNgqqF1yr8OiuJVWXb-UJj+kzxQa7+R-YVoXQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: core: configure pinmux from pins debug file
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Dario Binacchi <dariobin@libero.it>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Vladimir Zapolskiy <vz@mleia.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 19, 2021 at 1:02 PM Drew Fustini <drew@beagleboard.org> wrote:
> On Tue, May 18, 2021 at 05:01:30PM +0300, Andy Shevchenko wrote:

...

> Vladimir Zapolskiy wrote in e73339037f6b ("pinctrl: remove unused
> 'pinconf-config' debugfs interface"):
>
>     Of course it might be possible to increase MAX_NAME_LEN, and then add
>     .pin_config_dbg_parse_modify callbacks to the drivers, but the whole
>     idea of such a limited debug option looks inviable. A more flexible
>     way to functionally substitute the original approach is to implicitly
>     or explicitly use pinctrl_select_state() function whenever needed.
>
> This makes me think it is not a good idea to bring back pinconf-config.
> The pinmux-select debugfs file that I add added in commit 6199f6becc86
> ("pinctrl: pinmux: Add pinmux-select debugfs file") provides a method to
> activate a pin function and pin group which I think provides the same
> capability as long as the possible pin functions are described in dts.

The problem is that the pinctrl_select_state() is very limited and has
no clear meanings of the states. Only few are defined and still
unclear. What does `sleep` or `standby` or whatever mean? It may be
quite different to the device in question. Basically what we need is
to say we want this device ('function') to appear on this group of
pins ('group'). And pinctrl_select_state() can't fulfill this simple
task :-(

If we look at the ACPI case it makes that API completely out of useful
context (it can be used due to above and some kind of layering
violations, like PM vs. pin control).

Since above is the debugfs interface we may return it for the certain
task, i.e. printing current function / group choice(s) (if it's not
done by other means) and allow to switch it desired function/group
(that's what Dario tries to achieve AFAIU).


-- 
With Best Regards,
Andy Shevchenko
