Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EF72560088
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jun 2022 14:55:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233497AbiF2Mv4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jun 2022 08:51:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233495AbiF2Mvz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2022 08:51:55 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD43B35857
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 05:51:54 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id w24so15591990pjg.5
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 05:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=97RrIESR7POuMI6bjC53eh+dlKd+BZRoyDnMEdy7ReU=;
        b=RHIlW0r7XDj0BRphnpXWfD4ERR+ODkR1bDjcH/6IisWIJua2MY9x1ZJhnpv6GPpVd/
         d4gl9B5VUXZZpS+NGFuzsa5fKl6LhnBUyM4zJ18vw2NyfkRyM/7lhirsl2ZiQ3S6o+zB
         sPVQnblvAgysk6aP/0cqQU3mbzwIsF7+2MsDoVRLR6kWzuw0zwOu/URy5tTbDLM9Es0x
         Tm0bXs9kkWlNjJgG5q8NR+Eyu4SfCh0yT9YZH0t8D2zbufTObb6rRGi1u09lP8CRph4E
         T7vG/3ELNi08MSTaf0DSKMoOXx5UXRzKK3U2v1f0/lREErAbl6NjMllzOljG+dhJcYet
         GUjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=97RrIESR7POuMI6bjC53eh+dlKd+BZRoyDnMEdy7ReU=;
        b=FYTuhFMUPLbvcmWbI4re9fVf87FzZRgLQEPDvYtFzV7Rt/AwiDuoPG3Solb1KW6t1n
         Wj8wyWiwkI+CUSDn05Lm/mb22VDooKOsdmpjpQEwbychLUm6FvzB1RWkgVg0woln9mEv
         Q2n1UX6moUF38xN0j/mYmEYmNsh2NuxK2EY6TUvZS2lzIyJypSJm5vIEpMxIcOpSTVng
         kjhWSI4txaxXOLaMACCMxZDlH3nfqa9Js6YLbyIBS+0n/lHPF8eGk1+P8NhjIPVW8ZjH
         hqPol+9ucPD3aVjuPKUGtkxvJzvoFLvv7INeGP8logZ0ZgPNS6JOO971QI/I+WAAtp2x
         rMTQ==
X-Gm-Message-State: AJIora+jog1p3CICE7OoecGy8/wu/jddlUvOojvZzJfynqz1Swfq6ege
        5c9IjMvqi5zEsFaXPpV3EwY=
X-Google-Smtp-Source: AGRyM1uWEs3ftlCeFHg8J0NlRxClAs3TFpy5Y6srKPeEKOUrk9X1ACsPICMhbDf5w8dH6IvOCXXq9Q==
X-Received: by 2002:a17:902:8211:b0:16a:43ad:b832 with SMTP id x17-20020a170902821100b0016a43adb832mr10034771pln.165.1656507114193;
        Wed, 29 Jun 2022 05:51:54 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id f6-20020a170902684600b0015e8d4eb1fasm11444063pln.68.2022.06.29.05.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 05:51:53 -0700 (PDT)
Date:   Wed, 29 Jun 2022 20:51:48 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     =?utf-8?B?SmnFmcOt?= Prchal <jiri.prchal@aksignal.cz>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [libgpiod] feature request: output state read and sustain
Message-ID: <20220629125148.GA31775@sol>
References: <1d43c967-e3c9-21a8-3040-2db54ba85bdf@aksignal.cz>
 <20220328080841.GA14353@sol>
 <757ac53e-07bb-1ffa-2734-08c1c321ff0e@aksignal.cz>
 <20220629072353.GA18684@sol>
 <a1cdd48d-0da9-b61a-3530-ef2e99539b74@aksignal.cz>
 <CAHp75Vd2=XAD_qmsYp0AWoi2mryR-FFq5ipFqa4d7qB+bFkS0g@mail.gmail.com>
 <20220629104757.GA29289@sol>
 <b8d63150-cd1d-692a-9470-d75278135350@aksignal.cz>
 <20220629112519.GA30910@sol>
 <3b7e2035-a829-b99e-f51b-0bcf04ccdfc6@aksignal.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3b7e2035-a829-b99e-f51b-0bcf04ccdfc6@aksignal.cz>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 29, 2022 at 01:48:17PM +0200, Jiří Prchal wrote:
> 
> 
> On 29. 06. 22 13:25, Kent Gibson wrote:
> > On Wed, Jun 29, 2022 at 01:17:54PM +0200, Jiří Prchal wrote:
> > > 
> > > 
> > > On 29. 06. 22 12:47, Kent Gibson wrote:
> > > > On Wed, Jun 29, 2022 at 12:27:13PM +0200, Andy Shevchenko wrote:
> > > > > On Wed, Jun 29, 2022 at 11:27 AM Jiří Prchal <jiri.prchal@aksignal.cz> wrote:
> > > > > > On 29. 06. 22 9:23, Kent Gibson wrote:
> > > > > > > On Tue, Jun 28, 2022 at 03:08:20PM +0200, Jiří Prchal wrote:
> > > > > 
> > > > > > > > using new libgpiod / chardev driver, is there any way to get state of
> > > > > > > > output? I mean one process sets it for example to 1 and another process
> > > > > > > > reads this output state for example to show that on web page.
> > > > > 
> > > > > I'm not sure it's guaranteed to read output back. Some (b0rken?) GPIO
> > > > > chips may not allow this on H/W level and when reading they always
> > > > > will get the value of Input Buffer (now imagine if the line is
> > > > > configured as Output with Input being disconnected from the physical
> > > > > pin).
> > > > > 
> > > > 
> > > > Agreed.  Userspace should know the value they set the output to, and so
> > > > have no need to read it back.  GPIO is not NVM.
> > > Not NVM, bat RAM and it keeps their data untill reset, after reset it has specific value (usually 0)
> > > I haven't seen HW without possibility of reading back output register, but I don't say there couldn't be such one.
> > > 
> > 
> > No, no it is not RAM.
> > 
> > And I have seen hardware where you can't read back the output.
> > And so has Andy apparently.
> > That is the problem - there is lots of hardware out there and we are
> > trying to provide a consistent interface to inconsistent hardware.
> OK, but if hw supports it why not provide it. And for hw without support keep it's value in memory? Or return to user space with errno indicating "no support"?

No idea - I'm new here (by your definition) ;-).

In general we do provide it where the hardware supports it, so for
example typically reading back outputs works.

I would guess the reason we don't provide a guarantee is that is that in
most cases it isn't necessary, and to do so adds cost.
Full on caching and error handling as you suggest would be overkill
for most situations.  Most writes to outputs don't get read back, so why
waste resources caching them? And if you want to do the error handling
you suggest you have to cache them - just in case, or you have to
pre-get them to find out which lines need to be cached, but you can't do
that without changing the line direction to output and you certainly
can't do that autonomously, so the driver interface needs to be far more
complex to probe the driver capabilities down to the line and in
different modes.  And you need to spend time doing that...
Basically a can of worms.

And the simple workaround is for the user to cache the value themselves
if they need it and find their hardware doesn't support read back.

So best effort is the most pragmatic and cost effective solution.
(Hopefully Andy will chip in with the actual reason, which is probably
something far more obvious ;-)

As always, if you see a better way, submit a patch!

Cheers,
Kent.
