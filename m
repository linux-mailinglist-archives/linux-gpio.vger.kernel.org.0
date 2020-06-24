Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD1820754A
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2020 16:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389640AbgFXOIN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jun 2020 10:08:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388395AbgFXOIN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2020 10:08:13 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A33BC061573;
        Wed, 24 Jun 2020 07:08:13 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id u128so1455613pgu.13;
        Wed, 24 Jun 2020 07:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=gev1bIS92uZfco6kY4Q5CKkZciMWnmtMQi2JfIyCgPA=;
        b=JqxpXL7TQNnqCne9lYUWwS5yBMGbBQP5xqAiSaWEH9j2w4o+K54vJaxMNdzfW2hL8F
         iob/X6aKzrPTy3acWFPU98fkU3Cra4dE1a91n+tIZC/dsEAEK9Dx1DA1q6N30xcP3TDm
         7muRmm7kdkZqERXnu77r0Um19cQMcz7XtfPsTMtHJ7M597wU7xbXvuaiQIOMttnYWUi+
         vtWjT8xlxEcvFmamhqqxhPc/smfnAyWy8CcvROAVnhNnQI1UcFTk0+5/6lK5MKW+Tccc
         LYTWviwAw80lBvIKXHLlnxG1tJA4su/GYYEUYcOCm+O6SnGxttNGCc3tgOYScEh+0UJd
         HMyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=gev1bIS92uZfco6kY4Q5CKkZciMWnmtMQi2JfIyCgPA=;
        b=i5k4zz+5dk24eWJrG71D4VzptIJhflahi74zMH1tspV/VZwf/RCi2uYSqcRaE4aOxD
         PAa1yxvFA8NKB2GyPuW7cIyOBXhANYb7F4dvfDXpewvIxkXH4iMR7ib4PKKz7GKFb+XU
         +xgfu0+TBfqm1N0QGr4lRpONOO1Wr284Q3h/MrduB+hUaIg6NbtZ1K7bv7Qgl9lMVzLf
         Fyt1mQIfmXXqj/i8d5XSUurGX9Lya300Pp5/4DDVoEPLT4iP2ZTJJd8MTe3caOqqc8TP
         oVlixSdRgy0oksAK9SrX6X/VtedDUwKILdtMJBmehT1HCM3CMWLQaguOl6YKbnnpqWwE
         xwLw==
X-Gm-Message-State: AOAM532kuVNfNcGx7i07p5DzaMffRzUCNz5zamx0i2Ju7K8XSZ6BpxcT
        JTl8kfgQFT/J5AQ5gTj4tH0=
X-Google-Smtp-Source: ABdhPJy8vW5d2fp0r1d8lV9gHPtP+LSSJh40gf3tsD9TjBB1lHfrbUz9ny2CaCHNaW8HpBMgSkXPiA==
X-Received: by 2002:a62:1a87:: with SMTP id a129mr29414043pfa.95.1593007692476;
        Wed, 24 Jun 2020 07:08:12 -0700 (PDT)
Received: from sol (220-235-99-174.dyn.iinet.net.au. [220.235.99.174])
        by smtp.gmail.com with ESMTPSA id n2sm4056904pgv.37.2020.06.24.07.08.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jun 2020 07:08:11 -0700 (PDT)
Date:   Wed, 24 Jun 2020 22:08:06 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 08/22] gpiolib: cdev: complete the irq/thread timestamp
 handshake
Message-ID: <20200624140806.GA7569@sol>
References: <20200623040107.22270-1-warthog618@gmail.com>
 <20200623040107.22270-9-warthog618@gmail.com>
 <CAMpxmJVbiH9mh2c8aAS+GG9a76w9c0Nrrv-VDVhpo+wSyQ2NeQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJVbiH9mh2c8aAS+GG9a76w9c0Nrrv-VDVhpo+wSyQ2NeQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 24, 2020 at 04:00:42PM +0200, Bartosz Golaszewski wrote:
> wt., 23 cze 2020 o 06:02 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > Reset the timestamp field to 0 after using it in lineevent_irq_thread.
> >
> > The timestamp is set by lineevent_irq_handler and is tested by
> > lineevent_irq_thread to determine if it is called from a nested theaded
> > interrupt.
> > lineevent_irq_thread is assuming that the nested, or otherwise, status
> > of the IRQ is static, i.e. it is either always nested or never nested.
> > This change removes that assumption, resetting the timestamp so it can
> > be re-used to determine the nested state of subsequent interrupts.
> >
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> >
> 
> This change makes sense to me but I'm having a hard time processing
> the explanation. If we're requesting the interrupt and allocating the
> lineevent state in the same function - how can we run into a situation
> here the status of the irq would change like what you describe?
> 

I'm not totally sure myself, as my understanding of how interrupts are
shared in the kernel is pretty sketchy, but my concern is that if we
are sharing the irq then whoever we are sharing with may release the irq
and we go from nested to unnested.  Or vice versa.  Not sure if that is
valid, but that was my concern, and it seemed like a minor change to
cover it just in case.

Cheers,
Kent.
