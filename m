Return-Path: <linux-gpio+bounces-8262-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFFA934AE2
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 11:28:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64A15281A74
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 09:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3AD18175E;
	Thu, 18 Jul 2024 09:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Sn6zA29X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094668175F
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jul 2024 09:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721294919; cv=none; b=R4ZId8onltzfs04ed57UQt/DBh7VkhTDiKRbxjoj/pUF64oSZ94kLK1jjP4BJA95qVTHaTbw4LujRMmNAHmvmysYtTeW/IAfdQ3vPk+2BTGGb+rR3FLkhl4BGWEHJ+WTYicwwtDgEsQkP5fIicArpoNAqHWXq4KOox2MMQeX2kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721294919; c=relaxed/simple;
	bh=QIrjSUJsl6p18QQadwfvYdFdbzxcJzim7CCvfILzvZM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NvRjDJ+aSmx3iaF6n7WmWYWWmZbrg0Mf4QpcXyeY/e2i+Q6hFI9LPLQu6EKYnvlp0zpSTqbrQcRYYvhqNT2/dMI/Yq+/hFgiwlrbsSVrh1tT1rQjyi0inLG5J7RI5VEUMJSUMM2+qjnFFdY34LTko1mp/cGci4TttCSLGCOH56o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Sn6zA29X; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4266182a9d7so816475e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jul 2024 02:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1721294915; x=1721899715; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2sFLAJwOf48i3rZLqLJN2eqhto0fFFjrqzkEl4wWzBA=;
        b=Sn6zA29Xb3T7JXLSSNY5i2KLeANFB1VsFevljXgjBQfw7zDAr3FHMEb/fZxdd4hJVm
         A76E1n9cJQQmrwAtZAlYtkg6ovcDl+4J+AobhQKwpLEYEGgwYRvXhEPK7056K4YDP0LE
         a9NV6LgMyIBlCs3ZasDLjlAbzIaC4Z5KgWAKxzfB1g5QEBe415tAnJ2LRFUQ0/mcuw2l
         Qv65Dy6El3AnezYYkvfs/ZdbfgAmknA22ICFuShI6+th7O6GeJkdAyScplIhT560tBQK
         Ic3Gr5bP6Kj8nb32n7nkb2YHKLHe1GKkuTYcjyx3fy5Mq5zh7aCftX7PJRfB1kE8YQ10
         QfPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721294915; x=1721899715;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2sFLAJwOf48i3rZLqLJN2eqhto0fFFjrqzkEl4wWzBA=;
        b=It1W3CgXl3nJtGK1lwmPkayn41OdWtEfP9O5yUBcHgMfdD1ZUp4dx+ba9emY/B28pB
         NEg9ezz8DP59hVawnnl89Jo3CsV71Pnm/SjNB7QJflNdhUSgppbHAc3jFUNm+9S7DoS7
         UBQC4Nx4NvvczWn1mq1XcakxO3tkToaHHLCVqZnNTJixsIW4b2xyxNwmtD1JTUz7tsao
         VXu5Usyz11nYI4sDnqZVGCE0D6gux/j8L2COuCl2w3kHOcz2Iqe2/Un2km1IdKyoe+bB
         4+QokSytiXtlNOk1cBB2/nQqDKFKA7SKXpWbe7FlyfG1StFp0TK053zFjWLOELVTlLI5
         veAA==
X-Gm-Message-State: AOJu0YxOl/2CNebe6TQyEExeOvaVihK6kDeJ3rzzxh5eyCm/8Te2B/qU
	P7xMc8rvyuMNHMr3V3XeHZL3Ou5ylIjHTqgm89ojHtVamFz8ahGKq0mewCFZR9k=
X-Google-Smtp-Source: AGHT+IFAxi7wIRXwixBkyhibGdHNibvB4KdSTAKQghVRoEehU2PN7Xg792CC9EQ0VhmVU5aOqyLNYg==
X-Received: by 2002:a05:600c:470b:b0:426:5dd0:a1fc with SMTP id 5b1f17b1804b1-427c2d05ccemr31008425e9.34.1721294915083;
        Thu, 18 Jul 2024 02:28:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:58d4:2f84:5fcd:8259])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680db0489csm13792849f8f.104.2024.07.18.02.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 02:28:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH libgpiod v3 00/18] dbus: add GLib-based D-Bus daemon and
 command-line client
