Return-Path: <linux-gpio+bounces-15739-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E984BA30C43
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 13:59:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEAA33A42A4
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 12:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49A5921423B;
	Tue, 11 Feb 2025 12:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NwRXwMFG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2290D213240
	for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 12:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739278781; cv=none; b=gKuW2l9ezDPbjpbpPL3AZFbkn9KovxXgSrgc6XHfLdEhQ69Gzv2CAKaQ7UZNx8ADCGxfle5Y57IYnddvUM16ScWwtreLEeT1IlC8wvSeMgrVbeJxowlIeBpNtl9xfSHS6ctnwlbMoFgBOKkgt8Byd1X7C9JPsByTcMX56yUEH4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739278781; c=relaxed/simple;
	bh=Tkcaw/i68/mGLFSCaLA6hDAM0wGB8dc8o+czmsfm6EU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ge/T95N0YLl9JcvtMSdX7z70DMHXjqUFn5GT/SzcIc7bDjkBWUbgGVXnEJVmSjWPfT02BvYzTjX55Cuk6QjZDkKaaFPnW5zzyaHRpn0zHPgml515wqmy70E115I4Jg6iVPWLJDFHuZXYYEnRzt5obkOREEhm105VOhWbL1+myQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NwRXwMFG; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so54954785e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 04:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739278777; x=1739883577; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9REEDue0ZL3y36nRbuMprgfG87O+ho1CnNYvG4aNwA4=;
        b=NwRXwMFGCU1BGPfjrCLySO184SXEZWb535zsa1r07WO8dw7PXFNZtvzo8XBz7qN+yi
         aDIXu2Q6RHu9CoWeXlXZ0GOI4HhMQ4mwVK1YD96bG/6H5Gg8jr1UvYTljwiRySDjNV7H
         RhwL21aT6PsfxFUgxWYXt1mIOMVB8HCSxjvrjnbOKkKYZVjceFtyvZX1pzc0Erokj70C
         E8ryBCgyFtTFZDY8qW4Er6NoxKfFuT8WFOYUBc3RIm1+d/Sa5/h8UDt46AYBCL2bPpkF
         V94VF5HmP+/1xa7mIEAlhOT+mYvS2qzUGJl3yJ7HUXtNUDH4LGKKJoW/GkuOz9vKED/L
         HLgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739278777; x=1739883577;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9REEDue0ZL3y36nRbuMprgfG87O+ho1CnNYvG4aNwA4=;
        b=vpmpWkdwMVdJ4Vvc40KgjTB2UF0WFL8NnR/mMD3ztIDQz5qbnhR6jc4/u4YwkWvHJx
         4rjwhe3W2v6SVMU/sq487jh7yCgpr3DFdaY0R5iFNwE4mfDvAbNOlSXj1BOYatzhEsz5
         AJM6Z04cbyXl0vMC+hFDie+LqWBecqx2Rli0cOy6YspQjU4aF1tYpvkphRXBjYjZmxTB
         WE3+1UOKeLVhTMg7iHyWYb1JV4xgKuFY3Z7fwL1OUdET7m/jmeJthucVs7DsFGRWMbq0
         +8xiN3rF4bEd9OhHbxsKKoSxYrr7e+Y+hjznr3uO9qCmX5Z+9x/Emb7/AUgvJDZWCDji
         5//w==
X-Forwarded-Encrypted: i=1; AJvYcCVh+Nra0LCtisU0A/OjKworTBjh1kk15eqP/K5tw6i8dEL7k0VGCPmGVd41yNOhyoDVyr/56xKsbOJP@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz5rjBEz3uk3+Aew3dWuaHrVc4fMXhC1+PsAPFzpLcZ/++Ovru
	kRq/rKq9lFmD2uO9yGI+YtZpcuDfHx2W5NukMRzb1pLhQhOropSATRrY2GnNU6E=
