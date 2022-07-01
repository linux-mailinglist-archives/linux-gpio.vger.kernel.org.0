Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EA31562D9B
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 10:18:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234025AbiGAISQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Jul 2022 04:18:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236102AbiGAISO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Jul 2022 04:18:14 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF1BCAE55
        for <linux-gpio@vger.kernel.org>; Fri,  1 Jul 2022 01:18:12 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id fd6so1979118edb.5
        for <linux-gpio@vger.kernel.org>; Fri, 01 Jul 2022 01:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wR40lz49WPrCSAsudYF9C4ywNsaTFQUsyyZettZELvs=;
        b=yD6szaLw1iCGs6A7/MPcunGPByjEWxOKsPjW/cyZ5yi1BMqawQT9fDU/1bQSEK9hGM
         j0JxAPBj1kYep38ZYnRfVfR2kOEq4q4vLoh7hMJ1gGjKNRboRyHhOF6TzkVKJ4Kf3bp/
         pFz9KozHaJ2Qc3Zwot2vYMzUdcnyCXXjayv0ZDiIfGQWwJU/su4CCKePxhXvf4yaRZIr
         OlLEd8bEl4P+M0K4Mp4RrGxXxoYqobvXcgdkzbl+1YTY2yVoIfLZD3i4Fcz6UfTzMS8Q
         mc2ZEZNytgbvA1/RcN88BFhN5n6lBfX6cPr9+aoaooKk9eDNPrYwYTxRrI/Wag+VzQHV
         ajjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wR40lz49WPrCSAsudYF9C4ywNsaTFQUsyyZettZELvs=;
        b=HtIEczF+pkZYKxOoVVKaZEacTeZpm0/qO4hhAicY1fgcrVT7Q2HWbzvupqYSvAFvxU
         qctuH3QVR0TQnpMo4hwN6WZBS2demrncK90SURwo6ouAq9bW2Bq6miCNDjCEZjl31e68
         pTg5RJSgC3nJnXFb6fi7KuFkhQXWSlISluEolIZwc44tafW40suX4kbFKJLKxMyzfMfd
         y54HkMsvdTUxcXYqPS0P5ROJQPYkLVcGYb8tJio6QVcUyAwrMPCDIwYihF/m6xeUEUK6
         SE/Fivl4MTr16uF4XbDKy5SYfoFigih9DCJLpUtxGl46aB6US5JblC1B4qx1poIkohnc
         bVZA==
X-Gm-Message-State: AJIora+MrUNkW30YHuSriqCRgmgvf0/xW28ZkWo0gLIqWSoNqOsqOdzo
        KTCTVl5aE66vCXkPQj8WM8WQ84Vhtsp32i00puW48Q==
X-Google-Smtp-Source: AGRyM1sAohrOCOgDcXmSH0VunW7HW4wkOQ14y0OjgV551LCNSj4tlZFaydGOzLvLpWNFSGOCxELHH1hc1uJU1ByaX68=
X-Received: by 2002:a05:6402:d0a:b0:437:66ca:c211 with SMTP id
 eb10-20020a0564020d0a00b0043766cac211mr17463023edb.29.1656663491250; Fri, 01
 Jul 2022 01:18:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220628084226.472035-6-brgl@bgdev.pl> <20220630022522.GA17221@sol>
 <CAMRc=MfXqKuj4u9OiBe5Euo8BtRFb06CMZbLOoF6PD2OvJsRWg@mail.gmail.com>
 <20220630081450.GB23652@sol> <20220630083851.GA24642@sol> <20220701060736.GA28431@sol>
 <CAMRc=Mdhogn2HDR7NYmjugTi6V3zwcw38vmdpfH55f44EPOHRw@mail.gmail.com>
 <20220701072655.GA31738@sol> <CAMRc=McwhnjovSB7RuZQTnZ9tKww=WDvk813Wbmt5PYaK95cPA@mail.gmail.com>
 <20220701073338.GA33559@sol> <20220701080252.GB33559@sol>
In-Reply-To: <20220701080252.GB33559@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 1 Jul 2022 10:18:00 +0200
Message-ID: <CAMRc=Md7vzozjWLBMp8-fJX7Za9wKj9_uzYd9fgz5wE8gSk2AA@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH v2 5/5] bindings: python: add the
 implementation for v2 API
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darrien <darrien@freenet.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jiri Benc <jbenc@upir.cz>, Joel Savitz <joelsavitz@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 1, 2022 at 10:02 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Fri, Jul 01, 2022 at 03:33:38PM +0800, Kent Gibson wrote:
> > On Fri, Jul 01, 2022 at 09:29:53AM +0200, Bartosz Golaszewski wrote:
> > > On Fri, Jul 1, 2022 at 9:27 AM Kent Gibson <warthog618@gmail.com> wro=
te:
> > > >
> > > > On Fri, Jul 01, 2022 at 09:21:58AM +0200, Bartosz Golaszewski wrote=
:
> > > > > On Fri, Jul 1, 2022 at 8:07 AM Kent Gibson <warthog618@gmail.com>=
 wrote:
