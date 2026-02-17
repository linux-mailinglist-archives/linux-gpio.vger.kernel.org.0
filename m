Return-Path: <linux-gpio+bounces-31771-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GVVIq7nlGmjIgIAu9opvQ
	(envelope-from <linux-gpio+bounces-31771-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 23:11:58 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E38A01515B1
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 23:11:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 474663012252
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 22:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ED0F313547;
	Tue, 17 Feb 2026 22:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JfehiB72"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1743E2D2481
	for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 22:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771366314; cv=none; b=IqfMEkDUslBBlJU+w42NxAjN2kKg022Mv2kuvWzYVIQOKOu4kN1DcVJ3ETmpd1lhxoS4W8lRY9Q2Hdjo/kdK7K5rEs+erHS4x6Ew14tTfHpik6C4eSfomqmnwclAOILNoJ/8ap8jNL9j1U+mwwbYPN/vZ1OSluxurgZC5MKPjSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771366314; c=relaxed/simple;
	bh=Nfm9sZLbTRNQxsMPnZMvEXDpJfkPUjKzjmZ0c50X78A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qYjqxh/nE/Ra/XXW0tZCHXNSU1uYO8adYtcfobmjK/qC7gA7AoIFgq+z8ZVnqJio6a0fYdhsBxTVkAseCzs9gDLKlFIVryR5twfcA0OcLztK/RnwkI1TSPK3st8RcTR4KyN4Kk8MhtWjUkZvGjDBMSY4GPj7jtypqoQOzEB5teI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JfehiB72; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1275750cf9cso574757c88.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 14:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771366312; x=1771971112; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C+P7TyKy8JYgNvmXjAX6UhAcFjxUgUJoN1VfEz87ibM=;
        b=JfehiB72VRXTHmuoNierPX5yafCIz7oA1TzMB1Vj70aKAls3mPReSF1CfeNAIT/owh
         0GeOdtEv/EmAdYTfPMYAR4Kb51n+Wbh4FsorsZ7m7MzFG1jui1OoDMpw4bgtimxLtOAW
         VHY2K77cb85LsQ4bTr7KH/HXdkdcZmSwQA4VMMIGcH3K3mSqwR2IHnT7HFErfa7Tcini
         uOr4erjb6direFku8YNUko++uwjbGO6QGLaEJp9IgULCckCMhu4Gg1I/psZ4RR5KlHFO
         IDHqUnb/f8ShrLrs+wdAUt3xLvm2Zzik2n3GOkjgJVE7dTzZxINtDuUKe3/DaDs8qvlR
         vBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771366312; x=1771971112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C+P7TyKy8JYgNvmXjAX6UhAcFjxUgUJoN1VfEz87ibM=;
        b=NFoFVWaFRR6VX7UpzefhirSs1GXg1/9aSakaPgkzxCssMCEUyPMgqu3HV1/D2MORBb
         WIDlAR5u9O9vWZqh4vbtqoJI+IVdsm0AHS9v48Y1dkZDF5IbIxiO/LioAO5rXTMyOIyG
         zKG316QW3MeVcBxxyT2ua8i8lfwGG7/KI90cnYRs2GKQ1q7WpPvRlQQVN1R4C7YP4tMV
         gWsJKjuA2blt9pmP9pq1qKx6gC7Ke3Y63sGub+d4Sf0rMPWjevJowedH4y9XLzYT2VJE
         IwA3f7yvsSPbU9uVII5AIjy0YevQyy5laoFFN400nS1ylkh5RY2p/1omAzuBLP4/83LY
         JMwg==
X-Forwarded-Encrypted: i=1; AJvYcCVRO0+XUREd7pwvk4dpYWWiRZk9YU/B42s/l/wJgKgy1U1/yvxbl5Hprb4AwXHkLYCGS8xcpGLPcFzo@vger.kernel.org
X-Gm-Message-State: AOJu0YwZzgxj44dVpDH2St6vWlRiEgu5TKYxz5p2xnUfsSH7aAagtv3N
	8oTtrH46iiZeKH1a0h9bggxWPVHAx4wjQEyQryKuyX/3NHvmXz6jjsPPM7IiRA==
X-Gm-Gg: AZuq6aLdIn5ORk65OoyviBXAstifdq3WOKwyxyux3KrndvN7/KCNGWhHTbwOSYCX0XA
	B1FI+xazEm/Rc93hMcBvChhd3b+B3HJ+c+A7cjnr/qIaLa+ANgdyFUYwwpIqUgxR41mRa1lmNlk
	UvCk0JQE9S5xjoLgYLMCPBuVt9uLvCZTCDHnV+1W0+vZWHrL69iKo2rYLMbj1Z9EbPeZY1FAdw6
	kMowDnq4B/pUIjWB8pr+ocY+1f59r2L3FxjPRb/J0nkxRIC8ROJymu1fORUbA8JMEcVfgJ5ofIZ
	txhFZW2ZkDTZeWqcnU1uAF5myQroudWa3RC4NEUufx/u0l5rGBhEkGOntLyc9JzoumNd3kbL4WT
	3UOcJiwQi/Y7o4qbYxf2kWjF40DMFpnX2hMao3PCeQxYQzQn5FFl/zMNmP8GOTOLcoFTD+EOjnA
	TLGDYrEgR58J58BfQSWTfXD0UYJYsJVdE3NVD6iFiLtMl2M6ikwUnY3YOB+Y//NVuhWyt2tliM8
	/s=
X-Received: by 2002:a05:7022:608d:b0:124:adfd:623d with SMTP id a92af1059eb24-12739819487mr6366167c88.31.1771366312045;
        Tue, 17 Feb 2026 14:11:52 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:968c:f102:3683:408a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742cc83e6sm16612704c88.15.2026.02.17.14.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 14:11:51 -0800 (PST)
Date: Tue, 17 Feb 2026 14:11:49 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, 
	"Enrico Weigelt, metux IT consult" <info@metux.net>, Tj <tj.iam.tj@proton.me>, Hans de Goede <hansg@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: amd-fch: ionly return allowed values from
 amd_fch_gpio_get()
Message-ID: <aZTlwnvHt2Gho4yN@google.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31771-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[proton.me:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E38A01515B1
X-Rspamd-Action: no action

As of 86ef402d805d ("gpiolib: sanitize the return value of
gpio_chip::get()") gpiolib requires drivers implementing GPIOs to only
return 0, 1 or negative error for the get() callbacks. Ensure that
amd-fch complies with this requirement.

Fixes: 86ef402d805d ("gpiolib: sanitize the return value of gpio_chip::get()")
Reported-and-tested-by: Tj <tj.iam.tj@proton.me>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpio-amd-fch.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-amd-fch.c b/drivers/gpio/gpio-amd-fch.c
index e6c6c3ec7656..9f329938202b 100644
--- a/drivers/gpio/gpio-amd-fch.c
+++ b/drivers/gpio/gpio-amd-fch.c
@@ -8,6 +8,7 @@
  *
  */
 
+#include <linux/bitfield.h>
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
@@ -120,15 +121,15 @@ static int amd_fch_gpio_get(struct gpio_chip *gc,
 			    unsigned int offset)
 {
 	unsigned long flags;
-	int ret;
+	u32 val;
 	struct amd_fch_gpio_priv *priv = gpiochip_get_data(gc);
 	void __iomem *ptr = amd_fch_gpio_addr(priv, offset);
 
 	spin_lock_irqsave(&priv->lock, flags);
-	ret = (readl_relaxed(ptr) & AMD_FCH_GPIO_FLAG_READ);
+	val = readl_relaxed(ptr);
 	spin_unlock_irqrestore(&priv->lock, flags);
 
-	return ret;
+	return FIELD_GET(AMD_FCH_GPIO_FLAG_READ, val);
 }
 
 static int amd_fch_gpio_request(struct gpio_chip *chip,
-- 
2.53.0.310.g728cabbaf7-goog


-- 
Dmitry

