Return-Path: <linux-gpio+bounces-36434-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJ66NjOA/WnnegAAu9opvQ
	(envelope-from <linux-gpio+bounces-36434-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 08:18:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B60164F25D1
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 08:18:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 89DF33008C0F
	for <lists+linux-gpio@lfdr.de>; Fri,  8 May 2026 06:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 098F43783B1;
	Fri,  8 May 2026 06:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nt0yV9oF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD330376463
	for <linux-gpio@vger.kernel.org>; Fri,  8 May 2026 06:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778221088; cv=none; b=EOZnpgh6aTstvd8U4p77VJw1uV/E1E0cOGqwl75KLRkjCiFSITXyL8GeVog33MrGt8fo9ZOQIzo+xmEexPBHesvViAEHIZdoCjNlerUO3Mqm3jHRxI8xwI5AWojvA9OKxvRCn81XaCMXchHjRhNVWBSx1bUysTtAEQ6VjR9oec0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778221088; c=relaxed/simple;
	bh=/DEFkIW9I9NwWWfUVQdS9qd8W0IKdC3W81KyiTB7ETg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nPuUqvhIUu/dYpP6E8fxbPlvhCqzxc4DgGKXuJARtTz8b0i0wIVFQTi3X5zI7k0VYJNe133JEg2RYqPgYmqIhbzI05o6L76fHSzmfMLKUktRUCL7CDU3Npg0BLnkEVmpDTcx1B3idLYDiKHPYZobaYhEkYjAbXy1lpaP66jySjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nt0yV9oF; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488ba840146so14197965e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2026 23:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778221077; x=1778825877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OIgsaz/80F7YVh1co0erXVe0CBs1zSzj8RjSOOEqAps=;
        b=Nt0yV9oFYvcQdlpIVcBPIz+S5V2AVdvo7OlCMwpxJqakzKRFYEx0wGQl5QhioNGAee
         uYQf4GifnjFC2J7xiOFL03dCy0Lm8dVkAwOQiyWQ8nu2SZNyrCMTzzUsnuRGggxF8r8O
         y+c/u+50RjxwwLVHGKBW3899cvNsVoqWyKBImuwtGR/Iy77UFR2zMhLoez48TxBDRJd8
         J9r97uEyipw/MCfrC+7cMGkRUamWEM/29FZmoH613I04NEM4UyB+PuJZRfTTv8pj0/2b
         jTDEfED9Nk0hKmUJou2UnRHuobn96Myawnw11v8UvxtxZ6SuTdh896hzx4VjE8XfuvTU
         hZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778221077; x=1778825877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OIgsaz/80F7YVh1co0erXVe0CBs1zSzj8RjSOOEqAps=;
        b=B93fNqJpDRS3tEviSbaG4MP4hfag1krvblrYfrsDP6iYGCjNLkQz/p9g8Xp0F9netH
         QrHsw98ckN3T6wYqNTKBzszVzvMRTRhpaqhq/5fc+bkQtj2JVjoJ60nLCFchp1fusZR4
         dZq3NvwVxwBUGGg0CrGZDdemd6Eipn4Wq8nqatHCFgiRDgcjyDl9upTnJsy0CD4ElQsG
         DiBdt/KVQrodOkjwzPWf5TgDEtRRf+t/GT82fPD/X2KLLix0TBC3D6UuVeyfirIIqxR1
         2IwREaEZzKrPPQ/rEaM1jQx7rIiWCjMH/QEbhvjI4dkeTxxppPr6+4B27+RJJ0mgiy8/
         h9hQ==
X-Forwarded-Encrypted: i=1; AFNElJ9kWKHNE2OP4wbnEtA9WbyhjNvYs2nW0DwSu0/RZ/Ko+AyXInQ/kN1e1RbvdvahMDkcCN8BPsENnsJ2@vger.kernel.org
X-Gm-Message-State: AOJu0YwE+xTz8AL8RdWhsDAmxOAN/wzzvbG/sLxdGfOoUvjLNbTh6YFC
	bp2koGMpJqemqL04Mi6FNcPPFwy+um1EQJVDfXo8jym+yrjJLozoYzYY
X-Gm-Gg: AeBDievrgW0HyWPpD8NNRHUVQUnT6ejqFWM0v065+OtqkzpKXTAtpjZp3eBjosgckf7
	bTJZWywKoiZj0n9NxtsFUOJyLbgJ+pOr31Scm7ytRyakRIsWNBzSbKzgZ7kpIS1URDIvVgf9VfI
	LzSyMgqAzeTr9yPdeoh09MqNDnof3DkEHl2oEyNmT7qn+PWgd/viErhg6mGw07IN9BLry7e/Jo4
	glxrzXrmjr1MdnAYWxLKHZhs4uEFjgGttjA39YKg7E57dbSeVBdgVG/7kyz/dlbzXdRlQaD5/wS
	l+F5tTa0AgVY5oJMUimOVPVLOhH7mVvXv574yyz5QKodQnUvFzdpHVIk4cOWpXc0GR2j0dwCxqi
	O6C2mdGqBEIgArQ7SUBYY4ItyI8+0L4GT1+k3L/tQq0nllPPCodqFHMrSfZZIaq+x35/ai1CKXB
	ecjbiiwc0ttErax4s=
X-Received: by 2002:a05:600c:a111:b0:488:79a3:f04c with SMTP id 5b1f17b1804b1-48e51f46d1bmr129939265e9.27.1778221077168;
        Thu, 07 May 2026 23:17:57 -0700 (PDT)
Received: from ROG ([2a01:e11:202b:40:68b1:8d59:e348:c16e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e68f5d48fsm11251175e9.14.2026.05.07.23.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 23:17:56 -0700 (PDT)
From: Marco Scardovi <mscardovi95@gmail.com>
To: andriy.shevchenko@intel.com
Cc: linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mathias.nyman@intel.com,
	mika.westerberg@intel.com,
	Marco Scardovi <mscardovi95@gmail.com>
Subject: [PATCH v4 6/6] gpio: acpi: sort header inclusion alphabetically
Date: Fri,  8 May 2026 08:17:29 +0200
Message-ID: <20260508061729.9530-7-mscardovi95@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508061729.9530-1-mscardovi95@gmail.com>
References: <afzlsRkyKQzuUcgL@ashevche-desk.local>
 <20260508061729.9530-1-mscardovi95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B60164F25D1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,intel.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-36434-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mscardovi95@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Reorder the #include directives in gpiolib-acpi-core.c to follow
alphabetical order. This improves code readability and ensures
consistency with kernel coding style for header management.

Signed-off-by: Marco Scardovi <mscardovi95@gmail.com>
---
 drivers/gpio/gpiolib-acpi-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpiolib-acpi-core.c b/drivers/gpio/gpiolib-acpi-core.c
index c9b12e24de14..7b324dd4ae67 100644
--- a/drivers/gpio/gpiolib-acpi-core.c
+++ b/drivers/gpio/gpiolib-acpi-core.c
@@ -8,12 +8,14 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/cleanup.h>
 #include <linux/dmi.h>
 #include <linux/errno.h>
 #include <linux/export.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/mutex.h>
+#include <linux/slab.h>
 #include <linux/pinctrl/pinctrl.h>
 
 #include <linux/gpio/consumer.h>
-- 
2.54.0


