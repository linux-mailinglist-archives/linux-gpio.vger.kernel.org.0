Return-Path: <linux-gpio+bounces-5412-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B65638A2E2E
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 14:28:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A943B21F80
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 12:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D56A85646D;
	Fri, 12 Apr 2024 12:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pRwwbUTh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E73055E74
	for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 12:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712924897; cv=none; b=HFLR2oE+E0ZEwigTH5FgH9q2xcLS1sKIwB5pckeEmwUUa99o4rNVmgkau6w03ZEbJ/kxF3O2nIigzVBR1cZmZJA10VeIhZRBWV86RPCxksLWO/j6s872MfKsrOGxmC1BVPNjgZQazsDyhCo1ciNu9/6M9um/YX4MgS3D/b1UhAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712924897; c=relaxed/simple;
	bh=f9UyX0JVBfw86zC92nGpgDWXyInEJtoH1iWq0k5ioOg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sikX/+trs2HnLvQVxzcoP2q7KEIlKJiwmaeVh/I1rx4Bgrua8daGlwizRJ9nQ08NLiOFP46L78tU5Qv4Dh8t0jlAFwwiuG97Qb2nyyM5u9L8VxvqAqEP4oycnFPMz3UATN2d67+V54+1mzhzVxhctERzusicJQvh1uiRNmK9caI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pRwwbUTh; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-417d14c3411so9004865e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 05:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712924893; x=1713529693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QiApMGK4hD1oFLyfDiRWN+ef4w8Bqq5l4Sw8DBTqDXY=;
        b=pRwwbUThdgr7DXiyRLciimfFuw14VHHE9FAWd2h24wYiZKEM9VF32cMManxovhss0s
         4yF/ywrRtVcSDQ/Z8puJlp3j96g9f2mMeOAncEmPyABp2ncw558g0QG1FKfg8NMfiOx6
         YkRDZ1rMRd2lQ/D/e7wu+oM2H3F6C7yWqw2anq8hfKBjHGlcjlSGKQO8QvZzrJoateNT
         TRqiT6RF/qbs6EsE6XAiMJPZHsjSPhTzAGsPGaXu6HcIqE1gj/WBHOHaUKAepfUmsPth
         u3P5FGlbO0pIfByJaeL5sbU4xEWuA/v1vQHkKGv88ZKlvPXZgPuUMh45G1nuWROFHF5Y
         Gbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712924893; x=1713529693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QiApMGK4hD1oFLyfDiRWN+ef4w8Bqq5l4Sw8DBTqDXY=;
        b=A1RiZCxWAEa8FHHsnEf8PtuRN7ofCH0ddz6bBuOO0RBQtSALjQYydQ+CxTjFXPtHo8
         z43N8d6guc7PoTNvNmVLh7uyWZ7RR2aXbArYtVfSGqQKvCQ1zf6uTuTrF41jeA5NCQ5s
         SJPxBtJPjJM7fibJim5GazqJJArOgb16lN3g8ylME2P8eBZ0omMceiCVOUgBF1CVrWPK
         v/RMxR4S8/qcWQrpSS00SOpyYF49cJiXNTbd4scJ3XneAjff6kQ6wUmORnUozhj6Ja00
         42thpo3NScw00CShjo9b0754/8A1Ui4FXvQ0B/Ki8LtuPTjgjxX68vyROKwFLBEflCy5
         6HSg==
X-Gm-Message-State: AOJu0Yz0Cg/+uJqJ6R7lsoDB6F6eJCptxDNrxDOiSd2JfwBPF1KVkPdW
	Jxdjw0vcLyqCTWeuh5HXEc2zWbNMRb/v4OL1J0phPT1xlhV3N3HhrwRmcpKex3Q=
X-Google-Smtp-Source: AGHT+IEh0rGbp2ElgdH2vDQKMne09RGaf5ngz3J8YYBYifOo6Og8uoqaVqVtcdYTs6YWDQT+34WU3w==
X-Received: by 2002:a05:600c:4ec8:b0:417:f993:c614 with SMTP id g8-20020a05600c4ec800b00417f993c614mr1677610wmq.22.1712924893324;
        Fri, 12 Apr 2024 05:28:13 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:3e87:b228:de9:1398])
        by smtp.gmail.com with ESMTPSA id m18-20020a05600c3b1200b0041668162b45sm8752211wms.26.2024.04.12.05.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 05:28:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Erik Schilling <erik.schilling@linaro.org>,
	Phil Howard <phil@gadgetoid.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][RFC/RFT 00/18] dbus: add GLib-based DBus daemon and command-line client
