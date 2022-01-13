Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D6D548DBB4
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jan 2022 17:26:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236656AbiAMQ0v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Jan 2022 11:26:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236653AbiAMQ0u (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Jan 2022 11:26:50 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DDDDC06161C
        for <linux-gpio@vger.kernel.org>; Thu, 13 Jan 2022 08:26:50 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id r16-20020a17090a0ad000b001b276aa3aabso19478791pje.0
        for <linux-gpio@vger.kernel.org>; Thu, 13 Jan 2022 08:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=npBib3KnStiwZAtrbLJqvr+A+8yK4FqQUbTllMeZ3VQ=;
        b=s2/4iYSFa8XHts7+q/OEyWRsscl7Q7AUw/wlLRJSTcLhTzdFkd/qWJT02fEz/0pLeM
         ZflaEW2ZF7sTGgo8gflu4tI9jZNj4Xhbm0xuTAqmp3S2kpeyPpHMBQ765XnWrsnio0Ek
         Z33llmQLQWePlvgrpgZ0cS6tGH7nkOMF+h45EgUxQ/9kU1mV6y+Wb/T5xlOT8m9g8jtG
         tt0qNJaBImZjwDuf3/8fHvtyKmmV4wXi/ka/Tig4dYsysfFwJkLGZ5EJmukEN5RajFmE
         Wa1hmnDpO7cNzkV8XQXJyfz5yba/Z2bNDqsJxkh22RgHgkMoZCYSMZB8cA4+oThkvyCD
         8i/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=npBib3KnStiwZAtrbLJqvr+A+8yK4FqQUbTllMeZ3VQ=;
        b=RcTO/dIw5RBp/xayXbLcln9KvHu4TBj/FY4nLYtnqVUMkyho7ljdfNiSXt5S/DDt2t
         WcSAKsHVW3h9dIUm4tcjROCx7/Shh8PCe2tigi+4LijsPqrsCLAt5LwoBkbByOVPjFem
         NFfzK34k1VSJ6eAdu6sN9L45SBkKozQOkVR4unbObvu3GbGd+ey+/X+lA4Qt+99BnNn4
         ncoRWoYBDFXjV9eQmZggVpgUxK1X1KJqwsEBRXt1IOiguP93dmXKVYV7rvB3DS/qSpeC
         PVBI9PxIcdVAohiKRv+VhAmVLGeyydmFG/voQTr0iXv97BTH8y78Cqbb9lOKRlc5dGeL
         SjeA==
X-Gm-Message-State: AOAM530MM1eNJBBeFn92oZu/JiIwxT/1deaORWND4x3dn0X93b7eNKMF
        vrjaqdsEhdGuK85W0D5+q2PW
X-Google-Smtp-Source: ABdhPJxUlAjlZWpGGpC+duPC5VDacjSRkY0IB4fgJPQqQrAOG4kEVXEXEk7H27RcJh3uBD8vDLDqgg==
X-Received: by 2002:a17:902:ce90:b0:14a:7166:a186 with SMTP id f16-20020a170902ce9000b0014a7166a186mr5322278plg.107.1642091209497;
        Thu, 13 Jan 2022 08:26:49 -0800 (PST)
Received: from localhost.localdomain ([202.21.43.95])
        by smtp.gmail.com with ESMTPSA id h11sm3033131pjs.10.2022.01.13.08.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 08:26:49 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     linus.walleij@linaro.org
Cc:     bjorn.andersson@linaro.org, dianders@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] pinctrl: qcom: Return -EINVAL for setting affinity if no IRQ parent
Date:   Thu, 13 Jan 2022 21:56:17 +0530
Message-Id: <20220113162617.131697-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The MSM GPIO IRQ controller relies on the parent IRQ controller to set the
CPU affinity for the IRQ. And this is only valid if there is any wakeup
parent available and defined in DT.

For the case of no parent IRQ controller defined in DT,
msm_gpio_irq_set_affinity() and msm_gpio_irq_set_vcpu_affinity() should
return -EINVAL instead of 0 as the affinity can't be set.

Otherwise, below warning will be printed by genirq:

genirq: irq_chip msmgpio did not update eff. affinity mask of irq 70

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 8476a8ac4451..a42ff4b22a04 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1157,7 +1157,7 @@ static int msm_gpio_irq_set_affinity(struct irq_data *d,
 	if (d->parent_data && test_bit(d->hwirq, pctrl->skip_wake_irqs))
 		return irq_chip_set_affinity_parent(d, dest, force);
 
-	return 0;
+	return -EINVAL;
 }
 
 static int msm_gpio_irq_set_vcpu_affinity(struct irq_data *d, void *vcpu_info)
@@ -1168,7 +1168,7 @@ static int msm_gpio_irq_set_vcpu_affinity(struct irq_data *d, void *vcpu_info)
 	if (d->parent_data && test_bit(d->hwirq, pctrl->skip_wake_irqs))
 		return irq_chip_set_vcpu_affinity_parent(d, vcpu_info);
 
-	return 0;
+	return -EINVAL;
 }
 
 static void msm_gpio_irq_handler(struct irq_desc *desc)
-- 
2.25.1

