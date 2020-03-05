Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1003717AE03
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Mar 2020 19:23:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbgCESW4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Mar 2020 13:22:56 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51273 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726111AbgCESWz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Mar 2020 13:22:55 -0500
Received: by mail-wm1-f66.google.com with SMTP id a132so7470671wme.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Mar 2020 10:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kresin-me.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=Fka8imS/1xK6KJNhtftXLfBrbLrzvdMLMZpCkl8cR10=;
        b=iWLNpIoER9UnuztnR+05HmzAnfkAl3NxxjdwsiL9JsUcDyjTQ+V13sJDvRF/CwMzp4
         o7gU/oN9zypjyyHUlSeZUAIP5obBfz+5CN3Z4B9+bodo9PsjTV3RbEadDxdJzocUxJxz
         8XXzco+fhfKO3iq7fq6PYjmvJx/a4mVZ6tef1hhUyeZCNPGBxZnvNokhMORxph8P535M
         4nwDuBxd3Jnqx0pBWanAFthwus7h1F4uRjM3ARF/qw7ixwaZfhfGeVI+vqi+mTTGoQYy
         wR8FZJ1UXkCx0EYIe5Jp+fyYPhf6U5MJk8HnSvx8PIVjXdmdoMYhWH4Ym+7Urr5CFQ2s
         xnaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Fka8imS/1xK6KJNhtftXLfBrbLrzvdMLMZpCkl8cR10=;
        b=HuWlkdDHrD4Kt1xv/uYuQwSlpuk+7oro+9iK2H28dD2S96m0nL+IsCAfr1XznEw1ya
         VbRM8JjiA+GGYLBqbJPSALh6zcpZNBdp4oKtD/xsLb+uMIrQPbRzba5VwxkmaPmti8vc
         S+if/5RzDcmLkItwy6TdicolMOkaz8crSk2aj3FqQc5iawD8Mi7K1KWatfL5b7vvmrvL
         64yl9g8othWs7tEzgaTwxb4KpGh0MCxhOe+QPdazZwhFDU/Ji3VTF6d41flkfGtVco01
         X3mMNqs9I+LZk4ZjBCqRn4E9czMq8Ze5R35Iw/tLlc+/8lTXawYzlAviP3JWDxX1oRpX
         h7CA==
X-Gm-Message-State: ANhLgQ2nGv5ZyxJMz4VaDRzIhaeKKGLgdklUKC9Lv4hglpHktpazgO+R
        gCPHdsApGuIJZcHkxnN1+4rL0A==
X-Google-Smtp-Source: ADFU+vsIJFiHCoLIv+/msfzl/lI5ZtLr2/v7pFClpu9/Qs0qrq4bL/6WVmA9WiCBf4ySO/dBx+hrzQ==
X-Received: by 2002:a1c:9802:: with SMTP id a2mr57168wme.117.1583432573971;
        Thu, 05 Mar 2020 10:22:53 -0800 (PST)
Received: from desktop.wvd.kresin.me (p200300EC2F0EF80014FA05E763F3370C.dip0.t-ipconnect.de. [2003:ec:2f0e:f800:14fa:5e7:63f3:370c])
        by smtp.gmail.com with ESMTPSA id a5sm10540509wmb.37.2020.03.05.10.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2020 10:22:53 -0800 (PST)
From:   Mathias Kresin <dev@kresin.me>
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: [PATCH] pinctrl: falcon: fix syntax error
Date:   Thu,  5 Mar 2020 19:22:45 +0100
Message-Id: <20200305182245.9636-1-dev@kresin.me>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the missing semicolon after of_node_put to get the file compiled.

Fixes: f17d2f54d36d ("pinctrl: falcon: Add of_node_put() before return")
Cc: stable@vger.kernel.org # v5.4+
Signed-off-by: Mathias Kresin <dev@kresin.me>
---
 drivers/pinctrl/pinctrl-falcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-falcon.c b/drivers/pinctrl/pinctrl-falcon.c
index a454f57c264e..62c02b969327 100644
--- a/drivers/pinctrl/pinctrl-falcon.c
+++ b/drivers/pinctrl/pinctrl-falcon.c
@@ -451,7 +451,7 @@ static int pinctrl_falcon_probe(struct platform_device *pdev)
 		falcon_info.clk[*bank] = clk_get(&ppdev->dev, NULL);
 		if (IS_ERR(falcon_info.clk[*bank])) {
 			dev_err(&ppdev->dev, "failed to get clock\n");
-			of_node_put(np)
+			of_node_put(np);
 			return PTR_ERR(falcon_info.clk[*bank]);
 		}
 		falcon_info.membase[*bank] = devm_ioremap_resource(&pdev->dev,
-- 
2.17.1

