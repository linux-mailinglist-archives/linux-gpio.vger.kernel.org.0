Return-Path: <linux-gpio+bounces-36430-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FvKJiaA/WnnegAAu9opvQ
	(envelope-from <linux-gpio+bounces-36430-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 08:18:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A874F25A2
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 08:18:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8A18330055C0
	for <lists+linux-gpio@lfdr.de>; Fri,  8 May 2026 06:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C83378D71;
	Fri,  8 May 2026 06:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ecBLSQ9c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44E536680C
	for <linux-gpio@vger.kernel.org>; Fri,  8 May 2026 06:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778221082; cv=none; b=ofZ4MQoTEJhwj3gmqW5No0cJjoG8EZES+LPULFgnI3a1X/ZfFD7d9iOEo2zvmre+lKYp5ZcP3hNsziG+AxUB84q/ngTRVUfSiskKySHso3ZqpecRtP2UGaUair3oEKtPss67XbpcHso8Gx4GyJDBBvvX3OCTGxdXGmUrShEbE8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778221082; c=relaxed/simple;
	bh=du9luptkF1RMPunIoS83NkddF0URQJLyQE4jUAhjG3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rleFj73h8aCJ/mIEqGZF4YGsUdHQYHzgieXb1zEyr6NR6NZkEzlPSAN80c4W0dllO+hJzURFmSqAMOCyVoNUQws00Z9mHQ4bImG7Q5KPpGrTxGEofKzAmetBhCaE41MLLRYAQqTNS3FEzu8JwH6tuLOmoicooQ/2ap03u0ZAxEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ecBLSQ9c; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so19149575e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2026 23:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778221071; x=1778825871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4uJNehFBwWP73FrSYeNJ0QcPue1v1GrVxPAkYJ7F8Go=;
        b=ecBLSQ9c9E9LN5q0HiJE5FftLfU/1lntaTDOdkzOiKTsuWPre3qo1BVdPbGq7RlGnB
         fC4FUUZTXVfN+hMfwKHA5DfOB+30tegtvSS3l9AtfBsnN/GPRw69t7adUNa+pwRmGvmJ
         QIZdN95WWH+NMa0JcYHmMWWSRY6O3vvgYIICWUEJYOhNmZxfy3mPdPSNyhzatDDPAuzC
         ljBpLXCS8YgmTM7wfj0LQbDU7YHftaQ8jUCfiO+IGGBGz7aPZsLuPYQXhNfrHjQvd5I0
         r67EZ3Mqk/UFhbPBzwTUB/sQvtOyZtITzXCBYE3dDe3+CUgBPa6GHzrkJ19x9xWOe45G
         jC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778221071; x=1778825871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4uJNehFBwWP73FrSYeNJ0QcPue1v1GrVxPAkYJ7F8Go=;
        b=k219vhc7ffy7wf2sFHH02YSyUdXrPCUYk8YtzshaHY1BKx45bt/jC1TWzH+Sm3GCiR
         /l7ktgb0eIfOHk0ZGrrT96SmgW6wTGTxDf1lbjZX8RqQLGUj+qM4R+THTh3f66SOCqEg
         AD3yl5eAdMLXZ5tp3jDakvsMbNEFLO4TgWuronT7CFzz1+PtKFLws8IGXQJSGrKCHZYZ
         hhn0tM32GTXAy/sAvdYCsB79EmZg1WbIq31i/UEwLrJ1qxqbFxLcqoTDi6YOq9XH6Ube
         R2GCVUkgv48EMU3hkB5oKI+gx9qFxsEG14p+Fpsv+NsACtxaBdxStxHRiC8wUmnYFDbo
         hl8A==
X-Forwarded-Encrypted: i=1; AFNElJ9BJYPUiy6NG0KiCsIYg6LYkyhR0DUM8dV2JuJSC/rSQwQ/4CudOvjEJf/Vj/a/yva3s/n8vTbsm7b0@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0XAXdAbQxAqhIBsTo3SpG/nixwoYkEc18CzYyui7t+iUPcfv4
	b0OdsCN3d2jF/2sarXQaHE7v0nJIGhUxQCWIwPRzPiV2jWknUzDgBor4
X-Gm-Gg: AeBDiesWc+BKVoY3pfn/tLXKcGM+wMaQqZD8mMsWcl62/5zKn38istjBsLcLN+dLfxa
	386iKwkOLOyz51l3O0zU0hY5Gxkygf2atmyXaXErhd1zHanhvulHRMr0JDwM4nHtdR7ZMZEJRTr
	TEZOFt2EbqtULLlYVR0Zi0za3uFeD6jE05vpUbItFtvxy5m9EhBKDLu1tZ3gaaZptMtytI6R0Xf
	70IUI5rJhdOVJkD6bwFcL46y+t/6HOcJJBwWz4QTrYnzj8BkOvGARNV/NTV3pjAGvJ3BL2y3Vgc
	WdXf6K9AY8wpPjsQa4wSa6gydEcdzb8HW041vWVoLXWJFQhzmRkUIXeOGoxlv0oJzDDTozs79dC
	c3+QJrSMitkbsiLUu/OpMhLblkbk+1+1+3kHCYXRI108qDciW6F3gRwDv8n515l5JnQUsiGt2c1
	QFCyMlrS/0mAvlu/8=
X-Received: by 2002:a05:600c:3ba8:b0:48a:7676:30bc with SMTP id 5b1f17b1804b1-48e52bd5035mr196450835e9.14.1778221071083;
        Thu, 07 May 2026 23:17:51 -0700 (PDT)
Received: from ROG ([2a01:e11:202b:40:68b1:8d59:e348:c16e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e68f5d48fsm11251175e9.14.2026.05.07.23.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 23:17:50 -0700 (PDT)
From: Marco Scardovi <mscardovi95@gmail.com>
To: andriy.shevchenko@intel.com
Cc: linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mathias.nyman@intel.com,
	mika.westerberg@intel.com,
	Marco Scardovi <mscardovi95@gmail.com>
Subject: [PATCH v4 1/6] ACPI: Move DEFINE_FREE(acpi_free) to global header
Date: Fri,  8 May 2026 08:17:24 +0200
Message-ID: <20260508061729.9530-2-mscardovi95@gmail.com>
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
X-Rspamd-Queue-Id: 89A874F25A2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,intel.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-36430-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Introduce DEFINE_FREE(acpi_free) in include/linux/acpi.h to provide
a standard way to perform automated memory deallocation for ACPI
objects. This enables the use of the __free(acpi_free) attribute
wherever ACPI_FREE() is required.

Signed-off-by: Marco Scardovi <mscardovi95@gmail.com>
---
 include/linux/acpi.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 67effb91fa98..f58e704ee850 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -234,6 +234,8 @@ static inline struct acpi_table_header *acpi_get_table_pointer(char *signature,
 }
 DEFINE_FREE(acpi_put_table, struct acpi_table_header *, if (!IS_ERR_OR_NULL(_T)) acpi_put_table(_T))
 
+DEFINE_FREE(acpi_free, void *, if (_T) ACPI_FREE(_T))
+
 int acpi_table_parse(char *id, acpi_tbl_table_handler handler);
 int __init_or_acpilib acpi_table_parse_entries(char *id,
 		unsigned long table_size, int entry_id,
-- 
2.54.0


