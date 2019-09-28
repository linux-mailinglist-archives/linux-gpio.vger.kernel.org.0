Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34833C1264
	for <lists+linux-gpio@lfdr.de>; Sun, 29 Sep 2019 01:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728768AbfI1XLY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Sat, 28 Sep 2019 19:11:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:41570 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728742AbfI1XLY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 28 Sep 2019 19:11:24 -0400
Received: from oasis.local.home (unknown [12.174.139.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A6E64208E4;
        Sat, 28 Sep 2019 23:11:23 +0000 (UTC)
Date:   Sat, 28 Sep 2019 19:11:22 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Ingo Molnar <mingo@redhat.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Tal Shorer <tal.shorer@gmail.com>
Subject: Re: [PATCH 2/2] tracing: drop handling of NOTRACE symbol
Message-ID: <20190928191122.0de5b604@oasis.local.home>
In-Reply-To: <20190824140426.4kflanpydbafsmve@pengutronix.de>
References: <CACRpkdY62aXDOZm7cK4ND-RSnr9Ynz0DxS8-PHSF7i7diRG=WA@mail.gmail.com>
        <20190405194613.19578-1-u.kleine-koenig@pengutronix.de>
        <20190405194613.19578-2-u.kleine-koenig@pengutronix.de>
        <CACRpkda1xoUZGMCDWGSvA7MPxXC5qc3tp8UiZt+us19vppGpyw@mail.gmail.com>
        <20190408133506.xv3cwcqkqdobgz2r@pengutronix.de>
        <CACRpkdbYtsVLXC61jn_Gy_X33N4DBD9eumf3JNVCLemk0sGHzQ@mail.gmail.com>
        <20190408102744.66856bdb@gandalf.local.home>
        <CACRpkdax=n6hYfixSgsVaT2vPiZGdCC=tbQJrazzao946_M7yA@mail.gmail.com>
        <20190824140426.4kflanpydbafsmve@pengutronix.de>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, 24 Aug 2019 16:04:26 +0200
Uwe Kleine-König <u.kleine-koenig@pengutronix.de> wrote:

> Hello Linus and Steven,
> 
> On Mon, Apr 08, 2019 at 04:29:15PM +0200, Linus Walleij wrote:
> > On Mon, Apr 8, 2019 at 4:27 PM Steven Rostedt <rostedt@goodmis.org> wrote:
> >   
> > > On Mon, 8 Apr 2019 15:42:55 +0200
> > > Linus Walleij <linus.walleij@linaro.org> wrote:
> > >  
> > > > > That's fine for me, but I'm a bit surprised you did that without an ack
> > > > > from the tracing people?  
> > > >
> > > > oOOPS no I guess I shouldn't, haha I just didn't
> > > > look close enough, I thought for some reason it only
> > > > applied in the GPIO subsystem. I'll back this out.  
> > >
> > > No need to back it out.
> > >
> > > Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>  
> > 
> > OK applied to the GPIO tree.  
> 
> I just found this patch in one of my older topic branches and it still
> applies to current Linus (Torvald)'s master.
> 
> Given that the only user is gone since 5.2-rc1 (commit
> 12f2639038ef420fe796171ffb810b30d1ac0619)
> 
> For reference, here comes it again, slightly adapted to reality. (Use
> git am --scissors to apply.)

I have some reservations against this patch. Mainly being that I'm
starting to think that we should be able to compile out individual
systems of trace events. The number of trace events continues to grow,
and there are many that I don't care about. This could be use to make
it easy to add configs that keep various trace event systems from being
compiled into the kernel.

-- Steve

