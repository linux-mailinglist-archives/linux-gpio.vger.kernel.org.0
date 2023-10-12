Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53A017C784E
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 23:02:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347407AbjJLVC4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Oct 2023 17:02:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344156AbjJLVCz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Oct 2023 17:02:55 -0400
Received: from mail-wm1-x363.google.com (mail-wm1-x363.google.com [IPv6:2a00:1450:4864:20::363])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8BE09D
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 14:02:50 -0700 (PDT)
Received: by mail-wm1-x363.google.com with SMTP id 5b1f17b1804b1-40535597f01so14945345e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 14:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1697144569; x=1697749369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0ep6OOghLF5+vq6Lh1txic8qzGOAwoRiWUkW50QZcCg=;
        b=IBgvfd58rn2GsVPPRvp/aroUa5DeuxQAM85eo5hKBYXktwpdkDYnraU7MVaw7FxEx6
         8Ms3vWgGTXIwoBk9A2ZK3KjCijqWDSNt+l3Culie4sSglMBSG0UWxz2SzLmMGDC0q+3L
         ghPtvLKqN4Relf1Rw+UUaxziE1ipU25PvTFvwZy6sGOlSEXbw9cApqBpsi8Tfdj7A/O3
         GZbN8i3krK9+Keii/hwChHbsLaE8MINjn7U9YyTxdoXpLCA5QoobRNU+NcKi7Wy8hG82
         WCP54ppkUAqdBv87Y/tXfPTWHdx1Z5ymWjnQh8u/pSHj945SDXzJv/IxHAfc+eaNUSNf
         MegA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697144569; x=1697749369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ep6OOghLF5+vq6Lh1txic8qzGOAwoRiWUkW50QZcCg=;
        b=eSwFPLrSdAV6jzqLqMtRF4YpDfppDIOy4z/W551NruSzo3IIZC2HhyhcBJNsCR6R4v
         I1zNHWKAbjDqdqWrpdyMCqk/dspOjt7A3bi2Wg23hrvvz7dtNvAQBRfxUugN5k9tnPDM
         MKtT1T1VA7CwdhhvbVz+37d5fGZfadCdw+wklgchs1i+T2XGNEAUfOgPzK4jJa97r7bx
         6bqwmsz/AvVwRskYuFmrgkMwgZHtzx9oUBwR2Op/TEZva+NF1pUrLFiOsp5hct8apbRU
         YhyGHbmuquF0f4CM92lYZN65I+fjhFtRTbDrxGYYrkymRfWiLtpAItlroqgsQYIG9uW4
         b4WA==
X-Gm-Message-State: AOJu0Ywk44jrZYFjvIUJXB3yQD5H+UDl35B33q7LGdoL3+KOYrkTkdlu
        7srXzxwDCVqOoTv4ImVokDbYbJfYqWJ0RzPtGgMCwFq4KNx87w==
X-Google-Smtp-Source: AGHT+IGzxZ6pgtfqUUM55W1NTnwKRTlsZYGUUf4RuxMsJD5h1BI5Qbm5agSRJwPSGn+undl+sU1C8JXOO8yt
X-Received: by 2002:a05:600c:3b18:b0:407:536d:47ae with SMTP id m24-20020a05600c3b1800b00407536d47aemr8434724wms.38.1697144568997;
        Thu, 12 Oct 2023 14:02:48 -0700 (PDT)
Received: from pop-os.. (cpc91242-cmbg18-2-0-cust972.5-4.cable.virginm.net. [82.8.131.205])
        by smtp-relay.gmail.com with ESMTPS id k13-20020a05600c0b4d00b004073d6c3626sm103194wmr.28.2023.10.12.14.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 14:02:48 -0700 (PDT)
X-Relaying-Domain: gadgetoid.com
From:   Phil Howard <phil@gadgetoid.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, Phil Howard <phil@gadgetoid.com>
Subject: [libgpiod][PATCH v2 0/2] bindings: python: optionally include (...)
Date:   Thu, 12 Oct 2023 22:02:26 +0100
Message-Id: <20231012210228.101513-1-phil@gadgetoid.com>
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

This changeset vendors the gpiod library into the Python package, and adds
a pyproject.toml for minimum compatibility with modern Python packaging.

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

If "LINK_SYSTEM_LIBGPIOD=1" is not specified then the gpiod._ext C Extension is
amended to include all of the C sources for gpiod, so it can be built as a
standalone module without depending upon a shared distro library.

The gpiod sources are included by copying the lib and include directories up
to the parent module, and updating MANIFEST.in to include the source files when
an sdist is built.

The resulting source distribution can then be uploaded to pypi and from there
can be built and installed by any user with python3-dev installed.

[1] - https://www.piwheels.org/

Phil Howard (2):
  bindings: python: optionally include module in sdist
  bindings: python: add pyproject.toml, pep 518

 bindings/python/MANIFEST.in    |  4 ++
 bindings/python/pyproject.toml |  5 ++
 bindings/python/setup.py       | 95 ++++++++++++++++++++++++++++------
 3 files changed, 89 insertions(+), 15 deletions(-)
 create mode 100644 bindings/python/pyproject.toml

-- 
2.34.1

