Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3395C055C
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2019 14:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726116AbfI0MmH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Sep 2019 08:42:07 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43384 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725992AbfI0MmG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Sep 2019 08:42:06 -0400
Received: by mail-lj1-f196.google.com with SMTP id n14so2326907ljj.10
        for <linux-gpio@vger.kernel.org>; Fri, 27 Sep 2019 05:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cja9oW2PFa4Q4M+VD7WHTmHuFmAdhVAdeNQQpfdSEac=;
        b=KPfX376XnooShbzbFxT8xYyKlNM1T6zycXPgeKZBlG2Dsp/6G3buR3PiErJ5T+ENoT
         Q3xjfq467eWFik5nDzKRR7x9CNOKtKHbUgSRN9YN0UOMbbLJqA/QDkNXtzlh8ZY8QN3Q
         NqPGmbnUy+WwVP1cjGxKBwSIFvNWdcjFW4vTcYG+qFU8lCH+ld+WkeGK6WkgqfIW0NuU
         0uLTd5ILTsINrTx2k+eun93Xjq8WuKdmEyZ09U+veGABAL+ORRa4VhFQ5dOXBdpOcpIR
         9UBuZOw2qO0eO151feKmV55mT3kSGyshn7SKe9xHmpaBnS6HsJ85K6AvQxGNviBCPb8p
         tgyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cja9oW2PFa4Q4M+VD7WHTmHuFmAdhVAdeNQQpfdSEac=;
        b=ibghKtY9anSUtiqdShJ1m2ZPVzUQ+WvO05dP0qAsu6PaSboxv28Tf+2gL0FTgCOYee
         n0fQklIswptjlfSNtKW9Vzo2ZICuhlikfIio44lpDD2Y9wLtFtvbYeOyVlZJCWc5XsPE
         xX/1S70Mcv0fWf7NPHm87NbyKJhOK4aa0hWQFq1bAfAwaZos1uJNG76Nzw09YqyXNWsF
         SQWKhLv5McHyutbvQrkoy2CW0YkLaMt9o8j34yZVFi2uSyUZHDCqloT50+bw46wVzmhL
         UvFxwbT0JTyYyiBCa5l6/R+qy0G4vbnMoQEzmOsmSIEIO69dJvB4JOdToIOV7I5HYX7Y
         nB3w==
X-Gm-Message-State: APjAAAXEbz4zb/1IeWukXbRky3BtrlXsNbzd4bFvjnsI5ZBdC2NmuzXc
        s0apMx97p+e0hNfgw07NTy7EMSA/Q7ePo6oCiq6WbA==
X-Google-Smtp-Source: APXvYqyg6jvM+cDm/sUp9AKD7/mfkQhciSdI+JuKQzatyhO7vjUhVyUHrASHhSH9fKPhU64nXFijKiVRD6LN9U54+hs=
X-Received: by 2002:a2e:b4c4:: with SMTP id r4mr2844918ljm.69.1569588125169;
 Fri, 27 Sep 2019 05:42:05 -0700 (PDT)
MIME-Version: 1.0
References: <CACRpkdY62aXDOZm7cK4ND-RSnr9Ynz0DxS8-PHSF7i7diRG=WA@mail.gmail.com>
 <20190405194613.19578-1-u.kleine-koenig@pengutronix.de> <20190405194613.19578-2-u.kleine-koenig@pengutronix.de>
 <CACRpkda1xoUZGMCDWGSvA7MPxXC5qc3tp8UiZt+us19vppGpyw@mail.gmail.com>
 <20190408133506.xv3cwcqkqdobgz2r@pengutronix.de> <CACRpkdbYtsVLXC61jn_Gy_X33N4DBD9eumf3JNVCLemk0sGHzQ@mail.gmail.com>
 <20190408102744.66856bdb@gandalf.local.home> <CACRpkdax=n6hYfixSgsVaT2vPiZGdCC=tbQJrazzao946_M7yA@mail.gmail.com>
 <20190824140426.4kflanpydbafsmve@pengutronix.de>
In-Reply-To: <20190824140426.4kflanpydbafsmve@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Sep 2019 14:41:53 +0200
Message-ID: <CACRpkdbspcWpeggzCaBa=GiZriy7REyQpfH6x=uE1HdqXY=kPQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] tracing: drop handling of NOTRACE symbol
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Tal Shorer <tal.shorer@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Aug 24, 2019 at 4:04 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> Hello Linus and Steven,
(...)
> I just found this patch in one of my older topic branches and it still
> applies to current Linus (Torvald)'s master.
>
> Given that the only user is gone since 5.2-rc1 (commit
> 12f2639038ef420fe796171ffb810b30d1ac0619)
>
> For reference, here comes it again, slightly adapted to reality. (Use
> git am --scissors to apply.)

Sorry Uwe, it exploded last time for some reason that may have
been my fault, bad luck or something interim, or something that
has gone away since. But I had to pull it out and I guess I missed
to communicate about it.

I put it in a separate branch and push to the build servers so
we can see if something happens!

Yours,
Linus Walleij
