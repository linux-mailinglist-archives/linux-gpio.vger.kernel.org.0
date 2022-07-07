Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04712569F5D
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jul 2022 12:18:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234865AbiGGKRj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Jul 2022 06:17:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235387AbiGGKRb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Jul 2022 06:17:31 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AEC450739
        for <linux-gpio@vger.kernel.org>; Thu,  7 Jul 2022 03:17:29 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id z41so22555053ede.1
        for <linux-gpio@vger.kernel.org>; Thu, 07 Jul 2022 03:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5Hir62cna6VyCgmuO3387M8rXK8c+QxaVwYs9bAIIvg=;
        b=Bapr/mg8CxVo/vZ158OUP2423m/G4FDhizPX9QdZp+cHwKfZRNw9EiNM0RLWJBryhu
         TykCb4apO1uaiGdq+4XE7oEA3YE89i7ahIpNbIcIa4JLhf2yLHNg5fB/raotDH2rN3yb
         puDhtqHcNiKtt4X0T/cvko+SutEbdqdmh2XM8IGQQmL8HTJ31mfQar8VgyFwNNzPtPkN
         1g8eFpL/RhiiZtGwpEHQUTf9UHQffcRlldKnWLSqq5o0NfnQZWxreM3Xe/dZGMWpIeq4
         G6mmJtqj8pQYUbPHwhlwUVEAp7/GWHyQYc4eCG9M5a64wbeeSIFFu52LxkGOvAyPK4q3
         /LDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5Hir62cna6VyCgmuO3387M8rXK8c+QxaVwYs9bAIIvg=;
        b=dpml24A2IYJw4VfSAGRSXCYVn+khU+JE+BC5JaV9gUTrtCJ+btaj/zgaI7/rqn0hmA
         vmWfdC1q7TFOLxzoK3cOnFw3xBRA8lQzTjAWzaQjGxCLSgVHl100/cDAeKg67hcyN87m
         jttmhnnziNzZ7jXRR24n+juw4S12qMexpyhqu4QGO7D0LwwxcBq60JZmV3PBlkzyyLcN
         gy+3nqDov2ANAun0yFILDpuj+V5NzrZLKN3Ta4M8CMCXVuiEDEcrioHL/SLbPw0xRDnh
         GGfKSazXx2mkxGinRuv6mTN0DuT4hb0MmqAP42+gtOdDduiLZuTs+Jb0MHEeVGmedTjn
         /DPQ==
X-Gm-Message-State: AJIora+xvvoHWlzZdWd0CkI2KiZYLVLlzC70luBMnLu5PkjKy+6ZUdI1
        rIOKmZcttvzriwVUpr0xRu+0HACRn0vHa56ydg1uvLzAsZY=
X-Google-Smtp-Source: AGRyM1voVUblMVitc6nrzeywyQW8D3aIEWfU3D4+Uahd2+riNruYdSjEquowN082anyyCSVYDJklY8jd4mdRg+A4WYQ=
X-Received: by 2002:a05:6402:d0a:b0:437:66ca:c211 with SMTP id
 eb10-20020a0564020d0a00b0043766cac211mr62038508edb.29.1657189048151; Thu, 07
 Jul 2022 03:17:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220628084226.472035-1-brgl@bgdev.pl> <20220628084226.472035-5-brgl@bgdev.pl>
 <20220705020845.GA6652@sol>
