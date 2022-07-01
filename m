Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2C4B562B33
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 08:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234622AbiGAGHt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Jul 2022 02:07:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234116AbiGAGHs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Jul 2022 02:07:48 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46CCF37A13
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jun 2022 23:07:43 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id jb13so1420857plb.9
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jun 2022 23:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=jTYQSjAnAA60oroP8yeAEh1s36txQZos6JSLifEXVyg=;
        b=aO2tqjbgdYuZwV83zVdCkVvChS2vp4+yctHELrxlOhWFMSbcmjbxejsR4E2cilP+Hk
         m2GBrcg0z1XEmCzVMbz93noq+fsmA1qKKxq2vdolfQ6XwazAJDTLCRq4SYsMx943cB91
         gKwC+ij+/afpCcKKWHvo1bEnHslU3Pz8ft1S5uogVNmS7Zbzfj03x/4US/IKeMwuYkE9
         M9YVsIxl/YX9T2+GGXo/jN5YL0im2npkkhszQ0jgQ3ZWk6bsfuR722uCLFnFaJ4DDZvn
         b2TAbvrAYOkynqzIn0BOpvBHSkO3j50e8QkfwptFIYHoTZxU8l9Jh+ZKzv4gVzuXA4lc
         uDKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=jTYQSjAnAA60oroP8yeAEh1s36txQZos6JSLifEXVyg=;
        b=21wH8jlR2ecbo9U7L42+IkRvufaeb8+0GtWfKYrJeXiM/lK10oQND82Y3cqXjMs7Oi
         DTvyZ3rglsPQT7W6BchLVYP3LGawspl1QESz5PjIr/gkvH7ucRIvr2j1OXmo6EEU4kGW
         uAhv2MIa7YeVXNk0KDJ8J70CGTuTerEtWA8WJJVQ7PW5FFs5NQyVtQ1gPxnyITQGCdGV
         d7HehyEHgqLIzoSJqKXSYZTRUGaDnjnRvy9xDr78Lu1exD+g77MjnONyceVjGOVt1XrW
         jEy38J7f97VOGmmjhJBTlDkbSTAdxCuB3Kkx5S1PkGRR8raI3Se9JKIxMHAdzTTpFAQH
         UA4g==
X-Gm-Message-State: AJIora9tnlG06RfOA7lmCerj520XF1mZtph0eHh2N1Zp3nPnv59g/YI5
        FG0cchXahFqpYwed00UWfTw=
X-Google-Smtp-Source: AGRyM1ut/6BMnv9C7vIx49ha7uP7oBZ/229pT2u3AdRa3FNE+/ohFhTPGZkR1W2RnoCYs71aTLtn+g==
X-Received: by 2002:a17:90b:3b92:b0:1ed:27b7:5457 with SMTP id pc18-20020a17090b3b9200b001ed27b75457mr14249435pjb.85.1656655662717;
        Thu, 30 Jun 2022 23:07:42 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id g4-20020a655944000000b003fe4da67980sm14354043pgu.68.2022.06.30.23.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 23:07:42 -0700 (PDT)
Date:   Fri, 1 Jul 2022 14:07:36 +0800
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
Message-ID: <20220701060736.GA28431@sol>
References: <20220628084226.472035-1-brgl@bgdev.pl>
 <20220628084226.472035-6-brgl@bgdev.pl>
 <20220630022522.GA17221@sol>
 <CAMRc=MfXqKuj4u9OiBe5Euo8BtRFb06CMZbLOoF6PD2OvJsRWg@mail.gmail.com>
 <20220630081450.GB23652@sol>
 <20220630083851.GA24642@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220630083851.GA24642@sol>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 30, 2022 at 04:38:51PM +0800, Kent Gibson wrote:
> On Thu, Jun 30, 2022 at 04:14:50PM +0800, Kent Gibson wrote:
> > On Thu, Jun 30, 2022 at 08:54:24AM +0200, Bartosz Golaszewski wrote:
> > > On Thu, Jun 30, 2022 at 4:25 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > On Tue, Jun 28, 2022 at 10:42:26AM +0200, Bartosz Golaszewski wrote:
> > > > > This is the implementation of the new python API for libgpiod v2.
> > > > >
> > > >
> > > > [snip]
> > > >
> > > > > +     }
> > > > > +
> > > > > +     res = PyObject_Call(method, args, line_cfg_kwargs);
> > > > > +     Py_DECREF(args);
> > > > > +     Py_DECREF(method);
> > > > > +     if (!Py_IsNone(res)) {
> > > > > +             Py_DECREF(res);
> > > > > +             return NULL;
> > > > > +     }
> > > > > +
> > > >
> > > > Building against python 3.9 (the min required by configure.ac) gives:
> > > >
> > > > module.c:276:7: warning: implicit declaration of function ‘Py_IsNone’; did you mean ‘Py_None’? [-Wimplicit-function-declaration]
> > > >   276 |  if (!Py_IsNone(res)) {
> > > >       |       ^~~~~~~~~
> > > >       |       Py_None
> > > >
> > > >
> > > > Py_IsNone didn't get added to the Stable ABI until 3.10.
> > > >
> > > > Cheers,
> > > > Kent.
> > > 
> > > It seems like most distros still ship python 3.9, I don't want to make
> > > 3.10 the requirement. This can be replaced by `if (res != Py_None)`.
> > > Are there any more build issues?
> > > 
> > 
> > No, that was the only one.
> > 
> 
> But I am seeing a test failure:
> 
> $ sudo bindings/python/tests/gpiod_py_test.py
> .............................................................................F................................
> ======================================================================
> FAIL: test_module_line_request_edge_detection (cases.tests_line_request.ModuleLineRequestWorks)
> ----------------------------------------------------------------------
> Traceback (most recent call last):
>   File "/home/dev/libgpiod/bindings/python/tests/cases/tests_line_request.py", line 71, in test_module_line_request_edge_detection
>     self.assertTrue(req.wait_edge_event())
> AssertionError: False is not true
> 
> ----------------------------------------------------------------------
> Ran 110 tests in 2.652s
> 
> FAILED (failures=1)
> 

The req.wait_edge_event() does not wait without a timeout parameter,
which is a bit nonintuitive, so the test has a race.
Adding a timeout=datetime.timedelta(microseconds=1) (the shortest
possible) works for me, so anything that triggers a context switch is
probably sufficient, though a longer timeout probably wouldn't hurt.

The Python API should take timeout=NONE to mean wait indefinitely, and
0 as a poll.  And it should take the timeout as a float, not a
timedelta, as per select.select.  From its doc:
"The optional timeout argument specifies a time-out as a floating point
number in seconds. When the timeout argument is omitted the function
blocks until at least one file descriptor is ready. A time-out value of
zero specifies a poll and never blocks."

Cheers,
Kent.

