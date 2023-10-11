Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5F087C5360
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 14:14:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346817AbjJKMO6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 08:14:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346767AbjJKMOw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 08:14:52 -0400
Received: from mail-lf1-x164.google.com (mail-lf1-x164.google.com [IPv6:2a00:1450:4864:20::164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54E314681
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:13:14 -0700 (PDT)
Received: by mail-lf1-x164.google.com with SMTP id 2adb3069b0e04-50308217223so8559417e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1697026389; x=1697631189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5t6GIee90pO3Wbr53RuwASc/+xC7LgMcWfutPVzZ424=;
        b=eT8zHO64jqS+NeCJrPtw9ydJ+wGXX9tD+G4M8C3YPRSFdm7ZQ6k2PU5mK5HC4MibBr
         IWaSY84kZavFgrKKA6wfRlZT4B9DmPMJBENNCLa6psOQu+I6bvskqMD3p28BHslagRuo
         PkQ6q3aF5JwIwCVKzKhuzu9juU6va04dkHKE3bXZocaVZavcqySm+h/A4Z3xG4gQN/2L
         8xvte+FZL7v76obWiVCg6/iEnKKVtDXrmIWrZMvDgOdMLd1Zq/K0tuAZtVZfcFWnTyae
         gcobYHk1ToTAO1Xtg38XIOeeQ/aCP5NrK9w76f+ulqgipiP6MyixiNJEvMDZXY+0dwDu
         tQjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697026389; x=1697631189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5t6GIee90pO3Wbr53RuwASc/+xC7LgMcWfutPVzZ424=;
        b=Vf4D7K8fCb7uTrMgGB3FUiRaQ24Hnq3F3vklvfHwfBNaCcsSRneZv60//4kb4s7BF/
         8DFsauEBPp5witW0f6+7MakEwJ29HB3L7gPRDXcipktC0ZRO5ze7ydfiz9AnVLZXVcBp
         pcTyOjGTBcVLQ6GyAyT1kXZ0FfW51rirWmTWDs/Za0Nhmnm78m9BZh6vGSwN90Lg8UnU
         Y0/IFtut30umbrm84rgAH835lEp3f6FNNv8v5NbX4gCGq0Jl1HFun6l4DWBz1WFSIzem
         8YqSX4KRptBkjbYTcIBLjEEngoO6hohGYENrl8B1urDd3G1Yi6Kpqob35mAo2t+wjWSY
         6mRQ==
X-Gm-Message-State: AOJu0YxnpW/S0yIeeiLYAjuqiXF0Y8JgP9QaAgMa8Vt5RZtGhKrZuGWI
        wzpv0o5opBfhYxXhoKb+AD9fnK78E6OQ70VMNA9K51ql+aNHCA==
X-Google-Smtp-Source: AGHT+IGwkIUqFYmsCoWtVON4qkyDe6/1lO9UtwI6jsPoZK5/4BZMj3Z8lCIV25eDdADVaXkLcPzcFoa4908H
X-Received: by 2002:a05:6512:3a83:b0:503:2deb:bbc1 with SMTP id q3-20020a0565123a8300b005032debbbc1mr20886665lfu.22.1697026388396;
        Wed, 11 Oct 2023 05:13:08 -0700 (PDT)
Received: from pop-os.. (cpc91242-cmbg18-2-0-cust972.5-4.cable.virginm.net. [82.8.131.205])
        by smtp-relay.gmail.com with ESMTPS id x6-20020a170906134600b009b9720a85dcsm1582049ejb.44.2023.10.11.05.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 05:13:08 -0700 (PDT)
X-Relaying-Domain: gadgetoid.com
From:   Phil Howard <phil@gadgetoid.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, Phil Howard <phil@gadgetoid.com>
Subject: [libgpiod][PATCH 2/3] bindings: python: add pyproject.toml, pep 518
Date:   Wed, 11 Oct 2023 13:12:45 +0100
Message-Id: <20231011121246.9467-3-phil@gadgetoid.com>
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

Add pyproject.toml to prevent spurious deprecation warnings from pip.

Signed-off-by: Phil Howard <phil@gadgetoid.com>
---
 bindings/python/pyproject.toml | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 bindings/python/pyproject.toml

diff --git a/bindings/python/pyproject.toml b/bindings/python/pyproject.toml
new file mode 100644
index 0000000..d1e6ae6
--- /dev/null
+++ b/bindings/python/pyproject.toml
@@ -0,0 +1,2 @@
+[build-system]
+requires = ["setuptools", "wheel"]
-- 
2.34.1

