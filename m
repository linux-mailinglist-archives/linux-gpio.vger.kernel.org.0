Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C633946B332
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Dec 2021 07:48:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbhLGGwM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Dec 2021 01:52:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbhLGGwM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Dec 2021 01:52:12 -0500
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5524DC061746
        for <linux-gpio@vger.kernel.org>; Mon,  6 Dec 2021 22:48:42 -0800 (PST)
Received: by mail-qk1-x72d.google.com with SMTP id t6so13795714qkg.1
        for <linux-gpio@vger.kernel.org>; Mon, 06 Dec 2021 22:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=23KDQH+obM9uYaG8+SZPmfqdTc3JzHgy33Qwp2KGj9U=;
        b=nmqkN6GJQY6iY8xu305xuSPtHB7J5izqwBqvR/GMHpERP6WJei6IaIInDuzJZa7Z4S
         Zwi9Lcqw44immdJvqoeLAcVPI0FGItDDKp1Y7SKGGqoN94V5w1xeW0wvozpKWGS0QR9Y
         N5HlCZhvKLxKqrfKINco5wN/w66pPX5gt/Hwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=23KDQH+obM9uYaG8+SZPmfqdTc3JzHgy33Qwp2KGj9U=;
        b=EtsKq0HhZJaunmxSG5jqJuooyuMPEz+2MGiUaG/iFR90rEbwrJycsncCERBY+yV+IR
         BETFs8rgEm5VRPV9YNwOmMXryxp9NJfmGTL0MxhrXcD0rdr63ksoggs7JnuEOqgsoZ93
         dFEAVxc1wbe8X1m8YikXvJ7A1tclYgybNOmhnrkMMQHEgHIpUkvNf6Y32ab+wP0iEZ4l
         937WeuDpFXucc77Ta3M+p2ZrKOX58UAfHzUTaAmifH+VlxR9o5z0scbwK8WdhTGPU02S
         SmG4XlejTBqRANGknowuSXleTBQ60l1D7bPQ+Tz2Kzc+sF6v8ymb2K9cL5HUEzcU+SBN
         3wFQ==
X-Gm-Message-State: AOAM533tHRAB5xnfVWsxq1WqGcjBpR544ss6TTm/swxegVhucarZoySu
        mob2tsBM7Npv7PdPftk8+89l1FvSiQpH1bkN88U=
X-Google-Smtp-Source: ABdhPJzTfy2V6TLwhEaoeh6tE5+7iiX6QmIVn7RZ9sSbPMQvg8v+lUDmpXgPg3YjJ5LnFN+ISC1Da2i90zfKZTtJNGo=
X-Received: by 2002:ae9:ef11:: with SMTP id d17mr38193980qkg.347.1638859721488;
 Mon, 06 Dec 2021 22:48:41 -0800 (PST)
MIME-Version: 1.0
References: <20211201072902.127542-1-joel@jms.id.au> <CAMRc=McG0stAC_v9_oLjwXa4=nyJVpmuyi2eVWCFA+NW9mWibg@mail.gmail.com>
 <CACPK8XcEhsz8Xk2m7bdPaFnwQ3BrKTH80r-ir_qwngTZ+FmGBQ@mail.gmail.com>
 <20211203035019.GC25091@packtop> <56d66cf6-a05f-461f-9db5-b02b30dc12b2@www.fastmail.com>
 <CAMRc=Me26z7d26AY-UFe7T83doqXvreuEtjs1W--uJLmzKaNvA@mail.gmail.com>
In-Reply-To: <CAMRc=Me26z7d26AY-UFe7T83doqXvreuEtjs1W--uJLmzKaNvA@mail.gmail.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Tue, 7 Dec 2021 06:48:29 +0000
Message-ID: <CACPK8XdpJP8VuDGAtpuRCVe8+GCyJe6Z_BrNcAvS_1o3RxyN1Q@mail.gmail.com>
Subject: Re: [libgpiod PATCH] gpioget: Add --line-name to lookup GPIO line
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andrew Jeffery <andrew@aj.id.au>, Zev Weiss <zweiss@equinix.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Eddie James <eajames@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 3 Dec 2021 at 10:18, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> > > My two cents: like Jeremy, I would very much welcome the ability to
> > > specify GPIOs by name instead of number, but the one-line-only
> > > limitation does seem unfortunate.  How about making a command-line flag
> > > that just means "line-specifier arguments should be interpreted as names
> > > instead of numbers"?
> > >
> > > So you could do:
> > >
> > >   $ gpioget --by-name chassis-intrusion cpu1-prochot
> > >   0 1
> > >
> > >   $ gpioset --by-name led-green=1 led-red=0
>
> I like this more - that way we either allow offsets or names. Please
> make sure corner cases are covered. If you can add this to other tools
> too, I'm fine with that, but put the name lookup code into
> tools-common.c please. I would also like to see bats test cases
> covering this.

Good plan. Thanks Jeremy, Zev, Andrew and Bart. I'll get hacking.

Cheers,

Joel
