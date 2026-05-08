Return-Path: <linux-gpio+bounces-36429-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMRzIR2A/WnnegAAu9opvQ
	(envelope-from <linux-gpio+bounces-36429-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 08:18:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2919E4F257B
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 08:18:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7E207300899B
	for <lists+linux-gpio@lfdr.de>; Fri,  8 May 2026 06:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693843783CC;
	Fri,  8 May 2026 06:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dp71GeG7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCEA341660
	for <linux-gpio@vger.kernel.org>; Fri,  8 May 2026 06:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778221079; cv=none; b=uS1Nx1WlBbNzfa8cM/gNq6VQId1slsqvp0aE0UHPKNSo98NY/88VIjvKWEl1z9GI5oiak8PXDJsjLJJbzONESf2LRBymZGx3yhl62CnhDHXLy/YLz78dNwI6V1o3+gjLGuXYAOUKHPI/UDWe8ao55+9N9hu0fv0N/eJ3WBsjXkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778221079; c=relaxed/simple;
	bh=KmpGLWa/5yTTXSH2/642FLRpd+4X72Pd3hBXd7rY5oE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kv1bWLb/g1oyHxh37FbSCEsu5AXTAxWiJRqkjVOPZR2ENsXVnh3MhPv6jddCcOdOirdEYNi1nC0qkv6D0nLJFayQhfcLuSCsOBA+GSelxD1qicMl2klEPL6zV/naHaPJh4Uo9TRN4WkppwHVcnxHk3TzVeH2KwILJtC++uVlx4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dp71GeG7; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso15147545e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2026 23:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778221070; x=1778825870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E4ypZKRffXl+RmRBDB4bV1g+6g5ZEEix6t6a5NRuqZc=;
        b=Dp71GeG7sxWbHNels+cFtNiE4Ywh/3gD0Fm7JsgzuUz3Fh3blMy9pAkHHW/91QNasd
         BXsK/G9xVuRnd4NxIa8/d7NSWEwqQpUuU+0XsQPCGWgXT6KeUejiN3V6w2haRQ+BCPV+
         fYrm20/TSoqU7uoWtCSbCKLw0xEntsutBTHr1Wcp6M8w1uAAfxb89nvxrG5lM34cOrw4
         GYL2WmiyJnSV18JnblE1sxpGtppqZTlJg5eFlqwAkhpSEGgwA5Cch9qRfiW9u/ZjNhRf
         q6A//0j2+1liccU6OevWM5UaOcClRGQvt+zAW0qA7QvrfG+tRabzUP+Sf1aF1p4fK7Gb
         gVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778221070; x=1778825870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E4ypZKRffXl+RmRBDB4bV1g+6g5ZEEix6t6a5NRuqZc=;
        b=DnthJ7V7jFrfbv5j55xbAOpf0Cn6JvxI7Rw2KEKZxbU//2tUYY3B7VoXOaMPx7xhfr
         Nj6KHT+Bhr+aiWdmcXrTLum6bsXw5zOTOlUSg9+PcaaJagl6NvwlAnZvT3crui0AO4fs
         0Cc9aWd6miNQlOwC9zE3/5avZ4nZc09kcCuFQj5pNM5i688tAGAHUWay90VmqwYOJkaM
         1SJrg3OaFK/fZogUwbm24Zc18x01GHR8wslhMrzSnZ0ZW2SVObCW+pwCnB2ciwKRca2w
         1HAsF8D+1BWCChsdBkhgInal6rUaHNnH8s0CVmSy6ni8w60UojWJazxHYbsd7jzv0QSA
         Oi6A==
X-Forwarded-Encrypted: i=1; AFNElJ8oPIUJWIL+46v5COHa1AZgZEKV+4XbomESTUVse4RPYbn8BsbLjCGC8ATX+4nXgTl3ptFObTie3JjE@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9gbaWmySn1hSJEwx3zliJR7XfgNh/MDWyh7JzOkth3oiB50tB
	QpYGFA9qqqalQgohDAkL/fkbVxhaNbZppl+6HaAUPKRLeMxX28Khv1Xv
X-Gm-Gg: AeBDieulv0LckQYk3ilnIIyvJ2++mgYlVF8BE805lxnDcovrKeYzMCbL27kFcXJtIOC
	yHhm5+oDky3P4JKsOrAQ09MZVq04RTyLIPB7PhyTMv1HQnM6ajtnfxM2XmuOqlrMXNUGhLWq8YX
	afKQ8bQg/xr9D/eQY5p+DbhqeGj13/F7zmP2jPZ8BcvnVCScVs8O+OL1y083zPLBnnedP1q9lXe
	J52/t8M5fMfc4cKkOCFcOHYfgJsyLmV2ak/c6cGGTxWu91SApKcTZV6S8FKHzulneTwNGwenThH
	bZ5RcSc1+5xCAB6oqSGQiaYsizjy/rcn9dfQcOIRsQ8Kglnx4F4u8KQwWLUWCPJ97TGJx0Et5+H
	qk0j2RFb5tDsHvu25BCas0tVAy8PRC+4PT4dpPekNwWqpYm2KjUdGhpb2XZ+o77ZEQAlaVqhnry
	TLb9syLswv3Rkb3hcsGJlms4bRxg==
X-Received: by 2002:a05:600c:1c0f:b0:48a:5342:36b5 with SMTP id 5b1f17b1804b1-48e51f3deddmr195989235e9.21.1778221070029;
        Thu, 07 May 2026 23:17:50 -0700 (PDT)
Received: from ROG ([2a01:e11:202b:40:68b1:8d59:e348:c16e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e68f5d48fsm11251175e9.14.2026.05.07.23.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 23:17:49 -0700 (PDT)
From: Marco Scardovi <mscardovi95@gmail.com>
To: andriy.shevchenko@intel.com
Cc: linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mathias.nyman@intel.com,
	mika.westerberg@intel.com,
	Marco Scardovi <mscardovi95@gmail.com>
Subject: [PATCH v4 0/6] gpio: acpi: modernize resource management using cleanup.h
Date: Fri,  8 May 2026 08:17:23 +0200
Message-ID: <20260508061729.9530-1-mscardovi95@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <afzlsRkyKQzuUcgL@ashevche-desk.local>
References: <afzlsRkyKQzuUcgL@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2919E4F257B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,intel.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-36429-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Andy,
as requested I've added the missing Signed-off-by and related commits' messages.
Let me know if it's everything alright now.

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