Date: Fri, 12 Apr 2024 14:27:46 +0200
Message-Id: <20240412122804.109323-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This has been in the works for a long time but I'm finally ready to share it
with the world. This introduces the DBus API definition and its implementation
in the form of a GPIO manager daemon and a companion command-line client as
well as GLib bindings to libgpiod which form the base on which the former are
built.

Please note that while the functionality is complete, the dbus part still
requires some work (bug fixing, corner-cases, general ironing out of all the
wrinkles, a lot of code could be refactored too). This is why the series is
marked as RFC/RFT. I want to get it out for reviews and first tests before I
leave for EOSS and later on vacation. I am aware of some instabilities so don't
be surprised by an occasional segfault.

While I split the GLib and DBus code into several commits for easier review,
I intend to apply all changes to bindings/glib/ and dbus/ as two big commits
in the end as otherwise the split commits are not buildable until all of them
are applied.

The main point of interest is the DBus interface definition XML at
dbus/lib/io.gpiod1.xml as it is what defines the actual DBus API. Everything
else can be considered as implementation details as it's easier to change
later than the API that's supposed to be stable once released.

The first two patches expose the test infrastructure we use for the core
library and tools to the GLib bindings and dbus code. Next we add the GLib
bindings themselves. Not much to discuss here, they cover the entire libgpiod
API but wrap it in GObject abstractions and plug into the GLib event loop.

Finally we add the DBus code that's split into the daemon and command-line
client. I added some examples to the README and documented the behavior in
the help text of the programs as well as documented the interface file with
XML comments that gdbus-codegen can parse and use to generate docbook output.

For DBus, most of the testing happens in the command-line client bash tests.
It has a very good coverage of the daemon's code and also allows to run the
daemon through valgrind and verify there are no memory leaks and invalid
accesses. I still intend to extend the C test-suite for DBus with some corner
cases but didn't not have enough time for it.

