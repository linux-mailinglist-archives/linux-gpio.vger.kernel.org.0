Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EC6F465D69
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Dec 2021 05:30:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355389AbhLBEdY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Dec 2021 23:33:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355411AbhLBEdX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Dec 2021 23:33:23 -0500
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40A9DC061574
        for <linux-gpio@vger.kernel.org>; Wed,  1 Dec 2021 20:30:01 -0800 (PST)
Received: by mail-qv1-xf2c.google.com with SMTP id g9so21960727qvd.2
        for <linux-gpio@vger.kernel.org>; Wed, 01 Dec 2021 20:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bGCeikFSnVN8dKwJOvIvDzC/KJwmdObCCAzrzpCAJ/E=;
        b=ep2tyg/axtHnJq6lnmrdZs8eNm+xbpSxf7+cWlCu7wV6drt9PjMvbkZpvbty/9Dfte
         21n/Th92jFH9tZN2V++oInh+pBLNXAZTpOl8QrgHaDUqkAqaNEX02wDIYmC1yj4fS5kL
         dBI+jEKrgvPC+fSpSQzoPDArbmymd7vnvpUu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bGCeikFSnVN8dKwJOvIvDzC/KJwmdObCCAzrzpCAJ/E=;
        b=LJmHuCdw3JBrtFoZxhKiO++MU7IohoT7tWC/7eGd0VTFYZD8ALnVurOhTbswa+LGgl
         xTZX80WxjplyLIwqmrlXv6aqH+1fiPEJNzObNMglUqlwIO6sGNxWHlYg8enS7Ra5M+pA
         olXtEdhmIQ3VqBzwAuM/2FFhQE7o/Gvuwlahwiwk44ZDBfPyiK63qSE1pj+5EO6oh6VB
         oUX/sMIFxXyr57N9mi1NEmNl8PZV/ruZRrx7fd+V16fKAEEhgUH3IEpZ17Y5vwTJL6Dn
         PLiAxh7eVkpY+JY/aZ/77HFC5ZtTtP2KEUkrH5MHvTfZaM9UT/pA0WjKMiVZzBwRf15s
         GBJQ==
X-Gm-Message-State: AOAM533Uml2n2BPVON2QtuMcrk4e4ypoqE2w9SKNRWquMKlKeJ3UeEi6
        lHfhkrjE1h8Gesa2PtTkpIE5j8A9Tt7ymaavw3a8EidYxo3N+g==
X-Google-Smtp-Source: ABdhPJy9YCb0OsP8aRyRht0rMpOWft/kYkSw1s90maipTvcAICcfj7+aCxTMF4SkGD2KALddT9nXHXyH8pn1qBCU8ck=
X-Received: by 2002:a0c:c246:: with SMTP id w6mr10924727qvh.130.1638419400288;
 Wed, 01 Dec 2021 20:30:00 -0800 (PST)
MIME-Version: 1.0
References: <20211201072902.127542-1-joel@jms.id.au> <CAMRc=McG0stAC_v9_oLjwXa4=nyJVpmuyi2eVWCFA+NW9mWibg@mail.gmail.com>
In-Reply-To: <CAMRc=McG0stAC_v9_oLjwXa4=nyJVpmuyi2eVWCFA+NW9mWibg@mail.gmail.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Thu, 2 Dec 2021 04:29:47 +0000
Message-ID: <CACPK8XcEhsz8Xk2m7bdPaFnwQ3BrKTH80r-ir_qwngTZ+FmGBQ@mail.gmail.com>
Subject: Re: [libgpiod PATCH] gpioget: Add --line-name to lookup GPIO line
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Eddie James <eajames@linux.ibm.com>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 1 Dec 2021 at 08:29, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Wed, Dec 1, 2021 at 8:29 AM Joel Stanley <joel@jms.id.au> wrote:
> >
> > Systems provide line names to make using GPIOs easier for userspace. Use
> > this feature to make the tools user friendly by adding the ability to
> > show the state of a named line.
> >
> >  $ gpioget --line-name power-chassis-good
> >  1
> >
> >  $ gpioget -L pcieslot-power
> >  0

> I'm not very convinced to be honest. It's not like "gpioget gpiochip0
> `gpiofind gpiochip0 line-name`" requires much more typing than
> "gpioget gpiochip --line-name=name".

I'm taking on feedback from people working in our labs, and
implementing userspace applications. We've been building BMCs with
mainline Linux for about six years now, and it's been a long road
re-training them from "back in the day we just did devmem <this>
<that>" and "why can't we just do cat /sys/class/gpio/gpio305/value",
and now "why does the level of the GPIO change back after I run the
command?".

This usability improvement is one more step towards them using and
being happy with the "new world" of the gpiod API.

Once we settle on a good API here, I plan on submitting a version of
gpioget/gpioset added to busybox.

> There are also other questions:
> this uses getopt and only allows to specify a single line name. What
> if we want to specify more lines like with offsets? Even if you allow
> multiple names, getopt() doesn't guarantee ordering of arguments.

If you're happy with the concept I'm happy to iterate on the implementation.

Yes, it only allows a single line name. That tends to be how the tool
is used, both from the command line and in scripts.

Can you give me an example of your proposed command line API, so I can
understand what you're suggesting here?

Cheers,

Joel
