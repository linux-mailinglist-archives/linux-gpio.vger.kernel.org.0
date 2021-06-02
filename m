Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74B06398DCF
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jun 2021 17:04:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231840AbhFBPGN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Jun 2021 11:06:13 -0400
Received: from smtp-35-i2.italiaonline.it ([213.209.12.35]:36435 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231739AbhFBPGL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 2 Jun 2021 11:06:11 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([79.17.119.101])
        by smtp-35.iol.local with ESMTPA
        id oSPulJDCssptioSPylKDIS; Wed, 02 Jun 2021 17:04:26 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1622646266; bh=otMkyO8mmmZfKvHT+/Zcvf3GzK59mQISHzymnGBqMz0=;
        h=From;
        b=FE4bp8S7TB7/N1WGxy+pLWClNRQQYXTk+Bl7IQnrLjoQq0LdG1j72vcGdOgGHlxgq
         rRhmBfsCaG0lUvxyyg7htkOv2PsLzF/1R7C3jHC6J8RtW9jLQUXFXudd77ck6qN8iy
         EGFZ1YmVk3Fc8dfze0mB9d379SM2ACC34dM3lsaHgiCHdOQKY4RANWxxgd6a5w6blF
         fNlS+Hj1LzWVIRJEsPFOnDmEILt7c5hY+iwdafdarKZIa/PrD1+iB7dUwnMB/qhU+R
         Qrj6WutzIjlOzpojefxl02nyPexvfOlMigBbEgRdj5Z76bJEEsryS/lHDTCVPlu0Wk
         8/0YRCiQgreLg==
X-CNFS-Analysis: v=2.4 cv=Bo1Yfab5 c=1 sm=1 tr=0 ts=60b79dfa cx=a_exe
 a=do1bHx4A/kh2kuTIUQHSxQ==:117 a=do1bHx4A/kh2kuTIUQHSxQ==:17
 a=KfjgPZeWCF2tvFJtEhQA:9
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dariobin@libero.it>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [RESEND PATCH] pinctrl: single: config: enable the pin's input
Date:   Wed,  2 Jun 2021 17:04:20 +0200
Message-Id: <20210602150420.18202-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
X-CMAE-Envelope: MS4xfPRpNhQ8ru7DLqMqjcjCX3txvzdzWumTwdHzyZHbCqVVP06F5WmQkwQhvE0hahIQ+8DI8AK8JGQJ6Z2j3AzF1adj3rOvdhm45wJ9YVKhiHOXXLZ2Rv3E
 +WAZMw5WAdgL6VVUIebsdxqKRnqP1NfaSxGRCXQ8Vzy825EBnxO3C7iv2xXgeXhxTIAcm+vKPDGGG+xlLq3/Y230PP1w42JggO9xAknTOaXqFYZjxWtHjjAy
 eDnpZk4RTxhBdohA6gn3N6jLW2oXAbeovlzZuR2jA7b3nrRNYBuqhgPl8TFlrJdxJKNt/czBgT+aNjV/Ck57T3LAcjFrvuY93/tKz/acJDDSc1yOJ22jxLrp
 4NEa+g51Du6bYr4zfeoBvFd4svMLbyJ7SNPaF2C/xK/8XUFvO9G7Iq/kwwg0uaQip9/ezFF1ccdnw3AeYMD8kiM3z9DR4fT3iahtSEk5sfKb0EtMlHcCUqR5
 W3UayXNIa6LaIGExMq2qn9ARNSL17l13qCFokw==
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It enables / disables the input buffer. As explained in the description
of 'enum pin_config_param' this does not affect the pin's ability to
drive output.

Signed-off-by: Dario Binacchi <dariobin@libero.it>

---

 drivers/pinctrl/pinctrl-single.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 2c9c9835f375..4e7cdb9ee855 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -534,6 +534,7 @@ static int pcs_pinconf_get(struct pinctrl_dev *pctldev,
 		case PIN_CONFIG_DRIVE_STRENGTH:
 		case PIN_CONFIG_SLEW_RATE:
 		case PIN_CONFIG_MODE_LOW_POWER:
+		case PIN_CONFIG_INPUT_ENABLE:
 		default:
 			*config = data;
 			break;
@@ -572,6 +573,7 @@ static int pcs_pinconf_set(struct pinctrl_dev *pctldev,
 			case PIN_CONFIG_DRIVE_STRENGTH:
 			case PIN_CONFIG_SLEW_RATE:
 			case PIN_CONFIG_MODE_LOW_POWER:
+			case PIN_CONFIG_INPUT_ENABLE:
 				shift = ffs(func->conf[i].mask) - 1;
 				data &= ~func->conf[i].mask;
 				data |= (arg << shift) & func->conf[i].mask;
@@ -918,6 +920,7 @@ static int pcs_parse_pinconf(struct pcs_device *pcs, struct device_node *np,
 	static const struct pcs_conf_type prop2[] = {
 		{ "pinctrl-single,drive-strength", PIN_CONFIG_DRIVE_STRENGTH, },
 		{ "pinctrl-single,slew-rate", PIN_CONFIG_SLEW_RATE, },
+		{ "pinctrl-single,input-enable", PIN_CONFIG_INPUT_ENABLE, },
 		{ "pinctrl-single,input-schmitt", PIN_CONFIG_INPUT_SCHMITT, },
 		{ "pinctrl-single,low-power-mode", PIN_CONFIG_MODE_LOW_POWER, },
 	};
-- 
2.17.1

