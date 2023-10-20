Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E99DE7D11EC
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Oct 2023 16:57:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377529AbjJTO5Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Oct 2023 10:57:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377583AbjJTO5P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Oct 2023 10:57:15 -0400
Received: from mail-wm1-x368.google.com (mail-wm1-x368.google.com [IPv6:2a00:1450:4864:20::368])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 726A7D5D
        for <linux-gpio@vger.kernel.org>; Fri, 20 Oct 2023 07:57:12 -0700 (PDT)
Received: by mail-wm1-x368.google.com with SMTP id 5b1f17b1804b1-40837ebba42so7064475e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 20 Oct 2023 07:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1697813831; x=1698418631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e4jpgd4fiK+omZ1mfOWoNA4Ue0FwXwpMPlKCiyWl77o=;
        b=Chm4seTEQ+z0NS7zc58UGnIBO0RQmR2PgeR58PbTpFw1VkeBhr2QshQrl+FnWf7xxk
         IzWmFQx6Yc51FbHjpLaz8RTbu6gZ6MyqymiF/4ii74y+o/L81Vfx0fO6oarBOTv9yeX+
         aMld+zdlMDIdzNGoLNf3CR3IpC8/5XEz2x8P0hl6zPactvX2WZtexcOy3VuMDkUKSppG
         r4Gl2wdqXQSfN8I1BQYrOB+y9M9yj7wxtstQFXpxNWkNHmWMCzKaH+mDC6JcIsv0beYW
         q18O4mXTk85pgiCgl7cQ05LRT0gYPX5+OGXBxd/CQqh2qZoEAf1RN3ARhDwITm+5La1p
         F4rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697813831; x=1698418631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e4jpgd4fiK+omZ1mfOWoNA4Ue0FwXwpMPlKCiyWl77o=;
        b=kEspf2nCYQPnjZyXh6Qvgxn7WKU9+Cqi3YjcqrT226k+A0EEv0IvYLLvgyg2v9yybD
         qMudSx2Oj8cPzMll+CTn8ABatA79/nhb1tML8PbhOIGE10e5K/6p7fBv7a7R5coXB3TI
         C7eqe5ITCervbvueXd95WZ0+Jzf9hmdRlBW98/ElVGNqy1lOM2fyRETZJyXBMudC6Hic
         4ofHk0N7UdeDS2Us2WvDXf8RgINkdUFhu4eylNKewERRy/W3uCtDwR5INhpFaxfVKKCB
         72wX4WTwV0Yh0Kk+CsNu9XK6sX2O8+vtXOk04yAK5KQ73IHQzRVY/OdBwNV0xRqTO4X6
         ntSg==
X-Gm-Message-State: AOJu0YxOIFgxmtuiuwolKxQ4YSxj0epj09f2NgvH+RKuGi+W0gFKh/Cw
        CuIqmmt6zQuVz9IrP578UAJye97vPVm/nKXMdxJtoMEbgdTNNQ==
X-Google-Smtp-Source: AGHT+IEeROigF/bdfjYXYLXb22Et/SBvKrCh0CXy/GxylPCwzQGdYpfBoagkkpD3BHlaSN2EWqRjs0iRXUvc
X-Received: by 2002:a05:600c:4f91:b0:3f6:58ad:ed85 with SMTP id n17-20020a05600c4f9100b003f658aded85mr1885176wmq.10.1697813830521;
        Fri, 20 Oct 2023 07:57:10 -0700 (PDT)
Received: from pop-os.. (cpc91242-cmbg18-2-0-cust972.5-4.cable.virginm.net. [82.8.131.205])
        by smtp-relay.gmail.com with ESMTPS id o17-20020a05600c379100b004064e303457sm1065299wmr.45.2023.10.20.07.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 07:57:10 -0700 (PDT)
X-Relaying-Domain: gadgetoid.com
From:   Phil Howard <phil@gadgetoid.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, Phil Howard <phil@gadgetoid.com>
Subject: [libgpiod][PATCH v6 0/1] bindings: python: optionally include module in sdist
Date:   Fri, 20 Oct 2023 15:57:03 +0100
Message-Id: <20231020145704.413229-1-phil@gadgetoid.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This changeset vendors the gpiod library into the Python package.

