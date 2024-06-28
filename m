Return-Path: <linux-gpio+bounces-7784-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E401D91C1B5
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 16:53:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E4D428534C
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 14:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63E811C0DCB;
	Fri, 28 Jun 2024 14:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="c2sAu66y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE691C0048
	for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 14:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719586425; cv=none; b=XcWu2EulaE3FsGAC0qMfsOIgBtdNz/TsyurT/0W7Glj7mAyuY0l0oaEkCZlMmECW5jJUnxjaHl6jBDB2bYIHXg88NxaYhiNEBtkIK9pokatXzXGrWq+rkLKz0sdOnm+wkE0IIwtV8RCd6DnGrzJ3MapayshppzoxWWdZW3wZXBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719586425; c=relaxed/simple;
	bh=MuWxMADgdxc1uijeEpRf8xAqaJjIgL7TnKoFxYK4yWY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZUUs81aulpDJikeIl+eCMxletPn7DGgrLSNjmMRv5issZsftf0j/nubxsMnqWnGWMonsg5tQWfghminrPWaOO4UFON144hci0ECs/B4/29xVJHFP1AqA2GFHlL9/1vymQnohMqLJzAb0M/I7HJ0wk6pFdE/sbHzH5nt9epdfafE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=c2sAu66y; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3645e9839b3so485657f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 07:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719586421; x=1720191221; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=undfyDoI6HLmOUT8CatDLPUv4wi1DiCjWmAPE+R3xBw=;
        b=c2sAu66y+hw1KAnvyhy1rhTnPZHETN/2GpoBDlmx4rBBC8qMvFsRKDoEzP1N6T7UNr
         TBck6X3FsBMLVEVc764adAy0tTtyieC0YZ+Oo9Z/Jl9kQwDTItpaIfjuyzUPFwlBsqJP
         4PkWbZfIRTd6TzTHeZW9u2Y3YCWtGsHxXD2KcWQ0vCWmvWYLNVqK8gZArqml33eqgRGt
         Wk1Nn5BmdzBoMMQP9m+ucQGVBO//HG1AyYD2m1ASmgq2EoUwPzO+w/9eS8z2526cuUw5
         AohfQBoH6sxs8zoicddlTo93il/jAkIN1OcXLJ1TUHe6mdfkppecoPdFNWWvWdHcio8h
         2zgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719586421; x=1720191221;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=undfyDoI6HLmOUT8CatDLPUv4wi1DiCjWmAPE+R3xBw=;
        b=J94MB1SbrPMBSsyqb6L7c2S4P4Q+ZCfw9uJzGIlRXQrz2y3J1Qta1fDW58ULsjP7XP
         TgvgbcmW0HasbPsBFMPllr/d7TYxh62aPdobRz1D/fUn1fIrBQOP3Kpxv29pZ5ItOwMX
         3ZpVyhj5yuRYMh0Oi02zegf53FqX08pg4CgP2siZBmMGCqElVeVqXPh12Q/ceEFRmk3E
         JwHw3ke8DTOSNtNAUd02Dsr4M44bC5+o4opKylVmYNcdNHaJhZeFzqoRyaNBxAp4cGxZ
         rCwUWADnFI33nBY27yeO+JTpENQ6AQn/DwAhcJ1YMbe9kU2BioZobcZZRUUvr4zVE3x2
         DtQg==
X-Forwarded-Encrypted: i=1; AJvYcCWbFz8dbPoterSL2QkVgMFhZLyGCKV01cbLc1/gu2MY4ZrMFMzoWJwHFckBbgErCp/IgmMl3AhAy++Bp6ItjwT6kE9KvWmwiK6olw==
X-Gm-Message-State: AOJu0YwhAwqrI2hEXcC5h8Pd24gOXMgEAflGY/6R3wsuvtlw0krI3Lju
	rPzKJ0v6lnrvLMvsH9LInFHvCGG9zA6Ax5pKWMoLNQq0Qtf3Zu0RC7RqU5BRk5U=
X-Google-Smtp-Source: AGHT+IFdxNz4UufAmL8ExqBd1ayg0pjklryX310sOVz8/D76NLh1OTvEHwEV2xlfhfhXh3ni38YaDA==
X-Received: by 2002:a5d:58cc:0:b0:363:69dd:ac3a with SMTP id ffacd0b85a97d-366e7a11128mr10261316f8f.42.1719586421364;
        Fri, 28 Jun 2024 07:53:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:cb0e:590a:642a:e1f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fba4fsm2518124f8f.85.2024.06.28.07.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 07:53:41 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH libgpiod v2 00/18] dbus: add GLib-based DBus daemon and
 command-line client
