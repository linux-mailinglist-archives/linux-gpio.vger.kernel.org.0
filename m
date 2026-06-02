Return-Path: <linux-gpio+bounces-37772-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLdPGixkHmr+iwkAu9opvQ
	(envelope-from <linux-gpio+bounces-37772-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 07:03:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D928E62853B
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 07:03:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F46A305F49F
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 05:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D058247DE1;
	Tue,  2 Jun 2026 05:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GyJNJFBU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17A3293C4E
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 05:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780376518; cv=none; b=DHLbEplc+bW2/un8UltXFAZ22yEeguu1hUrMTR0gKBOE1/+Vn7G8mAxso+3IZFNf2NOwjMObDrffizPhPC0Jt90SOfzRlSb+te9EZpK7AoOn7eFCFHMJdoiguC3XKRcm1OzvLUKUxD6q0DCD2kg6HwKO9KKKrK7zmZkKLpMJJjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780376518; c=relaxed/simple;
	bh=duKPiKUfyzrhMI6nYJuaZ71n6aBn6LzpO0CRA49RdW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mkjjUt27sAEmmr8o0HD14pynm9r9CDA1Apo6Oueqh0HYukgxOtIbXqzAX37V5JGc2NpGzpM2SJdGlRFNra+NN9thLb8bzjV80R010mu4pVhJ46Lt2JrcpYqyeDEG62Xroq/5XBTZvlH+T5JiYwIh6EI+jJfemHZcd53hD7J1jfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GyJNJFBU; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c858b5de728so1642280a12.0
        for <linux-gpio@vger.kernel.org>; Mon, 01 Jun 2026 22:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780376516; x=1780981316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GTvG89FycszAXpYpTdeo73IhzkPmvsyhREwqWmrsBdY=;
        b=GyJNJFBUdfZR85dHyGeKSQZHqLiB0/2oA838Onh7g8bL0hqRWD4hb8F/6RbQhbw4KM
         yyiSsO2SpPa1LvTSxW7td2F/vj7K/4dARzSdhTGRZ6QFNJTm13LMQ5hD03VgCBv7k9rz
         v3crwlyp63W59MUXVpt6l46hi1aQaSIAmNSY9ouAmM6C41JOEtKrKZkkkMewwxKl4FPC
         BBAJTyeUowzlCriROMok2PHvYR8qWCu79hpRGBPKzAKXqCZnQ2KWHdHDDrS6yV+Tk3ys
         3wmYkeEz7DrSVi0W5w1/MuROmJUUZV+2PZYjZzjUoTSKUmslzwZZ3tdJiOoNvL+ctK8o
         vt4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780376516; x=1780981316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GTvG89FycszAXpYpTdeo73IhzkPmvsyhREwqWmrsBdY=;
        b=R8gDS65c6X9/BmGyM+wEDMg2qAuQVRUb2k49FWCFFJV59jzdwPSG8p/dKAr0lxssGW
         p0wXRmLE/UWiONajJYYylo4Toy2mrCLN2MtcEvLjEKyMsyOwS2aI5eojP3FTr+DLFkyg
         6mZSbDSKoCH6VG4J9xbMmbupeiFtv8WXVFsKr7YWKVc/A2bkb13hFvnMWJ3el3fSoj/6
         joMHt682uAeUXVgrtKzeQVmAv25TKCvXL6xbim6nhoN/86+puZl4Ij2e0a8HcD3FaJFJ
         fzeYaSmLNd39cbISPGlbymeft9CNDUqw7ln2WdGtPW3716e2l7OlBNTqwAR8yO7X7pqz
         DW2A==
X-Gm-Message-State: AOJu0YxkaIMS+gjWPycCst734AdaBysaWe5ttRKTGkoq4UPyn/AfhxAW
	UorMqszA7MGeWBlpVn1G/Fs3Buq9XO4mw9hT52U9HC50bVeH4tsTJe2dqs2sMyy2
X-Gm-Gg: Acq92OH/N2t4bp0Ze/4W833zxV9KBYW0XVYDFzabagrRe5wKdoch4igXKXuGKS2L+FZ
	/WUbitt08BISU8g8ThrhYfAiPQ2xhIXkKZ2bWlaD6yx+QAih2OQI7VpCnDCVmQXwh7Xs/Xy0QDr
	l+cvlB6ZkAxoyOyStHLIezWvYiii6lZg4vZQT4VDcztcoNqrkXXyyyzK2aYqY5KM9gTfs5PnwlI
	Qr3ERwdgwRlLLTn7do5992cx640zTP9oYby8wyWYGKoCAVlGaFN53Jx89gq5tIOWFoSh0pX+oJO
	zsn7J0ftfYhxuaGIvDaisYZyazR9z5sVLpnrZD/yDkqblLQdeuDkOlYCnoRfAHWrcAu3I0WBZ/y
	dtIXz2JRFgDbvv0UTo+Ye4bKx2+8+ojdQifS/etfOV3ZOfY0e/V4aPy3v9PLJFwr4VUYtnOJK/4
	ZUe9hsrNWdMSW4pd2CYVY+pHvYYcJYzgHADZ219GmvZZ2VE4B4We+ZYsmEKjFOdRVk+L6K7lkou
	oDx9GTvYaV1XKq0PZ6KAS9YdZDVp9qjh89ov+h63ZFwWg==
X-Received: by 2002:a05:6a21:7a8e:b0:3aa:f9ff:656b with SMTP id adf61e73a8af0-3b427c10895mr15671814637.7.1780376515909;
        Mon, 01 Jun 2026 22:01:55 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8589d055c7sm8958467a12.9.2026.06.01.22.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 22:01:55 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/7] gpio: ppc44x: Use module platform driver helper for GPIO
Date: Mon,  1 Jun 2026 22:01:26 -0700
Message-ID: <20260602050131.856789-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602050131.856789-1-rosenp@gmail.com>
References: <20260602050131.856789-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,ellerman.id.au,gmail.com,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-37772-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D928E62853B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace the open-coded arch initcall registration with
module_platform_driver(). The initcall level changes from
arch_initcall to device_initcall, which is safe since the
driver no longer needs architecture-specific ordering.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-ppc44x.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-ppc44x.c b/drivers/gpio/gpio-ppc44x.c
index aea0d913b59d..0d2244272e32 100644
--- a/drivers/gpio/gpio-ppc44x.c
+++ b/drivers/gpio/gpio-ppc44x.c
@@ -203,8 +203,4 @@ static struct platform_driver ppc4xx_gpio_driver = {
 	},
 };
 
-static int __init ppc4xx_gpio_init(void)
-{
-	return platform_driver_register(&ppc4xx_gpio_driver);
-}
-arch_initcall(ppc4xx_gpio_init);
+module_platform_driver(ppc4xx_gpio_driver);
-- 
2.54.0


