Return-Path: <linux-gpio+bounces-37102-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Id2CQK1C2q2LAUAu9opvQ
	(envelope-from <linux-gpio+bounces-37102-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 02:55:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F3A575D6A
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 02:55:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D998F3019A03
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 00:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8DA73090E8;
	Tue, 19 May 2026 00:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="HLBhpNFK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F052D7D3A
	for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 00:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779151960; cv=none; b=tNXNUNV5fDQMr6ypfjj/iex80WMkuqu4noyTdToMKLJioPiXjYSn9NG6OLThb6D2z2QDvf6FgqNcveiaplpbNCzzRwbrXrwxMQKtQBt9l/orn2WWMM5QLbqSIp1vLyqz01mZsC+ZZeEAMdn2NfYR9d72yRCKWGARS7sBEygiALE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779151960; c=relaxed/simple;
	bh=MbcEhPfilDl5djs8OwiISgXUAGJH031p6hDtDP0Q1lw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LtT7RGUcrsb1yisU0erxBc9B7WHniz8AeUaEhEOEabSWsctbS+TAXZfwGN7vAd0UoRKg0vufEa4lvVQi8RHVPuds9YlL5d9EASNy4AqlAZCVQNuU2H9wE/SPHKvsc8M30bv///6Bx1e3ZswTXoM/KUjnXf0CjDNKBaZktxEqniQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=HLBhpNFK; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2ef2a1cc06dso1997125eec.0
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 17:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1779151957; x=1779756757; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jWewpsuFbzTqoRaVPbiB62v6E+GOY+1kwxAn2d+qoXs=;
        b=HLBhpNFKhHmcW89rtStr/gT2BTY9pEKaCzvShRGGfeaTMbrtbKv83n4BKV+OIJcfV+
         nDheqI9UjvqzcntyDsPWPkMNj2k8BEVVV9MPP1+cXrXUfjnmJPTjsL08fH/uzmLu5fxJ
         mAJxqRHqbABchNgCc32T/1/v8XgNzpL8U9fVVWwJWl7wye6fVgVdvCJBuGvPR/2Wu7/V
         GhHSr1SRrn4geRzsniihVyEOItBFmMG/V7ZgX3vDbgrlocMvnpSnt6v/hKhU6idYDfCI
         Qxb+NpSGkKhZnkmfRrlnQ/8OoFlI2jpCe3z7VuGLV2PKqWWmHfdOPWmQrfr27SmJK9PD
         2KTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779151957; x=1779756757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jWewpsuFbzTqoRaVPbiB62v6E+GOY+1kwxAn2d+qoXs=;
        b=WgwXIP8gbb5ef67SPO3GgDerkUCwjOU6BqDrOtRHQkr8nNw8CmxN4tHdg9IDgY8cBK
         /P52FTePbA5LV4CH34yLuCepH6ZT0KvAXktNzzLUmqsQEc3R3XCJxKnJ6mrXjsC3g0Rw
         YEmRvsaCsbIteIx2vntpfHlh+vhmL+KK+B//SUh8OWq/UaNatTYb2Rd9HkuxgGOEFSm4
         /QJOBZp8vxA5LAm8BKdwoNODCpYuJc6z6XdRFZT4MEShkG4LW93+ZtwKEk8lW9KOhA3Z
         QvD8SB02anUyJ0vu8mPtmq2kIBXcupgL+sEjyTtJF/NSEoCVQ6jn/Mrt/Ob/lIFDy3o0
         5LgQ==
X-Forwarded-Encrypted: i=1; AFNElJ+4MfeTo9bpGXlmNybx8BVbkTNYS8SJuvrNa9spBU/9p9C+3ZXxaIEk/v7ftA+adWK8QKAW6vU1wWJY@vger.kernel.org
X-Gm-Message-State: AOJu0YyWUaCjjCC5kUj3KNWwTIVoSRzsy4nl1yLH66XLZ95F1rUhet0o
	5xIog2ShyTkuHNWwezk/R7kd6ThIg3PVqCuM7Msb2XUeD05NEAMkGQAxiL9PPSm7dBqxsxhk8fD
	s7JepAZU=
X-Gm-Gg: Acq92OE+54j1j4u3mT0eaAKfINIVZ9ggCxxBpbWWbXOy2HBl671s5JnIb5bNVSqGEJ2
	4ZxadelkmGZ3doEtabY/fYK2NeVoM8qZRP/SCVtcS007fgy3e+egv67lIQ8/Mj/Fh9UI5RGLy5E
	dX/f54gIXwO0wGDw2JNPXH+ramZby5bkIYS+WVydhEU5eGsr5PxqmUaAIq/OTRflC7eWztc2r4l
	c5VnS/eXoL7mG5XacuLrT+N4z+8pZDuxX1kucD1TnewKNiXfQC179I5G5udm2HCUJci5f3Iab9U
	a23/XjVKgK3tSRG3qAqQffqFJFJ+nu+oFzDOA8X/CyYIHwA5TfXCS7fCmeOFVkhb/MdE5DN4MDT
	wCtjpliT1yWHXXXcxtejNFv24Q37P3Oshfo/5v/evrj9IGXPeGBBeEzl5nKcAjBlpp8TYMsc4am
	4zAVaQh+6KuQxIuYCrjEfUAIFX7A==
X-Received: by 2002:a05:7022:2201:b0:128:bae0:e03c with SMTP id a92af1059eb24-13504948b9cmr7313101c88.30.1779151956831;
        Mon, 18 May 2026 17:52:36 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb93f3sm22546633c88.3.2026.05.18.17.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 17:52:36 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 18 May 2026 17:52:32 -0700
Subject: [PATCH v3 8/8] hwmon: (pmbus/adm1266) serialize sequencer_state
 debugfs read with pmbus_lock
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-adm1266-gpio-fixes-v3-8-e425e4f88139@nexthop.ai>
References: <20260518-adm1266-gpio-fixes-v3-0-e425e4f88139@nexthop.ai>
In-Reply-To: <20260518-adm1266-gpio-fixes-v3-0-e425e4f88139@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779151949; l=1513;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=MbcEhPfilDl5djs8OwiISgXUAGJH031p6hDtDP0Q1lw=;
 b=tZbataWxursToK6TwLtzAmcuF1Y17nbY6u7cTpaJYyj/zzPSkodk7mxZZH1JHVU1DnAEfVJlV
 wM8DBAZHWeaDlPp97HVGOW3fr13+66tWHGwfFTqkXPbMbpgV5W2XWyX
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nexthop.ai,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[nexthop.ai:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[nexthop.ai:+];
	TAGGED_FROM(0.00)[bounces-37102-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abdurrahman@nexthop.ai,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nexthop.ai:email,nexthop.ai:mid,nexthop.ai:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 41F3A575D6A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

adm1266_state_read() backs the sequencer_state debugfs entry and
issues an i2c_smbus_read_word_data(client, ADM1266_READ_STATE)
against the device without taking pmbus_lock.  pmbus_core holds
pmbus_lock around its own multi-transaction sequences (notably the
"set PAGE, then read paged register" pattern used by hwmon
attributes), so an unlocked debugfs reader can land between a PAGE
write and the subsequent paged read in another thread.  READ_STATE
itself is not paged, so it cannot corrupt PAGE in flight, but the
same defensive serialisation that applies to the GPIO accessors
applies here: any direct device access from outside pmbus_core
should be ordered with respect to pmbus_core's own.

Take pmbus_lock at the top of adm1266_state_read() via the
scope-based guard().

Fixes: ed1ff457e187 ("hwmon: (pmbus/adm1266) add debugfs for states")
Cc: stable@vger.kernel.org
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/hwmon/pmbus/adm1266.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index 051f4f188ec5..605db086236c 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -333,6 +333,7 @@ static int adm1266_state_read(struct seq_file *s, void *pdata)
 	struct i2c_client *client = to_i2c_client(dev);
 	int ret;
 
+	guard(pmbus_lock)(client);
 	ret = i2c_smbus_read_word_data(client, ADM1266_READ_STATE);
 	if (ret < 0)
 		return ret;

-- 
2.53.0


