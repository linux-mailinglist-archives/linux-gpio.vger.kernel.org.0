Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77EC044A83D
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 09:20:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244018AbhKIIXT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 03:23:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236169AbhKIIXP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Nov 2021 03:23:15 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 202AEC061764;
        Tue,  9 Nov 2021 00:20:28 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id 188so5434165pgb.7;
        Tue, 09 Nov 2021 00:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o1cvMhjy6fdnuouwYm+15BaMU3WeB3ZqppuOOP+IdbA=;
        b=KrG0sirAsWEagpBbEX8nQZ7FYPIbK2kuzVYFkDj7ZtE6HGj8SrUPiR4/RDOQKT+OY3
         fdW9RzdWm/dNAr9xZkR4K5UnEoZJr1YKpZ2OHEpL7BFuTl5GjyRRAFbQ06bXFtfUw+QW
         JnAN4wIGlNz4QPRDiWYg9f6QGe/yRo7PCSM1zvfyI7nHRejMSlYTGhB+vrKi5bPh1CrY
         tfW1kwH3Dfx61A27h/0gNaD8h59qzIi7Cg5oUKC+7/L4o5Q21FLR7hKYizC6kGgfqd7E
         5rhdafGWx6lfkclrJVIFpniv2SEcUojO5oooIhlsECSHw9ax58rpb7SGtaizY6Xi/7Al
         ehgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o1cvMhjy6fdnuouwYm+15BaMU3WeB3ZqppuOOP+IdbA=;
        b=CLl8BRqJmKzAsonThGyXlDQCo3dqxjeLVG29sAX8cfYkJHWmUj1Ypj3ViFbaNdfXPY
         AQTCjXpJVsGwHRU5Y9FaqgAm4P2os/Ng36AxR7MnMXmR5oq2lF38uEmurT9xL+mUNn1J
         EvI3TTL2qsT8rZ6tHjl2xtkyfpC1CdSG+CTJgfVIyjVSVyg7jGFl4ZjVb2dp09vk5ZoU
         6AZdoA44Y+duhjd9KXHopIIchOc4Uiz3YiwRahpZHVGHf24FERZQTawnGcKnPsgCN64o
         BurJgXMJR7TlA7vGCLQghUPMzng3nY5dLCUatTid+OVpJUe4+j78oUP9UPKw3pObDZLf
         8gqg==
X-Gm-Message-State: AOAM532+/VHkUEG1sHk2tz9j3veUFs0+1tUBPEkqNIbCHvl8XD6B/Rtp
        Fd5CWU7WUJ4W6X9yO1GqjB3JlsorDX4=
X-Google-Smtp-Source: ABdhPJxfeAqW6gjIg5gmBU7KDwFoCurqGSJ2F5AE6opnymIRISYnNfFJLtrCVZOYkwKLYAskgx7aJA==
X-Received: by 2002:a05:6a00:2351:b0:47b:d092:d2e4 with SMTP id j17-20020a056a00235100b0047bd092d2e4mr5865953pfj.76.1636446027594;
        Tue, 09 Nov 2021 00:20:27 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id h3sm1696725pjz.43.2021.11.09.00.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 00:20:27 -0800 (PST)
From:   cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To:     info@metux.net
Cc:     vireshk@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl,
        linux-gpio@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, chiminghao <chi.minghao@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] crypto:otx2_cptvf_algs: use swap() to make code cleaner
Date:   Tue,  9 Nov 2021 08:20:20 +0000
Message-Id: <20211109082020.131146-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: chiminghao <chi.minghao@zte.com.cn>

Fix the following coccicheck REVIEW:
./drivers/crypto/marvell/octeontx2/otx2_cptvf_algs.c:1688:16-17 use swap() to make code cleaner

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: chiminghao <chi.minghao@zte.com.cn>
---
 drivers/crypto/marvell/octeontx2/otx2_cptvf_algs.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/crypto/marvell/octeontx2/otx2_cptvf_algs.c b/drivers/crypto/marvell/octeontx2/otx2_cptvf_algs.c
index 877a948469bd..2748a3327e39 100644
--- a/drivers/crypto/marvell/octeontx2/otx2_cptvf_algs.c
+++ b/drivers/crypto/marvell/octeontx2/otx2_cptvf_algs.c
@@ -1682,11 +1682,8 @@ static void swap_func(void *lptr, void *rptr, int size)
 {
 	struct cpt_device_desc *ldesc = lptr;
 	struct cpt_device_desc *rdesc = rptr;
-	struct cpt_device_desc desc;
 
-	desc = *ldesc;
-	*ldesc = *rdesc;
-	*rdesc = desc;
+	swap(*ldesc, *rdesc);
 }
 
 int otx2_cpt_crypto_init(struct pci_dev *pdev, struct module *mod,
-- 
2.25.1

