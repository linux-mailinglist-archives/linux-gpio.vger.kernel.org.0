Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C696562CB6
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 09:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232553AbiGAHdr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Jul 2022 03:33:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231426AbiGAHdq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Jul 2022 03:33:46 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C7FB3EAAC
        for <linux-gpio@vger.kernel.org>; Fri,  1 Jul 2022 00:33:45 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id k14so1614784plh.4
        for <linux-gpio@vger.kernel.org>; Fri, 01 Jul 2022 00:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=wQPg7sqPNqUkajsWrfLfM3qpnEEgKHkfPSoC1c9vlyM=;
        b=FOwFeFUCoFzw8I2vzQJ/xsVCnFTGViQ+45ldNXqtDP5msN1dcwQyrUaXFq0J4/E9r6
         JoxY5Td2MltX+kLk7qUSB/gzSgG3To3GgwI4mXvPbpgbilKKzp1Yb9YokKsB7n1xWyRL
         8gapHBoZ3u1UNDGdU9GI5eauKjRhRn8dIlMXpA3vTn+9YuRWgkQw23174O01aLQZ+dw0
         0XYqdEbHtX9ifiEXqTbEhaeujhyEnNNblJYWbcbLp+ctNu1Nz4yWicldSc/b9+bCuuPv
         +6/fWSCG2bfsxt1LjxiI2H9eumYVKwjQMo2uwJ8yejafQI7yozKqQvYF5VXFN4qELddc
         QgnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=wQPg7sqPNqUkajsWrfLfM3qpnEEgKHkfPSoC1c9vlyM=;
        b=G17KzMe4C9/twufeREjnJ7vh8HDEkIq5vHE6W/hp2K/35/JUOJ/qguLlEPJQPaOa7u
         C/RHDeiXU0GGZnQfNpa6vkYgFHMeZ38BYAewuV+gzQoFjoXxGK42ZWo55rSUng2AHTEt
         3qHlwjhwN6FbHhG1deRB9RRZhUdQj+xN8g9E58gV0qJbC8jyOrgP1BuVoP6q60WN44At
         kwrQkyfskS9Hw0t0lBUD6KQ6XsHFbI4JKyMUqv4NoQTDozOXLL+7GeZ3ULVAPbwS41fD
         DLq3jB7ckBIgz5QtbTfvyb63RAsf5tlcRFL8nBsIwM9hrbMdVQC0Zfxth8rLRjWbpuE4
         f/Jw==
X-Gm-Message-State: AJIora8a3NX9fFeGNqP2OO3MJz0XrHy5ZrkSvmXJvvyaGEyJnH9jsJ4a
        +mdu1VUXt20r/pF5nGfDkVQ=
X-Google-Smtp-Source: AGRyM1spvHZFEFZ64uE3tvNMcCnzUx0/SM+GxvNz94WSt9nZfoI4RpjF2NMqaRMVige31ixrfGtZ0w==
X-Received: by 2002:a17:90b:3557:b0:1ec:cd27:1ca9 with SMTP id lt23-20020a17090b355700b001eccd271ca9mr16710043pjb.148.1656660825000;
        Fri, 01 Jul 2022 00:33:45 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id 3-20020a17090a0cc300b001ec9d45776bsm3234783pjt.42.2022.07.01.00.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 00:33:44 -0700 (PDT)
Date:   Fri, 1 Jul 2022 15:33:38 +0800
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
Message-ID: <20220701073338.GA33559@sol>
References: <20220628084226.472035-1-brgl@bgdev.pl>
 <20220628084226.472035-6-brgl@bgdev.pl>
 <20220630022522.GA17221@sol>
 <CAMRc=MfXqKuj4u9OiBe5Euo8BtRFb06CMZbLOoF6PD2OvJsRWg@mail.gmail.com>
 <20220630081450.GB23652@sol>
 <20220630083851.GA24642@sol>
 <20220701060736.GA28431@sol>
 <CAMRc=Mdhogn2HDR7NYmjugTi6V3zwcw38vmdpfH55f44EPOHRw@mail.gmail.com>
 <20220701072655.GA31738@sol>
 <CAMRc=McwhnjovSB7RuZQTnZ9tKww=WDvk813Wbmt5PYaK95cPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McwhnjovSB7RuZQTnZ9tKww=WDvk813Wbmt5PYaK95cPA@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 01, 2022 at 09:29:53AM +0200, Bartosz Golaszewski wrote:
