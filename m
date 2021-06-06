Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5120D39D209
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jun 2021 00:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231175AbhFFWxx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Jun 2021 18:53:53 -0400
Received: from mail-pj1-f44.google.com ([209.85.216.44]:35664 "EHLO
        mail-pj1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231174AbhFFWxw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Jun 2021 18:53:52 -0400
Received: by mail-pj1-f44.google.com with SMTP id fy24-20020a17090b0218b029016c5a59021fso4202633pjb.0;
        Sun, 06 Jun 2021 15:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0ghfSYAN+EVP3Evuag496Y75PilLoCwuoOi7hPsLqYc=;
        b=YG/Yfwy1zoxzmE+xWEaMwB9gTsAEkBlTzYGyfRwUKRPPSxjROaP3kVXJZ4m5v8MO6V
         qz0hZajNLWlRNQrPpPOCIuHKOzQyWLfKT8yG+4H8RiI7vVu/oXL4HVod5h34ole+XFdm
         d9DKG1ohdY0VUR58DRbC2hTikScBbosrSJ4MhG77FqPK62VkInKzDnW+vFTf1aF6Xea6
         TtFs9VHINDbVWtPyYR7wvB0JY9anL75f+j+SJBp+JWfbYbsXimc2oghK8f1b5eq+H7cX
         w5HogQOWLZnBGg7jSiXE39gsbCB7cIoLOIvsoNlreQojMxMT6S0xLRi+fsixUvXZzV9L
         WUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0ghfSYAN+EVP3Evuag496Y75PilLoCwuoOi7hPsLqYc=;
        b=sHgaC/yplJpJpCxUkKyWopMQyienLH+oTAmm6izzoxM+zSY4zh4lqGbmJBPPwAJ2+h
         3+bEdnVHiEvJ4tt4lL/pJH8HkfEH3mYE83QRmANgkN6pt6husedbkOzb0hNLZH7qmFfl
         PMtOqi7196s2kSGnicBViz+DqiGLbKihd7KedZ3ZFYw/i/onQUOcMZXfhEqdxknC9x4R
         luznKaEtrH67XESrckKaJplFxumHHQC1KjZGzY+jQSvo/1mSlkvjPqPTzjXZBcrODWw1
         x11iyco5CXlN30yyXkF8WwUEiFN0rXg6brg7L5bOrchIJ7ylgfLMGWgQa+iOwWroROBZ
         NZDw==
X-Gm-Message-State: AOAM533Py4Mci9DzianEZ3UffDr8bZGzC5oEkkN65JOqZBfDwQjAL8JB
        EXcOTtBbtxUfJeoENAiTocc=
X-Google-Smtp-Source: ABdhPJye5Xj64abcuZKTgOddCODlLRmDQZCcbMQoSolTX1s/adTx35TeA9c7CfnBdrwWXvbWrbXfCA==
X-Received: by 2002:a17:90a:43a6:: with SMTP id r35mr28280553pjg.222.1623019849035;
        Sun, 06 Jun 2021 15:50:49 -0700 (PDT)
Received: from Crosshair-VIII-Hero.lan (066-188-147-045.res.spectrum.com. [66.188.147.45])
        by smtp.gmail.com with ESMTPSA id x11sm5553505pjc.26.2021.06.06.15.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jun 2021 15:50:48 -0700 (PDT)
From:   Chris Blake <chrisrblake93@gmail.com>
To:     ptyser@xes-inc.com, lee.jones@linaro.org,
        linux-kernel@vger.kernel.org, chunkeey@gmail.com,
        linux-gpio@vger.kernel.org
Cc:     Chris Blake <chrisrblake93@gmail.com>
Subject: [PATCH v2] mfd: lpc_ich: Enable GPIO driver for DH89xxCC
Date:   Sun,  6 Jun 2021 17:50:37 -0500
Message-Id: <20210606225037.26130-1-chrisrblake93@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Based on the Intel Datasheet for the DH89xxCC PCH, the GPIO driver
is the same as ICH_v5_GPIO, minus the fact the DH89xxCC also has
blink support. However, blink support isn't supported by the GPIO
driver so we should use ICH_v5_GPIO. Tested and working on a Meraki
MX100-HW.

V2: Updated commit message, and added Christian Lamparter as a
contributor.

Signed-off-by: Chris Blake <chrisrblake93@gmail.com>
Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---
 drivers/mfd/lpc_ich.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich.c
index 3bbb29a7e7a5..f10e53187f67 100644
--- a/drivers/mfd/lpc_ich.c
+++ b/drivers/mfd/lpc_ich.c
@@ -489,6 +489,7 @@ static struct lpc_ich_info lpc_chipset_info[] = {
 	[LPC_DH89XXCC] = {
 		.name = "DH89xxCC",
 		.iTCO_version = 2,
+		.gpio_version = ICH_V5_GPIO,
 	},
 	[LPC_PPT] = {
 		.name = "Panther Point",
-- 
2.25.1

