Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD42B7C7851
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 23:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442643AbjJLVC6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Oct 2023 17:02:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344202AbjJLVC5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Oct 2023 17:02:57 -0400
Received: from mail-wm1-x364.google.com (mail-wm1-x364.google.com [IPv6:2a00:1450:4864:20::364])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5081CBE
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 14:02:52 -0700 (PDT)
Received: by mail-wm1-x364.google.com with SMTP id 5b1f17b1804b1-40535597f01so14945535e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 14:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1697144571; x=1697749371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7YqOP99jxgIoxnft3q3az4D+qxYWrsOon/DgDB4OcmE=;
        b=H678IS0hNXgmMAOFdBnKk6xU4cFz8UTGUlgY9/9cTVlEnF+71P4x4+lAk+IdFtCxYt
         FYFRmIAevbvX8oOcftLlqMky8rDmE5lnfRaSxNr9dZf0BYpGR9vqq4tsGkPE6xW6VhpO
         sUNteaVRdA20DBbIU+TO5DeuGwT8PJTXqBKwOxHvMPvt3mi905Q8pGMmOo46h2xvwGtO
         Rfhae0DsIKJvj+yLwookAIH+BJnMoxRuBIw8sCuW3z2J4RO5tkNWQ77hm7zpX/p00Fm/
         uOBidk8YhlHfBdSY6h+w5HLTplxkwZjCAj7LqjClPjMrH0zfRnMLHQkZmkUdyFc18fri
         xQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697144571; x=1697749371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7YqOP99jxgIoxnft3q3az4D+qxYWrsOon/DgDB4OcmE=;
        b=CHOQCGJDbcbAO2ivtI6LSuA37fiJCT0UkQtp10KvY6MouoXHNbyAYGvjNyoAkEcvxG
         1LVfKmGLFuCwGhXGnXomb0t1JKSNfwYcLbXNF+4Lv9VpUF0Ot5NRGRoMDlFLANQed3a0
         EPsIv59fFsbi63+YEjS4dOayvuZ6oYA1m1Ct2dTzc2r5pMG5Yrom+7flypnnZF9xeqDg
         psfeX8NqTy4Ej1j4AN0CHM/JdIraKx8lXvsTaUcv8FWoPQa2sWSOnXl+qVBzw451Kv7b
         lJaSHnpWXF+l3wWOp1ZBOqXEL9oDNaCISO9FeW2cmrXUWY6fq1DkrAhBrB6dhedSpiNh
         8ryA==
X-Gm-Message-State: AOJu0YzHNCbAe7FqILYroH47H0mcOBwHZiyWm0ku+i8LKFtl9vcX+0QK
        fAXRMzwsfhH8eLuW4101M36D4b6GxF4LSb6P/qZxgrDKBfYf7Q==
X-Google-Smtp-Source: AGHT+IGujYdJ3iACx1diyUtM/jGpiOsNyNYgOWRLKZ9Hkgx+RTeg1bD95p/GFcEz/4uGXirOeLbfwg1ifUOm
X-Received: by 2002:a05:600c:282:b0:406:44e7:ef93 with SMTP id 2-20020a05600c028200b0040644e7ef93mr23289867wmk.1.1697144570437;
        Thu, 12 Oct 2023 14:02:50 -0700 (PDT)
Received: from pop-os.. (cpc91242-cmbg18-2-0-cust972.5-4.cable.virginm.net. [82.8.131.205])
        by smtp-relay.gmail.com with ESMTPS id k13-20020a05600c0b4d00b004073d6c3626sm103194wmr.28.2023.10.12.14.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 14:02:50 -0700 (PDT)
X-Relaying-Domain: gadgetoid.com
From:   Phil Howard <phil@gadgetoid.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, Phil Howard <phil@gadgetoid.com>
Subject: [libgpiod][PATCH v2 2/2] bindings: python: add pyproject.toml, pep 518
Date:   Thu, 12 Oct 2023 22:02:28 +0100
Message-Id: <20231012210228.101513-3-phil@gadgetoid.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231012210228.101513-1-phil@gadgetoid.com>
References: <20231012210228.101513-1-phil@gadgetoid.com>
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

Add pyproject.toml to prevent spurious deprecation warnings from pip.

Signed-off-by: Phil Howard <phil@gadgetoid.com>
---
 bindings/python/pyproject.toml | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 bindings/python/pyproject.toml

diff --git a/bindings/python/pyproject.toml b/bindings/python/pyproject.toml
new file mode 100644
index 0000000..fcf6bbe
--- /dev/null
+++ b/bindings/python/pyproject.toml
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2023 Phil Howard <phil@gadgetoid.com>
+
+[build-system]
+requires = ["setuptools", "wheel"]
-- 
2.34.1