Why?

So that setup.py can produce an sdist that is installable irrespective of
the availability or version of a distro-supplied libgpiod.

This prevents a libgpiod pypi package install balking because the distro
libgpiod is outdated or otherwise incompatible. This happens when
attempting to install the current libgpiod from pypi onto - for example -
the Debian Bookworm based Raspberry Pi OS or Ubuntu 23.10 Mantic which both
ship with libgpiod v1.6.3.

The availability of a distro agnostic package also ensures that libgpiod
can be installed via pypi into an isolated virtual environment, safely
specified as a dependency for Python packages and allows Python developers
to target the newest API version irrespective of their distro supplied
libgpiod.

This is essential, since a venv is now widely *required* for user Python
projects due to recommendations in pep-688 [1]

For Raspberry Pi this sdist can also be converted into a precompiled wheel
by piwheels [2] which is, by default, added to Raspberry Pi OS as a pip
index.

How?

If "LINK_SYSTEM_LIBGPIOD=1" is not specified and a valid "GPIOD_VERSION" is
supplied then setup.py will fetch the requested, stable tarball from
mirrors.edge.kernel.org, unpack the lib and include directories and vendor
them into the output sdist. It will also drop a "gpiod-version.txt" so that
the sdist knows what GPIOD_VERSION_STR to pass into the gpiod build, eg:

GPIOD_VERSION="2.0.2" python3 -m build . --sdist

Will output dist/libgpiod-2.0.1.tar.gz vendoring libgpiod v2.0.2.

Runtime dependencies for fetching and vendoring a tarball are only imported
when an sdist or build_ext command is triggered with "GPIOD_VERSION".

When a user builds or installs an sdist (via pip install or otherwise) if a
"gpiod-version.txt" exists and "LINK_SYSTEM_LIBGPIOD=1" is not specified in
their environment then the gpiod._ext C Extension is amended to include all
of the vendored C sources for gpiod and the resulting module build will
function independently of the system libgpiod.

Fetching libgpiod tarballs is an effort to reconsile the fact that both
libgpiod and the Python bindings live in the same source tree but are
versioned independently of each other. Bugfixes and changes to Python
bindings should not vendor unstable, development versions of libgpiod.

No effort has been made to allow an unstable, vendored build since it's
assumed developers will build and install libgpiod and use
"LINK_SYSTEM_LIBGPIOD".

While the output sdist will - by default - build a standalone gpiod module
it's possible for the end user to supply the "LINK_SYSTEM_LIBGPIOD=1" env
variable to override this behaviour and attempt to link their system
libgpiod (this will fail if it's incompatible with the bindings) eg:

LINK_SYSTEM_LIBPGIOD=1 pip install libgpiod

[1] - https://peps.python.org/pep-0668/
[2] - https://www.piwheels.org/

Changes v5 -> v6
- Change SRC_BASE_URL to mirrors.edge.kernel.org
- Fetch sha256sums.asc and verify tarball signature
- Moved tarfile and urllib imports to fetch_tarball for fewer runtime deps
- Download and extract into a temporary directory
- Changed print to log.info
- Changed print/return errors to raise BaseError
- Check for lib/include in build tree and bail early

Changes v4 -> v5
- Move logic from main program flow to build_ext and sdist overloads
- GPIOD_VERSION_STR is now GPIOD_VERSION
- Fetch sources from a libgpiod tarball if GPIOD_VERSION is supplied
- Removed changes to bindings/python/Makefile.am
- Moved and rephrased comment about build_ext rmtree("tests")

Changes v3 -> v4
- Check for lack of "GPIOD_VERSION_STR" and revert to original behaviour
- Add status messages to setup.py, hinting at the package build mode

Changes v2 -> v3
- Pass in correct "GPIOD_VERSION_STR" from build
- Output an sdist build for pypi

Changes v1 -> v2
- Switch from symlinks to explicit file copy

Phil Howard (1):
  bindings: python: optionally include module in sdist

 bindings/python/MANIFEST.in |   5 +
 bindings/python/setup.py    | 190 +++++++++++++++++++++++++++++++++---
 2 files changed, 184 insertions(+), 11 deletions(-)

-- 
2.34.1

