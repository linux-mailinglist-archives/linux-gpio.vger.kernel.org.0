Return-Path: <linux-gpio+bounces-8713-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8CA94E866
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2024 10:22:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7283A1C21256
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2024 08:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20EB8165F03;
	Mon, 12 Aug 2024 08:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="TPwIB1L7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EFB1876
	for <linux-gpio@vger.kernel.org>; Mon, 12 Aug 2024 08:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723450959; cv=none; b=Ko1ZyOBWlnU8FqpiBDJOco/ktgmh48ItbqppVdm3X45f+RTx9c5hEfnpSCxzX9r3A2r43mT8iujyEGi4ArvQs2B00TNvY73bYIyqtMmIuZDeFfd6B1nfHN85XMdCMTHUVRrQRDzxIMW6iaEz9GTLRx7v2HXQ8kDNad2njiScB7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723450959; c=relaxed/simple;
	bh=iI0aH/+bwbzpcW4GsuLbDXT1X+VRur4nYbOocTkdlek=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oMJuysx+bs8t+PyMxSTVg/r4zcvmrWbAe+8qGSgdOhk9Mu1wWE26FWEXbSjpUXAW6UoGu3CJw3Zhka4v/0XEoIBYzxFncNXS8AMMmy5xkhZoBo64MN4MEFAy1E2lV5mGTxCnvQkstC9xAsogAgGglWhellcH1c+F55iBR7lKQQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=TPwIB1L7; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42819654737so30221105e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 12 Aug 2024 01:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723450955; x=1724055755; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/uOpj01USNbyC3XO830k3Zf+wFNnRn0UYHMo8VnXkGA=;
        b=TPwIB1L765xrSuQbEtzDIfGeiZL0gTNZqQkgkG9QyMVZmfzSXbfrKVoO/km+LSVRu9
         502aAA5cPuEjcBXFHlTh3gtGJVkzlYBVJJJLCDoQGwIx8RZ/ynexCYfp50gfHsxCMire
         nyRuYoBChKnxRAzsNLfjsXrmjyevU12xELB54tnTVojV8Y67b4Y74nFhDQqLKM7OfQa/
         BnQ9a3pAHbGeEl0GbJjKglHTm/OxrJ+ZavarG4o/OcY1eYvVQKgtI6eB0abBXtk8Uk8f
         IxLYz5YCM04o3EziFQ0CFeGj0OPqRFc6pHZp04PRD5Qr26vh50VuuJkFCZqP0WuFRR5O
         Uduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723450955; x=1724055755;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/uOpj01USNbyC3XO830k3Zf+wFNnRn0UYHMo8VnXkGA=;
        b=RuNxiDBQZ/4h1FyUxwT5ctcdx17bvFo+Ky9akYk0uhGK3Vu7/L2tphcTpr1PBzasL7
         sd6KdgE1bUAjyL0GCvDAKBg2uzLzcRINKNoFY+TKDtaKP7FY1+A4vUWGEAWukhy52L8u
         GFieu/GAq7kq9GxgR4xphNyLqPyxZlKrb5r2PidedrwuK9QTJRrE9Rk+zBbCABOlGuJo
         qDkolno+yT4rlGG0z0X000W2AfMpgZWEWXZJS4uKBGpb4saVpIPyGHkbJYHtiom70adO
         pXcQcWe0Tcqtxr+9i9fh690XIjngkE+MdSxIVyx9vqak/DFnvdQdICYFzl/7IXzSL6SQ
         DzJw==
X-Gm-Message-State: AOJu0Yz5sReaoD6ewK4bljDgEr1GAV5um1mXYiU68HSJJr4FugZSWRYO
	Nq7fNmjvga/yUEDsXkQHEUwgCJ7uKOzdzpD7r9c/HhVO1p96jWbyR/XtVRB+BiM=
