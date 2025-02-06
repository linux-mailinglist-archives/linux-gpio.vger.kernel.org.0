Return-Path: <linux-gpio+bounces-15445-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0946A2A85B
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 13:22:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE8223A8091
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 12:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0003522D4D5;
	Thu,  6 Feb 2025 12:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Nq4xyyWr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D7021CFF4
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 12:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738844539; cv=none; b=O/j3oIl2yatjHaOXQt6h1UFU+7F/aPp8bwds8X1OqVpqpI9No3TsqVxA1FQCYlcSGekSlS8htKe8AS+M/WhF3GjYRDKmYQgXMm9QqKibWOEutOnOKTn7WoMPN+LrrDJqT9VLyBW1V95c0wMLYtj6YS3fBcUBrvSWrvBSgIHwl4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738844539; c=relaxed/simple;
	bh=qK5jixDXwHlJhUGKnP3lAdr5pW3YcKddPc/7DWESjbc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eMHCqtt/Ej0w4GAt0qJ2jInJVnrI/6hLJC3qjXye91p4SmNRaehFQYEXb0OEV8HuFxa3a4/neyc9PPM7Fsl6TShUF+eYWJ/YL8SbGPTORrM+LZobnhjGlnzq2pOKKGlJm6ZokJU9ZibBQHic491cr3Sr/oLX5AHm5N76cQvFNV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Nq4xyyWr; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436341f575fso9273375e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 04:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738844534; x=1739449334; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SnP5ytzk9xebxqWu82akfbY+zGo7ZmWm4NpVSWdQQIA=;
        b=Nq4xyyWr15H8TumL0NZ9QXpapy5NHK1aYevv6vXC33hVntA1Y5XHE46zKqnVyB1T7d
         +YbGtQReyIDJl+6p8cKPZnzzCk84mF2gv/WovzdA7/HNWtFiyn8xOJUzjjl9GCyJlh0w
         zCVWnJPD8jGUaCmugaPLR/gCRVH25sH6sSx5F90CA/GaCm3J4y4rtvT2gKPb2EnRBOhp
         f/68RbMNyXw0eeCr0KOD62VMre3FnfwjlWPUXM/WznkLnfnwfhSjsP1j3EZTEyk8JBX4
         b1kw9bNzYGJSk0HQMYRb3yGutZrQFskGTVUHTcrVkfwqBhoCkXF8Fm1NRitoqPN/WM98
         VxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738844534; x=1739449334;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SnP5ytzk9xebxqWu82akfbY+zGo7ZmWm4NpVSWdQQIA=;
        b=Ug4XeLasIEMLVTk4DLvHLGXe1Rje4YpqHE9wkA5/NUCC34oMDUn4vQTn2CstA8jMZy
         pSUEOSgICph/3pLCR3A16N764dLi8iZWnBEW5gAwsNMDf3te0soJIvfxog5zY5PC0Oe/
         5oah28uwuFYIdorY2alKVbdE0lTdvtcLTIqUXHLQmUvIcrympNTJa5/JcoR4Uwrn35vt
         wKONRxgjnjogGvXoQCV5e7TFgWkrCF49EwkjimEVlTXkI0V6fk8XP2dzSGdKYZnptYQX
         mZ+85wrdeGV5uZNKXBb+w/tc3y4pDwsZAwYpJkrvUGHsBagtjpKsgN/2nx1LgRdSGy2A
         kT9g==
X-Forwarded-Encrypted: i=1; AJvYcCXxkbNLixL4muB1/4/WCQ4OvvKdiwIpxZa34165ipFIxqNto4qZcPB015HauhILvRY4aah678MkaoX5@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbbg/gCZDoUmGr5dKdF9l/fSlaPxr92mnvsXBbykI+tq4fFJIW
	R9AbeLHorV2w5eGCHTiPzcRxLH6FK2WWNx2OVMD9qzDyc7Wf69BnGnYLH3u8DWc=
X-Gm-Gg: ASbGncvmX7X7YuYyBxUfIMTaN/s79SRA45IxvvsjoazlrQ2m+V4SbphkUyb+PiHi7FX
	59El7Kgq0MV+p7fHskpf8rCuvMxWOvYXvgCCnF4cYtRrm+PrBdOx87o7KLJnqoV3neliCCe5pUm
	0sZdusnaExSy35iricFNLoh1znfh7gkhuaLAotVR6QK6dzQIYnOlOcOIE7i+cEftuk8cvbh5NEb
	otEjvUBnRAc1eKePJ31+HPnEW+Byfz2b11p6R4U+7AhaPcJyyAqb8oD4f/kSFKMR4QAUvTzi7cq
	Paem3A==
