Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B94A21BD183
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2020 03:04:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbgD2BET (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 21:04:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726274AbgD2BET (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Apr 2020 21:04:19 -0400
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8A1EC03C1AC
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 18:04:18 -0700 (PDT)
Received: by mail-ua1-x943.google.com with SMTP id i5so336368uaq.1
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 18:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ug/wQBq+seIv85+u2EtcllFYAZBy4VzDUqZGrZ7xOnU=;
        b=ctXjV+yhq6JeHZvZNcwG18SVfTkYgUdvzrnoQROO9BzA6lP0VohAxOBsAZg8X9lOzi
         0JD5d8V0/fSEioGYUmhk1XwRLkpEWZ0lt/6Z8yWOizAflbOeVrCWIO1/bYYKh+z/Mj6P
         UNBOdJM66TBcRvyJEv51fG26dSdvrWZAnaT3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ug/wQBq+seIv85+u2EtcllFYAZBy4VzDUqZGrZ7xOnU=;
        b=Mdz/+6pmTHleeAdCQxoM6xnkJWMfgIKw9Vg9S/MqxSHiN7oPoRC6y6ZaxAzwdzSZnC
         vs3m8xCPTok5K9MgqX4J6eWOJCDZhpr2LRjWyVyhco0gQGvbgRrnxYxyERArBxfOLtkz
         ZyYH5EXojyp8b4MbDxvfrHIKqf8iVPnK6uafYvzIMyXcuhhe2TOoca6qPdV3KjEqUWGW
         dS6lN0jRuEOyZ9KEr9BCnR/ig3AEp5dNt4+/MNOoQnfbhFQlmVGZ3WYMC5n5Qm9+zuAP
         KnUVRwEf+qZf8sPw6pbLwGcRZO3xWcwN5KQytGcu+8sn1ER060v3Y8VPZ/6HTY7tDFuK
         98nQ==
X-Gm-Message-State: AGi0PuYBA1kuhDSLWZcYIVQff0ob+tWy132oJBOX4D2dPqLENSDCEIDq
        NB1+V/Knhh/QT6PF/LgQtu4jxSIcIB8=
X-Google-Smtp-Source: APiQypIKmxbIHfG+e+Jc33rK/FfLjDlNz/lWHfbW1IlovH28UHBQj/q0IgyFlPEjsD0Ep8XuTC678g==
X-Received: by 2002:a9f:3e09:: with SMTP id o9mr8427332uai.143.1588122257752;
        Tue, 28 Apr 2020 18:04:17 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id r136sm5379820vkf.35.2020.04.28.18.04.16
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2020 18:04:17 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id 1so247924vsl.9
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 18:04:16 -0700 (PDT)
X-Received: by 2002:a67:c40c:: with SMTP id c12mr23855086vsk.106.1588122256302;
 Tue, 28 Apr 2020 18:04:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200428172322.1.I396f351e364f3c09df7c7606e79abefb8682c092@changeid>
 <20200428172322.2.Iacb3c8152c3cf9015a91308678155a578b0cc050@changeid>
 <a23b7a97f349e6f74b993a4e127564ad3f7d6929.camel@perches.com>
 <CAD=FV=Us6LyfgeXvxnqq+KhHN1djok1y+W_xzSb-KGFy2wgEMg@mail.gmail.com> <bc5c8165908facbb4781b2f29903dfacdf625e83.camel@perches.com>
In-Reply-To: <bc5c8165908facbb4781b2f29903dfacdf625e83.camel@perches.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 28 Apr 2020 18:04:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VtUEgwwB6C4GhTKx3TP37=i4shtwbG41r=wkELcpNmyQ@mail.gmail.com>
Message-ID: <CAD=FV=VtUEgwwB6C4GhTKx3TP37=i4shtwbG41r=wkELcpNmyQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: Make "offset" and "unsigned int", not just "unsigned"
To:     Joe Perches <joe@perches.com>
Cc:     LinusW <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Tue, Apr 28, 2020 at 5:57 PM Joe Perches <joe@perches.com> wrote:
>
> On Tue, 2020-04-28 at 17:50 -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, Apr 28, 2020 at 5:38 PM Joe Perches <joe@perches.com> wrote:
> > > On Tue, 2020-04-28 at 17:23 -0700, Douglas Anderson wrote:
> > > > When I copied the function prototypes from the GPIO header file into
> > > > my own driver, checkpatch yelled at me saying that I shouldn't use use
> > > > "unsigned" but instead should say "unsigned int".  Let's make the
> > > > header file use "unsigned int" so others who copy like I did won't get
> > > > yelled at.
> > >
> > > There are a few other unsigned declarations in the file.
> >
> > There are?  I swear I looked for them before I sent my patch and I
> > couldn't find them.  Then I looked again upon seeing your reply and I
> > still can't find them.  My eyes are bad, though.  Maybe you can give
> > me specifics?
>
> $ git grep -P -n '\bunsigned\s+(?!int|long)' include/linux/gpio/driver.h
> include/linux/gpio/driver.h:352:                                                unsigned offset);
> include/linux/gpio/driver.h:354:                                                unsigned offset);
> include/linux/gpio/driver.h:356:                                                unsigned offset);
> include/linux/gpio/driver.h:358:                                                unsigned offset);
> include/linux/gpio/driver.h:360:                                                unsigned offset, int value);
> include/linux/gpio/driver.h:362:                                                unsigned offset);
> include/linux/gpio/driver.h:367:                                                unsigned offset, int value);
> include/linux/gpio/driver.h:372:                                              unsigned offset,
> include/linux/gpio/driver.h:375:                                                unsigned offset);
> include/linux/gpio/driver.h:462:                        unsigned offset);
> include/linux/gpio/driver.h:660:int gpiochip_generic_request(struct gpio_chip *gc, unsigned offset);
> include/linux/gpio/driver.h:661:void gpiochip_generic_free(struct gpio_chip *gc, unsigned offset);
> include/linux/gpio/driver.h:662:int gpiochip_generic_config(struct gpio_chip *gc, unsigned offset,

...riiiiiggght.   ...and now I run your sed script _after_ my patch
and I get no hits.  ...so I'm still confused about what you want me to
do that's not already done in my patch.


> > > Maybe do all of them (and remove the unnecessary externs)?
> >
> > You mean just remove the word "extern" everywhere in this file?  Sure,
> > I can if you want.
>
> Up to the actual maintainers I suppose.
> There are only a few extern function declarations.
> Most do not use extern.

OK, maybe I'll wait for Linux W. or Bartosz to weigh in unless there
is some Linux policy against using "extern" in header files?


> > > trivial reformatting of the function pointer block too
> >
> > Wow, I must be totally out of it.  Maybe it's the gin and tonic I just
> > had.  I don't understand this comment either.  Can you clarify?
>
>         int                             (*foo)(...,
>                                                ...);
>
> might be better with fewer tabs between return type and function pointer
>
>         int             (*foo)(..., ...);

I'll wait for Linux W. or Bartosz to weigh in here, since it feels
more like a style decision.  Happy to add a patch for it, though.

-Doug
