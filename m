Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEC2155FE60
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jun 2022 13:20:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbiF2LUa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jun 2022 07:20:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbiF2LU3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2022 07:20:29 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59D9021251
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 04:20:28 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id jh14so13829974plb.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 04:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=XzQzuAzZBLpdi47JcJVArViKzFiEZuK1mi5ZJHtcsD8=;
        b=GFhLZdbi7+bT0SQ4H88232LOs0FwdYNqbE0Z6v666Iuu9rZKCBCagKi1P/c1nMsKWb
         Su81ggQP5bl87wMkuB6ZR0j505sBB2nAo1hyuVrDqL+picOk83dxbVv14nGIiIE/Zm4x
         tdP1Y9TxeBL6HtimJCSQDmkb2TMCBrjHRfrZorEkl7Iy8leMQTVTUcUivkNmmuCBrecx
         vvtu7s0weOI0AtYCR2m/guFXw16cfEK2Q2oILOI1ER6vXWv1O94/2+D641kpKmwMYBVT
         MrgxMuBGMIRzyZ5vUL8/ftuNHINBrOvPo2PKD/ZpF1vigjKp7a3WcmalmcHDPJC/zM9j
         ioqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=XzQzuAzZBLpdi47JcJVArViKzFiEZuK1mi5ZJHtcsD8=;
        b=C2CFEcHzXdPtcku9PurrDy/2hBsmeNt6uDOHRjObMhA/E4V6am9EjJ/ohvquaQtRqp
         xYbizac+6SfI/bXXAGbdRrDVJsmQ1mBqMAJv5q+Y0nEAWA001noGKnajVfwNBUdCopvs
         4m9fTjfxIfzrrxWDN297Lvt1H+c1DwS/9/LiunNB9XAb4E6ZPLe8C21YtqhIh2hfEBdf
         3facWJeK3hYLVWHM6arR0Rfp69zWRtIGnZNJJ6usQJquycZTN7VhLX3cs6E0SVXfcFTB
         di4FS/0MjwK8PeFjRYK1NeT/mYGxxm90ZGOCcxl3UBaxTFdSP9Oygz57AukeYqAfPce5
         Mgfg==
X-Gm-Message-State: AJIora/z+vNaAqSPUDBUrwMSVuCZPKKc7Qy2s5Z/5oZJs58NnzmyGEL8
        uaQ++Uq5rvO/yDXrycKyDAI=
X-Google-Smtp-Source: AGRyM1s0Fk22Jb/wWZLSX5b4tA9n+RF5IsBflq0lnJ9f1yaQp5+G/H4XPlCDag1/AWnuPzOpoyhxOQ==
X-Received: by 2002:a17:902:8a8b:b0:16a:52d0:72bd with SMTP id p11-20020a1709028a8b00b0016a52d072bdmr8833437plo.78.1656501627785;
        Wed, 29 Jun 2022 04:20:27 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id y8-20020a17090a134800b001ead46e77e2sm1844416pjf.13.2022.06.29.04.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 04:20:27 -0700 (PDT)
Date:   Wed, 29 Jun 2022 19:20:22 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     =?utf-8?B?SmnFmcOt?= Prchal <jiri.prchal@aksignal.cz>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [libgpiod] feature request: output state read and sustain
Message-ID: <20220629112022.GA30306@sol>
References: <48129be0-f29d-96ae-cec3-2b4a2ee10aa8@aksignal.cz>
 <20220325160146.GA49114@sol>
 <1d43c967-e3c9-21a8-3040-2db54ba85bdf@aksignal.cz>
 <20220328080841.GA14353@sol>
 <757ac53e-07bb-1ffa-2734-08c1c321ff0e@aksignal.cz>
 <20220629072353.GA18684@sol>
 <a1cdd48d-0da9-b61a-3530-ef2e99539b74@aksignal.cz>
 <CAHp75Vd2=XAD_qmsYp0AWoi2mryR-FFq5ipFqa4d7qB+bFkS0g@mail.gmail.com>
 <20220629104757.GA29289@sol>
 <CAHp75Ve5zpwgc9kk06LYJU8GveXFdgbgyyxXoQm0dy_OiLTF2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Ve5zpwgc9kk06LYJU8GveXFdgbgyyxXoQm0dy_OiLTF2Q@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 29, 2022 at 12:58:18PM +0200, Andy Shevchenko wrote:
> On Wed, Jun 29, 2022 at 12:48 PM Kent Gibson <warthog618@gmail.com> wrote:
> > On Wed, Jun 29, 2022 at 12:27:13PM +0200, Andy Shevchenko wrote:
> > > On Wed, Jun 29, 2022 at 11:27 AM Jiří Prchal <jiri.prchal@aksignal.cz> wrote:
> 
> ...
> 
> > > Do not use shell. Use proper programming language that may give you an
> > > easier way of handling this, i.e. _context_. Shell tools are
> > > _context-less_ and here is the problem you are trying to solve, but
> > > from the wrong end.
> >
> > Actually my proposed gpioset for v2 will support running interactively
> > so it can maintain context and be driven from shell - for cases where
> > basic scripting will suffice.
> 
> Dunno if it's the right direction and if I missed any (additional) discussion.
> As far as I remember the idea was to introduce DBus aware daemon that
> should handle the context of the line and at the same time consider security
> implications. Allowing shell to be context-aware is a hidden mine
> field. What will happen if the script/user forgets to move the line to
> the proper state and the chip will drain a lot of current? So, at
> least PM concerns just popped up immediately to my mind. What else can
> be problematic? So, I dunno, it's a good idea to allow shell to leave
> a line in some state when the user actually doesn't care about it
> anymore. At the bare minimum this mustn't be default behaviour.
> 

I don't think it is what you think it is.
Take a look.  If you don't like it then get Bart to bin it.

There was no on-list discussion.  I had preliminary disussions with Bart,
and had intended to float it as an RFC, but got distracted by other
things and ended up going direct to an implementation.

Last I heard the DBus daemon is still on the cards, but not sure where
Bart is with it, and the gpioset addition is for simpler cases where
DBus is overkill or where there is no daemon.

It is not the default behaviour, it is an optional mode.

gpioset maintains the context, not shell.

"User's forgetting" is language independent.  Shell scripts matter!

What else have I missed replying to? I don't know.

And good to see our apparent agreement in the previous mails was just an
aberation.  I was starting to think there was something wrong with the
universe :-|.

Cheers,
Kent.
