Return-Path: <linux-gpio+bounces-31819-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FfBKnIolmnxbQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31819-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 22:00:34 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2814C159B59
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 22:00:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 63E5C3029611
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 20:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE08A34846C;
	Wed, 18 Feb 2026 20:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQTTGMZA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33F0348883
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 20:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771448294; cv=none; b=n8Yb7rI9pjNkgsfZO31oqnnjCC0Vl64Qzj+u9grjgRp9U7bXScJhykKj84ls87wHj5RZWN+mFxuzpvo6TbFAt/npeu/ampILI1ciFDK8/BeJ3niDTCaRRfkT5Az3KBMtJnoACQf0zOWsXtbByUerj2PraI8y4msxA/j0WVqQwCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771448294; c=relaxed/simple;
	bh=r6f5XA/yt5ijQxC9qj8PwFahd3U8KiCq5t1T39MZKU8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZkNfsNNLDsLEcUKGy8WG6wublA7dv1nwZpPjuD66gW7DzT8X2wai7U842WX0xi7xr8+vmW6IX5P9cnQd8nDEN+/yqCKmtdWFAVCP0OKI/6VgDHw7DUJw/v1hoNW3/SRJmdN5n0r+7NVPwTRbSKWvIY7wsPJUKFoM1n9bSPmwQ6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQTTGMZA; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1273349c56bso295401c88.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 12:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771448293; x=1772053093; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AYz/iLeO6q0BGWWQxma927idbu7N5p49ytkQNprhL0s=;
        b=lQTTGMZAZjiTraDUeAEqJMdNby/jTWB4DrE28iUD1stqL4w+8bBsAGndgtRAQmZHs+
         OBF7bEoyd91uzjI22RtuqMWmTPJo974O9ExuDDO+9xLXdOxOH/u0GX9hudj3nY0p/NEd
         +Vnp73F7iKRWMRSibibCjDjMh28nAyFU40MwOwCMU80bBMYIQ1Pn6uLAbY2lBsAth6cC
         bRR0uXXn29SlT0d8vsFAkzXdlS6TZEYE4QqZOPfrhzymh0Ik9oAjwPzrEmWkNGkLn6wB
         g7PZnwC7hzTI2G6cFdcHVWgaaP4YW6YzufLtGCH4nBCnq59CYOgXNWSbMeRnGS4kEEoe
         ZVeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771448293; x=1772053093;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AYz/iLeO6q0BGWWQxma927idbu7N5p49ytkQNprhL0s=;
        b=ht+bxbHBsdS1XR2o8NiYEj+WQKBkTgu+IOxC1k5B3qEQB4jYq0qGaWeyvEHjtwwsSc
         Q1EeUPr0dYWIvDzMB3uuC+bkELI85a1e46zeUaasUkEipKC99QLOc6chJRo14NmtLPe5
         VGiK7E0zeMWXaW0atGGJPWPVWM9stzGqDE0DbkSDcd1ocoaEw0t78Zb11H0t+cmFp5jr
         EQeBz1zOE7x9Bt4wFIcIAwrUk87UL8N9flhIJIm/51sUOrlDIvAEmC+0pPiuuDWtJh58
         VKAXnEqVPhAg7MvgGaWMP0uNqfk/41JYKR2t6nYXajNRiCyJ/HBKRTgIYXfZLc/dYE+r
         21xw==
X-Forwarded-Encrypted: i=1; AJvYcCXbs/8E6mT5L8+hHpx99P37sWygmEZePhIeeuZ3jGe/LUf+Y84AnIKc9/cHwZ5Pk/hoYP8VmbCF2m5l@vger.kernel.org
X-Gm-Message-State: AOJu0YxuFWr6JdktM3ENXeRQrUp6c0P/T92ImtqGJoD7GhnJNPZW1m2R
	Fl+xLTj92cjgTn1L9HF9ZrJ2Cj/jPeBryU4Vxz90YAPiL+g1+SGMv+SU
X-Gm-Gg: AZuq6aKLoJ73w8jocoV3w5Ow3rF/nyL/vrW72Lre+oVNvmhQ6K43lUhu0gWr+MR+Sah
	RI9X9nVLZcosoiKlh7XrMBpK4GNLdG2S+wJNp2+eIFtR/JhDBIUyet/irpEVoUTkfKS5DEQWm2b
	mGW/YOIp3hSPwa+G/HPnYPFdRFcSoT4xxwDNF6i/PmFmr1Sx3vyiivtGp8PWWA7GcaHll+brATo
	B7UQLrRhxVhnQTDmnC7EGqukdXOcEMnB1RdC42KBEs59ycLipD2hK2VdsyZYAjhLY/eGcwGL0yq
	voBi+XYWjPD7lMvjFTCY7/MtUXWziFkcG8bh+BHgg28qgSxvjA9SwzL9ww/FZXnkD96O6SSfXyI
	tI29gLcEjexrT0A6aRRyzb3jIYPNcpvB09IDABskPZ25wjdWBhooB/mfX2FYtVxO5Lps9l4101s
	hqIqd6gEAA9uZdkjRrv1lf92yLoGSxmalDqgdbtH3xWr3CsS9JHFC51mmUt/xFPgWT
X-Received: by 2002:a05:7022:2206:b0:123:330b:398 with SMTP id a92af1059eb24-12741b90b7cmr5415874c88.19.1771448292879;
        Wed, 18 Feb 2026 12:58:12 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:265b:f5ad:9e03:677e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742c63feesm24200691c88.4.2026.02.18.12.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 12:58:12 -0800 (PST)
Date: Wed, 18 Feb 2026 12:58:09 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: renesas: rza1: normalize return value of gpio_get
Message-ID: <aZYnyl-Nf4S1U2yj@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31819-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2814C159B59
X-Rspamd-Action: no action

The GPIO get callback is expected to return 0 or 1 (or a negative error
code). Ensure that the value returned by rza1_gpio_get() is normalized
to the [0, 1] range.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/pinctrl/renesas/pinctrl-rza1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rza1.c b/drivers/pinctrl/renesas/pinctrl-rza1.c
index 3cfa4c8be80e..d83c7d8ee82c 100644
--- a/drivers/pinctrl/renesas/pinctrl-rza1.c
+++ b/drivers/pinctrl/renesas/pinctrl-rza1.c
@@ -589,7 +589,7 @@ static inline unsigned int rza1_get_bit(struct rza1_port *port,
 {
 	void __iomem *mem = RZA1_ADDR(port->base, reg, port->id);
 
-	return ioread16(mem) & BIT(bit);
+	return !!(ioread16(mem) & BIT(bit));
 }
 
 /**
-- 
2.53.0.335.g19a08e0c02-goog


-- 
Dmitry

