Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C6B844910
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2019 19:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728958AbfFMRNn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Jun 2019 13:13:43 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:38539 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728962AbfFLV7k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jun 2019 17:59:40 -0400
Received: from orion.localdomain ([95.115.5.111]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MTREY-1i4mQQ0iFQ-00TkDW; Wed, 12 Jun 2019 23:59:38 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org
Subject: [PATCH] include: linux: gpio: fix build warnings on undefined struct pinctrl_dev
Date:   Wed, 12 Jun 2019 23:59:36 +0200
Message-Id: <1560376776-21994-1-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
X-Provags-ID: V03:K1:qp5w8WJ5kjoBxuPrGVaQvHJnswpsq3PO6LN0pXiQKB3UvsEWn/A
 B3hzhs2UjG0Y9HqziiCeosWcGzX/RNTqUoY0ctV/0Dnj6x5IY0vnsxi+TxfdogogyrJbkHE
 ltu3yq217K4S3f1j0eNvGLS/PWnTMqX5GZbJorctSOHDnAPyXY9D50oLXRN9uGjh2GtZsxZ
 kfEVGbNqXtHMQkrHsif1A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Zu0FjJYGsXE=:CG9qQEeSZjvZER/4XQo5kI
 YXdr4XMAsDbq6YDcilUTExdahK7gT+2YZ/ILZDc1VmZopMgSCd0MjzX7Yeq9KlvN/H1CuzJmt
 FtTk5hletnzw20f/CnBsCch02tPnXZcmCaRYuxVi1PPxgjOen642bEwyY0X12e63+yg7lA6Ap
 Yv1I3kqVPXpZ1+OYdAWnTDUvIonalHLYjd9s9yfL93MKS48rPm0/dwF3AEwFmDvmQRjqiLfMK
 KVmKTSqhniav07k95/dCbNYIOdpdqYPGmGmjV4C57qriVwGfOzzi4f4YkNwJkLAjNqqVBxntH
 FhDIKviNQhnKOtlz3TiEdxfAk1GYG8F4MHbvrFuhpP6/B1ePkC2xvEf2PqPFS/7QUekFvNjK9
 2EZa2CaeJ9fGTl8BzfkPCX/GX+0to/z3DruHSnm7k3e8Q1rXpRU1zVWd2C68hDDRZ6knOnlW+
 samidTtVSOqBw7EDjaRUrPOeiq9jub6EefVBFM19paGryOKwkuqMnv0Trd1g+/zNhFI+I+iFl
 EAk2nmnRRhaooGdN+9p+zoZg4p4TfgyzfxwbLhfKKawqsMBY6+TRYwJ723vhTWP3YLSt8zBKj
 UgZdzV7U3ioqxzaEGwQr7qhE8XT+ju/C6YZhwqnbWaO6lMRXj/dR/x8O+oV2L7h0Ow43AB03D
 LINUoIH+5Gi+cfQ3OSrkH0VZOg4Tk6NY1TgMpCiLhoROhVfArtFcPLuP8fYthmso6Bu/5h/E0
 82hFIxW6j+HRdNwpRgIbU3RI2u5mK7hZ/ARU7w==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

This fixes the warnings:

* include/linux/gpio.h:254:11: warning: 'struct pinctrl_dev' declared
  inside parameter list will not be visible outside of this definition
  or declaration
* include/linux/gpio/driver.h:602:11: warning: 'struct pinctrl_dev'
  declared inside parameter list will not be visible outside of this
  definition or declaration

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 include/linux/gpio.h        | 1 +
 include/linux/gpio/driver.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/include/linux/gpio.h b/include/linux/gpio.h
index 39745b8..40915b4 100644
--- a/include/linux/gpio.h
+++ b/include/linux/gpio.h
@@ -106,6 +106,7 @@ int devm_gpio_request_one(struct device *dev, unsigned gpio,
 
 struct device;
 struct gpio_chip;
+struct pinctrl_dev;
 
 static inline bool gpio_is_valid(int number)
 {
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index a1d273c..b58b27c 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -590,6 +590,8 @@ int gpiochip_add_pingroup_range(struct gpio_chip *chip,
 
 #else
 
+struct pinctrl_dev;
+
 static inline int
 gpiochip_add_pin_range(struct gpio_chip *chip, const char *pinctl_name,
 		       unsigned int gpio_offset, unsigned int pin_offset,
-- 
1.9.1

