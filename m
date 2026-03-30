Return-Path: <linux-gpio+bounces-34420-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KElwD7lCymky7AUAu9opvQ
	(envelope-from <linux-gpio+bounces-34420-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 11:30:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A28358362
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 11:30:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 85DB630148AC
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 09:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 532623AEF34;
	Mon, 30 Mar 2026 09:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aCiEuBV+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175533876AD
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 09:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774862489; cv=none; b=hXmziwFASdmp+d02MESzb0Q8xGlAtLHrK9mmdO0ZR1f8TkK5CWnVOJlqdD+4wpx10wlbulsHK/2KRXClNWk8mbCyijoq98462b2236Gx3ufIG9aQ6/Y4SNyWbD5uMFaZ9c6fktbDMi1MeAlwKnOfPGed/2biN1vwL58GKYfadq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774862489; c=relaxed/simple;
	bh=VxPOYJVwf6EyZyJt6lk3U0Ui6f/j5xwb4no8ry80jqw=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QYfrUM9VO/r+t6n8zdWG+f/v4WXzTrZLqjCtelb04/851x8oEdNKIQIcDkqs3RD6XVXrnkgOQUCKC+l1VkRQIOW8+ffnGE+8sMHFVbrnYghy7D/V+ChQMLu68O+LuFbHJyOohIJANqUNlc5m3ExilIrMd37HycKQq0qY3pnt+iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aCiEuBV+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E22D0C2BCB1
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 09:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774862488;
	bh=VxPOYJVwf6EyZyJt6lk3U0Ui6f/j5xwb4no8ry80jqw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=aCiEuBV+3+ENWWDzluq5v/zoLiagGplH+zCM23nfeWJhDxA7TnTEzrijXbBlbojXn
	 6OHnNmfH+lUAUiBUKOr1McAivFsbouYDopRQSFzU5XEOiIceMw8SkBk/bEenft22Ki
	 yE4xIZYoCYDlyQ0blAoJ3L1LmTmKgWmfcWXlXTRbXR2JLvZ4ppFGKqlt3QeAqH1tEj
	 wi5aBAw5EHRKuEysWQU/rZLFRDyKAyGMStauHYCuQzLRFyR9ps11Gd+xXcfSoc86W+
	 TK5v9iewsRYKVe7Ck33W/T1w5/9ndI1Z2JuCdl9UaxjY/+G7ewPXsj9KM4xyvYrcgh
	 rH+ZgKLX/pDmA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a27daa652fso2962919e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 02:21:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVbFTiXvNdkgulA53q5sVf/xlOOgipFbZM12TRQDJXp6YzByFI1qt01FeZzlrmA5V7gTV0Hn5A2jLf2@vger.kernel.org
X-Gm-Message-State: AOJu0YxeA43cReD/EGdEB5+rZFvSjBZ/VIuoPNAFaToVEuAS1HGZh5G5
	FP94rot+LbDfsS8WQPLtFIyiFiHVoCLJhRSRi9R316vOu3ngPxZqZRlms/uq3mHqfwAc6WTohQ+
	vqllzj3UEdTUhTwCkTX1TeSZoVLQJVpUSqyPt9Gha2w==
X-Received: by 2002:a05:6512:a84:b0:5a2:b4c3:d88c with SMTP id
 2adb3069b0e04-5a2b4c3d88fmr1826797e87.15.1774862487634; Mon, 30 Mar 2026
 02:21:27 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 30 Mar 2026 05:21:25 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 30 Mar 2026 05:21:25 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <0A3A1E2F-0A03-46C1-A7B8-A56B4610359D@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260329-ti-ads7950-facelift-v4-0-c568c508c49a@gmail.com>
 <20260329-ti-ads7950-facelift-v4-1-c568c508c49a@gmail.com>
 <CAMRc=Mc0hMh2vL1qPo2SdKqvOKDEJaXm6rGKYeuA6mc8va2FWA@mail.gmail.com> <0A3A1E2F-0A03-46C1-A7B8-A56B4610359D@gmail.com>
Date: Mon, 30 Mar 2026 05:21:25 -0400
X-Gmail-Original-Message-ID: <CAMRc=MfpjTwAfoApOW0qGK0ww3MB5+xFDMQW6NCgOeNy-X_v6Q@mail.gmail.com>
X-Gm-Features: AQROBzB-uEEHENUOImosGkUGjVtmgQcmiD0_fsmWaDYuPh6HMHECqdjYR2whtUo
Message-ID: <CAMRc=MfpjTwAfoApOW0qGK0ww3MB5+xFDMQW6NCgOeNy-X_v6Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] iio: adc: ti-ads7950: switch to using guard() notation
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34420-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,mail.gmail.com:mid,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 46A28358362
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 30 Mar 2026 11:18:14 +0200, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> On March 30, 2026 2:15:42 AM PDT, Bartosz Golaszewski <brgl@kernel.org> wrote:
>>On Mon, 30 Mar 2026 00:47:06 +0200, Dmitry Torokhov
>><dmitry.torokhov@gmail.com> said:
>>> guard() notation allows early returns when encountering errors, making
>>> control flow more obvious. Use it.
>>>
>>> Reviewed-by: David Lechner <dlechner@baylibre.com>
>>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>>> ---
>>>  drivers/iio/adc/ti-ads7950.c | 83 +++++++++++++++++---------------------------
>>>  1 file changed, 31 insertions(+), 52 deletions(-)
>>>
>>> diff --git a/drivers/iio/adc/ti-ads7950.c b/drivers/iio/adc/ti-ads7950.c
>>> index 028acd42741f..6e9ea9cc33bf 100644
>>> --- a/drivers/iio/adc/ti-ads7950.c
>>> +++ b/drivers/iio/adc/ti-ads7950.c
>>> @@ -299,18 +299,19 @@ static irqreturn_t ti_ads7950_trigger_handler(int irq, void *p)
>>>  	struct ti_ads7950_state *st = iio_priv(indio_dev);
>>>  	int ret;
>>>
>>> -	mutex_lock(&st->slock);
>>> -	ret = spi_sync(st->spi, &st->ring_msg);
>>> -	if (ret < 0)
>>> -		goto out;
>>> -
>>> -	iio_push_to_buffers_with_ts_unaligned(indio_dev, &st->rx_buf[2],
>>> -					      sizeof(*st->rx_buf) *
>>> -					      TI_ADS7950_MAX_CHAN,
>>> -					      iio_get_time_ns(indio_dev));
>>> -
>>> -out:
>>> -	mutex_unlock(&st->slock);
>>> +	do {
>>> +		guard(mutex)(&st->slock);
>>
>>Am I missing something? Why isn't it just a:
>>
>>	scoped_guard(mutex, &st->slock) {
>>		...
>>	}
>
> Maintainer's preference. It was a scoped guard in the first iteration.
>

Fair enough, though I don't really understand that. It looks less readable this
way IMO.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

