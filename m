Return-Path: <linux-gpio+bounces-33047-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNOMKZjdsGkuoAIAu9opvQ
	(envelope-from <linux-gpio+bounces-33047-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 04:12:24 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B9625B4D3
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 04:12:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CBEC308824A
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 03:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26D11349B1D;
	Wed, 11 Mar 2026 03:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NbOX4EUC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704E734CFA7
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 03:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773198740; cv=none; b=r2UyWPSY2Jt9A5G8dbQnbVq+ZHPMOzNcjCNYJ+lgz1s155ImMlV/bXx6Ge59mJCUwlGbo9dJo6BPtTUo+aNuRyLoZrSZD+ysCjtq4ubEZRIMJbD/BMzKMPZnx3nSyG3gYF+Byh/lQUjpPE1wrj8U/H7HNK0bggrCCZ26+ga/9BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773198740; c=relaxed/simple;
	bh=dvdYUw/L09jSTlJMhz+swtQUZ7IKd36C0H1gADrHADc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p6F20h4vzto9bcZv3m+GB0KXYwI/buIPnUXgQalMQ3wIZLYPQLr85qj3z5F1owq7+6Mz8rCBsbfKVe/NVfdd6p7PkAk2ryBCeoNCKxjHuaufeknErAXxGERNcS/JgV9US1ZkfwQ3Wu7ifNfindwiAMNCSuNWVzPs+mJ5u337Pf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NbOX4EUC; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48532925a4bso17696285e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 20:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773198738; x=1773803538; darn=vger.kernel.org;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6u6I+GSaBY/xPBOlrKirlS369pHSY5y3fD48ukvZ2pk=;
        b=NbOX4EUCOn37Vb90LLDWTar+UHhVoTP244QARkFVcbzdFSmjzJlyGJygxm2HlJftGA
         o4hr4klNViJjppjcj8ZvUsFvJY+ZMWX9hP79YjGuUaPhqu8jt6p+Lpyeu+bjf3DR8W/1
         brW+cCgOlRyoBLdk0bduaU1K/CBDcqwMPceEhXSH4xDnrajrCaluWvu8DvXSI0ESnfL/
         eWy7l9IEUhCrP0yvUmxwbPKfeCfMwo+kP6MmJMvmLGsrC90PPHLmQreBVNtB4dVrqL3O
         FTi3IgzWUM5VGd/VaRKtt7bl/zAlsv/NsXvwlqX/kr7aN+nNdhqVrGn0zT0g+UsCm/gn
         iflg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773198738; x=1773803538;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6u6I+GSaBY/xPBOlrKirlS369pHSY5y3fD48ukvZ2pk=;
        b=hKmTRWDMJNvk6djUzpw4/6QnLGWsSECLE4MnGCcJV/ELLEfTbPhtpUyghv4/l/lPAN
         7gugmXJOIsfP9K/Om7dZeGP8FR5YVCA7HlUXLO6KylZHv+M+2TCQ9WeXkmT9OPrjYI8R
         l4NT38lwopqBC63oEQ58XTv/0k5bGQnDau6Oyo3PvzFpbFZp5x8McKsc2/OMpECSUplG
         4VcZFNI2gghYFyOJTOvaugqBp2ZFI0S6kBieRloj42UJzakAPSkPoKBik+n4a+i6adAq
         NncuTPX358wsGwBLLIjQtCoX9mGb26VfGR9cxHfaoMkZkQf6TYICaElzhMw0+Kt3tdHF
         EGRQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0SS+Jx9G0+FgM8c0QrqijDaNn2AowpYSLlOJ0kc3Og6z+PM8nqpjlFOhTuhcsM/CG5WW4Rm95ScrT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/m/nsRPGFgA3qMiU+GrcM0cGmHbPe4ylb03mFCLPomlYGH6OK
	r+/XslQWswMux24+xkD0D+tUo8VRTEcUqKhbjOLKX1MrAFRiV/M5cRlaCfZQhGb3HSw=
X-Gm-Gg: ATEYQzysl6tCIe6ou3ewlcJUMy+eoaDf3v12vc2hPgUs9yJdPbrsOs4o3t9AXdQ/THR
	DjfdFa3jHE2l0ApPmf6fCCJLzxY8twXP+U9P6bDLq/Y43ejYlFMVEHC5nD3tG7JhtX/s+UdGAHT
	C/TL4fswNM3qaoG3ITmuRhEA8aZmocF4BRzz/NpIHqFUpJPPA4XepM/FcDWQ9v+bAiS0wrJXJRG
	Hu4/2WaTJ2uHEcOtMIfrqy6fipAVsJ420Gdq2KSVUqc3OpnHQPTnc2yVb4HSKkBTw4DgkD00jwW
	nOilY2MgjIN0aeN6s76yX2YIWXOyS2ysefO0Zjzc/xdrLhhLMePKXqYBxzGzes9YuqKDEJALD4J
	uMEA74A9A3Ub4aY6ybPxKw9x3123NQL9wt7olBMvka+9MVSwX0g7xJo4xrdmoVHRZ3WiqDpqkZv
	JooZf+ci3zmkOCqeU0d/ZP6SMYs/gITQ9ie6FL8HFr+o6RSeA9oBNTSQQ=
X-Received: by 2002:a05:600c:8b0a:b0:477:7b16:5f9f with SMTP id 5b1f17b1804b1-4854b12cf85mr15689935e9.31.1773198737793;
        Tue, 10 Mar 2026 20:12:17 -0700 (PDT)
Received: from r1chard (36-228-122-64.dynamic-ip.hinet.net. [36.228.122.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae222ec3sm7873475ad.1.2026.03.10.20.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 20:12:16 -0700 (PDT)
Date: Wed, 11 Mar 2026 11:12:12 +0800
From: Richard Lyu <richard.lyu@suse.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Richard Lyu <richard.lyu@suse.com>
Subject: [PATCH] gpio: max732x: use guard(mutex) to simplify locking
Message-ID: <20260311031134.14218-1-richard.lyu@suse.com>
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
X-Rspamd-Queue-Id: 08B9625B4D3
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
	TAGGED_FROM(0.00)[bounces-33047-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
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
 drivers/gpio/gpio-max732x.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
index a61d670ceeda..8930f49576ed 100644
--- a/drivers/gpio/gpio-max732x.c
+++ b/drivers/gpio/gpio-max732x.c
@@ -18,6 +18,7 @@
 #include <linux/interrupt.h>
 #include <linux/i2c.h>
 #include <linux/platform_data/max732x.h>
+#include <linux/cleanup.h>
 
 /*
  * Each port of MAX732x (including MAX7319) falls into one of the
@@ -207,22 +208,20 @@ static void max732x_gpio_set_mask(struct gpio_chip *gc, unsigned off, int mask,
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
@@ -329,7 +328,7 @@ static void max732x_irq_update_mask(struct max732x_chip *chip)
 	if (chip->irq_features == INT_NO_MASK)
 		return;
 
-	mutex_lock(&chip->lock);
+	guard(mutex)(&chip->lock);
 
 	switch (chip->irq_features) {
 	case INT_INDEP_MASK:
@@ -342,8 +341,6 @@ static void max732x_irq_update_mask(struct max732x_chip *chip)
 		max732x_writeb(chip, 1, (uint8_t)msg);
 		break;
 	}
-
-	mutex_unlock(&chip->lock);
 }
 
 static void max732x_irq_mask(struct irq_data *d)
-- 
2.51.0


