Return-Path: <linux-gpio+bounces-37588-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOJiDOEIF2pA2AcAu9opvQ
	(envelope-from <linux-gpio+bounces-37588-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 17:08:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC435E6960
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 17:08:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 602343072590
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 14:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A53A42982C;
	Wed, 27 May 2026 14:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="e6RtwzGM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92694427A10
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 14:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779893870; cv=none; b=ARUQhXgk0Aqijw6Hxyz5U0oWaTkUgUSrCaIMRkfj99kl9WTAXxrrTm7+9B4if/Tji32oWizdK99jBJJi/YUcpaV2ZoaA1nG4ttjoovYWoBUBWfKENh59yhH2ExeGNSdN06v+m+4NMtkaxfcwG3pugNuam/uMnt9zKa32KcDdnwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779893870; c=relaxed/simple;
	bh=xn6i6L/l5fdHtpZRgKpCo87bXecaotB9zi2g96mMm4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ov+9hdbKH0BJ63RQa4Dj4q2ptxnd0mkat8L+FVGxYs9i7AN3KMwfs6Ss+o6izPJBZkOEDKakzY1lwCh6NdNb3o6Rmmy0fwSRI4zdPOuvDLBnfP1+UNqJCCyZaqu1JwktsEt4J7QCdWFlBlPZBroQ/fFAn6PwXhXfHpehvO4/hqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=e6RtwzGM; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4526a8170ceso6093836f8f.2
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 07:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779893867; x=1780498667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7VxueHy6w4jWS1oI0wcvpTixnWGqnoqMpbN/kAV0FVw=;
        b=e6RtwzGMhPwBVOqRI/usP5zmOUhiRDDHs70c/cnTdJk8Gs9ycr1wOVQ5hj0fVpOqYd
         GJWRljwjrqkRPm2rU3lv/7XbxMfQvMmXorQDvSA/bI1U1nymWvB0/Onrqs7VyUCKHjxu
         OmJqdAXedyh/9mzt0pUhJ9vEdv1gzXzEC4gx/34H++4oOjoQ19YsLNLsr3u+MJY7iPcC
         YlSHqzlbQDnMulGSF52NSlPORwOS0Ysb+dWNlHjOH6tGKnc1ModfJmWFXb6134rWFQnh
         hy+Ox9A3f2VHoJ9WeFc3snPIwSKqbgBUeNzgE0zZrFp9wGYFhbGG1Pidyhc+YF8Si3PA
         P4qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779893867; x=1780498667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7VxueHy6w4jWS1oI0wcvpTixnWGqnoqMpbN/kAV0FVw=;
        b=qQrX2uxq+R2c4xDez110G/mWdzaN8+VlST0lOofUVLlU/vhlkgp7jD9iOQf1SsvtyX
         Rn+wmL4NfFzmOWtes47Q/dGGBCYaBujbREkTKYVAqANnDuRelorTPKTG6X44Kfprzqla
         JHdfB8tSrBRDsXFylPrHb0LlgId2lwuuwFiEGXtDOrs6/e2nSK+Xq35AHrBTdGDdlRer
         MG5ajCs+BGCS9qM6enW55TS7zYgia5B+JPBVjVrORn5Lk8Q2Yf+qfyn7+4bKslu4hsar
         cRTV5WrPBvulI5AjtUmF6xk4gFGSdyEhST7VRndRxv0kk92YG5pfKatrOLJ5LFd8nz0Y
         kIOQ==
X-Gm-Message-State: AOJu0YxRhpdlCsGLLFlOwx23z1TTbrmpal3p5PyJR7NTJjI2A8Hn7Jps
	1LDAa2itLlV4jxb0H2YvjaIsp2vKwjrBVjfYGi5Y/bun7CAIK29vlqlYuRdnwzLUCyc=
X-Gm-Gg: Acq92OGmsNcVAOvHVxCyUaYOAj7PBE4j2zaiGUNaY9V3t49pN8KUXbOSzFUP+Cug2T2
	Vhhe0Jqc+LMRHuNZhOMqvdorqQmLE4uknAyPhK/d9OTBd9cR7MgoJIxV9A21c9RfZVxvVd2i9D6
	t8QyHEpehryVuFtRqFaTOdJ0OjG9yBAH07aJDuP57BRb/DLAQAINFosxJok3csnkNmibhXgC9oY
	K3dCijGsVno/5JTvY/XgaDMATghSlrfhwzhogusGv6GFA0/7Tex9HA+6B8sVIdrunfiFC+CnBPS
	YDZhpxbea9s/Q2Mbi+xEvk8MzV4EYGEGiRdwp/IToYJ2NtSZ40YWHecBaYV10OyNY6PueYjnRwm
	EoVo/8qkVN+BYZ9OWmwDGAftfdTXWcWTkJO1xT2AnWYCYDbvU1CpHIqXjJTS5aG/Jynk/w0Gn5d
	nxDkqNPrrBFGkZRqiMxUtIlMeYNHkSUoGRpVG/k3n2W58KOa/6a7w2/iXPkU4nc5emtxNtblXjB
	5PXm3ML3OTP/s4=
X-Received: by 2002:a05:6000:1ace:b0:45e:9417:556f with SMTP id ffacd0b85a97d-45eb38c679fmr39931469f8f.39.1779893866975;
        Wed, 27 May 2026 07:57:46 -0700 (PDT)
Received: from localhost (p200300f65f47db042b54ed4dbf2ca0b5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:2b54:ed4d:bf2c:a0b5])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45edb558f52sm7006527f8f.14.2026.05.27.07.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 07:57:46 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Subject: [PATCH v1 3/3] gpio: max77620: Unify usage of space and comma in platform_device_id array
Date: Wed, 27 May 2026 16:57:29 +0200
Message-ID:  <985c86e80f35a944a4712f0c2ac8dd795868cdfb.1779893336.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779893336.git.u.kleine-koenig@baylibre.com>
References: <cover.1779893336.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=770; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=xn6i6L/l5fdHtpZRgKpCo87bXecaotB9zi2g96mMm4A=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqFwZeDrvZDqPJZlBjPbzEQEKPfmax9EE0diqME qqjxtH0p/qJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahcGXgAKCRCPgPtYfRL+ TlWICAC2P7RYJol61SpBzWcK0f0LosMvIyT3mir3aSc5hG8hbEV+dMO5TK/fx5T8PsLSK4xXw6F nDnVwMmq8YRbOa9RUnKNZTjVREKc7tz9cV4b1lkA+mIlH2To0hGlJlaH6kNbAoo55/0yDFU1NF9 HyL6yEHUg+UBfo4jQv+1ahxcwaUtMSGRRCqlRg5E4xvzXIA6J+P434vHZFFvuWsTA4WSHDsoloq Z7VVH6MdEEvi8f1tcL+42H4YoFhPz1Ck+otlsHZvLiLXgALgPwVyVBGVz2FV3sYybjXuCs+E/Ew GTEvQfil9jDFKo8J3FuYDLa/sWF3YcjYq/N80a2XW/R43dxh
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37588-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:mid,baylibre.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 2AC435E6960
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The most accepted style for the array terminator is to use a single
space between the curly braces and no trailing comma.

Signed-off-by: Uwe Kleine-König <ukleinek@kernel.org>
---
 drivers/gpio/gpio-max77620.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index e6c85411c695..2bf3b55a61b5 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -367,7 +367,7 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 static const struct platform_device_id max77620_gpio_devtype[] = {
 	{ .name = "max77620-gpio", },
 	{ .name = "max20024-gpio", },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, max77620_gpio_devtype);
 
-- 
2.47.3