X-Gm-Gg: ASbGncsJtYOn6X3ckN4mdNJz4PmhiDDO4cmE5qTMMj76N4lhPgcxKriHyGJyo8XZjYQ
	QXbN5ArtiC11fj4/dkahD14UsHdDyKi6sb61ZwAqbmh5oW21fMkFytW9tpNIReXv09gc0UQHRTf
	ZRxqdBVkP/FgG7gKLxSyPlmEgX+63r+9NLi/kzhYwxfeQzQ8hOEpuQKrfpbyr0N5IBHp0xLXRNh
	/ndOJRTMRa5hBrCVZJiQ38NU/AZioxkqZ6UlS6nT+uLXJK4zixNQ1ISM4My2DbbrjCdkF32Ll7B
	XTWAESo=
X-Google-Smtp-Source: AGHT+IHb0I1GqAQr6lumyrMji9XCAiaK1Pq1iSEJCYO4/Kju96KBoWzCRp8TtO7+qGoXpjL80Kr/sA==
X-Received: by 2002:a05:600c:3d0c:b0:439:35bb:a5eb with SMTP id 5b1f17b1804b1-43935bba811mr104779425e9.4.1739278777264;
        Tue, 11 Feb 2025 04:59:37 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94d40csm209844095e9.9.2025.02.11.04.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:59:36 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH libgpiod v4 00/17] doc: improvements for ReadTheDocs
Date: Tue, 11 Feb 2025 13:59:21 +0100
Message-Id: <20250211-improve-docs-v4-0-dc56702c2ca8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKlJq2cC/2XPQQ7CIBAF0KsY1mKAttBx5T2Mi7ZAO0ktDRiia
 Xp3CcbE1uXMz/uTWUgwHk0g58NCvIkY0E1pKI8H0g3N1BuKOs1EMFFywSXF++xdNFS7LlAORhd
 S1gpkQRKZvbH4zHVXMmLbz+g0uaVkwPBw/pXvRJ7zT6Vg28rIKaMKoK0lANemu4w4Nd6dnO9zU
 xS/Wuy0SBqYVE2jVMUA/nTx1RUTbPdOLJJO24oDt9ZKu9Hrur4BfuQrey8BAAA=
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=8751;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Tkcaw/i68/mGLFSCaLA6hDAM0wGB8dc8o+czmsfm6EU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnq0m0YJ1NT08b0iE6bGtzpzQEkn6yI3X9MC/mp
 6su6i1tTZiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6tJtAAKCRARpy6gFHHX
 clJzD/sFUIyXBQBx1TpnrlX39W4KOJanpeODYyngqW5r6VCBK80CdXae5cYq0rey79gtMEpPzPS
 7k0cXmohQvUHtJmk7zJBYFB9ltmzEYi5GQr3VA/jXVgbjDcMqagCCcIBIIHS8KeHkAFACjlidKA
 TL4r3IPW5ndhrTsuBvZr+1QRWgas24jnIH+bk1MOkX6F/rRZP733mgHj93ztWzaDiL6lhbOGVHN
 XRRXxf0npIo/KwazKY1Gy2ulyxtiqHI7mTURs5M/fdYiuxiDfw882t+fAnQk3MwiP11kywEyTq9
 HSmAxHqVKnrGzTvkQH0Ag35RrKzgERpJBvWxv+ve13RL8O80zeAD45qmdp97LVIzyxP8cBoCIR+
 yW4/FTwwH6hl5cyZ+0SzjAOMu9bgsqZcQYIxKeQpLB84oilB3KOTOSCo3iMCnSh+kPaQMXRqG49
 Sv2qJauhAlQKd3W/V4KLtxbIZIAeJFcShkWprBDG7XKV6dWgvO48XgD+miQzc6KXq5bJbw7nn+9
 UeAYVlanKqQ4vyi42Y4dtTOs2TLiICggi3lsADllhyZNPXHksOTOW8PFpeEH+bM10EadnY0Gcst
 7RilJndrdoKwhorNQUPdJAGTbVJ0JMZ6SqegNwVIVpErss68Z3kSqv0d9npKL9iwtUg1xb4TkVE
 swH+ndYQ5QtINAA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

One thing that this project is missing is nicely looking, accessible and
automatically updated documentation. I'd like to finally address it and
replace our static doxygen pages with sphinx docs.

