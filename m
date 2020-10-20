Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49456293D20
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Oct 2020 15:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407389AbgJTNP3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Oct 2020 09:15:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40413 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2407387AbgJTNP2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 20 Oct 2020 09:15:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603199727;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=LjmPMVzXWf6DnC/UBBUMQlfucytTz/vlaecv5F/UKBM=;
        b=A3YeW56bSEymTU+GyHsE+gUE46E2hfnyyE4tQ6oXnjebCDa3lDcPqunUAdiVyvLHR1TdVn
        FWevIlRJjdtXM3iStqE/go0JpvG5ScijT+nQL5Pm0lwGg1Vlu8rK+CdOaAqcfxYrhPW6s4
        vQxfa61D7xOOxBGznXsDWb8wcl2Jygg=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-ch6NM6RRMieVIG-5w8N9jg-1; Tue, 20 Oct 2020 09:15:26 -0400
X-MC-Unique: ch6NM6RRMieVIG-5w8N9jg-1
Received: by mail-qv1-f71.google.com with SMTP id eh4so1275769qvb.12
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2020 06:15:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=LjmPMVzXWf6DnC/UBBUMQlfucytTz/vlaecv5F/UKBM=;
        b=JwVDqq0MW3bh1gtqvor0FnHarVaQHsSMW7kcmZLjqxBAWQ3G+JHuovbklkrBGLNyck
         cY10SFzvNkz2hxSBfHeR3MBi8eLjsJuuztRquLkG7Kg0Zi0rrYVgM0n1TNY8JOQAXfPr
         XKWa7SBH0VQD3NUVEB3y3u4DbNevptrQd8+D4/awr49FtkSUHeQyp79+v83K10M47cax
         rhFIZqcmpuD1DkNhcIaPi7GYh4gF6dONw2R4hschChY1uZ5iy5pw7JNB8Lz4IhbR7zK0
         hjzjafTaj2sen756fFbN63GQE5/qeen4o8eZC8OLbrCiPK5h3xirCBrbLEP0eWRgZSIG
         BT8w==
X-Gm-Message-State: AOAM532LaDEDPZiQrIZQTQTLFmIoFKZxmQm8ZNyBwme9ATF7MRza3pZS
        a7L/N7E1LMSDsM6F5RL8pfurZDt4uNlHDvIh9wC8UPJje50AJGurBBQu0kVSMSSSQYbue1HkWm/
        8CpWNbsKRYP7cjNndgrZI6A==
X-Received: by 2002:a37:6246:: with SMTP id w67mr2420715qkb.35.1603199725596;
        Tue, 20 Oct 2020 06:15:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxPR6bV4aLBGYacEtAaH/79e0HSmuiKtMeTJx0qcZazIVj5QKtDoi7jlYYjqw+n1IkdtGPIQ==
X-Received: by 2002:a37:6246:: with SMTP id w67mr2420695qkb.35.1603199725399;
        Tue, 20 Oct 2020 06:15:25 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id s90sm713248qtd.15.2020.10.20.06.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 06:15:24 -0700 (PDT)
From:   trix@redhat.com
To:     kgene@kernel.org, krzk@kernel.org, tomasz.figa@gmail.com,
        s.nawrocki@samsung.com, linus.walleij@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
Subject: [PATCH v2] pinctrl: samsung: pinctrl-s3c24xx: remove unneeded break
Date:   Tue, 20 Oct 2020 06:15:20 -0700
Message-Id: <20201020131520.29117-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Tom Rix <trix@redhat.com>

A break is not needed if it is preceded by a return.

Signed-off-by: Tom Rix <trix@redhat.com>
---

v2: Improve commit log

---
 drivers/pinctrl/samsung/pinctrl-s3c24xx.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-s3c24xx.c b/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
index 5e24838a582f..2223ead5bd72 100644
--- a/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
+++ b/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
@@ -108,19 +108,14 @@ static int s3c24xx_eint_get_trigger(unsigned int type)
 	switch (type) {
 	case IRQ_TYPE_EDGE_RISING:
 		return EINT_EDGE_RISING;
-		break;
 	case IRQ_TYPE_EDGE_FALLING:
 		return EINT_EDGE_FALLING;
-		break;
 	case IRQ_TYPE_EDGE_BOTH:
 		return EINT_EDGE_BOTH;
-		break;
 	case IRQ_TYPE_LEVEL_HIGH:
 		return EINT_LEVEL_HIGH;
-		break;
 	case IRQ_TYPE_LEVEL_LOW:
 		return EINT_LEVEL_LOW;
-		break;
 	default:
 		return -EINVAL;
 	}
-- 
2.18.1

