Return-Path: <linux-gpio+bounces-36531-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBrvOHrAAWrKjQEAu9opvQ
	(envelope-from <linux-gpio+bounces-36531-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 13:41:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE7750CF6B
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 13:41:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D425D3008698
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 11:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 190B3374E66;
	Mon, 11 May 2026 11:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1cUmrgP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B4736C0C3
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 11:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778499455; cv=none; b=i9VN34X6VCt9q3z3tcydZ0X6hzvOl3J5CXxQzpw+R2hWMpOd8lZ8M1Rnf+E0bayMg72iUP+AbDR5b3nxSAYxQtBEpcMrb2IK8PFxun3zbbWn8EJITNY1HX35EPG0b22Av3oksPXN44ehX0p05luI1h0K8eIyCs4yWJMs8/ldw3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778499455; c=relaxed/simple;
	bh=Tym/BVOy9NE1Qeg8K8Acp0oOf3Og5IzMWvx+9ry5rNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iSFnRZIbluqaibL6F6l34OOPofXvPAk9gYCs09kOxXPCb75WNb/Nfh0gdozsBMmgDINeDujviH3/WzsigHoRSjOerBmXjnZEGHSJRBduYh6lfbTztfIwr5NMvRICNUOqCwp3LCdzjHghx9iazzJyhdkDNJT382UjZbfNqrPB84Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1cUmrgP; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a40502e63bso3722391e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 04:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778499451; x=1779104251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VhUH2tKMkut60kZmw5C1AVWBW1sMGkeiu0EpNEsXCho=;
        b=E1cUmrgPv8JTetP+QYDI4HvOH5SuGPwmaSvakbw4dxvGTN88Ei5B2ab+OKYl1FNbJ7
         KGRQiNzAniMQ3dvgrXSMobtXOajoWIude4ViiY92nie5bKzrlKENfSOmlXVbth7W91OT
         S9BBq+5wvTO2N9I27YEZsmOIF4arj7lN91g68EG8LF4fKacDspeF1p5OVGbmS9TBT8vP
         5U6RaBwX2nyOwkLpvu/Gx2MzI4qdz0WZ9vbyTyJv1jXcpfR7cZtkvbeDtdiOxXGmVLfR
         VA0qMaExmaIE3Kq130MOGhLmkBjtL18pLZqFPr0iNFDQcqFkdaHcDWyYO6Hw01wBSsyY
         4ixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778499451; x=1779104251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VhUH2tKMkut60kZmw5C1AVWBW1sMGkeiu0EpNEsXCho=;
        b=TXT0HEhkyxJdeyXUqGKmLLJhjo4ckzbtI3TrdzZCqNwU4FfkxtKLsxhA2W2ZUZBT8P
         KK2U0FGLFnHwOmLysYzGcQMJe/HBPohzdS9Gkqdfw9d+6lH2E90BOWru7GB6QxOi3TyT
         48B494gzjmQ4jhQoyddj5Iu0JJr/Up4NmFsTZIgzABRuibpm6EafNVITtb3wmdeiPDZF
         KtetBDCn1Jgmas8fHlVBA+RnQiMPMpVQUPxG1gVIJM/WDeY0gzlLVsAt9LJqd5hsx4bB
         krO8zoBXsF/Z2UGLpvuBjaRjmdwKWLNk0HmAnx59P2mdNEF/oe1Uq3HzCkIhZvDBU7sa
         GnAw==
X-Forwarded-Encrypted: i=1; AFNElJ/9KYU57+tiYO9Gp+FKJAOBM+tIUnm7+7b2fBleKaXo9S0hxmL3rv/bCfCwwD6Q6apKV4KQzWgJxbKG@vger.kernel.org
X-Gm-Message-State: AOJu0YwtKt6hWgEBrGHjr3cwAqiC51osqWnHg9O9ASKEwFMcbbMadcWv
	HkF1+dzslBdAoz3eul/raep+LZFU/eJkFMNxrc5Q3KMAh8LDiaPD15o/
X-Gm-Gg: Acq92OElm7D8Rfq+Nbu0E20zBlhGpOd+mnIBa3FOVv5UR7bbRexe9TZEVfdwZgczs9Z
	i4wylR28LdK9qV4pBSFHufLRiQPhOa7qssN4jL8vwCZFY2vJ/ddL6BgED3GflxdYWjvIhdRpmsm
	PzVx8QsVR7D1MB5EpKUuxRTtCq+yFmjKV8CFvGMZ3r8oI0sR2N+EvHOS8LPeFYqCK8SAMxzZQ+U
	F3+PE73boIauR4aDh6juH6TpoUwU5/xuDoIOtRVEb0r/gzootunvIY5eYqEeCZ7qC7KB6WIrvIP
	u3KEm6G/+8nsy/oT4ATZtoqCm4HibFF6PXv3SFJ712VQsgBPohSneiE2cfWIiWiuAODAgaEUAOO
	0xq+J5fa5wQRQ/51TVMOLrXYqu3/M06qJ9pZVxsiTitq2MncbaUloFGYJTrR0jFq7p+qY6i4eFX
	beG9teoa+TRCpenOqMHH1rXG2us8pX7yq6DkWaMUllzjFeSQ==
X-Received: by 2002:a05:6512:1543:10b0:5a8:886a:1164 with SMTP id 2adb3069b0e04-5a8886a11ccmr6107757e87.28.1778499451179;
        Mon, 11 May 2026 04:37:31 -0700 (PDT)
Received: from C-PF5D4647.localdomain ([147.161.186.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a956b1cfsm2593967e87.73.2026.05.11.04.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 04:37:30 -0700 (PDT)
From: Jie Li <lj29312931@gmail.com>
X-Google-Original-From: Jie Li <jie.i.li@nokia.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Wolfram Sang <wsa@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jie Li <jie.i.li@nokia.com>
Subject: [PATCH v5 0/2] i2c: improve bus recovery for single-ended GPIOs
Date: Mon, 11 May 2026 13:37:24 +0200
Message-ID: <20260511113726.49041-1-jie.i.li@nokia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAMRc=MfMcEbQ3kkW3fMn-jzDoT2xdJWjp2xVBVsu7n683_5g9A@mail.gmail.com>
References: <CAMRc=MfMcEbQ3kkW3fMn-jzDoT2xdJWjp2xVBVsu7n683_5g9A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EBE7750CF6B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36531-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lj29312931@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nokia.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Bartosz, Wolfram,

This is a respin of the series rebased on v7.1-rc1, as requested by
Linus Walleij. No code changes versus v4; only the base has moved.

The series addresses a limitation in the I2C bus recovery mechanism
where certain open-drain GPIOs are incorrectly identified as
input-only, preventing the recovery logic from functioning.

Following the earlier suggestion from Linus Walleij, the previously
proposed "force-set-sda" DT property has been dropped in favor of a
generic helper in the GPIO subsystem to identify single-ended
configurations. This allows the I2C core to reliably enable recovery
for open-drain lines regardless of the instantaneous hardware
direction reporting.

Merging strategy (suggested by Linus Walleij)
=============================================

Patch 2/2 depends on the new gpiolib helper gpiod_is_single_ended()
introduced in patch 1/2. To keep this bisectable and avoid build
breakage, the recommended flow is:

  1. Bartosz applies patch 1/2 to the GPIO tree and exposes it as an
     immutable branch.
  2. Wolfram pulls that immutable branch into the I2C tree and queues
     patch 2/2 on top.

Bartosz: per Linus's note, please could you pick up patch 1/2 and
offer an immutable branch to Wolfram? Patch 2/2 does not touch any
GPIO file, but it is the sole user of the new helper, so it cannot
land via the I2C tree until 1/2 is available there.

Changes in v5:
- Rebased onto v7.1-rc1 (no code changes vs v4).

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


base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.43.0