I spent some time playing with sphinx, doxygen, breathe and exhale. It
turned out that exhale doesn't support doxygen groups and I really want
to have them for the core C API to avoid having to manually assign each
function to a specific module. That means we must use breathe on its own
to integrate our existing doxygen docs with .rst.

First 10 preparatory patches address existing issues in code
documentation. Patches 11-15 add sphinx docs for all project sections and
last patch moves most README contents into sphinx as well.

I allowed myself to publish this branch on RTD for testing purposes.

Once this is merged, I'l backport these changes to the v2.2.x branch
so that the documentation for the most recent release can become
available online too.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v4:
- remove unconditional docs for __init__() in the python section, use
  `:class-doc-from: both` instead for LineRequest
- fix `make docs` failure with GObject introspection not being found
- fix `make clean` for sphinx and doxygen output
- fix commit message typos
- fix whitespace errors
- Link to v3: https://lore.kernel.org/r/20250206-improve-docs-v3-0-2065191fff6f@linaro.org

Changes in v3:
- make the commits more fine-grained: add a separate commit for each new
  documentation section
- set the PACKAGE_URL in configure.ac
- add GLib docs
- add gpio-tools docs
- generate man pages for D-Bus programs
- add docs for D-Bus API and utilities
- reduce the top toc tree depth to 1
- change license of .rst files to CC-BY-SA-4.0
- move most of the README contents into sphinx docs
- many other minor tweaks
- Link to v2: https://lore.kernel.org/r/20241222-improve-docs-v2-0-9067aa775099@linaro.org

Changes in v2:
- update .readthedocs.yaml
- add requirements.txt in order for rtd to install breathe
- mv doc docs
- a couple minor improvements
- Link to v1: https://lore.kernel.org/r/20241220-improve-docs-v1-0-799b86991dec@linaro.org

