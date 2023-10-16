Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EAF67CAD2E
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Oct 2023 17:19:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231891AbjJPPTD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Oct 2023 11:19:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232365AbjJPPTC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Oct 2023 11:19:02 -0400
Received: from mail-ed1-x564.google.com (mail-ed1-x564.google.com [IPv6:2a00:1450:4864:20::564])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B986FE1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Oct 2023 08:18:57 -0700 (PDT)
Received: by mail-ed1-x564.google.com with SMTP id 4fb4d7f45d1cf-53db360294fso8318818a12.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Oct 2023 08:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1697469536; x=1698074336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T6oYFK/6Wmv0NZR7M9rH7S12WEhk/kthTLyxaZH4cek=;
        b=kBAAW7vzg+MIZcOW+/h7n/wreYJBr90u4YZNm9kXEw78KClmzkL5h7dyJb4VZmwJfF
         brZ2EVZb6sKqtqiWuxwB+ZVtOrojBAgj75WC7d8CIdxPViPcsEH9aa3LEAlQUVZIcB4y
         NQR3SENlKY2UdG77SpjkzXlRGV/pHB0tn8Ey91KG44A05ZPBG1eYFDX/I3JNCVvArX/Y
         BvgGu8fvePQ9Nek/CymtaSli1ntALaBsDFcmKJ+mA6g5xlt8NJRGtLgg8evWtkWPTLGP
         RMta1z5qHvL7br5RMYo1DdgEsQf4ORooF+G+/xqL6nurnwwwZ2snaFMfhjXDzISH8hLL
         vDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697469536; x=1698074336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T6oYFK/6Wmv0NZR7M9rH7S12WEhk/kthTLyxaZH4cek=;
        b=ErndWyHXE2CF67CPHc0FkatzNYoLnKPcf+Z7+rYZVAq3P62E3NquPC5KlTXhATQa0F
         69TC5jJYi9iP+ocDDNcVU5VlmYSpwYIpFT3tCJht8WxA7laapdzW3ku5CwJT0Fzk3uaH
         v4vRkLfLjBOtY1eZwJZynFea3Oo+nOUeTvsk1WXDR6I9aBG+fTIalSyeCLcz9KLB29cw
         5oKZLmP4ukv/fqje90oxEYyS+/s0SR4l1lFfCMw2zcFQmj0GlLHQS/LpUhy7D4oP2s7G
         vaiMnpnKKnuC8IUt7yDY8+CtOZ+R06HzZEvyZt1n56kjpFMu5UlZMrYRBuVBA48TGM+g
         GZ5Q==
X-Gm-Message-State: AOJu0YxQxMZmhALqVwhk5VqqvCn2GggMygjPnVqe82/MBxHpWMG6mSxH
        LKITqf8Oxg3Z+NYyq+6hlgYbSrKEpy23tVc7cK01b1Htop5a5g==
X-Google-Smtp-Source: AGHT+IFWbCwTIsJ5gs4SDM4BoZlHxAzc3ouAdKSr8TSOcVItVv7Wlcq/O2k2uzs64ICIFCuhYPSDwwJ+M1/A
X-Received: by 2002:a17:907:d15:b0:9c1:bee1:b7eb with SMTP id gn21-20020a1709070d1500b009c1bee1b7ebmr4251662ejc.37.1697469535633;
        Mon, 16 Oct 2023 08:18:55 -0700 (PDT)
Received: from pop-os.. (cpc91242-cmbg18-2-0-cust972.5-4.cable.virginm.net. [82.8.131.205])
        by smtp-relay.gmail.com with ESMTPS id jp1-20020a170906f74100b00993b268eafdsm612951ejb.179.2023.10.16.08.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 08:18:55 -0700 (PDT)
X-Relaying-Domain: gadgetoid.com
From:   Phil Howard <phil@gadgetoid.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, Phil Howard <phil@gadgetoid.com>
Subject: [libgpiod][PATCH v4 0/1] bindings: python: optionally include module in sdist
Date:   Mon, 16 Oct 2023 16:18:47 +0100
Message-Id: <20231016151848.168209-1-phil@gadgetoid.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
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

If "LINK_SYSTEM_LIBGPIOD=1" is not specified and "GPIOD_VERSION_STR" is
supplied then the gpiod._ext C Extension is amended to include all of the C
sources for gpiod, so it can be built as a standalone module without
depending upon a shared distro library.

The gpiod sources are included by copying the "lib" and "include"
directories up to the parent module, and updating "MANIFEST.in" to include
the source files when an sdist is built. Additionally the gpiod version
string is included in "libgpiod-version-str.txt" so that it is available
for source builds.

bindings/python/Makefile.am has been extended so that "make" will now
produce a .tar.gz source distribution in bindings/python/dist which is
suitable for uploading to pypi and can be built and installed by any user
with python3-dev installed.

[1] - https://peps.python.org/pep-0668/
[2] - https://www.piwheels.org/

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
 bindings/python/Makefile.am |   3 +
 bindings/python/setup.py    | 122 +++++++++++++++++++++++++++++++-----
 3 files changed, 114 insertions(+), 16 deletions(-)

-- 
2.34.1

