Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B965228308D
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Oct 2020 09:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725930AbgJEHD7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Oct 2020 03:03:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbgJEHD7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Oct 2020 03:03:59 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 573CAC0613CE;
        Mon,  5 Oct 2020 00:03:59 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id 7so5395636pgm.11;
        Mon, 05 Oct 2020 00:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w+fSCxVpORJJHHoB6O1AfVgwd5DtflDeMSjLAWuo67w=;
        b=Bu7lMxD6X8EQEijEGiefHGkEZW83rPSMS8zMyIE1eYYbInEq8fimVOnvha1/70OirT
         tOZ+HGWLC1K/E7IMn2dXgfwBrSyKkB+w+6Oo9/CarxXmXeXXSYIpRMFCzFo/NO4GFxO7
         7pZX27hcmtiBjCxGzFPAqe/aSpAr6mt7FzO5FGpKY/J7GXt3gxuQIbmRul4Ue6EhKYfZ
         NiMvkUI2ScouKTHo0go+sRRmoKeVcq2vANslPScAoiO/UDJhi7RqRUk9HUXD3yCqoK+n
         yhFbciiIJAFg6nWdA8rT7CAs5mPVWuaEpCXp/cuOT0E1UT80JSgDvdJALaIpbBQM80sb
         eqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w+fSCxVpORJJHHoB6O1AfVgwd5DtflDeMSjLAWuo67w=;
        b=DKfZkijaj5LxDew2DarycNlZfMMYvYDxY+LjMeUwU0JCfeKkRtTk5/2WqRAwud0sM6
         56W984/kQIClxQLID7K92m0nT7q5rUqHiP36daFeNE7TrTUowyz++NvOLtkIbkFb+rl8
         jg91dqKLdMZYF25B2GNqydQDduh0YyiRZm6FnXpkdcn38n2XHzKBDjUfHjCbUG1Oo4jV
         TddLFeMr4UUnEA9eWTmWzWKvVZ9l2u7tR0Xal2poujQoF0kJcSND2Jkmz7ZLXDWM/nra
         XXHunpVS75z3SSbbg1fyJtQyshAaHPaNB9XjqsyXpLLVxzF7WJJigl4eMPrEGxSfPpeV
         Wh1g==
X-Gm-Message-State: AOAM533du8eWK7+YDNoJil0bFA+hBZKs2qNlp4zQlJMXjSwKE/e0orbr
        KPOznWXPW7UDe0Be3LT9mkNRoAfb4GV8GA==
X-Google-Smtp-Source: ABdhPJy7GIMXOe5TPvYxhOlmVXHL6BIM5yXgJyvwFwZRYdyr/yeZ1PgthoJoytgoj+lZx9MF4W4PAQ==
X-Received: by 2002:aa7:9048:0:b029:152:883a:9a94 with SMTP id n8-20020aa790480000b0290152883a9a94mr3286611pfo.24.1601881438541;
        Mon, 05 Oct 2020 00:03:58 -0700 (PDT)
Received: from sol.lan (106-69-166-86.dyn.iinet.net.au. [106.69.166.86])
        by smtp.gmail.com with ESMTPSA id 78sm6868764pfz.211.2020.10.05.00.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 00:03:57 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 2/5] gpio: uapi: comment consistency
Date:   Mon,  5 Oct 2020 15:03:26 +0800
Message-Id: <20201005070329.21055-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201005070329.21055-1-warthog618@gmail.com>
References: <20201005070329.21055-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Make debounce_period_us field documentation consistent with other fields
in the union.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 include/uapi/linux/gpio.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index b0d5e7a1c693..1fdb0e851f83 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -98,7 +98,7 @@ struct gpio_v2_line_values {
  * identifying which field of the attribute union is in use.
  * @GPIO_V2_LINE_ATTR_ID_FLAGS: flags field is in use
  * @GPIO_V2_LINE_ATTR_ID_OUTPUT_VALUES: values field is in use
- * @GPIO_V2_LINE_ATTR_ID_DEBOUNCE: debounce_period_us is in use
+ * @GPIO_V2_LINE_ATTR_ID_DEBOUNCE: debounce_period_us field is in use
  */
 enum gpio_v2_line_attr_id {
 	GPIO_V2_LINE_ATTR_ID_FLAGS		= 1,
-- 
2.28.0

