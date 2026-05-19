Return-Path: <linux-gpio+bounces-37097-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCtqE4m0C2q2LAUAu9opvQ
	(envelope-from <linux-gpio+bounces-37097-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 02:53:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1EF575CDA
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 02:53:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B0EA7302A4FB
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 00:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7240D2D5432;
	Tue, 19 May 2026 00:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="VWxg1iaI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B6226738B
	for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 00:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779151955; cv=none; b=pBDACgz6jRwCoX/+OiFT1jY+uyKMwrexcna8esk2aqkRMyKJgjPOr3Xw5uCLqLPf6apsdUf70HTn1T30c/4AS1s7/vfas6ogUdIrZbXtSSoDex/fjGueqfKeuNX8xri75c3NKbqJLt6tu0Fjt4ojGVTaSTiw2FHxOmJ3kgPsOUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779151955; c=relaxed/simple;
	bh=rSPUXzgLQKI1wwnUPptEwKPDreTpZONWfB9dTDbQyy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GkotMsfmd6s4I5wc1lhDJrQz5bImCjR9g25sGbYNwyOKkIqTQjtHqgHkLlg5XF3GaCyQfgmzPZHHULfsO+m1FmzSOQvB6h9yMHM/CNYKsXFWqce9wsUrb+RjrFZ0sYd/X+1JmIuZgrkI9XVYfQiKnSzriP0lOGhVzBK6eHbRrL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=VWxg1iaI; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12c88e5f4aeso1342178c88.0
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 17:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1779151952; x=1779756752; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xkSDV/hGDItXdWtxgXI29OZTMaQsdY9kIYFJD3n6x/c=;
        b=VWxg1iaIkmllm7/M3RQVrTAAgreJ7Od1e5XdYmpfcPojzc+9pf78AIX9wNB4viH3pB
         i7ntaBmNGjQq3nPBLvpIay2n6NbEwwEhp0SW2/DOxhPkQBN24ZfA9Uw/aQrrZzo3XDwt
         kBkcmEdy8U+Hat7WkZCZzAvDIkuFAWz9HKuq1zoX3T1yd0Ffz+s4iaaWKY0X2myde96m
         oNLnBhpCQkBWiB+MyFUP4Pcqaqits7QW3AH1G7ZowoBL09622c1aXMkgVggot7gZqN0O
         4u7LfLr2PZtwh6Y9JHaOoNHCiRs39/JlvJOTqNM78OAdgqOaR/zMPd/gEonJNEswD7TL
         iGkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779151952; x=1779756752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xkSDV/hGDItXdWtxgXI29OZTMaQsdY9kIYFJD3n6x/c=;
        b=D6RuNCb+dAbGFxW++RAwSJhoMsJ7KmIuMAraEN22RR0MHYcn6rWUXfapEbiFh8KBkd
         txM7YgGwrOlgyoSlVVp89pLWm+PK7S8VAg+A0wkzRPOH9s+7Pue7MU4Vpy3fzJl3h+0N
         gWOwBKgcTOf8PDIUf5XchL+4wKG17qy81KP6wVNZktUnq/fyOX9yoG1tni6Fh0hY0sim
         FSTksTjFqrdzfzFy9aFpqvE4RBFxVr4AYAYXynIeeodkQgo4Xa0hyv4961p9hp1yWfBV
         YlkutpgLgciad0UGK4aMRD4l+X047M3DSKjW66v/2RhqypEpzinIHagQeUin0OBm9Ua8
         C8fg==
X-Forwarded-Encrypted: i=1; AFNElJ8hQo18LV8VAo4L/oucnu3EHotCcYMKTBhs9N/G/w6pDKPVruwAv+twFEy4YZsepO8vEToRPW4hLNcA@vger.kernel.org
X-Gm-Message-State: AOJu0YzacEIylX2URHv5pUw+vHwtYsCh/+TK6+BITH3hAgcWj7y4S3hI
	6IbWdm867ndt8sr81rrhX/kh1r/jKubvJNH5P/yNIxBZcY+2KKVgQadCHOXBFz7HumpsrBJr6+D
	+MS25oaU=
X-Gm-Gg: Acq92OGVIObAyutHCga1RsLNaYanr/mK6NBke2M2a4Rv/is3vydo1ULZ1XOo6tSaSAq
	aRlVAmrswqGHNpTgTuExyo54gWXD6XZhBgv2uw664WihqGi3+wBw3YkLB1GOu3GewHtLHLbJBzb
	ROmBz1pRy30DNGK8cUoRSpRXCDnLFBdBpBxNl/lYleT2t1lNQ9RH+VjrTJ7Vj7+ApcC97W7PtVh
	sO18QL02IS+PoQt6oTKMdHolJZOB+5jhUVMwPmHt7YCNIlIlwx/nQ9643S8UQGP9aYmijo50N6Q
	i02WZpxGMu6fkSUa9H8d6OlM8F8VFPI8ivp2DDZs6meuFGx9Axvdz4LWIdsgeb5ZztAW7625K80
	LQEQe0df0Id8L/HekhVR215KeacnL5zhC+3MXHtvWEvHQ7tNMGkSeRzFpC3CfmeGh+sG/rTGdJP
	D4R3s+RF1IlGw78lrOwQveChv5Zg==
X-Received: by 2002:a05:7022:250b:b0:12c:6dd8:623b with SMTP id a92af1059eb24-134ff500f38mr6567069c88.0.1779151952355;
        Mon, 18 May 2026 17:52:32 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb93f3sm22546633c88.3.2026.05.18.17.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 17:52:31 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 18 May 2026 17:52:27 -0700
Subject: [PATCH v3 3/8] hwmon: (pmbus/adm1266) reject short block-read
 responses in the GPIO accessors
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-adm1266-gpio-fixes-v3-3-e425e4f88139@nexthop.ai>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779151949; l=2394;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=rSPUXzgLQKI1wwnUPptEwKPDreTpZONWfB9dTDbQyy8=;
 b=K+8bHGXkf6oBwMcxqjzXElyXNeXhFer71lr5CRjozh8Jex49aLDFwWIl2SefX8JKqfza6NZJ8
 n502WXx0f+KDep2/9UWQR4xrP0ALQwNNexLE2viY6t1it/tkxDIBXGA
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
	TAGGED_FROM(0.00)[bounces-37097-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nexthop.ai:email,nexthop.ai:mid,nexthop.ai:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: EC1EF575CDA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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


