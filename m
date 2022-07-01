Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17D6A562C7E
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 09:22:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233993AbiGAHWN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Jul 2022 03:22:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231313AbiGAHWM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Jul 2022 03:22:12 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80B9368A08
        for <linux-gpio@vger.kernel.org>; Fri,  1 Jul 2022 00:22:10 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id d2so2471069ejy.1
        for <linux-gpio@vger.kernel.org>; Fri, 01 Jul 2022 00:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uMP7er2/z507jsWTEgmiRGgYUMuo3t8/oEk91b2L8S8=;
        b=76alPVnnw/bFfm50gLPwpM8B2TtvktIGiWXo8Fp4b6xT0kC9F7JHKJ88mVRfYyIrhY
         dbBPDRrF2wpSdfLPxQx71M02/YCxZn/Ivtdjmer5E4u1KNrnEUV9xgSw49agu7WjNVPk
         hM/d6w4WtX7qmcTidoOYG30WH7AGZFAOCydMCk3aNHRKFKamFJLkaELOVh3sgr2G9cQp
         XbQkN7OYxIjZ591MpqbOVPiPSFHXOd99xKCzRB6xOTX9lGeU3XeRS5WxzNLip14m4CD1
         ZEwqZZCBOIzCcaad3MwNZQZ72cQ0F51qtt4mTljdXpidJVGVjZfxEpZ1kO05Am+wsAxL
         3Z6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uMP7er2/z507jsWTEgmiRGgYUMuo3t8/oEk91b2L8S8=;
        b=NTk381ppwVp6yDEBDCKFfWk3hKYbEoWsgxgVAIPCfnXD0pE833LJmWyCPB85biWSOb
         meW3QHwIzEjIyF0IMw4pn5bRaD7raROrs3RF4wfZsQgeUIkdfsfqetIZx3fBEYiUuY8d
         EaJ9/GW73HZU9KClQEUYEZ84x+jO8qCwGErvDKw/XJtTSZfpfN+OD4xx2dzCH+O/9rRp
         pfJomxPDTEtylYhFEwYg/FzOv3eD/NgWt56hT732cSj9Wol1oBnIiDBx0ZauAEyEJ/Bz
         0CfYQNfIA8h+cqugk/Tf2qC0E5MJUldcusxvw37frGftvnbADTtiIfpo94Ny6ZPUOPRs
         +yqA==
X-Gm-Message-State: AJIora9y1VZna5CbGii48nQZ45a0UUBdQBmJpZruLaprkbauXwHmeA9a
        Kf1y5+DGSU9HHJCepwcm4b41NbCvL7APzSohmLOw3g==
X-Google-Smtp-Source: AGRyM1sDBiiCRIjsq+RO3IdUaDbvwhoLXJix3+BB4KFjdvCgvxU+p0nHal7gu6Ks2jsoKbtk7+UNDK2g1FEF4nfKEvs=
X-Received: by 2002:a17:907:60cc:b0:722:e564:eb11 with SMTP id
 hv12-20020a17090760cc00b00722e564eb11mr12704104ejc.736.1656660129037; Fri, 01
 Jul 2022 00:22:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220628084226.472035-1-brgl@bgdev.pl> <20220628084226.472035-6-brgl@bgdev.pl>
 <20220630022522.GA17221@sol> <CAMRc=MfXqKuj4u9OiBe5Euo8BtRFb06CMZbLOoF6PD2OvJsRWg@mail.gmail.com>
 <20220630081450.GB23652@sol> <20220630083851.GA24642@sol> <20220701060736.GA28431@sol>
In-Reply-To: <20220701060736.GA28431@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 1 Jul 2022 09:21:58 +0200
Message-ID: <CAMRc=Mdhogn2HDR7NYmjugTi6V3zwcw38vmdpfH55f44EPOHRw@mail.gmail.com>
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