X-Google-Smtp-Source: AGHT+IGT9/8OZ0bmLgy5J+Q3rjshIb7Xz1kYeT7GhrPDYo88T17uGJ4jMr45DAk4A8qMLfOmntI5tw==
X-Received: by 2002:a05:600c:1c15:b0:426:6f27:379a with SMTP id 5b1f17b1804b1-429c3a23d99mr58447855e9.13.1723450954431;
        Mon, 12 Aug 2024 01:22:34 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d7d3:597b:b219:7ba5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c74ff9fsm179059555e9.28.2024.08.12.01.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 01:22:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH libgpiod v5 0/4] dbus: add GLib-based D-Bus daemon and
 command-line client
Date: Mon, 12 Aug 2024 10:22:21 +0200
Message-Id: <20240812-dbus-v5-0-ead288509217@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD3GuWYC/22PQWrDMBBFrxK0rsJoJMtyV71HyEK2xs5AsILUi
 oTgu1d2U9LSLof/3/vMXWRKTFm87u4iUeHMca5H87ITw8nPE0kO9RYIaKDBVob+I0uHQN3YGqs
 DiFq9JBr5umkO4sz9dOEYxLEmJ87vMd02f8Et31QW3ZeqoARJBrW2NBIG/Xbm2ae4j2la1f+0B
 6W18oNqh979bK97RT83WvVN6ZXqyKMFM4LDP5R5Ug4eTxZTKWvIO1C2o0b9opZl+QQZu11ZPQE
 AAA==
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Philip Withnall <philip@tecnocode.co.uk>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Alexander Sverdlin <alexander.sverdlin@siemens.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=13290;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=iI0aH/+bwbzpcW4GsuLbDXT1X+VRur4nYbOocTkdlek=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmucZE+tzy3dVpCL+v+xNohDU/ghia8CSCbYhxt
 jUOpiVmQrWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZrnGRAAKCRARpy6gFHHX
 cvOAEACylvm1T/mBfgDgB4+vwFbr3wGVyk0Jp901q1+2WSU88ZLFNqCfiZcX/wqzVkZWCF9xq0P
 3QQyXEofEVCDFFxAE/UTLUaoSQ503aqBC5K+UTko1vs85NkWe6oDYEI8TOgyaBbgg0j1a1xvcTz
 96s0vxpwZgIWWgrNfp04g9zwduhTyWqTLwe9AnQ5sjer17CZMtaCd4zJ+pfbS9xPDzd1jygl2NA
 9Pz2yo60tgFsDk93dd3Tz6oRmTM9x+CuWxRNh5E3mISTQR32e1/qnjJH1H4ZqAE/4jLGIVf1FnM
 4bizBimqqg0Jh5LCq4gRBv5Xlw+c1/ZKebiQGzTX7VESsjfQR+noh0Ah3efZ0tGTSDZ7RpTgJSZ
 hf4aR3s8T65CgknIDQCgOXkSao//riI8cWxNDubbGtZaoN37tEWGLx92LMjtx3vg+/Q6mxx/cYo
 t9xahSjgB4oYknUnZlcNWxpMpol3EfN8jfvNRe7HH4nxKcW6GIVwQfACYeSALv/0U583irZR374
 Cuz8Yh7uWh/QucjdeNNwY2c/OL6CEhod8exxeeouhKyPRPXJ5FTS886Ty/R8YLUdENYn8Pf4ulv
 5tp3JiyX1HY/I23gCNMjjWEdU4uaDmlwECN/CCh2DBy98irAdjRFtH/FpdhrO7Z+aVLw6ZGOqOB
 jcyCXacSTEWBPAA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

I'm resending it once more but with commits squashed into how they'll appear
in git once applied upstream. I think the code is in good enough shape that
it can now go into the master branch and any further development can happen
from there.

Big thanks to Philip Withnall <philip@tecnocode.co.uk> for his thorough review
of this series. I think I addressed most of the issues pointed out.

This series introduces the D-Bus API definition and its implementation in the
form of a GPIO manager daemon and a companion command-line client as well as
GLib bindings to libgpiod which form the base on which the former are built.

