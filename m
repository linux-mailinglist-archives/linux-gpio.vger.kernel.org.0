Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C876A277AD
	for <lists+linux-gpio@lfdr.de>; Thu, 23 May 2019 10:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbfEWIHT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 May 2019 04:07:19 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:42109 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727919AbfEWIHD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 May 2019 04:07:03 -0400
Received: by mail-lf1-f67.google.com with SMTP id y13so3681734lfh.9
        for <linux-gpio@vger.kernel.org>; Thu, 23 May 2019 01:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hcBOC0mi7IP2Hq/sOwxuUJwQO0e5HPAWKceJ4HblTdg=;
        b=eHfEHJnO2MZbw9tJoCVBFwylgmR8416RMuKgpx3Cyt1WurqmAr5UgP1NSxrPnh+4/a
         dlPgv9a5JhsiQJREg75fPamGCJP7dVacIysek39PDAmqc6gRBZX+P3Ar6tLbz4QATuzr
         +Hp2DCSudeLPyCQiA8p7cX1ME63asWEVn+xbXK4Z9eq45b+yt9V8IzEToFyyAoWUZ8x2
         ApUrfnd3/7ZaEqOpJvGzS8IA8RcLGgqhF4TfnOugLJspeUtjH8ifapfCRnvTe8dU4/Pt
         mRfS/RYe0uIjqxpkSp6WczRHDo1m4FrZKdsNhU9bRgIGBJkH7XtNTt1yV3++XbwcSp8y
         Zfzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hcBOC0mi7IP2Hq/sOwxuUJwQO0e5HPAWKceJ4HblTdg=;
        b=oyybWasGMyNiwZa8LyOYwVrWk+jLobtbxMR8ipzVIdknzK/Hn3ioSqD0mcg8j3cWfT
         4upREY2qiJIrbtVPSeHci1rtHholjTEwkkSX7i+XUctl9l2WTMwJU4AOvVnkpHLMxOhM
         gij4MSvL51tMPXCZeuQ4z0GSNRYqKXCKetMXAZcNC+t7Mgw+z9DiTRD9IAiuQYrbWNiq
         vjb0fqgdpFihgZIO4vIXiuG41b0FdQy/274ObMLEFDGjvZRdRj3sc0m82P3w7KmTThQM
         gg9cDdcWnOlmwOSwKt8ThRUYHKLcuTwR52eP7ZlhZ2Poy9rex/Uew0KrMLonhf2bI4+e
         l6vA==
X-Gm-Message-State: APjAAAUP9d7vRROsrNnUEiM+LVADmijiwh048peYkh4neHk196xzk9x1
        MundR/0I4moRf6c4MVSNmwSu5cNC1bU=
X-Google-Smtp-Source: APXvYqwo4Ss/y7QfNiicdcl4vaU5dlJw/sd16S3BH1em9LqILXPbiRmNOaq2NbdRmIueOEkDGppMkQ==
X-Received: by 2002:a19:c517:: with SMTP id w23mr29859835lfe.73.1558598820638;
        Thu, 23 May 2019 01:07:00 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id o76sm6009498lfo.7.2019.05.23.01.06.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2019 01:06:59 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH] pinctrl: qcom: Enable device links to consumers
Date:   Thu, 23 May 2019 10:06:54 +0200
Message-Id: <20190523080654.19155-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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

Make sure any qcom pin control consumers are suspended before
the qcom pin control is suspended.

Since Qualcomm is one of the few pin controllers implementing
suspend/resume I suppose you will see this problem sooner
or later so let's see if we can just fix it right now before
you run into it.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Brian Masney <masneyb@onstation.org>
Cc: Lina Iyer <ilina@codeaurora.org>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
You can test this patch by pulling in this branch:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=consumer-links
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index ee8119879c4c..d4a6edbccdb9 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1139,6 +1139,7 @@ int msm_pinctrl_probe(struct platform_device *pdev,
 	pctrl->desc.name = dev_name(&pdev->dev);
 	pctrl->desc.pins = pctrl->soc->pins;
 	pctrl->desc.npins = pctrl->soc->npins;
+	pctrl->desc.link_consumers = true;
 
 	pctrl->pctrl = devm_pinctrl_register(&pdev->dev, &pctrl->desc, pctrl);
 	if (IS_ERR(pctrl->pctrl)) {
-- 
2.20.1

