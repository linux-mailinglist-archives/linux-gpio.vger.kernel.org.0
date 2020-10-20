Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BC3A29451D
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Oct 2020 00:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439004AbgJTWYs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Oct 2020 18:24:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392629AbgJTWYr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Oct 2020 18:24:47 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 812A6C0613CE
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2020 15:24:46 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id t22so129424plr.9
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2020 15:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=h/mcA3yUmmgvON3pX043ECg03ofWZWSxWcXegQGMoUU=;
        b=EQggOnE89b+aBneMYvZdzOboxfPMjPEFc0v5LKMcd8Ukm/C9OenblzVb8kODReSf5D
         t8HxjiC3FDiJQBJHBxlYKsHjdJ2e0gxt9Qms69SVcMRMN3BjKW2pZyb4V5aD9Jtf6YEB
         YktM4KWpj5fQwZeF+Zr+p4vDHm538vzFyF1/aN4CcvKzIN51WpLWR6lKZEw42psnB8ZL
         ZVpZqBlM0Zj5KvZXv1roLEhHaNJyXz+sQ3F1NtbKiA0bQtGYl5C9m2BLl/LQ52RJ2TpN
         JZI74EDjzaR38MmTcGwcK8J1ZVMHAUKV4PFwDzum7JVbTTo83XVm7kE/G1q2I5odM79p
         5xNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=h/mcA3yUmmgvON3pX043ECg03ofWZWSxWcXegQGMoUU=;
        b=EdhYzlvAdbZATZDd1n1an7PB3MHUciMNsN2WWElaRmsGr0VvrUNgL1ZRMRq4XqcCyp
         A4r6L0+f/xZBeAaRyktw7boUi2PN70sBGxqdiRstKobBDUvhu9NiWMfYP93QUyKmTfe+
         FdvpI5vQS0kkfyqEjvi6PaI6nu0iQkJeXu5qPVkY6Nl3ZsKK2ARqDxOiFNOZa/YZoj+7
         BTmgi9QyvmyVHjRpZPYjbfgNj686BAU7TtTguyFiMNvTG/sVHmBXl27jbFroqWdgU8+e
         7lyF6iqrCi0Nd5ZxzivK1NAu6LawMAT+DmQEQFbAUjaguY9Jlo3c4Vhkc8Efr+e0rwYS
         aNnw==
X-Gm-Message-State: AOAM531zjuSVnSUSLdrFs7bR0FxOMBRpH73C1NN5DvGQu5QifdNyz/h7
        cM0da5aKV7RtWHlqYd3uQFs=
X-Google-Smtp-Source: ABdhPJzOqPE2AXGeA/TKsPfiVAwgypslpGTgzpqy2AMYJjHNcZLHJlP5VhMC00YbVrCJPDHP0139GA==
X-Received: by 2002:a17:90a:e997:: with SMTP id v23mr221635pjy.195.1603232685785;
        Tue, 20 Oct 2020 15:24:45 -0700 (PDT)
Received: from sol (106-69-182-59.dyn.iinet.net.au. [106.69.182.59])
        by smtp.gmail.com with ESMTPSA id q16sm48688pfu.206.2020.10.20.15.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 15:24:44 -0700 (PDT)
Date:   Wed, 21 Oct 2020 06:24:40 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [libgpiod] Rethinking struct gpiod_line_bulk
Message-ID: <20201020222440.GA4920@sol>
References: <CAMpxmJVWr-M3R-PfsrDvtpZTtSTBLHL95sAorO5EHVwg1eX67A@mail.gmail.com>
 <20201013005252.GA9387@sol>
 <CAMRc=Mf_ZG5FqEAd0CSCqx_GeEG_4ghEXf8S3Sdws4+XOFV2Ag@mail.gmail.com>
 <20201013085310.GB3119809@sol>
 <CAMRc=Mc_kNmWBUhyxMHvr9bComG03=_rR4KM8X4wgzkqjK6FZw@mail.gmail.com>
 <20201019162142.GA85778@sol>
 <CAMRc=MfoqJURP_X5uhMe4Gz=5h55pHpq90cNZmocA+rkMgb99Q@mail.gmail.com>
 <20201020150558.GA17003@sol>
 <CAMRc=MfbVTZF_=e7dtLEtKMzd0WQfEPBVzYDaamkyUZWoxbeoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfbVTZF_=e7dtLEtKMzd0WQfEPBVzYDaamkyUZWoxbeoQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 20, 2020 at 05:53:31PM +0200, Bartosz Golaszewski wrote:
> On Tue, Oct 20, 2020 at 5:06 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> 
[snip]
> > >
> > > I'm now actually leaning more towards making it opaque but I need to
> > > find a way to make gpiod_line_bulk_foreach_line work with hidden bulk
> > > struct.
> > >
> >
> > Why not just drop it in favour of gpiod_line_bulk_foreach_line_off()?
> >
> 
> The one with the line being supplied to the user automatically is more
> elegant. If anything - I'd prefer to drop
> gpiod_line_bulk_foreach_line_off(). Callbacks as suggested by Andy is
> a good idea - something like what GLib does in a lot of helpers for
> lists etc.
> 

Not sure what you mean here - they both return the line, the difference
is how they store the loop state, with gpiod_line_bulk_foreach_line()
exposing the bulk->lines array via the lineptr.  That is the source of
your problem if you go opaque - that array becomes hidden, as it
probably should be.

Cheers,
Kent.
