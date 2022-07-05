Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47E475660F7
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Jul 2022 04:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234301AbiGECIz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jul 2022 22:08:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234210AbiGECIy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jul 2022 22:08:54 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC23D60C5
        for <linux-gpio@vger.kernel.org>; Mon,  4 Jul 2022 19:08:52 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id a15so4045254pjs.0
        for <linux-gpio@vger.kernel.org>; Mon, 04 Jul 2022 19:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hmaDkAaWoW2Jp3Asark/Ii6246uat/9r9T+tfqysLbQ=;
        b=LEcTMGDMgNrC6uEs3rt/KIQ7FYlZEEzAF4OYewwj+ksMA1T8CpdMOiR7RO0ExBlwia
         z+6QmzBaR2DKnkJSTFoNfWorCN7moFQ95EzTOqwXX4N1H+ziJyB6HkdmQ1wD92pEQg0J
         tdGhbYqkca8g5QHerslQ3zwy3BnQCelFGhafh8ZoBMuhBrcRiuxasBGsrRYQZVACGos5
         NVq3/6h5Y0oVDrG0UMu+BDOkETA4VIi4pZTceXX0PakM7Jfjpn84OpOMTmVw9gbiTThj
         64lyfFp9yXGgkDGUVd/fMVdM9mU31D0Xv4KFSfOAhAyiL+D9QVwOUKTwXMy21ndPfGa2
         w79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hmaDkAaWoW2Jp3Asark/Ii6246uat/9r9T+tfqysLbQ=;
        b=OW1vHmljIU8pFM9aylRTys0/W0SK1yHShkeWPrE8FK/NxmGj0icOCjn5LCA+3j7DPC
         ygjStMmmPcOkmZhPGkMgXQHjMwlSQNhFtY34ejqlGE01ER/6LLxXSIznqiB9kzI2UYqL
         wqfpA8a2lFnOmnzjEsSaoKU+NJ0igDLuqLCzLl1StMUDtemlQAjYR6ksOCBFIVnHUmye
         My/8P3fFGmQLrUHHVT5c0r+dc1CEkK9lXmxbg6Pa/gMkngE74XWbT6tCJ712pVva2N0G
         mNhMQkpnr09e9dZJ50dadBxJLdjfRqWBxKA5Cv+d+HpMeQV9Ebm11pCxv8HFBOkRSw/j
         O4sg==
X-Gm-Message-State: AJIora8lDAHlM79OoSJNZ0D9ol80xyVLZSJb8B/QzO6NpSnKW6Al3hWV
        DJcNOSJhZxEzN+4NB1gNEAtYk3GUpF8=
X-Google-Smtp-Source: AGRyM1uPpyEmjKFBRY5TJ4l/ONK4zLVGQ0HDRebJDniZ5eDL6e5PQaA+cST0TdKXYYXtqU23xejF+g==
X-Received: by 2002:a17:902:e0d3:b0:16b:e8da:4090 with SMTP id e19-20020a170902e0d300b0016be8da4090mr5823315pla.53.1656986932193;
        Mon, 04 Jul 2022 19:08:52 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id gk24-20020a17090b119800b001ecc617d470sm13391755pjb.33.2022.07.04.19.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 19:08:51 -0700 (PDT)
Date:   Tue, 5 Jul 2022 10:08:45 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darrien <darrien@freenet.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jiri Benc <jbenc@upir.cz>, Joel Savitz <joelsavitz@gmail.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v2 4/5] bindings: python: add tests for v2
 API
Message-ID: <20220705020845.GA6652@sol>
References: <20220628084226.472035-1-brgl@bgdev.pl>
 <20220628084226.472035-5-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220628084226.472035-5-brgl@bgdev.pl>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 28, 2022 at 10:42:25AM +0200, Bartosz Golaszewski wrote:
