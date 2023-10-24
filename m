Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3F4F7D5203
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Oct 2023 15:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234590AbjJXNjt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Oct 2023 09:39:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234666AbjJXNjj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Oct 2023 09:39:39 -0400
Received: from mail-wm1-x365.google.com (mail-wm1-x365.google.com [IPv6:2a00:1450:4864:20::365])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 868A7199F
        for <linux-gpio@vger.kernel.org>; Tue, 24 Oct 2023 06:39:21 -0700 (PDT)
Received: by mail-wm1-x365.google.com with SMTP id 5b1f17b1804b1-40853c639abso32308525e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Oct 2023 06:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1698154759; x=1698759559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WRzAxu45fANMWnsTWOxuK4u7G9r44ePQoDqpDHIRGoI=;
        b=LJVkGrJFbZJeOE2ke6glZM9Hi2A6e4PVRFCSramxp3h0ePc83mK1pqvO8s/hTQoogU
         j9+E6Tm0SHUVFalAAqQepdT55V08VixHOKXS/GOu1N4jfhY8xcLIv7h1+QhS16nsxmLY
         LEliaiyhX4cqiWFM8JCxT01thox8SuBeiwS/hCtYP7Sl58ikOJhI9ND19JDAiDhxJ58P
         WeYX6Ky03H2x3gdYFzM6wu+/fh+wDcMPW6ShObv8qHNRm0k2sgWM5+wS1OXIOP2yBKLC
         UoJ+PUhkb4tYF1+LZMiOwfirVrnVO9SPW6jbB09rcdiEFQMyIAf/icxHIOb0JiVGzlL6
         90ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698154759; x=1698759559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WRzAxu45fANMWnsTWOxuK4u7G9r44ePQoDqpDHIRGoI=;
        b=wwy+pFdsFpkmJkIvmk+2vmFh1+cVfa3yrmB6mMgVlbJN7wOHj4bCuRlmtOyiO0paIH
         Q4k7oZD4rd3Ts13vrZCR/CZc+chKAGDFF24NQnzG8PNWaYNmgd1Xkmm/7GKcAGKBUjlQ
         5LRyOleM5/M+pgHLQFgXYte1tuAk1IDUtyKUIQDZ2U3QZpcyoU6Ju4VjKMg64+4O5VbO
         2xLqQ2p10fGsZHWjExnaHRUWeppORL4F4ql1O9TMtyrVVVYakNDuUreSXMP8IObP30Nr
         Bmqr+4ltG0btlaF2eznMapmgjUxkoupKZfUQuCetXo4JfhHaX8GzDoBPw3Pp3YN0m74G
         pZAA==
X-Gm-Message-State: AOJu0Yzrz62tMxSvLKlS5iffywfrr4OBWTjtFuBQguRmqRCMl4du2Em0
        6FbTDlsZ3xlnV82gD7WRrhO0ikdgR2SxDw4bJMwFiZniy5w2kQ==
X-Google-Smtp-Source: AGHT+IEYpEwgSqjovOS7BjayV4HveL85OYtBAR6mCHwwiQxgW9zz13ec04VkuzbFVmfuNNZuoItq4TnWSKBE
X-Received: by 2002:a05:600c:468d:b0:409:ca6:d79d with SMTP id p13-20020a05600c468d00b004090ca6d79dmr1940850wmo.18.1698154759054;
        Tue, 24 Oct 2023 06:39:19 -0700 (PDT)
Received: from pop-os.. (cpc91242-cmbg18-2-0-cust972.5-4.cable.virginm.net. [82.8.131.205])
        by smtp-relay.gmail.com with ESMTPS id f10-20020a7bc8ca000000b003fed72eefdcsm1377283wml.21.2023.10.24.06.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 06:39:19 -0700 (PDT)
X-Relaying-Domain: gadgetoid.com
From:   Phil Howard <phil@gadgetoid.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, Phil Howard <phil@gadgetoid.com>
Subject: [libgpiod][PATCH v8 0/1] bindings: python: optionally include module in sdist
Date:   Tue, 24 Oct 2023 14:39:09 +0100
Message-Id: <20231024133910.738828-1-phil@gadgetoid.com>
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

If "LINK_SYSTEM_LIBGPIOD=1" is not specified and a valid "LIBGPIOD_VERSION"
is supplied then setup.py will first verify the requested version meets or
exceeds "GPIOD_MINIMUM_VERSION".

If this check passes it will fetch the requested, stable tarball from
mirrors.edge.kernel.org, verify the checksum, unpack the "lib" and
"include" directories and vendor them into the output sdist.

It will also drop a "libgpiod-version.txt" so that the sdist knows what
GPIOD_VERSION_STR to pass into the gpiod build, eg:

LIBGPIOD_VERSION="2.1.0" python3 -m build . --sdist

Will output dist/libgpiod-2.1.0.tar.gz vendoring libgpiod v2.1.0.

If "libgpiod-version.txt" exists and the version in "libgpiod-version.txt"
matches the requested LIBGPIOD_VERSION then lib and include are assumed to
already exist and the tarball fetch will be skipped. This prevents build
from trying to fetch the tarball twice when called with:

LIBGPIOD_VERSION="2.1.0" python3 -m build .

Runtime dependencies for fetching and vendoring a tarball are only imported
when an sdist or build_ext command is triggered with "LIBGPIOD_VERSION".

When a user builds or installs an sdist (via pip install or otherwise) if a
"libgpiod-version.txt" exists and "LINK_SYSTEM_LIBGPIOD=1" is not specified
in their environment then the gpiod._ext C Extension is amended to include
all of the vendored C sources for gpiod and the resulting module build will
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

Changes v7 -> v8
- Tweak sha256sums parsing for better clarity
- Add check for libgpiod-version.txt to prevent "build" trying to refetch
- Added a URL to metadata to stop setup.py complaining
- Change GPIOD_MINIMUM_VERSION to LIBGPIOD_MINIMUM_VERSION
- Change GPIOD_VERSION to LIBGPIOD_VERSION

Changes v6 -> v7
- Added GPIOD_MINIMUM_VERSION to catch builds against incompatible libgpiod
- Set GPIOD_MINIMUM_VERSION to 2.1.0
- New requirement "packaging" added to pyproject.toml

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

 bindings/python/MANIFEST.in    |   5 +
 bindings/python/pyproject.toml |   2 +-
 bindings/python/setup.py       | 214 +++++++++++++++++++++++++++++++--
 3 files changed, 209 insertions(+), 12 deletions(-)

-- 
2.34.1

