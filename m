Return-Path: <linux-gpio+bounces-7809-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC9191C62E
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 20:59:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1E132862D8
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 18:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5712655C29;
	Fri, 28 Jun 2024 18:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ONbcLsjF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7B25466B
	for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 18:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719601141; cv=none; b=KaiiEhB7RZwXlSyfxAIlE7v9c9dolpOImK3THkz1b5KXdj70qVGe6lfSxk3B9S6J5i0gYwzUezvZeLb3ZCKh0/Q9XLLYTPFKlVNWfD9mPax8Md5w9kDflK1uUVMx0/+UpRqJnPce0E67fuh88goxmjuOjGLmn+ryD4wh29XR9bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719601141; c=relaxed/simple;
	bh=qQWO/fsfLGE8Z7wymGHA1L/lJggEFFhOyvzlRZGH27Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KAAgHm9ajhTK5N81WIRin6WKdRb9OQq4I0fEgY/Ayq4mSes5R6BMkEwnKKmyk4ani+NpH9Mo7BYoRUTCKBbUzRJee+V6GC3q6KomXVEXCmjRZVZBkFIe/P1mdZT3SmU/YzRP+sYdvdOybVRU6hJWAwueE3aZCrUVvOXq/QRK2aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ONbcLsjF; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42567ddf099so6837715e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 11:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719601137; x=1720205937; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=04R0uSE8aQW1VvVkhDGzP5hj1JQ9+8CMVe1FbGvED2E=;
        b=ONbcLsjFIydhm6Yt7D2ls4c/UeEun0mCJuVFWI8P4+zLRQilOzk0NHZVxtS5bHtk4g
         aA89m/8J+f4rw1K/xFbyZC6N6BVnBBplpReiqqYORWr11GYH223LAeu+tZPrj8p1zs6e
         iDLbrcCJgE1vk+/6VVtZLcAdpYmwek3obP5ELe/khhD9fPs2HXZ6Qu32j8lBWS2gYPv3
         U0d6IL8HLO2D+SJTOzAFBiarkPO6tcRE9raz89feOBz5RjgC3ZtnkKEqqeMJT+R5buxx
         +2aItudCI22lKuTQzW8Y8lQm20n90FqCsUvD2PFTiYq0PZjdLzyl4UZFS35YcsTGUv+3
         4q5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719601137; x=1720205937;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=04R0uSE8aQW1VvVkhDGzP5hj1JQ9+8CMVe1FbGvED2E=;
        b=DiGbG3SzElQYAkeXYDh5gM2KLmtVuNGNJgbM/bFsiO3F9f8Cke4WLbFRfTzalPXoIp
         pfXrqSZ6GbZy4xe2wa3eA04rEZPock8FWjNQ2yke4Jc0wt1SAPIopPR5RvS/397yaUwo
         ydDhu5AjMZEcapcSj0Erfn7k27CWFmD5SCnsupyaRqqWB4gSBJgsA3gJgqGxP0SujH21
         TR6zdMP2u9+o+LKLPTu2E2Pl9DihqonSZVrv9uvOELJDUWEkqvbfwmsRg1GxfaRxu1Z5
         zsSp2UO3lHB4L9HAUm2osg79tI9QFDo+C6Xs5GyDK5HqvKdu1+p04Pjfs19bdf0Tp8NM
         Zs6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVW/R71XzQG8mn0f063xexZkBNpHtD0AY8br2wfvkMf2qiPEGMCGQwvUfIG2MQlRsw7g6ZaIkFu5f+kT97NZkXS9nH2486oQaK/fw==
X-Gm-Message-State: AOJu0YwE97K1icj1DCtils7zWOsnDPvhTvRWI3/+kOlA2uwotRSG6sFI
	LNT4o6EtLOa39X/pcQzboFpO+aErEj1ifUYRctKY7sGoyN5xZKRQhvuDol1rsHU=
X-Google-Smtp-Source: AGHT+IFGmrgRmHhudfdxgY33xk3ylEdDShMFsrHx+w626XZq68jiiZeqHykgkxxEPzSdqb6zwE5tMw==
X-Received: by 2002:a05:600c:3596:b0:425:6f85:6013 with SMTP id 5b1f17b1804b1-4256f856115mr14200475e9.8.1719601136765;
        Fri, 28 Jun 2024 11:58:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:cb0e:590a:642a:e1f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a103d00sm3097336f8f.99.2024.06.28.11.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 11:58:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH RESEND libgpiod v2 00/18] dbus: add GLib-based DBus daemon
 and command-line client
Date: Fri, 28 Jun 2024 20:58:19 +0200
Message-Id: <20240628-dbus-v2-0-c1331ac17cb8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMsHf2YC/yWNsQrCMBQAf6W82Uh4qWl1crCrg47SoTWv7YOSl
 ESLUvLvhjgeHHcbBPJMAU7FBp5WDuxsAtwV8Jw6O5JgkxhQYikPWAnTv4OoUdJxqEqtjISkLp4
 G/uTMA27Nvbleipn7cWFnoE3CxOHl/DdvVsxaLmqs/8UVhRRUolKaBkKjzjPbzru98yO0McYfU
 kedQKoAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11833;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=qQWO/fsfLGE8Z7wymGHA1L/lJggEFFhOyvzlRZGH27Y=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmfwflEWCrFdH/kgrKTe5N+V67niOtUSifuQOBF
 smBJiYZr4yJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZn8H5QAKCRARpy6gFHHX
 cpueEAC8cSax6fhnIgnjh0CEH8AVHb7/CH9EMOXJL8ZLavdLHKDsLO5TQNh289AE3SXZJHzf+si
 Ai7Po9lSJYan5D0hXSSgE1am2zf2KYvzGbDVApvDUSgsSAVKvYqd5c+p7qKJ1JEph35k9tWJqm1
 lF/W4VksuOZJ6eu8NZ5f10OMgaDV4QGhxWDOufk5aT4FmbCgcZSa6SCH1fEn2FafM7xv/wspjA+
 RWex0yU/or3OmHe16V6nrvDYBNnt8/8wToOixRaifYUuGSTyuya8K/DCxQaytv+BfvcASAyGTnw
 0sQqdWMxg042awUrb4RxfN8ve7K/DKZfhJcoI+jBZYtQDwYMN7LXsCxzRga4f/vZM4GxKEcs0Wc
 CI+4m7piAZQPJakgFUTD4w9YzHchvuvxDOT43/04JPamd2pkpY82Fr7r9D+cn4o2ri1Qc2B+ait
 0033cb5Iqa1T4h5KlVpAIsXkcyfWiUXGpq4VNernq4iuoing6ab8AVerc39A9Otmy6jW/OCfubG
 J2QL5YYYi0Sh1WHMoNf1eEHosn6MteHOqtGkz42hRNo8bccbqqgY0jfgTPTzZ+73Kqq7WLQfwS9
 coQvSP7QsYdiKOJ7155xQcJr/BcxU8CFgDFLdT8PrclIAzpo/7Bgw0FDgA6kwS5N16yFM/1Bogp
 DWt9Ix/EGt6916Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Resending as the emails bounced off dbus@lists.freedesktop.org due to me not
being subscribed before.

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


