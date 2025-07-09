Return-Path: <linux-gpio+bounces-23007-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D08AFEC31
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 16:39:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF97F17367B
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 14:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91E592E62C6;
	Wed,  9 Jul 2025 14:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DN2G3XCM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678F82E54DA
	for <linux-gpio@vger.kernel.org>; Wed,  9 Jul 2025 14:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752071951; cv=none; b=Kvuy3YYrvmee3s1U8qHV9fCyX5XKIOo4+ulk44Z0T5R8XzOyjzkWSBMMaHDOL5K+gVva8ekVZFsNXheFmKygXhpI/uPnx0r2D+6++BowVsa1OvMpCgnLNZot4WJ9ajXZQMcTiWXqcjTcWWo30klwtqvnlRpKp1XsjIT/w3hzukE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752071951; c=relaxed/simple;
	bh=wDn/74XfpvokV8nWtZyxnEQPAbXH8hFUWEx7z9/fJrM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ii6l2QWZK0bOSwyhfFmI6AVaVQRgR8gd8q6y7YNSQ3ChTQwNqXkO5HaJksJ+ryx6hCD2fnbq6ZQgpnuiNstmXr+7pi38AqSK1GvsjWp35UOpXL2HZzBlpjAgcXasCrYIUUt2YKBSIOuL3Q1DGxyfcP9piUbgysidye4iih4B8yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DN2G3XCM; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45310223677so35532165e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Jul 2025 07:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752071947; x=1752676747; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=czHhdDldz+WtRX7ZZCzWNm4N0HL7u5F2xQoqfhztS9w=;
        b=DN2G3XCMPwoKJNd54IS/8VmR0SJEWl6Jrp5DtRuvzIB8VFKShjSiVeL4HCGOOnqizA
         o1l3X8n0LVtfz3/ToTwnXXbknaBPNboEMRBhWKR19nPjS0QZjaprQf0BiJiJv5Oseq4T
         kl6fvatYXHnXpGeK9LpK+KiIPWfQRpsGXNquJsT4DEDiWa9SVOqDaPSJOW4xSBfjEF7X
         xM8ee7tH9RGzWwEXrYGCrqQW9naMAhIr7I5tawbu5w5ENegRGQvvo44vJsGItQWyuDlF
         HTFVh5M59iDyvb78nepRJcw6GIMmPWPf5kcG35oDL+kdJF9W5bNZJXpVOozysAflfIYP
         kfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071947; x=1752676747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=czHhdDldz+WtRX7ZZCzWNm4N0HL7u5F2xQoqfhztS9w=;
        b=CuQoCkhD7DBPVbpjIH5Jebk/Ho+mrc18bjcaoCm4yK5uoquLVVZMBaVs+Uh8nFDNwo
         MaKAh5iboBACD1LkW8cYCDbtigc98f/HDX+C8CNlKxxG8bn3YubPRyCPxNcd43TueNbH
         tpXHmckr/Q25pjEVeSks+V3Z5IATjwn+VIESTN9nWJmxS26aBXy88xbJepczl/fPKqbd
         iKMNl1wn9pAdlwGcMcUErIx6XhB9OBvSsQwmgyitcLDC+WdPbA8aqgm4a0CnAhtdXCE4
         lj30/lbEFRNHeXLHWSS9k97wA/Q97jOMNeqqm0FKoLkuWRK5tPXjzovZ6sRcBirQz6kF
         EkEQ==
X-Gm-Message-State: AOJu0Yyx87sOsZyAh1t39O6LIoD6wqvfeGJv/vfyPQpidFqKlxtWLjy1
	3QeKzKCPDopwyK7i0KlIf/frk5RS6Z42gobfbvINeKBFNoaUxGzanKmOkagyaQdTWrfHyG6wn60
	h9U7ccE0=
X-Gm-Gg: ASbGnctM8MYUVgV4YyRxKAcae1fSAsXbnxz1qK9RX8XBJ6ierM2leV2MPE1r89Ce5Id
	LL29io/Dzbo6niE0nEs+B9IUkcUKY8bfYc+Mp3150DIJylLHx5BAxCVIJTAbkkOR2V4TPUYAyMj
	868NXRufjMpi71sm+Do9EEkk6mLhgy/rDrOlsARiYuDAuRsxyLGwchGeHcr33Cpzye6WHu4++b8
	9iyE7UYTVdfxP8pxdBy/FfqBEHE452EGhUArldIXLu46rZ0klhw3qIKRdtiCdW/BdHeIFnDvNPl
	B0Mrw7Cx4k4ZZetL3Wpt2STVTrfpj4sALpYKj5IeEVOLKRAVNKzIfvE=
X-Google-Smtp-Source: AGHT+IFuSbTCbzm4UMEs0fOr+CcLrwO9ZHO8Nn8PrkMXTiXu9SqobdbuxW9HdZqI8bmoCu470JLWgQ==
X-Received: by 2002:a05:600c:1d1a:b0:441:b19c:96fe with SMTP id 5b1f17b1804b1-454d5325799mr34930475e9.10.1752071947136;
        Wed, 09 Jul 2025 07:39:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5dfbf56c9sm4480687f8f.79.2025.07.09.07.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:39:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 16:38:58 +0200
