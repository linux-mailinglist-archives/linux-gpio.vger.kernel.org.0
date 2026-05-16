Return-Path: <linux-gpio+bounces-36979-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +E7CMuj7CGppDgQAu9opvQ
	(envelope-from <linux-gpio+bounces-36979-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 01:21:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 389BE55E43C
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 01:21:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17F42303939A
	for <lists+linux-gpio@lfdr.de>; Sat, 16 May 2026 23:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78EDD3A168E;
	Sat, 16 May 2026 23:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="gYWz9Lln"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6E93A450C
	for <linux-gpio@vger.kernel.org>; Sat, 16 May 2026 23:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778973542; cv=none; b=VtpBVjc3h0ZKsMVzDJo+WddGPLcRQj5Bys224JlASz0xyVdbfRYXfyBpB2/SAaqSkakt4HRh6QruOcnRGmUfKHrzCodPpj1MXzZ9PIpo02llfjTbVM5gvlJXQZfMsGfmJnKrEPwxzIrZv7/BmQGS/Wh4JnxyCB8Y31Wlr3TeVKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778973542; c=relaxed/simple;
	bh=YW/rtn93ECVx6D7M6zDzFzA7o/ZhLBNsrM1gBF6+BOQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QQRPOepkkRewWRa/2ONUskAueFoC6XO3V+Tx2HCebqHaAZgiUKXrnQaa6qz3e2bP4ZEgw+VVExOKWiclXhcR75bWQwLemgRapO5h6asb92Wh1sYiqzvoqlykG+PD2mkbGrx8YGawTf+cm97ZbWnAymkRfcBXOOodg62rNKMRkYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=gYWz9Lln; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1331e851faaso437601c88.1
        for <linux-gpio@vger.kernel.org>; Sat, 16 May 2026 16:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778973539; x=1779578339; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hOf0WuzHhr8GvHCx/Z0rI+KnB+Uz0CaABNA+3XjE3+k=;
        b=gYWz9LlnNCPPb9j3hzqdI0LtvJHgn4CtftQPz64NQVDC81+lu6FW/CMdKkgfKCN6lt
         Mwcs7mEqPlfkWooNM55QnYdgzhPeaPaup937Ap8nkisqgiI6X6/X30qUsLjKiTHAnuhC
         TXIn/krXg0vhf+wqtXewyiFc2AtHkhyIbU0NcwPULRe+wZ+jEAHeRxeywano7nQCwb6M
         qk1pI5eV1FJJXr8dDIKxh3sXKqqx4lDNMvSVWpmndSGUD/UuEvXG27kgrnLpy/n7otQA
         gzFhSQ2ttEPa3iEMutecomO7qroeKJ6VHoVX24Bwz4r7vSSkpkd9J1LV6q+C5ks1rVrU
         Pwxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778973539; x=1779578339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hOf0WuzHhr8GvHCx/Z0rI+KnB+Uz0CaABNA+3XjE3+k=;
        b=f3P7/1eP4AP5pzrNKaIpd3WxI3PN1UNIAs12+R8y+h70ZPWUbyGx/MrQwvLacPHMKh
         o2pLh+76aI5ZqNIEqfFZiLYNY7XLhF4+tAgYgHUt+Qi2h+rVEtKDfRaIUTSF2HObFOC7
         KfwlrDPEONMrI0bVurdnHtjRa1T90V+xgOgUjG0/JJNp24CXgLSSXD45UKck974clmLH
         R5v5GtGO2bbXQ4gPpr8IBpryLu+eqAE6Tm4tNpgUn5mHq8ObDVZPABoPi4LNMAgouAQW
         2CzZ6VclvAL1viTgyiIME2Y0gaJcjGdpQQaBCWyvZ/U+lysOcdE0+EFOzrvgRb/lvNDr
         TG/w==
X-Forwarded-Encrypted: i=1; AFNElJ8lLIMY37hm6vYGlBK1C3+UM+3Axns3fBn5Jq6HWuuTuCj/nd+EjhuiiVzw49USjPz3ZyW8Qab9vs6j@vger.kernel.org
X-Gm-Message-State: AOJu0YyWo5tnQQ+cTgTicd9lAWV8hJFZKslfSd+N3zQ3rmxd5+gMf0tM
	zfWs42XC2IpeG014Ri4ye3R7NEqmq+Psz4l6+d7CQErqppJtFVrAFNT3zxH4N4ZG+z4sx4M1JgW
	CK1ixTtA=
X-Gm-Gg: Acq92OEkCUVeJRynXM8sfA8N+Lcl7ZruK8vH8NJPm5pyYELXemQfczBv/VuTGbCk8MY
	uYIyDWxewCNJWzqdbeZIOEozcSbneEn/kggdVGrjxltDdt2n6Jm/hUksoTsp9gRsQv4drUY8Xmn
	LYhuNwHH0cYDnxq/+wHE/rt9/wFAuJy4RBphCQdpTCZG6iT11KFEthpU3MpEWfTdWY5lJs3Cq98
	sDRN7YHHPhrAsLG3q3ERPKZsNIo6DHulgrGgP4rYSZEfhsnl0oxMpf8fXrWlc7m5Mxt9c89PJA/
	nll1SP6FyrFGNvD2bo9il8cz8c9HpS04r1r+xvHE6PHb5gAr2+8zXsUmpjZo0j2anL9V8Nb8CMv
	eS1lZxayvSy27C0r2xzhsynEbPE1ZbVxowCWqh4k4rYrmNUQn5C7fQi5y9jI343Q2ByJVyqlRff
	04nqs8aCxanGc6xgCr5uUYD1IMSBl9sRNloimC
X-Received: by 2002:a05:7022:301:b0:12a:6d05:3938 with SMTP id a92af1059eb24-134ffc6a83fmr4319683c88.7.1778973539141;
        Sat, 16 May 2026 16:18:59 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb9ef5sm14722254c88.2.2026.05.16.16.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 16:18:58 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Sat, 16 May 2026 16:18:51 -0700
Subject: [PATCH v2 5/5] hwmon: (pmbus/adm1266) serialize GPIO PMBus
 accesses with pmbus_lock
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-adm1266-gpio-fixes-v2-5-801f13debcb2@nexthop.ai>
References: <20260516-adm1266-gpio-fixes-v2-0-801f13debcb2@nexthop.ai>
In-Reply-To: <20260516-adm1266-gpio-fixes-v2-0-801f13debcb2@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778973534; l=2051;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=YW/rtn93ECVx6D7M6zDzFzA7o/ZhLBNsrM1gBF6+BOQ=;
 b=rLK3xSF67bYw9vOeeVD20baFsgJe0KchisiXDbpwdnxaQaYe62yO+8pWC8Y9C0GL1xbsofPfP
 QokCUjbGOa1ANdxf9Jmh9I0Uw2CSuGE2CeVjGT1O0Tx0ojG+lQxhi2p
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-Rspamd-Queue-Id: 389BE55E43C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nexthop.ai,none];
	R_DKIM_ALLOW(-0.20)[nexthop.ai:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[nexthop.ai:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36979-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abdurrahman@nexthop.ai,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nexthop.ai:email,nexthop.ai:mid,nexthop.ai:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

adm1266_gpio_get(), adm1266_gpio_get_multiple(), and
adm1266_gpio_dbg_show() all issue PMBus reads against the device but
none of them take pmbus_lock.  The pmbus_core framework holds
pmbus_lock around its own multi-transaction sequences (notably the
"set PAGE, then read paged register" pattern used by hwmon
attributes), so an unlocked GPIO accessor can land between a PAGE
write and the subsequent paged read in another thread and corrupt
either side's view of the device state machine.

Take pmbus_lock at the top of each of the three accessors via the
scope-based guard().  The lock is uncontended in the common case and
adds only a single mutex round-trip per call.

Fixes: d98dfad35c38 ("hwmon: (pmbus/adm1266) Add support for GPIOs")
Cc: stable@vger.kernel.org
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/hwmon/pmbus/adm1266.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index b91dcf067fa6..2e9ae03ab64b 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -172,6 +172,8 @@ static int adm1266_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	else
 		pmbus_cmd = ADM1266_PDIO_STATUS;
 
+	guard(pmbus_lock)(data->client);
+
 	ret = i2c_smbus_read_block_data(data->client, pmbus_cmd, read_buf);
 	if (ret < 0)
 		return ret;
@@ -194,6 +196,8 @@ static int adm1266_gpio_get_multiple(struct gpio_chip *chip, unsigned long *mask
 	unsigned int gpio_nr;
 	int ret;
 
+	guard(pmbus_lock)(data->client);
+
 	ret = i2c_smbus_read_block_data(data->client, ADM1266_GPIO_STATUS, read_buf);
 	if (ret < 0)
 		return ret;
@@ -235,6 +239,8 @@ static void adm1266_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 	int ret;
 	int i;
 
+	guard(pmbus_lock)(data->client);
+
 	for (i = 0; i < ADM1266_GPIO_NR; i++) {
 		write_cmd = adm1266_gpio_mapping[i][1];
 		ret = adm1266_pmbus_block_xfer(data, ADM1266_GPIO_CONFIG, 1, &write_cmd, read_buf);

-- 
2.53.0


