Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAEB4276B4E
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Sep 2020 10:00:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727166AbgIXIAV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Sep 2020 04:00:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727151AbgIXIAV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Sep 2020 04:00:21 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A9DAC0613CE;
        Thu, 24 Sep 2020 01:00:21 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id d9so1416679pfd.3;
        Thu, 24 Sep 2020 01:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=To0aSlyvMOiABjo5WrXnv8NiYSlJHdgzfcFUckkTy+A=;
        b=NzNraL9+txDHbbZlxYHyLJcahspbN0gIsmX89oLMorvVWqnCnUiyPcBUq9CJNmc36E
         EUPfx3K2layQexREq50ryDSmC4iuE8iYt3N8JXDWYb6V8tAZKf5FQqK6BvwzOJvArioC
         iQdCyjNwxr7571WEyqdHgO0ftf5TyVm/7/RDct2gS0XJWpsdikDKs34mWSXaV9eFgWzn
         tViTS+NsgxMYsT6gQMTJx1aD1gsapFtUmDBLUs9lnvanrU/zyRjUoaB0Q6Sd++lQwUHG
         mgaNFrJOxM/5woOrvIL4TKJWePYqrNBUGCoXUguUWDIydlZ4PHU9uT7oHZnk2WcVO8HW
         P0Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=To0aSlyvMOiABjo5WrXnv8NiYSlJHdgzfcFUckkTy+A=;
        b=Maoi071nX2JjG8z8PZ+NVBRvLH00BfZQmgfNvAJw5B27cHzeamqh/gK+C+CDWon+tz
         h/9MZlW4p2YXf0hhu8I1MefMr49Tlr0izE4SK0vC5ZTOI68tWpu609Qu4KtWDh7h0gwp
         DYptY5Iq5sYduDf9qaMjsEwQQbOTCjGInBakbX9bpGMTkn70fYbWoODtNkXhW3r063Bm
         JhCeebAtSXoqLK3EbqNsF073JCjKykcityd0K36sYQHcAqiItWfQXpEko8wvNWk05tj5
         o9I8b1hvVmi/RB3+xglQTO3/0GPdXedqIUIl3OGHfwZoE83DWfGv44/Esf/aseqRlK4u
         G8vQ==
X-Gm-Message-State: AOAM533wSJu1jG3hOBbnr/xujncA6vlMYtK7xq+QBtvKx1TGOzScG+nx
        y9XtBjq9fEktu7JEMUK5ZJFZ0K9CbdTWzw==
X-Google-Smtp-Source: ABdhPJytYniWgyDDj0q6Q1aY4phnl2KsbcDGE91L55MUhYJXEtwmacy45a7KVVJ7nIeBH4bUC5YiHw==
X-Received: by 2002:a62:6287:0:b029:142:2501:35d5 with SMTP id w129-20020a6262870000b0290142250135d5mr3520961pfb.53.1600934420534;
        Thu, 24 Sep 2020 01:00:20 -0700 (PDT)
Received: from sol (106-69-189-59.dyn.iinet.net.au. [106.69.189.59])
        by smtp.gmail.com with ESMTPSA id l188sm1894953pfl.200.2020.09.24.01.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 01:00:19 -0700 (PDT)
Date:   Thu, 24 Sep 2020 16:00:14 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v9 00/20] gpio: cdev: add uAPI v2
Message-ID: <20200924080014.GD17562@sol>
References: <20200922023151.387447-1-warthog618@gmail.com>
 <CAHp75VeXbTkSTVgrqmeL_taEHPDBMo-rekA767Y+YT1_7RYjdg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VeXbTkSTVgrqmeL_taEHPDBMo-rekA767Y+YT1_7RYjdg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 23, 2020 at 07:35:30PM +0300, Andy Shevchenko wrote:
> On Tue, Sep 22, 2020 at 5:34 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > This patchset defines and implements a new version of the
> > GPIO CDEV uAPI to address existing 32/64-bit alignment issues, add
> > support for debounce, event sequence numbers, and allow for requested
> > lines with different configurations.
> > It provides some future proofing by adding optional configuration fields
> > and padding reserved for future use.
> >
> > The series can be partitioned into three blocks; the first two patches
> > are minor fixes that impact later patches, the next eleven contain the
> > v2 uAPI definition and implementation, and the final seven port the GPIO
> > tools to the v2 uAPI and extend them to use new uAPI features.
> >
> > The more complicated patches include their own commentary where
> > appropriate.
> 
> For tools (there are minor comments, which not prevent to have a tag):
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> 
> For the rest I gave some comments but most of them are simply to
> address. The uAPI definition I agree with after Arnd's comment. I
> don't see big impediments to having this for v5.10.
> 
> Thanks!
> 

Thanks for your review - I nearly always learn something new from them,
and you can be picky pain in the arse at times - which is a good thing
for a reviewer. Apart from the pain in the arse ;-).

Cheers,
Kent.
