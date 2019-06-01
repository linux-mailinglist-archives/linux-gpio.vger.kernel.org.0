Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0056032043
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Jun 2019 19:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726075AbfFAR4W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 1 Jun 2019 13:56:22 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46001 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbfFAR4W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 1 Jun 2019 13:56:22 -0400
Received: by mail-wr1-f67.google.com with SMTP id b18so8502096wrq.12
        for <linux-gpio@vger.kernel.org>; Sat, 01 Jun 2019 10:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E0cHNFy5gDg41HCIv+Ws6zQZpjqg/63XwafEKIw29x0=;
        b=kZluv1I0dPzhVvKM1xoP7u2NgneoaywMk/qw04oYezIX1ADcmL8ABVZKBTzIZkLrI9
         DH5ITWmzOunZOl9BFORRKXx5QZBXxCHbMsTM/TWcrR3WIO6H9Lmieqxnc6N+tjXoQ7IQ
         Pab5JV8JKE+/KS0bqnk8tLPrd3h6dkooeRDTtTnz0/S10HxpS5W3BnM4qFmP+25pF6Ru
         AY7JHiAF1d3nXf7OOWuoNxkFWJlB352eYWV8/bnhZJQsvKmRC02mgP59qyjlYvSEZbjy
         lsy6uJrv+K0YdFfIpndk39LPNfGdQ+DUXzSkQRhBvOf3JUVlfCcG6ODXBBsbE3l1E42F
         0WKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E0cHNFy5gDg41HCIv+Ws6zQZpjqg/63XwafEKIw29x0=;
        b=ZY9hG4XP2b/o08UxcGNf46k3l62lHw1gkseRvZELLFLE27ITZRwowlL0v7HoJpwiSv
         nsWT3tVtbEIx+A4OqoIIfWev+qblmI8QZGQf1D/uh2A82nMSOm1IpaSZMN63dq3nbP4E
         lnZQxeXeaVdKvz2DsQ/OuqxSGfxAriMhc32dsy31Gawv4KZh2g3hOIULV8SO497YlFja
         OoPR5KmiBjRJxUAt31iOtJO0dcmyXLkFLIt+bfUWgQqnd3X7fJTTW4ASTKVCnFW/8xJ9
         gEEkJVa4X1NjRa/AI2Ct0Pp+wrsQFh2L7XP2MtIi8j0SPsTBc2dHdVm2adcPxUlvbBnD
         fkig==
X-Gm-Message-State: APjAAAV+wXt5ORCZSxf4HdyLJxZ14FbjzQn4R8HGPfWLdIHoy1M3GFoD
        Zsph7IKLiAt1/Kb2NR9t6PtkhQbzJ7U=
X-Google-Smtp-Source: APXvYqwlaZq1Mow6dtLoHbNdevhcnjQBL1RZnCgXU1CWUjO16Bylqgdtnx7AM7WQOajokhv+i8c1ng==
X-Received: by 2002:a5d:5452:: with SMTP id w18mr10486900wrv.327.1559411780564;
        Sat, 01 Jun 2019 10:56:20 -0700 (PDT)
Received: from localhost.localdomain (catv-89-135-96-219.catv.broadband.hu. [89.135.96.219])
        by smtp.gmail.com with ESMTPSA id 67sm18309946wmd.38.2019.06.01.10.56.18
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 01 Jun 2019 10:56:19 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH] pinctrl: stm32: Add links to consumers
Date:   Sat,  1 Jun 2019 19:56:12 +0200
Message-Id: <20190601175612.26498-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Using STM32 as guinea pig after Alex's initial positive
test to see if this is something we should encourage
in general and make default behaviour.

Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:  Alexandre Torgue <alexandre.torgue@st.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 92e35fb930be..b453aed1bbeb 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -1438,6 +1438,7 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	pctl->pctl_desc.owner = THIS_MODULE;
 	pctl->pctl_desc.pins = pins;
 	pctl->pctl_desc.npins = pctl->npins;
+	pctl->pctl_desc.link_consumers = true;
 	pctl->pctl_desc.confops = &stm32_pconf_ops;
 	pctl->pctl_desc.pctlops = &stm32_pctrl_ops;
 	pctl->pctl_desc.pmxops = &stm32_pmx_ops;
-- 
2.20.1

