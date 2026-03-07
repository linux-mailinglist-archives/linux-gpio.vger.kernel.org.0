Return-Path: <linux-gpio+bounces-32733-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLQ8EaxhrGkHpQEAu9opvQ
	(envelope-from <linux-gpio+bounces-32733-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 18:34:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C4F22D020
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 18:34:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D0DD0300981E
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Mar 2026 17:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50B27330D54;
	Sat,  7 Mar 2026 17:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="udYSejxQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9F25CDF1
	for <linux-gpio@vger.kernel.org>; Sat,  7 Mar 2026 17:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772904870; cv=none; b=Icq4hceJpWpAi/nXy0noA98mSdpYObepijoCBd7rSUPEQozNLIIc2uqXP5mn1RIcMHy5DFwFUHiXGfYn0RVW0dMFGiYKLVvKybycOIW7Nb9MKPNVcPddzKzUOwG36XMOOCokicTjV8B9K27FOMdpRfJ96kw1mnMsMn4d+bM3U8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772904870; c=relaxed/simple;
	bh=LD8PWaDzB0jYCg3/QMjeWBbA73jYhxBf0Xu9NQBp9Fg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N4jSRY9fItydTR+p+iZUG7nFmmXltFR+XlgtgzDcW/M1djErsDwHCnABWfxaX+32xfGzuSLYUAtXuJ5xXerVI+dL+l9SBXTZbERN0SIamYCmr1Xg3aJ03PRgocSIruaj2p50Wqp3/CgtDA8rqUDtOUUAI4n7GvnfVxTWUzaVWZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=udYSejxQ; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-415b23dd6e5so1993993fac.3
        for <linux-gpio@vger.kernel.org>; Sat, 07 Mar 2026 09:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772904867; x=1773509667; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/yv9hSwjNIBHD4+9yr9CMXRF3iQDU7plMHlSI5wIOX8=;
        b=udYSejxQUNUjdsUZH0kKorLdXLizbNe87Psj7PEkFHnQqNT/Z5c9w33Zt/teZhpRq7
         4q8NHq056wbX0EfVAaYVGXcmZEmig3OZqkd97EwQVKpRYNYEp+Rf1SCmYCUOgr8ANa7g
         N8tvZL4bRla03pyj5trizpUUA/uqqPOD9IjU46l1ersv0W7FWFppiUxRJQyNYfaLX6mE
         IbIXsphTVJqU2O+ze8/6+jWSt7T7ip2b3HQLfGpH7Q2/W1x+FDrW9b/Z+W7mVQXwp+tS
         +kF47nG28wMt0Ga+JAdOhGHy1K69HxYnfjQb6GOBoAr+n3lxNjZL0raYKWGjOXaALu06
         6mog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772904867; x=1773509667;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/yv9hSwjNIBHD4+9yr9CMXRF3iQDU7plMHlSI5wIOX8=;
        b=ZS53shI5AS/RY44ghRxTI2/mzQLmz9qjU9FTXxBnQbkpaAGyl7rMhRPuqU4Uq1bIdx
         wHB9ip/UO2620rhp/MowiBzcbSDHB3BM75Zf2I4KSPlevGpX1yg9UIOVozAAJyEBAhEQ
         BnvBit+5/aTwqH42UHpja8zJAauSujcCmCLyL3glHCoccEtYOhP4+AVZRZxgqPaPH8BU
         Ph2rAuqgTpqDewOxKw2wMfa7NjfwFQ2sZnFqxKdJ7gjpbjTjpPmfqlutZdWYL64UOoo+
         6sfa7Nyd0MuPHQrjg6upuU9J6lQSZDCGqnDAw1aC00ByZqgYF3st979lqhFyYYZC1nWK
         pOEA==
X-Forwarded-Encrypted: i=1; AJvYcCV8FcIuEIzYZ3UBksi0PIssuRvih89CzxB7H92J+PmlQoGZfzdjeUW6XrdtNUSxsIphlc+dOwS+RllV@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+yHoOCOpktUEvEJd4Ku97PsTEJ/FxWP3YAM47PftvHM78hKt5
	6wggqkq6LO60g2AfxvJJNnGLyt3q5+81nQpU2sNn/OIpY+x+2zfLf3sqIdD2+ZyJ91k=
X-Gm-Gg: ATEYQzwAulGsW0AKwxgIFl8L4DixlcUx4YM3iainv3xrj0LQv3pD+jq0c0dtD0BZUxz
	14e/TQeCvXx36cH2VYHZsUU+6f/WcrpZZYLuPJbBHjv344TyDSpVE0buw96yyeb8n6Oym7tL6j7
	wL6GyrAm9U0DoEarI6YO/nWUZVloKtIFVe6Q4gEVtYoRQUYq3PWM3KwCNTmfHvNzpZFZSgJm54i
	DIxJG9DniRLcklFhDmavqIZRXi0wF/wTkM6M1B69cCZRrbxoRHZ+h4K6+CqbFcwnzKofb8UwoFI
	IJyfPOHZXg7X7X00Qf2ZBkRluIIc6psn+3xlDeo5j/ua/S+DGmQ4kH9E5djO4Js+1QwXSN5n5vc
	6nrTIvnnJwbb+MuxgEVTW7wffZi/zG0BQ1oPy8hqrZGm6ao42sKdPIgT1a0fDBbkWVn1vyoF/UH
	NZu8Pj8THNDspPDqsbNPQrEyw4IiFnUhwmoz8HbHSQamkOUJx37aMwzIAKIpVAfvwIByMQjV0Fh
	TJq0eyf5P6I
X-Received: by 2002:a05:6870:9a23:b0:404:3cff:5153 with SMTP id 586e51a60fabf-416e3f87b6fmr3223291fac.6.1772904867159;
        Sat, 07 Mar 2026 09:34:27 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:cccf:5174:fa72:c520? ([2600:8803:e7e4:500:cccf:5174:fa72:c520])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-416e6836886sm4273135fac.16.2026.03.07.09.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Mar 2026 09:34:25 -0800 (PST)
Message-ID: <b7fdac41-4d22-4d43-996f-cd4733141cd4@baylibre.com>
Date: Sat, 7 Mar 2026 11:34:25 -0600
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] iio: adc: ti-ads7950: switch to using guard()
 notation
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20260305-ti-ads7950-facelift-v3-0-a23fdd1a079e@gmail.com>
 <20260305-ti-ads7950-facelift-v3-3-a23fdd1a079e@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260305-ti-ads7950-facelift-v3-3-a23fdd1a079e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 43C4F22D020
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32733-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.971];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,baylibre-com.20230601.gappssmtp.com:dkim,baylibre.com:mid,baylibre.com:email]
X-Rspamd-Action: no action

On 3/5/26 1:21 PM, Dmitry Torokhov wrote:
> guard() notation allows early returns when encountering errors, making
> control flow more obvious. Use it.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Reviewed-by: David Lechner <dlechner@baylibre.com>


