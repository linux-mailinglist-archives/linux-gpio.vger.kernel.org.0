Return-Path: <linux-gpio+bounces-40023-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DqZ8ANLkVWqmuwAAu9opvQ
	(envelope-from <linux-gpio+bounces-40023-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 09:27:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EF712751D60
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 09:27:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=YMRWD7kB;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40023-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40023-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6D2643008636
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 07:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AC593F23D9;
	Tue, 14 Jul 2026 07:25:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F9C3F1AD9
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 07:25:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013932; cv=none; b=NLOWPRBydqD24EHgJdMk56IUhk45h3MH2XrbdSZjlj+e+7ZMLKQuUFSH9MXkYq9XmuxGOgf5TPZcJYgKjsNd685Er8EkixOU/v+l2zPWrpGSvxLK4VVzqwF12M9mGlr6NFXSY4XrpXp9BXv6LMkjpg0osm/GwupLQT98qcngKBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013932; c=relaxed/simple;
	bh=kJbP1vlIDZGNW5MhH9yj5Dhvo1y5G4Ye6VxXeN1kpPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=elxMg/i7ILlXHyWRntEawfyGnOu8DybFV+LEJh28Ai1/hjIHgFj5KE2U8/ZhOHqVyycS2Jjip4BK3ILKwtOPoBiUUNRGe54v0pQ+qfBm30I43faS6Dau5xfmjbvjskVgL7LcQZEUqyUpaByvAArfcVIxalbaC8t3XYT96o4m6rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=YMRWD7kB; arc=none smtp.client-ip=209.85.128.52
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493f0ae9572so15980965e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 00:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784013929; x=1784618729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d3yYjM1iQh/krpKsxuFz4T1SZtWWbdIXNuzKjoaUC1k=;
        b=YMRWD7kB6JNRSrf58vgM8V7oadQKXawKNkHbdiT7o3qwS5N49MCu6/mqbcCthwlswT
         /9KXiq1/n9fyYJMNYub/ZoqSrPttNWY0opqaa8ojIILPQL5VChX8G0dzR7q3aHIoDzBt
         Ecr2tkZBU+6PbMKUzfjXufeT6AzkIH065GsPtXPmaoCJCC9krGovtDYJxjNfF9nyD34I
         rW8ALajACt74+rnJe6zORln0MidYRJcqYatBLyB0NXSzRv4DNIc86AAQEOiX7L965eZy
         LkinTEDQJhYfwzvjYHDyVO8cden1Utrj6jRsKxEUznkZaK2VjgI0ZvphntjnITyHVLq5
         X6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013929; x=1784618729;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d3yYjM1iQh/krpKsxuFz4T1SZtWWbdIXNuzKjoaUC1k=;
        b=Dl22XNIGXSu7XU8G577ND6M/zqlTmvw+PeZoM5pveJDJgFGouE5Xdn3HhmdFm1kYUc
         sXz0lfk/wnHEkH0BzXvQVvjeBKfVtaf81S8vVbsZhOhxrDTnfK2LwyGs5U/fftTyXPbi
         OUaqjQJ6aP/hox0oBiry2FvMW6xTfqJ/ytKtPpGXkf5002RjcAAb4UVcz6rdQ0Nhof9E
         bVe24nC7+s6EQe2TGTLxEHQgj+8XKovI3KuXb1SxzqWENK+ewL37yG8pMJHMBRk1xHIQ
         jUi+hfoP+ppVQB6H0BOVo3x+ES5Z6aSQ6+K59z/RyqyBfcJRg5sSCCYrNskOOhKR8vGe
         n5PA==
X-Forwarded-Encrypted: i=1; AHgh+Ro7s6+PwVkZB48i3oJzmj/pHCvNgU0ICeNkWjPm9vF2Q8TULwdJoxpPFOnkWyc5mHH62IG6nfZSsiug@vger.kernel.org
X-Gm-Message-State: AOJu0YydRn60x2ukd+9RycKgE9DMwbSjgzwNXV3WVzn39qsGXZU3B0RN
	beR1JL2bVpEf4dzN7GhFIT4AXnvYCUpQFNTpDOphxHjpQPMz/TWMOWysQ3sPTWPczJd/SG84kKE
	zdysz
X-Gm-Gg: AfdE7ckgFs7cUUQIdOJnmF+srwylwOFxPiUzXGQsEP/Jknzl/vaza+kpsRFD1j60dxD
	/5PFp3YEvc9XcfLAzQDJktCvFPtWKamHetGnqRLOhFpFrEjrGnoXmKNHOUWc6nh8gzOHlowE9Bp
	5KRHus4XP4bk6zicF7tQP/5egihFBo7QpkMamNnkGThXoM8QTpYIuvDI6uqb0RUhwwXtAl2Xlau
	4hVzVnMP2970IrW44dAmfj+Gvl4DbTn0dCbgRDYM8uIJiQqscHHoRCn7If6suPQ1ZYLSQJHlMiL
	jGe1VeaKpAqWyFq6VsknE97vNfLzPAKDbFj5cRWmjgkSYYXL/vHIjyfFJvgiszSeQqrpzKjCJMD
	OehDZ4UFQzyUeh91XyZN1PQ1QmEMzFwiW5s2MjsrUJEEi8bBW9q+Wtmp+A/UPhdJTFejM6692IC
	/kWrkgUylNzJDvSTcagBcWuaecT+/pGO/7MCzVNN2hTZiCceEulupqlSZOuGPCk1MhBbXl+D6n/
	3QT
X-Received: by 2002:a05:600c:620c:b0:493:bc4a:fb56 with SMTP id 5b1f17b1804b1-493f883dbd7mr116701805e9.39.1784013929140;
        Tue, 14 Jul 2026 00:25:29 -0700 (PDT)
Received: from localhost (p200300f65f47db04b44a80421173aa03.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b44a:8042:1173:aa03])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4950872424asm58244745e9.1.2026.07.14.00.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:25:28 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v1 09/20] gpio: Add missing dmi module annotations
Date: Tue, 14 Jul 2026 09:24:10 +0200
Message-ID:  <eb1fdcce0f07e274e5590b8821d9dd7835f1ce0a.1784013063.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
References: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1293; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=kJbP1vlIDZGNW5MhH9yj5Dhvo1y5G4Ye6VxXeN1kpPY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqVeQyE9sV85pZ6HApzs2xBoUi/jv8SIAhyTeGK JrzbtP3BTmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCalXkMgAKCRCPgPtYfRL+ TruxB/9ds/H3HeOoZwboTo7tiqDemGhQudmIdmfMK5eY6UQ6tyyRZHVzIpM0MowrkE1Rrgu1+8i jlMbbs7lpd4s+pjYFpMQU2t7/zwn+1uxlBKzuETcvoWzWZVTGCTssIShhDvUEVMLMzGqZm5i/4w WavrmZ7UvLlvZEbsDwysdzRlsPiwnNCThyMTMv1REGcpSAMBQhC779F8+y/LBEW06+rSshOjkVl t2RboGW07K34FZeWC5ab7C0qegqzAR5zrIbaCYDUe3mfXP4QEjlh1VMDZJDW6hXXeYFXVlquwYy FPfipsv57n5RdnZGeTAXhZOB9gi6ZjKEm0M/mNuJg+c+Q62H
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:westeri@kernel.org,m:andriy.shevchenko@linux.intel.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-acpi@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	DMARC_NA(0.00)[baylibre.com];
	TAGGED_FROM(0.00)[bounces-40023-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,baylibre.com:from_mime,baylibre.com:mid,baylibre.com:email,baylibre.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF712751D60

A driver module matching devices using an dmi device id table is
supposed to declare that in the module's metadata. Add this information
for two drivers that failed to declare these.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-pca953x.c        | 1 +
 drivers/gpio/gpiolib-acpi-quirks.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index f6b870b7b352..a2d85ab1d01f 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -177,6 +177,7 @@ static const struct dmi_system_id pca953x_dmi_acpi_irq_info[] = {
 	},
 	{}
 };
+MODULE_DEVICE_TABLE(dmi, pca953x_dmi_acpi_irq_info);
 #endif
 
 static const struct acpi_device_id pca953x_acpi_ids[] = {
diff --git a/drivers/gpio/gpiolib-acpi-quirks.c b/drivers/gpio/gpiolib-acpi-quirks.c
index a0116f004975..5525c467c21d 100644
--- a/drivers/gpio/gpiolib-acpi-quirks.c
+++ b/drivers/gpio/gpiolib-acpi-quirks.c
@@ -394,6 +394,7 @@ static const struct dmi_system_id gpiolib_acpi_quirks[] __initconst = {
 	},
 	{} /* Terminating entry */
 };
+MODULE_DEVICE_TABLE(dmi, gpiolib_acpi_quirks);
 
 static int __init acpi_gpio_setup_params(void)
 {
-- 
2.55.0.11.g153666a7d9bb


