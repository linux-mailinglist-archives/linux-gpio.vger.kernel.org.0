Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B474C48FEFC
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Jan 2022 22:11:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233699AbiAPVLu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Jan 2022 16:11:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbiAPVLu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Jan 2022 16:11:50 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB0BFC061574
        for <linux-gpio@vger.kernel.org>; Sun, 16 Jan 2022 13:11:49 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id z22so57303725edd.12
        for <linux-gpio@vger.kernel.org>; Sun, 16 Jan 2022 13:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uCDean/5SAjUqGgOXHtr/6WuAMuPrdYnIkVC1Gu1hOw=;
        b=eBVrzbfvK41l4+V3Y7UUdnxSLz7HEu9ll4AVr/5JFBZqEAiI9pMnz5dUix6gIot0Xn
         8lCmJdCB9PcIu9fxeaea2JckoyG+XPjfcad9V1POJDJavkTEmHvmKLsmCl5pr0ajTZ7s
         23rT/4RshZLCFdoZW1WjAKKBpPMr1mYX6Be+GwfofXZpNyjrxsT1VloXFYbAqPEqKIwx
         ZK5lDLDP4n3kj+4vTsDUO4CwfQSs7G7xAxhiQm6pkCEKE+trcLf4WYMS7NFupJN/GurL
         J0cYa/QLaZ2HPATyWtOkBMn3G1pg9Ro0r1I/IjEd257c6N6iItnCiQl2YsKxXOOuc2ia
         V2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uCDean/5SAjUqGgOXHtr/6WuAMuPrdYnIkVC1Gu1hOw=;
        b=WW1u6ant/az6bCtbhCLWi40xdiG2O7jWaN5U7FYukTLjkKa7QVeN/z1dFouycrmMK2
         yhymFrpjXusnE3qRMXXE3P6R8RQDB38Z/Ly7Q7LTbjUZKVUiaI+H4/22Hc6a6wjQ8gcs
         CkYJTBsVLSveTeSD6JxybONO3ilfso9yRkJsBJLStep4xeOGa/yOJQwdy+IKIiH0Bdmg
         8E32uuqsMAxANPWEtRZaYrCXQiB0od6A+9GsCzZvNepm5lreBVkBk02OavXD/xwi4nyX
         Nk8X6342/2Uacs/j8zTLO1ZUxo44rC5HEIe5BojwLlHuKJ+w5fjsgaL2xGeRnDgNbfFS
         3g8Q==
X-Gm-Message-State: AOAM532esDTmuXQ78F21PxygZznVY+QnNfWEcVHOiWf6wzaXnQvfkCPF
        J8umW19xwKxjKi9frStO9zqJvvDgBb4YM5u5L2o=
X-Google-Smtp-Source: ABdhPJxpFCQz9jtRbBADYXKepIQ7rcb995skL2iRGm64ULAQC9e3IPJgVfwG+1n5WTK5EGxn4JO6tkSYcSHLFYUL7P4=
X-Received: by 2002:a50:eb9a:: with SMTP id y26mr6858754edr.125.1642367506992;
 Sun, 16 Jan 2022 13:11:46 -0800 (PST)
MIME-Version: 1.0
References: <e865361a-b75b-5a35-18e1-7136f3094d54@redhat.com>
In-Reply-To: <e865361a-b75b-5a35-18e1-7136f3094d54@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 16 Jan 2022 23:11:10 +0200
Message-ID: <CAHp75VfpyYuB5q+L6P+3RB52mK89=PfpHx4JG-AM=M3HaJ5D3w@mail.gmail.com>
Subject: Re: RFC: pinctrl: baytrail: Need to fixup mux setting due to broken BIOS/DSDT
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jan 15, 2022 at 6:45 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Andy, Mika,
>
> For one of the x86 Android tablets with broken DSDTs which I'm working on
> I need to change the mux value of pin 6 of SUS aka INT33FC:02 from 0 to 1,
> this changes it from a normal GPIO to outputting the PMC's 32KHz clk.
> This is needed for the jack-detection in the audio codec which needs an
> external 32KHz clock to work and that is connected to pin 6 of SUS.
>
> On the Windows version of the same tablet (which uses slightly different
> hardware, e.g. there is an embedded controller on the board which the
> Android version lacks) there is an ACPI call to toggle the mux, since
> the firmware does not set it for us.
>
> So the x86-android-tablets.c code for working around all the firmware
> challenges on these devices will need a way to toggle the mux and
> directly poking it itself is a bad idea because of the need
> to serialize all accesses to the GPIO islands on byt, see:
>
> 39ce8150a079 ("pinctrl: baytrail: Serialize all register access")
>
> So I see 2 possible options:
>
> 1. Add a pingroup for this pin in drivers/pinctrl/intel/pinctrl-baytrail.c
> and then mimick the pwm0 pinconf setting code from
> drivers/gpu/drm/i915/display/intel_dsi_vbt.c in x86-android-tablets.c
> This seems the cleanest, but I'm leaning a bit towards:

If you meant
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/i915/display/intel_dsi_vbt.c#L858
this is definitely the way to go.

> 2. Do EXPORT_SYMBOL_GPL(byt_lock); in pinctrl-baytrail.c and then just
> do a ioremap + raw poke of the pad_conf0 register in x86-android-tablets.c.

Sorry, I do not like the 2. at all. Let's keep that lock private to the driver.



> This avoids adding an extra pingroup just to workaround around the
> buggy firmware on these tablets; and more importantly this gives the
> x86-android-tablets.c code a flexible way to fixup various possible
> GPIO/pinctrl misconfigurations with needing to push workarounds into
> pinctrl-baytrail.c.
>
> To make sure others are not tempted to also take the byt_lock (which
> needs a rename before exporting) I plan to not add byt_lock to any header
> files. Instead the x86-android-tablets.c code can just do an extern
> declaration of it inside the .c file.

This is just a point to be against doing this. We are gaining
(perhaps) more cleanups against W=1 and CONFIG_WERROR=y and this case
might not work well with that (IIRC something similar in arch/x86 when
I tried that combination).

> ###
>
> Typing this out I think that 1 is cleaner and so far on a number of buggy
> DSDT Android tablets this is the only case I've found where poking the
> GPIO/pinctrl registers "directly" is necessary.
>
> So I guess I should go with solution 1 and if it turns out more workarounds
> are necessary then we can reconsider the (somewhat ugly) option 2.
>
> Before moving forward with either approach I would like to hear your
> thoughts on this, so please let me know what you think ?
>
> Regards,
>
> Hans
>
>


-- 
With Best Regards,
Andy Shevchenko
