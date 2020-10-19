Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECFF2292DFA
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Oct 2020 21:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731114AbgJSTBE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Oct 2020 15:01:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47622 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727689AbgJSTBE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 19 Oct 2020 15:01:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603134063;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=XwLMs+G9acmS2aakBMTMjzc5I3FvZvwGMkn+7uLCDjA=;
        b=FwM0yecZ3U/uHP0oFU5Xrg1WyFdWGZ8kuO4fxYQK8lH9vD9LFK9WUY6cGHZNXKjXHElLTh
        JI6iANPrJxLgejWZvgH7gZ2xmNgCY6q0Z7HjTrVVQrW6sHpEY0dfeUEMjt2nC+/MUf7NIG
        7rcOFkok1iUt8KVCl9Nii7JfUDaZZvk=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-_vRbfsTnPiubf8kH4k6ZMQ-1; Mon, 19 Oct 2020 15:01:01 -0400
X-MC-Unique: _vRbfsTnPiubf8kH4k6ZMQ-1
Received: by mail-qt1-f198.google.com with SMTP id d1so624117qtq.12
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2020 12:01:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=XwLMs+G9acmS2aakBMTMjzc5I3FvZvwGMkn+7uLCDjA=;
        b=HY3z0TnJn8i/IYGkcHrA0DKiR7ErTP+Ff0m6YYnTOG4SDf7BZ59vKStl3OuysNy8Za
         EAiVehWxVZ8alzdfWDAnJwWcli20bUxz7ccq2J0TZee9K5xij/uXgRjSr4bZm5Wx9F1S
         uVINMEV5W5qWFkh9EVuVzzQp9+U9vs68SuMuaSx6vYmg2hLscA9kpzbkFKWAFXBlg4P6
         ut6Yu5enqY4DDjXDZY6iQ5Tv37ZXPKtEMjt990hnB1lrSkZ9KRgZx2GeBOFSD9wkza4L
         CHn9xWh07/h+V+WG++P5RxykwkNZr9ZAfMX3/bSYyqQQkb4fOQc8+MTBosocqhGnYbic
         0kjQ==
X-Gm-Message-State: AOAM531ydx/9eQlHxuXhn0AJw8nqwqEnR1ZD+gl751+YiMlMLf2CFxe1
        +svpc6oNWsAlCZAiYplR+68C7zxUHNZ17jICjDB3Fuwi09xkGkMZb6Yd95Ezfz+8WLa0vttUhhX
        frRF9woRY5cw/EiROIw3eNQ==
X-Received: by 2002:a37:2dc6:: with SMTP id t189mr1048643qkh.394.1603134061041;
        Mon, 19 Oct 2020 12:01:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzErTIxJNieTSDYoXo5Y00wXQUVggwoT0V7lhKV2TN8og4s019OyWS/oIKDVfNG0iHfaiHwQQ==
X-Received: by 2002:a37:2dc6:: with SMTP id t189mr1048611qkh.394.1603134060763;
        Mon, 19 Oct 2020 12:01:00 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id n3sm307910qta.10.2020.10.19.12.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 12:01:00 -0700 (PDT)
From:   trix@redhat.com
To:     kgene@kernel.org, krzk@kernel.org, tomasz.figa@gmail.com,
        s.nawrocki@samsung.com, linus.walleij@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
Subject: [PATCH] pinctrl: remove unneeded break
Date:   Mon, 19 Oct 2020 12:00:55 -0700
Message-Id: <20201019190055.7371-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Tom Rix <trix@redhat.com>

A break is not needed if it is preceded by a return

Signed-off-by: Tom Rix <trix@redhat.com>
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

