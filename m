Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5992A32AD26
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:15:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381789AbhCBV0H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:26:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1579852AbhCBRLF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 12:11:05 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 237B7C0611C1
        for <linux-gpio@vger.kernel.org>; Tue,  2 Mar 2021 09:10:24 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id ba1so12405507plb.1
        for <linux-gpio@vger.kernel.org>; Tue, 02 Mar 2021 09:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CdMoJcE0m1+Gc862ONew3KTMSSsBSZjEgZBWswhQw2s=;
        b=mhDJEJLvtrFYrUnEtZAClfLdle7whH352etVUC6MMVnLIGqq3Hbd5GpQY+5JxRkceO
         Hbr8wqp9p28EpLFHKYklWTAlGUkGuIaJKn5fc7BRHG3lw87qoCicqpznfXKjUYp0eWpi
         TjUfki2yEtKwMFul0k4b9DDooHwJHTWY9tF8sCmEspQ0fJFIPCcrOWuBtnxl0VwzSI4S
         d3zqE9VCjpxwf6iSygtjaAkBiWrW9PJkEVSl6TbeyzoPHCZ0o/2vjmHCJirV5F1ZmraX
         tJT/iIs0kLnYb9zrE4DGrF2pQWeiD1wYeaCfvN8NV8GPcGj9f9dhQkl0+yJ/mPp5fOQv
         jJLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CdMoJcE0m1+Gc862ONew3KTMSSsBSZjEgZBWswhQw2s=;
        b=IZo7toVIZohWw1DjsnbVQpkPRDwV020OYpD8rFcbZ0n4Fmxhf9lVl9fklWy2Udwepe
         NXopg4KcAYrmf9IfZv+BjPnWpmVheZW4ueQK/QTVTdWs3JcoRmLQFUFrqdEZYKBsltsr
         fGXLz27UZP7mEXcAZwUKezwZF/SBC7WXf/U6/diGozJ9rrUzDyrKs3fxNF7eW2YRn7Rh
         Ur4V6LHtqBZBzfl4kNsYoYqhZ5x6ViK0lEQgvcOzgZYU1UH+HvC5PGfRcYCC5OS+HkSi
         mfl/VmT7rEkKSpwLbw2Cku+fALP4s0G4QoBKCIEnEjTplEvMekP7L+jr46SW20FYNY0u
         McUw==
X-Gm-Message-State: AOAM532tM1W/kA37W7CQFNM0Uxjt8RGBFnsYBHxkaW7SljCtdFhwzlRO
        StaoWhMaA6nSGqnAo3CylvmnIg==
X-Google-Smtp-Source: ABdhPJwS/GLIzqKI6SrB5tX8VcFIEJQfG0WQAgcTI96S8UNSp9dO4Mpm64Bbtj1yZZQCtYzLnlaeSw==
X-Received: by 2002:a17:902:509:b029:e5:9944:f763 with SMTP id 9-20020a1709020509b02900e59944f763mr4375554plf.35.1614705023680;
        Tue, 02 Mar 2021 09:10:23 -0800 (PST)
Received: from x1 ([2601:1c0:4701:ae70:a9bd:47d6:c119:b0d5])
        by smtp.gmail.com with ESMTPSA id g7sm19314501pgb.10.2021.03.02.09.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 09:10:22 -0800 (PST)
Date:   Tue, 2 Mar 2021 09:10:20 -0800
From:   Drew Fustini <drew@beagleboard.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Joe Perches <joe@perches.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v5 1/2] pinctrl: use to octal permissions for debugfs
 files
Message-ID: <20210302171020.GA1547128@x1>
References: <20210212223015.727608-1-drew@beagleboard.org>
 <20210212223015.727608-2-drew@beagleboard.org>
 <CACRpkdb1-OqZU93nMD+iztPOfLEn3-j+-=uTEo+zbE2TmezmLQ@mail.gmail.com>
 <CAHp75Vcvo8v-emHJZ+9fiTg+Vv26Apotnm8nD8rF550VgY-5gQ@mail.gmail.com>
 <CACRpkda8rn94ks+aduvVqQuR4LLEZEKT2ja6rrk8sk_bDNSTRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkda8rn94ks+aduvVqQuR4LLEZEKT2ja6rrk8sk_bDNSTRQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 02, 2021 at 05:22:37PM +0100, Linus Walleij wrote:
> On Tue, Mar 2, 2021 at 11:23 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Tue, Mar 2, 2021 at 10:36 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> 
> > > Patch applied, thanks for fixing this!
> >
> > I guess we are at v9 of this.
> 
> Yeah I took it out again waiting for the waters to settle.
> 
> Yours,
> Linus Walleij

Sorry for the confusion.

"[PATCH v8 0/3] pinctrl: pinmux: Add pinmux-select debugfs file" [1]
sent Feb. 20th was in my opinion ready to merge.

However, it occured to me yesterday since there had been no replies to
that thread, then it might be a good idea to add a 4th patch to rename
pinctl.rst to pin-control.rst. I sent that yesterday as v9 [2] but I am
fine with that being dropped as renaming pinctl.rst is unrelated to my 
actual goal of adding pinmux-select to debugfs.

thanks,
drew

[1] https://lore.kernel.org/linux-gpio/20210220202750.117421-1-drew@beagleboard.org/
[2] https://lore.kernel.org/lkml/20210302053059.1049035-1-drew@beagleboard.org/