In-Reply-To: <20220705020845.GA6652@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 7 Jul 2022 12:17:17 +0200
Message-ID: <CAMRc=MegkfLxQr5tEWdn0jOoC=PzpZPHTtqUtk6QEr8ZZU4o0g@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH v2 4/5] bindings: python: add tests for v2 API
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darrien <darrien@freenet.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jiri Benc <jbenc@upir.cz>, Joel Savitz <joelsavitz@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 5, 2022 at 4:08 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Tue, Jun 28, 2022 at 10:42:25AM +0200, Bartosz Golaszewski wrote:
> > This adds a python wrapper around libgpiosim and a set of test cases
> > for the v2 API using python's standard unittest module.
> >
> > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > ---
> >  bindings/python/tests/Makefile.am             |  14 +
> >  bindings/python/tests/cases/__init__.py       |  12 +
> >  bindings/python/tests/cases/tests_chip.py     | 157 +++++++
> >  .../python/tests/cases/tests_chip_info.py     |  59 +++
> >  .../python/tests/cases/tests_edge_event.py    | 279 +++++++++++
> >  .../python/tests/cases/tests_info_event.py    | 135 ++++++
> >  .../python/tests/cases/tests_line_config.py   | 254 ++++++++++
> >  .../python/tests/cases/tests_line_info.py     |  90 ++++
> >  .../python/tests/cases/tests_line_request.py  | 345 ++++++++++++++
> >  bindings/python/tests/cases/tests_misc.py     |  53 +++
> >  .../tests/cases/tests_request_config.py       |  77 ++++
> >  bindings/python/tests/gpiod_py_test.py        |  25 +
> >  bindings/python/tests/gpiosimmodule.c         | 434 ++++++++++++++++++
> >  13 files changed, 1934 insertions(+)
> >  create mode 100644 bindings/python/tests/Makefile.am
> >  create mode 100644 bindings/python/tests/cases/__init__.py
> >  create mode 100644 bindings/python/tests/cases/tests_chip.py
> >  create mode 100644 bindings/python/tests/cases/tests_chip_info.py
> >  create mode 100644 bindings/python/tests/cases/tests_edge_event.py
> >  create mode 100644 bindings/python/tests/cases/tests_info_event.py
> >  create mode 100644 bindings/python/tests/cases/tests_line_config.py
> >  create mode 100644 bindings/python/tests/cases/tests_line_info.py
> >  create mode 100644 bindings/python/tests/cases/tests_line_request.py
> >  create mode 100644 bindings/python/tests/cases/tests_misc.py
> >  create mode 100644 bindings/python/tests/cases/tests_request_config.py
> >  create mode 100755 bindings/python/tests/gpiod_py_test.py
> >  create mode 100644 bindings/python/tests/gpiosimmodule.c
> >
> > diff --git a/bindings/python/tests/Makefile.am b/bindings/python/tests/Makefile.am
> > new file mode 100644
> > index 0000000..099574f
> > --- /dev/null
> > +++ b/bindings/python/tests/Makefile.am
> > @@ -0,0 +1,14 @@
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
> > +
>
> It is 2022?
>
> Which email address are you going with?  gmail here and bgdev below.
>

These patches will be squashed together anyway. When I wrote this part
I used this email and then switched to brgl@bgdev.pl. It's just
copyright anyway. I can fix it up later.

[snip!]

> > +
> > +    def test_falling_edge_event(self):
> > +        with gpiod.request_lines(
> > +            self.sim.dev_path,
> > +            gpiod.RequestConfig(offsets=[6]),
> > +            gpiod.LineConfig(edge_detection=Edge.FALLING),
> > +        ) as req:
> > +            buf = gpiod.EdgeEventBuffer()
> > +            self.thread = threading.Thread(
> > +                target=partial(self.trigger_falling_and_rising_edge, 6)
> > +            )
> > +            self.thread.start()
> > +
>
> Benefit of the thread? (and elsewhere a background thread is used)
> The sleeps therein are only necessary because it is run in the
> background.
>

Just to make it similar to real-life applications. I did the same for
C++ and C. And no: if I triggered multiple events without any sleeps
in between, then some of them would risk not being registered. You can
try it for yourself with gpiosim. It happens because when the kernel
irq_work is busy adding an interrupt, new ones get ignored.

[nsip]

> > +    def test_module_line_request_direction(self):
> > +        sim = gpiosim.Chip(num_lines=2)
> > +
> > +        with gpiod.request_lines(
> > +            sim.dev_path, lines=[0, 1], direction=Direction.OUTPUT
> > +        ) as req:
> > +            with gpiod.Chip(sim.dev_path) as chip:
> > +                info = chip.get_line_info(0)
> > +                self.assertEqual(info.direction, Direction.OUTPUT)
> > +                self.assertTrue(info.used)
> > +
> > +    def test_module_line_request_edge_detection(self):
> > +        sim = gpiosim.Chip()
> > +
> > +        with gpiod.request_lines(
> > +            sim.dev_path, lines=[0], edge_detection=Edge.BOTH
> > +        ) as req:
> > +            sim.set_pull(0, Pull.PULL_UP)
> > +            self.assertTrue(req.wait_edge_event())
> > +            self.assertEqual(req.read_edge_event()[0].line_offset, 0)
> > +
> > +
> > +class RequestingLinesFailsWithInvalidArguments(unittest.TestCase):
>
> These tests should be in tests_chip.py, as they are testing the
> Chip.request_lines() method.
>