While I split the GLib and D-Bus code into several commits for easier review,
I intend to apply all changes to bindings/glib/ and dbus/ as two big commits
in the end as otherwise the split commits are not buildable until all of them
are applied.

The main point of interest is the D-Bus interface definition XML at
dbus/lib/io.gpiod1.xml as it is what defines the actual D-Bus API. Everything
else can be considered as implementation details as it's easier to change
later than the API that's supposed to be stable once released.

The first two patches expose the test infrastructure we use for the core
library and tools to the GLib bindings and dbus code. Next we add the GLib
bindings themselves. Not much to discuss here, they cover the entire libgpiod
API but wrap it in GObject abstractions and plug into the GLib event loop.

Finally we add the D-Bus code that's split into the daemon and command-line
client. I added some examples to the README and documented the behavior in
the help text of the programs as well as documented the interface file with
XML comments that gdbus-codegen can parse and use to generate docbook output.

For D-Bus, most of the testing happens in the command-line client bash tests.
It has a very good coverage of the daemon's code and also allows to run the
daemon through valgrind and verify there are no memory leaks and invalid
accesses.

Changes in v5:
- squash GLib bindings and D-Bus commits into two big commits
- Link to v4: https://lore.kernel.org/r/20240807-dbus-v4-0-64ea80169e51@linaro.org

Changes in v4:
- fix generating GObject introspection data
- use GLib doc blocks with introspection annotations suitable for generating
  docs with gi-docgen
- various comment and doc tweaks
- Link to v3: https://lore.kernel.org/r/20240718-dbus-v3-0-c9ea2604f082@linaro.org

Changes in v3:
- make gpio-manager run as its own user in the systemd service file and add
  udev rules that automate the group assignment for gpiochips
- add sandboxing options to the service file for an overall exposure score
  from systemd-analyze of 2.3
- enable introspection for GLib bindings
- set the minimum required GLib version for gdbus-codegen
- fix time units in dbus docs
- change the D-Bus type for Chip's path to byte-array
- change the naming convention in strings: s/DBus/D-Bus/g
- add the "unknown" value to the EventClock property and document how to
  interpret other unrecognized values
- various doc updates
- don't set environment variables from the daemon code, use the provided
  g_log_writer_default_set_debug_domains() helper
- use g_build_filename() where appropriate
- use g_steal_pointer() to improve error propagation
- use G_PARAM_STATIC_STRINGS across all properties
- use G_GNUC_PRINTF() in g_gpiod_set_error_from_errno()
- change the library's namespace to Gpiodglib/GPIODGLIB/gpiodglib_
- remove the "handle" properties in favor of passing the core libgpiod pointers
  to GObjects directly after they're constructed
- add typedefs to property enums for better build-time safety
- don't use g_value_set_static_string() for strings that are not really static
  across the entire lifetime of the program
- rework the code for internal property setting and getting
- add Requires.private: libgpiod to gpiod-glib pkgconfig file
- Link to v2: https://lore.kernel.org/r/20240628-dbus-v2-0-c1331ac17cb8@linaro.org

Changes in v2:
- fixed most segfaults I noticed (or was made aware of by others) in RFC
- improve the code in GLib examples
- make command-line tests pass shellckeck
- fix build issue resulting in implicit pointer-to-int casting on some
  platforms
- many small tweaks, fixes and improvements all over the place but without
  changing the API
- fix a bunch of memory leaks reported by valgrind
- Link to v1: https://lore.kernel.org/linux-gpio/20240412122804.109323-1-brgl@bgdev.pl/

