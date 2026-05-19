Return-Path: <linux-gpio+bounces-37098-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOpDJbC0C2q2LAUAu9opvQ
	(envelope-from <linux-gpio+bounces-37098-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 02:54:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A03575CFE
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 02:54:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 523063021783
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 00:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3FE822B8AB;
	Tue, 19 May 2026 00:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="BHDlrNtW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A8F26982C
	for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 00:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779151956; cv=none; b=YdmwnhDTpPo8gwb9VMgE2pfXZZ+xFi43yZUvPjIgpVe5DUs7JYjtFcXULhFsfudvuKJ3L8cBmFkIo5ZxaiV2XIvh228RXsQw8nap1v6DsVe3cPv9WbKhk61yh6H+/w8h0+F184+g47Fv4SWCvDAFPtuxXGa5HdWCVyrUeKEdylM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779151956; c=relaxed/simple;
	bh=1JG+/zkIS+GEXFeDqZ4D4F9Ctl/p/94MPO/ij8zaqjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ByQhJb48p+17dEqHzc2soYWOegQqSZiG835T9bBSJYG1oBoA85d9TL8oA6V8ULM8tp5pQJCo6zZnrQlYdXESemIOrdLBzmrBiqEzmFwlOGz4eFtKs/byJUBMPNGLGnx5NJDfcY7OO0HdEMI6FuzjCz/ySY8qSIsUJNL/hHjv0J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=BHDlrNtW; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-135200bc7d2so8050426c88.0
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 17:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1779151953; x=1779756753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zlzk3IweM6/T1gjXkni5pH832MnF1gtDJTKqsEsOXm8=;
        b=BHDlrNtWFcjsv4sNRVfNpmf2mpHdjuAbMov+K+YfBX8DJx5FKlJ2vVGbawleEYJInO
         nawHYFADCL48EgoxKTIaHrx9wAgtvmv44RswJDZED7VbfshZmj3Yal2vxSSthkaOIj4l
         bOpMGZJgCTFvHx7HrOZm+5LrIhxsPkRhSevzIfoLzmb5g3JUBJ4Q+z5XQzf9CULKoQff
         4ZH0a63aVxaIwAUJOc/79XdjD/SzSAe2OIUMldil0Gx/iSKkqs+prrEnEFKpcrqRddMv
         +t+ceypaYPMDMqYJwb2pNLd+WQEMbArKxjGKQBzViBtkvQ640Rpe3hQixj+JZpCDR3U5
         tOsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779151953; x=1779756753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zlzk3IweM6/T1gjXkni5pH832MnF1gtDJTKqsEsOXm8=;
        b=Vcm79LCSgNIzB85lhUrp6FEsiqDQa/heylhCnVQe66mlszfkmhof9o+wzIp9IvjEw+
         S565cgCqcgaxm0w4lEyOdq5QRMc6o67+J6F9WG1sh8yDnFBIJ/ekDOXGhk1kgy3a8f4M
         6S64qCa36xoEgsOO9l0kMtpe2fRS7B77jOzi6bLI28ELTGHKAAl/LuFSNMVgkAO/0t1j
         XQO1R5gtCnWQ6nzljlTPr2NtTKlTkP27qBAu8VQm4glMzdgUjWEiaJ6lawpoca44uAXm
         c5wzPYbjvOdaOiuS8yP38lRIAKsWY4EYwxi52SUW0xwALDAhl9N6L13d9kY0Fu8S8/OM
         9Ycg==
X-Forwarded-Encrypted: i=1; AFNElJ8CTJsxqa/E7VooqCPTI93CdUVOKkmn4LE+9X5f7gUwBYyzm3eK+eVsfRy58gOiKiCUeobamBacd6DI@vger.kernel.org
X-Gm-Message-State: AOJu0YxVZ8WBmLLgc4hloElxE+ssne3841RUdsFV2SlzPNEwbSedFxoz
	2giuv0yvmyvII3ThLh3w6Sijc2FMRcP9QPeird4Ft3cqGTVKOxRMzJ9onhjSBUYNqQzDhOh9iuq
	3D908FT8=
X-Gm-Gg: Acq92OH6Yiq8/4Q7nYQGOqGAiCADEyCIAqX+iz0iyuV1TCqNtSl9lVdMSO7sx0GLbHb
	DoWK8CBDeDZYQl1Frkm1gPgvHZs1wT2WTYlPYV72qvfDdVqEVDnhXIxGLnvDkgAQdKqjKaZFwYD
	G9B1NbfM4rZj/uvQwpxDMl4lTyRaMRGVgu314BUYMdmZLGW9LTTNh5NML4WSWu+L92kSle4Hf17
	nUldIIXlpBuMPfs8bjYDsj8NyB5nTodROTrAeKr3ZnAIGIMRexmVgk2QEecCWabJR+NRntY5+x7
	4YUORu86ZDRxmi7dg8QH8cgdkuMVBWfzAiT2MJ8vC02QljD+Ymgq1eGOTNCVs50eIJ8N2V9CA/E
	6uX0Y91bJFG45p/4IeC/uXP5D2wgH5htgGinYp8qhTXljMIECtsXoNKTUJD/VQy7vaT++p/zQfo
	gDyd2LYUh5vzTetaPJzmmUVBxe/Q==
X-Received: by 2002:a05:7022:7a2:b0:12d:c9b6:bbdc with SMTP id a92af1059eb24-1350494e473mr8550867c88.30.1779151953289;
        Mon, 18 May 2026 17:52:33 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb93f3sm22546633c88.3.2026.05.18.17.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 17:52:32 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 18 May 2026 17:52:28 -0700
Subject: [PATCH v3 4/8] hwmon: (pmbus/adm1266) register the gpio_chip after
 pmbus_do_probe()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-adm1266-gpio-fixes-v3-4-e425e4f88139@nexthop.ai>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779151949; l=1812;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=1JG+/zkIS+GEXFeDqZ4D4F9Ctl/p/94MPO/ij8zaqjI=;
 b=eDz6CtV+xk55DonqDrs1pNdpplss0Fqb6RErODkJAylZJrzDENIty2KbtoJC91N9SDjbi5UCS
 sbEujihg8YUC0+CRw+cQAghEQIkGIUQUkYd3V4fLbB9hMDwRxFEPzB2
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nexthop.ai,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[nexthop.ai:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[nexthop.ai:+];
	TAGGED_FROM(0.00)[bounces-37098-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abdurrahman@nexthop.ai,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nexthop.ai:email,nexthop.ai:mid,nexthop.ai:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: C3A03575CFE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

adm1266_probe() calls adm1266_config_gpio() -- which goes on to
devm_gpiochip_add_data() and exposes the gpio_chip callbacks to
gpiolib -- before pmbus_do_probe() has initialised the per-client
PMBus state (notably the pmbus_lock mutex the core hands out via
pmbus_get_data()).

That ordering is already a latent hazard: any GPIO access that lands
between adm1266_config_gpio() and the end of pmbus_do_probe() (for
example a sysfs read from a user space agent that opens the gpiochip
the instant gpiolib advertises it) races pmbus_do_probe()'s own
device accesses with no serialisation.

Move adm1266_config_gpio() down past pmbus_do_probe() so the chip
isn't reachable from userspace until the PMBus state it depends on
is fully initialised.

Fixes: d98dfad35c38 ("hwmon: (pmbus/adm1266) Add support for GPIOs")
Cc: stable@vger.kernel.org
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/hwmon/pmbus/adm1266.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index 57cb7d302cdd..b91dcf067fa6 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -467,10 +467,6 @@ static int adm1266_probe(struct i2c_client *client)
 	crc8_populate_msb(pmbus_crc_table, 0x7);
 	mutex_init(&data->buf_mutex);
 
-	ret = adm1266_config_gpio(data);
-	if (ret < 0)
-		return ret;
-
 	ret = adm1266_set_rtc(data);
 	if (ret < 0)
 		return ret;
@@ -483,6 +479,10 @@ static int adm1266_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
+	ret = adm1266_config_gpio(data);
+	if (ret < 0)
+		return ret;
+
 	adm1266_init_debugfs(data);
 
 	return 0;

-- 
2.53.0


