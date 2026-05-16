Return-Path: <linux-gpio+bounces-36973-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOsQBWvXCGqZ7gMAu9opvQ
	(envelope-from <linux-gpio+bounces-36973-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 16 May 2026 22:45:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C67AA55DB86
	for <lists+linux-gpio@lfdr.de>; Sat, 16 May 2026 22:45:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 672BC30158BF
	for <lists+linux-gpio@lfdr.de>; Sat, 16 May 2026 20:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 675A337BE93;
	Sat, 16 May 2026 20:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="ZCdoBKlP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC21437AA8F
	for <linux-gpio@vger.kernel.org>; Sat, 16 May 2026 20:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778964323; cv=none; b=AvcoG7uf3XEGxzKGVnU5AT6IXUznFBiY0+Zh0A4Ltzx5lrLTgXA7ivkLmUpodX3bmeszmLvlmxSdLApyTCqHtP2F+DV1No+7wUi7apE1ZTNqK1WPbridyuySFh2b95L6dp/Q3IqC+FE4geRsE8PlJ4XS6MkaSP72kw384sUEBg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778964323; c=relaxed/simple;
	bh=thK+U+aplsDzvE5oAtB1E2JzEzfbWfLwgItKOTLlb8o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LA/mOJw3rl4NlL9Q109aWu/cQ2tgR8k60v9IrZeY+31xjYKyjSLWZRbyS4o9aYnJxOTxxaiD6ONQ2VsYMzY6OccNPvCf2IcEcYSX9d8po7D09MQGouvV1C5oEc0UG5wMtPw87j1hZxhVvhEptJhd93dbsLt3SKoaeCjAi/ctcQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=ZCdoBKlP; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2ef2a1cc06dso4453035eec.0
        for <linux-gpio@vger.kernel.org>; Sat, 16 May 2026 13:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778964316; x=1779569116; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lN2ucZVsVYmHc/fedXjm4iB8oy6SqWjHFEKRvCBYgl8=;
        b=ZCdoBKlP2IBwldcKYmxqIQ0gAOx7ZbuEWUsF0Z7HucEx+ipTHfTctxv/bVkllEygb9
         cmx7eIbKql51eurkJcpJwXi5EAG/FaeDXpEw76qUkby2CXKx9zUtr7rePwhml/HHdMaE
         Qqe6ZUb8iQaZ96mitufci0jFLdXCiFlYzHg0l/Bpvf796fMKsjK/B70/X8Mq2c5YM1kA
         S0uf/+sAOsF1zIoxuGnGiVvYsDEoIz+PSmmxLVq7PXwvrW8wVbJnqXC0tuWUjAGk45TU
         xaIduO903BY/XERBCG4hyzwy5gydXMsEnCd4HH4esfQjNjY3mL0rvSklYvIV5IESkjCf
         GSEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778964316; x=1779569116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lN2ucZVsVYmHc/fedXjm4iB8oy6SqWjHFEKRvCBYgl8=;
        b=BH3PqQlkSUYE6GBqqNjWd+ZcsdiDGobu4zUh1py7dA/vBgEeD1QAO3D4wvaHO4XTB4
         U5giQbIb312UhyjCz+v1dbKvJ+n3+Ovq8bpEKywsCkJFqZMTin4VjwejH2d/R39LscPQ
         V0BO8kdaVVmIdtRM93W/IDbJieteGs2/ci2wLc18y4kbD/koD6cSdelGVme+Aox/1xzc
         yX74oeXNqWpIKqWcHlLkKiUkg7W7vdgTTmglRcKm+MhILOfpiFfTtlJRWWixkWaOoW9L
         oTz0D1jIehco7dHcXpLwNzPpKBucalY1NH2La9ROmSSv+Jm+/k+/hwtzHPGDngN7PA8X
         QZKQ==
X-Forwarded-Encrypted: i=1; AFNElJ9AqbVW+mVh4h56cSrgRQSYQcQ/gzTAUEm3DH60mZaGmty9r+M7UUeu8G+tYRuew1gJRVgGU2mxSTf+@vger.kernel.org
X-Gm-Message-State: AOJu0YzxIjyk14HVJsfQzhymdeRVvjAMk1t3bxsIq6RIEI/4UiInF56z
	Y4kLwis97fja8hL0vt3E66jogw8ddAY3tV4CzSl+4WdWrUmgHm1LEBiugjz8hX6A5mmpy/VvjHf
	nh91AD+g=
X-Gm-Gg: Acq92OGdWRtszykLhcSQK8tzywDTuk6XoJTg1/V/l+hwFhMyC1hCVW0UYzKuXM9/Ehy
	R5VekcaEZ/tkZIfJtcZKaFCp60vihyNoygsRGHXgGBdJH+hU0PJBiQQ53NiZXtGyIBsrPWwl4ux
	WesjM2Jld2iqWtNJq1uy6TC82ma585/m91pkoDduIS47QG2vaxYIfuitCbOk8Br+ejCtCfWiB13
	vIdPgbQwCe7h4pHgm4K8RASQ1hJHZT9ru9/QeXs4BH7EgYrns89ZiIdLQU1NmajL65UtJThUKmz
	YxEx9Bt16FyzH76eHsXCXRbO1GcRIMNkrI2vvAhcD1kQkVjukM+AiCxEIqaDp6xqr72DVWDUr/K
	ROFEkeK4TequPSVNmwuHehENIaLB0yy/Ma0WpgwxZEC791omj9OQOzth8oPP6adbecFLWabQZO4
	XHgEv1y88m8ZMR+HXGskESJOl3/w==
X-Received: by 2002:a05:7300:be17:b0:2d8:7302:d21 with SMTP id 5a478bee46e88-303986010e1mr4012564eec.16.1778964315801;
        Sat, 16 May 2026 13:45:15 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302947e917dsm10181189eec.12.2026.05.16.13.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 13:45:15 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Sat, 16 May 2026 13:45:06 -0700
Subject: [PATCH 1/2] hwmon: (pmbus/adm1266) cap PDIO scan in get_multiple
 at ADM1266_PDIO_NR
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-adm1266-gpio-fixes-v1-1-38d9dd39b905@nexthop.ai>
References: <20260516-adm1266-gpio-fixes-v1-0-38d9dd39b905@nexthop.ai>
In-Reply-To: <20260516-adm1266-gpio-fixes-v1-0-38d9dd39b905@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778964314; l=1733;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=thK+U+aplsDzvE5oAtB1E2JzEzfbWfLwgItKOTLlb8o=;
 b=BjxUI7bCnZQeFpZr2VOSAEtl2SLHMs+Oa3mHpajmk0LAPHOhdXEZlhdAym/1bSbWC3erZwg9R
 mT6xHQTW0CMC+SUgxRZG1FK3c7FXPaM2P+/QHUrJpOofreLG2DY6l2t
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-Rspamd-Queue-Id: C67AA55DB86
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nexthop.ai,none];
	R_DKIM_ALLOW(-0.20)[nexthop.ai:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[nexthop.ai:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36973-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abdurrahman@nexthop.ai,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

adm1266_gpio_get_multiple() iterates the PDIO portion of the
caller-supplied mask using

	for_each_set_bit_from(gpio_nr, mask,
			      ADM1266_GPIO_NR + ADM1266_PDIO_STATUS) {
		...
	}

where ADM1266_PDIO_STATUS is the PMBus command code (0xE9, i.e. 233),
not the number of PDIO pins.  The intended upper bound is
ADM1266_GPIO_NR + ADM1266_PDIO_NR = 25.

gpiolib hands in a mask sized for gc.ngpio (= 25 bits on this chip),
so the iteration walks find_next_bit() up to 242, reading up to 27
extra unsigned-long words of whatever lives past the end of the mask
in the caller's stack.  Any incidental set bit in that range then
drives a set_bit(gpio_nr, bits) call that writes past the end of the
caller-supplied bits array too -- both out-of-bounds.

Substitute ADM1266_PDIO_NR for the constant so the scan stops at the
last real PDIO bit.

Fixes: d98dfad35c38 ("hwmon: (pmbus/adm1266) Add support for GPIOs")
Cc: stable@vger.kernel.org
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/hwmon/pmbus/adm1266.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index d90f8f80be8e..11f9a44f4361 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -211,7 +211,7 @@ static int adm1266_gpio_get_multiple(struct gpio_chip *chip, unsigned long *mask
 	status = read_buf[0] + (read_buf[1] << 8);
 
 	*bits = 0;
-	for_each_set_bit_from(gpio_nr, mask, ADM1266_GPIO_NR + ADM1266_PDIO_STATUS) {
+	for_each_set_bit_from(gpio_nr, mask, ADM1266_GPIO_NR + ADM1266_PDIO_NR) {
 		if (test_bit(gpio_nr - ADM1266_GPIO_NR, &status))
 			set_bit(gpio_nr, bits);
 	}

-- 
2.53.0