---
Bartosz Golaszewski (17):
      build: set PACKAGE_URL
      bindings: cxx: doc: remove the gpiod_cxx doxygen group
      bindings: python: doc: update the docstring for gpiod.request_lines()
      bindings: python: doc: make code examples appear as such in sphinx
      bindings: python: doc: describe undocumented members
      bindings: gpiod: reword the docstring for LineRequest.__init__()
      bindings: glib: add the configuration file for gi-docgen
      dbus: daemon: add a more detailed description to help text
      dbus: client: tweak help text
      dbus: improve comments in API xml
      doc: create man entries for gpio-manager and gpiocli
      doc: provide sphinx docs for the core C API and C++ bindings
      doc: add documentation for python bindings
      doc: add documentation for GLib bindings
      doc: add documentation for gpio-tools
      doc: add documentation for D-Bus API, daemon and command-line client
      doc: move README contents to sphinx docs

 .gitignore                                  |   2 -
 .readthedocs.yaml                           |  25 +-
 Doxyfile.in                                 | 105 --------
 Makefile.am                                 |  24 +-
 README                                      | 386 ----------------------------
 README.md                                   |  11 +
 bindings/cxx/gpiod.hpp                      |   6 -
 bindings/cxx/gpiodcxx/chip-info.hpp         |   9 -
 bindings/cxx/gpiodcxx/chip.hpp              |   9 -
 bindings/cxx/gpiodcxx/edge-event-buffer.hpp |   9 -
 bindings/cxx/gpiodcxx/edge-event.hpp        |   9 -
 bindings/cxx/gpiodcxx/exception.hpp         |   9 -
 bindings/cxx/gpiodcxx/info-event.hpp        |   9 -
 bindings/cxx/gpiodcxx/line-config.hpp       |   9 -
 bindings/cxx/gpiodcxx/line-info.hpp         |   9 -
 bindings/cxx/gpiodcxx/line-request.hpp      |   9 -
 bindings/cxx/gpiodcxx/line-settings.hpp     |   9 -
 bindings/cxx/gpiodcxx/line.hpp              |   9 -
 bindings/cxx/gpiodcxx/misc.hpp              |   9 -
 bindings/cxx/gpiodcxx/request-builder.hpp   |   9 -
 bindings/cxx/gpiodcxx/request-config.hpp    |   9 -
 bindings/cxx/gpiodcxx/timestamp.hpp         |   9 -
 bindings/glib/.gitignore                    |   1 +
 bindings/glib/Makefile.am                   |   6 +-
 bindings/glib/gi-docgen.toml.in             |   9 +
 bindings/python/gpiod/__init__.py           |  15 +-
 bindings/python/gpiod/chip.py               |   4 +-
 bindings/python/gpiod/chip_info.py          |   5 +
 bindings/python/gpiod/edge_event.py         |   9 +
 bindings/python/gpiod/info_event.py         |   8 +
 bindings/python/gpiod/line.py               |  20 ++
 bindings/python/gpiod/line_info.py          |  12 +
 bindings/python/gpiod/line_request.py       |   6 +-
 bindings/python/gpiod/line_settings.py      |   8 +
 configure.ac                                |  33 ++-
 dbus/client/gpiocli.c                       |   2 +-
 dbus/lib/io.gpiod1.xml                      |  98 +++----
 dbus/manager/gpio-manager.c                 |   9 +
 docs/.gitignore                             |  19 ++
 docs/Doxyfile                               |  12 +
 docs/Makefile.am                            |  61 +++++
 docs/bindings.rst                           |  27 ++
 docs/building.rst                           |  74 ++++++
 docs/conf.py                                | 137 ++++++++++
 docs/contributing.rst                       |  45 ++++
 docs/core_api.rst                           |  62 +++++
 docs/core_chip_info.rst                     |  11 +
 docs/core_chips.rst                         |  11 +
 docs/core_edge_event.rst                    |  11 +
 docs/core_line_config.rst                   |  11 +
 docs/core_line_defs.rst                     |  11 +
 docs/core_line_info.rst                     |  11 +
 docs/core_line_request.rst                  |  11 +
 docs/core_line_settings.rst                 |  11 +
 docs/core_line_watch.rst                    |  11 +
 docs/core_misc.rst                          |  11 +
 docs/core_request_config.rst                |  11 +
 docs/cpp_api.rst                            |  37 +++
 docs/cpp_chip.rst                           |  12 +
 docs/cpp_chip_info.rst                      |  12 +
 docs/cpp_edge_event.rst                     |  12 +
 docs/cpp_edge_event_buffer.rst              |  12 +
 docs/cpp_exceptions.rst                     |  18 ++
 docs/cpp_info_event.rst                     |  12 +
 docs/cpp_line.rst                           |  24 ++
 docs/cpp_line_config.rst                    |  12 +
 docs/cpp_line_info.rst                      |  12 +
 docs/cpp_line_request.rst                   |  15 ++
 docs/cpp_line_settings.rst                  |  12 +
 docs/cpp_misc.rst                           |  16 ++
 docs/cpp_request_config.rst                 |  12 +
 docs/dbus.rst                               |  37 +++
 docs/dbus_api.rst                           |  23 ++
 docs/glib_api.rst                           |  26 ++
 docs/gpio_tools.rst                         | 241 +++++++++++++++++
 docs/gpiocli_top.rst                        | 110 ++++++++
 docs/index.rst                              |  43 ++++
 docs/python_api.rst                         |  41 +++
 docs/python_chip.rst                        |  12 +
 docs/python_chip_info.rst                   |  12 +
 docs/python_edge_event.rst                  |  12 +
 docs/python_exceptions.rst                  |  17 ++
 docs/python_info_event.rst                  |  12 +
 docs/python_line.rst                        |  27 ++
 docs/python_line_info.rst                   |  12 +
 docs/python_line_request.rst                |  13 +
 docs/python_line_settings.rst               |  12 +
 docs/python_misc.rst                        |  13 +
 docs/requirements.txt                       |   5 +
 docs/rust_api.rst                           |  23 ++
 docs/testing.rst                            |  46 ++++
 include/gpiod.h                             |  36 ---
 man/Makefile.am                             |  72 +++++-
 sphinx/conf.py                              |  68 -----
 sphinx/contents.rst                         |  24 --
 95 files changed, 1793 insertions(+), 859 deletions(-)
---
base-commit: 5486f1f0ffa419bcbb25288b0157c8e2ab643403
change-id: 20241216-improve-docs-19ed36687963

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


