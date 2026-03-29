Return-Path: <linux-gpio+bounces-34373-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLjtEZSsyWnn0wUAu9opvQ
	(envelope-from <linux-gpio+bounces-34373-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 00:49:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D81A035458A
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 00:49:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C83D3021B12
	for <lists+linux-gpio@lfdr.de>; Sun, 29 Mar 2026 22:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03F36372B59;
	Sun, 29 Mar 2026 22:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c8Ez01XZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815D837417D
	for <linux-gpio@vger.kernel.org>; Sun, 29 Mar 2026 22:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774824436; cv=none; b=JmFmbkI89bHmOFnaiOMcftwmPCTdA0zWk14PwdxlKWApSVWsQF+U/HSrLqdQ8fdUMolSU6s4kS5jCXGOXwUmrVbaQrhXOtvbn/Z15/UWj0qDmvIwHeXH9OWOl8OpIBuXt0x5rHDj6IiFewuKWCkU9cFT1DXAxDeYe+gwjIHW8sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774824436; c=relaxed/simple;
	bh=fuZck8myQoX8k0WCv45I/UW0qdwIBbPx5XxBl9G6Pa8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gZInOYSh4nhizqr5GY+CKfd9R+1Pkhhvboq6EltEHnhAQgRwuVxFmzRuPEr0eZW82E6brsKTXNbx16R1WnwbXFQB4N5HKDePznmBvCfgkAYmvGrSC6kjOFQODASfOSgGivrWIuUdc4qi47sfTl9CeDrTKi1LbI7RkVaI0PZhN88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c8Ez01XZ; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2c15849aa2cso3956491eec.0
        for <linux-gpio@vger.kernel.org>; Sun, 29 Mar 2026 15:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774824435; x=1775429235; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TKnXDyPHxP+Y+5jS7Wois35p2rZi45QRMmQZExuHS7U=;
        b=c8Ez01XZ20lPhRSjFztQaSiOooyWOLC/zUH1IxSOM4gnDe35As2xPkWAdKr6RYqpRA
         6nMA5dWfws/sfvul0aeMfrqBhGirC/YsgoPA2w5nv7dqWe0RKUgg88sIjE/oxasMKqpq
         TFWu0FVaziDi37+Kd33tnJh2q7rtIzX2A/9OYQxUFRPF3AOppVSf/lJvoDEl5yMw64v4
         7yPIEjv/Z0sLa5OdivySGGnhIvYIhCki6PmK8xG5vLwsNJ5JroE5A00l5Os2QNbx5n3Z
         65Irthiq31dE+BWY2YEXVugOLsnp7idnvMFDewBVsvTNA3VYTqUyK/k4YeLCmwYnHzoj
         htqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774824435; x=1775429235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TKnXDyPHxP+Y+5jS7Wois35p2rZi45QRMmQZExuHS7U=;
        b=JdCjq8uRmDvZteJFv7EzFmJBhhfQWq51WPEXgbqJjyPxnujpzRaOR9+7yf/wDnfsw/
         l9PF7KTzNPuYvDWFmiDLewDm8itYZSLH65y0TYIOKUPi86GpJ60BUgItex0OKbs/VXw1
         WWeT0TdIgR5UIch1B0D24e2+GxI6wdb7ghO+NpH/MG1Na8aNYL3i/aa+6unF6+jIFjtu
         IRuFo4urGsbsdfsNiEPSVj+81J9u0Rvh0cUEt357kv09PjSYT02ib4lZHYDthe8a8PgL
         ZTr74Ms/J2fA3ImeJ49xJESduRutTRnnfXMzM4CooWqpqLqB9ArB9fQIGi+WOqrNJQXr
         TopQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvUe4W9auq6LrQzGKAeccvT7t5P236cz7w61PSvTre6CqxvuCSh9SV7ecbRh8UrZqbLrjinJFmeONn@vger.kernel.org
X-Gm-Message-State: AOJu0YwuTysclvTSk02a3rWvHJvHy0eeFloLsZ7cU2MX3PSZ4GPArF7I
	nCf34VufzUcz3nTgvbjhmoT8unabmfLfbO6RBJ58u6jC7c9Lvjg5vzs8yNt7dQ==
X-Gm-Gg: ATEYQzxJsre7qxYkdKlYnoPbsHzjWDWaThcisNPmKue6baZELxg0riZbWbQBW6/lDbh
	DagUpZTdAwf7NYKvCk4Bl57fYpg0X4sHxpFpLq0pDk95FxVDpSvhdduXyc2PGRlxUX1LI7Lo8+P
	1VbWvNTU1eOgjVvq1E2jbNC9BJ0M0GJdbOyRHHPzlOU+KNWKFob122nj+OP+9L84YBptWaGpoZX
	PrJkUGA+PoIsjKmKu56fGcrrrGa7DTRqyfbqmHyFxF+ywcUJJbUArl7Q3IJoK40e6JBwCpNtDE7
	qO/0iJY9UC0GvQ+mL5oWnbgyEXtmP6WxwPCZd53Yjmk2OaS0huYss59VmQc9rP+GIE0xy4i7IFT
	1DASMgsolNRaBBGBXXAMFtcoKOceBT6LJezgwFkxLpw0YLjVRjhWQ01W4ZIBlmechGcIXpgJjv5
	oOvRYgLWskigLMobG4oS5kXQ4wgZ9KUZD2FRLqiWuu9FkX1QBZtRZIf45WQ4B98P36hLjgDCHef
	e1nObWVqpzDQgo=
X-Received: by 2002:a05:7301:6781:b0:2c0:c9ba:1192 with SMTP id 5a478bee46e88-2c185e069eamr5267348eec.18.1774824434599;
        Sun, 29 Mar 2026 15:47:14 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:7265:773a:8e51:c62f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c7971d97sm5840295eec.30.2026.03.29.15.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 15:47:13 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 29 Mar 2026 15:47:07 -0700
Subject: [PATCH v4 2/4] iio: adc: ti-ads7950: simplify check for
 spi_setup() failures
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-ti-ads7950-facelift-v4-2-c568c508c49a@gmail.com>
References: <20260329-ti-ads7950-facelift-v4-0-c568c508c49a@gmail.com>
In-Reply-To: <20260329-ti-ads7950-facelift-v4-0-c568c508c49a@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
X-Mailer: b4 0.15-dev-a6826
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-34373-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,baylibre.com:email]
X-Rspamd-Queue-Id: D81A035458A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

spi_setup() specifies that it returns 0 on success or negative error on
failure. Therefore we can simply check for the return code being 0 or
not.

Reviewed-by: David Lechner <dlechner@baylibre.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/iio/adc/ti-ads7950.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/ti-ads7950.c b/drivers/iio/adc/ti-ads7950.c
index 6e9ea9cc33bf..c31c706c92a9 100644
--- a/drivers/iio/adc/ti-ads7950.c
+++ b/drivers/iio/adc/ti-ads7950.c
@@ -520,7 +520,7 @@ static int ti_ads7950_probe(struct spi_device *spi)
 	spi->bits_per_word = 16;
 	spi->mode |= SPI_CS_WORD;
 	ret = spi_setup(spi);
-	if (ret < 0) {
+	if (ret) {
 		dev_err(&spi->dev, "Error in spi setup\n");
 		return ret;
 	}

-- 
2.53.0.1018.g2bb0e51243-goog


