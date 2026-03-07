Return-Path: <linux-gpio+bounces-32736-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFBuNVllrGlepQEAu9opvQ
	(envelope-from <linux-gpio+bounces-32736-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 18:50:17 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 773B122D136
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 18:50:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 66462300AC8F
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Mar 2026 17:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 519F5350282;
	Sat,  7 Mar 2026 17:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Ma6B7tsh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC0C34A3C5
	for <linux-gpio@vger.kernel.org>; Sat,  7 Mar 2026 17:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772905814; cv=none; b=Hsd9eKOK8XvP5BVLT01VcqmgCUUyMDFQEXMCQAof18wKzS7ixE47BpTnIoyMALzdZ1iYSHyqElWj5KFa22iGfzzrdnBegkh+xJat0Hz5pyKR/5LopgAxLKtAPS7kBKiMDsgVboygM9+uVBDGPywUl8JzcF4BohLpVULDaBeZeTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772905814; c=relaxed/simple;
	bh=OM35lNL8y4dTOttjAl+zrKtVY+w0bPN8rPegJ3JLMd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=buo+axX8WpSD/9wEv0zPokAPamRFD9Zxr+O6sg8xpyHgLQEZpGYV+Irc6zhT6aKywzfkb913SxuQpkvIz1lDP1EixacWkQqprm6uFWYTxJl4iXZKQRtie1oQb0F89pTrhfrozZHFH9SxTZomYnFR21z26LIb5tPNIwxTqiUvBJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Ma6B7tsh; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7d73be007a1so579815a34.0
        for <linux-gpio@vger.kernel.org>; Sat, 07 Mar 2026 09:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772905811; x=1773510611; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wN2wDKo538EzzNi+QhSobeJKRBkoN6TcqCNOv+Ri41Q=;
        b=Ma6B7tshuF54EZbJ25CGfJFu5uQIBi9DvpukBU7sE4gwUGTzUNGp8zvH6mowoT6tdd
         kug8pbQqbHoNTkCeg0RSUZOo9umlJoAmLMfD+WKPjrnF209i2vu9rcCzS2/IwN5N8/BH
         gPOffvF/5m/bJdZvEslk4DGhx33IW43DYx63eMW3jFp7Xueh0I1M2G4MEtZxmMPzMXwa
         BewzejVMY0eWS0fy86BUmZQP1c4JUwHswi1sUjYJ541dh1fBgPdJBfiJaLD+TQXXZhbd
         +GgvqFrnT1jm7ZHXZqtT7KGD2izWJXdSQI0I6JhfJVntvzwcE6BOzct7xJ416pYgARjZ
         T5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772905811; x=1773510611;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wN2wDKo538EzzNi+QhSobeJKRBkoN6TcqCNOv+Ri41Q=;
        b=X7XV5mpFxaBeJe/IWZ8Z6aV/GP7snlz+ap/NfZJ1FyuQtaNcbZwkMEwGIF68m10gdv
         kVTS3eEl4WB0Zb20X4n1WPgTECNV0oEITjLDYuE//KP9R9DsKH+vaRyRrNlNeEXnrdor
         ZJ1joTNG8DNiZjooAuO2t97iCgeVdKFtcznqQOu2f1VvZC7dqrgEgyyL6U2dYe5/5oZt
         UaCu+BCJd7dnU1rUEsAPqtmd/kwwdOt4+CX6e1o0OF7VzfRbugPiX9h1MS9f/nHTGdg+
         m/WUmo9cWvlNif7IGen902sVOx+yjNb3svKCcFNkvonIKiR2ioorLUl+6Ed6qdPbKhfx
         sFlA==
X-Forwarded-Encrypted: i=1; AJvYcCVJsnvLHwCq7J4/Vzm5myzZfa7EqEiefrzWI0Z6yi0DMwQz11cSezZ4yygJ34wUDHBSRZQsc8pQq7sI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2AXoP6m0pNBSdV+ibY9y4VyqU9/oQFeJwmUWnzgQxJa8qMx7P
	k2zmEdwmoVGE78SI78t1BqeUuOXa+uCuuHrXzeoXDH/SSBYjMJJ5+eug8VLkVuJ2CZA=
X-Gm-Gg: ATEYQzy9e9b7KW94M1bxUKaJIwGUQHWngeuqNd0TqQlf9QYXsAJ6Y4IhiEV3ruyEYik
	8bvIrDSGbMEY8snLBmrEt3cM9zHTXOyeF6EufLw9oUoT8gU+bm94iFUdzbpQ/IcS2fgUnoUX6um
	pcTMVOKa59ctrScPzxmntAy4HpIg0Ux4eLKJl3ZTIfMNsFp6tBArHOfC8mW2PSHbC25cgT72ryE
	ri1w/razSzI8XXncps06byt8tUzf8SDsff7KHJb9MRANqeUtBNRBT+ECmptT8C52aiHweZicvup
	wl2RpfRlYihCfVcNSNrrpuTMplzk4OZEqabcWSxZEyQScXrRVu5tGwaeb72F0QI9UTnDAG9Dmuy
	CHwaXs5EQHNw1kZz+6XhWHBM7sNyVGSl7s/z2vi6xZTJz6mqOuvhNCAndMkx7CMlfXuTDGhqofb
	9SmSlRfF4bVO5mL40790gE7YTYVgfBYPwM1fOtB/Ui86kDOhq2goEVhgxscqscc6QjkDVnLuH1v
	WVsaXq7sQyk
X-Received: by 2002:a05:6830:6887:b0:7c7:6043:dd8f with SMTP id 46e09a7af769-7d726f631bdmr4097301a34.15.1772905810883;
        Sat, 07 Mar 2026 09:50:10 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:cccf:5174:fa72:c520? ([2600:8803:e7e4:500:cccf:5174:fa72:c520])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d7423ff0c0sm171636a34.27.2026.03.07.09.50.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Mar 2026 09:50:10 -0800 (PST)
Message-ID: <ebee83e2-888a-4338-ab5c-5c75caf57318@baylibre.com>
Date: Sat, 7 Mar 2026 11:50:09 -0600
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] iio: adc: ti-ads7950: complete conversion to using
 managed resources
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20260305-ti-ads7950-facelift-v3-0-a23fdd1a079e@gmail.com>
 <20260305-ti-ads7950-facelift-v3-6-a23fdd1a079e@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260305-ti-ads7950-facelift-v3-6-a23fdd1a079e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 773B122D136
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32736-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.973];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:mid,baylibre.com:email,baylibre-com.20230601.gappssmtp.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 3/5/26 1:21 PM, Dmitry Torokhov wrote:
> All resources that the driver needs have managed API now. Switch to
> using them to make code clearer and drop ti_ads7950_remove().
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

...

> @@ -577,26 +575,22 @@ static int ti_ads7950_probe(struct spi_device *spi)
>  	else
>  		st->vref_mv = ret / 1000;
>  
> -	mutex_init(&st->slock);

With this accidental removal fixed:

Reviewed-by: David Lechner <dlechner@baylibre.com>


