Return-Path: <linux-gpio+bounces-36972-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKiXM27XCGqZ7gMAu9opvQ
	(envelope-from <linux-gpio+bounces-36972-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 16 May 2026 22:45:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7F455DB9D
	for <lists+linux-gpio@lfdr.de>; Sat, 16 May 2026 22:45:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0782E3014BCE
	for <lists+linux-gpio@lfdr.de>; Sat, 16 May 2026 20:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51B2737B03F;
	Sat, 16 May 2026 20:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="ZcgUXt5p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78AE37A4AB
	for <linux-gpio@vger.kernel.org>; Sat, 16 May 2026 20:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778964321; cv=none; b=iRa72NHaxejGcEyV0b7JCZ6Eq+/XxCHN9N98OXHcZl7Ow/S6WbWr2mN5UeuMHZa+tdxua4DsvpJAbl0EEOshZWe849+ogH2JyLmS9h6okt8V94zYmWrVY0Uz0nJaDkUL+xm4FwCEpePXAbghosi7Uu43mwhT/u8/+51A7Er5qMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778964321; c=relaxed/simple;
	bh=RfhWyhkILQ9JdmZHbT+RrfNjTCyKMG4R356hSwJe3G8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CaCkEU4E/I+nIq709H8fpdB0lXFV6cXppVLGGRyV1HTfZlboLs2w/Bccg0eUq2BvcfkmOdbExupk/Ikc0V6qhGyUV+ha1Of/onKhd4F0IfAZ+8ZZj4T57zbiVzr1x/W3m7fiMxtVdZNWeHhkpwDdi35hLDGcyNao5oH2wA2Bpww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=ZcgUXt5p; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso600672eec.0
        for <linux-gpio@vger.kernel.org>; Sat, 16 May 2026 13:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778964317; x=1779569117; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oAd95b7/1qRCPRUMfS/TXEKMP5bhCN7d3v6gwbzEek0=;
        b=ZcgUXt5pkLED9dRjEbySF2v7MT+6DaSl7KSguC6Rq8CKXdld+Hk9wtpT5Xs9sCajnU
         TBZP29I0Jmii0ka7JaM4NrRjS2ToJM533aGIR/lp+6KomRGR/AxwN5Tek16pesydCkTM
         jnSTaKuEC3siK2oBXZjVMqEJ3PFO3W2IlAW+Xk5Oqbzl+SKaIlzsDwNgHhNL0BqMHHym
         LcV5lYR3oXKY5UkBNqpe62U9RZCZ3u1qQOYTcFPhfOrDTuwPXKNBX3WGzWz1EWeH3lBH
         ee5Ugz8iaiWC/wC39QDzxIOy7so6xm/sAC2irVGuTDCrqKk+4CSrtCd7PMNH+rnVM+wy
         h6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778964317; x=1779569117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oAd95b7/1qRCPRUMfS/TXEKMP5bhCN7d3v6gwbzEek0=;
        b=RrQs8MxeLYy22VmaEhRNLlFjGUw2TuOw7uMRoa2LKbkOhC3jkXkACIPUuPr03eROHM
         NPtelnV9CerNJrMk+btzVSqi/+JxGkuSyKPfIoS5Uhm3qNuMjHqmamaim2IQZ5P2Wc9D
         jzzMp6V0PB0eFcdBeaVRfZJgs9p/2AqdaW6w50L43D4PjBQnoP7wzEG9m4tE0D3dqZqg
         SDA8RnnjSlWIoi+ze9oRj60Xxbl1mDJl8UU3PwYkhc2gko0Uian7za8yZ7diLpUNNfmp
         lycRQF0K9GGNLeguO5ZnJUfzXAewG5u0/cFCIXbb6cePQ/k/LA9MS+AiOUuU+LMcPqBD
         TrBw==
X-Forwarded-Encrypted: i=1; AFNElJ+SjrCPSrTGHcU/ET+Fsyp6jn+GOnXPnCci1JfPHsEqgoAnFt0zgDFpRZqi8pSnqPF1sJHhXPa/GBUR@vger.kernel.org
X-Gm-Message-State: AOJu0YwBL1eZzSAhQ/+2U3cRCPzBYWHjMoQAb3NW+aBy3YKWnaBCpQVR
	yxLxGzGhH9eLcYh8G/BzbwyZTl9mF5nQl/zSF/PG7vufF4rlrnebSGiPatIHCY5bR4TLbyW6mQx
	z+zsGpwE=
X-Gm-Gg: Acq92OHUn1DRKSztHZy5qW1hYERoUSUOiXkGdfvGbBPfTEc3DKjXQVVYDBdyj9XR0Tj
	unliFUEJ8ZAJ+XZz/NYhl3dSJsp6GOr5on1kZDPBhDuhBXYlvQS5t40akXNAS2VDn0uCDsuQjL2
	917dzjUP1xDdI3jtQYmoQkvOR8cZwvsIbSxNBHffW7RNpgjDmtCH8ZUHn70jXyBdhCNWcKSf8Rr
	eddB5UoH45xYCNJmqzbcEPmbi3TPiRkid/e5iaSruPIetc7G93D69xFMXcwuL4o3kl+tagLTbgu
	Np3LKM7qutDhrs5RduFD037ZGTIXTfuso5PyrQiZx4MNRO7sGVdcAberuAUT3hdQ3SvSu21FB3C
	JkNt5DN3tPEW0tdQaTUAK0M95+IlZT+m7qVGSWH7RlERvVb8yIdqaa4DW8blRcE9rmsh52JTF2L
	p6IbQYYZ6IFSI4ZD4xPqNrxb+KuXyjVtMDZyxnunX7R8MQxHE=
X-Received: by 2002:a05:7300:5786:b0:2f4:d190:37bf with SMTP id 5a478bee46e88-30261e7524emr5925773eec.16.1778964316535;
        Sat, 16 May 2026 13:45:16 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302947e917dsm10181189eec.12.2026.05.16.13.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 13:45:16 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Sat, 16 May 2026 13:45:07 -0700
Subject: [PATCH 2/2] hwmon: (pmbus/adm1266) don't clobber GPIO bits before
 PDIO read in get_multiple
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-adm1266-gpio-fixes-v1-2-38d9dd39b905@nexthop.ai>
References: <20260516-adm1266-gpio-fixes-v1-0-38d9dd39b905@nexthop.ai>
In-Reply-To: <20260516-adm1266-gpio-fixes-v1-0-38d9dd39b905@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778964314; l=1492;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=RfhWyhkILQ9JdmZHbT+RrfNjTCyKMG4R356hSwJe3G8=;
 b=w7SBG8WKVytyc0UPa0IqJNBMBW0tyJp01IO5+hbO9NQmQBlE6iXe90w1vbz3ZaaylqfT9gY4u
 YEdqDozT+oCAAJQBxYRgvdBEZB0qsql1Lf0Al0oe+SSsx08B+L0eayD
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-Rspamd-Queue-Id: 7E7F455DB9D
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
	TAGGED_FROM(0.00)[bounces-36972-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

adm1266_gpio_get_multiple() zeroes *bits before the GPIO_STATUS loop
and then a second time before the PDIO_STATUS loop:

	*bits = 0;
	for_each_set_bit(gpio_nr, mask, ADM1266_GPIO_NR) {
		...
		set_bit(gpio_nr, bits);
	}

	ret = i2c_smbus_read_block_data(data->client, ADM1266_PDIO_STATUS, ...);
	...
	*bits = 0;
	for_each_set_bit_from(gpio_nr, mask, ADM1266_GPIO_NR + ADM1266_PDIO_NR) {
		...
		set_bit(gpio_nr, bits);
	}

The second *bits = 0 throws away every GPIO bit the first loop just
populated, so callers asking for any combination of GPIO and PDIO
pins always see the GPIO portion of the returned bits as zero.

Drop the redundant second assignment so both halves of the result
survive.

Fixes: d98dfad35c38 ("hwmon: (pmbus/adm1266) Add support for GPIOs")
Cc: stable@vger.kernel.org
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/hwmon/pmbus/adm1266.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index 11f9a44f4361..4dd67c02b412 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -210,7 +210,6 @@ static int adm1266_gpio_get_multiple(struct gpio_chip *chip, unsigned long *mask
 
 	status = read_buf[0] + (read_buf[1] << 8);
 
-	*bits = 0;
 	for_each_set_bit_from(gpio_nr, mask, ADM1266_GPIO_NR + ADM1266_PDIO_NR) {
 		if (test_bit(gpio_nr - ADM1266_GPIO_NR, &status))
 			set_bit(gpio_nr, bits);

-- 
2.53.0


