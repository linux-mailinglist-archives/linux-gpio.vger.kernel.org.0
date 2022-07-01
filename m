Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CD50562D60
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 10:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236036AbiGAIDL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Jul 2022 04:03:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236228AbiGAIDF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Jul 2022 04:03:05 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E481A70AC2
        for <linux-gpio@vger.kernel.org>; Fri,  1 Jul 2022 01:02:58 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id 23so1719495pgc.8
        for <linux-gpio@vger.kernel.org>; Fri, 01 Jul 2022 01:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=O3ugFhhuMR17OE34tL+p0WHZu+n80vbTKURX5KvkluM=;
        b=SIdtVvKWrPdzRq8oNFO6ffOy1XEYWkTUQYq6jV+Mr7JiiaAQbxpTztTQ61KW8oumWL
         SKR9E4isKe8S8k9IjFYwnuRSVpf9/zWjsbW3xYGIiF5NFco4zVKmvuKEjuNMtW62pA3q
         1izfcDOwtk2B2az2IsVyGt6Ko4zwDphJ4tpQrw+TgVlHMveNtjLlfAt3hEtiPsT+MfrQ
         o7uedP5aIgAieIiowNNYpYvGOorgDZAvz2YhhtnSrf9otnX4mfFtJq6CQvTQtpQ9hh+y
         x5CYgrdetiKCT/nZdSlisBCAr1jDp0WbVKy2osycKJYE7/6Y1wYt2W/cXHK5BIIRilzF
         EQ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=O3ugFhhuMR17OE34tL+p0WHZu+n80vbTKURX5KvkluM=;
        b=LGNjWp3xITAo9HlpoiqMb9Ov9anmg3TUPpOeX9HT3kgnUyiQL0ikt6cMrnaJm8UyGn
         VuHU9DufAdnUWYlgMNgtPpbTGNeYekVzLwEG44gWY8D1jVNvde0UYkTUXoRvquyiMOg7
         hNZd9NRM3JgJ4nTZuIudgrgd+ZrY+XEAeYfN7FpdbH0BzHB8QlX6sKVE5u5Cu04lwEgg
         zr8ZyfedmbV3cIGKb8fy7BJDQF68ym5/+B6ZjBKouyTERNMTnWKDMbBh3T+DqGHBCL1m
         3r+BN0lWbKXA/Y9QpxpvqiDD66zzAl84njjnymD37wcadbXbjzG2fCItT8jVOQJRnl07
         5qEQ==
X-Gm-Message-State: AJIora8OgqGtVVZCWodVoXBSy01PyRzGiTHRcjwSKjeIPxxkMlM7JhvC
        hBtWQTxtFoOW1nRVOldK9yXeGWYpv2E=
X-Google-Smtp-Source: AGRyM1tTGMHufVOj5ZKW4It9mQKX2uusq/gPDDc0sj53C7qLmO4C74bkZ2PEX6UKP5xZTm+6mNEx1g==
X-Received: by 2002:a65:6d0a:0:b0:408:8af8:bd77 with SMTP id bf10-20020a656d0a000000b004088af8bd77mr11087676pgb.563.1656662578424;
        Fri, 01 Jul 2022 01:02:58 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id n24-20020a170902969800b0016a034ae481sm14816984plp.176.2022.07.01.01.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 01:02:57 -0700 (PDT)
Date:   Fri, 1 Jul 2022 16:02:52 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darrien <darrien@freenet.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jiri Benc <jbenc@upir.cz>, Joel Savitz <joelsavitz@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod v2][PATCH v2 5/5] bindings: python: add the
 implementation for v2 API
Message-ID: <20220701080252.GB33559@sol>
References: <20220628084226.472035-6-brgl@bgdev.pl>
 <20220630022522.GA17221@sol>
 <CAMRc=MfXqKuj4u9OiBe5Euo8BtRFb06CMZbLOoF6PD2OvJsRWg@mail.gmail.com>
 <20220630081450.GB23652@sol>
 <20220630083851.GA24642@sol>
 <20220701060736.GA28431@sol>
 <CAMRc=Mdhogn2HDR7NYmjugTi6V3zwcw38vmdpfH55f44EPOHRw@mail.gmail.com>
 <20220701072655.GA31738@sol>
 <CAMRc=McwhnjovSB7RuZQTnZ9tKww=WDvk813Wbmt5PYaK95cPA@mail.gmail.com>
 <20220701073338.GA33559@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220701073338.GA33559@sol>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 01, 2022 at 03:33:38PM +0800, Kent Gibson wrote:
