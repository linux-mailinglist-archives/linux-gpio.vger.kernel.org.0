Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92138562C9D
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 09:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231313AbiGAHaN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Jul 2022 03:30:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230523AbiGAHaM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Jul 2022 03:30:12 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D8B16B832
        for <linux-gpio@vger.kernel.org>; Fri,  1 Jul 2022 00:30:05 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id sb34so2414888ejc.11
        for <linux-gpio@vger.kernel.org>; Fri, 01 Jul 2022 00:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bTlnTEQMlYEcUGki7b0wIvMX6eHCcDB3bfvbS0u/EEY=;
        b=aHwfEdkJ3BHAG6ngxv2AlUyDtYrE1X8WQOMWC7/iT5uvYvejPqb5EnJQLIbqnoV2fN
         ABQAhP0BFaGATcOE5ilV3wDQyeFvpc67B3Ay4Q7kpWR3hIlY2fej3AO856XFDgJxy/Pg
         EHVMrl/F4QboPzkAAEBTWC769AZB0wZ3XnomerwysyOOvEWVXwozc4IJJgowsPO2LpOJ
         SXGLe2wDVncL58VcNcbGR12TQI1/opkugf7D1uuLmLWsNFzu6krRUZenVJ3Lfr8ZmYKZ
         0bcp4Bzh8CCevATlz3u8uJUJNkpoB6EbK16wNzHJAkm+DKwoLM/rP29p6Oq7lqhok5WE
         lPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bTlnTEQMlYEcUGki7b0wIvMX6eHCcDB3bfvbS0u/EEY=;
        b=wKFb3JxpVE1gE7ml30OdweGjalk1rutfnLAGIksikTs70WoikP2FXEerCoi9Kx8Zqs
         AEw5xdahe3B2p+TS5y/BHNUKCUOFurYtIBuM58EkX4doyxIESh8YlvE89RvZAYWnRZLA
         W1UYuX4AFNDHShW31/XBb4FcRBFdwk4ac3rw/91MyljdinOPQr9mVmAo1SR02N1eqb4W
         Urjlb95qScW/jZSA8jygtTVl4sANvUtSiXzuF3X4/yBiP3flHqA047YhiSoGNSphA0If
         1XonBC1rhYbd81OwQ8N4bHWv2Bwi5KbjKF0tSpLuh/4ZU32N2HXoYSMZKUV884s4z0sp
         /nxw==
X-Gm-Message-State: AJIora8kQyyZnwP+8V7lWcyeFnc/V5LJM3zJ8u4KO7Zt5N1+6cL55tDY
        v4n0wDxjc1r+ZfrprKsn8RGdf4C4rpWZcpagbG/MGA==
X-Google-Smtp-Source: AGRyM1tUOvwmC085qKIO326Gt2KqRv1j2QYPL15JpTX4DK5NJeWcFOHs2DJb9+s5SS+9/8GzeZVd8S5Ao+npRyOuwsw=
X-Received: by 2002:a17:907:cc14:b0:726:3555:ac63 with SMTP id
 uo20-20020a170907cc1400b007263555ac63mr12376484ejc.697.1656660603971; Fri, 01
 Jul 2022 00:30:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220628084226.472035-1-brgl@bgdev.pl> <20220628084226.472035-6-brgl@bgdev.pl>
 <20220630022522.GA17221@sol> <CAMRc=MfXqKuj4u9OiBe5Euo8BtRFb06CMZbLOoF6PD2OvJsRWg@mail.gmail.com>
 <20220630081450.GB23652@sol> <20220630083851.GA24642@sol> <20220701060736.GA28431@sol>
 <CAMRc=Mdhogn2HDR7NYmjugTi6V3zwcw38vmdpfH55f44EPOHRw@mail.gmail.com> <20220701072655.GA31738@sol>
In-Reply-To: <20220701072655.GA31738@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 1 Jul 2022 09:29:53 +0200
Message-ID: <CAMRc=McwhnjovSB7RuZQTnZ9tKww=WDvk813Wbmt5PYaK95cPA@mail.gmail.com>
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