Subject: [PATCH v2 02/12] pinctrl: provide pinmux_generic_add_pinfunction()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-pinctrl-gpio-pinfuncs-v2-2-b6135149c0d9@linaro.org>
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2925;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=sZ0ZigWm6IfbW3HtRq2G1M+nzP2iwa8TzMOAiF2WDhg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobn8F72btxi5xeLl0VGir38VLpRye250ZBWXiL
 84+vGLy9YyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG5/BQAKCRARpy6gFHHX
 crSgD/9hLC4vMhdUuY8NHszXt6pGR2JOyKALHXCJqrcP120vpjqVcXV6Yi2hSZFN5tt64Szp/+s
 k7YylnJQ+zLC2IAqbqw1fpG6gY0fc8RceGTgqd3aEJIxwmekzOanlrSlfYOIz92Lj5hkfK1fQcN
 k1oXCPeX/oiBsCBKMgaF7w8oJ7H2kk2WFsYz44TN6CgqwpPH35bdMMtoD28g72S8FXLjdCHP7FD
 XepmoIsrZnknzd/4SGXiwlc4Cfl04BG9WU+kdB/+L8dOM23tvqZdCOiRrGdk0Y4ir4J+FpXF5oo
 +cCtRWMvmseaVLsSXqmHgNmiE7FzA0jGXqk4KHB43zZEi0m6t9/LKC3lUA8LQQgVeD0YH7nftY2
 deBpEtvp8lZw6+a1B3Y8/CzikfdewCMMB1j/1Wi1gDYVqyVldNDtiokONcvXIe0HZT8rZ1fWOhC
 nlzGki7r6QHuQ5/91jKveZtcw+MBK2cdqASSzFzeTDhvnSg+9BVhlHQ+cdsE5dl1VPj4c3xbzZa
 B3QWEpWthBDOhY8wbnWCOvOpK0C/IJx7i7j4eONBtNUK/JuWNAIO6HAgttJyeTUTbtB+aE2Pk4m
 1sNPDY4sXpmj2JJiu+FN8kf8MUdXFxrIcMq85K+dk69b737YT8Kxr29poEWjBkE+arImbDKPqBs
 3ClmLcrCq4JhxBw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Several drivers call pinmux_generic_add_function() passing it the
contents of struct pinfunction as first three arguments. We can make
this shorter by simply providing an interface allowing to pass the
address of struct pinfunction directly when adding a new function.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinmux.c | 24 ++++++++++++++++++------
 drivers/pinctrl/pinmux.h |  3 +++
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index daa7a11adabf672f802a8e9577c14e4da56b8678..8f2fe7ffc4f682cd966728f3c77c504489f7f8a0 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -876,14 +876,26 @@ int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
 				const char * const *groups,
 				const unsigned int ngroups,
 				void *data)
+{
+	struct pinfunction func = PINCTRL_PINFUNCTION(name, groups, ngroups);
+
+	return pinmux_generic_add_pinfunction(pctldev, &func, data);
+}
+EXPORT_SYMBOL_GPL(pinmux_generic_add_function);
+
+/**
+ * pinmux_generic_add_pinfunction() - adds a function group
+ * @pctldev: pin controller device
+ * @func: pinfunction structure describing the function group
+ * @data: pin controller driver specific data
+ */
+int pinmux_generic_add_pinfunction(struct pinctrl_dev *pctldev,
+				   const struct pinfunction *func, void *data)
 {
 	struct function_desc *function;
 	int selector, error;
 
-	if (!name)
-		return -EINVAL;
-
-	selector = pinmux_func_name_to_selector(pctldev, name);
+	selector = pinmux_func_name_to_selector(pctldev, func->name);
 	if (selector >= 0)
 		return selector;
 
@@ -893,7 +905,7 @@ int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
 	if (!function)
 		return -ENOMEM;
 
-	function->func = PINCTRL_PINFUNCTION(name, groups, ngroups);
+	function->func = *func;
 	function->data = data;
 
 	error = radix_tree_insert(&pctldev->pin_function_tree, selector, function);
@@ -904,7 +916,7 @@ int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
 
 	return selector;
 }
-EXPORT_SYMBOL_GPL(pinmux_generic_add_function);
+EXPORT_SYMBOL_GPL(pinmux_generic_add_pinfunction);
 
 /**
  * pinmux_generic_remove_function() - removes a numbered function
diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
index 5c039fd09f7474b4c104d3c36e0e8b8dc73a2ddd..bdb5be1a636ead9695410824b5557937c5baa89a 100644
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -161,6 +161,9 @@ int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
 				unsigned int const ngroups,
 				void *data);
 
+int pinmux_generic_add_pinfunction(struct pinctrl_dev *pctldev,
+				   const struct pinfunction *func, void *data);
+
 int pinmux_generic_remove_function(struct pinctrl_dev *pctldev,
 				   unsigned int selector);
 

-- 
2.48.1


