Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 578407CE976
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Oct 2023 22:57:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbjJRU5j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Oct 2023 16:57:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbjJRU5i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Oct 2023 16:57:38 -0400
Received: from mail-lf1-x164.google.com (mail-lf1-x164.google.com [IPv6:2a00:1450:4864:20::164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 782F59B
        for <linux-gpio@vger.kernel.org>; Wed, 18 Oct 2023 13:57:35 -0700 (PDT)
Received: by mail-lf1-x164.google.com with SMTP id 2adb3069b0e04-507c91582fdso1431605e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 18 Oct 2023 13:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1697662653; x=1698267453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AuMYwd5Rd3ukjenqTnU55melqFhFNWSOwsYeFHOp5Wc=;
        b=eJTttBs+9pnu/3ZvX8gBKjVS0vxPkh5p6LCFWEb9oG9VI0xVIe2gje8xRfpNHssOun
         AFNbLe8oiy/uwuzAZGpWJdSKqS+xs4f0gfuCXO2cvFOwBP/NeZlxpj3m87fNncIEjEoW
         Mx67OOFPFS3PgYXyBNcFt2OIbHYdl8syo8e9maUDWzDnghAfT/mBjy+hAHyRYWzmPH5c
         GRz2clj4jKL3CCh91hsGKXznyp5m7Llaux4UMLbrhL//PFSV56PBKzVZ+h33OKH/7ZN+
         SXANy8znDyGYEM2jRx3dPXgqPr1ehiX78yC6th5lS3/JgJ6ZaU2MzKxhe58XBlSU/sEG
         T3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697662653; x=1698267453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AuMYwd5Rd3ukjenqTnU55melqFhFNWSOwsYeFHOp5Wc=;
        b=dljLYWH2acmD5KUx1FYyzMm+0hj1nTu/hDfDhvnmIo0UqwAwbGlIGRXgKiSqSQ2un7
         l5ki3QYV04z1FPmPtsgRoz6CNWy3w5eMh1zuNlyfKgk+bQjV8oQb2vsPtj0IMZxeP/JZ
         YzodOFxYFXot06G+cxCSRflLeeF2QKkWw8aoesZs45iU45IljjQ0RYudl2P97+WU/yOJ
         YH0mWF+wITcKKehKinY5wUYoz/5QjJqSSXbGjCmUDajScqwP0D6iRN+zYV2MoR6HmZKq
         Z1/4EuSnYmax32dqQ2V36pqOwY2jjgFrVaRLLmqblwP16PL/Q5iTZEAEkArUQv7rkZnK
         ZtJw==
X-Gm-Message-State: AOJu0Yyjt5FVswUJThAJaVPgje9s7K8J1IZXyPNAvDWF2pLKgxaVja25
        tm/FzlkB2wMKUUNQ0NuRx2pygSx7D8HMJT0zENYwCbuc3sNhrg==
X-Google-Smtp-Source: AGHT+IG4g3fRZxbndaozzL3HQvKP3tLa9iP/Cpv6EWdDrip8Mf2El6dLkZ1iqHJjcniffYskiuNYhEnBzpeF
X-Received: by 2002:ac2:4574:0:b0:507:a671:3230 with SMTP id k20-20020ac24574000000b00507a6713230mr109840lfm.16.1697662653198;
        Wed, 18 Oct 2023 13:57:33 -0700 (PDT)
Received: from pop-os.. (cpc91242-cmbg18-2-0-cust972.5-4.cable.virginm.net. [82.8.131.205])
        by smtp-relay.gmail.com with ESMTPS id j18-20020a056512399200b0050460f3dd0csm927117lfu.115.2023.10.18.13.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 13:57:33 -0700 (PDT)
X-Relaying-Domain: gadgetoid.com
From:   Phil Howard <phil@gadgetoid.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, Phil Howard <phil@gadgetoid.com>
Subject: [libgpiod][PATCH v5 0/1] bindings: python: optionally include module in sdist
Date:   Wed, 18 Oct 2023 21:57:27 +0100
Message-Id: <20231018205728.284068-1-phil@gadgetoid.com>
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
git.kernel.org, unpack the lib and include directories and vendor them into
the output sdist. It will also drop a "gpiod-version.txt" so that the sdist
knows what GPIOD_VERSION_STR to pass into the gpiod build, eg:

GPIOD_VERSION="2.0.2" python3 -m build . --sdist

Will output dist/libgpiod-2.0.1.tar.gz vendoring libgpiod v2.0.2.

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

 bindings/python/MANIFEST.in |   5 ++
 bindings/python/setup.py    | 131 +++++++++++++++++++++++++++++++++---
 2 files changed, 125 insertions(+), 11 deletions(-)

-- 
2.34.1

