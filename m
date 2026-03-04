Return-Path: <linux-gpio+bounces-32482-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHFBLxFvqGkkugAAu9opvQ
	(envelope-from <linux-gpio+bounces-32482-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 18:42:41 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6892A205517
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 18:42:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C12683087D06
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2026 17:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58A6936D4FB;
	Wed,  4 Mar 2026 17:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vw/46ORT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7631B37D119
	for <linux-gpio@vger.kernel.org>; Wed,  4 Mar 2026 17:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772646077; cv=none; b=p3FVMP9dXqj2meFhz7z6vzDYTm4y+E+V7QjCJf+lVGzEv1h54EDS6XxC5obGgxu8PNPc/W2pxgWA1VW+RMQWDWsICdLox/OyEhiV7zNZPRrJtxinuj2NN/3WH8ubREsQ4rgqW2mvY4ps3QGAcv+Io5sMNhPvvTdN8Z43rgjBkE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772646077; c=relaxed/simple;
	bh=RntdKYFLAqg2iNXVxuafdBAsXRNURhR71Krw3kGsMIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KJg4KbY0m8Y0VIaRGltzzQEJf9pvoETu0Sx4gaTvFtEOWgPjRK30Bmw4rBhhNVMonGzzQDo9+bY7mafdurz936ZEQal43gBU5vzi0iuz1u7bi1gp4tPRM6UVawv4v0PbrraX6jltlmKKAPsFUTVTgu7/XfQkACH2HJAaoM+F/rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vw/46ORT; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439b73f4ab4so3877523f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Mar 2026 09:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772646074; x=1773250874; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=phFcdh2W64G8LFWfgDYerHMrQ1P5VQC8qaDtjGt/hBo=;
        b=vw/46ORTCxtzLRY5lHj1wL5ncdkrFEWFrj9ji/DsIgL+CvGhUOGEM+ObFKs7ErBa0O
         7yYEdTCmADlOqGnFRZuizrXwqWxJWuyqqi6oPiVIprjQ6KJ9cXcMIliX7pLdQJKOAkT1
         9QUYklnsxFmjO5vcVa++rgBZD44W3DnIcYTQNLoTpu2Ei5NzV9zjjfjYnnprD0ND9gPk
         4UNbOxkmpoFZCFLq9t7FwOJtBJy95buLed5kWw8er/eWMgnCJzIBs6VIce4QENg76Lhz
         Oe4ugh0BuK5yDg1BIW5PgUGo1nBXypxhtGLyKqpWKyWIPfgT9PfTBswVc8uPcJE8xt2m
         CwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772646074; x=1773250874;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=phFcdh2W64G8LFWfgDYerHMrQ1P5VQC8qaDtjGt/hBo=;
        b=uk56JVp2VY0ORgSXYRbFjk8YWZfvSS8NLnYle3Ap7zRUlWeqMXn8Bj22rHqaHo/NtN
         42Rx2OQx3PsD3kF/bmtNkxOu5lNab0jf9TshtjiA2dniyTCRgKO++Ao4Q6vdIp64++/U
         D6cdfNaE+5QowSq9JZVZwDx+ELVgLAclbhyy5f5/UvE3AuB/jASJyGZOefkVpcGZsf0r
         ZI0+HatHacOfiSOY0BnN9uy9wVxXHXfuCPChtDh3tmHdvdRXoB2yPQTSy9EM1wwBCVex
         GueMneHsjGLiX2jr6gocB5fZduORR2sz90RE/f7LwejTPIdpfVMUwOQkrpvgx97wg3AL
         vqIg==
X-Forwarded-Encrypted: i=1; AJvYcCXxJ4JNRvL7OfOUjqY/91RJh1oQM+r5j+yn+/BG+hwl8uxJEyWb86eYZP413BnLdQMRC4sZI3qNaxvw@vger.kernel.org
X-Gm-Message-State: AOJu0YzqaKsCrDUvVBVmKXTlz1LOu33HkCOmw0vPvQuhmzlab0TYljxJ
	rkAyttbgvHYnW/lJhTnRANfD9C0epoF8mwzzHMMn4f5AUqnUNQG7gb0Ziq8VYt+S+MuVsQVes59
	+AiRJtXk=
X-Gm-Gg: ATEYQzw+wCH62HtQyedtTsh9ofIhqgTqQOuHpBJPyibXXfwAAl9ri0jbLFv00o6dNvW
	jX4Ciq+agNhG38x5Fg9lfHWo38DfSR5L+872z4miLXv+kfljNqwW0ciQrejKevYjnJJ9U5tsueN
	QeoHmR6a7JC7G1knpGC1mQiitlBKMt1GKShP/VXf2zVMzBlNm5Z/eLwAEbXmxFudzAOOAWqZO4H
	ua/zj+EK/00FwrAwfZj6Q64HbhOfDUd5ftutO0kETehPdPEuuZ+d+kDbKOSf12QlXhaAovAWOBU
	low9n0WK+Ue4weNaR/ZDnL7kRPcbwEZ/dBd1p5fznAmJuKMwShC95UXgZqiWCEQ4SxagRZAfzTD
	WdK+/6FETHOM81zpSWjSDW0U6AXkcubBueXUQTVeJDlTpg4kLBxOf9AW1m4keiuIVH6IQ6OFN6g
	nknYfMwjpOikqFd1s6hlZVO0NrDfx4nhDh7uYt1Ir5IhG7
X-Received: by 2002:a05:6000:2884:b0:439:b991:5c07 with SMTP id ffacd0b85a97d-439c80146f0mr5128989f8f.40.1772646073589;
        Wed, 04 Mar 2026 09:41:13 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ab6ebe56sm33783749f8f.15.2026.03.04.09.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 09:41:13 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 04 Mar 2026 18:41:08 +0100
Subject: [PATCH] pinctrl: qcom: spmi-gpio: implement .get_direction()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-topic-sm8x50-spmi-gpio-get-direction-v1-1-a25612161fba@linaro.org>
X-B4-Tracking: v=1; b=H4sIALNuqGkC/x3NQQqEMAxA0atI1hOItZ0Z5yriQmrsZKEtTRFBv
 LvF5d+8f4JyFlb4NSdk3kUlbjXaVwP+P22BUebaYMi8qSOLJSbxqOv3cISaVsGQJGLggrNk9qU
 CaLrlY6l3zvoJKpUyL3I8m2G8rhv7L7GVdgAAAA==
X-Change-ID: 20260304-topic-sm8x50-spmi-gpio-get-direction-23f7409554ca
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 "Ivan T. Ivanov" <iivanov@mm-sol.com>, Rob Herring <robh@kernel.org>, 
 Fenglin Wu <quic_fenglinw@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2365;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=RntdKYFLAqg2iNXVxuafdBAsXRNURhR71Krw3kGsMIE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpqG64irsi8N17h8N5sbgUg7bcexvc72hMsxp3iQji
 oQtx6MiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaahuuAAKCRB33NvayMhJ0SUQD/
 4oj0zKoE/6ULkgVSaCUseQ2L/e3YD3GwdQQX6Mhd6fcEy2Jn+isdzqAM84NaQMgewuwij8ekxHdmuN
 NrhyP/7/9JqsjoJZa1bY8R2I0EbUmgxpiKInTuii1NOyDkscCTViufhXrty4dxYxGPF4qOvDV5IUPN
 VCtEjDrYgdON+Bjjd5Dy8fMIRLTlfWCD6dheVjI6Jd5H83a9tnvu5BxtlcKW9LhoQ7joTGChIxk1uE
 zAcv3uLLxn0CZAFq/1TXnpkO9oKbiywgsQb8LNpRh2gCmzkTkjZYqu+W4Y0Gv+OrmS7wylqnRX3y2s
 SjnutBvPrFD33fHGDKlDDsye5qOLMOAVDcZF3XqCeWJL4sesw7yUqPy7+Al/Ritgz5BAZOmzhJ9p+g
 JP5XnZAXTRJd3kNeKJbijj2TiQ36rA47q9LMccEgnfjW7t8dO6/XVAWnhplgha6agf4RWFGfB4Al2M
 N2B49Lf7j8+HI/i/Ssa4ad5mQO+V2CmsZroBC/KHFmqXqAZpnafR13D4up6wZH7MEc2e072kLPfhDm
 RCTV7qMb+QdASJ75d6ouXt/i7aLGNCuh9Fc+VjJddJRnnQXJU6/Ato9RQ6iiuCMd3JcpbX6WzTRnrC
 9ZwRXvU0d/nDUw/2jUGVtm/yOMRSv0GW0+69Ue8GC8b1Ojcme4AtqQJRoXfg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Queue-Id: 6892A205517
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32482-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Action: no action

GPIO controller driver should typically implement the .get_direction()
callback as GPIOLIB internals may try to use it to determine the state
of a pin. Since introduction of shared proxy, it prints a warning splat
when using a shared spmi gpio.

The implementation is not easy because the controller supports enabling
the input and output logic at the same time, so we aligns on the
behaviour of the .get() operation and return -EINVAL in other
situations.

Fixes: eadff3024472 ("pinctrl: Qualcomm SPMI PMIC GPIO pin controller driver")
Fixes: d7b5f5cc5eb4 ("pinctrl: qcom: spmi-gpio: Add support for GPIO LV/MV subtype")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 83f940fe30b2..d02d42513ebb 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -723,6 +723,21 @@ static const struct pinconf_ops pmic_gpio_pinconf_ops = {
 	.pin_config_group_dbg_show	= pmic_gpio_config_dbg_show,
 };
 
+static int pmic_gpio_get_direction(struct gpio_chip *chip, unsigned pin)
+{
+	struct pmic_gpio_state *state = gpiochip_get_data(chip);
+	struct pmic_gpio_pad *pad;
+
+	pad = state->ctrl->desc->pins[pin].drv_data;
+
+	if (!pad->is_enabled || pad->analog_pass ||
+	    (!pad->input_enabled && !pad->output_enabled))
+		return -EINVAL;
+
+	/* Make sure the state is aligned on what pmic_gpio_get() returns */
+	return pad->input_enabled ? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
+}
+
 static int pmic_gpio_direction_input(struct gpio_chip *chip, unsigned pin)
 {
 	struct pmic_gpio_state *state = gpiochip_get_data(chip);
@@ -801,6 +816,7 @@ static void pmic_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 }
 
 static const struct gpio_chip pmic_gpio_gpio_template = {
+	.get_direction		= pmic_gpio_get_direction,
 	.direction_input	= pmic_gpio_direction_input,
 	.direction_output	= pmic_gpio_direction_output,
 	.get			= pmic_gpio_get,

---
base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
change-id: 20260304-topic-sm8x50-spmi-gpio-get-direction-23f7409554ca

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