> On Fri, Jul 1, 2022 at 9:27 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Fri, Jul 01, 2022 at 09:21:58AM +0200, Bartosz Golaszewski wrote:
> > > On Fri, Jul 1, 2022 at 8:07 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > On Thu, Jun 30, 2022 at 04:38:51PM +0800, Kent Gibson wrote:
> > > > > On Thu, Jun 30, 2022 at 04:14:50PM +0800, Kent Gibson wrote:
> > > > > > On Thu, Jun 30, 2022 at 08:54:24AM +0200, Bartosz Golaszewski wrote:
> > > > > > > On Thu, Jun 30, 2022 at 4:25 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > > > > >
> > > > > > > > On Tue, Jun 28, 2022 at 10:42:26AM +0200, Bartosz Golaszewski wrote:
> > > > > > > > > This is the implementation of the new python API for libgpiod v2.
> > > > > > > > >
> > > > > > > >
> > > > > > > > [snip]
> > > > > > > >
> > > > > > > > > +     }
> > > > > > > > > +
> > > > > > > > > +     res = PyObject_Call(method, args, line_cfg_kwargs);
> > > > > > > > > +     Py_DECREF(args);
> > > > > > > > > +     Py_DECREF(method);
> > > > > > > > > +     if (!Py_IsNone(res)) {
> > > > > > > > > +             Py_DECREF(res);
> > > > > > > > > +             return NULL;
> > > > > > > > > +     }
> > > > > > > > > +
> > > > > > > >
> > > > > > > > Building against python 3.9 (the min required by configure.ac) gives:
> > > > > > > >
> > > > > > > > module.c:276:7: warning: implicit declaration of function ‘Py_IsNone’; did you mean ‘Py_None’? [-Wimplicit-function-declaration]
> > > > > > > >   276 |  if (!Py_IsNone(res)) {
> > > > > > > >       |       ^~~~~~~~~
> > > > > > > >       |       Py_None
> > > > > > > >
> > > > > > > >
> > > > > > > > Py_IsNone didn't get added to the Stable ABI until 3.10.
> > > > > > > >
> > > > > > > > Cheers,
> > > > > > > > Kent.
> > > > > > >
> > > > > > > It seems like most distros still ship python 3.9, I don't want to make
> > > > > > > 3.10 the requirement. This can be replaced by `if (res != Py_None)`.
> > > > > > > Are there any more build issues?
> > > > > > >
> > > > > >
> > > > > > No, that was the only one.
> > > > > >
> > > > >
> > > > > But I am seeing a test failure:
> > > > >
> > > > > $ sudo bindings/python/tests/gpiod_py_test.py
> > > > > .............................................................................F................................
> > > > > ======================================================================
> > > > > FAIL: test_module_line_request_edge_detection (cases.tests_line_request.ModuleLineRequestWorks)
> > > > > ----------------------------------------------------------------------
> > > > > Traceback (most recent call last):
> > > > >   File "/home/dev/libgpiod/bindings/python/tests/cases/tests_line_request.py", line 71, in test_module_line_request_edge_detection
> > > > >     self.assertTrue(req.wait_edge_event())
> > > > > AssertionError: False is not true
> > > > >
> > > > > ----------------------------------------------------------------------
> > > > > Ran 110 tests in 2.652s
> > > > >
> > > > > FAILED (failures=1)
> > > > >
> > > >
> > > > The req.wait_edge_event() does not wait without a timeout parameter,
> > > > which is a bit nonintuitive, so the test has a race.
> > >
> > > Ah, makes sense.
> > >
> > > > Adding a timeout=datetime.timedelta(microseconds=1) (the shortest
> > > > possible) works for me, so anything that triggers a context switch is
> > > > probably sufficient, though a longer timeout probably wouldn't hurt.
> > > >
> > >
> > > I'll change that.
> > >
> > > > The Python API should take timeout=NONE to mean wait indefinitely, and
> > > > 0 as a poll.
> > >
> > > This makes sense but I'd still want to have some default behavior for
> > > when timeout is not given. Maybe wait indefinitely?
> >
> > That is what I said - you get timeout=None if the kwarg is not specified.
> >
> > >
> > > > And it should take the timeout as a float, not a
> > > > timedelta, as per select.select.  From its doc:
> > >
> > > I don't necessarily want to mirror select's interface. Why would we
> > > prefer a float over a class that's the standard python interface for
> > > storing time deltas?
> > >
> >
> > Cos you are forcing the user to create a timedelta, which is a PITA,
> > and both time.sleep and select.select (i.e. standard Python modules)
> > do it that way.  The float is the Pythonic way.
> >
> 
> Timedelta constructor is much more explicit than a float IMO. How
> about a compromise and taking both (mutually exclusive)?
> timeout=datettime.timedelta(seconds=1) == timeout_sec=float(1.0)?
> 

Maybe, but float seconds seems to be the way they do it.
If you insist on both then just the one timeout parameter and work the
type out on the fly. (it's Python, so dynamic typing...)

Cheers,
Kent.
