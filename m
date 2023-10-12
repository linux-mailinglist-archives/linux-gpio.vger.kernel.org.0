Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65B827C7751
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 21:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235777AbjJLTwG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Oct 2023 15:52:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235783AbjJLTwE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Oct 2023 15:52:04 -0400
Received: from mail-lf1-x162.google.com (mail-lf1-x162.google.com [IPv6:2a00:1450:4864:20::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C99EDBB
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 12:51:50 -0700 (PDT)
Received: by mail-lf1-x162.google.com with SMTP id 2adb3069b0e04-50567477b29so1841420e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 12:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1697140308; x=1697745108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RaZC177nDA67PFmAZMBxIV0ASNnC0/h92xUJw8XPVyc=;
        b=K8ASVknrd7Yo2/frIe4iR+dDdOoXKWHolwFFr86wMhBqJRI96/oAEPr8vXM7lZLyh9
         huFQmtxtvXDzNKJfMSxBQZfnQqplLeDvbqQpfQKVE86AlBbiRJLlxgGWjtwIdTMz35NG
         kArjp/pUO4JbqdKRiIbFFlM4HGUOHp/L0CR4dt85unnATjtnWMnC9GyhW5w2k49Qv6M/
         Vs4/apEucrfAzzj9ShWWX0k/Mb6hyPsW03NR3VlQu52ORWB6i3XIwlNvNxOb0vWX3RMP
         DZM2oSqAEbiNoaW3He/gPp4PRrOp6EYzA3kA1nq8M+9UdB0UZZGHyvQkk+8PICE/iGba
         E7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697140308; x=1697745108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RaZC177nDA67PFmAZMBxIV0ASNnC0/h92xUJw8XPVyc=;
        b=jA4NqTzjgGe+kEIpv75U8eLef9yI2a4aIZYP8rPrV3jPGWIMhFknCCR9u0IWPu1RRU
         C5he3F8cOiN2okwAd3AttIDDITKfa0yaYtyKD6nRGeVlXloJ3+d+xnJQ+uVs5VUKxS/L
         Cc2+oIp5ihymPouIUkGfiv+ny5uU1Np0THYlmiGpaZF0hrknjwFK4167/y0j/JehMaJl
         n58RhFhnyDO7ik/ex9YlQnFfE0nLA7a0LoPWWX7MyP/pFGw9f9MqKPm0gMNDjywgFVVO
         4Zj5Wgz13pzDJ3o8+O0EUI4Bdam3q2m81K3vP36l5xtb/WxDdI9Ummlweu+flJXZoBxJ
         abZw==
X-Gm-Message-State: AOJu0YxKsrZlFWCZs0A5v0vOC5ZqI3aHqT64iJUb54H9MqoHAAA1qGpq
        iwsyTsHISX9+q9nW8h+CBSmxwMqisZdcndElUJvb3Zs/jbfgNQ==
X-Google-Smtp-Source: AGHT+IFgAcV769O5/vcg6IIhZfZUWCHG42LnNuyIpHaXI4m5Pv5brPxHTVGygGxuz5ZFmCwWwXggwBq82N5n
X-Received: by 2002:a19:5213:0:b0:500:771f:4887 with SMTP id m19-20020a195213000000b00500771f4887mr15833628lfb.55.1697140308153;
        Thu, 12 Oct 2023 12:51:48 -0700 (PDT)
Received: from pop-os.. (cpc91242-cmbg18-2-0-cust972.5-4.cable.virginm.net. [82.8.131.205])
        by smtp-relay.gmail.com with ESMTPS id z20-20020ac25df4000000b004fbbc50cbfcsm1013353lfq.144.2023.10.12.12.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 12:51:48 -0700 (PDT)
X-Relaying-Domain: gadgetoid.com
From:   Phil Howard <phil@gadgetoid.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, Phil Howard <phil@gadgetoid.com>
Subject: [libgpiod][PATCH] bindings: python: simplify environ access
Date:   Thu, 12 Oct 2023 20:51:39 +0100
Message-Id: <20231012195139.81613-1-phil@gadgetoid.com>
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

Use environ.get() in lieu of an explicit check for GPIOD_WITH_TESTS in
os.environ.

Returns None and evaluates as False if GPIOD_WITH_TESTS == "1" is 
not specified.

Signed-off-by: Phil Howard <phil@gadgetoid.com>
---
 bindings/python/setup.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/python/setup.py b/bindings/python/setup.py
index fd674aa..df10e18 100644
--- a/bindings/python/setup.py
+++ b/bindings/python/setup.py
@@ -50,7 +50,7 @@ procname_ext = Extension(
 )
 
 extensions = [gpiod_ext]
-if "GPIOD_WITH_TESTS" in environ and environ["GPIOD_WITH_TESTS"] == "1":
+if environ.get("GPIOD_WITH_TESTS") == "1":
     extensions.append(gpiosim_ext)
     extensions.append(procname_ext)
 
-- 
2.34.1

