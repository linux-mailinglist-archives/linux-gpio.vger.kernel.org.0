Return-Path: <linux-gpio+bounces-36387-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eG6tJcC2/Gn9SwAAu9opvQ
	(envelope-from <linux-gpio+bounces-36387-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 17:58:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCDC4EBB07
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 17:58:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9239C301E177
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 15:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6715644E05C;
	Thu,  7 May 2026 15:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YwDfacF7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D093FE661
	for <linux-gpio@vger.kernel.org>; Thu,  7 May 2026 15:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778169417; cv=none; b=DGTcSEXv98R/5ZFLh4LytXaxQPO6yFUN94vW8yGg+jBSkk+B4bQQq9umlD5y41nfiWpZvSGt2zkCWfP5vMVXnY7Qh/g1kurY59QEQPm/IfbgVDPqF5HrZswXa4zCAJ0fINgI28Uk7V4mOdwlxTBrvgaQLWXX2u2pbUYBagwmHcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778169417; c=relaxed/simple;
	bh=ntk97llymQTEU0KEjqE+MNyw0eKE+ZKGpkPvUCBIAgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SZ/DtvrDPAQkfdPykFgjgTuHcoglx0cKG5cAGrYNU7pVXq0jfSPhHvFZUhTY/1yI7udfHF7hxDqfQj7pFxiRDZGyb2UA0y4AAm7vemGuWjL9DGv2IhzVlk3c258RFDZkkawMU3Clpw81WeE5iDWWFW0xB4V4Noo64PdlPpJSNQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YwDfacF7; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-452169ae568so802555f8f.3
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2026 08:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778169414; x=1778774214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=brOzny4+yWN8uVPImP/PIJYxaoTG6+wey9i24jM96cM=;
        b=YwDfacF7vZtwz/oubB1Qsbu/GmqE8jumu7lmx1iPFt1ZhgXMpQqLsrmUcQnBbE8TKz
         n9RX1o2f4J3xH7eBMN21UUglIFBJxfswiHn/+K/Ys6OH0AttuoJsUlAxkUEgTZ4Ojhp9
         7t3BwHkSCMwpR6kEhfQQYc81M/njPX0CyUaOODV8IcK18Lbks43D4mhSVsZ15qsPBGCU
         T+VZOvzRwmB9lrR6gx6vPr+9h2HfhDN6nzqfpQViwUKHZh3ZsxNW1Bmaa+tHVSN1uPaD
         YVd1AgJPzvbxr5Jjiwue9cUIiUe7MQfGgQp9PB2gSwF+2GsvuttkXoyNTqEAP3IqkTmB
         DLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778169414; x=1778774214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=brOzny4+yWN8uVPImP/PIJYxaoTG6+wey9i24jM96cM=;
        b=V3UXT7YXWMZ6cLwtZAyySU7yDblI/VWceVffvmZH/9iw9Yj+xBUlJmwVpOqfdo6GEA
         QqR5WT/IWvj/5GD3aID92w+pV5bM6d8bBoB6cLa4RXGVNsnFfe+CoDaoyD9Hhtksek8R
         oTkbe9jd6jWKFnM+tJAi/g45bYyNquMMCrWXvaoSu9Nsf/KgBIXjs3NzKbctz6GwWCxU
         seuMQbHZic0JF7vpbUdolfnQi+fwciC3fXb71dyL0+3/g0ErzU7hz+dOrKvjfn4lN03f
         NijwpE5BBVD3CASYeyenIs3KI3OUnKqYxExBglgmBMZh/3+LEYexEevUZdGOXmpypSBo
         R2Lw==
X-Forwarded-Encrypted: i=1; AFNElJ+h9q91BbdHBSnXvqtYdAoZRExbAhXBVe126SYHh3zWhfUBekyKvuM5NPN7JzzS1ZRdgviGbLJP0WmP@vger.kernel.org
X-Gm-Message-State: AOJu0YwhzYqvqX0u3XriwcPHehwh0/c0/tNbPI4BE+Zpkg9y68k/GZHY
	0ZEnfAZaIOtZC9LnbVap08I9slOSjmhWuG3f7dj8k80FiQfQWVxxXfA8
X-Gm-Gg: AeBDietC5KBG79gGA3tf1PYxk9qiu6B8D8Nbh6vZGNoC7mWSC/AQ/yVc/RCWtaPtctP
	+LfJXasFdHjbZWrpwavDLeV1g4sljBg+EqlId+XLQsntvBXkgLkvZjrAf2kt5JL1FszrWnENZLT
	gBACbDi0axYD1KRtSFTDMPL8SJI5uKJ/zwktHdSJokXC/YlZQ4rZaNBAly1jxD3fLbHw5RlR3i0
	xWxJXWEa22jJjNQ3k4F5gCsv2EU1MlFm2OCb4e8fNvyMtxQE4yadi2UJQkIUm3I1h1+qGb33O7M
	HJzjNzQ6dfMKJBVAr+HBDP2QRdm+5yASb7qw4d3AFEdtJELfEgusKx9BWEM5jfsKX593+HL1qBd
	kocBUl2nQsJq8l9Qo0xWFgEZJM/XDNX4vB1NTY4lnVVwB3zx6dgn0/3URwdstmVZAzrAB8IKByj
	s91/Y08gMnzAjfSIg=
X-Received: by 2002:a05:6000:2386:b0:43f:e938:1e67 with SMTP id ffacd0b85a97d-4515d99fff7mr14008340f8f.38.1778169414094;
        Thu, 07 May 2026 08:56:54 -0700 (PDT)
Received: from ROG ([2a01:e11:202b:40:68b1:8d59:e348:c16e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45412820463sm44581f8f.3.2026.05.07.08.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 08:56:53 -0700 (PDT)
From: Marco Scardovi <mscardovi95@gmail.com>
To: mika.westerberg@intel.com
Cc: andriy.shevchenko@intel.com,
	mathias.nyman@intel.com,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <mscardovi95@gmail.com>
Subject: [PATCH v3 1/6] ACPI: Move DEFINE_FREE(acpi_free) to global header
Date: Thu,  7 May 2026 17:56:42 +0200
Message-ID: <20260507155647.403964-2-mscardovi95@gmail.com>
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
X-Rspamd-Queue-Id: 8DCDC4EBB07
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-36387-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

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