Date: Fri, 28 Jun 2024 16:53:16 +0200
Message-Id: <20240628-dbus-v2-0-e42336efe2d3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFzOfmYC/x3MTQqAIBBA4avErBNkst+rRIvMsQZCRSkC6e5Jy
 w8eL0OiyJRgqjJEujmxdwVYV7Adq9tJsCkGlKhki70w+kpiQEmj7VXXGAklDZEsP/9mhpP1Htg
 bWN73A4Z7PfxgAAAA
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: "As advised by Dan Carpenter - I'm CC'ing dbus"@lists.freedesktop.orgto, 
 linux-gpio@vger.kernel.org, dbus@lists.freedesktop.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11727;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=MuWxMADgdxc1uijeEpRf8xAqaJjIgL7TnKoFxYK4yWY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmfs5stX5/XWrYczWyEhHhwywK6lRt6fYM4ilWd
 sxW0V2bt7SJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZn7ObAAKCRARpy6gFHHX
 cp+pEACQtDwoq//bESAuFYHEpa+TH3kGqNbS92iMTOJG+X5AU+b45GoRKqI5g/8vZpsCMwaMpnj
 Z/PiE7LJVZcE9ZOvqU/cwKlBPi17gES/Ds/dltVKMpr394lQrzsUxPFLFDP4wx3gwX/6xgjBvrA
 E2GILhIpq8Wo1XGU0SiUCu1IKOon38wA5Xf5qHHdZBuDuAy9dy/I8Ridy2p83ZRZun1dUIxzQjh
 HdQIz6EX+e/4R++fKf+i6r1lVSRMoHzcnAyBorOapqaVrz6SMbxuO59rRbc2XEMPeAlBET12yFI
 4yQ7ZtPt9nYijUPyUUpMoi95898vMuQNc8IyVOefvchtskKUS0xXGOB0nzSdGNMHPfiicEp5va3
 4K0T0qzqsVV9SYnzlN5+CzIu8izPao9VjaYV9/HnOD0Xl7zY0jKjfmViLUEoNv7smJ/2qv/Y0f0
 XUyzuONcrwSnARBrfoOMifYbvrMCJLue3WaSJXgSPC1ql4bUesfEJn0ajWLAYMSUfE024gjvMrW
 ByWRHR7cIj/hSE6c/P/INLBw6Bie16WfgtPzDtdUHJ05/prA8e8vfnVQr5fv6SM/zgLpEpn6dcD
 EJbXgKq4kpUWAWBAiaKZYsu2tMo6z8WFWrxFYQUwrFibiej/kBZDBdAbaP7r0C8YMt14pSnRVuZ
 O/EusS1NDV8aklg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Note: As advised by Dan Carpenter - I'm CC'ing dbus@lists.freedesktop.org to
get some comments on the DBus API which can be found in dbus/lib/io.gpiod1.xml.

