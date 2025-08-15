Return-Path: <linux-gpio+bounces-24430-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A8625B27CAA
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 11:18:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA39B622F38
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 09:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E1F22E9752;
	Fri, 15 Aug 2025 09:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UdEKzRpN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC4C259C9A
	for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 09:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755248987; cv=none; b=I+3N7n5taLAshLBKwv2a7iT2vlSR+11utIRhYU59PTcCb7RLLU6ABqIvWJY7bIYPUQ5ZjvQAy+3M0OzhPVfat9xMSQAjaYJdTwC4sx19zNg41iPXO49mTB7sI4i2STZue11MEqZCIylw768LN8MG2Cl6gjYPRIB85Vr9ZeOkozY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755248987; c=relaxed/simple;
	bh=w5oPtVBROi/7Y9FQHD66FlpdPS7R+xegird3g2AxhQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kjMzcF8krJ6C1X47ADQuH0lTrZHi6qoVIPvaYgp3ulpx/HJRRgJQ0FLoxP7odsewccJ9aR6i4bJ2mLrQYK9I7rxbH838XrAMmRBY2/AcI6ve3svwZsYDQSKG5g41prIkOLMNG3WHqH0Q5Bb4/8LYgxecLNqO3fFDJAZPY/2FPcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UdEKzRpN; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45a1b0d224dso9258695e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 02:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755248976; x=1755853776; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+2WJcuXshs43B8tgQ0eqFMBEBoYTyTVQjjLj/OzbqHU=;
        b=UdEKzRpNFf22kKF42IUSMtgKC22b858pHuFkUFJ9jZa/bsjlRswVYVOYHHzfUOjKx4
         tDNvktek3jDsmcU+KPiU50AAR6WXtVZtF9kL3TFbnAk1uFj4c/kmHLT+GAPZ5Pd4L9/5
         3FYVr0NFDC+8PHNP0TjxteaFhrAper+zjp5cVIxZtbg7nG2PUQRPPbdmDGcFX7fJDLcx
         JR39FSXB0JhFwRuzxtWem3AiXKKdnh4Taz9vacFCyrg57pgY3kv5a6+IMU+RFYJfmkJK
         GvzKAADwL/DxxKOqrT2EEScEKk5CZc4GJfcxL2bEGp6v2klgp4MJ6qDHktykgCmvdqKQ
         Mmgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248976; x=1755853776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+2WJcuXshs43B8tgQ0eqFMBEBoYTyTVQjjLj/OzbqHU=;
        b=ZhwIJY5lAJke1ILzAYchtlFWZQQBRRgRZ9WUzBDxA3pl+B07HZX1iNh010v0tcI5mZ
         c6VQoZbDUwPEKKaugitEoxS2MEoCNAnLg7BFO8/NVQbJzsLclP/7Z0s4e42AWDEApiBr
         DarMphAwVlEnCk1qAi0psSNYpHmNm4ZIbC1nOTSjQ4Xe9sMEkQUR9KVKkTKvNy+9uILs
         B1hQ09AQbnkqkFPK4yeTX1Wvg2kFFOg44LPO0TWJb+CoYIJpoel8jB4FKFDHwY9RC33s
         oEF0SalOHE6FQL8OemUsRhaXnV8PuxCvlaHG2ang2p73YuC4tmYR5FAk4AioOVOrrcDD
         gV0Q==
X-Gm-Message-State: AOJu0Yxrz850bdnaICE917CSKlayxMFVv4TMv6i59CHoD0o4xOPJL7zq
	sNwnqHACF0mu7P7XOPlDFUZ6N7K5V7d8nFFd7lvSc3WI317yBm3bunwiqdt3oP2rk6w=
X-Gm-Gg: ASbGncvE7EFCAF+ICPbscaFKYM+itqqujLEMz0VBIhmQ1IasPfEmycUfi7he1FS11eS
	4lgeE8gaawjGgkqS1zEybPfPIJaDEM/hu126QD94LXTBYGLpaCrtLNGBbMNh4GzH0PIt63vh3iS
	nEcWT87za4pP/rUuiu6jonMeSHNadbq5oUo6kjuBtQQTYr9U9aUBdkTtPZToi2GAKuLcBJ/ioRP
	EUHOtvl+OvqcAlJ7ZlG9p8Jm/BhnewTRxS5pe6N6+A0AzGlCgmHj64NVJj0XJAT0ZoJdc04YSRH
	wdDmLPNw2adtVMfg/VTTqL+uVBpJO6fdTgZWZlH2z8vazYhSt6vmN5zEoZZIpGDKOVWHqGwJZTd
	bIkVfesvak7sgJ9cHiR+A+snGgjUs
X-Google-Smtp-Source: AGHT+IGtFuboeVNKDciYaG+Wue0vo4F6BgRJxWOmOLF1DSz5Cu3XHJ3qRVrOSZqH3ZFOO5JCnPO6Rw==
X-Received: by 2002:a05:600c:b90:b0:459:eeaf:d6c7 with SMTP id 5b1f17b1804b1-45a218578fbmr11412825e9.26.1755248976374;
        Fri, 15 Aug 2025 02:09:36 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a125:bd3e:6904:c9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9a67sm1205210f8f.35.2025.08.15.02.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 02:09:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 15 Aug 2025 11:09:14 +0200
