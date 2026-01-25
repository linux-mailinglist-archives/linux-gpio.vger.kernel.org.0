Return-Path: <linux-gpio+bounces-31043-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id TURRDkZ0dmmvQwEAu9opvQ
	(envelope-from <linux-gpio+bounces-31043-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Jan 2026 20:51:34 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 705A48242E
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Jan 2026 20:51:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2CD13004223
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Jan 2026 19:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC57A2FF153;
	Sun, 25 Jan 2026 19:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fB8h54Um"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8102FE59A
	for <linux-gpio@vger.kernel.org>; Sun, 25 Jan 2026 19:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769370690; cv=none; b=HkXwC1S5QKTJV2IFTQEMmfxvgI91PKD6lXOpO1Khgb5ExUiYvrZwD8nrm988/qdsv6g1hcyB35IFiwhxQdOqYNa5p0FqyRwzKmR/Aj1bluE/w/ExiVh3mxHQFsd2lBitMbcQ9XPDWaboprIiBx9xjydXcaFsD32unm3YIp/GXtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769370690; c=relaxed/simple;
	bh=8w5lKmFR001loRTJivMKIdgWcBfSThm7VC0mocH3zFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kx4yUf23zpW0+p2EGNmz9c28dZik2aKmtrUjh3GEAXPyEy64hyiRo6fClx2UhigCj0SdS6wYoQ7A1lk6ZP4aHukdQaiiYWLe6oj/iWFd/eEVhzQGo5icY5PJ5Lk0ukOVBj7MMYZwVEOlAxN7EBUB7Ln6StPMq7ePgwjbdwkfytM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fB8h54Um; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-65813e3e215so7215330a12.0
        for <linux-gpio@vger.kernel.org>; Sun, 25 Jan 2026 11:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769370688; x=1769975488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=erE+uO6wlOkAnc1WeWGgsNOsOXXg2ec8Vg4q0viMQEU=;
        b=fB8h54UmaChrSybNinw0MbVmo7u+0g2mHSmKkaDGxcxB+zclhzxDFiYWjcf/j8GmWg
         8uVNCx51RZVSH1+pZqYwkzei16+LYgC2h643PSP6ZuQroFIJ9PFjAXK4lp1CphgNZVb/
         uP7LMlX/h2BZVupUJO7ov5mzYGHP7JcZ9CLJ3pp7vZ/gtIKFPWsb5t4wf/A46OZbh4IT
         PmjB3yNM34uVwDv/ZPvGLsyypqNeTHcEaizHQ1m+4DwEX3VAQ5t9DyylI85Aqorjrsv5
         MzSW5oSlHWVHFudM//5Co2O95QtbSCgF1ZtMQuBGSoOrviUzyF7TxRTWrc4Ru5WvF7QP
         azog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769370688; x=1769975488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=erE+uO6wlOkAnc1WeWGgsNOsOXXg2ec8Vg4q0viMQEU=;
        b=l/h3nqEZUoPWVrUGZfiR411y83WC69u88Eice8/FT9IPH5UYJP41vQ0tFNAcyBum0u
         t+HhHDkYYsnnLEh/0uVorpWoE5s7eVBhZPa3WFBJ5PB+AV8JIMWuCaaOwgDFCw4QIFau
         N3ljF6VyUmrFXtKF5yQ4PGk3UKBvDV/aTY2qGdmFOyfz1h1oV6g0eK6OfQcmTbqCKA88
         T8vcx3C2hpgEAHPxqvoOB7hmslC/uX4/Mc6fDLhA8DhtKMVyl6E6WKooriyQ0ZAx0jTr
         VrlSUhTL8Z+REEGlIC94zqDcvIIKTUiTdfDR8g5T31A57A2jZGdROHrzJUuXv+F8NimM
         mGFA==
X-Forwarded-Encrypted: i=1; AJvYcCVlyCWzuEEWv/yi0tqpsFeBMMdQU0d+VA3X+3QVdyfC0n5Y5CSFQ06nP8BP6B/fX4h8VqbK7753v89+@vger.kernel.org
X-Gm-Message-State: AOJu0YzvP3Uk1RjunpFTUkAP5yjmpPXFo3J7CZ6BXBPeZVPoR2cKHU1Q
	/oMejPJoFe/LQBfeVLILGOah3/UtxDLknCXrpGorWfnoIzQgmDDEzhmgOTCr4D70
X-Gm-Gg: AZuq6aIzlSuUg0mBWdzn1f1BjOJs/daZuxdCgyCcMB0RILTJcRuI1h1sGOizR8mW477
	HGQ0LsUES/0SvsdfjQyIjPCRMN33PhlvpMiPy3fVQqMlpgiusqwCKKnCmqHzvEZ782FfA09StHu
	R+ko40QC1stHPJj/YT0PhA6eR/IAVIKI327JHyfmqPC/Bz0we9VZpBIZGkUUu20G3ibIYcvNPEb
	1NpSrijBItbYiYAUoEXpprFv4xOPHqWjW4voeyA4aD5akryhcwJLUH2a5op0o/JcohpigD1rs8u
	kUV9tRmDFn1GvseM4Vlnk0wVYsJGd5P4lZ+MpdM5qpWexI9xTQ3v7hmpN526XeOXUJZnz8NbvRo
	t8Qg5JFIiYdJagjX5Nq7NAp4VBMFcnhUVa+aqk9NjbNk5602Gj/co/0Mnihpb5Qc700DSQ1DcF6
	TSf53Wp4J38D6ZbYSnuGlVGc0=
X-Received: by 2002:a05:6402:2351:b0:64b:588b:4375 with SMTP id 4fb4d7f45d1cf-65870690a9cmr1523024a12.2.1769370687586;
        Sun, 25 Jan 2026 11:51:27 -0800 (PST)
Received: from C-PF5D4647.localdomain ([147.161.248.108])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6584b965df4sm4010232a12.31.2026.01.25.11.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 11:51:27 -0800 (PST)
From: Jie Li <lj29312931@gmail.com>
X-Google-Original-From: Jie Li <jie.i.li@nokia.com>
To: wsa@kernel.org,
	linus.walleij@linaro.org
Cc: linux-i2c@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jie Li <jie.i.li@nokia.com>
Subject: [PATCH v2 0/2] i2c: improve bus recovery for single-ended GPIOs
Date: Sun, 25 Jan 2026 20:51:21 +0100
Message-ID: <20260125195123.248798-1-jie.i.li@nokia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAD++jLmGMWjCD0gUcaJPuK0UzJa7nX1bdoVu-BA7aHAgcLTSpg@mail.gmail.com>
References: <CAD++jLmGMWjCD0gUcaJPuK0UzJa7nX1bdoVu-BA7aHAgcLTSpg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-31043-lists,linux-gpio=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lj29312931@gmail.com,linux-gpio@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nokia.com:mid]
X-Rspamd-Queue-Id: 705A48242E
X-Rspamd-Action: no action

