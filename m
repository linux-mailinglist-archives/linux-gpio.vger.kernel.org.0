Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 056D321D913
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2020 16:50:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730158AbgGMOtt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jul 2020 10:49:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730150AbgGMOtq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2020 10:49:46 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11973C08C5DB
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 07:49:46 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id 22so13596900wmg.1
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 07:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jIoZqzG9OLATQhyya2bqPTWvpUfxkuQVsRzQ1VQbwNE=;
        b=bMhz0RnA/3UZT7hU8Hmuz9lWKmBNqOVSGmyPyWBVANYCkg2p3Qyae9xDS5WenLUiDn
         8274PaEDUnifNdF6+9oklXnQalIg2pJ6Fk5ai0o+Y+Ew+yTjOWjE1X+Ei23ZlU2CHsL0
         EbYezapMR7f7I2JL81ySs9dkcV0rOcs/En3fnXmguJWpkm70yjei7Ov9UjIcU3vrG0Jv
         DFM0KS7YMJ+YUln5WmOprK0AsPpXluFIQCZrP2z4Vj91ZKfyJxhp+UEM3dcWQKgNBHpN
         RsC2xNZZjHKYyFujhG/0BS2rifc9dxAlOy7fnksfbL4qUJdKbZvo75qOhwr+CvW3q8/R
         M7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jIoZqzG9OLATQhyya2bqPTWvpUfxkuQVsRzQ1VQbwNE=;
        b=HBn6Hse1ah/bxD0vck4z7bYuake/7KMf7U/LyVPdjuj9OkBiwlLpgoeQKR4lJkcRwN
         HtLMwyPgK+TJoIzQUj73U9q3q6w5YROOvoQ4v2YiS/oVFHYztM+lhk9VCoPdY3E348ke
         i09xJ1F4X9ckEGkNxPZQFq2Jri6XFVVKAG3MT+t9Raq1oaxEElCkkljIuhl1IFBEn1Xg
         md+zVqY54nOa8q9vy17SNxQDsSLjTy4H6NCFSbPJ6kjKxQX4yvRMJ1e8tN6JurQEexwX
         L/6PLvbPBF5DmAwBAZoMetAa1F8Nmp52D0CPC2yRy9dJ4/0/MfYi/jE26NaUPsSBW3Ad
         VG/Q==
X-Gm-Message-State: AOAM532eSh0jysFZ6Hm42sTeQtwC6oCC6QDOHl7Am6WVlHSgOF9XtI1Q
        FqL59IRYyGwoP+Fm3Bnl5qYnyg==
X-Google-Smtp-Source: ABdhPJxGvxtVyqe4voNXc32U+fuwwbPkvPKZ54NNIT7BqjecwQyJAfoVDmOAL7IsUckuXU9N3xD+vw==
X-Received: by 2002:a1c:e18a:: with SMTP id y132mr294500wmg.27.1594651784746;
        Mon, 13 Jul 2020 07:49:44 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.6])
        by smtp.gmail.com with ESMTPSA id o29sm26207756wra.5.2020.07.13.07.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 07:49:44 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 11/25] pinctrl: core: Fix a bunch of kerneldoc issues
Date:   Mon, 13 Jul 2020 15:49:16 +0100
Message-Id: <20200713144930.1034632-12-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200713144930.1034632-1-lee.jones@linaro.org>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Most are likely due to bitrot/API slip.  Some are formatting issues.

Fixes the following W=1 kernel build warning(s):

 drivers/pinctrl/core.c:167: warning: Function parameter or member 'pin' not described in 'pin_get_name'
 drivers/pinctrl/core.c:167: warning: Excess function parameter 'name' description in 'pin_get_name'
 drivers/pinctrl/core.c:584: warning: Function parameter or member 'selector' not described in 'pinctrl_generic_get_group'
 drivers/pinctrl/core.c:584: warning: Excess function parameter 'gselector' description in 'pinctrl_generic_get_group'
 drivers/pinctrl/core.c:1356: error: Cannot parse struct or union!
 drivers/pinctrl/core.c:1458: warning: Function parameter or member 'map' not described in 'pinctrl_unregister_mappings'
 drivers/pinctrl/core.c:1458: warning: Excess function parameter 'maps' description in 'pinctrl_unregister_mappings'
 drivers/pinctrl/core.c:2239: warning: Function parameter or member 'pctldev' not described in 'devm_pinctrl_register_and_init'

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/pinctrl/core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 821242bb4b16a..3e8d1630d29ed 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -161,7 +161,7 @@ int pin_get_from_name(struct pinctrl_dev *pctldev, const char *name)
 /**
  * pin_get_name_from_id() - look up a pin name from a pin id
  * @pctldev: the pin control device to lookup the pin on
- * @name: the name of the pin to look up
+ * @pin: pin number/id to look up
  */
 const char *pin_get_name(struct pinctrl_dev *pctldev, const unsigned pin)
 {
@@ -577,7 +577,7 @@ EXPORT_SYMBOL_GPL(pinctrl_generic_get_group_pins);
 /**
  * pinctrl_generic_get_group() - returns a pin group based on the number
  * @pctldev: pin controller device
- * @gselector: group number
+ * @selector: group number
  */
 struct group_desc *pinctrl_generic_get_group(struct pinctrl_dev *pctldev,
 					     unsigned int selector)
@@ -1329,7 +1329,7 @@ static void devm_pinctrl_release(struct device *dev, void *res)
 }
 
 /**
- * struct devm_pinctrl_get() - Resource managed pinctrl_get()
+ * devm_pinctrl_get() - Resource managed pinctrl_get()
  * @dev: the device to obtain the handle for
  *
  * If there is a need to explicitly destroy the returned struct pinctrl,
@@ -1451,7 +1451,7 @@ EXPORT_SYMBOL_GPL(pinctrl_register_mappings);
 
 /**
  * pinctrl_unregister_mappings() - unregister a set of pin controller mappings
- * @maps: the pincontrol mappings table passed to pinctrl_register_mappings()
+ * @map: the pincontrol mappings table passed to pinctrl_register_mappings()
  *	when registering the mappings.
  */
 void pinctrl_unregister_mappings(const struct pinctrl_map *map)
@@ -2226,9 +2226,9 @@ EXPORT_SYMBOL_GPL(devm_pinctrl_register);
  * @dev: parent device for this pin controller
  * @pctldesc: descriptor for this pin controller
  * @driver_data: private pin controller data for this pin controller
+ * @pctldev: pin controller device
  *
- * Returns an error pointer if pincontrol register failed. Otherwise
- * it returns valid pinctrl handle.
+ * Returns zero on success or an error number on failure.
  *
  * The pinctrl device will be automatically released when the device is unbound.
  */
-- 
2.25.1

