Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F17AD17C04D
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2020 15:34:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbgCFOeW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Mar 2020 09:34:22 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35451 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726108AbgCFOeW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Mar 2020 09:34:22 -0500
Received: by mail-lj1-f196.google.com with SMTP id a12so2446315ljj.2
        for <linux-gpio@vger.kernel.org>; Fri, 06 Mar 2020 06:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CeXIttqzTsgVAyiXMeHsyc2FwLIo21i2sKBLLvLk0vQ=;
        b=S5OfaMjDJoxNDrPz1fpk0j+ygmqgLsBWWDVw6Akninc5qqKNV4gnnRgLi2Rc92rdGo
         beDl1YQ+teMKGqeJEtXgvIauT9AvIFM+MjwlVtjs14lR6FocpaOuTx4HvapFc+np0GEt
         dB0wvuwNidkvtOzY4ipTD2Uu8n6bYiXMckkHFrCQEdbdOpZeOF1n3EoyGH+DMcBP5rej
         GO07AIcpSp6gTFZmtjQoBrJYMJSdELX+rRyjHCXW0KD2Ys/Z6yrlx41NgrMk+ApZywfY
         QAe6xfICzsVERfpic2vVcZOEH6ncv4Q9odCM9Aaz5vMFYDMIDmYx3awW4RAVSgPMRRwW
         NPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CeXIttqzTsgVAyiXMeHsyc2FwLIo21i2sKBLLvLk0vQ=;
        b=BsIhRpXCN5dZo/cC1gOehcl87ElwuujQ5aHEPX2/t/e4HkU8SZhO0OV+e2qFP3avzd
         nXP8HANU0RocSLKaVA7Vx0c6V6pILhALYH1QcH+ioQKkjDhoqG5wMZ/2uUfUV/A8zLTj
         NbvPKpO/yKHGIxmXH+ZF5iNhc8GxwFd6l49Um3HeQBxY/iG8CZjNoqoANRVr6pvMmvCb
         6lW/vd/LcJdHfR0oEjc1TKtLsKLcfHK7xe9yKs/Zf3g2w0ld/RLz6VaoD3k2Hj+mdLkk
         jfT0QXJpF7/kHCkuWS+iHccnvk/DPC1iPjUT/NLkKWJTv5W+70m6I79E0rAQWdLaTocI
         JbpQ==
X-Gm-Message-State: ANhLgQ2mBNSE8uqe5fWNGOFuYmX7cqHoC1eS4Qk6+MiDtgiN97wkYqUt
        XKwTqob7/nt4O6D0NmbkpeNkg+1QW8s=
X-Google-Smtp-Source: ADFU+vt9NlqX5VwvH3hqxT/0yOAnpBSxgJG01AyujCyRptVAVxrCEn7YgBz/A3jPs5bnXssdbJBN9w==
X-Received: by 2002:a2e:9bd7:: with SMTP id w23mr2244277ljj.153.1583505259583;
        Fri, 06 Mar 2020 06:34:19 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id w20sm17108460lfk.25.2020.03.06.06.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 06:34:18 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH v2] pinctrl: qcom: ssbi-gpio: Fix fwspec parsing bug
Date:   Fri,  6 Mar 2020 15:34:15 +0100
Message-Id: <20200306143416.1476250-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We are parsing SSBI gpios as fourcell fwspecs but they are
twocell. Probably a simple copy-and-paste bug.

Tested on the APQ8060 DragonBoard and after this ethernet
and MMC card detection works again.

Cc: Brian Masney <masneyb@onstation.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: stable@vger.kernel.org
Fixes: ae436fe81053 ("pinctrl: ssbi-gpio: convert to hierarchical IRQ helpers in gpio core")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Renamed function pointer field to .populate_parent_alloc_arg
  as it is named upstream.
---
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
index fba1d41d20ec..338a15d08629 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
@@ -794,7 +794,7 @@ static int pm8xxx_gpio_probe(struct platform_device *pdev)
 	girq->fwnode = of_node_to_fwnode(pctrl->dev->of_node);
 	girq->parent_domain = parent_domain;
 	girq->child_to_parent_hwirq = pm8xxx_child_to_parent_hwirq;
-	girq->populate_parent_alloc_arg = gpiochip_populate_parent_fwspec_fourcell;
+	girq->populate_parent_alloc_arg = gpiochip_populate_parent_fwspec_twocell;
 	girq->child_offset_to_irq = pm8xxx_child_offset_to_irq;
 	girq->child_irq_domain_ops.translate = pm8xxx_domain_translate;
 
-- 
2.24.1

