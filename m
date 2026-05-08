Return-Path: <linux-gpio+bounces-36431-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCggMaCA/WnSfAAAu9opvQ
	(envelope-from <linux-gpio+bounces-36431-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 08:20:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF184F2688
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 08:20:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B1653059C56
	for <lists+linux-gpio@lfdr.de>; Fri,  8 May 2026 06:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 901A03783A2;
	Fri,  8 May 2026 06:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AyS28LDH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBE8373BFE
	for <linux-gpio@vger.kernel.org>; Fri,  8 May 2026 06:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778221082; cv=none; b=lAbTy/CrpwWbp4RZabEVg9q96yNWyVoraK321aTHEWEw8Xv1Ybp4lYWL3FJscaPHA4EGpg1TjWnOGO4arFs61KvUWpRMCcOueFA7JAo3N0X4mM4NGlF8RiE/4E+MkVPk0Lp1Ko49y3BoooQ8OV9WWA0pt/Av1WYaR8Oon253m84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778221082; c=relaxed/simple;
	bh=htgG8agL3qgdrhV6usqBHzQ8yuuUnR59c7IpqR6aYYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LZ8rgheDRT2mq7bas0/ujBypgxkIYRD8QJ4q34dDyA1J5t4WrbbpH1us1VxT3N+Bl/ifRyNtSfX4sfjj4GqvFeoegzBMu+4ZlvVDV8W0E+Jn9T8qvepKUSWcLgy7g0kWKBxFFZeyBvbK7lWzP92pjuLjoPFaU/+Cm9h4Bp3sG3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AyS28LDH; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488ba840146so14197565e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2026 23:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778221072; x=1778825872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kuh0TWbP7Q2PxqCNCqYvtEE1jwhkHwY8twT6/h1P3VM=;
        b=AyS28LDHAL1+CprIFjF4DZxtxibzVwoBEReC/4UthEhmYO6nM0HMm7CQ41LAVTvBGu
         RFZIKJpjI7ayh+EI9Um5M5ER0IMD9+80ja6sMFIO+I2tzZd2hxwvoj/POIXaTIVnr7Hx
         RbZJcBwoTPoHoBQ6dNhn0YUHb8eGsU3SWJEVHSRCFM86D5DxWfxKIOcaI74x9UVyocuT
         XXqW4d5mkEqTZO154+TFfqVU8Y09IENNP0KBUqFNLkrdlJHCp9It8rMVvwEXpT08ebik
         UcssL2JT0zeIm+gnpN7JxFaHxhraDln0blTkC+FC01jUIFsA0ZULVhFgMdgs6iEsm/aj
         IaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778221072; x=1778825872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kuh0TWbP7Q2PxqCNCqYvtEE1jwhkHwY8twT6/h1P3VM=;
        b=kRhdGpsJA3GmCPEad6bWN1jy0vYl0ZQBM+N0ymPJy3b2Hn0tkVFg0H7nHTqeon5m3M
         U85JkKeoZBjvS6ECKCk4pTu9Ny25gRqDiN1FWOOzJsArCFLBmtF+ajzP7kNP5Cybpd52
         bRLodEtt+wSP+xODuHIEBZa+9J9OZi1m9EYA/nMExGMOcDfUYNtgjz+6E00dQZs69+kI
         mDaq+8y7EPfLwBTL3pFQy1L9N1H4YVttdmYzD9TTdss15Jrt23CAo1fUHZAOLcCvxIHQ
         7ajDE1m4SdHG+eYSZ/5rz70lztrx81911XHbxwvunO7oVEs2ZXvsBwv8SFXdjXTMSsgx
         SOWQ==
X-Forwarded-Encrypted: i=1; AFNElJ+sp25w8Ex4LzEjcd7kKWcSTFuaUG2gqTjw+4MI+j9yLzsIBEjJ0bRB76YzWnIdxmgQoj2u9YaaBLXJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvadftv0VDSZYMTCmHbq2uNiixj21vrtKzWSJWSsRvJJckVvkC
	X/qLNyP/pIZdO+s1xFWN2O+U5/+3wTHoom9ft5cn3QvsxSaYqccCL8TS
X-Gm-Gg: AeBDietjvpOBjZt5aB/Wsy4Z0qGa+Et1/OfYSVTTK/DGR9YZYj0OC/6HXy6+2zKC0dr
	Es/G6v/d1ShJllIh69WY2PjjOUiSgdDLBiZC6/V+xOFWo0JwW6U7LL+NtREwicHbZDJGoqa245k
	D77XpuWnKXGm02dG0cryp1a3gYFRWXy2xZJf9RQPEBOwlf4AtofWQWJWwM/weZFls47q9Ux4BBe
	AkBnVc9bZkwm66Nj+0MGF00e0984p6mzNGpJZaeX7hR+NSUeYByftNAckayUZmFHP6/kIfBv7p1
	ayl3B1O4ppfPGXb3NyMffs3+V/Zbsn4OsEEUfeu3vn2Wg2Ws8525/N22oGCriXXFDbIvh+aG50x
	Wv18CJTOjHljpf8TTf0WqSLs5q8xiebHs4nCCHvjX0CAPQ1l+QSUsxfrzr1wVEG1U93QRQCvqyg
	hsR17SHz1/dfAHHf8=
X-Received: by 2002:a05:600c:4512:b0:488:ac01:72b6 with SMTP id 5b1f17b1804b1-48e51f3a538mr171437455e9.21.1778221072181;
        Thu, 07 May 2026 23:17:52 -0700 (PDT)
Received: from ROG ([2a01:e11:202b:40:68b1:8d59:e348:c16e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e68f5d48fsm11251175e9.14.2026.05.07.23.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 23:17:51 -0700 (PDT)
From: Marco Scardovi <mscardovi95@gmail.com>
To: andriy.shevchenko@intel.com
Cc: linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mathias.nyman@intel.com,
	mika.westerberg@intel.com,
	Marco Scardovi <mscardovi95@gmail.com>
Subject: [PATCH v4 2/6] gpiolib: Move DEFINE_FREE(free_gpio_desc) to driver header
Date: Fri,  8 May 2026 08:17:25 +0200
Message-ID: <20260508061729.9530-3-mscardovi95@gmail.com>
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
X-Rspamd-Queue-Id: 3FF184F2688
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,intel.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-36431-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Define the free_gpio_desc cleanup handler in include/linux/gpio/driver.h.
This allows drivers to use the __free(free_gpio_desc) attribute for
automated deallocation of GPIO descriptors obtained via
gpiochip_request_own_desc().

Signed-off-by: Marco Scardovi <mscardovi95@gmail.com>
---
 include/linux/gpio/driver.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 17511434ed07..7ee65b49056d 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -807,6 +807,8 @@ struct gpio_desc *gpiochip_request_own_desc(struct gpio_chip *gc,
 					    enum gpiod_flags dflags);
 void gpiochip_free_own_desc(struct gpio_desc *desc);
 
+DEFINE_FREE(free_gpio_desc, struct gpio_desc *, if (!IS_ERR_OR_NULL(_T)) gpiochip_free_own_desc(_T))
+
 struct gpio_desc *
 gpio_device_get_desc(struct gpio_device *gdev, unsigned int hwnum);
 
-- 
2.54.0


