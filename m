Return-Path: <linux-gpio+bounces-36483-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMaqDnX6/mkN0wAAu9opvQ
	(envelope-from <linux-gpio+bounces-36483-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 09 May 2026 11:12:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C284FEEF5
	for <lists+linux-gpio@lfdr.de>; Sat, 09 May 2026 11:12:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 837A83016504
	for <lists+linux-gpio@lfdr.de>; Sat,  9 May 2026 09:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29E34394493;
	Sat,  9 May 2026 09:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SYnI8Mrz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9259D33D6ED
	for <linux-gpio@vger.kernel.org>; Sat,  9 May 2026 09:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778317937; cv=none; b=pTObjQkshIpgK4+hxs1cOwMjm9Krkqn3TG+cUtFfDclJiT3fw+JoUity1qxhbBgRzUg0UwcNE7zrtVVTLq7IcXq3PJQnzv4ua4NeSePPDaUtqBiX2v9Kw8II2w+SRhZbwHL+xBMufj3XtSPQrevUBnKioMilGUaaOnR7icwxO2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778317937; c=relaxed/simple;
	bh=24vHZ9abbKLv13pJboCYGh3ku98gbiKKOpblTf0HDEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hQ3ZPaLyMoTQ63wK8MuMsYvbo/uPPHxPzJ5ztjmSHMlSEehmEJRuKpjJd0LeC7zmpkA4gbB3bTGDI+5qyVjOMBsXCb9mPTe6AAf6l00zjoa75TrW3ZbKCgHG4LfQypgZilsKj1mkFIpX69/HuuzEDklLWZwWKkX6kxUjtiyFQtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SYnI8Mrz; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b941762394aso457134966b.1
        for <linux-gpio@vger.kernel.org>; Sat, 09 May 2026 02:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778317934; x=1778922734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4XmSmHeKOJyWydkEazgErxJ2iT0ojoaDUHk1IjIBCo8=;
        b=SYnI8MrzSwk2K85yvqkC4mKCx1ld5K4edWgRsDSeUHxvPqpAuzoulpYb+HfqYdMmD+
         8f3gNOYiWLP3DkmDvQf1ZuNa70qtPVxZApFPp10I8YcAOohRkKoCI4KIoHNgdI+dn715
         w2Ea6x5yEEzRam+NKGZbsXBsuU0F39E8gStEywpmi5HYiOYObl4DM3ukWQJsYtmZFjzL
         UNqAWnOpmgy8sHNLO6dILgVIbZpXj2flLWcIGsfb+WdQi4iz3E6bBZZwLPa84YNT437G
         lQw0OQ33IwjafzOopKPjcvOPZ3EOre2I8vhWkrsUvUWbtvPMKG7Z2J10XoJLS/6Z4V/L
         cf+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778317934; x=1778922734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4XmSmHeKOJyWydkEazgErxJ2iT0ojoaDUHk1IjIBCo8=;
        b=JkY5+KPbiP94bh1RjpCihnM7m5USuD2KfEKmrn5r0f6PH7GqRs7RzdNrVKF01Hkx0E
         nZgQ33PgJB90ebYBi2aVpB/BpJmVvnN5F/2adKETDJNknJYwNlewW16QH9HJlAM7cav8
         c5b0bMcW1HFq3AodR/n8ntyxwzVYxLtMHLP88RAOxuhHkK/aFU8W+x5/uSYhsBOWWlrF
         ynlIenfpFM3DZ+eRpuIvvpjEZw+jzu5iqfZvNc9Y2ca8dYXkfJGuY3bEf6wj2mNnJ1aR
         21O7iZSBySKBZZQVzegZQ+x95wrq9r9FSvRAO2KQn0NHHJGPn6cGQAuTKc+aPWc3c27w
         snJQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ANToasSADJadIQ3eEcwl5dXipISZ2C7cvkdE4Oww5CpxwG/pbnuvPdMxcNUkQwnng26Lu3uYw+ECZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyzDdZZcscyL15Shkhy9yakefk4r5pZ1ymv6Sk6XYGN0HmfJxej
	SHzz/yPtK+y0qHpbZh0a6BfhlCuHBquKHh53VTRuOeFVYvqWuczVSeTf
X-Gm-Gg: AeBDietYu7iDCLwWJ/VJJ98eYYOINVqXAnH+xx+tTnhv3ppEZL4hdGP2F7j1OivtChW
	/ICLV8b678Q+GHz09QA2B+k/DECmqwmpiu9gGHBHC1iAl+6yCprMkDs4Qo1KyJisE/1/VdFmGOO
	/SUUK5C4umtHQ5QnEwuMKxP0qwSMTTXg/EtVHTbxApX6uecUXLNfbYS8wp/iWGJFtky8cJ0NmRv
	b3EPJYofoU22DKaBhI54UcQgfo3tDdxQKU93AYbOOhbn48JzoSmyuncWkZx/Glaaxgvtl6jiRAI
	6if4RYchU7SpPWD3HS+J30DwHPlIU9ARj816EjaAzQIJqFnPPif8ImupMSyFyi3QNYl0zCP45dR
	iy4S14kIA0pQGFgo59vPBDlcHjVnKiLKd0XiYRd/Gy8fM+8Z2MgDJOvHI4QtH/vl85mPF14CM6M
	a4YmG4ucS8PGB7ixtpkT445F9Sv7gU3qlaycI8tI/Juu/UvA==
X-Received: by 2002:a17:906:6a1e:b0:ba6:5855:1cc0 with SMTP id a640c23a62f3a-bcc1205a634mr81118366b.2.1778317933737;
        Sat, 09 May 2026 02:12:13 -0700 (PDT)
Received: from C-PF5D4647.localdomain ([147.161.248.89])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac3f66cadsm203819866b.42.2026.05.09.02.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 02:12:13 -0700 (PDT)
From: Jie Li <lj29312931@gmail.com>
X-Google-Original-From: Jie Li <jie.i.li@nokia.com>
To: wsa@kernel.org,
	linusw@kernel.org
Cc: linux-i2c@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jie Li <jie.i.li@nokia.com>
Subject: [PATCH v4 0/2] i2c: improve bus recovery for single-ended GPIOs
Date: Sat,  9 May 2026 11:12:06 +0200
Message-ID: <20260509091208.18346-1-jie.i.li@nokia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <afiNrr4Llm0LWw-5@ninjato>
References: <afiNrr4Llm0LWw-5@ninjato>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 88C284FEEF5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-36483-lists,linux-gpio=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lj29312931@gmail.com,linux-gpio@vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Greetings,

This series addresses a limitation in the I2C bus recovery mechanism
where certain open-drain GPIOs are incorrectly identified as
input-only, preventing the recovery logic from functioning.

Following the suggestion from Linus Walleij, this version drops the
previously proposed "force-set-sda" DT property. Instead, it
introduces a generic helper in the GPIO subsystem to identify
single-ended configurations. This allows the I2C core to reliably
enable recovery for open-drain lines regardless of the
instantaneous hardware direction reporting.

As suggested by Wolfram, this series should go via the GPIO tree,
since patch 2/2 depends on the new gpiolib helper introduced in
patch 1/2.

Changes in v4:
- Patch 2:
  - Use GPIO_LINE_DIRECTION_OUT instead of the literal '0' when
    checking the return value of gpiod_get_direction(), and drop
    the now-obsolete FIXME comment (suggested by Wolfram Sang).
  - Added Acked-by: Wolfram Sang.

Changes in v3:
- Patch 1:
  - Changed return type of gpiod_is_single_ended() from int to bool.
  - Updated return values from 0/1 to false/true.
  - Added Reviewed-by: Linus Walleij.
- Patch 2:
  - Added Reviewed-by: Linus Walleij.

Changes in v2:
- Replaced DT-based "force-set-sda" with a gpiolib helper.
- Added gpiod_is_single_ended() to drivers/gpio/gpiolib.c.
- Updated i2c-core-base.c to use the new helper.

Jie Li (2):
  gpiolib: add gpiod_is_single_ended() helper
  i2c: core: support recovery for single-ended GPIOs

 drivers/gpio/gpiolib.c        | 22 ++++++++++++++++++++++
 drivers/i2c/i2c-core-base.c   |  4 ++--
 include/linux/gpio/consumer.h |  5 +++++
 3 files changed, 29 insertions(+), 2 deletions(-)

-- 
2.43.0


