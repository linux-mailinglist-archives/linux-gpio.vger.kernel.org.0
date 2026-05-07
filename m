Return-Path: <linux-gpio+bounces-36386-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDdBLv63/GkqTAAAu9opvQ
	(envelope-from <linux-gpio+bounces-36386-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 18:04:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC334EBC54
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 18:04:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B995B3040229
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 15:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8394F44E043;
	Thu,  7 May 2026 15:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GbLfc4BF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E137B3FB7C7
	for <linux-gpio@vger.kernel.org>; Thu,  7 May 2026 15:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778169416; cv=none; b=XDExy4hn1wRN7xESK0n0H7IZDo/W3gIMnoOuMZ0/y+g14zIzHw++KByQZaHQpqFHyJ+lnO90U8P+hamRMeIG3ZcLg0F2l17IlFscoXvsACMOZujVksvET1TtlhdkXCPLuwelRQWaJuHCnJzOWeZLCss173gsjPIUKTd382Yshqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778169416; c=relaxed/simple;
	bh=L8ZG5MdSMRfMYLK/Y/vQSssOeyeJ766Jb2gi3/xtKnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H0a7X5TsqKe3NptgMw0wgB9NqGFi1Ev0Xt2TKJNPO4Ldwm6uZsuZFMEozwA8+0v8GaqPtaqq+jxbt9X5jhBqhDpII6Y38kYj082VQSViWwHn3t2CKAPD49OwR43si5XDG5pRzBkWQepoRyWx4KR6AJbtkzCQJNfd/IWcPUzRaNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GbLfc4BF; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso12852855e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2026 08:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778169413; x=1778774213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wWOVJWQ8SVjB03sGFiTDM6pslttSB4g+BKLqIEqV8xg=;
        b=GbLfc4BF1gQlVfxD8tjDYAZQp30e0OhOG9vUr9/4q31d0bkOb4ygX+JZHjlcJe30es
         7N1kazFVijYvHPjK9/xwJz8ZFIWAzwu8qDQFm6jwCRh2p4oKCg7BiROVP+95N8s1R8hU
         KV0XDYbODQPfrLdKg5ovoKYLLIENJnaR3MD0HGUT/e7uecTpjETV3TKj/UtUMIr/aYD4
         kJG71O22ZoC/n5ZfM4LqtwSIAiAsjooYMeuaHF4CoKARbFXShWUuoGAeV6dz1r/oh8zf
         xLgoEDdHGiHgLXuk+cAmWCRzgu7ZCiHAqNsGfS/3IDo9a/7hwfYfxrkiBKv7tkGcL5nl
         X2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778169413; x=1778774213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wWOVJWQ8SVjB03sGFiTDM6pslttSB4g+BKLqIEqV8xg=;
        b=hMVx3qnZzDSdIC/rslneiV+zBT5MLsaF/WPq0EnSYJR6W4Q1RrCNbP7B9hJyjIvePl
         3Ko7hZy9RMilGo+uj236uZ9/HT3BEfR4XSBNdlPptMHr456LacAytarGNuP0WiwDOuM7
         eJS4Tj6yT6bzBzg+FfsUoP5eToaWziS80M1H+CKBI0ImFJzRkwDp0S5VdweBMu76aZrZ
         dRxSE9UA97F2u3lgRtRA1jcY2tzYaOUSDMaVKZ7Uo+F0DWLKW8cXSW8JqwC10v/Kfzhi
         3kbN3pJPMCVZ+Td333iZxka432rYM85WhuaObdFJaIV5rUfnR5ZxcPbgQE3XQuP4cCT/
         7BNg==
X-Forwarded-Encrypted: i=1; AFNElJ/tos6Xb7Nok//Dmtc8KVaSWEnb0Hg83Lk5CFw8doNQveReANTvWuPzz8A37kFUTBi3y6WbpQIu0Vqr@vger.kernel.org
X-Gm-Message-State: AOJu0YxvuT2+sNtRulRQgY/9plzcwE77YiyPbNz7uStpkpn15X06z5H4
	f1sW/4KzzTiqA9w5QFRXN20AClsiEj9A2Vo7eRrfFipcyfWN5APejiXGyKVR+MgER7gWRA==
X-Gm-Gg: AeBDiesp1zuDikYCPraX9rHogEZryxL99Iz5vHekJe10+eS8VNV93+nekIdKnOpNszw
	1/oszMJDg/2/BZnnxU+Ng0bWf3S014OJYVptwRFqbMnw5v4ywjOYr1tpmR7dXcjuL8IQsuJRcpx
	hbCY59f0Xspw15KMndoLWx57Y5Unvjm2T9xPSTKYMvkLJB0/4pLrsP/d5rbtOA9yd0HtwQaV6TV
	Srq3mZECLdUJxqrh6q3svOL6ZJc4/l0lNeTlPtC454PYIDclMGTmSUb2ogb6XQTLgjQJsVIAc35
	dDe+J4qVP0KeSvrtGK2PCywGyIRrfBVzHxLH76673eVq8czMTLfnKR75hg4mYg8JPUheiFCw+KC
	i7vRa7Vowu9U6WJpibPsmyhH4Yy+xfDHNXBD/4ue07kRfVmWZwtWJoQIn/iRI5fqdGkqT6/5prO
	KHK0d6f0/cVE5oyvaNOU/9F6FmLQ==
X-Received: by 2002:a05:600c:34c8:b0:486:fba7:b150 with SMTP id 5b1f17b1804b1-48e51f2ed22mr157447255e9.15.1778169413102;
        Thu, 07 May 2026 08:56:53 -0700 (PDT)
Received: from ROG ([2a01:e11:202b:40:68b1:8d59:e348:c16e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45412820463sm44581f8f.3.2026.05.07.08.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 08:56:52 -0700 (PDT)
From: Marco Scardovi <mscardovi95@gmail.com>
To: mika.westerberg@intel.com
Cc: andriy.shevchenko@intel.com,
	mathias.nyman@intel.com,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <mscardovi95@gmail.com>
Subject: [PATCH v3 0/6] gpio: acpi: modernize resource management using cleanup.h
Date: Thu,  7 May 2026 17:56:41 +0200
Message-ID: <20260507155647.403964-1-mscardovi95@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506123421.1077421-1-mscardovi95@gmail.com>
References: <20260506123421.1077421-1-mscardovi95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1BC334EBC54
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-36386-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Andy, Mika,
thanks for the patience: I was way too excited about my first patch on
the linux kernel and let it takes over the reasoning and I'm sorry for that.
I've moved the defines on the right places as requested and refactored the
patches to be smaller and tested the build with KASAN and kmemleak as requested
by @Mika without any visible regression as for now.

Marco Scardovi (6):
  ACPI: Move DEFINE_FREE(acpi_free) to global header
  gpiolib: Move DEFINE_FREE(free_gpio_desc) to driver header
  gpio: acpi: ignore out-of-range pins in acpi_gpiochip_alloc_event()
  gpio: acpi: use guard(mutex) for conn_lock
  gpio: acpi: use cleanup.h for automated resource deallocation
  gpio: acpi: sort header inclusion alphabetically

 drivers/gpio/gpiolib-acpi-core.c | 57 ++++++++++++++------------------
 include/linux/acpi.h             |  2 ++
 include/linux/gpio/driver.h      |  2 ++
 3 files changed, 28 insertions(+), 33 deletions(-)

-- 
2.54.0


