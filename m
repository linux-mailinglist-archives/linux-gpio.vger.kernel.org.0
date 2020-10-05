Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C91E28308B
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Oct 2020 09:03:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725910AbgJEHDz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Oct 2020 03:03:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbgJEHDz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Oct 2020 03:03:55 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E96CC0613CE;
        Mon,  5 Oct 2020 00:03:55 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id k8so6223606pfk.2;
        Mon, 05 Oct 2020 00:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TzuIsmk/L/4A//mgVBC3/bdUgRRfBHD9u/2Du7ePAjc=;
        b=RD6CGEJ2psr9vzvnWY1bBAcD5bmEsCOc3fWhB/TMc319eZdJTTFudSgaOquI4pnvn6
         cGTAfvvyDUwK5bWRrgxNwfaaS9Fwlaub4jivt1fuWh/aFtPMVV67gxT81Oyw/Z7x1/bS
         zB2Vn+FAH/VJ51i57rEV/natiRYIr7QQxofEsbeoywYDqXjIY3CficBddIo8h81DPzqw
         Efm65kEcc6SPvwmGbO37l4E/7j9s3dqrQ1ZAECwoUiyl8uksQRAua5rjRWMcry1k4d/R
         BqStwyqpgbPnYkO3TjEva9C5Rd8TAqwF5NEluLVcWe75e7E4XmUIOifQdVe9EKWJf5Ji
         bbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TzuIsmk/L/4A//mgVBC3/bdUgRRfBHD9u/2Du7ePAjc=;
        b=bHJYhWLYbvq5v/8n9K0Tac/VMECAHhrxHLI7xVD/7Kv+4RqejhVALkkfHPZxOKgEUC
         HIM3Gwts3+ySnx5677i5rnogA+gThaHnVCG3dNOIDUzqdQsFel2KzPoMqxzoveTBa9R4
         TfmjucvWa4K0lO8n5QKEvXV9rPtqDXJ+L6sZRydQPW0KcEsym9NhyqkiWz67ghBmCk/3
         WV4qSNMMwHkyoow7fGeuKgozAic7jD4mGKUV4TDDPtyis98cp1PauorKOAWiaPcLu6Ry
         pW6KruvuUbcRoxgbE+Znir5dfG+2Pk6HdgI6rMe3bTDEnI3U01icJG6fEG9vgTxOlj0L
         sDNA==
X-Gm-Message-State: AOAM531dGzn05Fj5QLhiXMBnDbA6f8+UsH1IINrAUelHEmTQ2+Y8eNL3
        aHT6x/566bCjVKJqn87yhXEewRsbWQ4DAw==
X-Google-Smtp-Source: ABdhPJwLmIVJUT73biZ5KgTN5+P5LzbSpwrL+suhrTbnwWUu4fnvXbUoxmSToFaAwJ8Z4s//+hbRMw==
X-Received: by 2002:a05:6a00:14d4:b029:152:8969:427b with SMTP id w20-20020a056a0014d4b02901528969427bmr3077479pfu.1.1601881434338;
        Mon, 05 Oct 2020 00:03:54 -0700 (PDT)
Received: from sol.lan (106-69-166-86.dyn.iinet.net.au. [106.69.166.86])
        by smtp.gmail.com with ESMTPSA id 78sm6868764pfz.211.2020.10.05.00.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 00:03:53 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 1/5] gpio: uapi: fix kernel-doc warnings
Date:   Mon,  5 Oct 2020 15:03:25 +0800
Message-Id: <20201005070329.21055-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201005070329.21055-1-warthog618@gmail.com>
References: <20201005070329.21055-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix kernel-doc warnings, specifically gpioline_info_changed.padding is
not documented and 'GPIO event types' describes defines, which are not
documented by kernel-doc.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 include/uapi/linux/gpio.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index 07865c601099..b0d5e7a1c693 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -346,6 +346,7 @@ enum {
  * @timestamp: estimate of time of status change occurrence, in nanoseconds
  * @event_type: one of GPIOLINE_CHANGED_REQUESTED, GPIOLINE_CHANGED_RELEASED
  * and GPIOLINE_CHANGED_CONFIG
+ * @padding: reserved for future use
  *
  * Note: struct gpioline_info embedded here has 32-bit alignment on its own,
  * but it works fine with 64-bit alignment too. With its 72 byte size, we can
@@ -469,7 +470,7 @@ struct gpioevent_request {
 	int fd;
 };
 
-/**
+/*
  * GPIO event types
  */
 #define GPIOEVENT_EVENT_RISING_EDGE 0x01
-- 
2.28.0

