Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 097D6ED6C6
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 02:07:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbfKDBHo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 3 Nov 2019 20:07:44 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36122 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbfKDBHo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 3 Nov 2019 20:07:44 -0500
Received: by mail-pf1-f195.google.com with SMTP id v19so11036488pfm.3
        for <linux-gpio@vger.kernel.org>; Sun, 03 Nov 2019 17:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ex0RgYTqJpTfgIpcRIYhFQrgq0WRMUi4bt2zjpq44Uk=;
        b=MHsi7BDJcJcNBa7NnTa/qvKWjsfwGaeaTbmL02x3EPu2T7NrrMqmHzOd9WOvhYskJv
         OGtDGFdYdb33hmgYIr9C5NxuDGvDxhcesEIT3RdAsuaNJB0kuJQvXUuJgAXYrfFvsJd+
         SWCDVsrX0YN+ufftSbPgeUSV2VxwUQWqH7a1hiGJfu9+19dAIjZmchPiwRCHlMBQ39fn
         QL1BwE6tDur6l1vUgvvSzzzWuIe5a+srP5NXMKQGfgiIKMy+EupYHRmbb1LNsMi0VHDm
         AK25qUvFYhcyFJ1EBjVAtx0X9i13wXIBY7xTjVzRgD4lXcIrpV6CdPVilPb45ls05I9d
         xcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ex0RgYTqJpTfgIpcRIYhFQrgq0WRMUi4bt2zjpq44Uk=;
        b=YW9LqF/TTt0NITZ5GMKT3qABTrR/dWBU+qBDQP2iXp7Mseen8kHOoz83JkkpPq87b0
         ogqaKO817LrJu0E9ceyF7bGuzFpuKw02e/uZCMoJlf1r143/ta4rl65795/srXHo9kL1
         rlEKDkMAv143pTwlquQ36sI81sEIOVvR6c2janbhMi0x5w4T13q98+ZiS7ah5GxgSKiV
         EiLgtO9wqb6XlsUMfulDK9YbqKHAap+M2YHa5cGkFn4Rlmyb5caEGVwJwl3otf5HHdhr
         O2J7G727iRmiGgFRgaiBbHeXyb33KoxnWgDBtdIDr0cOkyYt+eyl9PtaDiZ7rrEEJBbf
         uSjw==
X-Gm-Message-State: APjAAAVSWfo6QJr/b1rsDz2Ax+0n5j8Hx0zv7qqe/tuAZrXVmWTSNZ4K
        aS3kXeYvShcWmg2Df5NVDIA=
X-Google-Smtp-Source: APXvYqxCgr5fzNJAbvus1aLnyUERUpD9NYcI1dZBG7+3y1kMDtkmgDdayPOTdOarIHXj23DuRnFI+g==
X-Received: by 2002:a17:90a:de0d:: with SMTP id m13mr31787411pjv.32.1572829662959;
        Sun, 03 Nov 2019 17:07:42 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id dw19sm14454266pjb.27.2019.11.03.17.07.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Nov 2019 17:07:42 -0800 (PST)
Date:   Mon, 4 Nov 2019 09:07:36 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Drew Fustini <drew@pdp7.com>
Subject: Re: [PATCH v4 0/5] gpio: expose line bias flags to userspace
Message-ID: <20191104010736.GA9134@sol>
References: <20191028073713.25664-1-warthog618@gmail.com>
 <CAMpxmJUO3O05d6ZQijF4+1OCf5E7oeYOPVMZCmOXBV9-VJz5jw@mail.gmail.com>
 <CACRpkdayzONkSnHr+C7e2NVrDP7_Di+PTK6MtM0Kx_Mte+=2Cg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdayzONkSnHr+C7e2NVrDP7_Di+PTK6MtM0Kx_Mte+=2Cg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 04, 2019 at 01:26:54AM +0100, Linus Walleij wrote:
> On Thu, Oct 31, 2019 at 8:10 AM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> 
> > [Kent]
> > > This series adds gross control of pull-up/pull-down to the GPIO uAPI.
> > > Gross control means enabling and disabling of bias functionality,
> > > not finer grained control such as setting biasing impedances.
> 
> Right, excellent and persistent work here, much appreciated!
> 

No problem - hopefully I haven't irritated too many people in the process.

> As long as I get Bartosz's blanket ACK on v5 I think it is ready
> to merge. His consent is required for this.
> 

I'm still waiting on open questions from v4 before submitting v5:

One, handling of errors when setting bias, Bart has referred to Thomas, 
so waiting for feedback on that.

The other, where gpio_set_bias is hooked into gpiod_direction_output,
is fine as is for the UAPI - it can always be relocated subsequently if 
other APIs need to set bias.  On the other hand, if decoupling setting 
direction and bias is in order then that really should be done now.
Can I get an an ACK on that either way?

I've also made a couple of minor changes myself while reviewing v4 - 
reordering the patches to group the gpiolib.c ones and leaving the 
gpio-mockup til last, and removing the "bias requires input mode" check 
from lineevent_create as the line is assumed to be input for events 
regardless of the input flag - there is no such thing as as-is for
event requests.
Only mentioning here in case such changes are clearly wrong...

Cheers,
Kent.

> It looks pretty much as I imagined it when I discussed it with
> Drew some while back, with some gritty details fixed up.
> 
> Yours,
> Linus Walleij
