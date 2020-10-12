Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB2EA28BAB4
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Oct 2020 16:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389395AbgJLOWD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Oct 2020 10:22:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388662AbgJLOWA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Oct 2020 10:22:00 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08B9AC0613D0
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2020 07:21:59 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id d6so8657777plo.13
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2020 07:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Wzz8Mf3ACjU/Gd60Jyhd4C99KOxi/vv2vBnxDmxwiZU=;
        b=nYL1GZKB9wH9wz0BVouan678MZwIA+iF0v0xfc/rAD5ClRrIJn2nqRqcrvUHp5RAmp
         pLA8HNYrEpaUpllX5Or4Oqrkn6xSXO9hg7814attMpw9Iff5g5qSif7OSrmFnpt89kIm
         743y3wv4l0xBO+4cZJ2PwmkSPcURFLVIqrX5uz36TnTfdNnupUbOEG6ahGijT/pUPZMi
         uudxM01JqofIuyoMiW6OB6ryhA5r++PFO1mZhKDGbhbU3AIfgDikFyobI+Dw6NS9jddD
         GEf2hK6RMWq77uiFtxtEniNj+2samoQX3W69Jx+855JcOwVm8ToYWAqn2fVqknkF68Ap
         6v0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Wzz8Mf3ACjU/Gd60Jyhd4C99KOxi/vv2vBnxDmxwiZU=;
        b=AxhImFT5wOnAFXhC08j3HC5pwNx1NsymnYn+sio/3k/6egQypAr557lDrzd/0kACgt
         zKKq+X06HRX8aMm/30PhLHFAqkD9dIf0dHST+Bqizg53HsApTxoGM4OYk7Z3xi6GNcQx
         Mlx4NK4g4V7c3Yf6W9tsTrHd4yG5HewTGZoh68Cge25n8ntwKHing9zKTqg6EZzoVoeg
         sfxRkggENI161+y0ExUJ1F2dGRipu+qvQtMQRFwFH5PaE3oCvK3nPPzHYEftfzmvHxUN
         fIUz2QhNsP55tOewrpwz/25MNc9Unm8nphy7SRAhd/F21gaMrW3ZX3ui5t+VQPOhZQxn
         c0/g==
X-Gm-Message-State: AOAM533FKERGQuf5EaddBw7fJrWh3X+lHtnjhJtyVGhsh0D/Q0dMHWik
        rTrt9+wxY7UuHrQ1rJTuQY0=
X-Google-Smtp-Source: ABdhPJxRP0k/cAE2sWnSZKah5Bvz1wwD292IbFvH8lsu9gn8478UrevhCu86E6NZD1sRR90o1PwiMQ==
X-Received: by 2002:a17:902:d211:b029:d3:c8b3:4aa4 with SMTP id t17-20020a170902d211b02900d3c8b34aa4mr24481042ply.43.1602512518311;
        Mon, 12 Oct 2020 07:21:58 -0700 (PDT)
Received: from sol (106-69-182-59.dyn.iinet.net.au. [106.69.182.59])
        by smtp.gmail.com with ESMTPSA id q5sm20381481pfb.184.2020.10.12.07.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 07:21:57 -0700 (PDT)
Date:   Mon, 12 Oct 2020 22:21:52 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Jack Winch <sunt.un.morcov@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: Suggestion - Configurable Source Clock Type for Line Event
 Timestamping
Message-ID: <20201012142152.GA100342@sol>
References: <CAFhCfDa_FNNC7ushPApRguj3Omik27wRjb3Eh1-_4a1js63FVw@mail.gmail.com>
 <CAMRc=Mch42qdf8Z6FSOutGkcB79ScBi-bidwA5P2s9WhiyRaHg@mail.gmail.com>
 <CAFhCfDbtK=d6PJHSfYFnt17vqC=TzbWD3reFYgM8WBXgS9gUYA@mail.gmail.com>
 <CAMRc=MdCWsdRm5eiti6ZHHxZ1UJ3+0+acTdcrE_pq5hmhV7xNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdCWsdRm5eiti6ZHHxZ1UJ3+0+acTdcrE_pq5hmhV7xNg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 12, 2020 at 03:39:21PM +0200, Bartosz Golaszewski wrote:
> On Mon, Oct 12, 2020 at 1:01 PM Jack Winch <sunt.un.morcov@gmail.com> wrote:
> >
> 
> [snip]
> 
> >
> > > We still haven't released uAPI v2 so I'm open to some last-minute
> > > changes if they make sense (as you explained in the other email about
> > > in-kernel timestamping) and are posted soon (before rc3-rc4). I'd like
> > > to hear Arnd's opinion on this first though.
> >
> >
> > What's the timescales for this?  As I would be doing this in a
> > personal capacity, I will likely have to look at this over a couple of
> > weeks.  I would also be limited to testing on an ARMv8 platform, as I
> > currently have limited access to hardware.
> >
> 
> It would be 3-4 weeks from now.
> 
> In terms of effort: it doesn't look too complicated. It looks like we
> need to add a new flag to the uAPI:
> GPIO_V2_LINE_FLAG_EDGE_CLOCK_REALTIME which would make the edge
> detector use the real-time clock. I wouldn't stress too much about the
> performance of obtaining the timestamp - it's probably negligible
> compared to passing the event struct over to user-space.
> 
> Kent does the above look right?
> 

Could we make that GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME, as it
controls the source of the timestamp in struct gpio_v2_line_event?

Otherwise I don't see any problem with it, and I can have a patch out in
a day or two.

Cheers,
Kent.
