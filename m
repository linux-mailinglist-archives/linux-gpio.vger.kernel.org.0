Return-Path: <linux-gpio+bounces-8624-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B16994A3C8
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 11:12:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E6241C20DE9
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 09:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69D8E1CCB45;
	Wed,  7 Aug 2024 09:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="v5ri3G32"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1DE1CB309
	for <linux-gpio@vger.kernel.org>; Wed,  7 Aug 2024 09:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723021850; cv=none; b=hPh5WUeBEQk8o96sn1vHXB7orRBuUB8SQEba9XFKFkJf0NvyHqiHr9TaNvwiBczKksBVAaEnEcP5rvPqRy5x8ZVZH3pGgv59fRrKU4eOhitoUxX0Mc4T8pVHY6QGwxQLixlhKoNUgRTseerLUOJi6AyBMm3r8vs1WyiohTZTe+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723021850; c=relaxed/simple;
	bh=w+9JN0WZUYEawPbExL0opsoZqDoBSybffQmjY9Qo5Hg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sUC/eeePSgix5Xj3eUpSAthWKlJ7PQcxU9JMn+3MyVgWoZnqY26+tBqEquOWL5hjDPEVkzcKnArmWn7Mjxqi/8wjc5lz7XVNXQWLz7dJ7GuzV9TEHD5LrA31S+gLkC6541Aw4d6fe+uyz4b12+3MHJrJ2Qfw6GIKpWLHvSxMrak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=v5ri3G32; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-428e3129851so10489655e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 07 Aug 2024 02:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723021845; x=1723626645; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VHObG1nWawxW8uh2XQOYuo9rBddhPRWOdR6wp4NrNMc=;
        b=v5ri3G32d9Yc2hKQ0iGt/5nDKbuhnH6nItVdmW1FHhLWyk/CYD2dvIOSz8OfiX0WFd
         eYdeunkJ+dc7fspaihkTW5Z6KB1zfJm/uBdjyz20JXmjNWAzDEnReL6FCBNXUFPa/PE7
         VD8H9yLdN9Q7FfSaF/zjrTwqdEl5HaQHz1EKiT1ShU267iiILI3oYEsdMRGIRN11yAMI
         WQfBO+1hdKEBwpUoToIPREI8ZXFQSRXkM8uSQq9Sm+qzHuHFvKPMQunU9tDPnxbC+cEO
         wviaWBRJeUBezWeKvsmp73pia/+E+0VgNrNMu6lJP9LJrDRfXTsyGzH/Azn3L6uUugOO
         gQiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723021845; x=1723626645;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VHObG1nWawxW8uh2XQOYuo9rBddhPRWOdR6wp4NrNMc=;
        b=Zp/V85CcAs2c15POeTTlBs9kfe94IcimiBTkw+PcK0NBVqIxP70YX9Mctt3T+gTnXw
         Q0ULRRXi83q1dAcPGwlz2zi9DE0P/EMftSL5xz3EaKSylo7+JE5a5oas43GuLQloNEIy
         CkcvbrYN/lRzEM4CzQOYQdmz4yDUJLIx3DARBmFjWxGHoIzFWTwRBoXVOlUtemj+IrRb
         5xBg1gkkmtec29DzOvvecNlOxb+3kBW/I0ItmNamDRICgH2dzIqfsGgE3FXmdcIdslXU
         pLKRJjFwmt70oobKIKpJbaWYaPjvGOzNns81rx0aQJWGesyS0NUZ65Oswae4Km624nI/
         489w==
X-Gm-Message-State: AOJu0YzsPtWV9A7Qqwy35oJEyaioia3zIaaWhaa25iwFJbrbNk1yWsDI
	Ct6PO6R8qgECOwO49gvq3E5Gi/4HlOd4yCgF6Exs1eR18smcFnmwGi06RxUEFqI=
X-Google-Smtp-Source: AGHT+IGsmXfghaCH9ofZg7fj3nvMLN0hNOIEvfetyud437uzBtzVpCaJuLcKNAH3cM3i3bhey9zNrA==
X-Received: by 2002:a05:600c:46d0:b0:428:29d:4b59 with SMTP id 5b1f17b1804b1-428e6b09a2emr137098235e9.20.1723021844666;
        Wed, 07 Aug 2024 02:10:44 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a3e7:be71:fe4f:c360])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429059cd2b3sm18936355e9.44.2024.08.07.02.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 02:10:44 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH libgpiod v4 00/18] dbus: add GLib-based D-Bus daemon and
 command-line client
Date: Wed, 07 Aug 2024 11:10:31 +0200
Message-Id: <20240807-dbus-v4-0-64ea80169e51@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAc6s2YC/22NywrCMBREf6VkbSS9iX248j/ERdrctBdKUxINS
 um/m1ZEBZfDzDkzs4CeMLBjNjOPkQK5MQW1y1jb67FDTiZlBgKUOEDJTXMLvAKBtS1VIY1gaTp
 5tHTfNGc2UNNN5Ay7pKancHX+sfkjbP2mKqB6qSJwwVGBlAVaBCNPA43au73z3ar+s25zKXPd5
 mXbVN/r9S/Kz0eZvym5UjVqKISyooIfalmWJ2If7MEHAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=13496;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=w+9JN0WZUYEawPbExL0opsoZqDoBSybffQmjY9Qo5Hg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmszoLkkgE2R0/Hxwp7WIPD27BxMKB+r0d4Ruzt
 +EcZB1PMB+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZrM6CwAKCRARpy6gFHHX
 cus0EADJCaJnoekTa/IGwdQ5znHCk78riO6+RBru7aTOQw6AfTDeAI6tMPrL6PK0qvji4/Dfl1J
 NeXfQr0fJJXtZPZnI2VaVqcBri3KVsnWXbh1+H1Lm2SVFR2Tqfw5KSPZ9FCXPRtwDqFO7JEfoF/
 rBwB5K1tz1WQt/4qV46B/xXlSkXoCIJYhIxqyrW6vCWVrz+J6QNneK3HU3I/JmIx/+Cd/VCSAwq
 G8p5j7w2iJNJK5Pv9jMCZ3FnRBtcrWpYk2uf1YHGLajlHWllCEDVmq/ULtnQgND/cAUmEVLznsx
 RQWI+ujXUKRQMxUzFTnDcNUBqFqznMnMZrjVNeZqI6MJ4doMLDvV6G5R5LMkLiAzJTS1nNJ++Jr
 7D8Yzlb8oIU4UWXStSHgFPogJEdvZQhURQW2mTIteIrP8CC1NEiO2jYGGcbD6tFz0kyExpJ5+ug
 rJ/jkSLP0RcihbVZBO5J7py74FOs0/Gn5eWosiLiqY3m7EmAzDB9prWM1i8au6389CkCGNNeCsY
 UsCjs0KC9KaTI9qKpnowAghnrHawReCBNkWsxsi5AhS6EWTi7kWvrATu243MFft2DURibr32XM+
 3TglTqMR5P+KLQNYEI1ien6aw4e9CypMk+kJCPAl07ya12RHjgDia9qKm80EizvqPkTNbE1uUJE
 xzNebBR9EKTLbGQ==
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


