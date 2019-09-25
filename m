Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1785BDBC0
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2019 12:02:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387790AbfIYKCu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Sep 2019 06:02:50 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:45292 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387778AbfIYKCt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Sep 2019 06:02:49 -0400
Received: by mail-pl1-f195.google.com with SMTP id u12so2181551pls.12
        for <linux-gpio@vger.kernel.org>; Wed, 25 Sep 2019 03:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=PfNn/W0PmjQ9bUUZ6dAEkvRvRPYcOrbr2656dQFRs6Q=;
        b=JarDPZ4d06l2rW7Tu+eOhbKXjmaAqntGdoyAud9fRFwzpo4YMJtFxlV5eduVtlyARe
         B4i1ZZZWGSLwcag8ovQS3K8AykaAoeVKdcMVP8lW4wk+sd9bpmrorRr+I69d90dBmVVM
         jzw+zP+XH/1pDAwdv1JU0R+mFF9R3e0UzCWvyvvd0Lm1XA2u1XakxrnFeJ9Y8oTkt7Gy
         qHEzZWlpC16y4HdG2TsCm2RfHF8Tl9nme/f+P8hDJ8WR9R0TzdOIU/l+y5E/UWvNmM30
         UFsizMezvTWeHjibmEMPCYQs7EiGmiLhIW3DJ84JZlDWxb4cl4zRtQaa7FmLvq+NcBkj
         7t1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=PfNn/W0PmjQ9bUUZ6dAEkvRvRPYcOrbr2656dQFRs6Q=;
        b=REUGimVklfBawYL31b7Ddyl38lcVrLhJG2P5EiIwykkkjo+GkIfn8+Bdoa3P2ICWuI
         JLc61MDVM0JAYeRC4pJY3uu9VRckEG8gXHjzpcmn38TfdZ1lfahQUjJ78I13PhrO6SbU
         ZEInthvz7HgpSonJOBXDbi0wvOq0GY+pG2OFA/G7LYomXxxVfKMX2UdGJrBD/ndk5J07
         CXzwsJDHrjOlJwhaojoorphlhMG6AWoE7icVYgDBS2krDj60lYO95IQ+QnEeS4w+D0Zf
         zaIcA6HzCfhUMoG3TPs1WDp47D8h+lzMMcPjDzHNOH2uXyvUsHXalwks5dZSvN6DuaG0
         Uhjg==
X-Gm-Message-State: APjAAAWDsiVDVz6xT6w4P+CkyWLoivF0oY9nJ/9G1k82B3H6opW10iBX
        awjoOANnpTNicS4OnpGCQ7BhrQ==
X-Google-Smtp-Source: APXvYqwQ1XUByYPcgR4boN+p28c/MUHpHkVT+0fmiLjdIW0/Pb0XTEGZyLw7yiO2tNQR7aNt95nT0w==
X-Received: by 2002:a17:902:a58a:: with SMTP id az10mr8426558plb.42.1569405767740;
        Wed, 25 Sep 2019 03:02:47 -0700 (PDT)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id u31sm13973216pgn.93.2019.09.25.03.02.42
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 25 Sep 2019 03:02:46 -0700 (PDT)
From:   Baolin Wang <baolin.wang@linaro.org>
To:     stable@vger.kernel.org, linus.walleij@linaro.org,
        natechancellor@gmail.com
Cc:     linux-gpio@vger.kernel.org, arnd@arndb.de, baolin.wang@linaro.org,
        orsonzhai@gmail.com, vincent.guittot@linaro.org,
        linux-kernel@vger.kernel.org
Subject: [BACKPORT 4.14.y v3 2/3] pinctrl: sprd: Use define directive for sprd_pinconf_params values
Date:   Wed, 25 Sep 2019 18:02:24 +0800
Message-Id: <93a07f8a37d17bdfbda6bcc9fdb5032a724d5f10.1569405445.git.baolin.wang@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1569405445.git.baolin.wang@linaro.org>
References: <cover.1569405445.git.baolin.wang@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Nathan Chancellor <natechancellor@gmail.com>

[Upstream commit 957063c924736d4341e5d588757b9f31e8f6fa24]

Clang warns when one enumerated type is implicitly converted to another:

drivers/pinctrl/sprd/pinctrl-sprd.c:845:19: warning: implicit conversion
from enumeration type 'enum sprd_pinconf_params' to different
enumeration type 'enum pin_config_param' [-Wenum-conversion]
        {"sprd,control", SPRD_PIN_CONFIG_CONTROL, 0},
        ~                ^~~~~~~~~~~~~~~~~~~~~~~
drivers/pinctrl/sprd/pinctrl-sprd.c:846:22: warning: implicit conversion
from enumeration type 'enum sprd_pinconf_params' to different
enumeration type 'enum pin_config_param' [-Wenum-conversion]
        {"sprd,sleep-mode", SPRD_PIN_CONFIG_SLEEP_MODE, 0},
        ~                   ^~~~~~~~~~~~~~~~~~~~~~~~~~

It is expected that pinctrl drivers can extend pin_config_param because
of the gap between PIN_CONFIG_END and PIN_CONFIG_MAX so this conversion
isn't an issue. Most drivers that take advantage of this define the
PIN_CONFIG variables as constants, rather than enumerated values. Do the
same thing here so that Clang no longer warns.

Link: https://github.com/ClangBuiltLinux/linux/issues/138
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
Reviewed-by: Baolin Wang <baolin.wang@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/pinctrl/sprd/pinctrl-sprd.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/sprd/pinctrl-sprd.c b/drivers/pinctrl/sprd/pinctrl-sprd.c
index 6352991..83958bd 100644
--- a/drivers/pinctrl/sprd/pinctrl-sprd.c
+++ b/drivers/pinctrl/sprd/pinctrl-sprd.c
@@ -159,10 +159,8 @@ struct sprd_pinctrl {
 	struct sprd_pinctrl_soc_info *info;
 };
 
-enum sprd_pinconf_params {
-	SPRD_PIN_CONFIG_CONTROL = PIN_CONFIG_END + 1,
-	SPRD_PIN_CONFIG_SLEEP_MODE = PIN_CONFIG_END + 2,
-};
+#define SPRD_PIN_CONFIG_CONTROL		(PIN_CONFIG_END + 1)
+#define SPRD_PIN_CONFIG_SLEEP_MODE	(PIN_CONFIG_END + 2)
 
 static int sprd_pinctrl_get_id_by_name(struct sprd_pinctrl *sprd_pctl,
 				       const char *name)
-- 
1.7.9.5