---
Bartosz Golaszewski (4):
      tests: split out reusable test code into a local static library
      tests: split out the common test code for bash scripts
      bindings: add GLib bindings
      dbus: add the D-Bus daemon, command-line client and tests

 .gitignore                                         |    2 +
 Makefile.am                                        |    7 +
 README                                             |   73 +-
 TODO                                               |   17 -
 bindings/Makefile.am                               |    7 +
 bindings/glib/.gitignore                           |    6 +
 bindings/glib/Makefile.am                          |  131 ++
 bindings/glib/chip-info.c                          |  129 ++
 bindings/glib/chip.c                               |  397 ++++++
 bindings/glib/edge-event.c                         |  186 +++
 bindings/glib/error.c                              |   67 +
 bindings/glib/examples/.gitignore                  |   14 +
 bindings/glib/examples/Makefile.am                 |   22 +
 bindings/glib/examples/find_line_by_name_glib.c    |   71 +
 bindings/glib/examples/get_chip_info_glib.c        |   42 +
 bindings/glib/examples/get_line_info_glib.c        |   80 ++
 bindings/glib/examples/get_line_value_glib.c       |   68 +
 .../glib/examples/get_multiple_line_values_glib.c  |   73 +
 .../examples/reconfigure_input_to_output_glib.c    |  104 ++
 bindings/glib/examples/toggle_line_value_glib.c    |   99 ++
 .../examples/toggle_multiple_line_values_glib.c    |  132 ++
 bindings/glib/examples/watch_line_info_glib.c      |   63 +
 bindings/glib/examples/watch_line_value_glib.c     |   91 ++
 .../examples/watch_multiple_edge_rising_glib.c     |   95 ++
 bindings/glib/generated-enums.c.template           |   43 +
 bindings/glib/generated-enums.h.template           |   30 +
 bindings/glib/gpiod-glib.h                         |   22 +
 bindings/glib/gpiod-glib.pc.in                     |   15 +
 bindings/glib/gpiod-glib/chip-info.h               |   62 +
 bindings/glib/gpiod-glib/chip.h                    |  157 +++
 bindings/glib/gpiod-glib/edge-event.h              |   97 ++
 bindings/glib/gpiod-glib/error.h                   |   45 +
 bindings/glib/gpiod-glib/info-event.h              |   76 ++
 bindings/glib/gpiod-glib/line-config.h             |  101 ++
 bindings/glib/gpiod-glib/line-info.h               |  171 +++
 bindings/glib/gpiod-glib/line-request.h            |  186 +++
 bindings/glib/gpiod-glib/line-settings.h           |  220 +++
 bindings/glib/gpiod-glib/line.h                    |  113 ++
 bindings/glib/gpiod-glib/misc.h                    |   39 +
 bindings/glib/gpiod-glib/request-config.h          |   93 ++
 bindings/glib/info-event.c                         |  163 +++
 bindings/glib/internal.c                           |  327 +++++
 bindings/glib/internal.h                           |   79 ++
 bindings/glib/line-config.c                        |  193 +++
 bindings/glib/line-info.c                          |  342 +++++
 bindings/glib/line-request.c                       |  452 ++++++
 bindings/glib/line-settings.c                      |  408 ++++++
 bindings/glib/misc.c                               |   17 +
 bindings/glib/request-config.c                     |  170 +++
 bindings/glib/tests/.gitignore                     |    4 +
 bindings/glib/tests/Makefile.am                    |   29 +
 bindings/glib/tests/helpers.c                      |   12 +
 bindings/glib/tests/helpers.h                      |  140 ++
 bindings/glib/tests/tests-chip-info.c              |   58 +
 bindings/glib/tests/tests-chip.c                   |  187 +++
 bindings/glib/tests/tests-edge-event.c             |  225 +++
 bindings/glib/tests/tests-info-event.c             |  322 +++++
 bindings/glib/tests/tests-line-config.c            |  187 +++
 bindings/glib/tests/tests-line-info.c              |  102 ++
 bindings/glib/tests/tests-line-request.c           |  710 ++++++++++
 bindings/glib/tests/tests-line-settings.c          |  256 ++++
 bindings/glib/tests/tests-misc.c                   |   88 ++
 bindings/glib/tests/tests-request-config.c         |   64 +
 configure.ac                                       |   84 ++
 dbus/Makefile.am                                   |   10 +
 dbus/client/.gitignore                             |    4 +
 dbus/client/Makefile.am                            |   31 +
 dbus/client/common.c                               |  646 +++++++++
 dbus/client/common.h                               |  203 +++
 dbus/client/detect.c                               |   53 +
 dbus/client/find.c                                 |   66 +
 dbus/client/get.c                                  |  212 +++
 dbus/client/gpiocli-test.bash                      | 1443 ++++++++++++++++++++
 dbus/client/gpiocli.c                              |  174 +++
 dbus/client/info.c                                 |  184 +++
 dbus/client/monitor.c                              |  191 +++
 dbus/client/notify.c                               |  295 ++++
 dbus/client/reconfigure.c                          |   76 ++
 dbus/client/release.c                              |   64 +
 dbus/client/request.c                              |  250 ++++
 dbus/client/requests.c                             |   71 +
 dbus/client/set.c                                  |  173 +++
 dbus/client/wait.c                                 |  188 +++
 dbus/data/90-gpio.rules                            |    4 +
 dbus/data/Makefile.am                              |   16 +
 dbus/data/gpio-manager.service                     |   50 +
 dbus/data/io.gpiod1.conf                           |   41 +
 dbus/lib/Makefile.am                               |   29 +
 dbus/lib/gpiodbus.h                                |    9 +
 dbus/lib/io.gpiod1.xml                             |  324 +++++
 dbus/manager/.gitignore                            |    4 +
 dbus/manager/Makefile.am                           |   21 +
 dbus/manager/daemon.c                              |  821 +++++++++++
 dbus/manager/daemon.h                              |   22 +
 dbus/manager/gpio-manager.c                        |  173 +++
 dbus/manager/helpers.c                             |  431 ++++++
 dbus/manager/helpers.h                             |   26 +
 dbus/tests/.gitignore                              |    4 +
 dbus/tests/Makefile.am                             |   25 +
 dbus/tests/daemon-process.c                        |  129 ++
 dbus/tests/daemon-process.h                        |   20 +
 dbus/tests/helpers.c                               |  107 ++
 dbus/tests/helpers.h                               |  114 ++
 dbus/tests/tests-chip.c                            |  133 ++
 dbus/tests/tests-line.c                            |  231 ++++
 dbus/tests/tests-request.c                         |  116 ++
 tests/Makefile.am                                  |   14 +-
 tests/gpiod-test-helpers.c                         |   41 -
 tests/gpiosim-glib/Makefile.am                     |   13 +
 .../gpiosim-glib.c}                                |   30 +-
 .../gpiosim-glib.h}                                |   14 +
 tests/harness/Makefile.am                          |   12 +
 tests/harness/gpiod-test-common.h                  |   23 +
 tests/{ => harness}/gpiod-test.c                   |    0
 tests/{ => harness}/gpiod-test.h                   |    0
 tests/{gpiod-test-helpers.h => helpers.h}          |   36 +-
 tests/scripts/Makefile.am                          |    4 +
 tests/scripts/gpiod-bash-test-helper.inc           |  330 +++++
 tests/tests-chip-info.c                            |    7 +-
 tests/tests-chip.c                                 |   15 +-
 tests/tests-edge-event.c                           |    7 +-
 tests/tests-info-event.c                           |    7 +-
 tests/tests-kernel-uapi.c                          |    7 +-
 tests/tests-line-config.c                          |    7 +-
 tests/tests-line-info.c                            |   11 +-
 tests/tests-line-request.c                         |    7 +-
 tests/tests-line-settings.c                        |    5 +-
 tests/tests-misc.c                                 |    7 +-
 tests/tests-request-config.c                       |    5 +-
 tools/gpio-tools-test.bash                         |  566 ++------
 130 files changed, 15833 insertions(+), 584 deletions(-)
---
base-commit: 9fdd6e23faa5e0011d6ee047b25928e8ad4c3320
change-id: 20240527-dbus-820e9f7463d0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


