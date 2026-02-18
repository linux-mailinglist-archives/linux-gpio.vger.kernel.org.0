Return-Path: <linux-gpio+bounces-31816-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id zPhfBacmlmnxbQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31816-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 21:52:55 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A461215994F
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 21:52:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A1CC13006B50
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 20:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 363CB349AF2;
	Wed, 18 Feb 2026 20:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ku4N/NdQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045CD311972
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 20:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771447971; cv=none; b=SHEyb02RouahqJfjDur1btgogGUOyFEilnpgyj4nC5+5jvG06be3fFlm88dQdzn/JBSNO03KEHP2c0lLbAeKSJTj3zWYwG8q5xWA8Ci567H60MF6eCZvVYlkGovs3fGxQAjpwF5kGdtyZFgRiP4i9XsNg88CuhSy83APkcoGMrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771447971; c=relaxed/simple;
	bh=gVUXNAx5ipEs7JptNelgk7joR/9IsRhTWKeYYuuu/B0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gcxLiRmBrlvA6bFdgY3WoGyeKeeISRKy+X1GHUav4E1BMR2e4vPozQPXGSrGnZGSVu2tW5Q6FfifoRwEYNdmJ4Y8WYtPCbTZcCXQxWLPvPXD922ZhZ0X3Rxtx+BJsFKaYvKRVzBCx+TzZkmO14nLV31nRyVoe37XXKuI65RxzoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ku4N/NdQ; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-127380532eeso431838c88.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 12:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771447968; x=1772052768; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d/0FpU8lXYfK4+auQs6w7slKU7OvSIPS213kGUpKbqQ=;
        b=Ku4N/NdQyCKydwhBSzVw33EAt3oL2BbBZNh2xTgT7H8Ag7hQJ8O7OFrsECzPf1Qw8z
         0v/EaH9yw6N2xPmy6z+u8H6h+KlOkyO9K9JHmYhnH9Q6SiIVIjRhahNx4mLxZmQICued
         Pn+uzBtE4BrlvH7+/7tOaPtoLxEoqQrGD8jlTzafbimK5DGvftZt/v6hrPssFAkg0edQ
         oIEs0iIoD7AwTt3wyvqKbyeX+nMFELwzeC50OlIKbfMw3fBU3RTbhUhC4LfTegLDzSmN
         lFnY/vqLrR+8VOZLawwrRXWM8E2hGVIz6QUghvY+nc39JMGoE0zr8pku7BfIeWFOFqgy
         CvCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771447968; x=1772052768;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d/0FpU8lXYfK4+auQs6w7slKU7OvSIPS213kGUpKbqQ=;
        b=d16j5T6lf9Az70bnnU/z0ao0dtSidgDfe0QC0bh0I2OligzPPZIbeBxQ+fLqwwjbly
         ySHuPEckzMpZkM7VruP+bSZPRQ+++i3s+mt8jHuKiwtkzIabciKjW8bUimfndgVaH7+N
         dsgE5UDAs/1QhajYVUuNGvGm/EjGHkyj7So9bkydBgXsYmOYkx/mkA+yLNlbqblTwSKb
         Eoep0sj/alfjDX2qhRmbxp898Heool68vsXqE27Gyt9qwCadYkI+7cptn56fZ8QW/kfq
         KMR0tWFKzVkJMsG64iXWYnzBqPbeCg8o8l0xqwrlRUvdzQYCL2gTTikw+U52as33k/Fm
         aoOA==
X-Forwarded-Encrypted: i=1; AJvYcCUB/GtVe6dbstAJtbuI4HiLh2guhGE5kSXyVqLIyLAeLvje0GDKtDfh+YXcaXAWYAPEi+elgoWpVpZ7@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj8025jq8ATaKQLbbnaWZaOiFSU7jFicA6ZjXVmzmUy0XGEFhX
	fv6uXaaYXD0drKt6Orbnx/CbetNjMM+5xJ4JtW7NNOb7cqaoj79rKW4G
X-Gm-Gg: AZuq6aJU07uUwQbEdbw7WCsfVKjFJc65qAptc+sQginF+uKDYgkPJBVP/Sg7KLPB3CT
	T9J2pNa1lbJ6FQCnB7JhcPHuaMclkIXAmg7ebAi4PlbaU50MAWBkXiIcXxhzVmfz1NjIQXNbLBE
	mEnVNncixzOKCAwwrgJEVFYRbdYYXAP1RjtJqPJqdqMWVnvUJncWD5KlPA3u8EPWKv68nuUfc4h
	Q8tVifKcMrAbfo7cHv4lrHGn9TQenuzdNidp+Ypem327+HsvDNffCjVkYS1Tq4UrbVRF2ywZCs3
	vM3RMDeNcjyt5MAkxJ+Pot+nndnoeXCF5vVPst4IrL5ltmUH/niEHXXDGiJkS5TIs3b+pQ2zsTd
	v8VfA7rxQUzuiN9buXc7HHtoHUQ4owWDOK6xbvNE4ciuCFrnk+EVhBsXQAUGKJJwfe1fHHVeoD4
	7N2WhGBbn528uKu7RpqyA6jFP/5QjdyClA8tfC+Rum4VykNqwMNBorGCwRl80jxLwo
X-Received: by 2002:a05:7022:2212:b0:11b:bf3f:5240 with SMTP id a92af1059eb24-12759a103e5mr1793279c88.9.1771447968052;
        Wed, 18 Feb 2026 12:52:48 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:265b:f5ad:9e03:677e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742cada1csm19332477c88.9.2026.02.18.12.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 12:52:47 -0800 (PST)
Date: Wed, 18 Feb 2026 12:52:44 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH] iio: adc: ti-ads7950: normalize return value of gpio_get
Message-ID: <aZYmemDCcVzPB1RM@google.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31816-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A461215994F
X-Rspamd-Action: no action

The GPIO get callback is expected to return 0 or 1 (or a negative error
code). Ensure that the value returned by ti_ads7950_get() for output
pins is normalized to the [0, 1] range.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/iio/adc/ti-ads7950.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/ti-ads7950.c b/drivers/iio/adc/ti-ads7950.c
index bbe1ce577789..0c4db18ec4d7 100644
--- a/drivers/iio/adc/ti-ads7950.c
+++ b/drivers/iio/adc/ti-ads7950.c
@@ -433,7 +433,7 @@ static int ti_ads7950_get(struct gpio_chip *chip, unsigned int offset)
 
 	/* If set as output, return the output */
 	if (st->gpio_cmd_settings_bitmask & BIT(offset)) {
-		ret = st->cmd_settings_bitmask & BIT(offset);
+		ret = !!(st->cmd_settings_bitmask & BIT(offset));
 		goto out;
 	}
 
-- 
2.53.0.335.g19a08e0c02-goog


-- 
Dmitry

