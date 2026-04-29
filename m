Return-Path: <linux-gpio+bounces-35744-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JhzDx6B8WlYhQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35744-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 05:55:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3279E48EDF0
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 05:55:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C4C64304A8A6
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 03:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AE1231A7E2;
	Wed, 29 Apr 2026 03:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rxx+i8wn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C8514F70
	for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 03:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777434700; cv=none; b=Ds2CMdZSeVahcs+4r7wStzRRDaKaOW8rO/7Tbe+Q4HnFz9ZYo6HuEFaUIQ1pN97rKiknD1VLvxoKRVQ/HsvwCifZIZiIT/o6LdmbFssBw5ij2otRnX/4G63Bk9FaZgeX26e/Inbk1TJqgJnZtqQfmtQ3BxnKAA4Eq5qwGfCtD1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777434700; c=relaxed/simple;
	bh=Oh8y2Xcy2E85yeHLMPDtlxeM10Fgj45TY+/SphVe6jE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jiOIHBQ1L95cOaN/h153VPNck5eKRL4Poqown67G4gc1PO1xuyw4v2Sut2fVt7sf4BJALk5EKm0X30x0+Xdzm5yeTgh4eGmRdgn0OhjFfmvf2g9/X2H3L75eUCGGCwbAeT5NprbDZUxPzGM9+TEKRO0WaP6K4Pc1pKucnC9ITgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rxx+i8wn; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-834da62e52dso911086b3a.3
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 20:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777434698; x=1778039498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shmUQp5JvJkc9W1Z22pnWkTCFcSmOMHms+8IkinOvcI=;
        b=rxx+i8wnbHng8c4UHMy+Pl+qb+p6HA5l1idoMl+QkL4Ak+nH8Pj96jkF8jYJ3RPcJ6
         wqcWin3f+VpSKT3AQHUZLjUZ7zi0lVHYb6JtpReVDL7WAtrRmDSq+U1bd7UNaSE1dD0u
         1zlLYmmpOLAEeP9ATjy0WHOjaNARA2fDooSrv8mvdPRiQ9N3SnQU2u8xC5bwoKSGVh4u
         6PhWGc3+STWgqY/91QhZgirO36qpeU7vLksyuPNealnDeMEVTrisjpPcWEwXx8koFnrH
         EgIg0zq3o8awRgiZGEx4xR+v4YuY2Ag1+of9W+Eau4RD8buQBGmtmIHTrIB1iroEjU7J
         fFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777434698; x=1778039498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=shmUQp5JvJkc9W1Z22pnWkTCFcSmOMHms+8IkinOvcI=;
        b=CVKP7mQgI0wEw55fP4kuItzAhALy4W9+Z9CtAWpUDy3CAODHKKn0cAZXK6i/PdIQMh
         IHdCpTqjWPjKW99X/cJQwAz+a3mBMztEeF9tQNAavlo3VbNRF/etU3Ke4nkiuGY9OLXa
         fu1r7E53/pybNEhPpazL+smJDO6FASv/kcqnElEkSjNG2JqiuwPaph4jCjRkv7P0yS9Z
         ht0cUVjuS6e1XYZYtvPqgA7yQ/PCHd+eNgttiT+liBKacTGqfORGxlBbinO442buyIef
         3QRqLRS/g2CsZ/4oNdih4qxupJ/xlYx6d+VvJSItdkr2LW0bhcXl99rcbhMazf9KsvE5
         He1Q==
X-Gm-Message-State: AOJu0YzDMahJKSv7+lADi17ChWjgfrn92CYpTRtcQ6aai50YY6Kk2WvW
	STEtkdCwO1qHPJ7qe8JtfN1M/GLKYX/iGIJPa2Ka4BBJSfCNX9/ysExU
X-Gm-Gg: AeBDieuxkK7FQ/xD9idWHYjzEe6OnNIb1xWcr0/wkbLA/PnsI5wJReSInqdpqHUiGPP
	XnWjmgoLPxRjY5gCVa3YHFgFgWAyGWQ7d5WrVh/IyJ9GQsfb5zmT3C6aMD88oL1+C9RywnptHmz
	SExMIz/D0QeCsW3WgkIk+sl8OKnRpUT34lT6n4fVL7F6ACEdqsFO2hWVHRSbVBHO49dlmqim0u+
	cwqZ2l9Mq0xiCCg9AZ6+doghpiEu5PtAHBaM8LNSmwl0JaGvMCV+UgLyBqndpdrmYtQsKzDvcHf
	Z5vArKwiCRa20aA0rGaSfrSgZReahyzK7ACdunUzMMczV4+R/0bQvXpsj3+r+GzdXgdROql53DH
	r1mLpK8J+n9vT32psHAisW6HDjhV+i3UyKGmyarLfbfvszPpmPAChr9WU8F3PtGh69YMP2O3Kf/
	p/4nUTa/M14ShULeyVGoZQe1j8syuYil7M9zjIQywntFHJ+6zjnyNHl1v223a9oQhY
