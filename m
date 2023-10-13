Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6E5C7C8461
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Oct 2023 13:28:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbjJML2T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Oct 2023 07:28:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbjJML2S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Oct 2023 07:28:18 -0400
Received: from mail-ej1-x663.google.com (mail-ej1-x663.google.com [IPv6:2a00:1450:4864:20::663])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51894B7
        for <linux-gpio@vger.kernel.org>; Fri, 13 Oct 2023 04:28:16 -0700 (PDT)
Received: by mail-ej1-x663.google.com with SMTP id a640c23a62f3a-9a645e54806so311169866b.0
        for <linux-gpio@vger.kernel.org>; Fri, 13 Oct 2023 04:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1697196495; x=1697801295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5TO4+wijS4RqCYTQ16l83yQXRz2YdZNF9ARQ28XJhxA=;
        b=bKkQupQS2zNaR4AgS/BcVWEnq51Q6lYeK9VjPfjhbforYSbh4lOELafG5MpsVldAnX
         h9MzAQkgEc492LcQWrVgHR2R+tAwI9y+B2v0Op4KV0xGrSnN2Gm2Msram3lz1Rn7YVaZ
         cbvp2gBc0iPAgnNOmH2bu5IkriZotbGEcdaGiSynNlqG2BnubMlum4m42NoO5/kY+C2D
         Fx8srNciAOhH/VRJfgLhCUD/Gzs6NOS2b0eTCm05tOm/2SNZZUbAu1C8po5xfYLTuwG/
         B44wbOf8JKMoPXM4Ve8T4MPDftW4SaOG1JnvPu1V5r9DaxsP0bYVjLcUtv9IyhxBtQXU
         PbKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697196495; x=1697801295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5TO4+wijS4RqCYTQ16l83yQXRz2YdZNF9ARQ28XJhxA=;
        b=UHGPjW1tfRqlS/z+UF9kuPvcCJvEAgmEzqK9zoJ+YH0xzAuz7HRRLoQdZmnwMrtDd5
         j4Bm4IyvXrh65TmaWw5kx9VZd8WuYippJkAgdU1FB4MPSyzTFp3DWnK8NM/oVHlndMap
         BZjKIsK97Gt4ftByBV/k9oSYxPHhwziXyQ7FhT+1g7COIGeq8lLRlUy19+6jygMJtJfK
         XQuogtO5aaP6EYUg+18oJmZCZXxmoCxc2KB2ha2JpsKbwFeKGpa0Z5lVWAWG7qXP8DHZ
         d0LGbUXWRsCiUCkvo60lq2od6pcy25rgtlKiobNAPvM91fiJUpHKsxFb8Idx2pjVxPF1
         Merg==
X-Gm-Message-State: AOJu0YyPgEx7ZyUBpODfvbuPUpUber85+6tr8WFUUAotUfLG4XU7pobo
        fyjS9ZN732wgLTkYXPxTm43Bs3I7SWq0Q70bgmC5GLDAraQoew==
X-Google-Smtp-Source: AGHT+IE/WhlA2Nduls8Y/aatud8WHCzyNH1F+adwd+dn+bU0e6Nivm+5FFDMRSGNtFhP0e3XNqKQjylLr/fS
X-Received: by 2002:a17:907:6c14:b0:9ae:5c99:f2e2 with SMTP id rl20-20020a1709076c1400b009ae5c99f2e2mr20637427ejc.43.1697196494317;
        Fri, 13 Oct 2023 04:28:14 -0700 (PDT)
Received: from pop-os.. (cpc91242-cmbg18-2-0-cust972.5-4.cable.virginm.net. [82.8.131.205])
        by smtp-relay.gmail.com with ESMTPS id o16-20020a17090611d000b009ae04f2db7fsm2270534eja.86.2023.10.13.04.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 04:28:14 -0700 (PDT)
X-Relaying-Domain: gadgetoid.com
From:   Phil Howard <phil@gadgetoid.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, Phil Howard <phil@gadgetoid.com>
Subject: [libgpiod][PATCH v3 0/1] bindings: python: optionally include module in sdist
Date:   Fri, 13 Oct 2023 12:28:11 +0100
Message-Id: <20231013112812.148021-1-phil@gadgetoid.com>
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

python/bindings/Makefile.am has been modified so that this variable is included
for the "build_ext --inplace" build, preserving the old, linked behaviour.

The gpiod sources are included by copying the "lib" and "include" directories
up to the parent module, and updating "MANIFEST.in" to include the source files
when an sdist is built. Additionally the gpiod version string is included in
"libgpiod-version-str.txt" so that it is available for source builds.

Additionally bindings/python/Makefile.am has been extended so that "make"
will now produce a .tar.gz source distribution in bindings/python/dist which is
suitable for uploading to pypi and can be built and installed by any user with
python3-dev installed.

[1] - https://www.piwheels.org/


Phil Howard (1):
  bindings: python: optionally include module in sdist

 bindings/python/MANIFEST.in |   5 ++
 bindings/python/Makefile.am |   5 ++
 bindings/python/setup.py    | 107 ++++++++++++++++++++++++++++++------
 3 files changed, 101 insertions(+), 16 deletions(-)

-- 
2.34.1