Subject: [PATCH v5 12/15] pinctrl: allow to mark pin functions as
 requestable GPIOs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-pinctrl-gpio-pinfuncs-v5-12-955de9fd91db@linaro.org>
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
In-Reply-To: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6852;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=WMZHoUXGJzQjV7RXxreXxMNKpdMVHjmxzsHXmgnkdQ4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBonvk5bgkY5AXm9FPgfoovthCOalkecv+3yu+Ic
 3T3XjvXPjqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJ75OQAKCRARpy6gFHHX
 coJOD/4tMSbksBGkrhvSda2Cd3mhG3iDPTFzcr/DoZYk3If/6C4nByO6VnEq/0I0YP9wPf9KHgq
 Bwy5IGngCFqV4uov0W3dhUrQQuX7lBXzklakhg4DkwhyrQMiOPTf5wkfU8hHdYD9DgIoN7bpWg6
 ZN5X6ZOCsfRhMpnJaecsr/eHvdG6DfTknJ6uMp9uH7/zQ8dcIZarHD3m9ACV9y0tq+Q+hr9xkWs
 1AkVphL5gdR/HstzkuztJDlEnK74CtoCYvnxhPvb5XuLQaf3gtdiTCdAFWjKe4SLJVus/1fXdw6
 B0ODk7/3X+Zfvv/fAe2aRZl7a+glcMhswDoHmtaeJMQiKzO06Xwv0AzfEcx4mJO52khpixxxauS
 XKNNrjuHOeZyifJi9z6kmjbHp3zIEGXILQRqhhRK9T3JaCydQN3L6wIIwVbm16oo53i/w05bSBT
 iOLB6+laIvJGNGQeXDyL5me90VUhmVAKflPgknGK5ZQvlaVsojfdrW6QFT9M1Pk/+yQmZXH2xMD
 8LC/7eFAOzLR77etZjxow/DW6YGXP+u7RiF7Oqe+FonXjipug6doGLhu2t2pQkG4EKr8QjX5CPo
 /vbX8C0DRcZ1v+bRLvxw1aUfyPyto0eROYdnui3xAqZt7ky8XvlnT1WEOMVMOVIhvvZL2QZCKuA
 1gbeKaA6NUwwdvg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The name of the pin function has no real meaning to pinctrl core and is
there only for human readability of device properties. Some pins are
muxed as GPIOs but for "strict" pinmuxers it's impossible to request
them as GPIOs if they're bound to a devide - even if their function name
explicitly says "gpio". Add a new field to struct pinfunction that
allows to pass additional flags to pinctrl core. While we could go with
a boolean "is_gpio" field, a flags field is more future-proof.

