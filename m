Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F02B029274
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2019 10:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388960AbfEXIIr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 May 2019 04:08:47 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:43340 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388959AbfEXIIq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 May 2019 04:08:46 -0400
Received: by mail-lf1-f66.google.com with SMTP id u27so6406048lfg.10
        for <linux-gpio@vger.kernel.org>; Fri, 24 May 2019 01:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=47BMQdLR7bja0wVOm3y003+9mQi2F7wpyQcEeaV61G4=;
        b=tRf9oi3WPr72KA5JL3sFRe1+og4j3l2Ro3tzWWGxSB2KchLmR06thHvO9EvQL/zuk+
         D7IqaFtZVH8+Zbf30LQQcZbB6nDy7qIDTvv8/cmfyX1Dp1SBfTZyPWHLLL4iT2WbNV/H
         VHX+/n+r7sH5cjPKRu+A/fQMkyMRFoKt5SYDvkxAHooVTPNSwooFuHKW7eDaXAzuHBan
         7FJoYaR25kyj6z30kCH2TTw+C9KDQIqI5vE5Dd6Dui+Jw2FRyhFiYWvpdePf4C53d2BZ
         hDtkJtp83CX8gvqSp3uMtI5MXUo5hk540ttey6lFOY7KQvFE1s3nOY1Oc1CfkwQchUBN
         4VWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=47BMQdLR7bja0wVOm3y003+9mQi2F7wpyQcEeaV61G4=;
        b=uaHtH8Leug/5yz1YiBWWgBKNCB0caK04xO7S6xvNCJPVsh5sw6qejWCl+FVlzQ8Vrz
         wg2Tkr5yfUIIxoCjjikq/LFPDdn5OxU23rfQKwDrD963Dg5MCVaOKRpN5+v84O/X0Vxf
         oj+compOq1PcKh/FscsfkX6RK7TzFOOLA6elM3kgYM1+Szu5N1sVMQNtyVDa5dvyjV/x
         /zMGxQUa4o0EcNJxCA3wyHC1nGQV/XeH5nDXnTvKB+1mMjbsc7YZEmQLyCO8/fxSmgnJ
         2DyTr3DLtRhcXM3pEuayM4v0plnu6CjVHOKEWHaI4BqWhu4g6B2j6kfpqA99Y7NqN9Yr
         qPGg==
X-Gm-Message-State: APjAAAUbNHumesepIp1xPgtWHOjAhHlD6Dqx+ykyYCSoAGfpDnNWrqqQ
        2qLOuv5wcn2/K8/w0n6eV9i8lQMM8Ps=
X-Google-Smtp-Source: APXvYqx71Zsk2qZCZkI9rGpTcgP24A3ZgEN8yhJCZHSmuQjINPN8JlrJP+n8jEkvUGm1ZQ8mA/DZIw==
X-Received: by 2002:a19:700b:: with SMTP id h11mr4483601lfc.25.1558685324212;
        Fri, 24 May 2019 01:08:44 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id j22sm448486lfh.14.2019.05.24.01.08.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2019 01:08:43 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH] pinctrl: core: Do not add device links for hogs
Date:   Fri, 24 May 2019 10:08:39 +0200
Message-Id: <20190524080839.7118-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hogs would create circular device links, so do not link
the device to itself.

Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index d757c51d7114..41adb4e47dc0 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1271,7 +1271,9 @@ static int pinctrl_commit_state(struct pinctrl *p, struct pinctrl_state *state)
 			goto unapply_new_state;
 		}
 
-		pinctrl_link_add(setting->pctldev, p->dev);
+		/* Do not link hogs (circular dependency) */
+		if (p != setting->pctldev->p)
+			pinctrl_link_add(setting->pctldev, p->dev);
 	}
 
 	p->state = state;
-- 
2.20.1

