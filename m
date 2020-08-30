Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1B1C2570E9
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 00:43:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbgH3Wni (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 30 Aug 2020 18:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726430AbgH3Wne (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 30 Aug 2020 18:43:34 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9AFDC061236;
        Sun, 30 Aug 2020 15:43:33 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id r13so4616762ljm.0;
        Sun, 30 Aug 2020 15:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KEUzSA4q//EBqQAYEpEkzByFT4+1BXoradZGNUlBCSY=;
        b=QRqE2eCEbHVmuG8xWIb9W0wmYSDJ8NnrJLiXGosfpMNOxfC6CBqMkdJ2LAdURj4Wwa
         RfeYbzsEwEQbyp9ToIpFycYk439kU/p6AioB4gaRlWXPqXQ4NJnqUYa/l+wPinov15pP
         Fk5sjKnyA086K/55U0OSiSb6+b/mrn33yq+gm1Adq69axQYHtupplb+z1j8HqTJJEzm9
         1BnePamC86uebQ1pFZ7y82CD68RtecJrPLyfX0ahmMXE0CEIcTOq97ItcgqPx9uillDr
         bsCgAZ9VfHOqqJC2IQxRpg7HzuU4Q1TgyFdrOHBlmKtMUYa/6WBGvZt9nuMlgnSdPj31
         gs0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KEUzSA4q//EBqQAYEpEkzByFT4+1BXoradZGNUlBCSY=;
        b=lbi1TmrJa0MwCA5FVTrstMR3ZStP0qVfE6ElpYvbX5LLKb9TixvQceHRJnTSs1aP3T
         tmPsy2Rz2MFxTxMMAPvLnS3ag4x42mx3G/N4pPFHKkBeE6yeqT+HSMPWfWGxSQtFH7mE
         eYdrftdbRbzma1pnLr/leYXl9pJ0nLC+A4ETiGznGBIE4e8NvlyXA0DHp+29m934ub5N
         E5hAZXrIIcXTWH740XeWC6f5XBtalb5QxPm7faDPdUNBT1vGNbgzbEet425i5uJmQKXl
         BeEqck5M2mGtZKT42Kjq31sd7fMzXd2Llg8ISzKOxM5MXgQ11s9rm8um89xl2R2oEZG/
         O49Q==
X-Gm-Message-State: AOAM532zTL2bTD9ZUed6b53BNQmJiVlVR1+WLwzB/danTFJAOwKdbaqV
        ep9RSyH5euKIKMlAUuLUjDI=
X-Google-Smtp-Source: ABdhPJwKaEqcS0vhFOHFI1DyCcgdPZscVlYHUkJdrdqDbPNpkus7Q5OtsN2iReaMrYB0z0IHFo15+w==
X-Received: by 2002:a2e:501c:: with SMTP id e28mr2667963ljb.331.1598827409504;
        Sun, 30 Aug 2020 15:43:29 -0700 (PDT)
Received: from localhost.localdomain (h-82-196-111-59.NA.cust.bahnhof.se. [82.196.111.59])
        by smtp.gmail.com with ESMTPSA id m25sm1190072ljg.79.2020.08.30.15.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 15:43:28 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH 1/3] pinctrl: actions: pinctrl-owl: Constify owl_pinctrl_ops and owl_pinmux_ops
Date:   Mon, 31 Aug 2020 00:43:09 +0200
Message-Id: <20200830224311.36994-2-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200830224311.36994-1-rikard.falkeborn@gmail.com>
References: <20200830224311.36994-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The only usage of owl_pinctrl_ops and owl_pinmux_ops is to assign their
addresses to the pctlops and the pmxops fields in the pinctrl_desc struct,
which are const pointers. Make them const to allow the compiler to put them
in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/pinctrl/actions/pinctrl-owl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/actions/pinctrl-owl.c b/drivers/pinctrl/actions/pinctrl-owl.c
index 7efdfb4f3e9b..903a4baf3846 100644
--- a/drivers/pinctrl/actions/pinctrl-owl.c
+++ b/drivers/pinctrl/actions/pinctrl-owl.c
@@ -125,7 +125,7 @@ static void owl_pin_dbg_show(struct pinctrl_dev *pctrldev,
 	seq_printf(s, "%s", dev_name(pctrl->dev));
 }
 
-static struct pinctrl_ops owl_pinctrl_ops = {
+static const struct pinctrl_ops owl_pinctrl_ops = {
 	.get_groups_count = owl_get_groups_count,
 	.get_group_name = owl_get_group_name,
 	.get_group_pins = owl_get_group_pins,
@@ -212,7 +212,7 @@ static int owl_set_mux(struct pinctrl_dev *pctrldev,
 	return 0;
 }
 
-static struct pinmux_ops owl_pinmux_ops = {
+static const struct pinmux_ops owl_pinmux_ops = {
 	.get_functions_count = owl_get_funcs_count,
 	.get_function_name = owl_get_func_name,
 	.get_function_groups = owl_get_func_groups,
-- 
2.28.0

