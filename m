Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8F217E4B28
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Nov 2023 22:52:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234390AbjKGVwH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Nov 2023 16:52:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233982AbjKGVwG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Nov 2023 16:52:06 -0500
Received: from mail-ej1-x664.google.com (mail-ej1-x664.google.com [IPv6:2a00:1450:4864:20::664])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BF2010D0
        for <linux-gpio@vger.kernel.org>; Tue,  7 Nov 2023 13:52:04 -0800 (PST)
Received: by mail-ej1-x664.google.com with SMTP id a640c23a62f3a-9df8d0c556eso450033966b.2
        for <linux-gpio@vger.kernel.org>; Tue, 07 Nov 2023 13:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1699393923; x=1699998723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D1J1qgQB+vTozgENNtmnx+QfNmAbqxv8197lmLQgbhU=;
        b=kPAfOBw99ecjgsWxvK3rThClk1FPEfAUt+Lg6daoisyIXEuAwpjrKRypjgTj/y0Qhj
         GjMYHyZwl6Du8LuKTQ68iPOTtd5V+P8BTGthTqs/fLKpIJ/1xFCizh/JUWvlUei8/rsI
         HWWALukZxbm+yMMRdyARwUJNP7M4FzGtIUEn6Vqkl2Uv97LG1YZ2O12VSy7Bbk78qnV4
         ypQna7mm0ijoFH4ZqqmPdWC0Spyba8d6LnpGkX0lHpxX6ORp0oiaGDdbJyP53DHpHGYC
         Nst4Xnk0UocY0PwLoeqlmtIAUIDdtZp02m4JyaZroT2iEzu436ywZMRRV2rO6vkbfSlR
         P9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699393923; x=1699998723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D1J1qgQB+vTozgENNtmnx+QfNmAbqxv8197lmLQgbhU=;
        b=Q+j96LNvliVYqtu8w5hYJ21ihQQf84HWLLSgFmX26xSoTdCFob1j+vzmCgbiSBd/cB
         /Zoc5fhK4d4Yk6iDd++dedBI84IMQ5Gem4IUavdDbfYay54MbmGJ7tKgpV+0QGTGenSj
         XVF+eGp0TPERPjTF3BWVp1caoP/9rRtRMvL4QqJ4vbPxoehTNIpvFpiKYU2RjZ/TB2yh
         TL5AM67c0ppPmq0FoPcBhSJmkEOqbFT8amHyNkru+3fJUZWdMq7dEi6j6GDRj/cFEuyD
         jRMmLXCQou7Po3GH7NHrM5bs8hLE9YoByfCQ4P+UqEy7OjS7cLSCqzwLR+cxWq1Hv/7Q
         15tA==
X-Gm-Message-State: AOJu0YxGwKxdgEYtZlVBbrviqOOO82lZKOlqGXf3Y375P/cxXW5aRLXS
        8UA5Xdk6N/BPXbcKmqwI5nXj/6F6NT7sb4Id3nqOwzr0872+2Q==
X-Google-Smtp-Source: AGHT+IEglu6ZzCBl38M8pNY+vPyG7fCq45jmKDQWa4ms2oCye8sxoElDKlNgrj9zXYsD40YMGuRPzsljPIWX
X-Received: by 2002:a17:907:72d6:b0:9bf:3be2:cc7a with SMTP id du22-20020a17090772d600b009bf3be2cc7amr18774248ejc.60.1699393922461;
        Tue, 07 Nov 2023 13:52:02 -0800 (PST)
Received: from pop-os.. (cpc91242-cmbg18-2-0-cust972.5-4.cable.virginm.net. [82.8.131.205])
        by smtp-relay.gmail.com with ESMTPS id j9-20020a170906050900b009a5f5d570b9sm77259eja.206.2023.11.07.13.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 13:52:02 -0800 (PST)
X-Relaying-Domain: gadgetoid.com
From:   Phil Howard <phil@gadgetoid.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, Phil Howard <phil@gadgetoid.com>
Subject: [libgpiod][PATCH 0/1] bindings: python: standalone build tooling for tests
Date:   Tue,  7 Nov 2023 21:51:55 +0000
Message-Id: <20231107215156.2961942-1-phil@gadgetoid.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

After much delibration about how in-place test builds should work, I have
pulled out all of the text extension code from setup.py into a new
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
extensions into tests/gpiosim and tests/procname where they can be imported.

Since release packages and tests no longer share the build/ directory I
have removed the "rmtree" hack from the "build_ext" override in setup.py.
There should be no cases where test extensions can accidentally end up
being installed into the system/user Python environment.

Tested with setuptools==68.2.2 (Sep 2023), setuptools==59.8.0 (Dec 2021)
and setuptools==42.0.2 (Dec 2019).

[1] - https://blog.ganssle.io/articles/2021/10/setup-py-deprecated.html

Phil Howard (1):
  bindings: python: standalone build tooling for tests

 bindings/python/Makefile.am    | 25 +++++++----
 bindings/python/build_tests.py | 79 ++++++++++++++++++++++++++++++++++
 bindings/python/setup.py       | 28 +-----------
 3 files changed, 97 insertions(+), 35 deletions(-)
 create mode 100644 bindings/python/build_tests.py

-- 
2.34.1

