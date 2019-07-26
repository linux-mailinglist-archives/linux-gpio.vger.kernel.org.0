Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BFAE7646B
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jul 2019 13:28:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbfGZL2X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Jul 2019 07:28:23 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:43601 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726191AbfGZL2T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Jul 2019 07:28:19 -0400
Received: by mail-lf1-f67.google.com with SMTP id c19so36844451lfm.10
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jul 2019 04:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yms7A0Dj/ss/bfob7fvSwoSoaN3YOnXapMDkDt2JkGk=;
        b=dI3W3+aYZkRhr2cVhzUptcUM2pwVVATteZ4VZ3NtR71AqBqGIYfrf8yrxzStuM+3nE
         tya5Wiu6pzLKkBX88Pc9jxDP11Kp2Nb7gJvFfjHY3wHbyJTa9MjgkhXMMSLglyktzkm3
         rtfP0GDsu4nDfg7oDxj6j5NfrKRKG9nFa1yKVgkG+vm4TleEGCA4h4MB8cJEZeWnFrVx
         66ajVkJqxzTBxoq8QcMEGK7KzPudl9gdTSkKZ9JTKZKCDGv4Ao7DdYIPa5uPBiKKxwIV
         QUSwtaEwhzZ9sq1FGfEOxB2hVT7HFBdpqVMA8nbZVRahng8T1uE6i7OUfifFilHWGBbe
         be7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yms7A0Dj/ss/bfob7fvSwoSoaN3YOnXapMDkDt2JkGk=;
        b=i5ITgSWGjD3A68Y4jEbpYYxb35nUjbcEZntg0GgTlPTTLjfYWwhhIowYa0asN50Lbp
         8qsFM1nu3okJLtXNR5T3aCdb3bXwi9BfdSO04JhMZM+RrmaWVchF64KIEfAkpH6a2Ksn
         kozEH6cbGGX5qY5XNFbQ0tB71qkpZkVahI377C7IPoIo8bwYPcVtifS5UxYSwIhsDFA5
         7gVBMiZ8c5kwsYAGDDdc8yoLYW4/TEJgnGgCR66XdZSHj7Auj0wQMNp4mGrWsN7h0l+s
         4rCLel/0msD7lop3X4TJZREhNDxWMLIEkuq6p9IUQhBAEOf9uZ8fQPUR7QVSM1WdW8HL
         V5Lg==
X-Gm-Message-State: APjAAAX7my8sZQuVpOI0PkgtSsGlU+wMojCVGE9347vptIhzm8gE0pX4
        +M2syvLqF5z8wikaowHL6Wiu0w==
X-Google-Smtp-Source: APXvYqx05CPqPaf24TqfXHUET5OwIsXvhc0hYDuun6wEBRgaKaaGpBp1xs/Z6Ozl1ehbTYYA+0UBew==
X-Received: by 2002:a19:be03:: with SMTP id o3mr43992429lff.88.1564140496719;
        Fri, 26 Jul 2019 04:28:16 -0700 (PDT)
Received: from localhost (c-243c70d5.07-21-73746f28.bbcust.telenor.se. [213.112.60.36])
        by smtp.gmail.com with ESMTPSA id b27sm10020400ljb.11.2019.07.26.04.28.15
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 04:28:16 -0700 (PDT)
From:   Anders Roxell <anders.roxell@linaro.org>
To:     linus.walleij@linaro.org, heiko@sntech.de
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH 1/2] pinctrl: rockchip: Mark expected switch fall-through
Date:   Fri, 26 Jul 2019 13:28:12 +0200
Message-Id: <20190726112812.19665-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When fall-through warnings was enabled by default the following warning
was starting to show up:

../drivers/pinctrl/pinctrl-rockchip.c: In function ‘rockchip_gpio_set_config’:
../drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may fall
 through [-Wimplicit-fallthrough=]
   rockchip_gpio_set_debounce(gc, offset, true);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/pinctrl/pinctrl-rockchip.c:2795:2: note: here
  default:
  ^~~~~~~

Rework so that the compiler doesn't warn about fall-through. Add
'return -ENOTSUPP;' to match the comment.

Fixes: d93512ef0f0e ("Makefile: Globally enable fall-through warning")
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 drivers/pinctrl/pinctrl-rockchip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 62a622159006..dc0bbf198cbc 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -2792,6 +2792,7 @@ static int rockchip_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 		 * still return -ENOTSUPP as before, to make sure the caller
 		 * of gpiod_set_debounce won't change its behaviour.
 		 */
+		return -ENOTSUPP;
 	default:
 		return -ENOTSUPP;
 	}
-- 
2.20.1

