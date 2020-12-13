Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 538B12D8EA5
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Dec 2020 17:19:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728063AbgLMQSL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Dec 2020 11:18:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390872AbgLMQSJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Dec 2020 11:18:09 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C10EAC061793;
        Sun, 13 Dec 2020 08:17:28 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id a6so11611443wmc.2;
        Sun, 13 Dec 2020 08:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tBnar4EOBqUyAZ3eTgoIH+VVc0DkF/ERTYiHgxOAUMg=;
        b=vXlC2tVK0G+/3jO20C9qCbaoPVYJ0MvK1j4MBx3N4ODAPfbGuez+CtKGivf6iv8twt
         u2NErF0T+SwWSZn0ZFxak4Vy7+y3yzi23y/cy+WdOsr6tLUSCOY57lYFmIx1RutKUTCp
         ALjbGOJxorB+k97XV2a4uzfkGzyH0o04gEl5uQUUpRg695wy+VgxyCnplbjCkhdmrnMb
         tSMchwR0+c2/HYSSbLm3tkI4DWkjsazL8sd8w4bXIJpXzpcPc3LMQkIZ2zxcZKtNqXEA
         QX9Mw4iuJfmP9zNh0nkRUCPUReuZVkQaiC3TZZRBGoRlnrvZgyKILcecqMIW+0eRgAX9
         grtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tBnar4EOBqUyAZ3eTgoIH+VVc0DkF/ERTYiHgxOAUMg=;
        b=c8LhZ9WN8JGy4sPF1wlQ3j4VR7kFDQ0iKBPa3RX3eQRqXfQV8SQwc1AHIvsrqJ9Gl/
         taBLCOFe2SMeFu3g3CftOJHcDV4vhudqRjKSU2Cd+BLzUWSWmpvw+Tdbg+jWni+h8tV7
         VKUrmUO4AwVbJNWdxg/8K6+7kHLUyJ5kXtaQh+noaaNcY5AfSm5GfKOeimyjI2NqwG2w
         kHN5+whNpjPzG3Ugeq/B+oijEFzUfRxdd8GAFuPtdCGRsZm4/egdcHbrqY6mDGLJI4Bu
         mNPhi8iQaq5xj0YrpkO24S2GDVv1c3mZEejMYZL8+2YOymm4s03LE2a3FSswQhcM6pqF
         scrw==
X-Gm-Message-State: AOAM531AoZBWyz1PsAsqD9gZ3GzerEebH09EQLZnHCZ2sHMofJ+bbfbw
        AMZ3Zs/PXY43OpYUDHS5fXo=
X-Google-Smtp-Source: ABdhPJxhFTIYlZQiGHofApKmES4ojOpP9cIJyfrcT0+gwKkK8YImq+k0vM2L9reQYhpLSHyE8uj1jQ==
X-Received: by 2002:a7b:c24d:: with SMTP id b13mr17034601wmj.151.1607876247525;
        Sun, 13 Dec 2020 08:17:27 -0800 (PST)
Received: from localhost.localdomain (188.red-81-44-87.dynamicip.rima-tde.net. [81.44.87.188])
        by smtp.gmail.com with ESMTPSA id 64sm27102073wmd.12.2020.12.13.08.17.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 13 Dec 2020 08:17:27 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linus.walleij@linaro.org
Cc:     robh+dt@kernel.org, gregkh@linuxfoundation.org,
        yanaijie@huawei.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, devel@driverdev.osuosl.org,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 3/8]  pinctrl: ralink: rt2880: return proper error code
Date:   Sun, 13 Dec 2020 17:17:16 +0100
Message-Id: <20201213161721.6514-4-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201213161721.6514-1-sergio.paracuellos@gmail.com>
References: <20201213161721.6514-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Check for NULL shall return '-ENOMEM' instead of '-1'.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/pinctrl/ralink/pinctrl-rt2880.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/ralink/pinctrl-rt2880.c b/drivers/pinctrl/ralink/pinctrl-rt2880.c
index c933e1a1d4fa..6e0bf7c4837b 100644
--- a/drivers/pinctrl/ralink/pinctrl-rt2880.c
+++ b/drivers/pinctrl/ralink/pinctrl-rt2880.c
@@ -206,7 +206,7 @@ static int rt2880_pinmux_index(struct rt2880_priv *p)
 	p->group_names = devm_kcalloc(p->dev, p->group_count,
 				      sizeof(char *), GFP_KERNEL);
 	if (!p->group_names)
-		return -1;
+		return -ENOMEM;
 
 	for (i = 0; i < p->group_count; i++) {
 		p->group_names[i] = p->groups[i].name;
-- 
2.25.1

