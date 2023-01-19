Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70757674714
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jan 2023 00:20:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbjASXUF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Jan 2023 18:20:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229984AbjASXT3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Jan 2023 18:19:29 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC1FE210D
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jan 2023 15:19:05 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id dw9so3949970pjb.5
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jan 2023 15:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=/ilKkanRDG4JMRNJZhSyuGw6MOjoRO1ltuCrj5OHYBY=;
        b=KomxW5KBKUvMS5CoWsHvbbq4yFDHmnfeYOztiq4v7c0Q+IHeAbP8E94IMSj4tCaqQD
         NgVwjQE+76ApcD8SPrWM9BXiHyHo/sHhrRpyhmBLXd3i1R1kaxOw2MnQUzUdaVxieuou
         xA2PHLZXvvGhxA8INYYJdznR0NAzXfB0sKnWqnZNijeXeYypiszihn0/tHxwLip5TCNW
         0T5l9IdRhT9UqK5dvlXqL85rIcgoiFkfx/1jbbA9ds3W0Warba42nTAxpZMpxJBqchEb
         N/4TOjVSWjBGdRn9GqSgpSvCh/drClfhqtQ6K3j6g595MPEZlaGzHZ9Z3lR31IdNidy1
         WSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ilKkanRDG4JMRNJZhSyuGw6MOjoRO1ltuCrj5OHYBY=;
        b=6PBPnJMzj28hcLg51RRUi9Ycvy7ftKjPtQ93ioOjo3XTGog44rcGMH/SLNqRvXld9w
         b+fouFn8ia1emnnOFd/XJ4/sxmiUdJCXVs+JcJ+Lsy7hsV0eFUw4W+ih7/4VdutwspIv
         CViiSkDYfYwuOL1q8ICN+XA4/cJnMnsyX0VvEeI/SGFqEV9PjZ2RkZRfI/dp9d+Hw2zl
         ydtoL2BbYsPv50fnmDd89qNrwvXDwn8ieJbe8KX9VRiQsnwIM0tkxfaFeeOob3UO4IYB
         U/RMR9hF5dD+Vpul7U0brGXecBcvOj7FogKn6753G8XjX34yXZfvG9VFOjEOdESAMoZy
         hWXQ==
X-Gm-Message-State: AFqh2krd4+SiP/ONcUUucbcH1oAK0SiAa/N16vvHXmtF8+oUfCRzpbmM
        lrsqxKUs4amzvBr+99HxnakxhUsu6Rg=
X-Google-Smtp-Source: AMrXdXvSOLIuxoj4Y7RvpgKZSKJxrOxqjeUcCBbc/3tk2GwQVVfsxG++z8XzJce6HBomoV1QGhkdNw==
X-Received: by 2002:a17:902:eb44:b0:194:84eb:290a with SMTP id i4-20020a170902eb4400b0019484eb290amr13223485pli.50.1674170345106;
        Thu, 19 Jan 2023 15:19:05 -0800 (PST)
Received: from voyager.lan ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id h11-20020a170902748b00b001948ff5cc32sm597586pll.215.2023.01.19.15.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 15:19:04 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From:   Joel Stanley <joel@jms.id.au>
To:     Andrew Jeffery <andrew@aj.id.au>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org
Subject: [PATCH] pinctrl: aspeed: Fix confusing types in return value
Date:   Fri, 20 Jan 2023 09:48:56 +1030
Message-Id: <20230119231856.52014-1-joel@jms.id.au>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The function signature is int, but we return a bool. Instead return a
negative errno as the kerneldoc suggests.

Fixes: 4d3d0e4272d8 ("pinctrl: Add core support for Aspeed SoCs")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index a30912a92f05..f93d6959cee9 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -113,7 +113,7 @@ static int aspeed_disable_sig(struct aspeed_pinmux_data *ctx,
 	int ret = 0;
 
 	if (!exprs)
-		return true;
+		return -EINVAL;
 
 	while (*exprs && !ret) {
 		ret = aspeed_sig_expr_disable(ctx, *exprs);
-- 
2.39.0