Bartosz Golaszewski (18):
  tests: split out reusable test code into a local static library
  tests: split out the common test code for bash scripts
  bindings: glib: add build files
  bindings: glib: add public headers
  bindings: glib: add core code
  bindings: glib: add examples
  bindings: glib: add tests
  README: document GLib bindings
  dbus: add build files
  dbus: add the API definitions
  dbus: add a wrapper around the gdbus-codegen generated header
  dbus: add data files
  dbus: add gpio-manager code
  dbus: add tests
  dbus: add a command-line client
  dbus: client: add tests
  README: document the DBus API
  TODO: drop the DBus daemon from the list

 .gitignore                                    |    2 +
 Doxyfile.in                                   |    4 +-
 Makefile.am                                   |    7 +
 README                                        |   73 +-
 TODO                                          |   17 -
 bindings/Makefile.am                          |    7 +
 bindings/glib/Makefile.am                     |   78 +
 bindings/glib/chip-info.c                     |  118 ++
 bindings/glib/chip.c                          |  396 +++++
 bindings/glib/edge-event.c                    |  158 ++
 bindings/glib/error.c                         |   67 +
 bindings/glib/examples/.gitignore             |   14 +
 bindings/glib/examples/Makefile.am            |   22 +
 .../glib/examples/find_line_by_name_glib.c    |   72 +
 bindings/glib/examples/get_chip_info_glib.c   |   39 +
 bindings/glib/examples/get_line_info_glib.c   |   79 +
 bindings/glib/examples/get_line_value_glib.c  |   67 +
 .../examples/get_multiple_line_values_glib.c  |   72 +
 .../reconfigure_input_to_output_glib.c        |  103 ++
 .../glib/examples/toggle_line_value_glib.c    |   99 ++
 .../toggle_multiple_line_values_glib.c        |  132 ++
 bindings/glib/examples/watch_line_info_glib.c |   63 +
 .../glib/examples/watch_line_value_glib.c     |   91 ++
 .../watch_multiple_edge_rising_glib.c         |   95 ++
 bindings/glib/generated-enums.c.template      |   43 +
 bindings/glib/generated-enums.h.template      |   30 +
 bindings/glib/gpiod-glib.h                    |   33 +
 bindings/glib/gpiod-glib.pc.in                |   14 +
 bindings/glib/gpiod-glib/Makefile.am          |   18 +
 bindings/glib/gpiod-glib/chip-info.h          |   84 +
 bindings/glib/gpiod-glib/chip.h               |  164 ++
 bindings/glib/gpiod-glib/edge-event.h         |  114 ++
 bindings/glib/gpiod-glib/error.h              |   67 +
 bindings/glib/gpiod-glib/info-event.h         |   97 ++
 bindings/glib/gpiod-glib/line-config.h        |  116 ++
 bindings/glib/gpiod-glib/line-info.h          |  171 ++
 bindings/glib/gpiod-glib/line-request.h       |  182 +++
 bindings/glib/gpiod-glib/line-settings.h      |  202 +++
 bindings/glib/gpiod-glib/line.h               |  114 ++
 bindings/glib/gpiod-glib/misc.h               |   51 +
 bindings/glib/gpiod-glib/request-config.h     |  107 ++
 bindings/glib/info-event.c                    |  150 ++
 bindings/glib/internal.c                      |  334 ++++
 bindings/glib/internal.h                      |   54 +
 bindings/glib/line-config.c                   |  186 +++
 bindings/glib/line-info.c                     |  274 ++++
 bindings/glib/line-request.c                  |  434 +++++
 bindings/glib/line-settings.c                 |  359 ++++
 bindings/glib/misc.c                          |   17 +
 bindings/glib/request-config.c                |  155 ++
 bindings/glib/tests/.gitignore                |    4 +
 bindings/glib/tests/Makefile.am               |   29 +
 bindings/glib/tests/helpers.c                 |   12 +
 bindings/glib/tests/helpers.h                 |  139 ++
 bindings/glib/tests/tests-chip-info.c         |   55 +
 bindings/glib/tests/tests-chip.c              |  183 +++
 bindings/glib/tests/tests-edge-event.c        |  226 +++
 bindings/glib/tests/tests-info-event.c        |  321 ++++
 bindings/glib/tests/tests-line-config.c       |  186 +++
 bindings/glib/tests/tests-line-info.c         |   98 ++
 bindings/glib/tests/tests-line-request.c      |  704 ++++++++
 bindings/glib/tests/tests-line-settings.c     |  252 +++
 bindings/glib/tests/tests-misc.c              |   88 +
 bindings/glib/tests/tests-request-config.c    |   58 +
 configure.ac                                  |   72 +
 dbus/Makefile.am                              |   10 +
 dbus/client/.gitignore                        |    4 +
 dbus/client/Makefile.am                       |   30 +
 dbus/client/common.c                          |  644 ++++++++
 dbus/client/common.h                          |  203 +++
 dbus/client/detect.c                          |   53 +
 dbus/client/find.c                            |   66 +
 dbus/client/get.c                             |  210 +++
 dbus/client/gpiocli-test.bash                 | 1439 +++++++++++++++++
 dbus/client/gpiocli.c                         |  174 ++
 dbus/client/info.c                            |  184 +++
 dbus/client/monitor.c                         |  191 +++
 dbus/client/notify.c                          |  295 ++++
 dbus/client/reconfigure.c                     |   74 +
 dbus/client/release.c                         |   62 +
 dbus/client/request.c                         |  249 +++
 dbus/client/requests.c                        |   71 +
 dbus/client/set.c                             |  170 ++
 dbus/client/wait.c                            |  188 +++
 dbus/data/Makefile.am                         |   13 +
 dbus/data/gpio-manager.service                |   14 +
 dbus/data/io.gpiod1.conf                      |   29 +
 dbus/lib/Makefile.am                          |   28 +
 dbus/lib/gpiodbus.h                           |    9 +
 dbus/lib/io.gpiod1.xml                        |  318 ++++
 dbus/manager/.gitignore                       |    4 +
 dbus/manager/Makefile.am                      |   20 +
 dbus/manager/daemon.c                         |  821 ++++++++++
 dbus/manager/daemon.h                         |   22 +
 dbus/manager/gpio-manager.c                   |  167 ++
 dbus/manager/helpers.c                        |  420 +++++
 dbus/manager/helpers.h                        |   24 +
 dbus/tests/.gitignore                         |    4 +
 dbus/tests/Makefile.am                        |   25 +
 dbus/tests/daemon-process.c                   |  129 ++
 dbus/tests/daemon-process.h                   |   20 +
 dbus/tests/helpers.c                          |  107 ++
 dbus/tests/helpers.h                          |  112 ++
 dbus/tests/tests-chip.c                       |  133 ++
 dbus/tests/tests-line.c                       |  213 +++
 dbus/tests/tests-request.c                    |  116 ++
 tests/Makefile.am                             |   14 +-
 tests/bash/Makefile.am                        |    4 +
 tests/bash/gpiod-bash-test-helper.inc         |  328 ++++
 tests/gpiod-test-helpers.c                    |   41 -
 tests/gpiosim-glib/Makefile.am                |   13 +
 .../gpiosim-glib.c}                           |   30 +-
 .../gpiosim-glib.h}                           |   14 +
 tests/harness/Makefile.am                     |   12 +
 tests/harness/gpiod-test-common.h             |   23 +
 tests/{ => harness}/gpiod-test.c              |    0
 tests/{ => harness}/gpiod-test.h              |    0
 tests/{gpiod-test-helpers.h => helpers.h}     |   36 +-
 tests/tests-chip-info.c                       |    7 +-
 tests/tests-chip.c                            |   15 +-
 tests/tests-edge-event.c                      |    7 +-
 tests/tests-info-event.c                      |    7 +-
 tests/tests-line-config.c                     |    7 +-
 tests/tests-line-info.c                       |   11 +-
 tests/tests-line-request.c                    |    7 +-
 tests/tests-line-settings.c                   |    5 +-
 tests/tests-misc.c                            |    7 +-
 tests/tests-request-config.c                  |    5 +-
 tools/gpio-tools-test.bash                    |  559 ++-----
 129 files changed, 15510 insertions(+), 579 deletions(-)
 create mode 100644 bindings/glib/Makefile.am
 create mode 100644 bindings/glib/chip-info.c
 create mode 100644 bindings/glib/chip.c
 create mode 100644 bindings/glib/edge-event.c
 create mode 100644 bindings/glib/error.c
 create mode 100644 bindings/glib/examples/.gitignore
 create mode 100644 bindings/glib/examples/Makefile.am
 create mode 100644 bindings/glib/examples/find_line_by_name_glib.c
 create mode 100644 bindings/glib/examples/get_chip_info_glib.c
 create mode 100644 bindings/glib/examples/get_line_info_glib.c
 create mode 100644 bindings/glib/examples/get_line_value_glib.c
 create mode 100644 bindings/glib/examples/get_multiple_line_values_glib.c
 create mode 100644 bindings/glib/examples/reconfigure_input_to_output_glib.c
 create mode 100644 bindings/glib/examples/toggle_line_value_glib.c
 create mode 100644 bindings/glib/examples/toggle_multiple_line_values_glib.c
 create mode 100644 bindings/glib/examples/watch_line_info_glib.c
 create mode 100644 bindings/glib/examples/watch_line_value_glib.c
 create mode 100644 bindings/glib/examples/watch_multiple_edge_rising_glib.c
 create mode 100644 bindings/glib/generated-enums.c.template
 create mode 100644 bindings/glib/generated-enums.h.template
 create mode 100644 bindings/glib/gpiod-glib.h
 create mode 100644 bindings/glib/gpiod-glib.pc.in
 create mode 100644 bindings/glib/gpiod-glib/Makefile.am
 create mode 100644 bindings/glib/gpiod-glib/chip-info.h
 create mode 100644 bindings/glib/gpiod-glib/chip.h
 create mode 100644 bindings/glib/gpiod-glib/edge-event.h
 create mode 100644 bindings/glib/gpiod-glib/error.h
 create mode 100644 bindings/glib/gpiod-glib/info-event.h
 create mode 100644 bindings/glib/gpiod-glib/line-config.h
 create mode 100644 bindings/glib/gpiod-glib/line-info.h
 create mode 100644 bindings/glib/gpiod-glib/line-request.h
 create mode 100644 bindings/glib/gpiod-glib/line-settings.h
 create mode 100644 bindings/glib/gpiod-glib/line.h
 create mode 100644 bindings/glib/gpiod-glib/misc.h
 create mode 100644 bindings/glib/gpiod-glib/request-config.h
 create mode 100644 bindings/glib/info-event.c
 create mode 100644 bindings/glib/internal.c
 create mode 100644 bindings/glib/internal.h
 create mode 100644 bindings/glib/line-config.c
 create mode 100644 bindings/glib/line-info.c
 create mode 100644 bindings/glib/line-request.c
 create mode 100644 bindings/glib/line-settings.c
 create mode 100644 bindings/glib/misc.c
 create mode 100644 bindings/glib/request-config.c
 create mode 100644 bindings/glib/tests/.gitignore
 create mode 100644 bindings/glib/tests/Makefile.am
 create mode 100644 bindings/glib/tests/helpers.c
 create mode 100644 bindings/glib/tests/helpers.h
 create mode 100644 bindings/glib/tests/tests-chip-info.c
 create mode 100644 bindings/glib/tests/tests-chip.c
 create mode 100644 bindings/glib/tests/tests-edge-event.c
 create mode 100644 bindings/glib/tests/tests-info-event.c
 create mode 100644 bindings/glib/tests/tests-line-config.c
 create mode 100644 bindings/glib/tests/tests-line-info.c
 create mode 100644 bindings/glib/tests/tests-line-request.c
 create mode 100644 bindings/glib/tests/tests-line-settings.c
 create mode 100644 bindings/glib/tests/tests-misc.c
 create mode 100644 bindings/glib/tests/tests-request-config.c
 create mode 100644 dbus/Makefile.am
 create mode 100644 dbus/client/.gitignore
 create mode 100644 dbus/client/Makefile.am
 create mode 100644 dbus/client/common.c
 create mode 100644 dbus/client/common.h
 create mode 100644 dbus/client/detect.c
 create mode 100644 dbus/client/find.c
 create mode 100644 dbus/client/get.c
 create mode 100755 dbus/client/gpiocli-test.bash
 create mode 100644 dbus/client/gpiocli.c
 create mode 100644 dbus/client/info.c
 create mode 100644 dbus/client/monitor.c
 create mode 100644 dbus/client/notify.c
 create mode 100644 dbus/client/reconfigure.c
 create mode 100644 dbus/client/release.c
 create mode 100644 dbus/client/request.c
 create mode 100644 dbus/client/requests.c
 create mode 100644 dbus/client/set.c
 create mode 100644 dbus/client/wait.c
 create mode 100644 dbus/data/Makefile.am
 create mode 100644 dbus/data/gpio-manager.service
 create mode 100644 dbus/data/io.gpiod1.conf
 create mode 100644 dbus/lib/Makefile.am
 create mode 100644 dbus/lib/gpiodbus.h
 create mode 100644 dbus/lib/io.gpiod1.xml
 create mode 100644 dbus/manager/.gitignore
 create mode 100644 dbus/manager/Makefile.am
 create mode 100644 dbus/manager/daemon.c
 create mode 100644 dbus/manager/daemon.h
 create mode 100644 dbus/manager/gpio-manager.c
 create mode 100644 dbus/manager/helpers.c
 create mode 100644 dbus/manager/helpers.h
 create mode 100644 dbus/tests/.gitignore
 create mode 100644 dbus/tests/Makefile.am
 create mode 100644 dbus/tests/daemon-process.c
 create mode 100644 dbus/tests/daemon-process.h
 create mode 100644 dbus/tests/helpers.c
 create mode 100644 dbus/tests/helpers.h
 create mode 100644 dbus/tests/tests-chip.c
 create mode 100644 dbus/tests/tests-line.c
 create mode 100644 dbus/tests/tests-request.c
 create mode 100644 tests/bash/Makefile.am
 create mode 100644 tests/bash/gpiod-bash-test-helper.inc
 delete mode 100644 tests/gpiod-test-helpers.c
 create mode 100644 tests/gpiosim-glib/Makefile.am
 rename tests/{gpiod-test-sim.c => gpiosim-glib/gpiosim-glib.c} (93%)
 rename tests/{gpiod-test-sim.h => gpiosim-glib/gpiosim-glib.h} (86%)
 create mode 100644 tests/harness/Makefile.am
 create mode 100644 tests/harness/gpiod-test-common.h
 rename tests/{ => harness}/gpiod-test.c (100%)
 rename tests/{ => harness}/gpiod-test.h (100%)
 rename tests/{gpiod-test-helpers.h => helpers.h} (87%)

-- 
2.40.1


