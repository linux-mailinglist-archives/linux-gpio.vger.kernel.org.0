Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 169A67E5A78
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Nov 2023 16:52:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232108AbjKHPwK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Nov 2023 10:52:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232016AbjKHPwJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Nov 2023 10:52:09 -0500
Received: from mail-lf1-x164.google.com (mail-lf1-x164.google.com [IPv6:2a00:1450:4864:20::164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98A491BFF
        for <linux-gpio@vger.kernel.org>; Wed,  8 Nov 2023 07:52:07 -0800 (PST)
Received: by mail-lf1-x164.google.com with SMTP id 2adb3069b0e04-507cee17b00so9219012e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 08 Nov 2023 07:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1699458726; x=1700063526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=koCquLI0VNj/DMjqknLAZhWF9poQSxp4BoPI82MEkys=;
        b=TP0IL3YryWM9SO68wdoXJZ1Pgxw7KbRdC8Oaqv0WgLFHC5DazABjdcNAK4d7pX6P/z
         Oa0H3w//20ap749UDNg/ecdA9vctIvTUykIXf0sqr6uoZFeBP/0tNoiXFRxVqqm7CswK
         1SCuba/qAyotKFR2Qn0bJ0Ur3tPgND2isCzt4OA2ZwDxafmX0mZq7ig0bO7m/pDZdQ/K
         GLUOQf0l623+EheyfP30IQV5aKf5g/OWl47RMrh2r+y2TR3AU3R/C8YlLFkBjlBfCSVD
         MvvrDhZTBejs0MNr/V7MAeTa37dl0PzEckX47zKPyixMpgT8KyXhfKKhwzjWyHhWRDhx
         X4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699458726; x=1700063526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=koCquLI0VNj/DMjqknLAZhWF9poQSxp4BoPI82MEkys=;
        b=nLaMRQDS5KrXL8v1fgYL5YR9487/dhGezJmJT9gbi647ZogRKbEI8r8uOI8PO/G1Rn
         hV4C6e6REG4/9bYUE/yvRo+lamv22n8So+7cAuH6L53+5Vw3ILFsokdIxIDBeMiSayMC
         hu2jlTxFcUzHn6WI1kTGdPD4MB33SKhwyGaU+S6SgUjxUuJl6GPI4NlSnDCgImB4jOh8
         XJIjVNrSP477pMDpFqFZioxcY1kmUW61VRredxVuuMuPBfK1O27miSguNHMDsy2LI3Eu
         sQFtZMaaJ+Pczew7VMOcXVDviUowwOsBTVzaZZhCrvELSiWwzM4gdIf5ughZD6KoDUfH
         9H1w==
X-Gm-Message-State: AOJu0Yy0Z/0WbMUCiGi7mByHzji1AHFzYFm+g2NVgWo6NgTjm2gWcS5B
        lUSid0MGZKSz8yuFMjvrz6elMo0/Gb9H7lNvnNQSPAajaIn3mg==
X-Google-Smtp-Source: AGHT+IFgifYIazgTAdkgl+r/PCuDirZQ7zoSanV1hiI7jK9ncvBOKVs/1fmwFQQCxaWP7yvXWR7RzBfkCSNK
X-Received: by 2002:a05:6512:1052:b0:507:a620:6ba0 with SMTP id c18-20020a056512105200b00507a6206ba0mr2044695lfb.64.1699458725270;
        Wed, 08 Nov 2023 07:52:05 -0800 (PST)
Received: from pop-os.. (cpc91242-cmbg18-2-0-cust972.5-4.cable.virginm.net. [82.8.131.205])
        by smtp-relay.gmail.com with ESMTPS id f19-20020a05651232d300b005094a2523b3sm1052844lfg.29.2023.11.08.07.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 07:52:05 -0800 (PST)
X-Relaying-Domain: gadgetoid.com
From:   Phil Howard <phil@gadgetoid.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, Phil Howard <phil@gadgetoid.com>
Subject: [libgpiod][PATCH v2 0/1] bindings: python: standalone build tooling for tests
Date:   Wed,  8 Nov 2023 15:51:59 +0000
Message-Id: <20231108155200.3050417-1-phil@gadgetoid.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

After much delibration about how in-place test builds should work, I have
pulled out all of the test extension code from setup.py into a new
build_tests.py and updated Makefile.am to invoke it.

This replaces the old `python3 setup.py build_ext --inplace` with enough
setuptools tooling to replicate that behaviour, while also putting it
in a better place to avoid problems arising from the deprecation of direct
setup.py invocation [1].

Since receipients of the gpiod Python bindings (in tar.gz source or .whl 
binary format) won't need the test C extensions (and can't run them anyway
without the accompanying Python modules) the test extension code has been
removed from setup.py rather than duplicated into this new file.

The new build_tests.py creates a temporary directory and redirects all
build-time output into it. A final step - handled by build_ext and internal
to setuptools - then moves the built _ext.<python_version>-<arch>-<os>.so C
extensions into gpiod, tests/gpiosim and tests/procname where they can be
imported.

Since release packages and tests no longer share the build/ directory I
have removed the "rmtree" hack from the "build_ext" override in setup.py.
There should be no cases where test extensions can accidentally end up
being installed into the system/user Python environment.

To build and run tests:
- `make python-tests`
- `(sudo) make python-tests-run` (I need root for the gpiosim module)

Tested with setuptools==68.2.2 (Sep 2023), setuptools==59.8.0 (Dec 2021)
and setuptools==42.0.2 (Dec 2019).

Changes v1 -> v2:
- Add the gpiod ext module to build_tests.py (using glob for sources)
- Formalize the command for running tests by adding it to Makefile.am
- Add build_tests.py output artefacts to Makefile.am's clean-local target
- Sort distutils.log imports (DEBUG before set_verbosity)

Phil Howard (1):
  bindings: python: standalone build tooling for tests

 bindings/python/Makefile.am    | 33 +++++++++---
 bindings/python/build_tests.py | 95 ++++++++++++++++++++++++++++++++++
 bindings/python/setup.py       | 28 +---------
 3 files changed, 121 insertions(+), 35 deletions(-)
 create mode 100644 bindings/python/build_tests.py

-- 
2.34.1

