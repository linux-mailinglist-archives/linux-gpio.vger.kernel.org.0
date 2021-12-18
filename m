Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1700B479B96
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Dec 2021 16:27:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232660AbhLRP1U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 18 Dec 2021 10:27:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53237 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233479AbhLRP1T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 18 Dec 2021 10:27:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639841238;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=86SiuzQkzNAn+schu4EkUzziC+m9VbK+PfQYtTZrNxs=;
        b=ZrVUHF6HLgZ7wh7/OiE+1vo0xPtBD+rUQ/6kkd5ZX6wnTzyAbohjAVnkDFMBWAuLFYHN8S
        iCSc5En6mKkzVMhqO9E3zD88rNvmp+kYVW+YbGM/l9wuzuRhiUK7w8NWJiKe5vEWXvfunM
        DQsdmmHKYK26gDIiWTBU/xYBgDJBhww=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-iyyLkN2KNgyYdpMeIQjGLw-1; Sat, 18 Dec 2021 10:27:17 -0500
X-MC-Unique: iyyLkN2KNgyYdpMeIQjGLw-1
Received: by mail-oo1-f71.google.com with SMTP id i27-20020a4a929b000000b002c672a291dfso3419584ooh.23
        for <linux-gpio@vger.kernel.org>; Sat, 18 Dec 2021 07:27:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=86SiuzQkzNAn+schu4EkUzziC+m9VbK+PfQYtTZrNxs=;
        b=su5VJTXVDi/N0hpgv256N3BtGcVKpGt93pDsF+69oEP4xJomE1XBS9aCYWWBD3H8Ws
         v2PaS/xdglW8f3n4gPmb0X4/H/o3Nz2g8fwlZlFvKxdN0Q8i459kUG/owFdBdEI07ai2
         k5xBkU3jsZLmOisf9TILdAgzupxcf9V4Gtd9R0lLRDbCBzj8XKziwVCFWSEBvjEMS3I7
         CCUNNE8ph2otGmLGyNknLwgcxNmKn/5yzOZfVUhgKM9gCyNnAmSIFUaSE42elKMPAUa8
         CxgWiX/OK0uE926QLENVPTnXuN5eTzTsFU0o+p0Wbho6p/8enNKqsrzO2BGGqC8owmbG
         Mwqw==
X-Gm-Message-State: AOAM531YsmKpOnYmlLTMdlKJq0V8V3GYa5SB+SOEuGH7utEPoFDeHNVe
        751RDKj0jmMN0W9+vSB+UnNbvHu3cYDUgMIPOzZmVt33ErZk1Jc3iaFJtnnVqU5sYQxtP0IgVs9
        YRAAmMAXcM71anOnGxFxnnA==
X-Received: by 2002:a05:6830:1258:: with SMTP id s24mr5798779otp.226.1639841236961;
        Sat, 18 Dec 2021 07:27:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQXs8/YlLAB/Dah8N/DouTHOvgWlTfYorr/QdF2xSDDW13RsfjVj/NVWwFUZ/bdOydpAXgVQ==
X-Received: by 2002:a05:6830:1258:: with SMTP id s24mr5798767otp.226.1639841236770;
        Sat, 18 Dec 2021 07:27:16 -0800 (PST)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id z12sm2161206oor.45.2021.12.18.07.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Dec 2021 07:27:16 -0800 (PST)
From:   trix@redhat.com
To:     linus.walleij@linaro.org, brgl@bgdev.pl, nathan@kernel.org,
        ndesaulniers@google.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, Tom Rix <trix@redhat.com>
Subject: [PATCH] gpio: sim: fix uninitialized ret variable
Date:   Sat, 18 Dec 2021 07:27:12 -0800
Message-Id: <20211218152712.2832502-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Tom Rix <trix@redhat.com>

Building with clang returns this error:

gpio-sim.c:889:7: error: variable 'ret' is uninitialized
  when used here

ret should be the status of the call to
gpio_sim_make_bank_swnode stored in bank->swnode.

Fixes: 83960fcf4818 ("gpio: sim: new testing module")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpio/gpio-sim.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index ef6145f51c8ae..bef00dcc4dc8f 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -886,7 +886,8 @@ static int gpio_sim_device_activate_unlocked(struct gpio_sim_device *dev)
 
 	list_for_each_entry(bank, &dev->bank_list, siblings) {
 		bank->swnode = gpio_sim_make_bank_swnode(bank, swnode);
-		if (ret) {
+		if (IS_ERR(bank->swnode)) {
+			ret = PTR_ERR(bank->swnode);
 			gpio_sim_remove_swnode_recursive(swnode);
 			return ret;
 		}
-- 
2.26.3

