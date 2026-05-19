Return-Path: <linux-gpio+bounces-37096-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GPbDnO0C2q2LAUAu9opvQ
	(envelope-from <linux-gpio+bounces-37096-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 02:53:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F06575CA5
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 02:53:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 829FE303EBB9
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 00:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81789296BD3;
	Tue, 19 May 2026 00:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="FQgGJ4kO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2242749ED
	for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 00:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779151954; cv=none; b=bMf2txUJuzQ7ehj14Cirr4pv/gNzzdlZSwpcpLZtuTq0YA0UWAOeOutxYbHYgLbQTbdmKRo0BOQ8MHuWGseUnG3lM6eT9qsx5ugGlOIPPKZIclYywlrwPRUQoJJbKxmaLGRb4BfHRbwTFfvNFc7uXet2mjg7L5DoXw1C18xlTDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779151954; c=relaxed/simple;
	bh=7oeVwKpqCxGqOnMbjsP+k2FBysBipybyK2sSj3BSta0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TevTZDcnX/gfS2bB5hhzL0oASZ3KcoH6HWh7egnnHwylFKxjV6xnVlwOq8NcC6+1MqdxrUbCkC9LapdLFPmYpnNFFpusli4MFUFCCeQsX1MK3lF7zVC2d5VEfVC1Pu9S/FqTca+Rx4N4QOOXOAdKv4sRmrDwDLZu4nkP1IKMfjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=FQgGJ4kO; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2f00a567cfaso2059639eec.0
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 17:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1779151951; x=1779756751; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PonswPhkAzDBi/+Jp4z7N6H9Ghz98afuWr/1QrXWWfU=;
        b=FQgGJ4kO77jKY8q6xhwk6HsxZOwX3rJWBa3v+NJx4m0MrakbxCRAamMStUDjYYHjPe
         n7WXoMre5w7wxYSFx0pXDvph4r7/N62U7wgc7ydrtOwyj3dKHYtqaUa9mvq+KBJfv96L
         QLZg7Ny+gHyYI5qIghKkp6WuQMHYwbHwY5+a5Ry+nMte2caSB5834Rb8Y3czXspxEYJM
         KUxBW5RIqQsn/o3X49QfE0y6Ms+SV8hGSvkzu3Su8oVcp5PEzjpRsT1JfQf3npfXLxTF
         fSC6SBJB1JR+PeY8J6fjxB3CPMM9YFo+ilKuWlo3BXqpnhe/YXMobz3+3Bnv+95s4zkF
         Qp3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779151951; x=1779756751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PonswPhkAzDBi/+Jp4z7N6H9Ghz98afuWr/1QrXWWfU=;
        b=BKvjt6Pp0wAHFimmtUMZwe1sY1XCo+P76ZHywu7RIPBCDvU96adMcz7XkhRQR6zuo1
         5IyNovSEZw2BGxsYnn0jCCfSFpd855ALGOvLJKAJXTMr6GL+3Rdj8JMFYg/6/9Ay99t+
         cMT68ExZK+vMWhx7oJpKzswKYTSpOOw6hzTaEiT9yP67V1nrf1dKPh2ISdwi2FJDm089
         Zmbfxa5oizrfNk3puHpV06F3NXeQtO5LzSMRPEUyhpwCyJQjCdKhUUzcKNzTnWdzvtb2
         uHaim/lfHwGV2tZT+X3ZSGlB1Ulku5dfxWfk4xg7lHT+W7IZKe5MBq5k0RyoFIOPy3dj
         HMJg==
X-Forwarded-Encrypted: i=1; AFNElJ81EHVR2cNlA8JeSXRsi99MavWWyFfVCE/fvQyDck+PJKWkRbsjXDoQax1/iNyxUrdEbVj8tWsxkBgY@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxz61E/QKgL/gLKn4VRcyKKgjRFEIV2Zj0CzKxsJ85BusdSlVi
	RYnjBqsOOj8QaOLBQFUWpFx8lJDJFRSp3XpaXSQq9c5vQu9OIVkxnvfBq3ZWFGHSVY9bvnwxnkr
	0aInV5lo=
X-Gm-Gg: Acq92OFjyzkjtzQkoZXAljDOQG6lfxfV+7sm34zJohD/6DFlz2lK2jyhKZhCRX0HVVJ
	md0HtmqRpGjW98ydINmRiNv/EFVH+xhMi6GHIN/xTkdtzt8wMUgIg73hgfoitMSEqaI0kQJBcWc
	SRMSp21wfeDG19y6yPdcAtWZS9NIP0RM/DzDQUsdBBb2SggMH2F3F5l8SSexhLZrSLGSelaOTO+
	XZ3r1zLV23VBsrRUYLKPrEJeDll6o8XVSGRt3Nz0sxrV6DKP9J2adlBxb2NFXCunwOqGO77hIeY
	AoDssfACYYu4jCWx3vsM+MCvUqLdDblcnJqJqxPbhUQZG2DC2a1ZArD5lUKHarKjLLxWIEgAC6i
	2OBa6FI/+0xKOFhBXNFBVYsf9YOq5E6OLLl3ZYCxtL25Nmo3byQgLI4iRK5z+naxZp4619th/3E
	T0QK3Aov1VJP3xN4bY2V8tuqB0AQ==
X-Received: by 2002:a05:7022:238f:b0:135:60db:3412 with SMTP id a92af1059eb24-13560db354bmr3638913c88.10.1779151951380;
        Mon, 18 May 2026 17:52:31 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb93f3sm22546633c88.3.2026.05.18.17.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 17:52:31 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 18 May 2026 17:52:26 -0700
Subject: [PATCH v3 2/8] hwmon: (pmbus/adm1266) don't clobber GPIO bits
 before PDIO read in get_multiple
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-adm1266-gpio-fixes-v3-2-e425e4f88139@nexthop.ai>
References: <20260518-adm1266-gpio-fixes-v3-0-e425e4f88139@nexthop.ai>
In-Reply-To: <20260518-adm1266-gpio-fixes-v3-0-e425e4f88139@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779151949; l=1613;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=7oeVwKpqCxGqOnMbjsP+k2FBysBipybyK2sSj3BSta0=;
 b=xDW5l49mtttRT+LsIzPeEnV6ZnDcneJeKt08CuJu2RFwl+Iq9V4lOY6NCS2cJYZMS5TA1QJKL
 ALlOlTCDXjfAMwewAaxc+gY2de79j3fiY4570urPmwMWQqgOTr/ZOQs
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nexthop.ai,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[nexthop.ai:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[nexthop.ai:+];
	TAGGED_FROM(0.00)[bounces-37096-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abdurrahman@nexthop.ai,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D8F06575CA5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
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


