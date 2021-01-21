Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FA692FECB3
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jan 2021 15:15:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727031AbhAUOO1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Jan 2021 09:14:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730498AbhAUOMa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Jan 2021 09:12:30 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB06BC061757;
        Thu, 21 Jan 2021 06:11:49 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id cq1so1729423pjb.4;
        Thu, 21 Jan 2021 06:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JW9ioCIv1CN9dpUff2ilq0NQobpsdFiEo872jSzvttc=;
        b=sM0Zc3BFMgdbbmHE1zL99lWNXAEQCe9dO0SmL8D6vGyplCcmDFwypzdp3ETeqDhhZU
         Py4skrSHON8cHlAhH6tkeWFttYjGCmtIHSyprak4njCt2rS131ihzlJvVfhZN3Ntlcym
         RspnvArUIhFJa5Prs2lmry1a8E5X1GEZKSkmKPzldX1AeagHTBK2gUYeMTyP1nbZidba
         pFxZcBjFSyInOCgdiRLTUuetskwOQodnHE2etMW8jWuLKOjEutlyzCAJ7123yiF77WfK
         E1CTsRFLHB6m+dNQpnIdmu0xdQ6LzBCyKTDbueK4H8/+xuNNg60iEDwnM7vvGNp0OdOQ
         CHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JW9ioCIv1CN9dpUff2ilq0NQobpsdFiEo872jSzvttc=;
        b=romdihtafJY3VKQb/eLrrqhyV6nU1YkwjtM0f8Onj43yPPxK793RxbdZD+QSbePjgm
         7fukyspWxkgei0GbMiAOLRVsGYc2GZb5QpehiwtdpDXPU1HfKdbmlXvrkmxLaXDDqFjW
         D2uDgcAZD0laLsJS4I17/NYn+MT3Qg0Fy9KpWZuwDHiHBmO/yFaS0EYVb526nRB0zrmz
         lM9HsIeWSs4Zjsccwm+4uyn3RkKe/UCf0qgJJQwDh4lzz0WSGvE56zyakfr1/KUIeLX0
         hPV2mRhspGQx890kQ/rs+P/GdWROzeXBBGsnccbioI7DxbVJ2DypPKDsInXVGCskg7TT
         H+sg==
X-Gm-Message-State: AOAM532EDnm0bzFx++JfoM3F9bzIG3ilDo/9qqXNl3YgBDybXZ0mtKRT
        vl0OdnuizpDowoVoSs9Om9WEb7JP6Gw=
X-Google-Smtp-Source: ABdhPJzXsn55/jY7ozsATzA5BnKppJMkXwN41LkGVQZQ56JfkWzr5tYZ6C8xRGuGkwtuTWoolucZnA==
X-Received: by 2002:a17:90b:23d3:: with SMTP id md19mr12125902pjb.119.1611238308915;
        Thu, 21 Jan 2021 06:11:48 -0800 (PST)
Received: from sol.lan (106-69-181-154.dyn.iinet.net.au. [106.69.181.154])
        by smtp.gmail.com with ESMTPSA id c11sm5339699pfl.185.2021.01.21.06.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 06:11:48 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH] gpiolib: cdev: clear debounce period if line set to output
Date:   Thu, 21 Jan 2021 22:10:38 +0800
Message-Id: <20210121141038.437564-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When set_config changes a line from input to output debounce is
implicitly disabled, as debounce makes no sense for outputs, but the
debounce period is not being cleared and is still reported in the
line info.

So clear the debounce period when the debouncer is stopped in
edge_detector_stop().

Fixed: 65cff7047640 ("gpiolib: cdev: support setting debounce")
Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 12b679ca552c..3551aaf5a361 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -776,6 +776,8 @@ static void edge_detector_stop(struct line *line)
 	cancel_delayed_work_sync(&line->work);
 	WRITE_ONCE(line->sw_debounced, 0);
 	WRITE_ONCE(line->eflags, 0);
+	if (line->desc)
+		WRITE_ONCE(line->desc->debounce_period_us, 0);
 	/* do not change line->level - see comment in debounced_value() */
 }
 
-- 
2.30.0

