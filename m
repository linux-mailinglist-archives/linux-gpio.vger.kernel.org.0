Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19C1FA6214
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2019 08:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726481AbfICG7h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Sep 2019 02:59:37 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36005 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbfICG7h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Sep 2019 02:59:37 -0400
Received: by mail-pg1-f196.google.com with SMTP id l21so8595522pgm.3
        for <linux-gpio@vger.kernel.org>; Mon, 02 Sep 2019 23:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Qa2NPAU3nUxhMhka8HdV81hTcVfR5ad6LZDKEEK+E8I=;
        b=Z4AVnwpG4rHHCb7eTykmNN4YGIgNaMlnQTD+N+iPSXwRNBG+coPsaxg9Nwq3x3Wkte
         JCHjLySZ867EN8Z2AeH8mah4+X/bfHodXgETIrb6E8bFU1qOSlzBzdGA8su+8NqyXJ7K
         /3jFMSUF+Ifu0X4x6KC8cd0sWy/R5HQfish+yqAxdg6g9mILJfKfcYRmZoaR6kqKl2NE
         OAxL+RStVT3/50mXjXBmVm15Ds7yLg6B6JGku8l830FhcL2s/SO460iHPmeT6QEDd3hk
         UsjMoNdmj54+trhaGlxTcXQjdM4m3hp2R+nCJCBGUvoipZrokyX7GzGL3xTvz9OMoDDD
         uabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Qa2NPAU3nUxhMhka8HdV81hTcVfR5ad6LZDKEEK+E8I=;
        b=MOZKoKj6X8tS8u6BnhYRkAGm6g5R6LwFwUj4R9YITpOF4b7YGD4w2ZcfShwmuSzEXP
         W24Dlbmj/OAOHEnRq8cZWtWJvZBqS3sQ5SauMbKstgIzu/oPLHVz8supKChPNrlGeJwr
         9vfYKSS5w6JjnEK8rSOW3grwrwGzWa0QMcRhVeLlPaOShJRnWsJ4+Lv2jM1riW02lP/7
         er9X4ZXA7l2Zoldy+et+bY0QhIAhk/pqMlCiD3O9Pv30GADsJ4YBGqMQt0otH2yClqjC
         25VdTA5xoalT43R7SHqp5rx+cQZsE1Yp1zmPgL3jCr+UVuHHut4nOwLwRqMC84ir5j7h
         K2rQ==
X-Gm-Message-State: APjAAAVPOp6fiElMqxOcQr1e/uL3VegSjdKXDODkXck/Tv+/kMXn7eSR
        gNuPQCQnyywN6g796t5TpTu6iQ==
X-Google-Smtp-Source: APXvYqy06dfUmL6YeJyX0gzRHXOV+gw16shOwg0WfImzMkX6z1TQmab0bN6NRdoWpCgaaX3XisBOAw==
X-Received: by 2002:a63:8dc9:: with SMTP id z192mr28152038pgd.151.1567493976851;
        Mon, 02 Sep 2019 23:59:36 -0700 (PDT)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id b18sm18820190pfi.160.2019.09.02.23.59.33
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 02 Sep 2019 23:59:36 -0700 (PDT)
From:   Baolin Wang <baolin.wang@linaro.org>
To:     stable@vger.kernel.org, linus.walleij@linaro.org,
        natechancellor@gmail.com
Cc:     linux-gpio@vger.kernel.org, arnd@arndb.de, baolin.wang@linaro.org,
        orsonzhai@gmail.com, vincent.guittot@linaro.org,
        linux-kernel@vger.kernel.org
Subject: [BACKPORT 4.14.y 5/8] pinctrl: sprd: Use define directive for sprd_pinconf_params values
Date:   Tue,  3 Sep 2019 14:59:11 +0800
Message-Id: <8c7e95c293e81412a1dadc3c4376bafb45fefeeb.1567492316.git.baolin.wang@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1567492316.git.baolin.wang@linaro.org>
References: <cover.1567492316.git.baolin.wang@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Nathan Chancellor <natechancellor@gmail.com>

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

