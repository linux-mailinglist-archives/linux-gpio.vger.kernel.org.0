Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4F59283091
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Oct 2020 09:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725966AbgJEHEK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Oct 2020 03:04:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbgJEHEH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Oct 2020 03:04:07 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A541BC0613CE;
        Mon,  5 Oct 2020 00:04:07 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id az3so1781874pjb.4;
        Mon, 05 Oct 2020 00:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kQB2CpbEwKXkoeu2vbRv7Gb4T73FH3iFlUmGjPpa5t4=;
        b=eUjcrIU9R+jLvn03NfuE/m1MSS+2jECwGtWjQpd9a0CE9NW87bvfzlTBcaRde/aaG3
         JZHvX0KJ77gGTqzozDQcVCu3hH+mefovoCx8VLJ5kvfG0KkMdQaRCxJ0RVz0CNGMrO7v
         P7mzQ8+/m0dJOn9Zh2KVTSCFSphw/GQf+Xl3abh2a6eqwvldlSpAiPTEvxKyoMU+PcwU
         AU/IfrGYyxr+hjSqYV7PlW5JU9w76cJz1m8OCA2nv/SoQfsMITVtCMMNJM0zJWE8bWXk
         /ylXjekEuLveXxXQFtcumB+HsLnx+oI5kuiDNJJBcpItm7k+Eo0PJ1SyLqPUr+Nihv22
         MEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kQB2CpbEwKXkoeu2vbRv7Gb4T73FH3iFlUmGjPpa5t4=;
        b=jhMpz8FXOfsGvBSaaZUhgPBCXB1jI/Yen8ysUg/qRI/khWWZeh294S2dTDjfMEJZgP
         foZ4nhhxeyBNCGgmg+3HFe/ay7TUh0CQKOIqDlDvh1rE7rDsoH+j9QEXE1n8jDEVmRov
         xD0kXkKArlfYld51LtSHTWje5sQLAIPZehxLR5GxhTLtY2io32qy2EWWw52ZUW777D6E
         IpIuE0HGu00nXWwy2ZyDXJaj4a5+VkIB2zzwiQSy5SGWhl1DGuWU9y3go4ccJvHqYYYz
         cDHG6VitqFTBalSb8YswgBnpt6CRex1C1gPgCR1UMMeH/vx0a/GCmaCm6aYLH8eINOFu
         K9eQ==
X-Gm-Message-State: AOAM532PP50xb42/rY3FY2LENqfwaw/N9u7L11UGv+LPWQmgu7jJpQnr
        oA9J8Fh7Bik8nVCIe0eF8jaoEDfk04r7Sg==
X-Google-Smtp-Source: ABdhPJywvW8Cv6mx1JWYM8TW+C69Pi0G6nYTsL3fWBKKQ1OKtq9v3hWrkJQSTWnRoHBChtkxWT14dA==
X-Received: by 2002:a17:90a:203:: with SMTP id c3mr15067444pjc.149.1601881446884;
        Mon, 05 Oct 2020 00:04:06 -0700 (PDT)
Received: from sol.lan (106-69-166-86.dyn.iinet.net.au. [106.69.166.86])
        by smtp.gmail.com with ESMTPSA id 78sm6868764pfz.211.2020.10.05.00.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 00:04:06 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 4/5] gpio: uapi: remove whitespace
Date:   Mon,  5 Oct 2020 15:03:28 +0800
Message-Id: <20201005070329.21055-5-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201005070329.21055-1-warthog618@gmail.com>
References: <20201005070329.21055-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Remove leading whitespace in ABI v1 comment.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 include/uapi/linux/gpio.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index 32dd18f238c3..ad3f56dd87ec 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -292,7 +292,7 @@ struct gpio_v2_line_event {
 };
 
 /*
- *  ABI v1
+ * ABI v1
  *
  * This version of the ABI is deprecated.
  * Use the latest version of the ABI, defined above, instead.
-- 
2.28.0