> This adds a python wrapper around libgpiosim and a set of test cases
> for the v2 API using python's standard unittest module.
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  bindings/python/tests/Makefile.am             |  14 +
>  bindings/python/tests/cases/__init__.py       |  12 +
>  bindings/python/tests/cases/tests_chip.py     | 157 +++++++
>  .../python/tests/cases/tests_chip_info.py     |  59 +++
>  .../python/tests/cases/tests_edge_event.py    | 279 +++++++++++
>  .../python/tests/cases/tests_info_event.py    | 135 ++++++
>  .../python/tests/cases/tests_line_config.py   | 254 ++++++++++
>  .../python/tests/cases/tests_line_info.py     |  90 ++++
>  .../python/tests/cases/tests_line_request.py  | 345 ++++++++++++++
>  bindings/python/tests/cases/tests_misc.py     |  53 +++
>  .../tests/cases/tests_request_config.py       |  77 ++++
>  bindings/python/tests/gpiod_py_test.py        |  25 +
>  bindings/python/tests/gpiosimmodule.c         | 434 ++++++++++++++++++
>  13 files changed, 1934 insertions(+)
>  create mode 100644 bindings/python/tests/Makefile.am
>  create mode 100644 bindings/python/tests/cases/__init__.py
>  create mode 100644 bindings/python/tests/cases/tests_chip.py
>  create mode 100644 bindings/python/tests/cases/tests_chip_info.py
>  create mode 100644 bindings/python/tests/cases/tests_edge_event.py
>  create mode 100644 bindings/python/tests/cases/tests_info_event.py
>  create mode 100644 bindings/python/tests/cases/tests_line_config.py
>  create mode 100644 bindings/python/tests/cases/tests_line_info.py
>  create mode 100644 bindings/python/tests/cases/tests_line_request.py
>  create mode 100644 bindings/python/tests/cases/tests_misc.py
>  create mode 100644 bindings/python/tests/cases/tests_request_config.py
>  create mode 100755 bindings/python/tests/gpiod_py_test.py
>  create mode 100644 bindings/python/tests/gpiosimmodule.c
> 
> diff --git a/bindings/python/tests/Makefile.am b/bindings/python/tests/Makefile.am
> new file mode 100644
> index 0000000..099574f
> --- /dev/null
> +++ b/bindings/python/tests/Makefile.am
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
> +

It is 2022?

Which email address are you going with?  gmail here and bgdev below.

> +dist_bin_SCRIPTS = gpiod_py_test.py
> +
> +pyexec_LTLIBRARIES = gpiosim.la
> +
> +gpiosim_la_SOURCES = gpiosimmodule.c
> +gpiosim_la_CFLAGS = -I$(top_srcdir)/tests/gpiosim/
> +gpiosim_la_CFLAGS += -Wall -Wextra -g -std=gnu89 $(PYTHON_CPPFLAGS)
> +gpiosim_la_LDFLAGS = -module -avoid-version
> +gpiosim_la_LIBADD = $(top_builddir)/tests/gpiosim/libgpiosim.la
> +gpiosim_la_LIBADD += $(top_builddir)/bindings/python/enum/libpycenum.la
> +gpiosim_la_LIBADD += $(PYTHON_LIBS)
> diff --git a/bindings/python/tests/cases/__init__.py b/bindings/python/tests/cases/__init__.py
> new file mode 100644
> index 0000000..6503663
> --- /dev/null
> +++ b/bindings/python/tests/cases/__init__.py
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
> +
> +from .tests_chip import *
> +from .tests_chip_info import *
> +from .tests_edge_event import *
> +from .tests_info_event import *
> +from .tests_line_config import *
> +from .tests_line_info import *
> +from .tests_line_request import *
> +from .tests_misc import *
> +from .tests_request_config import *
> diff --git a/bindings/python/tests/cases/tests_chip.py b/bindings/python/tests/cases/tests_chip.py
> new file mode 100644
> index 0000000..844dbfc
> --- /dev/null
> +++ b/bindings/python/tests/cases/tests_chip.py

