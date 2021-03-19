Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D45E8342122
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Mar 2021 16:45:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbhCSPo7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Mar 2021 11:44:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230154AbhCSPoh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Mar 2021 11:44:37 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A2ACC06174A;
        Fri, 19 Mar 2021 08:44:37 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id f2-20020a17090a4a82b02900c67bf8dc69so6923355pjh.1;
        Fri, 19 Mar 2021 08:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GCZHlMVbKbX32874y5u+F3c4bj2Tk2XhYaf8cu3E8HE=;
        b=l+O0jQxlTczTV3nNthVLdfWmQXIB3gKHaG4yeFD4Ch3O5eEVQ2ZT5M+KgYfraDLYN8
         c5NLJVa3eEsVNUjCwBPswPDo6cFwecwIQWZ2Vx4oWuUCx98qX+lu5wG7GKzi42Xhm1j7
         Uq2VMC/o4X0JZeFMW9w4qdT9l2KJqas7nixIERCSLSmzAVBEhesVNQr4CWi1eRZS2tRE
         kEzNr5EW2nGKbcBQBUb3g+JVLVhdqO6uySnrRoaRmif99WN8Y49tW6meh3OYsSHHbqAE
         kuUNCT5qng+A0irhlEvZFPzD9OoHfIJx6ekguEsGNRLofLuwBJN5wOjnRabxcHWRE2l4
         z/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GCZHlMVbKbX32874y5u+F3c4bj2Tk2XhYaf8cu3E8HE=;
        b=mBza0SSgLHj/UA+dfy1rL92WHp5VvLdshAW/Vi2nhGXv4Y2A740RZz5N3JVN+1jfn8
         k7MtTgxyH5hAPnyqwKH2+AKYU2IY9SDpUp18nT/Nwj6k3NToiuUW7qkTPpfU58jvAqhv
         /PZ2dkGcqCEvKiQGKBIelcg6ga+njQ1/ePzW9yg/Sgl1T3ICByoqLAsTeInULTm0zVLr
         OV+7OAcKE8FNA/ZyuXSTQCeBZDZ6FcanrlXZERE02iwtwU0J/OhwjOO/ntO/XkGBkCaP
         +OL0CrmTv1d2Bj/tuPN226uTJWW/EFAT8ilZiIn78dHBmE2GJVv9epnbVJref8YtkAiy
         +1nA==
X-Gm-Message-State: AOAM533wp0lurqYlbMju7xmcbniumGag++CtxUwyBxcFCpItQbt+xhjv
        e6PnqOsdJMoDPhOBbHyetxAS79XeosHp9PB/JtI=
X-Google-Smtp-Source: ABdhPJx/Lc6VFUnAZ5NXQDKS/FWEF+xKnRUgsjH1fwb9DAfFXqtKB4lG4veFgsiRirwW7QNWRapG3lWVPPF1ZmmQJDM=
X-Received: by 2002:a17:90a:b311:: with SMTP id d17mr10586290pjr.228.1616168676916;
 Fri, 19 Mar 2021 08:44:36 -0700 (PDT)
MIME-Version: 1.0
References: <1614120685-7452-1-git-send-email-Asmaa@mellanox.com>
 <1614120685-7452-2-git-send-email-Asmaa@mellanox.com> <CH2PR12MB38958655696585998CFDF67BD7919@CH2PR12MB3895.namprd12.prod.outlook.com>
 <CH2PR12MB3895A0BC2910997D8B64896BD7689@CH2PR12MB3895.namprd12.prod.outlook.com>
 <YFSl0Vrh04etK28J@lunn.ch>
In-Reply-To: <YFSl0Vrh04etK28J@lunn.ch>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 19 Mar 2021 17:44:20 +0200
Message-ID: <CAHp75VePjNR8NcvHiDPuryzmxvntenUDa3OgHchoxu_4k+Nc=g@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: Support interrupts in gpio-mlxbf2.c
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Asmaa Mnebhi <asmaa@nvidia.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        David Thompson <davthompson@nvidia.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 19, 2021 at 3:24 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > We cannot really pass it through the ACPI table because the ACPI
> > table is common to all BlueField-2 boards.  And each board may have
> > a different GPIO pin associated with a particular function. This is
> > why we use ACPI properties instead of GpioInt(). So that the
> > bootloader can change the GPIO pin value based on the board id
> > detected at boot time.
>
> That sounds very broken.
>
> ACPI describes the hardware. If the hardware is different, you need
> different ACPI. And i assume the ACPI spec says GpioInt() is the
> correct way to do this, and does not say you can hack around
> limitations of your bootloader using properties?

It seems my reply didn't make the mailing list, but I'm on the same
page with you.

On x86 boards the difference is usually provided by firmware via NVS
and corresponding macro(s).
One may google for any DSDT for x86 and check for, for instance,
GNUM() macro and Co.

-- 
With Best Regards,
Andy Shevchenko