X-Google-Smtp-Source: AGHT+IHJa5sarGvaSMu8zTvbpP22ooadCMmyLiNLIdfbglFtwJrNcbZgytB7AKfkR/39fVESqeYCqw==
X-Received: by 2002:a05:600c:63cf:b0:436:6460:e67a with SMTP id 5b1f17b1804b1-43910d2230cmr40927355e9.25.1738844533660;
        Thu, 06 Feb 2025 04:22:13 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c726:a8e:825:b823])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfd7d7asm17366775e9.36.2025.02.06.04.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 04:22:13 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH libgpiod v3 00/16] doc: improvements for ReadTheDocs
Date: Thu, 06 Feb 2025 13:21:57 +0100
Message-Id: <20250206-improve-docs-v3-0-2065191fff6f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGWppGcC/12NQQ6CMBBFr2JmbU1btGVceQ/jAugIkyAlrWk0h
 Lvb1I24fPl57y8QKTBFOO8WCJQ4sp8yVPsddEMz9STYZQYt9VFpZQQ/5uATCee7KBSSq4ypLZo
 KsjIHuvOr5K4wctvP7B3c8jJwfPrwLj9Jlf2b1HKbTEpIYRHb2iAqR91l5KkJ/uBDX0pJ/9r6z
 9bZRmls01h7kogbe13XDyLVnRrxAAAA
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=8167;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=qK5jixDXwHlJhUGKnP3lAdr5pW3YcKddPc/7DWESjbc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnpKlxhLB3083xbgSp9MgbA5vZVy5ZAJW6vVLHf
 6yBOub4EPqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6SpcQAKCRARpy6gFHHX
 co0iD/9oyi4QQHVo3uPXPXEdYPZF/ELAiW3dJfOO1ZWG0XxRZIam+kDHTJS2dQIcXBnMh1ehTeG
 HybN98PlVfG6oMeVLmBEnbXk/R0JZF5vKCM6kchYpGCssgx2bswn25yT4rEtHVocyOQYC09TYJh
 YYec0HGWUW1Y+TtX6bljzMHf3AQwUb/TBVPrEmnJQ7HgEfkFqaILea2bA5xPOcTD8XNYc2mJ3U2
 NlRAGodctmc3VJGGFg89hvprVnK2V8K+wbcEcMDvzy2khd2K7qDmy9Hz25W+N7Eih5dMuuNrykx
 vNM9aVdBIC2mXrYxJvnXmYLqmry6ludldU+qTsEsAUdNmXZ8u7oSc170Wq2f/X4mPIp/FMJxRoF
 Usiy3bPMYFCSIW16rov8cfZG+C/ZOn80IuPDnSCBvTQJ7vlJEaZBJfRuUgzhGm+SUsot5PDkIu4
 HyfUtvsfHm2IBlIN7D/mCGPxN+qAIjK8uXUxyueZxjYL1ZdhPlbyLeGedGrRqa01iDb2DSDwHFE
 cnNnOb4joQhZf7IZJulVJzKBzNbvJcfFwUiK3PTTxfqkqZuyOj1xzN76VEQBihZL5RuhWX5istN
 OHxs4lpNOKzzorppnf2jcpD4jtlwZ/SgNfZFrPPQXJCeDmoP945pORkSzuEYT3aftloxl4y7zqM
 oWlQTo0jakzttgg==
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
Bartosz Golaszewski (16):
      build: set PACKAGE_URL
      bindings: cxx: doc: remove the gpiod_cxx doxygen group
      bindings: python: doc: update the docstring for gpiod.request_lines()
      bindings: python: doc: make code examples appear as such in sphinx
      bindings: python: doc: describe undocumented members
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
 Makefile.am                                 |  22 +-
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
 bindings/python/gpiod/line_settings.py      |   8 +
 configure.ac                                |  33 ++-
 dbus/client/gpiocli.c                       |   2 +-
 dbus/lib/io.gpiod1.xml                      |  98 +++----
 dbus/manager/gpio-manager.c                 |   9 +
 docs/.gitignore                             |  19 ++
 docs/Doxyfile                               |  12 +
 docs/Makefile.am                            |  61 +++++
 docs/bindings.rst                           |  43 ++++
 docs/building.rst                           |  74 ++++++
 docs/conf.py                                | 146 +++++++++++
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
 docs/python_line_request.rst                |  12 +
 docs/python_line_settings.rst               |  12 +
 docs/python_misc.rst                        |  13 +
 docs/requirements.txt                       |   5 +
 docs/testing.rst                            |  46 ++++
 include/gpiod.h                             |  36 ---
 man/Makefile.am                             |  72 +++++-
 sphinx/conf.py                              |  68 -----
 sphinx/contents.rst                         |  24 --
 93 files changed, 1790 insertions(+), 855 deletions(-)
---
base-commit: 5486f1f0ffa419bcbb25288b0157c8e2ab643403
change-id: 20241216-improve-docs-19ed36687963

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


