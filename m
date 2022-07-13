Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1870C573FC4
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Jul 2022 00:52:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbiGMWwR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Jul 2022 18:52:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbiGMWwO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Jul 2022 18:52:14 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B51B4F1B9
        for <linux-gpio@vger.kernel.org>; Wed, 13 Jul 2022 15:52:06 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id w12so186614edd.13
        for <linux-gpio@vger.kernel.org>; Wed, 13 Jul 2022 15:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=stZpBbowQ4JXsl3+qFdFMsOHzSSp0WYkDAkDM37YMIA=;
        b=v+KZEubMaBdREU/pP/e/zkd+MvLexj34FKRa5LqBSjS0H68kqV4FXUFZQd7Sq1BX/b
         B5w7e/1L28hdLlSd1urjSpu87u7qRGiFVQCexts/UGf+hblsXX/eOx8CRAocd8vldqwl
         yTUcoX5jRRQi4n9nBxgaWMQ0QaSHeQJjBm330Ex01pWHCw3zRAx38ilNE+PAnlv/ms35
         j3TIW4kOSO7YJRCt/muUqk+uRaXZSa+YOy7IeVOCv6zyb1t9Lz0bgDc6Ilb6TZMDc+eq
         a0fo1DfTv/Y5WbU6DEDKbYdMSgbVkuzjH76Py5YksBYIqdU6s+MEIms5AO6o4kUPyfKt
         kWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=stZpBbowQ4JXsl3+qFdFMsOHzSSp0WYkDAkDM37YMIA=;
        b=x+JgHoi3bPfUXDtfLd2pgGBk1ghyWdtvibsdjJYyEEJQyQmfhaQy0alUwid7XLngcE
         32VbWrcswPRUm6SZXPZEFkXF+tj6KU11WsQ+nqVkkmhZU3Mp1EJiHGJffv4c2nLHs2Wp
         nTMp5t39J670/oicSWpRo4iwpbZ7h9TuYDeQWQLYRf2n26XWDRb8Pel2XB+QEvz3INY+
         OrwvT1Im7/Ve33q6uMVlPlHi7zK1tj5DDoLo++OuCEwO/5d+w2jz7qHavtsH7ec73CxW
         sI9iWIeUgM/LnBn3BLkrWjbyZ3+5bqDulPqn1nuLuofG2F8w0YsrioT3acvsLiq3wZ52
         NaVg==
X-Gm-Message-State: AJIora+ahPmTUEJ3DbD6Hg/Mt9xPnYPzBIpmCm9R+MGWNsw08klQMQvP
        nW/6VvVlUdKLirRTw0Lb3nGkA+OJU4Vt7sgm
X-Google-Smtp-Source: AGRyM1umGO0qrr8AgNbz3XiiWBS3vkCRIXdxYww4o+K9pPN8OPoKZNwsBYV7kQSbfnMatopz/e2R7w==
X-Received: by 2002:aa7:dcc2:0:b0:43a:b180:bb12 with SMTP id w2-20020aa7dcc2000000b0043ab180bb12mr7869979edu.119.1657752725014;
        Wed, 13 Jul 2022 15:52:05 -0700 (PDT)
Received: from fedora.robimarko.hr (dh207-98-197.xnet.hr. [88.207.98.197])
        by smtp.googlemail.com with ESMTPSA id kw11-20020a170907770b00b006f3ef214e27sm5538254ejc.141.2022.07.13.15.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 15:52:04 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     linus.walleij@linaro.org, colin.foster@in-advantage.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 2/2] pinctrl: ocelot: fix pinconf
Date:   Thu, 14 Jul 2022 00:51:51 +0200
Message-Id: <20220713225151.1476041-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220713225151.1476041-1-robert.marko@sartura.hr>
References: <20220713225151.1476041-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Commit "pinctrl: ocelot: convert pinctrl to regmap" moved to using
regmap_read/write, however it neglected to also carry out alignment
to register stride of 4.

This would cause the following error:
[    1.720873] pinctrl-ocelot 6110101e0.pinctrl: pin_config_set op failed for pin 34
[    1.728110] sdhci-sparx5 600800000.mmc: Error applying setting, reverse things back

So, regmap_read would return -EINVAL as it was being passed address
of the pin without stride, so for example pin 34 would end up being
0x22 in hex.

Fix this by accouting for the stride in register address.

Fixes: 076d9e71bcf8 ("pinctrl: ocelot: convert pinctrl to regmap")
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/pinctrl/pinctrl-ocelot.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
index 84bfbe649b67..a71145367b15 100644
--- a/drivers/pinctrl/pinctrl-ocelot.c
+++ b/drivers/pinctrl/pinctrl-ocelot.c
@@ -1327,7 +1327,9 @@ static int ocelot_hw_get_value(struct ocelot_pinctrl *info,
 	if (info->pincfg) {
 		u32 regcfg;
 
-		ret = regmap_read(info->pincfg, pin, &regcfg);
+		ret = regmap_read(info->pincfg,
+				  pin * regmap_get_reg_stride(info->pincfg),
+				  &regcfg);
 		if (ret)
 			return ret;
 
@@ -1359,14 +1361,18 @@ static int ocelot_pincfg_clrsetbits(struct ocelot_pinctrl *info, u32 regaddr,
 	u32 val;
 	int ret;
 
-	ret = regmap_read(info->pincfg, regaddr, &val);
+	ret = regmap_read(info->pincfg,
+			  regaddr * regmap_get_reg_stride(info->pincfg),
+			  &val);
 	if (ret)
 		return ret;
 
 	val &= ~clrbits;
 	val |= setbits;
 
-	ret = regmap_write(info->pincfg, regaddr, val);
+	ret = regmap_write(info->pincfg,
+			   regaddr * regmap_get_reg_stride(info->pincfg),
+			   val);
 
 	return ret;
 }
-- 
2.36.1

