Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCF262D80E3
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 22:17:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732606AbgLKVQc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 16:16:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727234AbgLKVQT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2020 16:16:19 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D7A0C0613D3;
        Fri, 11 Dec 2020 13:15:39 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id t6so5228607plq.1;
        Fri, 11 Dec 2020 13:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZAqTN7N4s0ZVaTdEPOvyAv38va5XxW6WW67wTQBqGtA=;
        b=fh8vsjetqBmGgt2HnPCppc+aTWU9zdYuewDF62lfABoiTULIOgkY7VcNDHtzOc+yPu
         X0+TbboHlf1+YHJu26LbOsmZoKwLD1Jdmo0lAwe1mvggIuxHgO2gB5IuzVg0D9OGtoJk
         299rjy1oz5tCux8CmbrEQe7EkVd4bpUgmyUrepKTw+D3tZo/LDpvD0Tb0ZPh1Um7BM2W
         XL3WJl0o4axyesDjSDopkI+l6UK9bZWpCmA+L2Poo3lde3ty4aNXu9IYgrujxcq7Nd65
         P7hluddTs9WxONybduqmdr/93uvpDsEhyh7tzNBg6eJTydOyajsAJIDtgQeXiI5hC8vO
         xLug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZAqTN7N4s0ZVaTdEPOvyAv38va5XxW6WW67wTQBqGtA=;
        b=c331EQZ20PMkZYROoVepXVyxmOjU66gwTPa3bkQ8LZiTUOg9EyZKUwiq1BWdRLC7P8
         cedC9tKxMxRUU0+9k/nNUmHo4j9eKqNBZ/tCUg0eKaH5uPU6kdSskAe3WqB44kGqKf3v
         9+aXthHqfYMgKgL1DKbd0KYSQG+ljjqt/DmyoeomtqlbC0thXzjQP9Aba/z+4EZyRvNz
         fn8YopsnurPm3RAVTVznnhTab2h3TMpY8wxlX7NtRrq+EKata8zz2Kg/j62jANPRowDT
         NuVMNE0/gniFfQfrwFgfhWAmyHD57e1xIGeaROzxkO01UhJOPcFcThqxrbo1jXLWfY+l
         /PSQ==
X-Gm-Message-State: AOAM532qxEYzIUzEp9noda0P+EQ4z8jeRWoURV+ENs/njolPQavopcrQ
        FuBuN5naBhih32nZ0Y51JRiPeEnAxroMe00PUbc=
X-Google-Smtp-Source: ABdhPJzmmKzahJ/XvSBVJsfd4c4acl75rWY0X7yiaQtx6soKBC6UxakhXag9pzCfAtRhiQk+Ji8Qn7i52iMN8ndGB9Y=
X-Received: by 2002:a17:902:e98c:b029:da:cb88:f11d with SMTP id
 f12-20020a170902e98cb02900dacb88f11dmr12535178plb.17.1607721339002; Fri, 11
 Dec 2020 13:15:39 -0800 (PST)
MIME-Version: 1.0
References: <20201211042625.129255-1-drew@beagleboard.org>
In-Reply-To: <20201211042625.129255-1-drew@beagleboard.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 11 Dec 2020 23:15:21 +0200
Message-ID: <CAHp75VcAbdrSnb_ag9Rc0tny3Vtqjs1if+ahk7U36V2eaKMpSw@mail.gmail.com>
Subject: Re: [RFC PATCH] pinctrl: add helper to expose pinctrl state in debugfs
To:     Drew Fustini <drew@beagleboard.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Pantelis Antoniou <panto@antoniou-consulting.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 11, 2020 at 1:54 PM Drew Fustini <drew@beagleboard.org> wrote:
>
> BeagleBoard.org [0] currently uses an out-of-tree driver called
> bone-pinmux-helper [1] developed by Pantelis Antoniou [2] back in 2013.

And it looks like it's still using APIs from 2013.
Needs quite a clean up.

> The driver assists users of our BeagleBone and PocketBeagle boards in
> rapid prototyping by allowing them to change at run-time between defined
> set of pinctrl states [3] for each pin on the expansion connectors [4].
> This is achieved by exposing a 'state' file in sysfs for each pin which
> is used by our 'config-pin' utility [5].
>
> Our goal is to eliminate all out-of-tree drivers for BeagleBoard.org
> boards and thus I have been working to replace bone-pinmux-helper with a
> new driver that could be acceptable upstream. My understanding is that
> debugfs, unlike sysfs, could be the appropriate mechanism to expose such
> functionality.

Yeah, for debugfs we don't require too much and esp. there is no
requirement to keep backward compatibility thru interface.
I.o.w. it's *not* an ABI.

...

> I used the compatible string "pinctrl,state-helper" but would appreciate
> advice on how to best name this. Should I create a new vendor prefix?

Since it's BB specific, it should have file name and compatible string
accordingly.
But I'm wondering, why it requires this kind of thing and can't be
simply always part of the kernel based on configuration option?

> The P9_14_pinmux entry would cause pinctrl-state-helper to be probed.
> The driver would create the corresponding pinctrl state file in debugfs
> for the pin.  Here is an example of how the state can be read and
> written from userspace:
>
> root@beaglebone:~# cat /sys/kernel/debug/ocp\:P9_14_pinmux/state
> default
> root@beaglebone:~# echo pwm > /sys/kernel/debug/ocp\:P9_14_pinmux/state
> root@beaglebone:~# cat /sys/kernel/debug/ocp\:P9_14_pinmux/state
> pwm

Shouldn't it be rather a part of a certain pin control folder:
debug/pinctrl/.../mux/...
?

> I would very much appreciate feedback on both this general concept, and
> also specific areas in which the code should be changed to be acceptable
> upstream.

I will give time for more discussion about concepts and so, because
code (as stated above) is quite old and requires a lot of cleaning up.

-- 
With Best Regards,
Andy Shevchenko
