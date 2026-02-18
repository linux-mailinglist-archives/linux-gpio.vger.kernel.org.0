Return-Path: <linux-gpio+bounces-31821-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yC+KMk8olmnxbQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31821-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 21:59:59 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30669159B19
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 21:59:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8B17302A052
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 20:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EEB4349B09;
	Wed, 18 Feb 2026 20:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bDC1pNki"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164A92E62D9
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 20:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771448394; cv=none; b=CNNBqRcxBj1AiCrrNBG94Am3heKY6UsyiewWZchqQSvXsWQZlD2DUCbgO8yAQOjoT3SJ4Ott8lTdWZqGuTlpPc+Htf0L8Tpm7gJ4Bikc5MhO09ZqQ4OPYLhXCJnRnUeHmf6gBGG8wgT33xQIGUHG897cinpbh2/rKtNRhmFrxxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771448394; c=relaxed/simple;
	bh=5jFBPD09VTvwsEdg7NJd45cTwB2QJsheRb1Y+ZMJEyA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z25Z+gS/r3JTNZtKx1tgFpMR0AZAzTAGk/et7TLG4bzGVSd3gu/1Teszcj41YrBNTCdhLxiYNmkKtOpQ+RQzFr013wNqMu5DaHjig+WDtkLgpa+1vCbKT9Iq9znyqmhd50jhmsBdyup+6eAlo/DnTZRB+0GrwPsIj3LWU20qhQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bDC1pNki; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2b86671f87eso452693eec.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 12:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771448392; x=1772053192; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XKuBFMt8ULBcfdl9ibe5021rITt9RW4fW9s6+VsDwAA=;
        b=bDC1pNkiBdEajz1+S3pDqCKYhlhYYZ1XyYENPoWlWE3tMHcHFKm8dPt28vfEcdSOMk
         wHWrTj86eiorORLGYDAaElaEulqJ7c5sou/B94dC7QDFI9PODM8vRfinN4HnHoZf9LlD
         XyN+3x/q4SlLA3sE5Xjv/ZK12yX5Pms5yBPkMUb10Hwbsdci0EiN6ut3QB2fVSm8gKlY
         B0T1tZtuN6hzJcK9m6EFO88v23iIkTsJxfHAS9rT5lirvWvNNqqr3y+JM+hfMxyMU1ub
         ousEbWNPZ4vazqJQJLaL6RDGSUNMnFyEVEG6AhcRjKfSvAWBNQ44rKjm7g5rQKsdf4Nk
         59Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771448392; x=1772053192;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XKuBFMt8ULBcfdl9ibe5021rITt9RW4fW9s6+VsDwAA=;
        b=NpsQwxkFr2mDGbymUDWYKFV3MQWiT5UjC4QG3/EjSu9koDoTx+6WsYrNyxxFw8yArn
         uyheysLuLXwkTzxfYOLVNEAlLERlGemQ2yrLwKSNZoF9pf8edXHK9qWPnnLw8kOg/oCp
         O3FkA7VTNHICs8CW97P/cHJsOIKbFjmI/KEzDLqJxV/NdzmwONhpNYrzEZQdpjXha5My
         KBgmfftJi2JVAQQp4yylrwKboShftKRsQTwKJP9G8snwrWZyhnSbWQ/GmKXDWuwMMnXm
         iF1/v9NYrd3ny3LVNOtlnMFjv9sBedSanSWxbg8E2t4OC9QtCEXzSMmWbgLMh+j4DUNt
         3Z3w==
X-Forwarded-Encrypted: i=1; AJvYcCXX9h4MeMkz5DL+oBQHWXINk2eJM9zIUb1JUbmdGaCE6ERTlKp8uE17LJ4Qa4gLNGWCvGuQts3HI/Id@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+P+yjvjAuczi4Cx36qOXjHZvijcx/Ir45gUc0eYZmuvUcFeEG
	4UzDaG5qmhGdWvxiEU0nvQTFRbE5ObKyWAbEzIEncxBpXvPgVKhtwzOB
X-Gm-Gg: AZuq6aLl5/wZrs4nxgd3ThwPuOkBa5RiuH9Z7f9OSpqjOgzPFp0Li+hDKNtG1Vospfl
	hjldCboZsZpN7Q8ZyYrpKKTYFJCJ2m8Rn/LiY0q9dbhRhaj4nsuxHb3D1GJQ5AHAcLQxRAgNS5N
	qz3ICzljsOi0vBK7ltpd2w49sR2+sPLpEIExWK/LM5EaRWKDQzfj45lbZZSFWmWdXdj172Y076X
	lINievYFZV3CXp16Pf8zrvgMCR43pJB1dCH9lyJEj/zkuNoiHUA75GwdKf+okYg6UTU69BuF+po
	kcWoZQ1Q5XrlyS5r+4Vr33qgNrLIKfsnPVpNUSKeoddPnh3U3tGwst4T+ngLxtFYny1R6FLCyOJ
	8jSQUVSZtGK4Pnct1i8Nl6P4BdoGw1Zewhuh2YTwk+tV+6/0Y4tyf4RQiyX1liKp50KJg8mkVQy
	fDnC7vNWQxZhIiYvPlaywEk/4//SLN+cscO6JM/9+pNOUkeq8DCE03jWIjIvFtvqLn
X-Received: by 2002:a05:7300:a945:b0:2ba:a0c6:ef5d with SMTP id 5a478bee46e88-2babc44e5a7mr8820356eec.21.1771448392113;
        Wed, 18 Feb 2026 12:59:52 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:265b:f5ad:9e03:677e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742cadb25sm25057723c88.10.2026.02.18.12.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 12:59:51 -0800 (PST)
Date: Wed, 18 Feb 2026 12:59:49 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Xichao Zhao <zhao.xichao@vivo.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Subject: [PATCH] power: supply: sbs-manager: normalize return value of
 gpio_get
Message-ID: <aZYoL2MnTYU5FuQh@google.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31821-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 30669159B19
X-Rspamd-Action: no action

The GPIO get callback is expected to return 0 or 1 (or a negative error
code). Ensure that the value returned by sbsm_gpio_get_value() is
normalized to the [0, 1] range.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/power/supply/sbs-manager.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/supply/sbs-manager.c b/drivers/power/supply/sbs-manager.c
index 6fe526222f7f..343ad4ab4082 100644
--- a/drivers/power/supply/sbs-manager.c
+++ b/drivers/power/supply/sbs-manager.c
@@ -199,7 +199,7 @@ static int sbsm_gpio_get_value(struct gpio_chip *gc, unsigned int off)
 	if (ret < 0)
 		return ret;
 
-	return ret & BIT(off);
+	return !!(ret & BIT(off));
 }
 
 /*
-- 
2.53.0.335.g19a08e0c02-goog


-- 
Dmitry

