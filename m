Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BD542775C
	for <lists+linux-gpio@lfdr.de>; Thu, 23 May 2019 09:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbfEWHqb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 May 2019 03:46:31 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:34975 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725814AbfEWHqb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 May 2019 03:46:31 -0400
Received: by mail-lf1-f65.google.com with SMTP id c17so3663609lfi.2
        for <linux-gpio@vger.kernel.org>; Thu, 23 May 2019 00:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SNNBJSnx3sXoOboWJiPonCGDAGxtUWB/VomEYANV8g0=;
        b=saIesGeF5H5wuOLPc4qHpPhs01t+hLPYqfO0MdarfCANbniA8IPtXJdob3P1KB3grT
         lSgqF9KLEbSXd/WG8HiOSPeA/PdhL7l7aBv6VA0zU1doIQUxvDjAD1sSWI0ll0jvrvL8
         eaT5R2UoaCMtghgHEdX9KNexU9aWmsRkVXIJuNgSyTKh14Z5D9ngSWBL+0iT/QM70PS0
         CU/9bVXK5+uOI26hRFihQ2NHsfIQDGt/5UXr/bQ/bth9/mbxja8PgCXaIourB5QoHlf/
         9u/rxvUXU6GTJpqnaf4EU2U+J+S1ZhT5hNDojSkZri26Sjd1iB/kgD1FP+t/2lsT4o9y
         UULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SNNBJSnx3sXoOboWJiPonCGDAGxtUWB/VomEYANV8g0=;
        b=EoPhoPhzyIeNpmlmvEU7Dy6IKLP3CgyWbQXELvIjAtwRXgv8q5R+MXNY1Tdy3TJ5IM
         YYCOYSn4rpza6aHmQ01UMp09IDFSYqucLptmeiHUaOBxIM4kEJEhbIOpqQaMrEX8X8ZT
         HnD1MevAiaA/+T7B3BrRkNw/+rOM4GnZl/VeJ3JdynYxkkETGjDCp9+WQ1c01VDHG6xH
         gHisGLFMlDoMlpdLV+/CYSmnMZk4YMoKC4YwvKa1dZ4+CXI/OUj7pKb4LYOf1viQf58i
         07f0lXIgyncKVZ8f4KcqVXVvyzOtnvvGvBU21wPM/il4oGRn7kk5sTQC5ayVs2Ce7ySM
         Kzsw==
X-Gm-Message-State: APjAAAV0lvJ2WirM6q19W8UBDiwwJo9CMGSfD+3ENsYjhAOt4jZV4fa5
        xU+Q4nPtI4tyNri6tPDXFpl3f7kkm2o=
X-Google-Smtp-Source: APXvYqzI03BF+mNgNlRWkFrqlOld95yPe8Xw4m4RuiUHOl2KiZEp/JDfchee8cCch0wpX7P6xKunhg==
X-Received: by 2002:ac2:5612:: with SMTP id v18mr30620142lfd.15.1558597588740;
        Thu, 23 May 2019 00:46:28 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id k18sm5628761ljk.70.2019.05.23.00.46.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2019 00:46:27 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
        Lars Poeschel <poeschel@lemonage.de>,
        Jason Kridner <jkridner@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Phil Reid <preid@electromag.com.au>
Subject: [PATCH] pinctrl: mcp23s08: Enable device links to consumers
Date:   Thu, 23 May 2019 09:46:25 +0200
Message-Id: <20190523074625.15294-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

A recent core change makes it possible to create device links
between a pin controller and its consumers. This is necessary
to ascertain the right suspend/resume order for the devices:
if a device is using a certain pin control state and want
to switch that before/after going to suspend, then the pin
controller may not be suspended already, and conversely
on the resume path.

Make sure any MCP23s08 consumers are suspended before the
MCP23s08 is suspended.

The MCP23s08 does not implement suspend/resume callbacks,
but the device links are hierarchical, and this also makes
sure that the I2C master where the MCP23s08 is in turn
connected will not suspend before any clients of the pin
control settings are suspended (and conversely for resume).

Cc: Jan Kundrát <jan.kundrat@cesnet.cz>
Cc: Lars Poeschel <poeschel@lemonage.de>
Cc: Jason Kridner <jkridner@gmail.com>
Cc: Marco Felsch <m.felsch@pengutronix.de>
Cc: Phil Reid <preid@electromag.com.au>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index f0cdb5234e49..9025835c0ec4 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -831,6 +831,7 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 	else if (mcp->pinctrl_desc.npins == 16)
 		mcp->pinctrl_desc.pins = mcp23x17_pins;
 	mcp->pinctrl_desc.owner = THIS_MODULE;
+	mcp->pinctrl_desc.link_consumers = true;
 
 	mcp->pctldev = devm_pinctrl_register(dev, &mcp->pinctrl_desc, mcp);
 	if (IS_ERR(mcp->pctldev)) {
-- 
2.20.1

