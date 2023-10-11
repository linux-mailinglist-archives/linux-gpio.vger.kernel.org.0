Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 627037C535E
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 14:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234965AbjJKMO5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 08:14:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346766AbjJKMOw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 08:14:52 -0400
Received: from mail-ej1-x663.google.com (mail-ej1-x663.google.com [IPv6:2a00:1450:4864:20::663])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 431F84680
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:13:14 -0700 (PDT)
Received: by mail-ej1-x663.google.com with SMTP id a640c23a62f3a-9ba1eb73c27so570444766b.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1697026387; x=1697631187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oBLSpnP4pezIVkg9EJCeIx23vaelyx7sqoVr/G0cVug=;
        b=ffft9HqA8vOSni9dpDp1gHTMLVi9d7su331gEYucIF9rUxRV8ss7dXsFSLh3FGMSAz
         bXd1Nk7OvuS9AxEwkaOf2ow9S/jx11aik2012qoOLdEWP0JdzqRocRALTbWdZcDb9AyY
         VyqXgTJB0VUO7zNoi/wAl8wb0m1iircLYmwlt23Li5iel8xQeUexD027YJj7gkKlXClL
         Rv0LpJfQbO5VY0HVXfJ4w5uS8cyofrg9xk9HrbJF4uQ5My0sReoBEtNOnSZjPBlT8pkV
         meeSY/x75uOyCojzNGgXdOrbVSznEOQ3cnrd7yklNiuOPdAs1Y7pTXyv68Gn8GxBzQ73
         2RiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697026387; x=1697631187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oBLSpnP4pezIVkg9EJCeIx23vaelyx7sqoVr/G0cVug=;
        b=uNdHOBgG8q7KJeX2X+j8YeULC8Ta8vcs6TjVtxhmJfJFW9i232LxqieZACvUtZ+4Mq
         nHtxu5KA+8EXSd4U0qSgTSBz6GsYnER48ZBlJ6VuLAYdYJnzHPnS9N+EUissq0haO5GP
         BxbUjjndJtlzAJrVaftZs+/zqKIEyYk6w7V2QCpiu2XKicgdiYEfmkKjCilHp+ldaeMO
         /7adhaVI8DTd/CTA7uwf7N7w+UAIRTIDfsidcYS/28Dc6SjiMJ64MqiLkoaGMKHr5G+F
         Se2H9Zs5GadVzyFbteM7d8kdsxmQwiwg9C8oNbo9B3+qQ1YDWPGpW3g1GTNUcTMaji20
         267w==
X-Gm-Message-State: AOJu0YwpLghowwVXdxsmuaGc91967eUvrlPz2xj9OlULuOl2M/TLR1kx
        QpUHkmNtXNaTFVAgnYiYGPePufT9vNmSegMvj/Kpn4UOxdDDNQ==
X-Google-Smtp-Source: AGHT+IEbb8iuIrOOk3oY1F/D6d6CvxusPNxuNsMjuvVt4aNKi0Xba14QJBIlo/DxcBo88ALW/sjfTv9gvyg/
X-Received: by 2002:a17:906:257:b0:9b8:8bcf:8739 with SMTP id 23-20020a170906025700b009b88bcf8739mr17741005ejl.75.1697026387010;
        Wed, 11 Oct 2023 05:13:07 -0700 (PDT)
Received: from pop-os.. (cpc91242-cmbg18-2-0-cust972.5-4.cable.virginm.net. [82.8.131.205])
        by smtp-relay.gmail.com with ESMTPS id x6-20020a170906134600b009b9720a85dcsm1582049ejb.44.2023.10.11.05.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 05:13:06 -0700 (PDT)
X-Relaying-Domain: gadgetoid.com
From:   Phil Howard <phil@gadgetoid.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, Phil Howard <phil@gadgetoid.com>
Subject: [libgpiod][PATCH 0/3] bindings: python: optionally include module (...)
Date:   Wed, 11 Oct 2023 13:12:43 +0100
Message-Id: <20231011121246.9467-1-phil@gadgetoid.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This changeset vendors the gpiod library into the Python package, adds
a pyproject.toml for minimum compatibility with modern Python packaging
standards and sets "python_requires" to 3.9, reflecting the minimum version
required by these bindings as established in commit <b436d05809b1> ("bindings: 
python: replace PyModule_AddObjectRef() with PyModule_AddObject()").

Why?

So that setup.py can produce an sdist that is installable irrespective of the
availability or version of a distro-supplied libgpiod.

This prevents a libgpiod pypi package install balking because the distro
libgpiod is outdated or otherwise incompatible. This happens when attempting to
install the current libgpiod from pypi onto - for example - the Debian Bookworm
based Raspberry Pi OS.

The availability of a distro agnostic package also ensures that libgpiod can be
installed via pypi into an isolated virtual environment, safely specified as a
dependency for Python packages and allows Python developers to target the newest
API version irrespective of their distro supplied libgpiod.

This is essential, since a venv is now widely *required* for user Python
projects due to recommendations in pep-688 - https://peps.python.org/pep-0668/

For Raspberry Pi this sdist can also be converted into a precompiled wheel by
piwheels [1] which is, by default, added to Raspberry Pi OS as a pip index.

How?

If "USE_SYSTEM_GPIOD=1" is not specified then the gpiod._ext C Extension is
amended to include all of the C sources for gpiod, so it can be built as a
standalone module without depending upon a shared distro library.

The gpiod sources are included by symlinking the lib and include directories up
to the parent module, and updating MANIFEST.in to include the source files when
an sdist is built.

The resulting source distribution can then be uploaded to pypi and from there
can be built and installed by any user with python3-dev installed.

[1] - https://www.piwheels.org/

Phil Howard (3):
  bindings: python: optionally include module in sdist
  bindings: python: add pyproject.toml, pep 518
  bindings: python: require python 3.9.0

 bindings/python/MANIFEST.in    |  4 +++
 bindings/python/include        |  1 +
 bindings/python/lib            |  1 +
 bindings/python/pyproject.toml |  2 ++
 bindings/python/setup.py       | 58 ++++++++++++++++++++++++++--------
 5 files changed, 53 insertions(+), 13 deletions(-)
 create mode 120000 bindings/python/include
 create mode 120000 bindings/python/lib
 create mode 100644 bindings/python/pyproject.toml

-- 
2.34.1

