Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6776D48B3DE
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jan 2022 18:29:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241262AbiAKR3c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jan 2022 12:29:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244562AbiAKR3b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Jan 2022 12:29:31 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 987FAC06173F
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 09:29:30 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id x6so58888101lfa.5
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 09:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1dyx3JMmfCy7HamMHYIBuvqSZRxrBg+RDXrqMKbYhS0=;
        b=mNNCbThQsgKjNG1QL9Bz+MW02q3+6XtX+P8yiRpiIofsQ2c0YYueiUM/acb+AHNVtN
         e2F7HjFs7HDNuuOx5Cw+4tT5QRGQc65OY+T48CChwEugshAjcQT4k3MVoHOXs6H73Tyb
         X+8RbdpO3GxU3O8Wa1DWOl1e25YMVnnf48O7SR1JuIggyb6p98bCNQw7kPqxY3MrwLhd
         ABOyQ7xCHmjbeOvXj5VVhNANZNqtPwWoMTJKu3kF1dE4CW8IU+eWOxAytAtPNGNocmmn
         0pfV0qMr+Q2DrzF8I5XU47TsobBWT8fh/eJlDfUTbV2povCuD7+7B6WxXZXbGQxBvRCy
         5r0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1dyx3JMmfCy7HamMHYIBuvqSZRxrBg+RDXrqMKbYhS0=;
        b=moDMKOMIgSsOBQtix1CuPf2rE9CN+HNwJ/HJVZx1PcncKvsdMAUtiOnnAIFOtr3gIH
         St9+J7YGMwML6X4YcjjYyb3z1KfLA0rdgD127YuYD2UD53E27oZ4YAUNFTwrTsz3pZyq
         o3IKxn8iCwSovbDoRqphndZ17UsNeetO5zf3YClKEC3si9uGhqVQ+iA/3kfOPBVLZSk4
         beviiq8mhSm/a3I0eJZeW7USdo8ZQN2lYq3tlj0U6TCPy7BWLdfDb60hxrkCOjToAwDl
         YQqCh5YjGdK/u04oDPsfrZj6kVzk38ZrTGhKK9I1+NeEO1ZFCgooGF7g0/OCwtebLf5O
         /BQg==
X-Gm-Message-State: AOAM532zrWaOEB5TrbOoVDhGkfo/1V+oFWBC//gjJBOHm6w1FbUSPhyd
        Wgm838uG071EbGBmxQipPXY=
X-Google-Smtp-Source: ABdhPJyErQtbHP857i8tuRdk4cUqdeoqxUAR/VIaUJPnDsMTYVC/XQlLKSW//k9fSTrtsU0uLJRXYA==
X-Received: by 2002:a2e:9245:: with SMTP id v5mr3800420ljg.149.1641922169030;
        Tue, 11 Jan 2022 09:29:29 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id f3sm107311lfg.52.2022.01.11.09.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 09:29:28 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
        linux-gpio@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 5.17 2/2] pinctrl: thunderbay: rework loops looking for groups names
Date:   Tue, 11 Jan 2022 18:29:19 +0100
Message-Id: <20220111172919.6567-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220111172919.6567-1-zajec5@gmail.com>
References: <20220111172919.6567-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

Make the outer loop iterate over functions as that's the real subject.
This simplifies code (and reduces amount of lines of code) as allocating
memory for names doesn't require extra checks anymore.

While at it use local "group_names" variable. It fixes:
drivers/pinctrl/pinctrl-thunderbay.c: In function 'thunderbay_add_functions':
drivers/pinctrl/pinctrl-thunderbay.c:815:8: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
  815 |    grp = func->group_names;
      |        ^

Ref: c26c4bfc1040 ("pinctrl: keembay: rework loops looking for groups names")
Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/pinctrl/pinctrl-thunderbay.c | 71 ++++++++++------------------
 1 file changed, 25 insertions(+), 46 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-thunderbay.c b/drivers/pinctrl/pinctrl-thunderbay.c
index 4756a23ca572..79d44bca039e 100644
--- a/drivers/pinctrl/pinctrl-thunderbay.c
+++ b/drivers/pinctrl/pinctrl-thunderbay.c
@@ -773,63 +773,42 @@ static int thunderbay_build_groups(struct thunderbay_pinctrl *tpc)
 
 static int thunderbay_add_functions(struct thunderbay_pinctrl *tpc, struct function_desc *funcs)
 {
-	struct function_desc *function = funcs;
 	int i;
 
 	/* Assign the groups for each function */
-	for (i = 0; i < tpc->soc->npins; i++) {
-		const struct pinctrl_pin_desc *pin_info = thunderbay_pins + i;
-		struct thunderbay_mux_desc *pin_mux = pin_info->drv_data;
-
-		while (pin_mux->name) {
-			const char **grp;
-			int j, grp_num, match = 0;
-			size_t grp_size;
-			struct function_desc *func;
-
-			for (j = 0; j < tpc->nfuncs; j++) {
-				if (!strcmp(pin_mux->name, function[j].name)) {
-					match = 1;
-					break;
-				}
-			}
-
-			if (!match)
-				return -EINVAL;
-
-			func = function + j;
-			grp_num = func->num_group_names;
-			grp_size = sizeof(*func->group_names);
-
-			if (!func->group_names) {
-				func->group_names = devm_kcalloc(tpc->dev,
-								 grp_num,
-								 grp_size,
-								 GFP_KERNEL);
-				if (!func->group_names) {
-					kfree(func);
-					return -ENOMEM;
-				}
+	for (i = 0; i < tpc->nfuncs; i++) {
+		struct function_desc *func = &funcs[i];
+		const char **group_names;
+		unsigned int grp_idx = 0;
+		int j;
+
+		group_names = devm_kcalloc(tpc->dev, func->num_group_names,
+					   sizeof(*group_names), GFP_KERNEL);
+		if (!group_names)
+			return -ENOMEM;
+
+		for (j = 0; j < tpc->soc->npins; j++) {
+			const struct pinctrl_pin_desc *pin_info = &thunderbay_pins[j];
+			struct thunderbay_mux_desc *pin_mux;
+
+			for (pin_mux = pin_info->drv_data; pin_mux->name; pin_mux++) {
+				if (!strcmp(pin_mux->name, func->name))
+					group_names[grp_idx++] = pin_info->name;
 			}
-
-			grp = func->group_names;
-			while (*grp)
-				grp++;
-
-			*grp = pin_info->name;
-			pin_mux++;
 		}
+
+		func->group_names = group_names;
 	}
 
 	/* Add all functions */
 	for (i = 0; i < tpc->nfuncs; i++) {
 		pinmux_generic_add_function(tpc->pctrl,
-					    function[i].name,
-					    function[i].group_names,
-					    function[i].num_group_names,
-					    function[i].data);
+					    funcs[i].name,
+					    funcs[i].group_names,
+					    funcs[i].num_group_names,
+					    funcs[i].data);
 	}
-	kfree(function);
+	kfree(funcs);
 	return 0;
 }
 
-- 
2.31.1

