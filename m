Return-Path: <linux-gpio+bounces-35055-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iD66BrK/2mkb6AgAu9opvQ
	(envelope-from <linux-gpio+bounces-35055-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 23:40:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C8B3E1C55
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 23:40:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AC159301C6CD
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 21:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B230838643F;
	Sat, 11 Apr 2026 21:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="QefMkVdR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3390D347C6
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 21:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775943593; cv=none; b=AkOlwiUiQBFZ+tLJMWYLiOGRehvGKxNQlUNLveavd7tdsa/FX+A/4YXP+YHX0zLMN31lWTXgmVR8OjmtkSOr8ogZpWicJRrrXEV97sA1+tutVGSZDzEKuyfoCePwGz3lIZKoYMxlRyaqqf5B2nKLb9mp3orzwMBDcTUmxtEM1WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775943593; c=relaxed/simple;
	bh=NWOEM6UHmzuwqOGsN6bDxg/kFoRuDDnEOho0JxD7gj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TQv7h+MezuytQLPkFrLwu4kHdwHvM+WGMbQD6S0XScJ6n7jVsWogRsWt0v90QU1I+xHs00jnKoZe/uQVCZRvc4N5CKsKDeNLDDccG/5ak64ZkF000I8H5xypIIXbyi5mK5ONwX879Ap9UUSnZRr9SV0EAl2c1pHpmpM1hsoyEdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=QefMkVdR; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7dbccb6ae20so1579809a34.3
        for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 14:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775943589; x=1776548389; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9K+MshAqvxCaSofC9uMUIkg4klLczZe1OyL9MVsBvF0=;
        b=QefMkVdRtoanbAxbw9zGPQXgPNXJItSf/ZA2+rEaW7TP/hMcYLW4ACFknlnGQxfwnB
         VjQAnutuAS8X6olZ8Nb4mSvjonNhyx1zqwOlq7fgLCgjxDtuAxo79+MTWP+sDHLhhTyA
         mQ9/wBynW0mZ1eFbYFesKrzfFPuQ4llvsJwy7Zpu9rNlijnwFVChhas/80p8qs+fh7Uu
         /QLn5qA0b0A8DMEsFLD3SjAGlTJhEZNGSbxzGXiNNsCBAUsRJNnz/s+ix2r8aiLdmE2X
         m1QVJmqnBWkaEaprHctxsp6ItGpRAnrUjCO7QE+HgxLEE0oujGq/LGCkOkuwYwuNRPP7
         tEbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775943589; x=1776548389;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9K+MshAqvxCaSofC9uMUIkg4klLczZe1OyL9MVsBvF0=;
        b=G6ZZylpezRy79Tq6tyMSgyPL079fwq6ef695BkRO97wAE7W87f4lkuumU0cQP5svk5
         KnnNLl0nIkffVwpvwUFl9cDC6XZOQbCmchgq+ngRcnPctcr8mwmAnGMa8340ogz07C9P
         aY1C9UV+6AHevMZBh0FxDsBlR2FHX1GsAUDE9Hj7qP3aK96r6jmdjRKAg05LL6vUxa9P
         F7u3X0dihwfhbrMArlfH8ApGMtZ8HhwSU0pVzSqm8tvM+p6UNWkqggfzLe3FUYx0pRED
         Ugc3I3IcYeQ+KAzxO5Asp9zqywCuDetwW73FEHhfFhX5KfQPRvAnM/zR7HvzqluHWe36
         H87A==
X-Forwarded-Encrypted: i=1; AJvYcCWa2novrNcGW660optISL06USi0JJ7KG/1B5dAoeeafWsDnMuVaEEieSBxWlj5Z0L2kJoTxqZmsRNRI@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8GAeMblrlP0i0qZVDv829Qu9YXCBo4vS8gc2+NOLASFkP7Dp5
	gxQHR4grHpBM10VPPEjzSwTF6cGtAEw7BrkzAO0xIHMmQ9cFxp+qO76e9Na3VNk1HTM=
X-Gm-Gg: AeBDiev6hzEezVXrV8g2jqewSnRN+sTVNO9urXTi7IQIBnxalSN6pklXJ2fXXIEF1+f
	qbJ0Bxy527ldYxZAHDaqbDO2LKx9WW0QpeNjiNdekqTAshZtMEj56Sq+NSwvCiZ9g/mNQUTMD2Y
	fR8o/H/Kk9IfdPazCVXNzg5Ch1aLJKZ5rJw4Hx/i0trFJ4+VLFCBtoewj00mIgWRI6wM+Z+V5os
	pFraV8TVdMDLYbMhqZrWkqVqBfxfjM4wd1CGr9jaTV78rWccUDWx/SIrK107udw1VuVI13M4HRa
	g/FDLcQiVSWlqKu3Agxit6z7AvvyOP90Vg7fOmhiP9q1XCizw0lsU/Tga4LdYoj1WSn1y7kr9hg
	/SakToD0c8966dVtrdnQnHX+/OMqafaiurlT4p7GgGmAG/TAZiP8EdV2plux0myvbEs62O+XaP9
	/pSzKx3u2p6jz56BgyUT383Wzy/LaipHanAXWhEJSS8nJUZnrkx0BA/3cUIHqyIXZyHmE5Qh+JL
	Q==
X-Received: by 2002:a05:6830:6504:b0:7d7:dfc6:e1d1 with SMTP id 46e09a7af769-7dc27d87a0cmr4926413a34.3.1775943589245;
        Sat, 11 Apr 2026 14:39:49 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:d2e5:c81c:5b23:fe55? ([2600:8803:e7e4:500:d2e5:c81c:5b23:fe55])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dc269402b9sm4706635a34.20.2026.04.11.14.39.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Apr 2026 14:39:48 -0700 (PDT)
Message-ID: <347859e1-fd6a-4b4b-a1d1-3e29a46be49e@baylibre.com>
Date: Sat, 11 Apr 2026 16:39:47 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] ti-ads7950: fix gpio handling and facelift
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260405-ti-ads7950-facelift-v5-0-1f980ed3cf9e@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260405-ti-ads7950-facelift-v5-0-1f980ed3cf9e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35055-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 84C8B3E1C55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/5/26 11:39 PM, Dmitry Torokhov wrote:
> The original reason for this series is to make sure ti_ads7950_get()
> returns result in range [0, 1] or a negative error code to comply with
> gpiolib requirement.
> 
> During review David noticed the fact that the function also clobbers
> gpio state. Fixing that lead to adding cleanups using guard() and devm.
> 
Tested-by: David Lechner <dlechner@baylibre.com>


