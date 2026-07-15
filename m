Return-Path: <linux-gpio+bounces-40120-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yfzyEkp+V2pATAAAu9opvQ
	(envelope-from <linux-gpio+bounces-40120-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 14:34:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B1A75E30F
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 14:34:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=GuUlKBtB;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40120-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40120-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 700A130DBD34
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 12:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D94647799D;
	Wed, 15 Jul 2026 12:29:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6542047AF5F
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 12:29:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118586; cv=none; b=n4oAKeF3Lh4wK6nzCDFBzp1x7RvkmjytD70RtvQBUTG2vorb+sAsbyZWWk/MyhtKDkGd6jELigt3RPlXIe3V7foPRTwZ/79EyYCWDpqBeJLLSyLpbHANuvPBAJjmuBLV5CyT0i6y3/aBkgbZAWRxQ7j+JcL1rU71CVPuTPM+DHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118586; c=relaxed/simple;
	bh=RX7w0OSVzfzzf1CFJAfpJPLCkH2eThTHQR4MzyZBWug=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iAlN58KzT/mk4u7L/puS5SftL4lZZu27CMgDh4heGiPeS4LMAZcivPmsSgqTQ/iQfNIGIhcFAOSLUbpxhvPkm5X2Kn+1zMDjX1Wp3U0N5kcBAIBVtH5El4lNXd5v2tMnQNLjnAiZOXqBnV003P7ieCMFFf8L6hY8bPvZpgPVnvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GuUlKBtB; arc=none smtp.client-ip=209.85.221.49
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47df6a5202bso3448284f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 05:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784118582; x=1784723382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h4K/cnuGCD4SqoFpFIygfSYw1RzHhIhX97jhSaVlU8w=;
        b=GuUlKBtBR0tQiHFGjyoNzQcR57/pO4QUjmucZhBTVlQSFxdvMEOrD7xgsXRcrj+58p
         HFk4oNl3oSD/K3lZF/Q6XvhMC00u/0CLxzPMZRxPog4VbuWQ8gKEJqWqpdGdZlpi0oAW
         OnCsyO+vA+r4jXG1JdEyxE02K/0zOyuYrcgQCVJEM3bxkOlsXYdZgk3S62nNcqS8gPO8
         kGA1JBLizhoYDyL5vcwVxufm2c98YdC6UdRqkeTFdN0s61pLZD4LCCLo4DVMkqdRlqDK
         ZtwcL1QOciUGEHNRgpVwC2LOOoxbUOLY7qk8x4K1zrB8utaflq6ZCDuMsTh+EAvtlGej
         YWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784118582; x=1784723382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h4K/cnuGCD4SqoFpFIygfSYw1RzHhIhX97jhSaVlU8w=;
        b=qKIP51LR6Ulr9sv2/YDXQktuxIs0mBORq/lT/xUpYS+VIFqZpu1oK58xdLu36+19JU
         8uYCbX+4ZYfb4iFKNSHw9EFWpoDMU/c4Ztgj8hBeF6jmVNIqnMaWt4q20K9Z/NY4FVC9
         IfDb6WAtI7BcMpSvIC1IJCdChzBbHEiZ+Icq4QFOLQRGa4tzDSn2R7U8i1kn9uj611f2
         mv7atH6konSE42gTrdaL4JHwF+8vsYKiLZu+JrlN5vs4EM8ph+lyQcCEUh7UwQXeJNVn
         gr3SbCqOjkAU1qT+5w2kYli17y7IAwj9blA5KLy8HTECKAKH6z49iSHPZQQfobVsgO6+
         3oNA==
X-Forwarded-Encrypted: i=1; AHgh+RrSkexJbG5BQesjXs+/RWLic4tVvtP6d4BOINFLNwC7MLhfpVZhjApBwOUuJjpt3BHyRYEUVERui9X3@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu5u5lXaWwNqT+Wo+YdxUjXONiNT5e17UrqGzpYLbc7gBX/B0U
	qCElB5cl+7tu2kKj6ETAPDRhFgsN4Er3mW20C+usZasyOUNh4TPW6lkb
X-Gm-Gg: AfdE7cly5hED4WqDPQGYJ+gglFpR20PxJRxiY6oJaIl5I53xvtw4sZ5y0gHSuIFr6BL
	x1VrfFc8uJFiDSsasmJ0fpbBnuC20oxdfBENKIgEbPwhlLulfwbtShIqWRC6q/KezsSpWkxy6jU
	X3Kc3AlLKGoKcGItSuhUXt3lNeFpscf9grN/wcP+2mHTDGFSK9yOfAL5e2g5GyeiwWAtEmNLaR7
	mh6d8cZLWK2SfR1j6iZKNtpnZ1ti2X4I55NrQc10/FDKumVfGDajS5qEU81ShX+KfxgU/k7F+7d
	psYPaM8XOD1mcFMOMGEExnf7sKVDFIS0xU9zgrfTwPdqekXhAJYsQofMtBOWBLmy1EOll2nvDys
	+Gz7G6NBqp9t/oHEU+FfJwxjocQq7zDz0VD5nyWGR51u35Wbnoc7WVrVVklaZmx0XDDqoM1RV4T
	HeFImPM5AnGpFPw21aQilsj1I=
X-Received: by 2002:a05:600c:a20a:b0:492:40a1:1e16 with SMTP id 5b1f17b1804b1-4953c1451d5mr20729785e9.8.1784118582082;
        Wed, 15 Jul 2026 05:29:42 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a32a2casm216770715e9.12.2026.07.15.05.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:29:40 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	linusw@kernel.org,
	brgl@kernel.org
Cc: openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v1 5/8] pinctrl: npcm8xx: rename GPIO7 IOX2 signal to DO
Date: Wed, 15 Jul 2026 15:29:20 +0300
Message-Id: <20260715122923.1938327-6-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260715122923.1938327-1-tmaimon77@gmail.com>
References: <20260715122923.1938327-1-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
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
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[lists.ozlabs.org,vger.kernel.org,gmail.com,google.com];
	TAGGED_FROM(0.00)[bounces-40120-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@codeconstruct.com.au,m:linusw@kernel.org,m:brgl@kernel.org,m:openbmc@lists.ozlabs.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:avifishman70@gmail.com,m:tmaimon77@gmail.com,m:tali.perry1@gmail.com,m:venture@google.com,m:yuenn@google.com,m:benjaminfair@google.com,m:taliperry1@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tmaimon77@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tmaimon77@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B6B1A75E30F
X-Rspamd-Action: no action

The pin description for GPIO7 spells the IOX2 output signal as D0.
The datasheet names that signal IOX2_DO, matching the rest of the IOX
naming scheme.

Rename the pin description accordingly.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index 5dcb01923..1c95d7cbd 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -1567,7 +1567,7 @@ static const struct pinctrl_pin_desc npcm8xx_pins[] = {
 	PINCTRL_PIN(4,	"GPIO4/IOX2_DI/SMB1D_SDA"),
 	PINCTRL_PIN(5,	"GPIO5/IOX2_LD/SMB1D_SCL"),
 	PINCTRL_PIN(6,	"GPIO6/IOX2_CK/SMB2D_SDA"),
-	PINCTRL_PIN(7,	"GPIO7/IOX2_D0/SMB2D_SCL"),
+	PINCTRL_PIN(7,	"GPIO7/IOX2_DO/SMB2D_SCL"),
 	PINCTRL_PIN(8,	"GPIO8/LKGPO1/TP_GPIO0"),
 	PINCTRL_PIN(9,	"GPIO9/LKGPO2/TP_GPIO1"),
 	PINCTRL_PIN(10, "GPIO10/IOXH_LD/SMB6D_SCL/SMB16_SCL"),
-- 
2.34.1


