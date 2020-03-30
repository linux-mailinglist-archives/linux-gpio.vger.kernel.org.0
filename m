Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FEE2197824
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2020 11:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728386AbgC3J6K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Mar 2020 05:58:10 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50639 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728259AbgC3J6K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Mar 2020 05:58:10 -0400
Received: by mail-wm1-f65.google.com with SMTP id t128so843249wma.0;
        Mon, 30 Mar 2020 02:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UmkAXtrx7EGpWTd8vebBYq4HKMNN076r/XfqEl521lA=;
        b=Gc6515VSoCC5JCdth9r+SM8Wl+KnX+zMV0+siJdziitITNOHAconkPeFMlok5lK2lr
         8FNbXa6e1sa0WxiPXpv2oKLRKjx0phV3UXGk95o2kLJTf9ykjYIZKOM19+HHwLIFBiXa
         YuD74354xO/Fmk7T8avXA8qOVYR9yBsrMcbDCiki15b/Gs/oH4a1d2WcdZZmEdVybmiJ
         mOk8c9RRIXvFq9ZeFivDl0SKuZiynDB0EQR7NyDYIIUOTZ3Rbrotwnkv0qY2krz9vLsO
         6c/kBl7MygqyEp4AFnH4phKb4GEVeKLIVTe4OKYWJj2UhfvjpDGbhUk0uCqneziMREcS
         A/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UmkAXtrx7EGpWTd8vebBYq4HKMNN076r/XfqEl521lA=;
        b=Z6cw5qphrP9PRwYMzl/OW359VwiSBtAKIJ8r9zI9Jyw+PmwtLFtz6xNzn+g54ruWZ2
         HBni+rJtpvO1n2o5H+Ag7FN169G96qFwUCgUzpp9jT3kIMuntzblqY9iIpwXz6Tae/kq
         AXV95li847jComV9TTQDW3INdmC9cWbQlLg1cb08lWE5v2UH5RPa9A967PtKk7eSiTL4
         CpcBSiInex261tTLo7/9SkQcLYW3gpZFR+Fi32w1i8R3VYXunBUc6V8dexL/omQxA6IE
         fJfD8+CKx0dr7TVnIMYry6k4FRwjPpu312f3pMQmoqarQ0Sp2Dj233YOQB+sVgMZ40H+
         tnXg==
X-Gm-Message-State: ANhLgQ3ebnGeFb4+JiSZR9KKex2EqB+k4JW0c788BmRHU0D9JuKKnRg4
        By1gs9bZ+vmbdI90eQyDsivc7u2J
X-Google-Smtp-Source: ADFU+vthKUDkNCHJDmtynltoCVzv6w2lWTamWTrxxRNgECEON86HVyepF0hJMBLhnRNzT4qhY8NZqA==
X-Received: by 2002:a05:600c:a:: with SMTP id g10mr12548454wmc.153.1585562287317;
        Mon, 30 Mar 2020 02:58:07 -0700 (PDT)
Received: from localhost (p200300E41F4A9B0076D02BFFFE273F51.dip0.t-ipconnect.de. [2003:e4:1f4a:9b00:76d0:2bff:fe27:3f51])
        by smtp.gmail.com with ESMTPSA id a7sm4239665wmm.34.2020.03.30.02.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 02:58:06 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] pinctrl: Define of_pinctrl_get() dummy for !PINCTRL
Date:   Mon, 30 Mar 2020 11:58:01 +0200
Message-Id: <20200330095801.2421589-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Currently, the of_pinctrl_get() dummy is only defined for !OF, which can
still cause build failures on configurations with OF enabled but PINCTRL
disabled. Make sure to define the dummy if either OF or PINCTRL are not
enabled.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 include/linux/pinctrl/pinctrl.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
index 7ce23450a1cb..2aef59df93d7 100644
--- a/include/linux/pinctrl/pinctrl.h
+++ b/include/linux/pinctrl/pinctrl.h
@@ -186,7 +186,7 @@ extern int pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
 				const char *pin_group, const unsigned **pins,
 				unsigned *num_pins);
 
-#ifdef CONFIG_OF
+#if IS_ENABLED(CONFIG_OF) && IS_ENABLED(CONFIG_PINCTRL)
 extern struct pinctrl_dev *of_pinctrl_get(struct device_node *np);
 #else
 static inline
-- 
2.24.1

