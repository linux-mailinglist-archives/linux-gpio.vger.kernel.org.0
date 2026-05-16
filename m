Return-Path: <linux-gpio+bounces-36977-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHIgGqb7CGpgDgQAu9opvQ
	(envelope-from <linux-gpio+bounces-36977-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 01:20:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BD33B55E403
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 01:20:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F7A8302BE81
	for <lists+linux-gpio@lfdr.de>; Sat, 16 May 2026 23:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE20C3A5E70;
	Sat, 16 May 2026 23:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="TKiimgkS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA40397E66
	for <linux-gpio@vger.kernel.org>; Sat, 16 May 2026 23:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778973540; cv=none; b=E62NwmkAB5XC6RFQPiq3bWxHvZpTciBIFAdxrrdcq7su8aHraYLifu539tdKyjjOA0LFsiOYvmxj0Khkzdva9hDGJvscLymM+0G1noq64ugx8UF5XB8r0wYMvXHLVbepplAvEcgFXBhloXsPKqj0TFEyclaJUm+gPRFEoAiq+fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778973540; c=relaxed/simple;
	bh=N23J27IfJVGe7SPQQt1S3jRHCJD8YogYhTzhMnkG0uE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aYFharCr8rpUU8zuFnnUEzYQatmCuiXnQ41+NJWBhzW3/K8XNQJdmw6QAswkPkpUSuvYdIl6WXU/TNT4csXjojf+sPC5fqw9xMGgT0aly3+PQ4Qi9sEIRr8fM8bFW+mtS6OF25WXvkewTErABvqYFRfcZBtGF/zjm83ro1yFakA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=TKiimgkS; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1331e851faaso437595c88.1
        for <linux-gpio@vger.kernel.org>; Sat, 16 May 2026 16:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778973538; x=1779578338; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dA2Xn0JnUjF9oxy4I1Ocf3rxy01MmF3T7GcfHEypX4c=;
        b=TKiimgkSAL9g5bijz9kfouf72dVsWGjjga+8jKXZTK7hJuSTq7h8j7fLR65+G3qvhv
         QVwCvVMVE4RYBXDYnaNOGiLOCwU/orzmrnwXgcZqpYBjMF6V95ESjEZJKsufgFv5IHTH
         bWfEjMU/nYdwDcju3NYgugt6yRkjdum6KVnBhlFGygXxtHPa8x6eQBvmchL1Dn5g/xE2
         b5L677/E9r3MAc6IGCnsAFhf7s+iMft/MTxr57/BRQ2XirBJj5kQjQ0DQ52COHRvB6Zc
         f1kRTNOseNX5G9jLXsaqQultJqYh8o1Jjz1aXqRpgSvbtp/yrtki8Db6JsRAs2deqBvi
         UZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778973538; x=1779578338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dA2Xn0JnUjF9oxy4I1Ocf3rxy01MmF3T7GcfHEypX4c=;
        b=s1D+x5okq5ENQZtEZMeCQZhLIBXzhZUq79cg5bWTaKX6Bn58VQ4cdiGsj7cwClKUyP
         eBea/cPjnQ5h8kaSduOeibUv1tCHVmmLSO1Jp4qCTK3b0PHxKNyAzTunZ2d9X3r2dI6E
         +paOrjEq9ItbU7pjcgL+d8wjlq4KBOBcM+coqgefIrD9uxBKamfSP5an7UoCyfLEThKw
         EOqTPINBU38Lefoh/+mj4tabKYBOpsyjOKE1dWxesOHvhMSEvuuFmX/MZ1rSXZWrQaeU
         mvwUSu8g5gjZJT24maHVudbFmAQoM/4jfWDmk3joPVMJJ1NVuSIs32WrsfO+cQytMBUh
         JEOg==
X-Forwarded-Encrypted: i=1; AFNElJ/QdWUg9MtLFQKHzowuTJVIqPIq+qQoUaRoUOJRBSCU8V2dRDPTYZmLRlFz4yRaYAoaaddK2g++2C0A@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ6G2F7A5DpFJAWtLX0zTLN2WeEvb9rOlF3hD3VVgamjatvWs6
	q88LCcaXeZXR6hvZCJbzO1YenvtvI/7COgbsWulybereijN4D+u34VK5kuvPmN82CCciLZ1YTZE
	+tRGxxcE=
X-Gm-Gg: Acq92OHD/3AP/e8iQFT/7zL1EBQoKVIaIJvSU6gXM4jystTi4z7GbdAECbguKOyM3qt
	KbsSgtuI7MfH4K2Jbu5nPr71ngcQApFdZbi90rErUAe4AE/TdsS83H5Gwr6WhIcJVuUDa/dzSUu
	oeLEvRuwxtXAojFuS5gltIYbJRaIgnRFSlv5ekSY0HiDg2aEfttoE+notzQJcvhwNcpuMqjHIuu
	3OFLRMv6HA4XSOdykTO/hRvyEPsEQpUxvYu+gBdDnBwFL6EdvDIZv0kmIMBikRPGkBnDoyGTVQK
	HFe1O5LQ3nBVWy5dNRstL9QhREhcR13fqBMwxXnulD1TiuJarzNQkrQQxRQ8F47GVEEXx6u3ZKQ
	Gy/vqYv14/4JIV73uKJ1hGea/vSOnbpNgxF/0hGLa2S5wbPOa4DIMSFhDw5LAswQcT19SYS9r5g
	Ling8YKkwTI8Um+qrazWCxlEn3TUt3NanI0hxD
X-Received: by 2002:a05:7022:f96:b0:12c:9037:5115 with SMTP id a92af1059eb24-134ffe9529bmr3676098c88.13.1778973537611;
        Sat, 16 May 2026 16:18:57 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb9ef5sm14722254c88.2.2026.05.16.16.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 16:18:57 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Sat, 16 May 2026 16:18:49 -0700
Subject: [PATCH v2 3/5] hwmon: (pmbus/adm1266) reject short block-read
 responses in the GPIO accessors
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-adm1266-gpio-fixes-v2-3-801f13debcb2@nexthop.ai>
References: <20260516-adm1266-gpio-fixes-v2-0-801f13debcb2@nexthop.ai>
In-Reply-To: <20260516-adm1266-gpio-fixes-v2-0-801f13debcb2@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778973534; l=2321;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=N23J27IfJVGe7SPQQt1S3jRHCJD8YogYhTzhMnkG0uE=;
 b=XrOwSRfWwG+q0SuALxjvhTMWsm+OP1kNQlIn0Z46oqN7219YpmYw7z+gUT4oTOENMEBlSyuQv
 Syirv9rW4wWBz9/Z9npoptY/vyCDDNp1+tsx75VEVuEyHPX4hV0gOhx
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-Rspamd-Queue-Id: BD33B55E403
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nexthop.ai,none];
	R_DKIM_ALLOW(-0.20)[nexthop.ai:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[nexthop.ai:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36977-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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

adm1266_gpio_get() and adm1266_gpio_get_multiple() both compose the
pin-status word as

	pins_status = read_buf[0] + (read_buf[1] << 8);

right after i2c_smbus_read_block_data(), guarding only against an
error return.  A well-behaved device returns 2 bytes for
GPIO_STATUS/PDIO_STATUS, but the helper happily reports a 0- or
1-byte response too.  If the device returns 0 bytes, both read_buf
slots are uninitialized stack memory; if it returns 1 byte, read_buf[1]
is.

The composed value then flows through set_bit() into the caller's
*bits in adm1266_gpio_get_multiple(), or into the return value of
adm1266_gpio_get(), and ends up in userspace via gpiolib (sysfs and
the char-dev ioctls).  That leaks a few bits of kernel stack per
request on any device whose firmware glitch, bus error, or hostile
slave produces a short block-read response.

Add the missing length check to both call sites and surface a short
response as -EIO.

Fixes: d98dfad35c38 ("hwmon: (pmbus/adm1266) Add support for GPIOs")
Cc: stable@vger.kernel.org
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/hwmon/pmbus/adm1266.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index 4dd67c02b412..57cb7d302cdd 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -175,6 +175,8 @@ static int adm1266_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	ret = i2c_smbus_read_block_data(data->client, pmbus_cmd, read_buf);
 	if (ret < 0)
 		return ret;
+	if (ret < 2)
+		return -EIO;
 
 	pins_status = read_buf[0] + (read_buf[1] << 8);
 	if (offset < ADM1266_GPIO_NR)
@@ -195,6 +197,8 @@ static int adm1266_gpio_get_multiple(struct gpio_chip *chip, unsigned long *mask
 	ret = i2c_smbus_read_block_data(data->client, ADM1266_GPIO_STATUS, read_buf);
 	if (ret < 0)
 		return ret;
+	if (ret < 2)
+		return -EIO;
 
 	status = read_buf[0] + (read_buf[1] << 8);
 
@@ -207,6 +211,8 @@ static int adm1266_gpio_get_multiple(struct gpio_chip *chip, unsigned long *mask
 	ret = i2c_smbus_read_block_data(data->client, ADM1266_PDIO_STATUS, read_buf);
 	if (ret < 0)
 		return ret;
+	if (ret < 2)
+		return -EIO;
 
 	status = read_buf[0] + (read_buf[1] << 8);
 

-- 
2.53.0