X-Received: by 2002:a05:6a00:bb8f:b0:82a:6852:559e with SMTP id d2e1a72fcca58-834ddac7b7bmr6064890b3a.12.1777434697983;
        Tue, 28 Apr 2026 20:51:37 -0700 (PDT)
Received: from happycpu-p1.. ([121.160.151.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed5f30ddsm502899b3a.26.2026.04.28.20.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 20:51:37 -0700 (PDT)
From: Chanhong Jung <happycpu@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] gpio: 74x164: seed the chain from DT at probe time
Date: Wed, 29 Apr 2026 12:51:32 +0900
Message-Id: <20260429035134.1023330-1-happycpu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1776872453.git.happycpu@gmail.com>
References: <cover.1776872453.git.happycpu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3279E48EDF0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35744-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[happycpu@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

This v2 reuses the existing lines-initial-states bitmask, as suggested
by Linus Walleij, instead of inventing a new property. That sidesteps
both the v1 review concerns at once: there is no vendor-specific
property to argue about, and the bit-N-equals-line-N convention is
already documented for nxp,pcf8575.

Background (carried over from v1):
The 74HC595 / 74LVC594 family is push-pull output only. There is no
read-back path, no defined power-on state for the parallel outputs, and
__gen_74x164_write_config() always shifts the full chain on every
transaction. The driver therefore publishes whatever sits in
chip->buffer on the very first ->set() call, and today that buffer is
fresh from kzalloc(), so all outputs come up low. On boards with active-
low indicators or other signals whose initial level matters, the 0x00
publish glitches the chain before user space (or gpio-leds default-state
walking) gets a chance to run.

gpio-hog is not a substitute here: each hog is applied sequentially and
forces an intermediate full-chain write per line, and on this board
gpio-leds already claims every output, leaving no free lines to hog.

Approach in v2:
Patch 1 documents the existing lines-initial-states property under the
fairchild,74hc595 binding, with the small wording change that on this
output-only family bit=0 drives the line low and bit=1 drives it high.

Patch 2 wires the driver to read that bitmask into chip->buffer before
the first __gen_74x164_write_config(), so the chain comes up in the
configured pattern atomically on the first SPI transaction. Property
absence keeps the existing zeroing behaviour.

The bitmask covers up to 32 lines (four cascaded chips), which fits all
existing in-tree users and the typical 1-4 chip cascades. If a longer
chain ever needs seeding, the property can be extended to a uint32-array
without breaking the bit-N-equals-line-N convention.

Tested on a 4-chip 74HC595 chain (32 outputs, active-low LEDs); the
0x00 glitch on first write goes away with lines-initial-states set to
the desired idle pattern, and absence of the property leaves behaviour
unchanged.

Changes since v1
[https://lore.kernel.org/linux-gpio/cover.1776872453.git.happycpu@gmail.com/]:
  - Drop the new 'registers-default' u8-array property; reuse the
    existing 'lines-initial-states' uint32 bitmask instead, as
    suggested by Linus Walleij. This also addresses Krzysztof
    Kozlowski's concern about adding a generic, non-vendor-prefixed
    property to a vendor-specific binding (the property is already
    documented for nxp,pcf8575).
  - Driver now reads a single u32 and maps bit N to GPIO line N,
    matching the nxp,pcf8575 convention. For this output-only device
    the polarity is the natural one: bit=0 drives the line low,
    bit=1 drives it high.
  - Binding example updated accordingly.

Chanhong Jung (2):
  dt-bindings: gpio: fairchild,74hc595: add lines-initial-states
    property
  gpio: 74x164: support lines-initial-states for boot-time output state

 .../bindings/gpio/fairchild,74hc595.yaml        | 13 +++++++++++++
 drivers/gpio/gpio-74x164.c                      | 17 ++++++++++++++++-
 2 files changed, 29 insertions(+), 1 deletion(-)

-- 
2.34.1


