Return-Path: <linux-gpio+bounces-36993-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAoXF0TiCWokuAQAu9opvQ
	(envelope-from <linux-gpio+bounces-36993-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 17:44:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC64F562153
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 17:44:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A07AA3035AA7
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 15:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF5123BFE4F;
	Sun, 17 May 2026 15:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L6qMQzGK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F0F3C2BA8
	for <linux-gpio@vger.kernel.org>; Sun, 17 May 2026 15:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779032425; cv=none; b=TlpSl5xVfFNUBiAkNqN3nFBj/PqIcPvWpJ42naRBsirXC2gXEhqP9c+lCzNf6fMtmXSOigsuzPNT3FwgODlBD+jq3/vRenHd4+LL+gBXUSBXzQhL9DDNnp5gR0gzbZkr+hr9M22Nff0Ui+oOiiYbyWOyos8Ym0E86YOeA/k7Iko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779032425; c=relaxed/simple;
	bh=tG8vQsaeL+zmMbZIlrSZVIkbDhZai71KTvCdLoSA03I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DXLZ5FflsWsw5SYxrWPEzeIPnqHkdd548drR5Y84O/1cKzzGOfu4tLjg3ALdSRiqNSgIZYGTJy1nDXcBkMtgNIV6vKek86aVk5fZYc6edwUtwYjNWn+6GMurbK+FklO4YrutLqjLct2o/SpHH5JAZO3wv79PmsQ8diC2dewAfsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L6qMQzGK; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4891cd5927dso1994535e9.0
        for <linux-gpio@vger.kernel.org>; Sun, 17 May 2026 08:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779032422; x=1779637222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Ko38hnoPBxB6BYun7C25duxyW3Qa2C3gB5+JUZet0k=;
        b=L6qMQzGK2fR1DngJMlGo2f5V1yZlpVpRu3l73mGNSAB7RP2EB+jSUfUofuuRq3WGlu
         8kvhcxhg32Y7anknmj14XzNsAUIdHPLLNOVWz1bvnM6acFLh80wrmKt9vcTZzTDGHAtO
         E3ZvNc0P8pl4eNYkLjRNmmxCzWVvtUTPwiZHAZrHBM59ewTfNxhj1TpFTg9zYEYNhu0N
         5odZFvjvozekDefhw6K7L8K8ICcfe4XE7vv6z7zhTdc8nPiIbG+8ba7fzUbeBSagXK+c
         2li1+Uc/RysJREYp916/7cGUee5Pz8PtZEa8pvBaEI/iS1iEmhRazwvXT7k30RYHSXuE
         lkyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779032422; x=1779637222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Ko38hnoPBxB6BYun7C25duxyW3Qa2C3gB5+JUZet0k=;
        b=nPDW7Q4fpC7kbNaYdt4hrQRcDUNi+vk8gFmR/JygrlJGapm++bRkQTWCOBq/RHyEwX
         RxxWC0b56+xOY9BDYW1OPkU9ARBxKm2YNlAyiBgxvmlMG2r6WOjD/L3fKDjpwbmcFbGI
         ZaJVUzIxUxiez5Ph7fSh9Y7aeSVi6uE0CWAGS8nIff6U8WIhU/SldEj3B+x5tFRORW9e
         mS59/7hAzaQiGjoBqyVpI7qfWB3EfKD3JQ9ac57SDsW4pz9iOxKg0GEgECysbh05ppGC
         T8oHHZCcWNL2IORe6AZqnfHr2tGwPoeyLVShu4qj/w0tgFgLWfoNRyHZ4rpbxh42UXvz
         6Nbw==
X-Forwarded-Encrypted: i=1; AFNElJ/LJBpL9FMYbGHswE7bEDiWUaK2adSRu5jGDGcb2FGeJiqi8o+ZjFx9QL5gz2tJOlpmcBzRT67DtOF7@vger.kernel.org
X-Gm-Message-State: AOJu0YzEGbGLFlGDbKmbEPcPkisRPHss/wbMx4Fib8wveJmvM84PGUZd
	rQbq9jqe7R4Q16HhWmCbeSQLxxlaSreFJJvkPCO2PrPqV5PVgaStlmvE
X-Gm-Gg: Acq92OGAZh0+N6+ddGiwct/iHWZG5oWEMrG4W0hSegC+qH50fW9mIr3k1OQ6BEOWv4U
	/C9F8URdpyzh0XnDoI1eDhkMOabsdjx3zvxKRvOgDrRfx5+ClSX/+l5T4QErW2T5j9WNcabsPFE
	QjujWgIRmXzBkoyC/wYGiPsTiFPm1ogjT0TZCiBKJsZDsUfhNCKVvJH7qd+hn0YlE6QiWkVAWzd
	9Pqk/5u3Te2OZROC15TRxD5Yh30/Wy7GzHtQb2h+w9r8iv5TTCxUWTdEU5KkKz/vJ7z4QPb0E6r
	+ov4dB06NbMf9NdAlmWK8vAufAxD71cYfm3L+7pp2F1/CIEchEojxKOYIiH/2VLl5SYUQGOeVzn
	5lpBcBLUqbrztG5HQcEqDvh59AoVJlSEcuu+MFayWpaOvsuf8+RhlKee6ly53MpsZGSd+QfdhCK
	ye+J3kanGVrCfE7wmJdzxqKvcOB7u7DMiPEnTgKXSBs0bq
X-Received: by 2002:a05:600c:5489:b0:48a:5546:619e with SMTP id 5b1f17b1804b1-48fe61f5830mr89258525e9.4.1779032422124;
        Sun, 17 May 2026 08:40:22 -0700 (PDT)
Received: from localhost.localdomain ([82.215.118.79])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768acesm32328981f8f.7.2026.05.17.08.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 08:40:21 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: andy@kernel.org
Cc: mika.westerberg@linux.intel.com,
	linusw@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sozdayvek@gmail.com
Subject: [PATCH v2] pinctrl: intel: move PWM base computation past feature check
Date: Sun, 17 May 2026 20:40:02 +0500
Message-Id: <20260517154002.1994-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: CC64F562153
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-36993-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sozdayvek@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

intel_pinctrl_probe_pwm() computes the PWM register base unconditionally
at the start of the function:

	void __iomem *base = community->regs + capability_offset + 4;

	if (!(community->features & PINCTRL_FEATURE_PWM))
		return 0;
	if (!IS_REACHABLE(CONFIG_PWM_LPSS))
		return 0;

	chip = devm_pwm_lpss_probe(pctrl->dev, base, &info);

For communities without CAPLIST_ID_PWM, capability_offset is the
uninitialised value left in the per-community array on the stack;
forming base = regs + capability_offset + 4 from that value reads
indeterminate state even though the result is never dereferenced
(the feature check returns first).

Split the declaration from the assignment so the value is only
computed after PINCTRL_FEATURE_PWM and the CONFIG_PWM_LPSS
reachability check have passed. base is then the same single use
that devm_pwm_lpss_probe() already consumes, so no other call sites
are affected.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Link: https://lore.kernel.org/linux-gpio/aglu5jy5SbW9Wjwj@ashevche-desk.local/
Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
---
Changes since v1:
- Drop the array zero-initialisation approach.
- Move the base assignment past the PINCTRL_FEATURE_PWM and
  CONFIG_PWM_LPSS checks instead, per Andy's review.
- Drop the Fixes: tag (per Andy: this is a cleanup, not a fix).

v1: https://lore.kernel.org/linux-gpio/20260515150049.33761-1-sozdayvek@gmail.com/

 drivers/pinctrl/intel/pinctrl-intel.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 97bf5ec78..2e2526e01 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1556,13 +1556,13 @@ static int intel_pinctrl_probe_pwm(struct intel_pinctrl *pctrl,
 				   struct intel_community *community,
 				   unsigned short capability_offset)
 {
-	void __iomem *base = community->regs + capability_offset + 4;
 	static const struct pwm_lpss_boardinfo info = {
 		.clk_rate = 19200000,
 		.npwm = 1,
 		.base_unit_bits = 22,
 	};
 	struct pwm_chip *chip;
+	void __iomem *base;
 
 	if (!(community->features & PINCTRL_FEATURE_PWM))
 		return 0;
@@ -1570,6 +1570,7 @@ static int intel_pinctrl_probe_pwm(struct intel_pinctrl *pctrl,
 	if (!IS_REACHABLE(CONFIG_PWM_LPSS))
 		return 0;
 
+	base = community->regs + capability_offset + 4;
 	chip = devm_pwm_lpss_probe(pctrl->dev, base, &info);
 	return PTR_ERR_OR_ZERO(chip);
 }
-- 
2.43.0