> On Fri, Jul 01, 2022 at 09:29:53AM +0200, Bartosz Golaszewski wrote:
> > On Fri, Jul 1, 2022 at 9:27 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > On Fri, Jul 01, 2022 at 09:21:58AM +0200, Bartosz Golaszewski wrote:
> > > > On Fri, Jul 1, 2022 at 8:07 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > >
> > > > > On Thu, Jun 30, 2022 at 04:38:51PM +0800, Kent Gibson wrote:
> > > > > > On Thu, Jun 30, 2022 at 04:14:50PM +0800, Kent Gibson wrote:
> > > > > > > On Thu, Jun 30, 2022 at 08:54:24AM +0200, Bartosz Golaszewski wrote:
> > > > > > > > On Thu, Jun 30, 2022 at 4:25 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > > > > > >
> > > > > > > > > On Tue, Jun 28, 2022 at 10:42:26AM +0200, Bartosz Golaszewski wrote:
> > > > > > > > > > This is the implementation of the new python API for libgpiod v2.
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > [snip]
> > > > > > > > >
> > > > > > > > > > +     }
> > > > > > > > > > +
> > > > > > > > > > +     res = PyObject_Call(method, args, line_cfg_kwargs);
> > > > > > > > > > +     Py_DECREF(args);
> > > > > > > > > > +     Py_DECREF(method);
> > > > > > > > > > +     if (!Py_IsNone(res)) {
> > > > > > > > > > +             Py_DECREF(res);
> > > > > > > > > > +             return NULL;
> > > > > > > > > > +     }
> > > > > > > > > > +
> > > > > > > > >
> > > > > > > > > Building against python 3.9 (the min required by configure.ac) gives:
> > > > > > > > >
> > > > > > > > > module.c:276:7: warning: implicit declaration of function ‘Py_IsNone’; did you mean ‘Py_None’? [-Wimplicit-function-declaration]
> > > > > > > > >   276 |  if (!Py_IsNone(res)) {
> > > > > > > > >       |       ^~~~~~~~~
> > > > > > > > >       |       Py_None
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > Py_IsNone didn't get added to the Stable ABI until 3.10.
> > > > > > > > >
> > > > > > > > > Cheers,
> > > > > > > > > Kent.
> > > > > > > >
> > > > > > > > It seems like most distros still ship python 3.9, I don't want to make
> > > > > > > > 3.10 the requirement. This can be replaced by `if (res != Py_None)`.
> > > > > > > > Are there any more build issues?
> > > > > > > >
> > > > > > >
> > > > > > > No, that was the only one.
> > > > > > >
> > > > > >
> > > > > > But I am seeing a test failure:
> > > > > >
> > > > > > $ sudo bindings/python/tests/gpiod_py_test.py
> > > > > > .............................................................................F................................
> > > > > > ======================================================================
> > > > > > FAIL: test_module_line_request_edge_detection (cases.tests_line_request.ModuleLineRequestWorks)
> > > > > > ----------------------------------------------------------------------
> > > > > > Traceback (most recent call last):
> > > > > >   File "/home/dev/libgpiod/bindings/python/tests/cases/tests_line_request.py", line 71, in test_module_line_request_edge_detection
> > > > > >     self.assertTrue(req.wait_edge_event())
> > > > > > AssertionError: False is not true
> > > > > >
> > > > > > ----------------------------------------------------------------------
> > > > > > Ran 110 tests in 2.652s
> > > > > >
> > > > > > FAILED (failures=1)
> > > > > >
> > > > >
> > > > > The req.wait_edge_event() does not wait without a timeout parameter,
> > > > > which is a bit nonintuitive, so the test has a race.
> > > >
> > > > Ah, makes sense.
> > > >
> > > > > Adding a timeout=datetime.timedelta(microseconds=1) (the shortest
> > > > > possible) works for me, so anything that triggers a context switch is
> > > > > probably sufficient, though a longer timeout probably wouldn't hurt.
> > > > >
> > > >
> > > > I'll change that.
> > > >
> > > > > The Python API should take timeout=NONE to mean wait indefinitely, and
> > > > > 0 as a poll.
> > > >
> > > > This makes sense but I'd still want to have some default behavior for
> > > > when timeout is not given. Maybe wait indefinitely?
> > >
> > > That is what I said - you get timeout=None if the kwarg is not specified.
> > >
> > > >
> > > > > And it should take the timeout as a float, not a
> > > > > timedelta, as per select.select.  From its doc:
> > > >
> > > > I don't necessarily want to mirror select's interface. Why would we
> > > > prefer a float over a class that's the standard python interface for
> > > > storing time deltas?
> > > >
> > >
> > > Cos you are forcing the user to create a timedelta, which is a PITA,
> > > and both time.sleep and select.select (i.e. standard Python modules)
> > > do it that way.  The float is the Pythonic way.
> > >
> > 
> > Timedelta constructor is much more explicit than a float IMO. How
> > about a compromise and taking both (mutually exclusive)?
> > timeout=datettime.timedelta(seconds=1) == timeout_sec=float(1.0)?
> > 
> 
> Maybe, but float seconds seems to be the way they do it.
> If you insist on both then just the one timeout parameter and work the
> type out on the fly. (it's Python, so dynamic typing...)
> 

Same issue for chip.wait_info_event(), btw.
Still working through a full review - but it'll probably take a while.

Wrt the wait, does the C API have a blocking wait, or do you have to
poll() the fd?

And can you add a description of the timeout=0 behaviour to
gpiod_chip_wait_info_event() etc, as 0 is sometimes taken as block.

Cheers,
Kent.

