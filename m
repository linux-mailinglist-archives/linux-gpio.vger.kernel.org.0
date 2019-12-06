Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83CCE115618
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Dec 2019 18:08:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726322AbfLFRIe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Dec 2019 12:08:34 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45045 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726284AbfLFRId (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Dec 2019 12:08:33 -0500
Received: by mail-lj1-f193.google.com with SMTP id c19so8361464lji.11
        for <linux-gpio@vger.kernel.org>; Fri, 06 Dec 2019 09:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=37DobpBRHG+Arri5XimcII7cjm39P54Z6MB80sywBSk=;
        b=qatgVOSVmLDVIp7XgklEyOrDj/rrXlD3wp53NTIRuEwUOcHm2tOXL1DzqXSD7Z7wrt
         KM+uScEywd8QAeCfxvxV/aRUqrb2O4Vl3MgzlqI+EyJodTnO1i7wiVdjpjTuatbTMGMe
         cMtJH2V5rMA2kFwCC3JgC7Vqgzgi/P9zR8ixpAZ+uNJbnUa5TLwtJDk6twqd8U/zzFE/
         qGee7bOUpV8uaBGGP/Y88SYCCnWwB0bknzMjtm4DK84R5/p3UbnQuXM3Bgo3CeE4mZN6
         vufKoWaUJyLHWP7un4AjgtF/JrEXV+RZeqkNterX5bq1pTRt0UFpf9ViTWLs9eWiHRmH
         icNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=37DobpBRHG+Arri5XimcII7cjm39P54Z6MB80sywBSk=;
        b=aJL2htAgEToLatGBSX3jXc/eH8023/yHy+HqfnCqpJTEtE9uStnDHqZ+SRSUMSG2II
         NDLKeLnjTnRq8mzQADnHG8AN78r17ptj6eLtUgO534ifr14uaj4SKdH0lAyQ6ikaX0u8
         UJ7UkiJfcNX5PNCvSTmhfDjOlObMzq9U3FAhv0A3LbSCL71nPKlltrodV4epDDCByEad
         KqMqHiwJlwc074cP6M/tmzfwz7NQ4ZkINEfwWrkdVQHiBUo2YPAUHRx9EXsyGRY9X1MO
         tScOMj4jqe/HVPRzOG1pgkjTyp7t5jOFnj7HPhs2FPyh7/K01wsCoCHUtN3C35E462jb
         s9Yw==
X-Gm-Message-State: APjAAAUqUL2FeR+65X0fR3B+ytySn81jVBdATLPZtWp1TqLx/XTzITJp
        s5jM4eUNRzWWMMWMWcz4EAwarw0mx0A=
X-Google-Smtp-Source: APXvYqyn0sVnGRizZai+AQWeTt9ieJhl8y01vZ/9+O7HbMDJ/P3f23zp74dIJYlEog1R0TX0hOvNUg==
X-Received: by 2002:a05:651c:112d:: with SMTP id e13mr8015393ljo.99.1575652111308;
        Fri, 06 Dec 2019 09:08:31 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-210.NA.cust.bahnhof.se. [158.174.22.210])
        by smtp.gmail.com with ESMTPSA id z9sm6905283ljm.40.2019.12.06.09.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2019 09:08:30 -0800 (PST)
From:   Ulf Hansson <ulf.hansson@linaro.org>
To:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Russell King <linux@armlinux.org.uk>
Subject: [PATCH 3/9] mmc: mmci: Convert to pinctrl_select_default_state()
Date:   Fri,  6 Dec 2019 18:08:15 +0100
Message-Id: <20191206170821.29711-4-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191206170821.29711-1-ulf.hansson@linaro.org>
References: <20191206170821.29711-1-ulf.hansson@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Let's drop the boilerplate code for managing the default pinctrl state and
convert into using the new pinctrl_select_default_state().

Additionally, move away from using pinctrl_pm_select_default_state() as
it's scheduled for removal and use pinctrl_select_default_state() instead.

Cc: Russell King <linux@armlinux.org.uk>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/mmc/host/mmci.c | 12 ++----------
 drivers/mmc/host/mmci.h |  1 -
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 40e72c30ea84..caaa4687de93 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -1704,7 +1704,7 @@ static void mmci_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 		if (ios->bus_mode == MMC_BUSMODE_OPENDRAIN)
 			pinctrl_select_state(host->pinctrl, host->pins_opendrain);
 		else
-			pinctrl_select_state(host->pinctrl, host->pins_default);
+			pinctrl_select_default_state(mmc_dev(mmc));
 	}
 
 	/*
@@ -1877,14 +1877,6 @@ static int mmci_probe(struct amba_device *dev,
 			goto host_free;
 		}
 
-		host->pins_default = pinctrl_lookup_state(host->pinctrl,
-							  PINCTRL_STATE_DEFAULT);
-		if (IS_ERR(host->pins_default)) {
-			dev_err(mmc_dev(mmc), "Can't select default pins\n");
-			ret = PTR_ERR(host->pins_default);
-			goto host_free;
-		}
-
 		host->pins_opendrain = pinctrl_lookup_state(host->pinctrl,
 							    MMCI_PINCTRL_STATE_OPENDRAIN);
 		if (IS_ERR(host->pins_opendrain)) {
@@ -2203,7 +2195,7 @@ static int mmci_runtime_resume(struct device *dev)
 		struct mmci_host *host = mmc_priv(mmc);
 		clk_prepare_enable(host->clk);
 		mmci_restore(host);
-		pinctrl_pm_select_default_state(dev);
+		pinctrl_select_default_state(dev);
 	}
 
 	return 0;
diff --git a/drivers/mmc/host/mmci.h b/drivers/mmc/host/mmci.h
index 158e1231aa23..12d4ed8af88a 100644
--- a/drivers/mmc/host/mmci.h
+++ b/drivers/mmc/host/mmci.h
@@ -404,7 +404,6 @@ struct mmci_host {
 	struct mmci_host_ops	*ops;
 	struct variant_data	*variant;
 	struct pinctrl		*pinctrl;
-	struct pinctrl_state	*pins_default;
 	struct pinctrl_state	*pins_opendrain;
 
 	u8			hw_designer;
-- 
2.17.1

