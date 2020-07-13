Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8614721D923
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2020 16:51:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730340AbgGMOvB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jul 2020 10:51:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730113AbgGMOtm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2020 10:49:42 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D29CDC08C5DD
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 07:49:41 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id a6so16865720wrm.4
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 07:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P+J7h3HQX+/joqPOy6WiQHR4eToAn/yJ8zMEtEk80iA=;
        b=DbeFOb5vGhFBYRRXUN3KuTiXpQyQb3lNhA1qOhQUiHC1bngSe4WmjRro0MewmO5SvA
         nU2LN9gEPVX+pqlbP3P/6gx85OWfPOTlSSL5eIOSiqO+xx8m+3sk/8jDl1P5ToG6v4iV
         xzohAIXFSKqEnzj8P8sAjTkMJDk7vXufjDAJNitdG7U7ZqCNMd1cw71tgP5dsF4+neFo
         4QGFwMEkoZgQreEWsEAO1Apoc2zj4HTbRKtE03gaHTRxV/xqxVbhULD+La1zvby6h47N
         q6x3zcpwTLs4SEtqV+P488sD/Q7iBq7XP+vpVTEANGL4+8Bk9dQJGqkYc5Ttqy1ae81V
         zmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P+J7h3HQX+/joqPOy6WiQHR4eToAn/yJ8zMEtEk80iA=;
        b=O9fDTJeiE++Mhnq+3AjwY4MpiZGyYEnzP0adISdB0dIsbw5hAUkaxHvV2+lJyHHnkr
         HED4FGYXH1EcuJjL/PkT9PVbmnmIi6NJPxacrhfhHLd87Hu90gUu+80Ypw5dR7n1VxQF
         whdvUsLZn262wT55omFkiB3nXKtCGCdCBURbLYaJX7AjrNTYBiLQfNzu1+Z75WxeH9Mq
         zGTRXEiIPjy6ljT2xG5d37FQCUF6YM+FOlpk6sIcNs1hkGfaq1xpfdy1SFTRCJqfFJyr
         DXtm72m7gm0Kjz2rvf7rVd15eGtvYOahv+UfRA1G9faA9nVBzvZ401REQUSOez9+4AgR
         YfUg==
X-Gm-Message-State: AOAM533IheSvRtrpfUsiEDxLtuNCQIwdLb41BIh1uishxpt6l0dU5PIK
        kFfQ+m1fiAmSvkqqxJr9r0wuUg==
X-Google-Smtp-Source: ABdhPJynb3r4L6mscx+7FfoIIg3IVDr+bEskwUShaCmWgKsXhKMf81Y2wb/k1/OuQoXOJOxjXBXLpg==
X-Received: by 2002:adf:e3c5:: with SMTP id k5mr80764064wrm.121.1594651780552;
        Mon, 13 Jul 2020 07:49:40 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.6])
        by smtp.gmail.com with ESMTPSA id o29sm26207756wra.5.2020.07.13.07.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 07:49:40 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 07/25] pinctrl: samsung: pinctrl-s3c24xx: Fix formatting issues
Date:   Mon, 13 Jul 2020 15:49:12 +0100
Message-Id: <20200713144930.1034632-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200713144930.1034632-1-lee.jones@linaro.org>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Kerneldoc struct titles must be followed by whitespace.  Also attributes
need to be in the format '@.*: ' else the checker gets confused.

Fixes the following W=1 kernel build warning(s):

 drivers/pinctrl/samsung/pinctrl-s3c24xx.c:100: warning: cannot understand function prototype: 'struct s3c24xx_eint_domain_data '

Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/pinctrl/samsung/pinctrl-s3c24xx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-s3c24xx.c b/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
index 9bd0a3de101dd..5e24838a582f5 100644
--- a/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
+++ b/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
@@ -80,7 +80,7 @@ static const struct samsung_pin_bank_type bank_type_2bit = {
 	}
 
 /**
- * struct s3c24xx_eint_data: EINT common data
+ * struct s3c24xx_eint_data - EINT common data
  * @drvdata: pin controller driver data
  * @domains: IRQ domains of particular EINT interrupts
  * @parents: mapped parent irqs in the main interrupt controller
@@ -92,10 +92,10 @@ struct s3c24xx_eint_data {
 };
 
 /**
- * struct s3c24xx_eint_domain_data: per irq-domain data
+ * struct s3c24xx_eint_domain_data - per irq-domain data
  * @bank: pin bank related to the domain
  * @eint_data: common data
- * eint0_3_parent_only: live eints 0-3 only in the main intc
+ * @eint0_3_parent_only: live eints 0-3 only in the main intc
  */
 struct s3c24xx_eint_domain_data {
 	struct samsung_pin_bank *bank;
-- 
2.25.1

