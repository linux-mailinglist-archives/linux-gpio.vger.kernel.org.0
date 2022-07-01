Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 013FE562C90
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 09:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232764AbiGAH1H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Jul 2022 03:27:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234878AbiGAH1E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Jul 2022 03:27:04 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE4C06B836
        for <linux-gpio@vger.kernel.org>; Fri,  1 Jul 2022 00:27:02 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id l2so1830556pjf.1
        for <linux-gpio@vger.kernel.org>; Fri, 01 Jul 2022 00:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=lQdq4Xaw9sIg/pmLX+KDnWMe+hlwDaXMfFnvlkfp464=;
        b=Ne1ZtP2iHPJamzI6Bn1cqvH/I1O6eKqU7he+ORf60NzPUVPXtiM7Wu8xeH+6xWf952
         GlGzs8xo3zw6EB3HTyI1m7Emvb6o4yy/vnQnHHbj6C6ekLe+ELQ3btz4/DNRylhNbBis
         cCQdJTwcc+51vEG8PpTsggGPuu4ydEo9Kos2lt+5bf1UY/ts34CVWB/wSynqG8qhpUNt
         1uAQ5Cj0zvH1lOKojCY7xtykCK1mPZOOQ1dMYTvwY5P1B9bBUrMBd9FOdEZVzoyirI3c
         ZUNyq9shjs+cCycRK3B00oSQB+0C4nbCSPo14RULZ2twvdV7WtCuSsym46FGrC/AH146
         w8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=lQdq4Xaw9sIg/pmLX+KDnWMe+hlwDaXMfFnvlkfp464=;
        b=BPwMXbjZ30+xImA8W1TWs+g/Ng65VeR9JFzpB7JAMYScJqE/MuP3XqdIn8HcXkIICa
         LVuU7w6Hnx9oDnJA3JuzPa9k2idWtM9qssmb6/0tXd6/B35L2auda1BAvTf0g8OsMa6n
         /n+9SpDWmWifSl3SVygR9CGiytsHdcaBnAVJ7qEmD40S2cHm8dFKstNqV45qaxDrm6uJ
         wwvOHg/VkfUXKAOiCcvr0AAJVv+/huLO6M2o7tT9RMdhuxcJNm84yIW5ZMqQ71RsCvIi
         4SJ60YP+zPr3DGoLbhzl4asULewWUux2L87qoqlnKOtiMwN1TZbPQY6HF1q+CM9WGaDv
         yjiQ==
X-Gm-Message-State: AJIora/5Pv5BAaUGjBsyxM12TQpQeJMRzyCWl9r3MiYjlZ8V83UHjRBr
        Z0aO7Gq5lYiZ28AJ2CQLBDM=
X-Google-Smtp-Source: AGRyM1uny4plmCREs2eaYfR1e0T9ODiqe411AndYv+foT85t7n43iOSgsiCRDB9jfm4digZwIjpRdA==
X-Received: by 2002:a17:90b:1a88:b0:1ed:5a12:514b with SMTP id ng8-20020a17090b1a8800b001ed5a12514bmr17413349pjb.49.1656660422223;
        Fri, 01 Jul 2022 00:27:02 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id c4-20020a170903234400b0016b9dbcbd51sm5074476plh.94.2022.07.01.00.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 00:27:01 -0700 (PDT)
Date:   Fri, 1 Jul 2022 15:26:55 +0800
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
Message-ID: <20220701072655.GA31738@sol>
References: <20220628084226.472035-1-brgl@bgdev.pl>
 <20220628084226.472035-6-brgl@bgdev.pl>
 <20220630022522.GA17221@sol>
 <CAMRc=MfXqKuj4u9OiBe5Euo8BtRFb06CMZbLOoF6PD2OvJsRWg@mail.gmail.com>
 <20220630081450.GB23652@sol>
 <20220630083851.GA24642@sol>
 <20220701060736.GA28431@sol>
 <CAMRc=Mdhogn2HDR7NYmjugTi6V3zwcw38vmdpfH55f44EPOHRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mdhogn2HDR7NYmjugTi6V3zwcw38vmdpfH55f44EPOHRw@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 01, 2022 at 09:21:58AM +0200, Bartosz Golaszewski wrote:
