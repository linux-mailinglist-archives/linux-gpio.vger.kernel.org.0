Return-Path: <linux-gpio+bounces-31809-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PQvEyIOlmmNZQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31809-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 20:08:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0291B158EAE
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 20:08:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E9DA53055578
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 19:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08496349B03;
	Wed, 18 Feb 2026 19:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iM7puVYT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A797934887C
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 19:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771441630; cv=none; b=NL7pRlvz8KRyflvkKIhl2S8fQ8ClvTgNiqIqftuevi4IHR64OzG4Ky8n2XM84OnkZuvMtwZHQqKnXNrcNbbfRz6lJLUFdaRHMVlvWUkNQOAqI8Lfq/VE4qSMTo1uf9vmpeqMY6Iq4Jd7dmVl+9flh49ZOg+bCnSnbwBvL+2ooVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771441630; c=relaxed/simple;
	bh=77ESnGA7hWNJF10qUk8sINbcVb2q7uBMYGhk/xAg31k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W6fG0cq2MR5YZerobVtC2jawRxs2j02MulgxSn/RoBNQCMzo2TxMkz7StJcGFLSsKV6r9LNdtEZmcuU0eNfqLZ0O8NYZkJi/Cdk0pK24arFuNlUTGEjtmJrPZyZ3K5zPyY0Y0Kee5UWyDINwy3blwSignwizddfH4KkmOyGCThw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iM7puVYT; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2bab70f8c8aso128667eec.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 11:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771441629; x=1772046429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4a6BXxR9WGZ6Um7i3c1t3sIl5Os+CKINT4+FIWQzXc=;
        b=iM7puVYTXpttDjnh3ojKKmMqgewj7iJWfSUcIWqO9DebGMgxvU2bJ6EkzAW5l4iG68
         yhEZtEGQTLOcZFMUyMCpVgLU6qai9vVgSOmO8B5lFYEdByZe9KBA7Uyk3R6Jj6MHHmgC
         nUSIHso1wHUuoV0jTj7q435bpVgOv65xITo/1w47Ud0WvJypaAgYSUfjqFgOI8sy/m1M
         gGrDq+k6JQnQqC4ofiDmdXfdYVVgaZ3Ox+hl54tvgPcdKofuYF+BQHjLdEOFtu/GIoVD
         lxaIz+qjhLJrwIgfOQzRyzJODMg/jCjvtrOrZZFFwaUkVxkvnQhBkTRLiznLUqvMzO0s
         DXDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771441629; x=1772046429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h4a6BXxR9WGZ6Um7i3c1t3sIl5Os+CKINT4+FIWQzXc=;
        b=Bo3To11VZffwIkyGSCGGgvagJfxNv1Izgemad3G01GmaAABOiEStUs1bRhSvaPe7vS
         LCgl1KK0YMal46wLqIzxSIC2e9E4v4ysCublA4so/REobl+8Wa3GN0+SxEkSSKZtyiMb
         jP9irNJyPhY6EGZyNo3/i5hXYHY5p7FU+5cJOHPYOVohxC4iHB16NB+k6YjNNZ2HLaxy
         aKlUkz6vgvy9Uboum1NMw6ZqUBj0C/fA+umgIVbJmRVXJQrk3tXJk65N0Qv4dUnAGZk7
         3AztI262kjxQqLyLyW0bE2QDTSs07IsQjkXG6akQcKtrIoJV8iXyayUNYPz7kcfir98k
         9I5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXy2LGtxrH0iaOS64nDtrbMn3FBGPNnPb9X6fXMH0W37W27dxe49yqLCOTNzqjGhsU5CSdpqCCgWVw2@vger.kernel.org
X-Gm-Message-State: AOJu0YxmiqK35RSLd3o06Z/F1JuxbwRRrAbiK+FG7tlD7za+xCNKtD6f
	gSv4ow4O4PtpeFOOkBS0F0528vATzO0564yZ9FIaVAa02PCRPMvD3d1c
X-Gm-Gg: AZuq6aKySd/oIgYUKmkymOAzZt36ZXyyBZUx5BTO3GNK8ia6L3eVwRRebKl1SHZumAt
	VQMI3KUy2uS/Oot9tCniBZ4WBWxOXTFdsIc2VMzvn0EAW4ewNqz5eY8SXRzZUEkipeUPbZiVMDk
	ZXN5A/3N0HS8SpVNCtLmlesj2T0hysSGQHAcSsXchF7GTDEisjPqfKvMq4O6jparymq3gqxBTsV
	I1XmBSi19Glseq6tMQ6qrpLg/RkZCqxBhyi93uSw5bsRkk2XQcR9HDqgEwB5g3M6+EJAyhjD8Cf
	18Uv9Vs2ZIkX1h/SjV19ocgVeaGbIFNYLEBXstfyBAVNIvHa1ArS6gF4OFKVGpBWER/1JgVpJsn
	8r0YQCOi953DB0jDH8bhdMkf0aoOp+TnSuYV7q45m1KWTlpu7BWECXDrWlFe4iboS3SkzoFjraH
	xm0Js025DUBQ0CLeqT4jUHzN9hdbFe3wLDtZ0jnh8A8aTFK1aBaCb36hU12KHzIaJBsTLRFVSnj
	M8dMJSuYeMABM0QqwGvuGRYBg==
X-Received: by 2002:a05:7301:5f16:b0:2ba:a075:540f with SMTP id 5a478bee46e88-2bd502dae04mr1499402eec.41.1771441628725;
        Wed, 18 Feb 2026 11:07:08 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:265b:f5ad:9e03:677e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb543d80sm22108652eec.1.2026.02.18.11.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 11:07:08 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH 6/7] gpio: tps65086: normalize return value of gpio_get
Date: Wed, 18 Feb 2026 11:06:55 -0800
Message-ID: <20260218190657.2974723-6-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.53.0.335.g19a08e0c02-goog
In-Reply-To: <20260218190657.2974723-1-dmitry.torokhov@gmail.com>
References: <20260218190657.2974723-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31809-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,bootlin.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0291B158EAE
X-Rspamd-Action: no action

The GPIO get callback is expected to return 0 or 1 (or a negative error
code). Ensure that the value returned by tps65086_gpio_get() is normalized
to the [0, 1] range.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpio-tps65086.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-tps65086.c b/drivers/gpio/gpio-tps65086.c
index 84b17b83476f..df770ecf28bc 100644
--- a/drivers/gpio/gpio-tps65086.c
+++ b/drivers/gpio/gpio-tps65086.c
@@ -50,7 +50,7 @@ static int tps65086_gpio_get(struct gpio_chip *chip, unsigned offset)
 	if (ret < 0)
 		return ret;
 
-	return val & BIT(4 + offset);
+	return !!(val & BIT(4 + offset));
 }
 
 static int tps65086_gpio_set(struct gpio_chip *chip, unsigned int offset,
-- 
2.53.0.335.g19a08e0c02-goog


