Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E54BEAD85
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2019 11:35:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbfJaKfR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 31 Oct 2019 06:35:17 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43541 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726922AbfJaKfQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Oct 2019 06:35:16 -0400
Received: by mail-wr1-f65.google.com with SMTP id n1so5626227wra.10;
        Thu, 31 Oct 2019 03:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hgkkSSSNB3cUyb1Wf7G1LNn8lte7ZZugUGgXlr9SjTk=;
        b=TGp9ToQjwqyVkWrRLNgGHwRSJvAjxzIiJIuCo9MAOcb6ndXHHS93pBQvVLYUli0NFl
         PvTInQHIQ7vq+gWskvedTFMahDwRQ/FEnHZImTY2UULix+zs0kcArTS0eK6v7u+iYtVB
         Bt5cwvEmwjWDi44pxd/Stt84i9gNgW9R9JrL/lDbrvu9jmXlwpjNIoB0cM8/nDxmcseY
         he75Jc9/ZGBARqpm1BzApKv6ho9wvQuEJpx/fwHczEuDg0GP4aXbfBhKraqx8QARaKui
         MkodH9C8YiaIeZEqTuHe2404hnMbsmkAwEeFg/hGE4vhdFnMEX8eslYNSP4KqLai3mrH
         R0Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hgkkSSSNB3cUyb1Wf7G1LNn8lte7ZZugUGgXlr9SjTk=;
        b=tTqgEtnnTnackMMIBaf9FZXyD0rRGBSivqQhjm5G8EaiiFIirTzizOAd2OZHCWZToE
         f0eJ+aUhAawJkeGotTbaG58GSVZ9TbuixF9ikujAqRAXczJ+6tqN/rAT7KyRvo857TTY
         aQSJNr1h3oiNizrHproqKSH2yNHi6Gw8BN4p4I8Lo+eTbPONyBvZrHSoQb7FKIUeLBOE
         W9KHW2UgRqrlnc24E9dPlLxOXjFZXkuBfg6y+ZM68sxTBOMFmmIaAeGIUHDHaGB6Oev0
         kYDn5yrHdH3Aw/X0CDs6zbow6WP7EXM449mMnaj6blGaBqfIX4YOKUDYy7K01K65sUgk
         ioPA==
X-Gm-Message-State: APjAAAWg1i7Dr0lGU2IeCq/UnKJsOHTfPIuIPPFR7Pnz1ZDKX3+jlhgp
        Fm6j4KWDDlPxGN4u5tHFDHWYazQtPsg=
X-Google-Smtp-Source: APXvYqzjD4ElMCPiaOWmEASb+Rwpbbeq4NU0Fp13O33PNPS4bDkrWo1iliNB8HD85a+xt2qhOqXRJg==
X-Received: by 2002:adf:e64f:: with SMTP id b15mr4533831wrn.372.1572518113792;
        Thu, 31 Oct 2019 03:35:13 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id o15sm3414687wrv.76.2019.10.31.03.35.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Oct 2019 03:35:13 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, bjorn.andersson@linaro.org,
        agross@kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 3/4] pinctrl: qcom: spmi-mpp: Add PM/PMI8950 compatible strings
Date:   Thu, 31 Oct 2019 11:35:06 +0100
Message-Id: <20191031103507.30678-4-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191031103507.30678-1-kholk11@gmail.com>
References: <20191031103507.30678-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

PM8950 and PMI8950 have four MPPs and this driver is compatible.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
index 91407b024cf3..48602dba4967 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
@@ -915,6 +915,8 @@ static const struct of_device_id pmic_mpp_of_match[] = {
 	{ .compatible = "qcom,pm8841-mpp" },	/* 4 MPP's */
 	{ .compatible = "qcom,pm8916-mpp" },	/* 4 MPP's */
 	{ .compatible = "qcom,pm8941-mpp" },	/* 8 MPP's */
+	{ .compatible = "qcom,pm8950-mpp" },	/* 4 MPP's */
+	{ .compatible = "qcom,pmi8950-mpp" },	/* 4 MPP's */
 	{ .compatible = "qcom,pm8994-mpp" },	/* 8 MPP's */
 	{ .compatible = "qcom,pma8084-mpp" },	/* 8 MPP's */
 	{ .compatible = "qcom,spmi-mpp" },	/* Generic */
-- 
2.21.0

