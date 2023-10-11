Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E55B7C535F
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 14:14:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346779AbjJKMO6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 08:14:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346755AbjJKMOv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 08:14:51 -0400
Received: from mail-ej1-x661.google.com (mail-ej1-x661.google.com [IPv6:2a00:1450:4864:20::661])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40E5744BF
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:13:14 -0700 (PDT)
Received: by mail-ej1-x661.google.com with SMTP id a640c23a62f3a-9ae2cc4d17eso1210243766b.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1697026389; x=1697631189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VRjotP9QoGWnwkXudYzS47Q00KaDX7My9mJg0lPIxUk=;
        b=HzVTcZqTakEDiAdIxxbAJ823K73ek0hnE3Hf1VfdZHHt5WBm/oqNg3G/f+C3Ahg56H
         9fTZJAu/skFobUlzEWeNaqh7U6uwOgBf9GVCkJTMgMXdRlCstJBOSB+oVNHNDpCt2aqD
         ZOZMivrmxuxi2Fn5MviqXvOsFy5jomlBgseuIMZTb/DIkLravUOWHzBuiJlfv2j2pU7x
         1QuzS2gT+EDbAw+1AajnV1pzwB1iHVjcWgAspvHi3tKpfoT3ZO904koJ4A8PmjdoBEWD
         7PRxB5DVub/3r+L8dpHWG/h1KTdiQdKQ+dAzGXISbxvCi4NhPMMgMM/jVUfnVUhVR0uo
         5/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697026389; x=1697631189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VRjotP9QoGWnwkXudYzS47Q00KaDX7My9mJg0lPIxUk=;
        b=BVLrdS3q3AqKqW+ot9GcvU1SYZzLvObt7TSTgrxNeI65EY4k7R52G0ZXeNzREjeDi3
         rKP9VMn5iDULJjjuiGMonmRKer/QkuY091gRoGm4znIe80d356l3EKqQyltuARrS2j5j
         2kH+vQXsSOjm8Bxi6lC4rv3zejAYFyBjCPl7W5wq5HKVAHMdd75CPmwzPsSRh0DZ/ZaH
         Fxkx7xzyB+p3w/iALqC4CDY7necRYC3HDFev8jb9R4Q6EsK21WG0i6nnvjrG3LrGhEm6
         DAKd6FR+KSEnQxYNHUjj4MlYSMUvarvUYhpLjNe9D4lsKvJNZWSG7HpADby1pVrIu9/C
         d78A==
X-Gm-Message-State: AOJu0YzPgyGCOPGyf7ctAvdhI0bcwUjyx+KrzeNcrDiA49Z5Z5gX2dgy
        SqCtywOIWH/BFZbloCqoKFD/zHdcMCaXHwtnWlQcH4WOYyQ/8Q==
X-Google-Smtp-Source: AGHT+IE59mRYsF1f91YS9q1O4IsAAVWocqH8poX9opeDpNbvLkpWq1kCF78rWo5I0PnZXqx8EVcNDmJRtDYc
X-Received: by 2002:a17:906:308c:b0:9ae:829e:d930 with SMTP id 12-20020a170906308c00b009ae829ed930mr19849758ejv.9.1697026389204;
        Wed, 11 Oct 2023 05:13:09 -0700 (PDT)
Received: from pop-os.. (cpc91242-cmbg18-2-0-cust972.5-4.cable.virginm.net. [82.8.131.205])
        by smtp-relay.gmail.com with ESMTPS id x6-20020a170906134600b009b9720a85dcsm1582049ejb.44.2023.10.11.05.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 05:13:09 -0700 (PDT)
X-Relaying-Domain: gadgetoid.com
From:   Phil Howard <phil@gadgetoid.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, Phil Howard <phil@gadgetoid.com>
Subject: [libgpiod][PATCH 3/3] bindings: python: require python 3.9.0
Date:   Wed, 11 Oct 2023 13:12:46 +0100
Message-Id: <20231011121246.9467-4-phil@gadgetoid.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231011121246.9467-1-phil@gadgetoid.com>
References: <20231011121246.9467-1-phil@gadgetoid.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Required minimum version for PyModule_AddType helper.

Signed-off-by: Phil Howard <phil@gadgetoid.com>
---
 bindings/python/setup.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/bindings/python/setup.py b/bindings/python/setup.py
index 2e25981..fbba7ab 100644
--- a/bindings/python/setup.py
+++ b/bindings/python/setup.py
@@ -91,6 +91,7 @@ if "GPIOD_WITH_TESTS" in environ and environ["GPIOD_WITH_TESTS"] == "1":
 setup(
     name="libgpiod",
     packages=find_packages(exclude=["tests", "tests.*"]),
+    python_requires=">=3.9.0",
     ext_modules=extensions,
     cmdclass={"build_ext": build_ext},
     version=__version__,
-- 
2.34.1

