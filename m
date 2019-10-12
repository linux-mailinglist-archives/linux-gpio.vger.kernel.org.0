Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B447D4BFC
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Oct 2019 03:57:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728608AbfJLB5I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Oct 2019 21:57:08 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33548 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727345AbfJLB5I (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2019 21:57:08 -0400
Received: by mail-pf1-f194.google.com with SMTP id q10so7107970pfl.0
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2019 18:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xpqXB5DVOgvUUCUlvpMuCi1tvRwuyVvNOfMh9KSgay0=;
        b=FXBe8TrlXaPSbSZFRa74CyAwD/RIiwsTRExQike+lb545vTKzaSUNRtxdVZlhIDDB8
         Tnd4J/zBpYTu6Zk07hQONVpl6VSBLECmSk2DYKgwubCEcVfbff39k63yItypzrj0PlAz
         8wDUHyvQBozP801GhOMTvOcvj3OZs8qhph2qz316C8GdBCj5upKm741sD5LEQe78XeGy
         8kpSJFxdfncsE4VcuJvw/Jg+AE4pYhwtAhXY4j+ODY/SvLZahzN2llB/JH4kBdeQX4zj
         j7hEqmZxmpA88ZL1PBtXuFahki3Yl3ym4QoGe3bVz+PYuQrp4jRlJcNCGWiaUQAm5/YY
         1xcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xpqXB5DVOgvUUCUlvpMuCi1tvRwuyVvNOfMh9KSgay0=;
        b=RKV2sEy4JiCAhIQjkqMI1jgrImVQgkSJ19xZfIXrK3yOXdi8ZZbmxkgPmPMtCM+GDY
         ahPNp8Tx7XQwIoibmkYVVgPQGdrBhpyDwGoycFdtEa/pPsLi3qMVAAKUpnMj/Ke+0XDl
         U3RUEqzhfU2O5NEwgIJ7iF5to9Kql7kKkJ7ckBE7f86XhauVmpc58M+OaGS+lUGvrSSv
         y7Wou4CPxufrsy/75XSr0AAkXHPM7tbggk2GWT3EkqTW2VvYMo1zILnQF3kj3fcgEMfH
         LVmBQ2gF8cVi0VT6FEypJhxhX/kksJCNb31de7QFmL4y4r4qh3AxYNwBnIiE/YEmIwRN
         LYZw==
X-Gm-Message-State: APjAAAVXb6RPwXdMiPHkk9RnhEF3NqUquWmim+rhhtvWRpTfqndtG/rZ
        2XlVhWzXCpq3SW7xk/T9Kv+2H/9CCX6N8A==
X-Google-Smtp-Source: APXvYqw0AfFcuzmcit425jS34oNLhDguYWe8vU3poxriTG/943NPf+dEJxdoVUv1Xop3afc1iNrmrg==
X-Received: by 2002:a65:5bca:: with SMTP id o10mr19688070pgr.74.1570845427148;
        Fri, 11 Oct 2019 18:57:07 -0700 (PDT)
Received: from sol.lan (220-235-84-126.dyn.iinet.net.au. [220.235.84.126])
        by smtp.gmail.com with ESMTPSA id b20sm12042242pff.158.2019.10.11.18.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2019 18:57:06 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl,
        linus.walleij@linaro.org, bamv2005@gmail.com
Cc:     drew@pdp7.com, Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v2 4/6] gpiolib: pull requires explicit input mode
Date:   Sat, 12 Oct 2019 09:56:26 +0800
Message-Id: <20191012015628.9604-5-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191012015628.9604-1-warthog618@gmail.com>
References: <20191012015628.9604-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch prevents pull up/down flags being applied to as-is line
requests, which should be left as-is, and for output mode for which
setting pulls is not currently supported.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 053847b6187f..647334f53622 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -559,6 +559,12 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 	     (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)))
 		return -EINVAL;
 
+	/* PULL_UP and PULL_DOWN flags only make sense for input mode. */
+	if (!(lflags & GPIOHANDLE_REQUEST_INPUT) &&
+	    ((lflags & GPIOHANDLE_REQUEST_PULL_UP) ||
+	     (lflags & GPIOHANDLE_REQUEST_PULL_DOWN)))
+		return -EINVAL;
+
 	lh = kzalloc(sizeof(*lh), GFP_KERNEL);
 	if (!lh)
 		return -ENOMEM;
-- 
2.23.0