Greetings,

Apologies for the late reply, as things have been a bit hectic at work lately.

Thank you very much for the guidance and the suggestion to move the logic into
gpiolib. This is a far better approach than my initial one. As this is my first
time submitting code to the Linux community, I am very grateful for your
mentorship and support.

This series (v2) addresses a limitation in the I2C bus recovery 
mechanism where certain open-drain GPIOs are incorrectly identified 
as input-only, preventing the recovery logic from functioning.

Following the suggestion from Linus Walleij, this version drops the 
previously proposed "force-set-sda" DT property. Instead, it 
introduces a generic helper in the GPIO subsystem to identify 
single-ended configurations. This allows the I2C core to reliably 
enable recovery for open-drain lines regardless of the 
instantaneous hardware direction reporting.

Changes in v2:
- Replaced DT-based "force-set-sda" with a gpiolib helper.
- Added gpiod_is_single_ended() to drivers/gpio/gpiolib.c.
- Updated i2c-core-base.c to use the new helper.

Jie Li (2):
  gpiolib: add gpiod_is_single_ended() helper
  i2c: core: support recovery for single-ended GPIOs

 drivers/gpio/gpiolib.c        | 22 ++++++++++++++++++++++
 drivers/i2c/i2c-core-base.c   |  3 ++-
 include/linux/gpio/consumer.h |  5 +++++
 3 files changed, 29 insertions(+), 1 deletion(-)

-- 
2.43.0


