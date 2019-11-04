Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53F3BEE406
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 16:39:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728392AbfKDPjb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 10:39:31 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:46605 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727891AbfKDPja (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 10:39:30 -0500
Received: by mail-pf1-f196.google.com with SMTP id 193so11121241pfc.13
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 07:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RFonsfzsFJDEDDj0KVoaMXdViXF1/jFMFFTbqbNe28g=;
        b=PUkYUlk5lyo4VfBYdLMm+5Y5h7KChZzPk5YmU2Tki8dN4z3c8nrvq+wXuIn+OzhEwg
         dXdHCfeWO1x9F1MxsiLmRJFd5eJI/iT8d0t1Egx4rYGzFoJrtbeZRwCq/9F7vdyLLDUT
         bmjSBEYVZwgy9xNTRmcX5vCZ/Pd99Y5cYm6H6N4GDEAu3Zoi6NW+GjWapUOzVWM98sJ/
         ivi+YA4y+qzg7nBJY6lPr8wgukXP5nWHE5ntexq0u3vf8yg+kOpJVxqnheyWYsPlPfC6
         2sad1u2OKltSIDDiRnm9icnu07PVP14PolOVpgXuikHj+e8qdBhAohuUJek/vz2hBVUd
         03SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RFonsfzsFJDEDDj0KVoaMXdViXF1/jFMFFTbqbNe28g=;
        b=preUAMOUHE0pnZxBp3rxwt38miZmJrCfR6cp35vxBFqRGWBYJiqBfTODpkJmbJ/fYJ
         nJh0l7O/VwwjBSOhIU0qeReKnLL38luLaR8WB9CFN0eSLMeFlaLcnp/DUrn9BSZKF9ic
         5RuH4F3+LfsDUbAdtjf5KJJwjfaglZ2V6Bl+IyryfgEwL7w7EhCh+s18pJ0qCDJsjHyA
         dZmc1VcyG2hszXITotCZ+D1FswBiey1kjlr7xBu/YOrXSCFstRsAk/tSbUKP67RsAHoA
         jX+c/2YsvoE0ouZyYyTVv6t+DDSUmBOXZo7TcflK6VMmRU1X292tGOCQfl/560/mmmNF
         wUIQ==
X-Gm-Message-State: APjAAAU0FvPtqm/Lf4KF4midbSdp6HoY4gPnUju7FXOAu+cT2DXyo/ae
        5QITax2kjaLIlCsb6H891fPcljKo+sGdxw==
X-Google-Smtp-Source: APXvYqxrh8fCSK6FrZso+g7Dp2Ljr+UUDAoVhOm3JcfAA5YNMIZwKFkZ4vzIUKECRl3lVNZ+YBPokw==
X-Received: by 2002:a62:2942:: with SMTP id p63mr24507019pfp.110.1572881969764;
        Mon, 04 Nov 2019 07:39:29 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id a66sm5819761pfb.166.2019.11.04.07.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 07:39:29 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org, bamv2005@gmail.com
Cc:     drew@pdp7.com, thomas.petazzoni@bootlin.com,
        Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v5 2/7] gpiolib: add support for pull up/down to lineevent_create
Date:   Mon,  4 Nov 2019 23:38:36 +0800
Message-Id: <20191104153841.16911-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191104153841.16911-1-warthog618@gmail.com>
References: <20191104153841.16911-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for pull up/down to lineevent_create.
Use cases include receiving asynchronous presses from a
push button without an external pull up/down.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 035022bf0ef9..7dfbb3676ee0 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -950,6 +950,10 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 
 	if (lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW)
 		set_bit(FLAG_ACTIVE_LOW, &desc->flags);
+	if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN)
+		set_bit(FLAG_PULL_DOWN, &desc->flags);
+	if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP)
+		set_bit(FLAG_PULL_UP, &desc->flags);
 
 	ret = gpiod_direction_input(desc);
 	if (ret)
-- 
2.23.0

