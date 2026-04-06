Return-Path: <linux-gpio+bounces-34695-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6B2gMXQ502kwgAcAu9opvQ
	(envelope-from <linux-gpio+bounces-34695-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Apr 2026 06:41:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 366463A17A0
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Apr 2026 06:41:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7464A3024A48
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Apr 2026 04:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E58C03563CD;
	Mon,  6 Apr 2026 04:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FB70900V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D52A3314A1
	for <linux-gpio@vger.kernel.org>; Mon,  6 Apr 2026 04:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775450374; cv=none; b=lTwvp/BepXjY25Wb6JA8ewRHQJYlLDVv3wbNP4PZpaF/sZ3/KbZBbKmfRQSe1LHGZkvx6zR3FkLfUe5AD4kuId1AN5oFNItByus7jDbF1O2X7Dm37QRsA/iJE9tFjj8H6UBRLoEp9w6njGgExIeYEHTxtAo3gxqZRCVBPQyTYKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775450374; c=relaxed/simple;
	bh=exu8oRPFvaUwd/x6xwtOQbe+s0ME5lDwo7ojHbgx33s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uyhiQUqg07xXHO0C1+gg+H+nI3GDN6S1iWo6F9Cr9Ip9m1tBcrOLAFw9VTyjN4hIuXyve6lXZ/g8CcZYilkBdwykUN3Ve0yDS9bS3l16D1xuLnATumqXszwjJiHSViQvYAkfT7UA+ZwjhPNZw7DNnaRZBvl8pNJgDmEzGspO5ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FB70900V; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12776bebe9fso8410548c88.1
        for <linux-gpio@vger.kernel.org>; Sun, 05 Apr 2026 21:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775450373; x=1776055173; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zh6XhPAF80uBHigYDps0enG5D0ugVfrEjPXkEuqC+6M=;
        b=FB70900V8Rk7MbvjQ7qIQiSo9WfkwzLw/0VYrFMS/YBDsE+pZ5WYVNVQjXNw8hZ3Vq
         QoG55oqujhBNBuTkRHLBHfExPFm06qDfXCUKcrqY95mZ7Ax4b5Uvut2xD7PqatBcz/nd
         DqdAwyN0e8uDuz2tgkB7/oh++lJYqi8I80JfIi5FFD1iYvhqn8oFccAREhGTWgLMnx3E
         ydXBeJQ4ECjGRGn6XXYajWNvbaA9fPWhYTaHKycFWs71TJSQcxIbTAmFVx6IBiMXU8Q3
         biXE4VrGmadfWtCSitgFd7pu0emcipJlm/kzRr3iF7zjI58CwJRVb6LE7z/c95yRpdtk
         3rYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775450373; x=1776055173;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zh6XhPAF80uBHigYDps0enG5D0ugVfrEjPXkEuqC+6M=;
        b=jcy1imzs4x48IpM78G+4a6Cu0Q0EhukhpMtEmduzZfbTUCdKgYRlm0wyPjCUD0J66K
         WkNbnVXtQ8WIJlJJtjGdUOZ9XACED/S53cYDtpvlOzM7Yc+N4H6PWniSlFYvkX/8SFFj
         Eikun+Bp6xk9CusFc7E8+xs7oSMC8lgUzenSXL0hzoKnwsdMzHSyRnrE3AcJvExHcL8R
         CKbMOAnGYQ8FgpHwKs9F/FtuzRn0ir4D8Uv0dY+mM0UYtqinDhAM8C7m63o3wS7iOsgO
         GyDmcnm5rzCh84XLKZiUwn5XPE5fi+ayjzeyQD9VKzmDJyjJe6A6EbHbeBlDCjTWda8B
         MOjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCMFdpp9+wAGY0yErUbCVt/UcFwPqyDrJKRFi3wq1X2lfrUCaFXnZH0be3YTgsjsJQMwXyiRowJNs2@vger.kernel.org
X-Gm-Message-State: AOJu0YyjU8k0tEYAzX+rC9275WrMHzQFaNKPSNNRKaSjUU4qLFEx1jDm
	y+kwVlsAQkXcnP51knFBTZCRxBGzMlv4jbFbC/GKQtT4lge2bc7XEO1f
X-Gm-Gg: AeBDiesn0zZrw1AAa3Z80F1QMkxL2aTB+8sMV7aVaMMxgBPlk1KnFAtpEfb/8Rz0VP2
	tGOlCsa8/3KnlSeMpgkRYEB7Gyu4Fchjvsztn+FF3rMha9ZP2e4rGXrVdKRHSJ//wby7gd4OYtF
	G+mvfzqLiSyaNsvlh4jqUbt7IIIHA+RdFWD1aQV8Ejb5GPf0WHJdBcLrlJFgCifcTd5lRrL4/vj
	JMpSQNc5gIjKDz4/tcYlXQQu7D5dz/lA3gRnXSQWhxA6H7qhQ+GhGC3VQC1dKytOzriJ/rXFAjB
	1wtJIiPrPqvzJo0ikbLd04wvuu/Oxr2vfymUsGbnDExEjVyboUwSnl/yBdN+42qOFUrAFzNGDGV
	hSlENjFTDuKYQrOYXlN0/SiYoIaEOo8Kl5lDnz22pne+jPdZ6zi3IGkWWs4Bi7T/tzc+bMg+lHV
	z/7UboDUbLH761SN3lHnp9TW7Nc+wzyEp9iM6KrT1umOnx8cXY0H7ZHamTJZ8nQ8bYQZk5fR0GU
	2PIyoqHiL3F/fU=
X-Received: by 2002:a05:7022:23a4:b0:12a:8176:f3b1 with SMTP id a92af1059eb24-12bfb6ed00cmr5864357c88.6.1775450372713;
        Sun, 05 Apr 2026 21:39:32 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:fe13:98b9:9e98:d1bb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm15182005c88.0.2026.04.05.21.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 21:39:31 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 05 Apr 2026 21:39:24 -0700
Subject: [PATCH v5 2/4] iio: adc: ti-ads7950: simplify check for
 spi_setup() failures
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-ti-ads7950-facelift-v5-2-1f980ed3cf9e@gmail.com>
References: <20260405-ti-ads7950-facelift-v5-0-1f980ed3cf9e@gmail.com>
In-Reply-To: <20260405-ti-ads7950-facelift-v5-0-1f980ed3cf9e@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-6911d
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-34695-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 366463A17A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

spi_setup() specifies that it returns 0 on success or negative error on
failure. Therefore we can simply check for the return code being 0 or
not.

Reviewed-by: David Lechner <dlechner@baylibre.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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
2.53.0.1213.gd9a14994de-goog


