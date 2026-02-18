Return-Path: <linux-gpio+bounces-31810-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLWaFwgOlmmNZQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31810-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 20:07:52 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 028E8158E98
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 20:07:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 14E1E301A2C7
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 19:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22D6A349B08;
	Wed, 18 Feb 2026 19:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJUC1PUq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13DB347FCC
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 19:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771441630; cv=none; b=tznETZGEXut7yUZqumqa0zBokV/Ta1SVgf74uV1Hp37CUr8+2nv8gIItls56jkY/R5sUNJ3LGzzHpZtkQn2B/aRaZJD4xDe1qAgJNgPVBMPc8mGoEYhpyD0KUeoZH7//ZFc36wApl2gEN4sgRjomUbW9qbLhhjhWj+cYK/ng1k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771441630; c=relaxed/simple;
	bh=mqvwdPVLv0zgR//MhS4gtZgUNL+GO1xnTY0M0lmxlKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hwkwzoMh9PhtqiXKl9MFXBRSL3DlqMwjEl0zTVc/pf8A1JPQIo3+mn5d+N1+6kqamuvt/Y8lqeDeNB3n8151+JU64nAWdM2YsfdhG4wPCz3v9OkVzZIYfyeiUUc020Q8jRKeHtsVTOByPhVpV4HWjQihjf8lm69W6L1g0DhvXB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJUC1PUq; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-126ea4e9694so217014c88.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 11:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771441628; x=1772046428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bUWps6c7AjkjsErwypzRu3zrQMswJsJZPLkQm9HHzrY=;
        b=nJUC1PUqYoe4wnNxY8xG9+W3Sdw7AVSn5X5UiwXUNiCVhf+OEkBuz8e+bTy841Mm9n
         hv/aO2PoW+n5yLXQ0Px1bTDoEq3uW5Tx192Hm36JhWGeXddTlCuYRCcWA8Ow+HcN5fqi
         GpV4FPc5+dn1jgVgAh0goU3GM24l2irUP1UWfXkeujabaCV6+9qBkQ7VMq2mLg17bdvW
         /bp8t+t1JY4Z4SSM46kf1y8JTRT1wETrbfIvPASuQkNekyo/ptJKDUr3lCyGfu+xFt6f
         Tip7ymLjnFf9kA5P7TXEzYUaurw+lpjp1UGCYTT1kkYgBjKQ0BCBu8x1m6x9UadOhBDs
         +72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771441628; x=1772046428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bUWps6c7AjkjsErwypzRu3zrQMswJsJZPLkQm9HHzrY=;
        b=LwU8OXfaE11KUUb9Ehtbh9rddQgbHmTt2QnCrmNV3DEHA2yqNgU4EMOuXgFBS0z7xN
         chHHLvJbyB+v9yBampFcOmahZODVS1GyDnf+UhHca1/Kys3FfAywu8s8SmcIKL82GyZh
         Mq1/YA//cHWtQXH1rTP0QWqX5u5eP95NxcEGXX8Nvr1pIiJoPwvMNx2HUHPvWihJw+wc
         E2wbIsA4axyRAAy03LEH8SbrZPseZCIKC6c9zNHdvPRs1ikmx9Qk59YL0qvKkTx4TvxE
         jPmoH0vtEjXQ0P8plzZQx2tC2yleEcQBoiaOnE/JmjCtQ+U+wpgfnDQ18P44RnajXReF
         HXaA==
X-Forwarded-Encrypted: i=1; AJvYcCXzLmxPyBTsm6wHnFIB+AtiIuJFT7vVF0+2uoOV7hGQ433rWtiorjLGiPXuRM0KVbp8woe8ZEvVs4JY@vger.kernel.org
X-Gm-Message-State: AOJu0YzYDlEcnFRt1c3ilJ61yiYhw/C1KTY3wzRgxz4R5UY51U77G8Ze
	KrcyxLcqndpRB8n7m+9u0gVuE/x3lkzBaRzNO+/92eARbSzy+bDNvEg0l/ROpA==
X-Gm-Gg: AZuq6aIWcFhfan6rZi6/i2nfV0BA+2InTRaVW6IXnxs9IwwOi2NoDnKxwM9MgGgBr6A
	1053gTByFCTIZaIa99bZ2O/dTOjIGoHrP7kWG2t3ATpp0ZQ3s56suNI/GPvZpCBXW6+4RnZ4y/C
	7bTUrJfstcNNsvkWFFGkd3+1MtoW4pvGDbzjpHSS8ppFJYD2I9cPSr09yHiZMxY5UVXhQnmmieG
	hYM9n4GDn+8qHmK+pNLv4Vqsrxh8d0p5YiwB/a0eZ3wWeXFnMmrniF72xim30cdiDeGqU67oXDC
	wOZFrA2HUT+qJs9cO1353YtFES/9D2LULo2xWLEMwTd5TS00xljqtKkgz+ZFGkXlYUKy0cr9S23
	Hond+vMtIdh0EHwgxhwk4a+d+kCua33I9R5TlmTILSi63xlGeaBQlNlhmbuJgZm/lpjpFJbtVav
	UPQURsU7ZZFJU6Ils22O9KxyFhgOQ/ZPqMQUmWhyAnIeWi02jdaOQbYrGnA5Y0nmqsbuuuk0TvY
	L9dURwPJc+tG1g=
X-Received: by 2002:a05:7022:458f:b0:11b:9b9f:426b with SMTP id a92af1059eb24-1273addfcaamr8359418c88.20.1771441627733;
        Wed, 18 Feb 2026 11:07:07 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:265b:f5ad:9e03:677e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb543d80sm22108652eec.1.2026.02.18.11.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 11:07:07 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH 5/7] gpio: stp-xway: normalize return value of gpio_get
Date: Wed, 18 Feb 2026 11:06:54 -0800
Message-ID: <20260218190657.2974723-5-dmitry.torokhov@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31810-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 028E8158E98
X-Rspamd-Action: no action

The GPIO get callback is expected to return 0 or 1 (or a negative error
code). Ensure that the value returned by xway_stp_get() is normalized
to the [0, 1] range.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpio-stp-xway.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-stp-xway.c b/drivers/gpio/gpio-stp-xway.c
index 493c027afdd6..78d6c78d4aab 100644
--- a/drivers/gpio/gpio-stp-xway.c
+++ b/drivers/gpio/gpio-stp-xway.c
@@ -102,7 +102,7 @@ static int xway_stp_get(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct xway_stp *chip = gpiochip_get_data(gc);
 
-	return (xway_stp_r32(chip->virt, XWAY_STP_CPU0) & BIT(gpio));
+	return !!(xway_stp_r32(chip->virt, XWAY_STP_CPU0) & BIT(gpio));
 }
 
 /**
-- 
2.53.0.335.g19a08e0c02-goog


