Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E37E56A1DD
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jul 2022 14:22:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235540AbiGGMWv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Jul 2022 08:22:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235186AbiGGMWt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Jul 2022 08:22:49 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A08C227158
        for <linux-gpio@vger.kernel.org>; Thu,  7 Jul 2022 05:22:48 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id y141so19017003pfb.7
        for <linux-gpio@vger.kernel.org>; Thu, 07 Jul 2022 05:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=U+NFT8m9/rVhPNhSw9wwQbwP67czxDm8+mnTNm42ngo=;
        b=Y8LZeBMvast8Q9aCHgoni1ebmYOOIaB9euBvZ4EeMgeBD0Qc2jBJv9W8uTRbbTIj1F
         lrkBFp3moFGK8hQx5snq7yMhQbGxrSN0r5JkbMctxr0icG8oxOzBu6ZWfm7tzfYf2LvO
         Abc1nq4bItpXFXzQG+eExR+tCqsuGxzvW7UDH2m3j76U3mkmwJS8TmNqn9YOxZD0cebY
         EAm730XSQHIhpKnwqrSZ/cEZGH+hLEKv1/YbrNLsorqiHmqPpl0ZyRxm5eWmeMctQtUW
         BJ+6A1oEuwk959o+1UU7yTb7ed9nePRz+i3lGhvGhiHLc5oNmm6mwPfq41cXHjp84++Y
         9nlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=U+NFT8m9/rVhPNhSw9wwQbwP67czxDm8+mnTNm42ngo=;
        b=xH2LZBQejsuBw5r3mSaHFFgpAC36Lu9RJhInWuAav3UzAN77Bk5tONM9YCtiXTu/LI
         dAB12gIN8t+7sM67lWD4QhV5e/fg4x0d/BXRCUPs1Jog8GQrtxd77uCGGm8YbvkeCSeT
         l3xNfNIkWNGMF7QBBhU+mHceaY9PyJiI2tf11SdysrqDP/S/KksiVzyzcYS+wrLXUbT3
         LJ1nc2ilElT2uoC5tfehwOKrfcUDwboEutbiVcgnENRrYFPSJSkEis4S4GTwo30biKdf
         3Jg/6JVKcHBAjmygqPc92FIF6IPsIg3PaH8TugquMQt3PCX0Ffm3hLe7Lmedg7+tqp6z
         wu4A==
X-Gm-Message-State: AJIora/itdVbMM5wPxIQUjXUKQy474ShLxJHQcaE3SPNTrSGZ+V8kxK0
        NujolcjYYpMzPeJLGJ5ExzI=
X-Google-Smtp-Source: AGRyM1sYQwriuDfacGzVSttYqhavGFndnEXs8Jew37soTPwyjVnI8hFz56gaPCEIchXIvPtPVCpA6w==
X-Received: by 2002:a63:5a21:0:b0:3fd:41e4:f833 with SMTP id o33-20020a635a21000000b003fd41e4f833mr38909276pgb.409.1657196568012;
        Thu, 07 Jul 2022 05:22:48 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id t16-20020aa79390000000b0052521fd273fsm26747262pfe.218.2022.07.07.05.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 05:22:47 -0700 (PDT)
Date:   Thu, 7 Jul 2022 20:22:42 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darrien <darrien@freenet.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jiri Benc <jbenc@upir.cz>, Joel Savitz <joelsavitz@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod v2][PATCH v2 4/5] bindings: python: add tests for v2
 API
Message-ID: <20220707122242.GA66970@sol>
References: <20220628084226.472035-1-brgl@bgdev.pl>
 <20220628084226.472035-5-brgl@bgdev.pl>
 <20220705020845.GA6652@sol>
 <CAMRc=MegkfLxQr5tEWdn0jOoC=PzpZPHTtqUtk6QEr8ZZU4o0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MegkfLxQr5tEWdn0jOoC=PzpZPHTtqUtk6QEr8ZZU4o0g@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 07, 2022 at 12:17:17PM +0200, Bartosz Golaszewski wrote:
> On Tue, Jul 5, 2022 at 4:08 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Tue, Jun 28, 2022 at 10:42:25AM +0200, Bartosz Golaszewski wrote:
> > > This adds a python wrapper around libgpiosim and a set of test cases
> > > for the v2 API using python's standard unittest module.
> > >
> > > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > > ---
> > >  bindings/python/tests/Makefile.am             |  14 +
> > >  bindings/python/tests/cases/__init__.py       |  12 +
> > >  bindings/python/tests/cases/tests_chip.py     | 157 +++++++
> > >  .../python/tests/cases/tests_chip_info.py     |  59 +++
> > >  .../python/tests/cases/tests_edge_event.py    | 279 +++++++++++
> > >  .../python/tests/cases/tests_info_event.py    | 135 ++++++
> > >  .../python/tests/cases/tests_line_config.py   | 254 ++++++++++
> > >  .../python/tests/cases/tests_line_info.py     |  90 ++++
> > >  .../python/tests/cases/tests_line_request.py  | 345 ++++++++++++++
> > >  bindings/python/tests/cases/tests_misc.py     |  53 +++
> > >  .../tests/cases/tests_request_config.py       |  77 ++++
> > >  bindings/python/tests/gpiod_py_test.py        |  25 +
> > >  bindings/python/tests/gpiosimmodule.c         | 434 ++++++++++++++++++
> > >  13 files changed, 1934 insertions(+)
> > >  create mode 100644 bindings/python/tests/Makefile.am
> > >  create mode 100644 bindings/python/tests/cases/__init__.py
> > >  create mode 100644 bindings/python/tests/cases/tests_chip.py
> > >  create mode 100644 bindings/python/tests/cases/tests_chip_info.py
> > >  create mode 100644 bindings/python/tests/cases/tests_edge_event.py
> > >  create mode 100644 bindings/python/tests/cases/tests_info_event.py
> > >  create mode 100644 bindings/python/tests/cases/tests_line_config.py
> > >  create mode 100644 bindings/python/tests/cases/tests_line_info.py
> > >  create mode 100644 bindings/python/tests/cases/tests_line_request.py
> > >  create mode 100644 bindings/python/tests/cases/tests_misc.py
> > >  create mode 100644 bindings/python/tests/cases/tests_request_config.py
> > >  create mode 100755 bindings/python/tests/gpiod_py_test.py
> > >  create mode 100644 bindings/python/tests/gpiosimmodule.c
> > >
> > > diff --git a/bindings/python/tests/Makefile.am b/bindings/python/tests/Makefile.am
> > > new file mode 100644
> > > index 0000000..099574f
> > > --- /dev/null
> > > +++ b/bindings/python/tests/Makefile.am
> > > @@ -0,0 +1,14 @@
> > > +# SPDX-License-Identifier: GPL-2.0-or-later
> > > +# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
> > > +
> >
> > It is 2022?
> >
> > Which email address are you going with?  gmail here and bgdev below.
> >
> 
> These patches will be squashed together anyway. When I wrote this part
> I used this email and then switched to brgl@bgdev.pl. It's just
> copyright anyway. I can fix it up later.
> 
> [snip!]
> 
> > > +
> > > +    def test_falling_edge_event(self):
> > > +        with gpiod.request_lines(
> > > +            self.sim.dev_path,
> > > +            gpiod.RequestConfig(offsets=[6]),
> > > +            gpiod.LineConfig(edge_detection=Edge.FALLING),
> > > +        ) as req:
> > > +            buf = gpiod.EdgeEventBuffer()
> > > +            self.thread = threading.Thread(
> > > +                target=partial(self.trigger_falling_and_rising_edge, 6)
> > > +            )
> > > +            self.thread.start()
> > > +
> >
> > Benefit of the thread? (and elsewhere a background thread is used)
> > The sleeps therein are only necessary because it is run in the
> > background.
> >
> 
> Just to make it similar to real-life applications. I did the same for
> C++ and C. And no: if I triggered multiple events without any sleeps
> in between, then some of them would risk not being registered. You can
> try it for yourself with gpiosim. It happens because when the kernel
> irq_work is busy adding an interrupt, new ones get ignored.
> 

I know, and I still don't think that this is the place for that.
I'd rather see some example code do that.
If you want to add some threaded tests in then sure, do that, but the
tests do not really need it - it just makes them more complicated than
you require.

Sure, you can't issue multiple events on a single gpio-sim line without
waiting for the result, but you never need to.  You toggle a line
and check the result.  Toggle a line, check a result.
All from the main thread.

And yeah, it is a bit disconcerting that userspace can toggle the
gpio-sim line faster than the interrupt handling in the kernel can
manage.  But I can live with that.

> [nsip]
> 
> >
> > These tests should be in tests_chip.py, as they are testing the
> > Chip.request_lines() method.
> >
> 
> I would argue that there's some overlap in where the test cases should
> live. For instance - if we moved the line watching out of
> tests_info_event into tests_chip then not much would be left. I would
> leave these here as they test the general idea of requesting lines
> rather than the functionality of class LineRequest. Same for the
> module level line requests.
> 

And I would argue the reverse - that overlap is imaginary.
This is just basic discoverability.
I looked in the tests_chip.py for the tests for Chip.request_lines(), so a
method on a Chip and implemented in chip.c, and found nothing.
Putting them in tests_line_request.py because that is what they
construct is a wee bit unintuitive.

The tests in test_line_request.py will certainly need to call
Chip.request_lines(), as that is effectively the constructor, but I
would only epxect to see successful Chip.request_lines() there as part
of the test setup, not the test proper.  All the failure cases should be
in tests_chip.py, and of course some success cases as well.
But that isn't overlap.

In general the tests in tests_<blah>.py should be for the methods
implemented in <blah>.c.  In the case of InfoEvent, that might not be
much, but you get that - it is a tiny module.  Those tests being
lonely is not a good reason to move tests in from tests_chip.c.

Cheers,
Kent.
