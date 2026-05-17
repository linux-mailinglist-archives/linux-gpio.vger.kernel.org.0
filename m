Return-Path: <linux-gpio+bounces-36995-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAM2D7bpCWpavAQAu9opvQ
	(envelope-from <linux-gpio+bounces-36995-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 18:15:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBDF5623C4
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 18:15:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 49A5130088B4
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 16:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC29A3B774F;
	Sun, 17 May 2026 16:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pVwQNc4a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBC333064A
	for <linux-gpio@vger.kernel.org>; Sun, 17 May 2026 16:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779034547; cv=none; b=Cr6Gw4FE0JFhVDLm1OzwG5LT1SzjqR3TwexjdAlm5EdA7vALyNjy5Irj4MKo6ocrKOJOrEEbALg311Oj+WRo9ICgfGxTjJv+A5deQxI8DCc3rrNzkW5VEqH/NIGflKh943amcwaYWkGUq11RLj4Ck4Nz/eoqJs9Qx1yZ+frY3GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779034547; c=relaxed/simple;
	bh=1L3zPpdK+XTaPDAZy33QIx+6Spr0ZSthXEqQgReNVoI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FpNsdtpGJWuh25UWsSqUW2soZhEdJ3sAtO15VEqFIEoZUghWM4jMv+zlQQYM4Ahz1wFrSjxhR9o4SDuMy+BZsHV1a928qEjUuaZ5VeN0JbCOm8Wj+8EnoKuOqo65EQqzwjnMlJst6zNVzUeowmh6XJVpfXlPGAmY+YMYMcSZOAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pVwQNc4a; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4891c569cb1so1691145e9.2
        for <linux-gpio@vger.kernel.org>; Sun, 17 May 2026 09:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779034544; x=1779639344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EAjpg+yPM1wXX0LTdZB7XKnnu66uLDhV1TDY4KTTlNE=;
        b=pVwQNc4ap8z/44HoBU/3O3HUCv6937/Jnvrajy9kSDp3auX7OfQytA4BZAGYt2MYx2
         5eikIagiLcE9uImI0rip7PhjC87IQJNBtDjJ61/I7+5xJc20XLD+U6yXcGGodDVVWjLm
         8xShv1Nt1hCI5ulLJ2yl9iFvTzoKo9sWjExSS5wAVOhLSt9Ov+KIeCIlMEKxjJNpmia/
         TmFiNFOn7cMggYup9+7Yu3T5MrSv0lcjV543+vQ9xPBZ+UOialQNCPFhVJmiThlBudMS
         +HQcQfSqP667Z3thYEkpkBmTV24AfIaCqvjWylV0aOqjKJ5UcJrjsHAfmiMgJXf3czmw
         pazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779034544; x=1779639344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EAjpg+yPM1wXX0LTdZB7XKnnu66uLDhV1TDY4KTTlNE=;
        b=HPS/FgB5fb8GD2f+4RSe9d4XM3K/0GRht4J7dthtJQ21G+aUVkebnf3ChUoGcrq06G
         Tx0IjfqJ6aaUvpBFESvBgWtts/elQ0q5C5Qsk1DOjlK0Vrye3R+rTig991ChRI4n50G7
         /tsINOKCFnGBz6sKPU3+RtIUKQWQECmWBF88+nlnKbTDnnQ6GSYmTmiLxYoRgSQ90bG+
         gbRYlqc49mOla40GjlYpgBj/B3WxSQBUfqi/76fc53n4bjn6Ymzt5ed+RjRv+GQLG7rl
         wOj9DP+0ER33Lrjdo7Gi0Eq1ySF6xNHmzZL5J18UhC1+i7aBP1eF/sNxSe/86CYKXgqI
         yRAw==
X-Forwarded-Encrypted: i=1; AFNElJ865alYBGJngUcbDPzkX1zJyzSS/0rxk86kW/sg5C26/OSEaZk6cZ85hWMiF6rsCjAwcEbfoQMao0z9@vger.kernel.org
X-Gm-Message-State: AOJu0YzQAlK/o0+ZNElj/gcHNjxG8fD0wxZ5m/AuYDddTzG4R2AMPiZe
	y5b+ibObx2NAK1GJiCpDdiZUzVJZxn/rGQXCNEr1KxuPXX4+0gNa7wwTefRZHXJW
X-Gm-Gg: Acq92OFqu3CMmLcjrZXTlPrpfMHEaZdyDcRWGvKSosrw/CiZmD+ztuE/JshYPst+AN9
	KbgOzawXCu9kqx6Bx1Daq7mISe1F/D/jdthXeC/j9WH0g9u+mVFDhHCsOjAKra72ZtR7bB/sogN
	ojIKoRHTIaOwjtLI/CKCcG4sQAfsw1+yEDt74kTX22TbGzP7Rw8M+LtSKw6u+sKnI5f/2qQm+kt
	ZLAesuQN93L9zs8l78QNXbqelLMwr4i/3lYtC8dxfzX8udxmTyX77hDDPypjtce3ABMG3dtKtop
	J3pJbksUU2+71mTBEXIyXlZt/CJqbq8c8oSM/GT9zh3ijiV+5j2Mbbc2dBis62kRbruEG/hOkhF
	d9xZhmEHHsUzzfS/H4IfOBNogCC7IKQK6zAJQ5dfZV1Tfn0nsU5XxZyctuUewVZS1+967dW9JXC
	aJoHzvxiJrMtI3Jm5ffGFfVakZWMLX35Tznx1LmhmOnzYWdF/rW9nX9K8=
X-Received: by 2002:a05:600c:450c:b0:490:6ab:4063 with SMTP id 5b1f17b1804b1-4900d55aed4mr1429375e9.6.1779034544134;
        Sun, 17 May 2026 09:15:44 -0700 (PDT)
Received: from localhost.localdomain ([82.215.118.79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe6aff4sm62243015e9.25.2026.05.17.09.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 09:15:43 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: andy@kernel.org
Cc: mika.westerberg@linux.intel.com,
	linusw@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sozdayvek@gmail.com
Subject: [PATCH v3] pinctrl: intel: move PWM base computation past feature check
Date: Sun, 17 May 2026 21:15:30 +0500
Message-Id: <20260517161530.1037-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: CDBDF5623C4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36995-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,vger.kernel.org,gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_NEQ_ENVFROM(0.00)[sozdayvek@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Compute base inside intel_pinctrl_probe_pwm() only after the
PINCTRL_FEATURE_PWM and CONFIG_PWM_LPSS checks have passed. Tidy
up; no functional change.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Link: https://lore.kernel.org/linux-gpio/aglu5jy5SbW9Wjwj@ashevche-desk.local/
Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
---
Changes since v2:
- Trim commit message per Andy.

Changes since v1:
- Drop the array zero-initialisation approach.
- Move base assignment past the feature checks, per Andy.
- Drop the Fixes: tag.

v2: https://lore.kernel.org/linux-gpio/20260517154002.1994-1-sozdayvek@gmail.com/
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


