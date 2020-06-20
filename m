Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B97D0202711
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Jun 2020 00:42:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728476AbgFTWmE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 20 Jun 2020 18:42:04 -0400
Received: from mail-qv1-f68.google.com ([209.85.219.68]:44172 "EHLO
        mail-qv1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728113AbgFTWmE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Jun 2020 18:42:04 -0400
Received: by mail-qv1-f68.google.com with SMTP id g7so6248304qvx.11;
        Sat, 20 Jun 2020 15:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=SoKNo8yPIy9RNdx7/9iXU9ePzHMIl0jPpiq/Y06wE3Y=;
        b=jSn8WTupnx+h0peQ6avv5VNdLe7ZKf+7lY5f/vQUlWtqXuoRyW+MKKmtWMNzR438D4
         drv/FvPk8DHkRBQ24A5pLzQw2iwc+7RzASk5/DrbYm450MwrTDruEAH5E/KwR8xIRltC
         rsd0v2cSx/IBZjM7IwStVDt1R49t1HWVZ7NiC9fmUVx3krOBxgB+8n54GXDQsY1AuNwx
         DXKw6lM2jKjLx+gpv8ERrxZqZIcNlKQk95huSkK90y2RlPXRMFjsJ+AHYsvYcAFFUM6N
         Jl5/3RkbXPPWCSLGhWNiTWxoH1xCUPJrb1AqjrEvwtx4Fcj4Eh3v1peFXDAqFSkHHGPp
         KxFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=SoKNo8yPIy9RNdx7/9iXU9ePzHMIl0jPpiq/Y06wE3Y=;
        b=ZGjfqbpgKv45tnJItcyu1QZgnaylPmUYRleOphzdPdhvC9Svsx5vSDtk9u8Ij+bp/T
         1ACyx3B5s9vIODVb2B+bbzb56XK/E8qnEwvR3YqflbS+6xYkwl/iaO/cZwhXEuV5SDg7
         fgLAeWzr62iHATNvUjz/oySPNbThRAtxSU0iqg4wewuC+AfIXaEKe5up01irA+4/+6iv
         Km69o1bPbL5QTtVsjymizxdcbmZ0svjXNMf1zd1purdyPz/pG0LyJjYKL6U76blXMgvW
         K1WIsBKNyfCuIkwQFCGZG/wQL2B8pVKFk++OI+f76/7WqmnC48d+inCwVfyYJLcXvk15
         E0IQ==
X-Gm-Message-State: AOAM531fBDeJ7LXGpwcILXFV+RanBPld1bmZUZmgjV13ASAi155+XIjb
        0TkEOiPCCMV4puwSqn/s/ok=
X-Google-Smtp-Source: ABdhPJyzxnMOSjaf0UcG8R3kB+eBooW88SM0KkzIocPQAuwAfERtMeOFBdlxVdpH73LeWPAg7opC/Q==
X-Received: by 2002:a0c:c303:: with SMTP id f3mr15440201qvi.240.1592692862877;
        Sat, 20 Jun 2020 15:41:02 -0700 (PDT)
Received: from linux.home ([2604:2000:1344:41d:68f8:1450:6217:e25])
        by smtp.googlemail.com with ESMTPSA id p22sm11248031qtc.7.2020.06.20.15.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 15:41:02 -0700 (PDT)
From:   Gaurav Singh <gaurav1086@gmail.com>
To:     gaurav1086@gmail.com, Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] max732x_probe: remove redundant check
Date:   Sat, 20 Jun 2020 18:40:53 -0400
Message-Id: <20200620224054.23840-1-gaurav1086@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200610113630.11922-1-gaurav1086@gmail.com>
References: <20200610113630.11922-1-gaurav1086@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pdata is already checked for its validity.
Remove the redundant check.

Signed-off-by: Gaurav Singh <gaurav1086@gmail.com>
---
 drivers/gpio/gpio-max732x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
index 5fb0bcf31142..63472f308857 100644
--- a/drivers/gpio/gpio-max732x.c
+++ b/drivers/gpio/gpio-max732x.c
@@ -703,7 +703,7 @@ static int max732x_probe(struct i2c_client *client,
 	if (ret)
 		return ret;
 
-	if (pdata && pdata->setup) {
+	if (pdata->setup) {
 		ret = pdata->setup(client, chip->gpio_chip.base,
 				chip->gpio_chip.ngpio, pdata->context);
 		if (ret < 0)
-- 
2.17.1