> > > > > >
> > > > > > On Thu, Jun 30, 2022 at 04:38:51PM +0800, Kent Gibson wrote:
> > > > > > > On Thu, Jun 30, 2022 at 04:14:50PM +0800, Kent Gibson wrote:
> > > > > > > > On Thu, Jun 30, 2022 at 08:54:24AM +0200, Bartosz Golaszews=
ki wrote:
> > > > > > > > > On Thu, Jun 30, 2022 at 4:25 AM Kent Gibson <warthog618@g=
mail.com> wrote:
> > > > > > > > > >
> > > > > > > > > > On Tue, Jun 28, 2022 at 10:42:26AM +0200, Bartosz Golas=
zewski wrote:
> > > > > > > > > > > This is the implementation of the new python API for =
libgpiod v2.
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > [snip]
> > > > > > > > > >
> > > > > > > > > > > +     }
> > > > > > > > > > > +
> > > > > > > > > > > +     res =3D PyObject_Call(method, args, line_cfg_kw=
args);
> > > > > > > > > > > +     Py_DECREF(args);
> > > > > > > > > > > +     Py_DECREF(method);
> > > > > > > > > > > +     if (!Py_IsNone(res)) {
> > > > > > > > > > > +             Py_DECREF(res);
> > > > > > > > > > > +             return NULL;
> > > > > > > > > > > +     }
> > > > > > > > > > > +
> > > > > > > > > >
> > > > > > > > > > Building against python 3.9 (the min required by config=
ure.ac) gives:
> > > > > > > > > >
> > > > > > > > > > module.c:276:7: warning: implicit declaration of functi=
on =E2=80=98Py_IsNone=E2=80=99; did you mean =E2=80=98Py_None=E2=80=99? [-W=
implicit-function-declaration]
> > > > > > > > > >   276 |  if (!Py_IsNone(res)) {
> > > > > > > > > >       |       ^~~~~~~~~
> > > > > > > > > >       |       Py_None
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Py_IsNone didn't get added to the Stable ABI until 3.10=
.
> > > > > > > > > >
> > > > > > > > > > Cheers,
> > > > > > > > > > Kent.
> > > > > > > > >
> > > > > > > > > It seems like most distros still ship python 3.9, I don't=
 want to make
> > > > > > > > > 3.10 the requirement. This can be replaced by `if (res !=
=3D Py_None)`.
> > > > > > > > > Are there any more build issues?
> > > > > > > > >
> > > > > > > >
> > > > > > > > No, that was the only one.
> > > > > > > >
> > > > > > >
> > > > > > > But I am seeing a test failure:
> > > > > > >
> > > > > > > $ sudo bindings/python/tests/gpiod_py_test.py
> > > > > > > .............................................................=
................F................................
> > > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > > FAIL: test_module_line_request_edge_detection (cases.tests_li=
ne_request.ModuleLineRequestWorks)
> > > > > > > -------------------------------------------------------------=
---------
> > > > > > > Traceback (most recent call last):
> > > > > > >   File "/home/dev/libgpiod/bindings/python/tests/cases/tests_=
line_request.py", line 71, in test_module_line_request_edge_detection
> > > > > > >     self.assertTrue(req.wait_edge_event())
> > > > > > > AssertionError: False is not true
> > > > > > >
> > > > > > > -------------------------------------------------------------=
---------
> > > > > > > Ran 110 tests in 2.652s
> > > > > > >
> > > > > > > FAILED (failures=3D1)
> > > > > > >
> > > > > >
> > > > > > The req.wait_edge_event() does not wait without a timeout param=
eter,
> > > > > > which is a bit nonintuitive, so the test has a race.
> > > > >
> > > > > Ah, makes sense.
> > > > >
> > > > > > Adding a timeout=3Ddatetime.timedelta(microseconds=3D1) (the sh=
ortest
> > > > > > possible) works for me, so anything that triggers a context swi=
tch is
> > > > > > probably sufficient, though a longer timeout probably wouldn't =
hurt.
> > > > > >
> > > > >
> > > > > I'll change that.
> > > > >
> > > > > > The Python API should take timeout=3DNONE to mean wait indefini=
tely, and
> > > > > > 0 as a poll.
> > > > >
> > > > > This makes sense but I'd still want to have some default behavior=
 for
> > > > > when timeout is not given. Maybe wait indefinitely?
> > > >
> > > > That is what I said - you get timeout=3DNone if the kwarg is not sp=
ecified.
> > > >
> > > > >
> > > > > > And it should take the timeout as a float, not a
> > > > > > timedelta, as per select.select.  From its doc:
> > > > >
> > > > > I don't necessarily want to mirror select's interface. Why would =
we
> > > > > prefer a float over a class that's the standard python interface =
for
> > > > > storing time deltas?
> > > > >
> > > >
> > > > Cos you are forcing the user to create a timedelta, which is a PITA=
,
> > > > and both time.sleep and select.select (i.e. standard Python modules=
)
> > > > do it that way.  The float is the Pythonic way.
> > > >
> > >
> > > Timedelta constructor is much more explicit than a float IMO. How
> > > about a compromise and taking both (mutually exclusive)?
> > > timeout=3Ddatettime.timedelta(seconds=3D1) =3D=3D timeout_sec=3Dfloat=
(1.0)?
> > >
> >
> > Maybe, but float seconds seems to be the way they do it.
> > If you insist on both then just the one timeout parameter and work the
> > type out on the fly. (it's Python, so dynamic typing...)
> >
>
> Same issue for chip.wait_info_event(), btw.
> Still working through a full review - but it'll probably take a while.
>
> Wrt the wait, does the C API have a blocking wait, or do you have to
> poll() the fd?
>

Blocking wait is simply reading the event without checking if an event
is there to be read. select() (the system call) waits indefinitely if
the timeval struct is NULL, ppoll() behaves the same for a NULL
timespec, poll() does the same for a negative timeout (which is an
int). We take an uint64_t so we can't do it. Either we need to switch
to int64_t and interpret a negative value as indefinite wait or just
not do it at all and tell users to just call the (blocking)
read_edge_event().

Bart

> And can you add a description of the timeout=3D0 behaviour to
> gpiod_chip_wait_info_event() etc, as 0 is sometimes taken as block.
>
