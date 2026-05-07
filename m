Return-Path: <linux-gpio+bounces-36392-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FuqMPS2/GkNTAAAu9opvQ
	(envelope-from <linux-gpio+bounces-36392-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 17:59:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EDE4EBB5A
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 17:59:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 83926308D25C
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 15:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC87746AEDD;
	Thu,  7 May 2026 15:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VuT1cXwb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92D1450904
	for <linux-gpio@vger.kernel.org>; Thu,  7 May 2026 15:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778169422; cv=none; b=u6TJUXY1bOcOIVCGJ4rcNvEC8Nf2M2Rnf6V4pMti2MUxyjjjff+xH64RjD23/PmHl+jWOo179bSAyYd5Kz9fFmRtQolZx3gvAozMKMU8in2PF7yaFQWlL78YsKvdkpDwpgh/ZxpYKgeryjXP/SAjx+B2pz7Off0d/Jgpb7+XMeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778169422; c=relaxed/simple;
	bh=37auMNg/QVimiWcnWEOWuPkMh7KrDw5XZX81fsEUK/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QEWM2ppvf3vuHmOTs2HxcnrDZpF9pCq3YatuKIZfZrL54ePw9Ww7i4CGg6JLymo0Uarx5XnoKcmwzSCkcj7jzI7viuDl45RbBhBakT/5yYWsOgbT80KvxpQMa384oZv+B80M20ySeKL6n+AnsLfqN86jhyEjMLqwDxZyrX+n5d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VuT1cXwb; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-44a5174670eso687819f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2026 08:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778169419; x=1778774219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TLgSTNMb8UYEFesiZU1z3JNyVkQfEaBHIUu75ZHyE5U=;
        b=VuT1cXwbLDYi1cIqsSiJldPpxlGNZ0Lgkpwm5qcJO4GuvzzDjuHNsEICpMZpUQ/WBT
         JpNRxGrdIjBbvErbVfbsScgoTOm4Quoh+mIb7z3RzpXBN9KnSWicpVj3fp+H4ddvjLR/
         1GvOEkAcMrz0a8B1/CHsYuD0RFfENZGXUL4ksL10Axkk9kdFaU/Nz9sdDXLMm49caJz9
         7aZXBOqnO60+nf6T9wbqhzh9yUhChKAkfv3olAXQnOPpoFzVrD0Fw+sbhnAxIFJgitxx
         YsqW+DVuwK9nOsBEkAcoGhXU4S42rzBrOhJBwt10CT2hXKee46j4okGRIuXWuSRgFO1/
         zuLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778169419; x=1778774219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TLgSTNMb8UYEFesiZU1z3JNyVkQfEaBHIUu75ZHyE5U=;
        b=DIv2ock+SBjLbPlJO8n5kXEgNwmqyIOFknt22yTyTFVkLSeavU+rW1/9qd4Au9AAto
         qN8/4GoTmP9H5oP7x0K2jvWTPW+D357t7hKycqg6CLqx7LriPfGsPLviXh8RIxglZIr5
         rMuZgD7GgGr5HofUKcWrF3gsPrqYrCGWT6WN2mJYgf6Rjwt0whjuug6J0NSH6saBQ9cM
         Gen+Hpt2AhXkZrAXA+q6Lm5K5tUuknxMmPxoOGTp2RLURk1JTCqvI9pmvlQe1xxyfUo1
         rt2Om71J4P/ApdSmMeqT2U1KOTy/2Jd1lq8k85wayKkQJjXyX3Bm9iMAqFL+52ZqXiOE
         iM9Q==
X-Forwarded-Encrypted: i=1; AFNElJ+sw45nRjUgmUMvc8oKKKOUMG3fckqvbqBpbPigHCY4ZsX23LuMEqeXn1//JKS1znB0nnd7zJsOq0qR@vger.kernel.org
X-Gm-Message-State: AOJu0YxqwCVynjP59Z0A10fNvHwgt98GFkizY+Tw+Yl37kIMlvwrsfnV
	aBkPVSweQhgCGlG6IktM80b3fMzrj99Fo5U9HFdpXpZJOuGy39MUWGim
X-Gm-Gg: AeBDietEtBI2taMY56N+Hk2/AlQzU4l/d552hUGvd/1Qd1meMfyzOMruLzNZJ/ToYZ3
	ujg1cS9hZJbcCd3SPpT/VgZJLZ/HAVHSMKpRr24PRUiDaPEIStN/XIkYLBxDSDxMBu16ZK/Mc0J
	5GM1RnWfwqfYWWnLhDAwehYFt27S75/JTeS6kXM5UvGycLbNRrosOHge9irD914P/NEV6j5SuPA
	gnpORFF8bWSGVt0ySGfy8vorxPvEmoEe2XFeXahPJF2uphH9bNNBNKzg0nED3HN4vhRhNbnYq5I
	3SlrmGZLBs9aUrgPaFbjj/R+CVlQ8A1diEYS38PhsQA0lnNrR4Oa4Jt/WMjmYM5wymc5/88oRRL
	qtx9k2pq+b4GlPMSRptVnWdIkJahj1WGyfKFRsfwcwxoW/NuWUfJmlIHIUhzI1ftVTkNqF66Sor
	1R+yE685yTHtiF5kI=
X-Received: by 2002:a5d:64e3:0:b0:441:1cf8:be9b with SMTP id ffacd0b85a97d-4515d9a06cemr15004134f8f.37.1778169418765;
        Thu, 07 May 2026 08:56:58 -0700 (PDT)
Received: from ROG ([2a01:e11:202b:40:68b1:8d59:e348:c16e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45412820463sm44581f8f.3.2026.05.07.08.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 08:56:58 -0700 (PDT)
From: Marco Scardovi <mscardovi95@gmail.com>
To: mika.westerberg@intel.com
Cc: andriy.shevchenko@intel.com,
	mathias.nyman@intel.com,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <mscardovi95@gmail.com>
Subject: [PATCH v3 6/6] gpio: acpi: sort header inclusion alphabetically
Date: Thu,  7 May 2026 17:56:47 +0200
Message-ID: <20260507155647.403964-7-mscardovi95@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260507155647.403964-1-mscardovi95@gmail.com>
References: <20260506123421.1077421-1-mscardovi95@gmail.com>
 <20260507155647.403964-1-mscardovi95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 43EDE4EBB5A
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
	FREEMAIL_CC(0.00)[intel.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-36392-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

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