[snip]
> +class WaitingForEdgeEvents(unittest.TestCase):
> +    def setUp(self):
> +        self.sim = gpiosim.Chip(num_lines=8)
> +        self.thread = None
> +
> +    def tearDown(self):
> +        if self.thread:
> +            self.thread.join()
> +        self.sim = None
> +
> +    def trigger_falling_and_rising_edge(self, offset):
> +        time.sleep(0.05)
> +        self.sim.set_pull(offset, Pull.PULL_UP)
> +        time.sleep(0.05)
> +        self.sim.set_pull(offset, Pull.PULL_DOWN)
> +
> +    def trigger_rising_edge_events_on_two_offsets(self, offset0, offset1):
> +        time.sleep(0.05)
> +        self.sim.set_pull(offset0, Pull.PULL_UP)
> +        time.sleep(0.05)
> +        self.sim.set_pull(offset1, Pull.PULL_UP)
> +
> +    def test_both_edge_events(self):
> +        with gpiod.request_lines(
> +            self.sim.dev_path,
> +            gpiod.RequestConfig(offsets=[2]),
> +            gpiod.LineConfig(edge_detection=Edge.BOTH),
> +        ) as req:
> +            buf = gpiod.EdgeEventBuffer()
> +            self.thread = threading.Thread(
> +                target=partial(self.trigger_falling_and_rising_edge, 2)
> +            )
> +            self.thread.start()
> +
> +            self.assertTrue(req.wait_edge_event(datetime.timedelta(seconds=1)))
> +            self.assertEqual(req.read_edge_event(buf), 1)
> +            self.assertEqual(len(buf), 1)
> +            event = buf[0]
> +            self.assertEqual(event.type, EventType.RISING_EDGE)
> +            self.assertEqual(event.line_offset, 2)
> +            ts_rising = event.timestamp_ns
> +
> +            self.assertTrue(req.wait_edge_event(datetime.timedelta(seconds=1)))
> +            self.assertEqual(req.read_edge_event(buf), 1)
> +            self.assertEqual(len(buf), 1)
> +            event = buf[0]
> +            self.assertEqual(event.type, EventType.FALLING_EDGE)
> +            self.assertEqual(event.line_offset, 2)
> +            ts_falling = event.timestamp_ns
> +
> +            self.assertGreater(ts_falling, ts_rising)
> +
> +    def test_rising_edge_event(self):
> +        with gpiod.request_lines(
> +            self.sim.dev_path,
> +            gpiod.RequestConfig(offsets=[6]),
> +            gpiod.LineConfig(edge_detection=Edge.RISING),
> +        ) as req:
> +            buf = gpiod.EdgeEventBuffer()
> +            self.thread = threading.Thread(
> +                target=partial(self.trigger_falling_and_rising_edge, 6)
> +            )
> +            self.thread.start()
> +
> +            self.assertTrue(req.wait_edge_event(datetime.timedelta(seconds=1)))
> +            self.assertEqual(req.read_edge_event(buf), 1)
> +            self.assertEqual(len(buf), 1)
> +            event = buf[0]
> +            self.assertEqual(event.type, EventType.RISING_EDGE)
> +            self.assertEqual(event.line_offset, 6)
> +
> +            self.assertFalse(
> +                req.wait_edge_event(datetime.timedelta(microseconds=10000))
> +            )
> +
> +    def test_falling_edge_event(self):
> +        with gpiod.request_lines(
> +            self.sim.dev_path,
> +            gpiod.RequestConfig(offsets=[6]),
> +            gpiod.LineConfig(edge_detection=Edge.FALLING),
> +        ) as req:
> +            buf = gpiod.EdgeEventBuffer()
> +            self.thread = threading.Thread(
> +                target=partial(self.trigger_falling_and_rising_edge, 6)
> +            )
> +            self.thread.start()
> +

Benefit of the thread? (and elsewhere a background thread is used)
The sleeps therein are only necessary because it is run in the
background.