On Fri, Jul 1, 2022 at 8:07 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Thu, Jun 30, 2022 at 04:38:51PM +0800, Kent Gibson wrote:
> > On Thu, Jun 30, 2022 at 04:14:50PM +0800, Kent Gibson wrote:
> > > On Thu, Jun 30, 2022 at 08:54:24AM +0200, Bartosz Golaszewski wrote:
> > > > On Thu, Jun 30, 2022 at 4:25 AM Kent Gibson <warthog618@gmail.com> =
wrote:
> > > > >
> > > > > On Tue, Jun 28, 2022 at 10:42:26AM +0200, Bartosz Golaszewski wro=
te:
> > > > > > This is the implementation of the new python API for libgpiod v=
2.
> > > > > >
> > > > >
> > > > > [snip]
> > > > >
> > > > > > +     }
> > > > > > +
> > > > > > +     res =3D PyObject_Call(method, args, line_cfg_kwargs);
> > > > > > +     Py_DECREF(args);
> > > > > > +     Py_DECREF(method);
> > > > > > +     if (!Py_IsNone(res)) {
> > > > > > +             Py_DECREF(res);
> > > > > > +             return NULL;
> > > > > > +     }
> > > > > > +
> > > > >
> > > > > Building against python 3.9 (the min required by configure.ac) gi=
ves:
> > > > >
> > > > > module.c:276:7: warning: implicit declaration of function =E2=80=
=98Py_IsNone=E2=80=99; did you mean =E2=80=98Py_None=E2=80=99? [-Wimplicit-=
function-declaration]
> > > > >   276 |  if (!Py_IsNone(res)) {
> > > > >       |       ^~~~~~~~~
> > > > >       |       Py_None
> > > > >
> > > > >
> > > > > Py_IsNone didn't get added to the Stable ABI until 3.10.
> > > > >
> > > > > Cheers,
> > > > > Kent.
> > > >
> > > > It seems like most distros still ship python 3.9, I don't want to m=
ake
> > > > 3.10 the requirement. This can be replaced by `if (res !=3D Py_None=
)`.
> > > > Are there any more build issues?
> > > >
> > >
> > > No, that was the only one.
> > >
> >
> > But I am seeing a test failure:
> >
> > $ sudo bindings/python/tests/gpiod_py_test.py
> > .......................................................................=
......F................................
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > FAIL: test_module_line_request_edge_detection (cases.tests_line_request=
.ModuleLineRequestWorks)
> > ----------------------------------------------------------------------
> > Traceback (most recent call last):
> >   File "/home/dev/libgpiod/bindings/python/tests/cases/tests_line_reque=
st.py", line 71, in test_module_line_request_edge_detection
> >     self.assertTrue(req.wait_edge_event())
> > AssertionError: False is not true
> >
> > ----------------------------------------------------------------------
> > Ran 110 tests in 2.652s
> >
> > FAILED (failures=3D1)
> >
>
> The req.wait_edge_event() does not wait without a timeout parameter,
> which is a bit nonintuitive, so the test has a race.

Ah, makes sense.

> Adding a timeout=3Ddatetime.timedelta(microseconds=3D1) (the shortest
> possible) works for me, so anything that triggers a context switch is
> probably sufficient, though a longer timeout probably wouldn't hurt.
>

I'll change that.

> The Python API should take timeout=3DNONE to mean wait indefinitely, and
> 0 as a poll.

This makes sense but I'd still want to have some default behavior for
when timeout is not given. Maybe wait indefinitely?

> And it should take the timeout as a float, not a
> timedelta, as per select.select.  From its doc:

I don't necessarily want to mirror select's interface. Why would we
prefer a float over a class that's the standard python interface for
storing time deltas?

Bart

> "The optional timeout argument specifies a time-out as a floating point
> number in seconds. When the timeout argument is omitted the function
> blocks until at least one file descriptor is ready. A time-out value of
> zero specifies a poll and never blocks."
>
> Cheers,
> Kent.
>
