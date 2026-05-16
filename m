Return-Path: <linux-gpio+bounces-36974-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mI1MM2X7CGpgDgQAu9opvQ
	(envelope-from <linux-gpio+bounces-36974-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 01:19:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB3C55E392
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 01:19:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E50AC3014117
	for <lists+linux-gpio@lfdr.de>; Sat, 16 May 2026 23:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A895739EB47;
	Sat, 16 May 2026 23:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="ec3/zuIy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABDD39A06B
	for <linux-gpio@vger.kernel.org>; Sat, 16 May 2026 23:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778973538; cv=none; b=hMK3is+bH8nKD1paaNEEHnM+ggtV4gYZWSgwsyoOdMZmPyxLxCUPw3sowaz0Kqqk3BNuT9i2i5HAv5yRpYtu+7NnjpQEuYVF7OdIM731fqQrZUpir7MhWOWcRolFE0W+xnFn+MOzJjSCPTjORwjP5lvke1nBudULVvD8YcsBWyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778973538; c=relaxed/simple;
	bh=thK+U+aplsDzvE5oAtB1E2JzEzfbWfLwgItKOTLlb8o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YhB1DGHGfiVz/VOmg1+GgbjKhl0wlTPZjkts2QKGh4jrdpBg/xQ8iH7I4LGKT7nchD1gmrop+SqnSup7gE1YJZZP8CuBk/dy0iPcfTLcFdlkqHTT+ffOyjvsrlBg63yrpvQrGqNd/KsClZyoDo+mHzM7RYkh6ZrFPWzPkgKauzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=ec3/zuIy; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1329fc4bf77so1695369c88.1
        for <linux-gpio@vger.kernel.org>; Sat, 16 May 2026 16:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778973536; x=1779578336; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lN2ucZVsVYmHc/fedXjm4iB8oy6SqWjHFEKRvCBYgl8=;
        b=ec3/zuIylWmNyF4ErEUEVXgMmIZWo+JOLC3mR3s4sYlWLNLP7EXm19bK9tzxHaCLs8
         MXZtVOdXix+6pFRluYMmDZ6HEz95E6qJScPMjIfazPsrfM6lNswYXwASLXdrS0pmeJhU
         olaseSqIkBibR37kkl1RJ8G9FipEtHaozvN6sZtf6Ht4mFNQLvRr7Z61tDdToHyEwaSd
         nnIqdJhZRT9BxWaW9e19gdjE0GuhyHqjm+wzjzfmqG3ZhGGhE5vs5hTcz7z8VKoa9iKO
         d+PbDOXiNfE4tqdwES1VX6ZnrmLrg94ZYNcOMLF5kHv1inog50bTgiZh1Z56xfzzZUIC
         zwJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778973536; x=1779578336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lN2ucZVsVYmHc/fedXjm4iB8oy6SqWjHFEKRvCBYgl8=;
        b=P3aBsVMuA3LCR3vrEj2o5CdgRGfXXoHhRLT5Kii7+BaMOLhnnSsCx2fY4WnCYoAXnL
         6nkFDd+2EjlU5NCD6TBVNagkNYVVkzliymrb1vxAuq/czAMjB9c+M0OtAZ5AEpaKghZK
         imQVVWOfHnnKuXyvz8RaGGspdWnEsfNXPFaEMpaIDitd3pNPka+1lqq/2Q6ASmM1lU29
         M5fUMZetJLsf/cNVf4Ie7Qba6QUZhs+yTCK/Gyg8CCgdkG5jpDvoIwHKcS6fJu4JyZbJ
         hpenjrocmZxq8f21Zo2aauBionm+cgvIzrC7+Sd/a1JMo6RgqIeKmNcR1AtlnjHl3oFu
         j/7w==
X-Forwarded-Encrypted: i=1; AFNElJ/VaTXg8yW9eyLXO249BUMMaMK7TeVii4WoUPXdwSZuox3R8AxdZnEPQe5/U7Eg9H3S3vJpBxIU+401@vger.kernel.org
X-Gm-Message-State: AOJu0YxvAuPrKdvVkGEBdn5QLKG+nLXv1qpDDTITq7Oy20slXxAZWbwM
	QUze940Lp8ifN9HCUVDAyv0BMnuuFi8apIDGri5ZhzUBYi6iAhFKPphgpizTzfEP7HZJRNplBg4
	2lWhdeOw=
X-Gm-Gg: Acq92OE/L3yZo7d4Pqh1+KqdD0E7mfSg8gtzrWceBM2cOSGZ1cH36UiVs/+VONCL6wL
	dk7QI9sn4ZiZq3B+QHiI4cQpWLhZmGrn/wsKi6gZWRJxqYTHrVTouTkwSWkq5qCYiCfRDR40vzs
	aBYhifJbzH142KwRTE+wnSKcZHGNZ19uZuVsog+EP420Ib5+9g2R3GlVbEQlbEZy4MXOVdsB+n0
	3QyijRcxzikdXPQRK49qgvCUIMJrMDE19lT6+x3Nm3ZAbzfOuOnEUvj9w7kyL5yHaWHa+i3Ltm2
	GsLSE40MYSGfnbgcRlGH2h+y+34AvjWvskyVPWSjmXYoz3D8ADSaVSW2n2Ix7RMwX/0oxKKCS7T
	f5etvezmPT787VhhYyt4iIEMXdF6ZXLmCOvBXQHC7THqjcSB5e8+wLMhL5H6p4DFyksvjos94nC
	5X52mHTSjxjMUesHxC70uz/mlKzQ==
X-Received: by 2002:a05:7022:1e11:b0:12b:fc21:874d with SMTP id a92af1059eb24-1350484e801mr4444938c88.19.1778973535989;
        Sat, 16 May 2026 16:18:55 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb9ef5sm14722254c88.2.2026.05.16.16.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 16:18:55 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Sat, 16 May 2026 16:18:47 -0700
Subject: [PATCH v2 1/5] hwmon: (pmbus/adm1266) cap PDIO scan in
 get_multiple at ADM1266_PDIO_NR
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-adm1266-gpio-fixes-v2-1-801f13debcb2@nexthop.ai>
References: <20260516-adm1266-gpio-fixes-v2-0-801f13debcb2@nexthop.ai>
In-Reply-To: <20260516-adm1266-gpio-fixes-v2-0-801f13debcb2@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778973534; l=1733;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=thK+U+aplsDzvE5oAtB1E2JzEzfbWfLwgItKOTLlb8o=;
 b=I6OAmp2RxAcmwLKzCCeOM0Ia4BG/LH1GF96pjVwPwoMjmJ4TSDJyB1AHR0JHVt+dP7eMIaj2K
 NhdRaP+yjdTD/X4ye+j9la+4q7uttfOlXCOP5UXtUkUe2KCqXBCVi0f
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-Rspamd-Queue-Id: 4DB3C55E392
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nexthop.ai,none];
	R_DKIM_ALLOW(-0.20)[nexthop.ai:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[nexthop.ai:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36974-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abdurrahman@nexthop.ai,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nexthop.ai:email,nexthop.ai:mid,nexthop.ai:dkim]
X-Rspamd-Action: no action

adm1266_gpio_get_multiple() iterates the PDIO portion of the
caller-supplied mask using

	for_each_set_bit_from(gpio_nr, mask,
			      ADM1266_GPIO_NR + ADM1266_PDIO_STATUS) {
		...
	}

where ADM1266_PDIO_STATUS is the PMBus command code (0xE9, i.e. 233),
not the number of PDIO pins.  The intended upper bound is
ADM1266_GPIO_NR + ADM1266_PDIO_NR = 25.

gpiolib hands in a mask sized for gc.ngpio (= 25 bits on this chip),
so the iteration walks find_next_bit() up to 242, reading up to 27
extra unsigned-long words of whatever lives past the end of the mask
in the caller's stack.  Any incidental set bit in that range then
drives a set_bit(gpio_nr, bits) call that writes past the end of the
caller-supplied bits array too -- both out-of-bounds.

Substitute ADM1266_PDIO_NR for the constant so the scan stops at the
last real PDIO bit.

Fixes: d98dfad35c38 ("hwmon: (pmbus/adm1266) Add support for GPIOs")
Cc: stable@vger.kernel.org
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/hwmon/pmbus/adm1266.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index d90f8f80be8e..11f9a44f4361 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -211,7 +211,7 @@ static int adm1266_gpio_get_multiple(struct gpio_chip *chip, unsigned long *mask
 	status = read_buf[0] + (read_buf[1] << 8);
 
 	*bits = 0;
-	for_each_set_bit_from(gpio_nr, mask, ADM1266_GPIO_NR + ADM1266_PDIO_STATUS) {
+	for_each_set_bit_from(gpio_nr, mask, ADM1266_GPIO_NR + ADM1266_PDIO_NR) {
 		if (test_bit(gpio_nr - ADM1266_GPIO_NR, &status))
 			set_bit(gpio_nr, bits);
 	}

-- 
2.53.0


