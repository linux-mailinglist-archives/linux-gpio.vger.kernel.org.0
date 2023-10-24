Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA96F7D4D08
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Oct 2023 11:56:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234195AbjJXJ4S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Oct 2023 05:56:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234258AbjJXJ4Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Oct 2023 05:56:16 -0400
Received: from mail-lf1-x168.google.com (mail-lf1-x168.google.com [IPv6:2a00:1450:4864:20::168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7D1E83
        for <linux-gpio@vger.kernel.org>; Tue, 24 Oct 2023 02:56:13 -0700 (PDT)
Received: by mail-lf1-x168.google.com with SMTP id 2adb3069b0e04-507c1936fd5so5992179e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Oct 2023 02:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1698141372; x=1698746172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sERZc6BuURBnjr6rrRIZvNq/9fpr4Vjxq/sz0hGYYiY=;
        b=MLPJrgN6IAES6T24hOjQMBFhejyN7Dhn5M2fkzphqBLC4rFearB/oDZJ9pwIKcazsA
         GUkvTtZrs119VrDVH+BSYAf/HfoErG0G+/LvU4nEIBbxdFq8TVw2GS2uz//XsVGSdM1n
         siJZu/PcDKjJftH7oCQw/YySiiUDidgUkqcg4Z+L7k6igjTlZMYjk7M6+8ya/pl5lDiC
         I/LLFyRNmefZzAkoPP11GU7fSp121KtoOH6K15YqK7cYzafNMyPgqu0+TSI4FCe5bYka
         80QTm7l8UqRUA9dcYaBREgnJDYhoIstMhEEURnXUiApHUpJIr82X+5E3nOImR+knmrWY
         LQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698141372; x=1698746172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sERZc6BuURBnjr6rrRIZvNq/9fpr4Vjxq/sz0hGYYiY=;
        b=fdAle4aC9ZcRNiERO7j9wSxN5G/GoaHHKaMoZhks+FMaPoueTq9vSaHubqbkkd2fLK
         PdwwLbUjxIFFYHmkVJ0imlM5t06tqO9P+ZPgclrC4SO7FjSnB2sepu6NR0z1grkCkHNV
         jIMjLAPIGB+/zOEl5/LkMgE4Vbbk5yJhzxq6QbHPI8jaYOCH085FRrisYjk+SradYRfn
         2ck3ZJCk401ewkKSJjULrnO7nAmgYISWroLkk5K8eCohkHjGdKvL+1loQHJTwPq7CZCU
         0JYF6RGmhIqsipbehoUPBFwTAYmF+3W/fAwVKbr2WD5dKDareXzgcC2R8uolFmabBqab
         Z1/Q==
X-Gm-Message-State: AOJu0Yx3/JhuopZk7J7a+ikBxwNBhcS3r6C5Mye472ci7aOVafsCp0tE
        Yp1mzIhywxtAMWk3zWEbSSCSc16qtCqGkPH/b0nwJ4DwTMqD/g==
X-Google-Smtp-Source: AGHT+IEcXUFTBeq5frj09p96KALDgnuPayAGidep+3O1iqPPTC49MT84WINg43paoEeV+lAETLhbTGHGZAD1
X-Received: by 2002:a05:6512:230c:b0:4fd:daa0:aed8 with SMTP id o12-20020a056512230c00b004fddaa0aed8mr5601818lfu.4.1698141371436;
        Tue, 24 Oct 2023 02:56:11 -0700 (PDT)
Received: from pop-os.. (cpc91242-cmbg18-2-0-cust972.5-4.cable.virginm.net. [82.8.131.205])
        by smtp-relay.gmail.com with ESMTPS id d1-20020a0565123d0100b00507b8d9c7f2sm928844lfv.91.2023.10.24.02.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 02:56:11 -0700 (PDT)
X-Relaying-Domain: gadgetoid.com
From:   Phil Howard <phil@gadgetoid.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, Phil Howard <phil@gadgetoid.com>
Subject: [libgpiod][PATCH v7 0/1] bindings: python: optionally include module in sdist
Date:   Tue, 24 Oct 2023 10:56:04 +0100
Message-Id: <20231024095605.713554-1-phil@gadgetoid.com>
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
supplied then setup.py will first verify the requested version meets or
exceeds "GPIOD_MINIMUM_VERSION".

If this check passes it will fetch the requested, stable tarball from
mirrors.edge.kernel.org, verify the checksum, unpack the "lib" and
"include" directories and vendor them into the output sdist.

It will also drop a "gpiod-version.txt" so that the sdist knows what
GPIOD_VERSION_STR to pass into the gpiod build, eg:

GPIOD_VERSION="2.1.0" python3 -m build . --sdist

Will output dist/libgpiod-2.1.0.tar.gz vendoring libgpiod v2.1.0.

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
 bindings/python/setup.py       | 196 +++++++++++++++++++++++++++++++--
 3 files changed, 191 insertions(+), 12 deletions(-)

-- 
2.34.1