Date: Thu, 18 Jul 2024 11:27:54 +0200
Message-Id: <20240718-dbus-v3-0-c9ea2604f082@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABvgmGYC/23MQQ6CMBCF4auQWVtTZhDQlfcwLKAdYBJCSatEQ
 7i7tW5cuHx5f74NAnvhAJdsA8+rBHFzHHTIwIztPLASGzegxkKfsFK2ewRVo+ZzXxUlWQ0xXTz
 38kzMDSbphkWchSY+o4S786/kr5j+RJVYf6kVlVZcIFHJPaOl6yRz693R+eFD/6lNTpS3Jq9MV
 //Wzb7vb9xUYcrRAAAA
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Philip Withnall <philip@tecnocode.co.uk>
Cc: linux-gpio@vger.kernel.org, dbus@lists.freedesktop.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Alexander Sverdlin <alexander.sverdlin@siemens.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=13337;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=QIrjSUJsl6p18QQadwfvYdFdbzxcJzim7CCvfILzvZM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmmOA4jfMyKutV2CCAC1z5GoFAykcQzgOd1CrH5
 H4iXV2r9kqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZpjgOAAKCRARpy6gFHHX
 cvlCEADWSljLKT5qO+ClniyH5orIk5xhDBTDOG9NKmiCA8DQm2h9HlWWdJTjH/0Mi6+SgmZwpF/
 BTrpIBrBEmGZQrCPVVpsPJdWkhKejz16PrYJ/beu5vDBBqMRnGpUf8vEl4Fy7uQTf57AiZZJIQt
 6ODsrTjFQgrTZa7/SulA4oeq8kov9KzB2D5BqbsFoZEwYzS5swchzq5RQYGQtguovvwKkcDcYkp
 EsA+7ty50+kD/PrFHVVFA/2S6+hI+2E88etg//HWSBbiV9Lr0IOrdQnTz+J8KBEOC8rimZqTsF3
 RzNykIxMTqTPr7E46q33TyY0QnDAA09m6SVYbD56favfSRQ/OqCFzckQXqBvGjswgbXmVSVPzWb
 kee7q364jFeT65r2XVq0GrVBZAVV00+8xEWgh3abRv6MZvlBA6yqnXCOTZur6SJ9hrdwrZcx3vV
 xE4m6kg4suBXhDF16RQ7jKE08QnGtakdGZjhTIDFyAIhutS04YaZUF8mRmziNO4oUGFQL7i+aaN
 ijKYbeg3AZwHKMj20y+75O/kOUMkighsU456qz1zC+Ekbuv5pJTvU/Gv0W4xNFVRqgIL7NqDHCa
 KIy3sbEw3CyVHoVcdOIDdDXI8BKpEVd6KGpkNJEKMwRPrbp102HH8qMm/qjUdmLMVFVyHDYP0UC
 omzUwrul7eN6WEw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

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
accesses. I still intend to extend the C test-suite for D-Bus with some corner
cases but didn't not have enough time for it.

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

 .gitignore                                         |    2 +
 Doxyfile.in                                        |    4 +-
 Makefile.am                                        |    7 +
 README                                             |   73 +-
 TODO                                               |   17 -
 bindings/Makefile.am                               |    7 +
 bindings/glib/.gitignore                           |    5 +
 bindings/glib/Makefile.am                          |  105 ++
 bindings/glib/chip-info.c                          |  109 ++
 bindings/glib/chip.c                               |  380 ++++++
 bindings/glib/edge-event.c                         |  153 +++
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
 bindings/glib/gpiod-glib.h                         |   33 +
 bindings/glib/gpiod-glib.pc.in                     |   15 +
 bindings/glib/gpiod-glib/Makefile.am               |   18 +
 bindings/glib/gpiod-glib/chip-info.h               |   86 ++
 bindings/glib/gpiod-glib/chip.h                    |  167 +++
 bindings/glib/gpiod-glib/edge-event.h              |  115 ++
 bindings/glib/gpiod-glib/error.h                   |   67 +
 bindings/glib/gpiod-glib/info-event.h              |   98 ++
 bindings/glib/gpiod-glib/line-config.h             |  118 ++
 bindings/glib/gpiod-glib/line-info.h               |  175 +++
 bindings/glib/gpiod-glib/line-request.h            |  186 +++
 bindings/glib/gpiod-glib/line-settings.h           |  209 +++
 bindings/glib/gpiod-glib/line.h                    |  114 ++
 bindings/glib/gpiod-glib/misc.h                    |   51 +
 bindings/glib/gpiod-glib/request-config.h          |  112 ++
 bindings/glib/info-event.c                         |  139 ++
 bindings/glib/internal.c                           |  327 +++++
 bindings/glib/internal.h                           |   79 ++
 bindings/glib/line-config.c                        |  180 +++
 bindings/glib/line-info.c                          |  272 ++++
 bindings/glib/line-request.c                       |  429 ++++++
 bindings/glib/line-settings.c                      |  362 +++++
 bindings/glib/misc.c                               |   17 +
 bindings/glib/request-config.c                     |  154 +++
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
 configure.ac                                       |   78 ++
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
 dbus/manager/gpio-manager.c                        |  169 +++
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
 132 files changed, 15704 insertions(+), 585 deletions(-)
---
base-commit: 0c7ec9ee42912db00850c7570bbfd5325339da13
change-id: 20240527-dbus-820e9f7463d0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