> On Fri, Jul 1, 2022 at 8:07 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Thu, Jun 30, 2022 at 04:38:51PM +0800, Kent Gibson wrote:
> > > On Thu, Jun 30, 2022 at 04:14:50PM +0800, Kent Gibson wrote:
> > > > On Thu, Jun 30, 2022 at 08:54:24AM +0200, Bartosz Golaszewski wrote:
> > > > > On Thu, Jun 30, 2022 at 4:25 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > > >
> > > > > > On Tue, Jun 28, 2022 at 10:42:26AM +0200, Bartosz Golaszewski wrote:
> > > > > > > This is the implementation of the new python API for libgpiod v2.
> > > > > > >
> > > > > >
> > > > > > [snip]
> > > > > >
> > > > > > > +     }
> > > > > > > +
> > > > > > > +     res = PyObject_Call(method, args, line_cfg_kwargs);
> > > > > > > +     Py_DECREF(args);
> > > > > > > +     Py_DECREF(method);
> > > > > > > +     if (!Py_IsNone(res)) {
> > > > > > > +             Py_DECREF(res);
> > > > > > > +             return NULL;
> > > > > > > +     }
> > > > > > > +
> > > > > >
> > > > > > Building against python 3.9 (the min required by configure.ac) gives:
> > > > > >
> > > > > > module.c:276:7: warning: implicit declaration of function ‘Py_IsNone’; did you mean ‘Py_None’? [-Wimplicit-function-declaration]
> > > > > >   276 |  if (!Py_IsNone(res)) {
> > > > > >       |       ^~~~~~~~~
> > > > > >       |       Py_None
> > > > > >
> > > > > >
> > > > > > Py_IsNone didn't get added to the Stable ABI until 3.10.
> > > > > >
> > > > > > Cheers,
> > > > > > Kent.
> > > > >
> > > > > It seems like most distros still ship python 3.9, I don't want to make
> > > > > 3.10 the requirement. This can be replaced by `if (res != Py_None)`.
> > > > > Are there any more build issues?
> > > > >
> > > >
> > > > No, that was the only one.
> > > >
> > >
> > > But I am seeing a test failure:
> > >
> > > $ sudo bindings/python/tests/gpiod_py_test.py
> > > .............................................................................F................................
> > > ======================================================================
> > > FAIL: test_module_line_request_edge_detection (cases.tests_line_request.ModuleLineRequestWorks)
> > > ----------------------------------------------------------------------
> > > Traceback (most recent call last):
> > >   File "/home/dev/libgpiod/bindings/python/tests/cases/tests_line_request.py", line 71, in test_module_line_request_edge_detection
> > >     self.assertTrue(req.wait_edge_event())
> > > AssertionError: False is not true
> > >
> > > ----------------------------------------------------------------------
> > > Ran 110 tests in 2.652s
> > >
> > > FAILED (failures=1)
> > >
> >
> > The req.wait_edge_event() does not wait without a timeout parameter,
> > which is a bit nonintuitive, so the test has a race.
> 
> Ah, makes sense.
> 
> > Adding a timeout=datetime.timedelta(microseconds=1) (the shortest
> > possible) works for me, so anything that triggers a context switch is
> > probably sufficient, though a longer timeout probably wouldn't hurt.
> >
> 
> I'll change that.
> 
> > The Python API should take timeout=NONE to mean wait indefinitely, and
> > 0 as a poll.
> 
> This makes sense but I'd still want to have some default behavior for
> when timeout is not given. Maybe wait indefinitely?

That is what I said - you get timeout=None if the kwarg is not specified.

> 
> > And it should take the timeout as a float, not a
> > timedelta, as per select.select.  From its doc:
> 
> I don't necessarily want to mirror select's interface. Why would we
> prefer a float over a class that's the standard python interface for
> storing time deltas?
> 

Cos you are forcing the user to create a timedelta, which is a PITA,
and both time.sleep and select.select (i.e. standard Python modules)
do it that way.  The float is the Pythonic way.

Cheers,
Kent.