On Fri, Jul 1, 2022 at 9:27 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Fri, Jul 01, 2022 at 09:21:58AM +0200, Bartosz Golaszewski wrote:
> > On Fri, Jul 1, 2022 at 8:07 AM Kent Gibson <warthog618@gmail.com> wrote=
:
> > >
> > > On Thu, Jun 30, 2022 at 04:38:51PM +0800, Kent Gibson wrote:
> > > > On Thu, Jun 30, 2022 at 04:14:50PM +0800, Kent Gibson wrote:
> > > > > On Thu, Jun 30, 2022 at 08:54:24AM +0200, Bartosz Golaszewski wro=
te:
> > > > > > On Thu, Jun 30, 2022 at 4:25 AM Kent Gibson <warthog618@gmail.c=
om> wrote:
> > > > > > >
> > > > > > > On Tue, Jun 28, 2022 at 10:42:26AM +0200, Bartosz Golaszewski=
 wrote:
> > > > > > > > This is the implementation of the new python API for libgpi=
od v2.
> > > > > > > >
> > > > > > >
> > > > > > > [snip]
> > > > > > >
> > > > > > > > +     }
> > > > > > > > +
> > > > > > > > +     res =3D PyObject_Call(method, args, line_cfg_kwargs);
> > > > > > > > +     Py_DECREF(args);
> > > > > > > > +     Py_DECREF(method);
> > > > > > > > +     if (!Py_IsNone(res)) {
> > > > > > > > +             Py_DECREF(res);
> > > > > > > > +             return NULL;
> > > > > > > > +     }
> > > > > > > > +
> > > > > > >
> > > > > > > Building against python 3.9 (the min required by configure.ac=
) gives:
> > > > > > >
> > > > > > > module.c:276:7: warning: implicit declaration of function =E2=
=80=98Py_IsNone=E2=80=99; did you mean =E2=80=98Py_None=E2=80=99? [-Wimplic=
it-function-declaration]
> > > > > > >   276 |  if (!Py_IsNone(res)) {
> > > > > > >       |       ^~~~~~~~~
> > > > > > >       |       Py_None
> > > > > > >
> > > > > > >
> > > > > > > Py_IsNone didn't get added to the Stable ABI until 3.10.
> > > > > > >
> > > > > > > Cheers,
> > > > > > > Kent.
> > > > > >
> > > > > > It seems like most distros still ship python 3.9, I don't want =
to make
> > > > > > 3.10 the requirement. This can be replaced by `if (res !=3D Py_=
None)`.
> > > > > > Are there any more build issues?
> > > > > >
> > > > >
> > > > > No, that was the only one.
> > > > >
> > > >
> > > > But I am seeing a test failure:
> > > >
> > > > $ sudo bindings/python/tests/gpiod_py_test.py
> > > > ...................................................................=
..........F................................
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > FAIL: test_module_line_request_edge_detection (cases.tests_line_req=
uest.ModuleLineRequestWorks)
> > > > -------------------------------------------------------------------=
---
> > > > Traceback (most recent call last):
> > > >   File "/home/dev/libgpiod/bindings/python/tests/cases/tests_line_r=
equest.py", line 71, in test_module_line_request_edge_detection
> > > >     self.assertTrue(req.wait_edge_event())
> > > > AssertionError: False is not true
> > > >
> > > > -------------------------------------------------------------------=
---
> > > > Ran 110 tests in 2.652s
> > > >
> > > > FAILED (failures=3D1)
> > > >
> > >
> > > The req.wait_edge_event() does not wait without a timeout parameter,
> > > which is a bit nonintuitive, so the test has a race.
> >
> > Ah, makes sense.
> >
> > > Adding a timeout=3Ddatetime.timedelta(microseconds=3D1) (the shortest
> > > possible) works for me, so anything that triggers a context switch is
> > > probably sufficient, though a longer timeout probably wouldn't hurt.
> > >
> >
> > I'll change that.
> >
> > > The Python API should take timeout=3DNONE to mean wait indefinitely, =
and
> > > 0 as a poll.
> >
> > This makes sense but I'd still want to have some default behavior for
> > when timeout is not given. Maybe wait indefinitely?
>
> That is what I said - you get timeout=3DNone if the kwarg is not specifie=
d.
>
> >
> > > And it should take the timeout as a float, not a
> > > timedelta, as per select.select.  From its doc:
> >
> > I don't necessarily want to mirror select's interface. Why would we
> > prefer a float over a class that's the standard python interface for
> > storing time deltas?
> >
>
> Cos you are forcing the user to create a timedelta, which is a PITA,
> and both time.sleep and select.select (i.e. standard Python modules)
> do it that way.  The float is the Pythonic way.
>

Timedelta constructor is much more explicit than a float IMO. How
about a compromise and taking both (mutually exclusive)?
timeout=3Ddatettime.timedelta(seconds=3D1) =3D=3D timeout_sec=3Dfloat(1.0)?

Bart
