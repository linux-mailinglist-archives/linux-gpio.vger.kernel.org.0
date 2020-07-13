Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7126421D91D
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2020 16:50:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730111AbgGMOtn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jul 2020 10:49:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730110AbgGMOtm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2020 10:49:42 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCBFFC061794
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 07:49:41 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id f18so16892620wrs.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 07:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EdngZibp0zWCAAM+UJcwsurIH7yKZeYEzW9/AfNLRBM=;
        b=JW8ZfxngbL67Sj8u+8Odvmzrwr0Un0a8dfJga8fvIiSWVdYg9aR4Bmk+ZaZcNRFo4H
         mYYCCmw1FyfXDWpX/JP8gcpGpLbGjVhpgBWMLQ7nU3B60mmVu0+j3wYxmW0D0X1k5/zs
         4NS/fGYu/LscQ5CzpkfJBoQy0++MW25LdnoHtLiIDNIoujjsb4iXIpRxjgIXjCQSUeu5
         5RKO/zCJXFqGKYoHk3QXfi69WgeFYkcFR2GtBorrikmsDs+1KrMwPTr8T2C2QkbQBRi/
         bgI7VvRNsxOtIgc9DXtgUbv6Ox4Z0pppzdqBGQdi7TUTRWQYpytYkMNaweHWedM6aOUQ
         zj4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EdngZibp0zWCAAM+UJcwsurIH7yKZeYEzW9/AfNLRBM=;
        b=X2WAh79lT603sdO6B+JstmxObXPajkVbzJ/6CLatGxvA7cCMg+7JkM4IqaPwahlToG
         Rv17ZhOaqyYka/Tad0EBr/pGK6SbfJ6VRjZWmB5oVnUuE5Pz11m0v7XcW3AHyjPcnAy6
         kmkeZExXR8Mv4Rewywdm5f1Z+5hn+zEms2xrnkJnqdPjcIkRrzCa1U9hLdk1kpZEVKzM
         OpBAxDaW2Hp0GJt4QKQLweKSV7q4ueL0A+ro5Gi2IaWloqdw5SDUar81DZ6LPce20kpp
         SE0/BLosLfSNHz/rFpRmZc67K5qiPz/iZzE7qXx9Z17S25l0Kn48pdG8HyONNoxz7MQL
         RArQ==
X-Gm-Message-State: AOAM533XzVdeOiOziiar2oomLxodqJmrhMikERMwbXYdbUMiKs2Jb1mV
        FoYN66f162LqvFQyRC4jJ7qP2w==
X-Google-Smtp-Source: ABdhPJwbwkd7iM4SmIi+fTezp7zvJuFCTmoF3U2ec6u5Z2hwzXy9AZwysrE+mhaEjypi6okk23x0gg==
X-Received: by 2002:a5d:6a07:: with SMTP id m7mr81416990wru.324.1594651779599;
        Mon, 13 Jul 2020 07:49:39 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.6])
        by smtp.gmail.com with ESMTPSA id o29sm26207756wra.5.2020.07.13.07.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 07:49:39 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Thomas Abraham <thomas.ab@samsung.com>,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 06/25] pinctrl: samsung: pinctrl-samsung: Demote obvious misuse of kerneldoc to standard comment blocks
Date:   Mon, 13 Jul 2020 15:49:11 +0100
Message-Id: <20200713144930.1034632-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200713144930.1034632-1-lee.jones@linaro.org>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

No attempt has been made to document either of the demoted functions here.

Fixes the following W=1 kernel build warning(s):

 drivers/pinctrl/samsung/pinctrl-samsung.c:1149: warning: Function parameter or member 'dev' not described in 'samsung_pinctrl_suspend'
 drivers/pinctrl/samsung/pinctrl-samsung.c:1199: warning: Function parameter or member 'dev' not described in 'samsung_pinctrl_resume'

Cc: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Thomas Abraham <thomas.ab@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/pinctrl/samsung/pinctrl-samsung.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index f26574ef234ab..608eb5a07248e 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1140,7 +1140,7 @@ static int samsung_pinctrl_probe(struct platform_device *pdev)
 	return 0;
 }
 
-/**
+/*
  * samsung_pinctrl_suspend - save pinctrl state for suspend
  *
  * Save data for all banks handled by this device.
@@ -1187,7 +1187,7 @@ static int __maybe_unused samsung_pinctrl_suspend(struct device *dev)
 	return 0;
 }
 
-/**
+/*
  * samsung_pinctrl_resume - restore pinctrl state from suspend
  *
  * Restore one of the banks that was saved during suspend.
-- 
2.25.1