I would argue that there's some overlap in where the test cases should
live. For instance - if we moved the line watching out of
tests_info_event into tests_chip then not much would be left. I would
leave these here as they test the general idea of requesting lines
rather than the functionality of class LineRequest. Same for the
module level line requests.

> And they should have module level equivalents (don't assume one wraps
> the other).
>

Makes sense.

> > +    def setUp(self):
> > +        self.sim = gpiosim.Chip(num_lines=8)
> > +        self.chip = gpiod.Chip(self.sim.dev_path)
> > +
> > +    def tearDown(self):
> > +        self.chip.close()
> > +        self.chip = None
> > +        self.sim = None
> > +
> > +    def test_passing_invalid_types_as_configs(self):
> > +        with self.assertRaises(TypeError):
> > +            self.chip.request_lines("foobar", gpiod.LineConfig())
> > +
> > +        with self.assertRaises(TypeError):
> > +            self.chip.request_lines(gpiod.RequestConfig(offsets=[0]), "foobar")
> > +
> > +    def test_no_offsets(self):
> > +        with self.assertRaises(ValueError):
> > +            self.chip.request_lines(gpiod.RequestConfig(), gpiod.LineConfig())
> > +
> > +    def test_duplicate_offsets(self):
> > +        with self.assertRaises(OSError) as ex:
> > +            self.chip.request_lines(
> > +                gpiod.RequestConfig(offsets=[2, 5, 1, 7, 5]), gpiod.LineConfig()
> > +            )
> > +
> > +        self.assertEqual(ex.exception.errno, errno.EBUSY)
> > +
> > +    def test_offset_out_of_range(self):
> > +        with self.assertRaises(ValueError):
> > +            self.chip.request_lines(
> > +                gpiod.RequestConfig(offsets=[1, 0, 4, 8]), gpiod.LineConfig()
> > +            )
> > +
>
> [snip]
> > +++ b/bindings/python/tests/cases/tests_misc.py
> > @@ -0,0 +1,53 @@
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
> > +
>
> The tests in this file are all module scope, and cover functions from
> module.c, so rename to tests_module.py.
>
> > +import gpiod
> > +import gpiosim
> > +import os
> > +import re
> > +import unittest
> > +
> > +
> > +class LinkGuard:
> > +    def __init__(self, src, dst):
> > +        self.src = src
> > +        self.dst = dst
> > +
> > +    def __enter__(self):
> > +        os.symlink(self.src, self.dst)
> > +
> > +    def __exit__(self, type, val, tb):
> > +        os.unlink(self.dst)
> > +
> > +
> > +class IsGPIOChip(unittest.TestCase):
> > +    def test_is_gpiochip_bad(self):
> > +        self.assertFalse(gpiod.is_gpiochip_device("/dev/null"))
> > +        self.assertFalse(gpiod.is_gpiochip_device("/dev/nonexistent"))
> > +
> > +    def test_is_gpiochip_good(self):
> > +        sim = gpiosim.Chip()
> > +
> > +        self.assertTrue(gpiod.is_gpiochip_device(sim.dev_path))
> > +
> > +    def test_is_gpiochip_link_good(self):
> > +        link = "/tmp/gpiod-py-test-link.{}".format(os.getpid())
> > +        sim = gpiosim.Chip()
> > +
> > +        with LinkGuard(sim.dev_path, link):
> > +            self.assertTrue(gpiod.is_gpiochip_device(link))
> > +
> > +    def test_is_gpiochip_link_bad(self):
> > +        link = "/tmp/gpiod-py-test-link.{}".format(os.getpid())
> > +
> > +        with LinkGuard("/dev/null", link):
> > +            self.assertFalse(gpiod.is_gpiochip_device(link))
> > +
> > +
> > +class VersionString(unittest.TestCase):
> > +    def test_version_string(self):
> > +        self.assertTrue(
> > +            re.match(
> > +                "^[0-9][1-9]?\\.[0-9][1-9]?([\\.0-9]?|\\-devel)$", gpiod.__version__
> > +            )
> > +        )
> > diff --git a/bindings/python/tests/cases/tests_request_config.py b/bindings/python/tests/cases/tests_request_config.py
> [snip]
>
> A complete audit of the test coverage would be beneficial.
> I haven't attempted that - only pointed out any gaps I happened to notice.
> Are there any coverage tools available for Python C modules?
>

One can use gcov as usual. I will do this but I don't expect to have
100% coverage in the first version, we can add more test cases once
this is in master.

Bart
