Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56B151997C6
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2020 15:46:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730760AbgCaNqO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Mar 2020 09:46:14 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:37189 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730464AbgCaNqO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Mar 2020 09:46:14 -0400
Received: by mail-ed1-f68.google.com with SMTP id de14so25181780edb.4;
        Tue, 31 Mar 2020 06:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k9iFkUv/TiZl3HgGTqXLWemi0HPo7uSDDfYUPzhdtQs=;
        b=VAJaQezvUIXW0JtKvg4nJQyzDsFwQRtkm/Pl2EBAWLgxlsH3V6xkUCdiuqdIjPaz2u
         DUEzMDtVU5h5RI4e+vRxP4+vPEYHMSL6pVNUDYcAQhZweeNTMjHm2IFM6pCYa7su8rbG
         rxCfFWPbutoXgRvqCO2YgR+p26VJcR7yD/+W0MptnQ2Kn3m32FMiCu2Za9A+e4uKy0S5
         8RjXNdTdMdu/NdxHQtSkPmuK8mu3jYN90jEsgls4gJidFO6lxlnfcXSKsfth+WMMUjdV
         OgqNy4RlsiQI+elSEPl6MxWGscpQGqXe3OFTz7DObxOIxUpRd4IifKxCW2PcMbzOhIZh
         6BFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k9iFkUv/TiZl3HgGTqXLWemi0HPo7uSDDfYUPzhdtQs=;
        b=A0M9v3IZcRdvD0q4ROVjz4WA9IvD8atOUblmf6xQDxMCWPj8myJIiuk856qNGP8mT2
         sTVObRi21Z/fwoSvDb0PW7N4ju3bo2d/btWNhquHaPbucZ5v9ZawBuY5Tfwoc3qarzJ9
         OP19kEjSjHVhsgTJIisiPqV1etdKNTQa52ZqdKtJEZxs9WBbVHYfp2/I/8/5mlJ4XOnC
         YFAbNlhjJDZkHPBDj+txIGgJcEwZuznDADhVysmkNyFjnL/mEgrzunWutmSqNxlUaQg0
         oL+X56fxus1GCNvFK5kxVjsAnuQzwFjNPIkcaDDpJCj4lNjQREsXGMXEXheRHtWb24gZ
         NaQw==
X-Gm-Message-State: ANhLgQ2aRiMuEH/lPhiQsKc70/xhzKLNomtfwI26cgPGE5HOO1Hn+zIj
        kOUkD6KSTJAttO3v/KL1TBA=
X-Google-Smtp-Source: ADFU+vs3GVIst9Q+kxS8w/a3i/jqFsjS/ByGTLFBoBbq1TegvWlLXjaIE7b3oLTZbHPzlcQjITmBEg==
X-Received: by 2002:a50:af02:: with SMTP id g2mr16579181edd.69.1585662372208;
        Tue, 31 Mar 2020 06:46:12 -0700 (PDT)
Received: from Ansuel-XPS.localdomain (host203-232-dynamic.53-79-r.retail.telecomitalia.it. [79.53.232.203])
        by smtp.googlemail.com with ESMTPSA id p25sm2258514ejw.49.2020.03.31.06.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 06:46:11 -0700 (PDT)
From:   Ansuel Smith <ansuelsmth@gmail.com>
To:     Andy Gross <agross@kernel.org>
Cc:     Ansuel Smith <ansuelsmth@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: qcom: fix compilation error
Date:   Tue, 31 Mar 2020 15:46:03 +0200
Message-Id: <20200331134603.13513-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pinctrl: qcom: use scm_call to route GPIO irq to Apps has a typo in the
patch and introduced a compilation error.

Fixes: 13bec8d4 pinctrl: qcom: use scm_call to route GPIO irq to Apps
Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 2ef00882d1ce..5f7a6c64eea6 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -905,7 +905,6 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 			dev_err(pctrl->dev,
 				"Failed routing %lu interrupt to Apps proc",
 				d->hwirq);
-		}
 	} else {
 		val = msm_readl_intr_target(pctrl, g);
 		val &= ~(7 << g->intr_target_bit);
-- 
2.25.1