> +            self.assertTrue(req.wait_edge_event(datetime.timedelta(seconds=1)))
> +            self.assertEqual(req.read_edge_event(buf), 1)
> +            self.assertEqual(len(buf), 1)
> +            event = buf[0]
> +            self.assertEqual(event.type, EventType.FALLING_EDGE)
> +            self.assertEqual(event.line_offset, 6)
> +
> +            self.assertFalse(
> +                req.wait_edge_event(datetime.timedelta(microseconds=10000))
> +            )
> +
> +    def test_sequence_numbers(self):
> +        with gpiod.request_lines(
> +            self.sim.dev_path,
> +            gpiod.RequestConfig(offsets=[2, 4]),
> +            gpiod.LineConfig(edge_detection=Edge.BOTH),
> +        ) as req:
> +            buf = gpiod.EdgeEventBuffer()
> +            self.thread = threading.Thread(
> +                target=partial(self.trigger_rising_edge_events_on_two_offsets, 2, 4)
> +            )
> +            self.thread.start()
> +
> +            self.assertTrue(req.wait_edge_event(datetime.timedelta(seconds=1)))
> +            self.assertEqual(req.read_edge_event(buf), 1)
> +            self.assertEqual(len(buf), 1)
> +            event = buf[0]
> +            self.assertEqual(event.type, EventType.RISING_EDGE)
> +            self.assertEqual(event.line_offset, 2)
> +            self.assertEqual(event.global_seqno, 1)
> +            self.assertEqual(event.line_seqno, 1)
> +
> +            self.assertTrue(req.wait_edge_event(datetime.timedelta(seconds=1)))
> +            self.assertEqual(req.read_edge_event(buf), 1)
> +            self.assertEqual(len(buf), 1)
> +            event = buf[0]
> +            self.assertEqual(event.type, EventType.RISING_EDGE)
> +            self.assertEqual(event.line_offset, 4)
> +            self.assertEqual(event.global_seqno, 2)
> +            self.assertEqual(event.line_seqno, 1)
> +
> +

[snip]
> +++ b/bindings/python/tests/cases/tests_line_request.py
> @@ -0,0 +1,345 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
> +
> +import errno
> +import gpiod
> +import gpiosim
> +import unittest
> +
> +
> +Direction = gpiod.Line.Direction
> +Edge = gpiod.Line.Edge
> +Bias = gpiod.Line.Bias
> +Value = gpiod.Line.Value
> +SimVal = gpiosim.Chip.Value
> +Pull = gpiosim.Chip.Pull
> +
> +
> +class LineRequestConstructor(unittest.TestCase):
> +    def test_line_request_cannot_be_instantiated(self):
> +        with self.assertRaises(TypeError):
> +            info = gpiod.LineRequest()
> +
> +
> +class ChipLineRequestWorks(unittest.TestCase):
> +    def test_chip_line_request(self):
> +        sim = gpiosim.Chip()
> +
> +        with gpiod.Chip(sim.dev_path) as chip:
> +            with chip.request_lines(
> +                gpiod.RequestConfig(offsets=[0]), gpiod.LineConfig()
> +            ) as req:
> +                pass
> +
> +
> +class ModuleLineRequestWorks(unittest.TestCase):

Put module level tests in a module level file, say tests_module.py?
All the tests in this file should test LineRequest methods.
(i.e. where request_lines() has succeeded so the req is constructed)

Chip.request_lines() tests should be in tests_chip.py.
Particularly the failure cases.

> +    def test_module_line_request(self):
> +        sim = gpiosim.Chip()
> +
> +        with gpiod.request_lines(
> +            sim.dev_path, gpiod.RequestConfig(offsets=[0]), gpiod.LineConfig()
> +        ) as req:
> +            pass
> +
> +    def test_module_line_request_lines_arg(self):
> +        sim = gpiosim.Chip(num_lines=16, line_names={0: "foo", 2: "bar", 5: "xyz"})
> +
> +        with gpiod.request_lines(sim.dev_path, lines=["foo", "bar", "xyz"]) as req:
> +            self.assertEqual(req.offsets, [0, 2, 5])
> +
> +        with gpiod.request_lines(sim.dev_path, lines=["foo", 9, "xyz", 12]) as req:
> +            self.assertEqual(req.offsets, [0, 9, 5, 12])
> +

Test name mapping failures.
Test lines=[].
Test lines=None.

> +    def test_module_line_request_direction(self):
> +        sim = gpiosim.Chip(num_lines=2)
> +
> +        with gpiod.request_lines(
> +            sim.dev_path, lines=[0, 1], direction=Direction.OUTPUT
> +        ) as req:
> +            with gpiod.Chip(sim.dev_path) as chip:
> +                info = chip.get_line_info(0)
> +                self.assertEqual(info.direction, Direction.OUTPUT)
> +                self.assertTrue(info.used)
> +
> +    def test_module_line_request_edge_detection(self):
> +        sim = gpiosim.Chip()
> +
> +        with gpiod.request_lines(
> +            sim.dev_path, lines=[0], edge_detection=Edge.BOTH
> +        ) as req:
> +            sim.set_pull(0, Pull.PULL_UP)
> +            self.assertTrue(req.wait_edge_event())
> +            self.assertEqual(req.read_edge_event()[0].line_offset, 0)
> +
> +
> +class RequestingLinesFailsWithInvalidArguments(unittest.TestCase):

