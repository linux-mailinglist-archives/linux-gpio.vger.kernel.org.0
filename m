Return-Path: <linux-gpio+bounces-33087-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIwpL6YxsWm0rwIAu9opvQ
	(envelope-from <linux-gpio+bounces-33087-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 10:11:02 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 23600260107
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 10:11:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A75732FCB28
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 08:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800B93C3437;
	Wed, 11 Mar 2026 08:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FANwrZ/o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74B53C062F
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 08:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773219589; cv=none; b=EAR53TgsLnFxq04ORufZxH5lJ17gc3+5tyrHie41/RgazhLfoyKOP3KCD4oWu04lzwqmVhw+cLkMk9QRh6F/vu9s0z1xZ0UjqRL/fdfWchEh83OSRNZ21QzRrc6G6tQ0kAxM85/SnESNiqPLrpPMSuDXI10VpPoPU//aWGT2obE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773219589; c=relaxed/simple;
	bh=4HRczWwf+idD5YLdFOtxKhZolR3r0ySv0HVp0ZcqQKk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V9aeNcb4LzSYCdYxTiDNum4VilS+dagFKueG8pI3JUTZySiLNLbzc7KGHID/r/FCholOFXIb/C6LvBC6clTWzca4M/kDmDmKwFVUti5Ro4emF+27h4yLmPsmEu1OCyt1UOZH8KniZOUez6H1LcMvvag3VWTt7GXHpz2mNkk+xgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FANwrZ/o; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48534e9076fso25821915e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 01:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773219584; x=1773824384; darn=vger.kernel.org;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zkM4bGnCAz6GhYRTPSestmLq7baCdGcGpIWjoPgO3YA=;
        b=FANwrZ/oL5qdO7k7z0jekmidjT9UZ1vmNnRoFJKLBA7NOGqljCA4SW1cB80O5HfM5O
         Fa3oeZN29LItLaZfXgQrWe5RB2hDiRVuzf4K0gWD5v8b5P8T5aw+6DrQf9e6OAWpEHn0
         2o7TAgLTGWgRoT/AZAsXOl6Y1SQdgfpLU8MWs80lwZbz91AtTmTE16DESNaxUNJ4CxQx
         +JYahmdBnvr/el6ZYqcrqJcFvrbqOAW9AnneawxdfKt+mPZC5tKWW6HG1mHpsrIn7TA6
         mJuE3+qfhwOmdYkfMV9tr9++kLoG4iyTu4LvSX/YNxJogpn4k5fSsZoYA4sVE7HQ/L33
         EiPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773219584; x=1773824384;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zkM4bGnCAz6GhYRTPSestmLq7baCdGcGpIWjoPgO3YA=;
        b=Ve6l3FCmyAs2+aLDBAGo4z6U41HGRG5gDwo4MSeexZZjC66/lxFkv6kL9YYiuwfTgA
         r+V6VmFYRYQJz7AXuBnK1uI1Lh4Q1o7SCIdIpveS+2vmeUbx+SqfuihBgvsaeL2y1urB
         BittPW5fQ5OxpT7LZCRarVUX9215Z+6idrOxY5iIftHpDALsTp7rZL9wp15S1h6MChZw
         Pd+6J3xlm2vPP4Cjd7DE0WNr8mJB35eFaBA3NKQaM18QbLsbOaTVNpli34l9aHi+tvHx
         lx0M0xu7B76iZn/adJyB7m9A7wNHiIeWOp3sIWUyXBCQcKVKt6Zks0RGA0SBFJ2kdLUX
         WqUg==
X-Forwarded-Encrypted: i=1; AJvYcCUwVb/t5LMVVKeDVyZIcLg7qZkoQwmWA/LNAca6FAS9spM3sjiTnaD8+1TToIC54KK2sm9YgZMRqV2B@vger.kernel.org
X-Gm-Message-State: AOJu0YwsiNGvq3sAhgXk5m4r55Cn4MsCXa6jqUwe0BtMuqnmWO+6nTC2
	BQW5Kug5k/+NKjMiyiphi/rDqDbfgsh9BayJh++iLv+udigO/vBS286f+DftKVXZ0go=
X-Gm-Gg: ATEYQzwFrafy6OpnL6r/d8aBMUXDSeURmS88/OICuEFG4kB1p1HzvfYpNop4GcRD+Ea
	/tjGngem0ksfZIimL2QHLQt+T49xEHeZMLsEkvAvVGgYNTIStOvJjyCOu5PyxcKR2xkpNvYhBtp
	mzVLaJ5gfF6zM+ElAz+S7g2xJBjuU36rsR2D+pX2IhafWYxX3ikTwvG2BtIlS6H8W9i8IWndK9L
	rL6ZckuTYHErE6VzwXZEkwG5raVUcXT2njrkAwB4opyJdjY/QRYmIg6hJhGuwvJKqdyPt7JwExc
	5S6Ugjjs4EziF6yt7cXkR98kzLm8HJc2ZCJJtwoi/xVXUcrcGagpXPm5nIHBS3o5nQgfW5MH53k
	6ZBW7+/i9CJGqJ6yGy715F1OnNsUT1YqU/wXwin0UNR7Zc9+4UKL5C6vJbsiU/6sRFlqh7xzkPR
	q7kSWbOJF/bsW08yJxzoX1tl+8dwpWchhPkSnWXS4sG0pui3SMWW8EDYQ=
X-Received: by 2002:a05:600c:1f10:b0:485:3f58:da6 with SMTP id 5b1f17b1804b1-4854b0a55efmr32579185e9.2.1773219583737;
        Wed, 11 Mar 2026 01:59:43 -0700 (PDT)
Received: from r1chard (36-228-122-64.dynamic-ip.hinet.net. [36.228.122.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a03005f7fsm1492215a91.15.2026.03.11.01.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 01:59:42 -0700 (PDT)
Date: Wed, 11 Mar 2026 16:59:26 +0800
From: Richard Lyu <richard.lyu@suse.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Richard Lyu <richard.lyu@suse.com>
Subject: [PATCH v2] gpio: max732x: use guard(mutex) to simplify locking
Message-ID: <20260311085924.191288-1-richard.lyu@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.51.0
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Rspamd-Queue-Id: 23600260107
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33087-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[richard.lyu@suse.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,suse.com:dkim,suse.com:email,suse.com:mid]
X-Rspamd-Action: no action

Convert the max732x driver to use the RAII-based guard(mutex) macro from
<linux/cleanup.h>. This change replaces manual mutex_lock() and
mutex_unlock() calls, allowing the chip lock to be managed automatically
based on function scope.

Refactor max732x_gpio_set_mask() and max732x_irq_update_mask() to
improve code readability. This allows for direct returns and removes
the redundant 'out' label in the set_mask function, resulting in
cleaner and more maintainable code.

Signed-off-by: Richard Lyu <richard.lyu@suse.com>
---
v2:
- Sort includes alphabetically as requested by Bartosz.
- Add missing include <linux/mutex.h>.
- Link: https://lore.kernel.org/all/CAMRc=MfioFeJD=s_w0PQ2jD4npHr9y7nMhu3bXUwrr0D8roPgQ@mail.gmail.com/
---
 drivers/gpio/gpio-max732x.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
index a61d670ceeda..257742f95949 100644
--- a/drivers/gpio/gpio-max732x.c
+++ b/drivers/gpio/gpio-max732x.c
@@ -10,14 +10,16 @@
  *  Derived from drivers/gpio/pca953x.c
  */
 
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/slab.h>
-#include <linux/string.h>
+#include <linux/cleanup.h>
 #include <linux/gpio/driver.h>
-#include <linux/interrupt.h>
 #include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_data/max732x.h>
+#include <linux/slab.h>
+#include <linux/string.h>
 
 /*
  * Each port of MAX732x (including MAX7319) falls into one of the
@@ -207,22 +209,20 @@ static void max732x_gpio_set_mask(struct gpio_chip *gc, unsigned off, int mask,
 	uint8_t reg_out;
 	int ret;
 
-	mutex_lock(&chip->lock);
+	guard(mutex)(&chip->lock);
 
 	reg_out = (off > 7) ? chip->reg_out[1] : chip->reg_out[0];
 	reg_out = (reg_out & ~mask) | (val & mask);
 
 	ret = max732x_writeb(chip, is_group_a(chip, off), reg_out);
 	if (ret < 0)
-		goto out;
+		return;
 
 	/* update the shadow register then */
 	if (off > 7)
 		chip->reg_out[1] = reg_out;
 	else
 		chip->reg_out[0] = reg_out;
-out:
-	mutex_unlock(&chip->lock);
 }
 
 static int max732x_gpio_set_value(struct gpio_chip *gc, unsigned int off,
@@ -329,7 +329,7 @@ static void max732x_irq_update_mask(struct max732x_chip *chip)
 	if (chip->irq_features == INT_NO_MASK)
 		return;
 
-	mutex_lock(&chip->lock);
+	guard(mutex)(&chip->lock);
 
 	switch (chip->irq_features) {
 	case INT_INDEP_MASK:
@@ -342,8 +342,6 @@ static void max732x_irq_update_mask(struct max732x_chip *chip)
 		max732x_writeb(chip, 1, (uint8_t)msg);
 		break;
 	}
-
-	mutex_unlock(&chip->lock);
 }
 
 static void max732x_irq_mask(struct irq_data *d)
-- 
2.51.0


