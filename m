Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EF681B564
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2019 14:00:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729573AbfEMMAr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 May 2019 08:00:47 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44497 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728841AbfEMMAq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 May 2019 08:00:46 -0400
Received: by mail-wr1-f65.google.com with SMTP id c5so14905418wrs.11
        for <linux-gpio@vger.kernel.org>; Mon, 13 May 2019 05:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=devtank-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iwZ3lFLZbf4cU+cjzv2o05vhfHG6YljowyuZLWPK0KA=;
        b=c7Q843Ki3UqtgiVJsz8AGwSQFM9oslOVWpPjjIWbATm9Z+H+kInORzgS7tAhCAq1NX
         gu2RRWEeBP/+HtNut8eHBqUO/H87Rp52R+oh3PM/E8yq0AIOkgWUL/3DPc9D099DGvrN
         5BDbux5uZMAjVHJNIi5twmh18U0iwHFAEFVHCe8DQ0yLMG4eECxJ1Q7WtboiB79t65aH
         F25fi2APyxHy3E3HWVKtuWtgoIZ0lbqYiuVOxAMKRSmitxc2yy1H0+1L4qEDmGQ4bVVo
         Tm/5IlxEsEATi1HsmMwX9ulnnaA3K4s+aGdOMdKBDcOME0wQBLEZXK1+r77kA02oCCp0
         9LkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iwZ3lFLZbf4cU+cjzv2o05vhfHG6YljowyuZLWPK0KA=;
        b=bASIwJiq1UgnMsKtUgksLZm+eZJiJq1mYbAxVyCtv1wgzZHfV9wBSSh/bJvcaGHeLq
         Mc5tCihFr6VkTa3xhZjBy5FblDGGFsPmr6nYYGhQX5S/i+hjxBXr6nZe38qupxrgDCcQ
         OUlfgNd3Acdq1TH4mDTMJQwLf8C9i9Q2W/ifRzuyQ4wM4Ec/oWz9oHJQy+cFaroOlQRK
         //ZMPKx8cg9yJ5NSAI2gHZl6pz1kHKmlIZiiKUlpSaCNMP5rm2rmno7ZdtW2F6OCcuBr
         LUXMGSgAgxYqzxdpDzLY96dSUmcJ1nrrE7BjxzcBsYda9VyTVTsilpxZHzYkOmCb+v+2
         7Ucg==
X-Gm-Message-State: APjAAAWgX+Y+QaW7A6xYXi7JY5SxOzDhWcJ+hVzJ2zv2wI6l8yunips0
        LkIxLn28XEASbZndRqN7+l2TtC5/1dM=
X-Google-Smtp-Source: APXvYqz1+gKpOPrMBsfwuUFO4VbY+bwM+5C2Z29ZzVk4BtQQE3j3xYv4Milq+AC6mpGnVub+mvGfSg==
X-Received: by 2002:adf:9023:: with SMTP id h32mr5632551wrh.95.1557748845091;
        Mon, 13 May 2019 05:00:45 -0700 (PDT)
Received: from jabjoe-thinkpad.lan ([141.105.200.141])
        by smtp.googlemail.com with ESMTPSA id 34sm5000102wre.32.2019.05.13.05.00.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 05:00:44 -0700 (PDT)
From:   Joe Burmeister <joe.burmeister@devtank.co.uk>
To:     linux-gpio@vger.kernel.org
Cc:     Joe Burmeister <joe.burmeister@devtank.co.uk>
Subject: [PATCH 2/2] (v2) Mark MCP23S08 as one that will not sleep.
Date:   Mon, 13 May 2019 13:00:24 +0100
Message-Id: <20190513120024.17026-2-joe.burmeister@devtank.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190513120024.17026-1-joe.burmeister@devtank.co.uk>
References: <20190513120024.17026-1-joe.burmeister@devtank.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Though it has a 'standby' it doesn't appear to be an issue and
marking the chip with can_sleep means gpiolib.c won't allow its use
as a interrupt controller.
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 3fc63cb5b332..7334d8eb9135 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -890,7 +890,7 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 		return PTR_ERR(mcp->regmap);
 
 	mcp->chip.base = base;
-	mcp->chip.can_sleep = true;
+	mcp->chip.can_sleep = false;
 	mcp->chip.parent = dev;
 	mcp->chip.owner = THIS_MODULE;
 
-- 
2.20.1