These tests should be in tests_chip.py, as they are testing the
Chip.request_lines() method.

And they should have module level equivalents (don't assume one wraps
the other).

> +    def setUp(self):
> +        self.sim = gpiosim.Chip(num_lines=8)
> +        self.chip = gpiod.Chip(self.sim.dev_path)
> +
> +    def tearDown(self):
> +        self.chip.close()
> +        self.chip = None
> +        self.sim = None
> +
> +    def test_passing_invalid_types_as_configs(self):
> +        with self.assertRaises(TypeError):
> +            self.chip.request_lines("foobar", gpiod.LineConfig())
> +
> +        with self.assertRaises(TypeError):
> +            self.chip.request_lines(gpiod.RequestConfig(offsets=[0]), "foobar")
> +
> +    def test_no_offsets(self):
> +        with self.assertRaises(ValueError):
> +            self.chip.request_lines(gpiod.RequestConfig(), gpiod.LineConfig())
> +
> +    def test_duplicate_offsets(self):
> +        with self.assertRaises(OSError) as ex:
> +            self.chip.request_lines(
> +                gpiod.RequestConfig(offsets=[2, 5, 1, 7, 5]), gpiod.LineConfig()
> +            )
> +
> +        self.assertEqual(ex.exception.errno, errno.EBUSY)
> +
> +    def test_offset_out_of_range(self):
> +        with self.assertRaises(ValueError):
> +            self.chip.request_lines(
> +                gpiod.RequestConfig(offsets=[1, 0, 4, 8]), gpiod.LineConfig()
> +            )
> +

[snip]
> +++ b/bindings/python/tests/cases/tests_misc.py
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
> +

The tests in this file are all module scope, and cover functions from
module.c, so rename to tests_module.py.

> +import gpiod
> +import gpiosim
> +import os
> +import re
> +import unittest
> +
> +
> +class LinkGuard:
> +    def __init__(self, src, dst):
> +        self.src = src
> +        self.dst = dst
> +
> +    def __enter__(self):
> +        os.symlink(self.src, self.dst)
> +
> +    def __exit__(self, type, val, tb):
> +        os.unlink(self.dst)
> +
> +
> +class IsGPIOChip(unittest.TestCase):
> +    def test_is_gpiochip_bad(self):
> +        self.assertFalse(gpiod.is_gpiochip_device("/dev/null"))
> +        self.assertFalse(gpiod.is_gpiochip_device("/dev/nonexistent"))
> +
> +    def test_is_gpiochip_good(self):
> +        sim = gpiosim.Chip()
> +
> +        self.assertTrue(gpiod.is_gpiochip_device(sim.dev_path))
> +
> +    def test_is_gpiochip_link_good(self):
> +        link = "/tmp/gpiod-py-test-link.{}".format(os.getpid())
> +        sim = gpiosim.Chip()
> +
> +        with LinkGuard(sim.dev_path, link):
> +            self.assertTrue(gpiod.is_gpiochip_device(link))
> +
> +    def test_is_gpiochip_link_bad(self):
> +        link = "/tmp/gpiod-py-test-link.{}".format(os.getpid())
> +
> +        with LinkGuard("/dev/null", link):
> +            self.assertFalse(gpiod.is_gpiochip_device(link))
> +
> +
> +class VersionString(unittest.TestCase):
> +    def test_version_string(self):
> +        self.assertTrue(
> +            re.match(
> +                "^[0-9][1-9]?\\.[0-9][1-9]?([\\.0-9]?|\\-devel)$", gpiod.__version__
> +            )
> +        )
> diff --git a/bindings/python/tests/cases/tests_request_config.py b/bindings/python/tests/cases/tests_request_config.py
[snip]

A complete audit of the test coverage would be beneficial.
I haven't attempted that - only pointed out any gaps I happened to notice.
Are there any coverage tools available for Python C modules?

Cheers,
Kent.
