Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D073E2AD8BF
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 15:27:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730070AbgKJO13 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 09:27:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730059AbgKJO13 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 09:27:29 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 019BCC0613CF
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 06:27:28 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id d17so14414811lfq.10
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 06:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n8uglzR99agOJ88UjmIg/xjEt6zI6BVGiVZlK7lsq1U=;
        b=gLQ36k4F1V9h9aVY7TAbTh120++aQJGBrhaJa3jDA+0z+QhElzKWDk28UJv6j+6cpQ
         9rWqr0dfIKsqmtuhH6/qkYHaoHq/A0Cx6JKaVIB+wOn02sOpna0znJEkD/8RRS5juWZ+
         J3eyD/lNMveWUGlGUSkzymmJ0JV0zxqQdGjbN/qNr1wbS2YcLS4OzKBo63o+fIm4ROGj
         GxtxoI6KNhwOZb0xXwTZitjL1d77X8z+NxRjNGY6XaR6nQwtv5RqXkXmEYzzayp3yBQ7
         4PS2y8fHJyfZgAm5CzpIhI9+jBfbJ9LaOXlesxkg6l4F0/hIi78WHyOvaL70/OzgbeGu
         5f0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n8uglzR99agOJ88UjmIg/xjEt6zI6BVGiVZlK7lsq1U=;
        b=Vb+E38rTDZQnrpNkti3p8l3CBPSfykOJs1U5r4QNFx/CLippI6wh105eMFhVBF9tF0
         Z8QeMPwaRWIirN0IjhM4nF+HdQKYNQ9jcaYAYBcASPb0SqeQqOaRQ2TCm6WsqjLXkc3w
         jzwivLwejzxT5sK1Zt04zXh7WfV+ma1mNZs598yFd3w1nqwbe3edBkcRRlmY+AGXWYXg
         NxUhJqyqAxhdZe2jKAyvjAR1dHELfI11prNvWCTQk8giCIE5eML0tOvI7kFp6P8eHpz2
         TbqokwpN4Kw5TQL+pqyobZSIepmietklR45TTISQpDVPUywjjRYeli0Tp8lGVaCIv65M
         8Ydw==
X-Gm-Message-State: AOAM5336/Ooj2i1Dj620X04mBJMumc8Cst9tGoCrY0g79/yYy4Jq5sDR
        L+0OeLPeigTv70z9Sh/Ubzp9jbpDZr1DdOoI
X-Google-Smtp-Source: ABdhPJxm4knAULXYjEMhhUzfEEXlvu5jBC+dpJzFVajo5pvRPAIy87Gy0IhBnG/pWUkwqH+qa9XtdA==
X-Received: by 2002:ac2:5607:: with SMTP id v7mr4732783lfd.71.1605018446327;
        Tue, 10 Nov 2020 06:27:26 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id y2sm426169lfh.130.2020.11.10.06.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 06:27:25 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: sysfs: Enforce character device
Date:   Tue, 10 Nov 2020 15:27:24 +0100
Message-Id: <20201110142724.14760-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

If users select sysfs support they get the character device
as well so that end-users cannot complain that they
"only have sysfs on my system". They should have the
character device at all times.

If someone is in so dire need of stripping out the
character device while still enabling the sysfs ABI they
can very well patch the kernel.

Also only show this obsolete option to expert users.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 5d4de5cd6759..4dd566f7ea39 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -59,8 +59,9 @@ config DEBUG_GPIO
 	  that are most common when setting up new platforms or boards.
 
 config GPIO_SYSFS
-	bool "/sys/class/gpio/... (sysfs interface)"
+	bool "/sys/class/gpio/... (sysfs interface)" if EXPERT
 	depends on SYSFS
+	select GPIO_CDEV # We need to encourage the new ABI
 	help
 	  Say Y here to add the legacy sysfs interface for GPIOs.
 
-- 
2.26.2

