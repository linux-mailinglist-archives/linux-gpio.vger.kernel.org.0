Return-Path: <linux-gpio+bounces-7710-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC27917B3F
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 10:46:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FBD61C21329
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 08:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8770D16A920;
	Wed, 26 Jun 2024 08:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="AXgM3s/B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF0D166310
	for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 08:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719391545; cv=none; b=NUYKTJgJzwTJx6mgukviCg9M62thtQlgqYC78zW+ugYA8AQZE3y1e53ZB7XXPPSWzWZZVDmQxUdeQ1sEYxJtc64MWtj4cpeJ0NDduOsXIwUZy+lGAftVcEnEgci1D014HPHE8eGrV/wNNcRaVKmB7DohdQzZVwmSNLu5kLeO4so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719391545; c=relaxed/simple;
	bh=DzNCPz0l+qOT0t/ADA4oPjAIWHqdAm5rRYNgDCTIR/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G90u4dG1V8fFMnBKAfQdpy59erWCDxge8oastoq0v3xV0Zwyd9GG2qQvqkg4DZfX+8QmSjI0o76RIsHNcLCj1CCDd7tkbMcoMz11XJTxiD7o4S9jG6RmPTL/nP3Br4TwxGK49DstejpwkwE/3avpS/gP1fRkrMeHRSw9WtYDHAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=AXgM3s/B; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-57d044aa5beso7471516a12.2
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 01:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1719391542; x=1719996342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=neUGPkJcfoHd8KdVXvztCJl9LwrUDYQkaArrGg63MBY=;
        b=AXgM3s/BCGsdre8yMo6b7kgR1Ntq9J7YiTRU0uLUzhEICEan5GNVvNbud5YKebP7BY
         Y4yKpQx7f3RLDDSd46Mc/R3pax+iFWmQaicoAcxmCd663AJCcjgM7kQHKhpG03VDi5Mo
         c8/0slWxsBYq6Jn1eXP7jEQw/NK3NdKdIB8CXmCpTC5LIudm9ji6sa6nhtRdvZzWd/w0
         ASSKLhq2FjYai91qvBZmV7vVUG8/RSpPzuI9IucB5nQrQ7Horm6CsIfpuMzfg91BuQN0
         DDGpPImlUnslpdI2Fs8QGkreXDkghlSSOCR5pUioLXWXw3k1w7SRLUNqnYifbjEJaMm9
         ZowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719391542; x=1719996342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=neUGPkJcfoHd8KdVXvztCJl9LwrUDYQkaArrGg63MBY=;
        b=GF4F6bgz93wcxhSBOte1RrPXV0I3YfrFuIusFczHWAW9CxYoXLd3utFPgmdENf894X
         cllKCXw7sgYou50ZLpqTHWR4mA0KmibO6PEz6RfpP4DDbmKj22uRy0Pse6PTn3/kpvsg
         CttQuC5YUhOBeav0GwqdAOMJ0Wmhnd15f8jNcgxqmwp1May20BCOYWuvEbX+fzggfJPJ
         uf9tZ104DtGQXUWtZPPmRE9Xzpg3bQhurg6qti4EyWBBnSiwW8VkFqJQxbAuSnV2d44k
         8Ii3lTo3DZrF78RYGNQT7uojasjNmPWHJSpKcQM4i10dQ4SPZI4DYZ8H+I92UTjkqzTd
         6PYA==
X-Forwarded-Encrypted: i=1; AJvYcCWx7FD9d9LdvNB8fQi9ifX5HkF5TH/VbNNxli28kU5rPRkC8vxd1lYBh36jgMdEYo0eMVkoqy6rj9lIaFqRNdqhYnuj6wn18/+6CQ==
X-Gm-Message-State: AOJu0YxoDHqooYzCApjTHpMzlMs+bgzIuhIeOT1xCcn1PMwlKd3ikXye
	V8VeVPT/BcxgPzUO47/yA8Fynca8TUcj5HWU3Mil4RhNTZIlsqfjwAyYXCkajeY=
X-Google-Smtp-Source: AGHT+IGDBef0WRtb0XJ8d8v5qL2Ie1rZUFdFV7B0czkJOt4XCBhN/gvVhIsedYqTp0lfpWm1P/r0cA==
X-Received: by 2002:a17:906:911:b0:a6f:56d2:8f0b with SMTP id a640c23a62f3a-a7245b6dc3dmr664354066b.3.1719391541930;
        Wed, 26 Jun 2024 01:45:41 -0700 (PDT)
Received: from fedora.sec.9e.network (ip-037-049-067-221.um09.pools.vodafone-ip.de. [37.49.67.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72605ff279sm218647166b.5.2024.06.26.01.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 01:45:41 -0700 (PDT)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: naresh.solanki@9elements.com,
	andy.shevchenko@gmail.com,
	broonie@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] pinctrl: cy8c95x0: Update cache modification
Date: Wed, 26 Jun 2024 10:45:23 +0200
Message-ID: <20240626084525.787298-2-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240626084525.787298-1-patrick.rudolph@9elements.com>
References: <20240626084525.787298-1-patrick.rudolph@9elements.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the previous review cycle the regmap cache update code was
questioned since it seems and odd way of using regmap_update_bits().
Thus update the regmap cache modification code to better explain
what it does and why it's done. This is no functional change, but
it's improving code maintainability.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index 781949e0e09e..9a92707d2525 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -475,7 +475,7 @@ static inline int cy8c95x0_regmap_update_bits_base(struct cy8c95x0_pinctrl *chip
 						   bool *change, bool async,
 						   bool force)
 {
-	int ret, off, i, read_val;
+	int ret, off, i;
 
 	/* Caller should never modify PORTSEL directly */
 	if (reg == CY8C95X0_PORTSEL)
@@ -497,24 +497,20 @@ static inline int cy8c95x0_regmap_update_bits_base(struct cy8c95x0_pinctrl *chip
 	if (ret < 0)
 		return ret;
 
-	/* Update the cache when a WC bit is written */
+	/* Mimic what hardware does and update the cache when a WC bit is written.
+	 * Allows to mark the registers as non-volatile and reduces I/O cycles.
+	 */
 	if (cy8c95x0_wc_register(reg) && (mask & val)) {
+		/* Writing a 1 clears set bits in the other drive mode registers */
+		regcache_cache_only(chip->regmap, true);
 		for (i = CY8C95X0_DRV_PU; i <= CY8C95X0_DRV_HIZ; i++) {
 			if (i == reg)
 				continue;
-			off = CY8C95X0_MUX_REGMAP_TO_OFFSET(i, port);
-
-			ret = regmap_read(chip->regmap, off, &read_val);
-			if (ret < 0)
-				continue;
 
-			if (!(read_val & mask & val))
-				continue;
-
-			regcache_cache_only(chip->regmap, true);
-			regmap_update_bits(chip->regmap, off, mask & val, 0);
-			regcache_cache_only(chip->regmap, false);
+			off = CY8C95X0_MUX_REGMAP_TO_OFFSET(i, port);
+			regmap_clear_bits(chip->regmap, off, mask & val);
 		}
+		regcache_cache_only(chip->regmap, false);
 	}
 
 	return ret;
-- 
2.44.0


