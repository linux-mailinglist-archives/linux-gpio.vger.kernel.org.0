Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D5642FE2CF
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jan 2021 07:27:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbhAUG0r (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Jan 2021 01:26:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726821AbhAUG0k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Jan 2021 01:26:40 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 252BFC061575
        for <linux-gpio@vger.kernel.org>; Wed, 20 Jan 2021 22:26:00 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id n10so703350pgl.10
        for <linux-gpio@vger.kernel.org>; Wed, 20 Jan 2021 22:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NJxqFT+5qx53zphJZqNCcKwlvAjoGdjphcdT6milPrE=;
        b=ZLcWa7hqgwXCCjlSVXumhxDRuVAzD3Z/O/SEbVb3WNo9rjVWosgNMjemgyCAAiq2Qi
         GV1zPwxD8n8EbbrsgB7j8reHho6elKprcS8MNKhx3R5FssxXBB0ZywjW8bDvCEufEFSj
         ATbU38QHRqbznfReOl2/65UasfWLbdNhL9zuL8zhGH7vsWk5wmqgiKop2YIPYMEF3sS7
         h8Xo43I4MZ6vmyrcmNE8OZHu6Kf8GvA/+ZW2MlseqXu0vtj+3rXtbKB45nDLRc5lJISQ
         BheUw9BAoA9nm/YvU3JYBzXP+MmElhMzuXDXfIAZxb1rxHO3c8fbNU2e6D5/8CKdpkxV
         OAjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NJxqFT+5qx53zphJZqNCcKwlvAjoGdjphcdT6milPrE=;
        b=Ljh2w9UA6hIA3mYAubJ3IdW2PMMgtgfDgL6Y5zxFOx4HSxH/Bb1R3rtcfcMioy7nlO
         rvonzq0sDn8Bz0CZyVLvYlyfvq30RNVexdhY3p28/zvRjPNmu0p4uWoUfzO/UZSIAOAS
         Gd/DrKrfx2HpRhA1qagl86tZ1tPv0IVgTqz8bDoFJ9eZhDJZbZeSbluhXf5VGjhAh4yw
         PFyv88+OgXHpBBZ8zCViPFPyp82AD1AMzesk4EM/9YR5SXqxEcK7e5gxC9rbFLbQFr5v
         EiU9Nt8VxAzNsG8LvkuvUALmozayhoxAkL3lF9QurIQkPwKh2nQEyW+jH3t25m8UcQlB
         Polw==
X-Gm-Message-State: AOAM531KxNzozEzeY/d1dyI1iJFr+vp2YiL8KggmDZCI+ZguZa/5N70d
        ZfSJY3KXNbIo+xvFroTPq+MY
X-Google-Smtp-Source: ABdhPJyQ0dm+7soCPKNjt7VdaMA7zt7NaoBhCMhSkEUDUvu/UNSoNl2F3mz1tAb957LKZW2T/AkM1w==
X-Received: by 2002:a63:e058:: with SMTP id n24mr487228pgj.345.1611210359556;
        Wed, 20 Jan 2021 22:25:59 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6182:23c4:4d5:e6d9:fc7e:c8e2])
        by smtp.gmail.com with ESMTPSA id b26sm606498pfo.202.2021.01.20.22.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 22:25:58 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     linus.walleij@linaro.org
Cc:     afaerber@suse.de, linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, cristian.ciocaltea@gmail.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] pinctrl: actions: Add the platform dependency to drivers
Date:   Thu, 21 Jan 2021 11:55:47 +0530
Message-Id: <20210121062547.27173-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The Actions Semi pinctrl drivers are a mix of both ARM32 and ARM64
platforms. So let's add the correct platform dependency to avoid them
being selected on the other.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pinctrl/actions/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/actions/Kconfig b/drivers/pinctrl/actions/Kconfig
index a1d16e8280e5..8bb8345b17da 100644
--- a/drivers/pinctrl/actions/Kconfig
+++ b/drivers/pinctrl/actions/Kconfig
@@ -12,18 +12,21 @@ config PINCTRL_OWL
 
 config PINCTRL_S500
 	bool "Actions Semi S500 pinctrl driver"
+	depends on ARM
 	depends on PINCTRL_OWL
 	help
 	  Say Y here to enable Actions Semi S500 pinctrl driver
 
 config PINCTRL_S700
 	bool "Actions Semi S700 pinctrl driver"
+	depends on ARM64
 	depends on PINCTRL_OWL
 	help
 	  Say Y here to enable Actions Semi S700 pinctrl driver
 
 config PINCTRL_S900
 	bool "Actions Semi S900 pinctrl driver"
+	depends on ARM64
 	depends on PINCTRL_OWL
 	help
 	  Say Y here to enable Actions Semi S900 pinctrl driver
-- 
2.25.1