If the PINFUNCTION_FLAG_GPIO is set for a given function, the pin muxed
to it can be requested as GPIO even on strict pin controllers. Add a new
callback to struct pinmux_ops - function_is_gpio() - that allows pinmux
core to inspect a function and see if it's a GPIO one. Provide a generic
implementation of this callback.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinmux.c        | 39 +++++++++++++++++++++++++++++++++++++--
 drivers/pinctrl/pinmux.h        |  3 +++
 include/linux/pinctrl/pinctrl.h | 14 ++++++++++++++
 include/linux/pinctrl/pinmux.h  |  2 ++
 4 files changed, 56 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 6f5e3ede972bbfa78e279790df359632e2d63485..730108467bcc226622185b53a1590c683ff19afc 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -89,13 +89,20 @@ bool pinmux_can_be_used_for_gpio(struct pinctrl_dev *pctldev, unsigned int pin)
 {
 	struct pin_desc *desc = pin_desc_get(pctldev, pin);
 	const struct pinmux_ops *ops = pctldev->desc->pmxops;
+	const struct pinctrl_setting_mux *mux_setting;
+	bool func_is_gpio = false;
 
 	/* Can't inspect pin, assume it can be used */
 	if (!desc || !ops)
 		return true;
 
+	mux_setting = desc->mux_setting;
+
 	guard(mutex)(&desc->mux_lock);
-	if (ops->strict && desc->mux_usecount)
+	if (mux_setting && ops->function_is_gpio)
+		func_is_gpio = ops->function_is_gpio(pctldev, mux_setting->func);
+
+	if (ops->strict && desc->mux_usecount && !func_is_gpio)
 		return false;
 
 	return !(ops->strict && !!desc->gpio_owner);
@@ -116,7 +123,9 @@ static int pin_request(struct pinctrl_dev *pctldev,
 {
 	struct pin_desc *desc;
 	const struct pinmux_ops *ops = pctldev->desc->pmxops;
+	const struct pinctrl_setting_mux *mux_setting;
 	int status = -EINVAL;
+	bool func_is_gpio = false;
 
 	desc = pin_desc_get(pctldev, pin);
 	if (desc == NULL) {
@@ -126,11 +135,16 @@ static int pin_request(struct pinctrl_dev *pctldev,
 		goto out;
 	}
 
+	mux_setting = desc->mux_setting;
+
 	dev_dbg(pctldev->dev, "request pin %d (%s) for %s\n",
 		pin, desc->name, owner);
 
 	scoped_guard(mutex, &desc->mux_lock) {
-		if ((!gpio_range || ops->strict) &&
+		if (ops->function_is_gpio && mux_setting)
+			func_is_gpio = ops->function_is_gpio(pctldev,
+							     mux_setting->func);
+		if ((!gpio_range || ops->strict) && !func_is_gpio &&
 		    desc->mux_usecount && strcmp(desc->mux_owner, owner)) {
 			dev_err(pctldev->dev,
 				"pin %s already requested by %s; cannot claim for %s\n",
@@ -861,6 +875,27 @@ pinmux_generic_get_function(struct pinctrl_dev *pctldev, unsigned int selector)
 }
 EXPORT_SYMBOL_GPL(pinmux_generic_get_function);
 
+/**
+ * pinmux_generic_function_is_gpio() - returns true if given function is a GPIO
+ * @pctldev: pin controller device
+ * @selector: function number
+ *
+ * Returns:
+ * True if given function is a GPIO, false otherwise.
+ */
+bool pinmux_generic_function_is_gpio(struct pinctrl_dev *pctldev,
+				     unsigned int selector)
+{
+	struct function_desc *function;
+
+	function = radix_tree_lookup(&pctldev->pin_function_tree, selector);
+	if (!function)
+		return false;
+
+	return function->func->flags & PINFUNCTION_FLAG_GPIO;
+}
+EXPORT_SYMBOL_GPL(pinmux_generic_function_is_gpio);
+
 /**
  * pinmux_generic_add_function() - adds a function group
  * @pctldev: pin controller device
diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
index 653684290666d78fd725febb5f8bc987b66a1afb..4e826c1a5246cf8b1ac814c8c0df24c4e036edd2 100644
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -169,6 +169,9 @@ int pinmux_generic_remove_function(struct pinctrl_dev *pctldev,
 
 void pinmux_generic_free_functions(struct pinctrl_dev *pctldev);
 
+bool pinmux_generic_function_is_gpio(struct pinctrl_dev *pctldev,
+				     unsigned int selector);
+
 #else
 
 static inline void pinmux_generic_free_functions(struct pinctrl_dev *pctldev)
diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
index d138e18156452e008f24ca06358fcab45135632f..1a8084e2940537f8f0862761d3e47c56c8783193 100644
--- a/include/linux/pinctrl/pinctrl.h
+++ b/include/linux/pinctrl/pinctrl.h
@@ -11,6 +11,7 @@
 #ifndef __LINUX_PINCTRL_PINCTRL_H
 #define __LINUX_PINCTRL_PINCTRL_H
 
+#include <linux/bits.h>
 #include <linux/types.h>
 
 struct device;
@@ -206,16 +207,20 @@ extern int pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
 				  const char *pin_group, const unsigned int **pins,
 				  unsigned int *num_pins);
 
+#define PINFUNCTION_FLAG_GPIO	BIT(0)
+
 /**
  * struct pinfunction - Description about a function
  * @name: Name of the function
  * @groups: An array of groups for this function
  * @ngroups: Number of groups in @groups
+ * @flags: Additional pin function flags
  */
 struct pinfunction {
 	const char *name;
 	const char * const *groups;
 	size_t ngroups;
+	unsigned long flags;
 };
 
 /* Convenience macro to define a single named pinfunction */
@@ -226,6 +231,15 @@ struct pinfunction {
 		.ngroups = (_ngroups),			\
 	}
 
+/* Same as PINCTRL_PINFUNCTION() but for the GPIO category of functions */
+#define PINCTRL_GPIO_PINFUNCTION(_name, _groups, _ngroups)	\
+(struct pinfunction) {						\
+		.name = (_name),				\
+		.groups = (_groups),				\
+		.ngroups = (_ngroups),				\
+		.flags = PINFUNCTION_FLAG_GPIO,			\
+	}
+
 #if IS_ENABLED(CONFIG_OF) && IS_ENABLED(CONFIG_PINCTRL)
 extern struct pinctrl_dev *of_pinctrl_get(struct device_node *np);
 #else
diff --git a/include/linux/pinctrl/pinmux.h b/include/linux/pinctrl/pinmux.h
index d6f7b58d6ad0cce421aad80463529c9ccc65d68e..6db6c3e1ccc2249d4b4204e6fc19bf7b4397cc81 100644
--- a/include/linux/pinctrl/pinmux.h
+++ b/include/linux/pinctrl/pinmux.h
@@ -66,6 +66,8 @@ struct pinmux_ops {
 				    unsigned int selector,
 				    const char * const **groups,
 				    unsigned int *num_groups);
+	bool (*function_is_gpio) (struct pinctrl_dev *pctldev,
+				  unsigned int selector);
 	int (*set_mux) (struct pinctrl_dev *pctldev, unsigned int func_selector,
 			unsigned int group_selector);
 	int (*gpio_request_enable) (struct pinctrl_dev *pctldev,

-- 
2.48.1