This has been in the works for a long time but I'm finally ready to share it
with the world. This introduces the DBus API definition and its implementation
in the form of a GPIO manager daemon and a companion command-line client as
well as GLib bindings to libgpiod which form the base on which the former are
built.

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
 bindings/glib/Makefile.am                          |   78 ++
 bindings/glib/chip-info.c                          |  118 ++
 bindings/glib/chip.c                               |  396 ++++++
 bindings/glib/edge-event.c                         |  158 +++
 bindings/glib/error.c                              |   67 +
 bindings/glib/examples/.gitignore                  |   14 +
 bindings/glib/examples/Makefile.am                 |   22 +
 bindings/glib/examples/find_line_by_name_glib.c    |   68 +
 bindings/glib/examples/get_chip_info_glib.c        |   39 +
 bindings/glib/examples/get_line_info_glib.c        |   79 ++
 bindings/glib/examples/get_line_value_glib.c       |   67 +
 .../glib/examples/get_multiple_line_values_glib.c  |   72 +
 .../examples/reconfigure_input_to_output_glib.c    |  103 ++
 bindings/glib/examples/toggle_line_value_glib.c    |   99 ++
 .../examples/toggle_multiple_line_values_glib.c    |  132 ++
 bindings/glib/examples/watch_line_info_glib.c      |   63 +
 bindings/glib/examples/watch_line_value_glib.c     |   91 ++
 .../examples/watch_multiple_edge_rising_glib.c     |   95 ++
 bindings/glib/generated-enums.c.template           |   43 +
 bindings/glib/generated-enums.h.template           |   30 +
 bindings/glib/gpiod-glib.h                         |   33 +
 bindings/glib/gpiod-glib.pc.in                     |   14 +
 bindings/glib/gpiod-glib/Makefile.am               |   18 +
 bindings/glib/gpiod-glib/chip-info.h               |   84 ++
 bindings/glib/gpiod-glib/chip.h                    |  164 +++
 bindings/glib/gpiod-glib/edge-event.h              |  114 ++
 bindings/glib/gpiod-glib/error.h                   |   67 +
 bindings/glib/gpiod-glib/info-event.h              |   97 ++
 bindings/glib/gpiod-glib/line-config.h             |  116 ++
 bindings/glib/gpiod-glib/line-info.h               |  171 +++
 bindings/glib/gpiod-glib/line-request.h            |  182 +++
 bindings/glib/gpiod-glib/line-settings.h           |  202 +++
 bindings/glib/gpiod-glib/line.h                    |  114 ++
 bindings/glib/gpiod-glib/misc.h                    |   51 +
 bindings/glib/gpiod-glib/request-config.h          |  107 ++
 bindings/glib/info-event.c                         |  150 ++
 bindings/glib/internal.c                           |  334 +++++
 bindings/glib/internal.h                           |   54 +
 bindings/glib/line-config.c                        |  186 +++
 bindings/glib/line-info.c                          |  274 ++++
 bindings/glib/line-request.c                       |  434 ++++++
 bindings/glib/line-settings.c                      |  359 +++++
 bindings/glib/misc.c                               |   17 +
 bindings/glib/request-config.c                     |  155 +++
 bindings/glib/tests/.gitignore                     |    4 +
 bindings/glib/tests/Makefile.am                    |   29 +
 bindings/glib/tests/helpers.c                      |   12 +
 bindings/glib/tests/helpers.h                      |  139 ++
 bindings/glib/tests/tests-chip-info.c              |   55 +
 bindings/glib/tests/tests-chip.c                   |  183 +++
 bindings/glib/tests/tests-edge-event.c             |  226 +++
 bindings/glib/tests/tests-info-event.c             |  321 +++++
 bindings/glib/tests/tests-line-config.c            |  186 +++
 bindings/glib/tests/tests-line-info.c              |   98 ++
 bindings/glib/tests/tests-line-request.c           |  704 ++++++++++
 bindings/glib/tests/tests-line-settings.c          |  252 ++++
 bindings/glib/tests/tests-misc.c                   |   88 ++
 bindings/glib/tests/tests-request-config.c         |   58 +
 configure.ac                                       |   72 +
 dbus/Makefile.am                                   |   10 +
 dbus/client/.gitignore                             |    4 +
 dbus/client/Makefile.am                            |   31 +
 dbus/client/common.c                               |  646 +++++++++
 dbus/client/common.h                               |  203 +++
 dbus/client/detect.c                               |   53 +
 dbus/client/find.c                                 |   66 +
 dbus/client/get.c                                  |  210 +++
 dbus/client/gpiocli-test.bash                      | 1443 ++++++++++++++++++++
 dbus/client/gpiocli.c                              |  174 +++
 dbus/client/info.c                                 |  184 +++
 dbus/client/monitor.c                              |  191 +++
 dbus/client/notify.c                               |  295 ++++
 dbus/client/reconfigure.c                          |   74 +
 dbus/client/release.c                              |   62 +
 dbus/client/request.c                              |  249 ++++
 dbus/client/requests.c                             |   71 +
 dbus/client/set.c                                  |  170 +++
 dbus/client/wait.c                                 |  188 +++
 dbus/data/Makefile.am                              |   13 +
 dbus/data/gpio-manager.service                     |   14 +
 dbus/data/io.gpiod1.conf                           |   29 +
 dbus/lib/Makefile.am                               |   28 +
 dbus/lib/gpiodbus.h                                |    9 +
 dbus/lib/io.gpiod1.xml                             |  318 +++++
 dbus/manager/.gitignore                            |    4 +
 dbus/manager/Makefile.am                           |   21 +
 dbus/manager/daemon.c                              |  821 +++++++++++
 dbus/manager/daemon.h                              |   22 +
 dbus/manager/gpio-manager.c                        |  167 +++
 dbus/manager/helpers.c                             |  420 ++++++
 dbus/manager/helpers.h                             |   24 +
 dbus/tests/.gitignore                              |    4 +
 dbus/tests/Makefile.am                             |   25 +
 dbus/tests/daemon-process.c                        |  129 ++
 dbus/tests/daemon-process.h                        |   20 +
 dbus/tests/helpers.c                               |  107 ++
 dbus/tests/helpers.h                               |  112 ++
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
 130 files changed, 15542 insertions(+), 585 deletions(-)
---
base-commit: db68634b738b8ba6078f879889d29e4795e585e3
change-id: 20240527-dbus-820e9f7463d0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


