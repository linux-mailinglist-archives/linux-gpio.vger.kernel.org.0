Return-Path: <linux-gpio+bounces-31808-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKnRFQEOlmmNZQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31808-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 20:07:45 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF84158E89
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 20:07:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 92B143036E98
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 19:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 529D0348465;
	Wed, 18 Feb 2026 19:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V5tSnM8c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0590346774
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 19:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771441629; cv=none; b=Y8P1kMdY3zmS55X2j/jSDncuy4ATfQG7Hl7Xh2UqD1moiYKFQRDQGnHNix4vJTalC7E3bYW2DCruDm460wqiUhuWgwgfOfJ4MVme8XJAuLGc6Xw8tWD5xpBipNaO1KfsPay6PeyOUMCqfH1hUUnzLQ0uSRgKomO80p9OFVTeess=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771441629; c=relaxed/simple;
	bh=C0SMtOlx5YU99NltG6oO5X+E25x/zDltIyyPWOVWENg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wtb1L/a3mlVpc77BPMjMKn1RzkJgcpaMuarGfxZ8r2D0WipIlmrEKo69WpLCGvtUrwyYyn7JBekmgTukTs4GDLZc/DH8LwNvOcOjNwS3l4it3B/2Rsr3/BaqsMt1oneWduldeXKIuuJxWk5iek/Z77/7j9q4vkChmWRrB9yamxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V5tSnM8c; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1274204434bso941892c88.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 11:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771441626; x=1772046426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xF9OkOoJndInVEBls/wa+RtAUDP3GR4gjd4uyv/Mk7s=;
        b=V5tSnM8cJRmxTbuVEGkRK0os9flagLLM81M+ZgaqBcL9fMA5GX1lpuOJ01SemOdYIJ
         YzXiQC4Lq5lFUWYzJYo/WSxJy6xJLVbWA/te5AwAalHZaKCFRxuvrvS24kTEYULkyIdH
         y4AJmwEsUcguSniIzoBR+gdjO0Vlup9j7ZDb7IXitPKOdIMgI8b4zdHUENXSppgwv8Al
         4j6CYRi6rxCKQMSphsX8Vj9SjBFJmwXDBp2hkAdSL+JpsKmVdl+clDVYU5oNaypVs5cn
         uuODnBUFwyOd/imIniywDMLITtEbCqasic1Iw6GcbRtinZw6nsLYuqD2Fgy6y7Zcc8Mk
         wjwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771441626; x=1772046426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xF9OkOoJndInVEBls/wa+RtAUDP3GR4gjd4uyv/Mk7s=;
        b=MKeGIT/I7aImOBPfxZmSeWLdBj25SlQmQw6kMWOKP+Ld49Hf1FMsLBs72Ei8In7zdP
         Cw5+WH0GT5DRbz2Dc85qHoevygOBMk50dM4cbHAC5Q0GLug7Nj4SfT/A9lJdET6Wxswi
         Y6FHYK1WeGQwZ2WqEGXzgKIoYtDnBEA/H6CgXOwg+JsKjchqAEq/FnUIKUux4BjHWcAj
         fVcKcooAzZddq17c8Gio4Ds/xW/Y0AmaiaVjLIoLNyLqVYdqcIQ47vBP1WRCFDES8yXS
         RE3kPByxA34MbRHkPSCVwPj6R2tUvixSaTrOZCjCE7KjpqwRCL3jVxupMI5qA/bqz5CM
         fkDg==
X-Forwarded-Encrypted: i=1; AJvYcCVqeKB5rZeHEg2zL5+4KKspMIaJZ/sJdtgLyh3m6Wwfj8bsRAoaeJ1bhB8uF2mb3UtrlXVXG+pgdMVz@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxcc5/QHWHwvmmP/z6+PrktPxABpnW1+TA4qleXkOwlwJbuMQl
	CsD9goLzBYZy00oGDLLpe6m8diRstzrMx3RDjGhblmaNPMZWq8clx8VbynJBzA==
X-Gm-Gg: AZuq6aJ+ZA4+mGvjPuTftZdcm+WJyZRG0dtjRbncKeYDFuWJpW1BIBzx4GSSu2QHrxL
	mWUnC0BflckJBcNN/aVmV4EV/p3+jgc+M30IJ1JQ38jbfJAalxTapOUZwlQ5e9t6vP0i4hckcRl
	1/bDVw06ypcjPaFvMaR/sTCuYBzLjmhxaU2XUZK3XdIefBZp6nvPV8cxpCsDIGOL4UWdgPnlYlv
	6VO7Y2hxQuQmb/0UC5EGsagKRsu88W7bzPv/uuuFutoXRJNJflzBvOzj+kbBW5t4r7CRhwFz5wY
	7CVnsye4TbppzdimDcHf9n67gUcAfuRhjGP7ZZnWMXIh9NxGxp0TZ4FpJ2GuIk9LWZzpLkTpIHh
	gAZie+D6gZ2I3IQIcgN2UeaAbASQPC7evdYVTqhD0vBcemBqbVTUFIi7sLi1j7i2LYTSrnCEq3Y
	zVSSr8poHzzJC/O7IC7+pHNNlfD0SQ+IIueW/UkO+Yc10cT654d+onm7AT9rFvZ1am8/Y+JBx+x
	qEs2npel8aJMMY=
X-Received: by 2002:a05:7022:4396:b0:123:3c65:d724 with SMTP id a92af1059eb24-12759901752mr1118158c88.25.1771441625946;
        Wed, 18 Feb 2026 11:07:05 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:265b:f5ad:9e03:677e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb543d80sm22108652eec.1.2026.02.18.11.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 11:07:05 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH 3/7] gpio: da9055: normalize return value of gpio_get
Date: Wed, 18 Feb 2026 11:06:52 -0800
Message-ID: <20260218190657.2974723-3-dmitry.torokhov@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-31808-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: 0CF84158E89
X-Rspamd-Action: no action

The GPIO get callback is expected to return 0 or 1 (or a negative error
code). Ensure that the value returned by da9055_gpio_get() is normalized
to the [0, 1] range.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpio-da9055.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-da9055.c b/drivers/gpio/gpio-da9055.c
index a09bd6eb93cf..1949a6ea8ec6 100644
--- a/drivers/gpio/gpio-da9055.c
+++ b/drivers/gpio/gpio-da9055.c
@@ -55,7 +55,7 @@ static int da9055_gpio_get(struct gpio_chip *gc, unsigned offset)
 			return ret;
 	}
 
-	return ret & (1 << offset);
+	return !!(ret & (1 << offset));
 
 }
 
-- 
2.53.0.335.g19a08e0c02-goog


