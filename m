Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EC802699B8
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Sep 2020 01:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbgINXdJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Sep 2020 19:33:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725953AbgINXdI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Sep 2020 19:33:08 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E89E1C06174A
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 16:33:07 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id gf14so756401pjb.5
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 16:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=k54fCR1rkA8cb1P0ELr5pViE4S4vYyOLeT9uo4OQq7k=;
        b=t28bOxv2nP5mZGF24NfSYgkfbncw9uEIPTn3FbYmZBfQwi9M4mj8olTFbWH37065an
         yBtJT/jQnLoZMHTrivfiVsVHBDejjoZgjDCmGtzHQjzYr5NnUBeovtBFQ9ZOIGIw149T
         WqJ+ShcToomfGB7gND4zZKau6IAStwQfhQ7B02dpM1XotYqz+00Kiz3WEhlIvjvwT2rw
         /J8Hu8zhOSzATm0vyTs6UetyOGoC1Le39zUd0jApEI5Z2zM4NS8XvD9hl7fJR4sbFpex
         Z6QhYUjf+WpupFA7SXv8VMtkVn2QsaYiCqIWc8sJblYoqiGHhLRpRc9xvwqqmpzxElXb
         wfqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=k54fCR1rkA8cb1P0ELr5pViE4S4vYyOLeT9uo4OQq7k=;
        b=TdOIPikWVsSjHQRpiSj6/8Ph+yM4j4frqn26/9D3VwIc0fLNQF2rbJsFH0lqagcHN0
         jLaeXE21aRPEf+w0WZj39vFYphmaNwsyw1VdOFqrUj41NbNVIz/4sMdt2BOAnXrTeQiR
         M9cIuq1XKzXsMIb7st04tNsSy0EQUQOeyWMKeGh0MSrXJpNOa7Mt8j80Trj/hOzMMO/D
         dX+iKSOfPR6I2F2Bw+470dcljFWUB8ijsCbd+DtCREsIsAIPRliVOTRG3b9nbseq9CG+
         LRUmBSQBZihbJcWD+vUk4536yxzzdc9RzRCmCK9+Jw78dlQD8AIywgdxSSutRCwNkFR/
         737w==
X-Gm-Message-State: AOAM530p4Q8BGAzyQPGwlVDs4xWHmFr6ckc1Sb8t4b3Ba+i+v50qxNea
        FJLzuFSEmTsV+nkRcZS7N9YOuAW9yeE=
X-Google-Smtp-Source: ABdhPJx4GAoKtUyERB4cP6FZiAIJg2udK+EqSAsrCvpKE4dYA4eeepsk1YygFaV4WwRM0u27cSk9LQ==
X-Received: by 2002:a17:90a:4309:: with SMTP id q9mr1605858pjg.226.1600126387373;
        Mon, 14 Sep 2020 16:33:07 -0700 (PDT)
Received: from sol (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id f12sm7729069pfa.31.2020.09.14.16.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 16:33:06 -0700 (PDT)
Date:   Tue, 15 Sep 2020 07:33:02 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod][PATCH v2 2/2] core: fix reading subset of available
 events
Message-ID: <20200914233302.GB4138@sol>
References: <20200912081105.1615496-1-warthog618@gmail.com>
 <20200912081105.1615496-3-warthog618@gmail.com>
 <CAMpxmJWM4UZ2iDO047-H7sMeCR0BD2exmiMFo3=eF1UmYJZkQA@mail.gmail.com>
 <CAHp75VeFWQCkeXne+7i2FEUNy97yjPiMwsQqkm7mqhtXiGac7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VeFWQCkeXne+7i2FEUNy97yjPiMwsQqkm7mqhtXiGac7A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 14, 2020 at 06:16:35PM +0300, Andy Shevchenko wrote:
> On Mon, Sep 14, 2020 at 11:16 AM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> > On Sat, Sep 12, 2020 at 10:11 AM Kent Gibson <warthog618@gmail.com> wrote:
> 
> > > Fixes: 44921ecc9a00 (core: provide functions for reading multiple
> > > line events at once)
> > >
> > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> 
> 
> > Will apply shortly and backport it to stable branches too.
> 
> Please note that
>  - Fixes (or actually any tag) should be one per line
>  - no blank lines in the tag block
> 

Sorry - I wasn't aware that tags are exempt to the line length limits.
And checkpatch.pl doesn't pick up those rules either :-(.

Cheers,
Kent.

