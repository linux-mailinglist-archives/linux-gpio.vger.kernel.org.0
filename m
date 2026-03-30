Return-Path: <linux-gpio+bounces-34418-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGo4ET9Bymky7AUAu9opvQ
	(envelope-from <linux-gpio+bounces-34418-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 11:24:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0F23581C1
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 11:24:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 43EBB3050EC9
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 09:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACB5F3B2FCC;
	Mon, 30 Mar 2026 09:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FU1XxFj2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501D3393DFF
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 09:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774862300; cv=none; b=oHIHbAQFKjh9mu7dp8fk7mWu14eY6eWqg3biqSVGU/B4qjcb2x2z9BNW6Gwlh0H/NKo0zLescLABgk3jRn4VRir0sliNQZep2kT0Bvt6kqvklGyeM6AQ8q1aGN3Fn+51aThlD4SeTsh5fQ2QhOCAvI5wggm/172lWDHuDZJBiIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774862300; c=relaxed/simple;
	bh=M4bWTGLnCLaO+TO/85lAruv89fU7oLMOasdBJRCH6vY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=sKTRbdO/ibUGMgCIgWWze+noTbvj6PZQ+2MHt4DFGG5TXL8ll3reaUH2NVy15qgcnY740XlcrdbIY5mJ42aAHqNewXdfH61CmpG3zyK/6YK9u3P6PzyWxKDjwusi7oPoTysjYVxxJXoNSXz6qYoTPOTzSQb8N69BFnxiqNp0m24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FU1XxFj2; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2b6b0500e06so5509476eec.1
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 02:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774862298; x=1775467098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7pksNBDBw8CfIH5nUCqG+cUSF8B7PMFDRBSVThR3J7Q=;
        b=FU1XxFj2gLcILmP/wBxWKAl1cSyTsLw+NuYyjVKo6mzpmdcnljqAzTDePU301fnWPK
         mWXojTEWXlcFJ7+RBae4qKvH8zVtT+HsrobMxZWdzuqSKWboJ8ODbsErvr+O8MuwP0YK
         mQCHeRIzO+Q90rrmwY4snBS2mioI0ePn1gsz5bjc3K+pbek3WFmpWPgmf/LpKewXSz0i
         uq8aHTT/7h0N9yKBPax8IX4Q2AjW/0WhjE5bpXrlnnU85hLP7rfdhqoZWjMTS8c6HwSg
         /DPH6or3IOtJ/8qhdeKOugTSaHAMFWvTNudsKvRzTr7uhMR3Ykt78wAEwRfCdFdjQs5w
         3iOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774862298; x=1775467098;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7pksNBDBw8CfIH5nUCqG+cUSF8B7PMFDRBSVThR3J7Q=;
        b=DpE1H2eOvMPJXJMDmHYQebaveUrKvtORofpmWN3Ajw4Dm/ptvqs1Mr/g68clyrxum2
         x8nHgqJNiM5HULpwP+IlQ2KuBnCIK8BMOBIViJYC31My86AevBrEQBnJq3S6QgXxMIYj
         okvmhED6Kgsi8MNyTpTkUsh0H85lWtjalMZuRY2axwVmQc0zA1+89nIyk8ev92GDQVup
         3ZEiMpm8Owst7qSjgdu2KPaBmUUYOb8UDh0fbJMTtepPjSjDXYviG97k+Yh3d2qFxKAh
         4D7/l5XJKFb5GZuch5i7FyL1TWvDpn49NFW+KumUO0JiKDePa0I+nw1tNNLQYSljJyib
         ua3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXKJ6mYDM/q/uKJO2oXxfLvv18bgKGeplm6HRTfWXrR6Joc6niuoF95F+biDH96ve2ktQTygi7wb+EM@vger.kernel.org
X-Gm-Message-State: AOJu0YwMc8OJqZ8bTgO/V49/E59OHL5jp0jzc7gOgQovXnl6I4+xw9sE
	VI2OukWhFGmQRu5Zegyk2vtKYhlPEoNKWNkYQ5aiX+s1Mc7v9sYlwjLv
X-Gm-Gg: ATEYQzxcdPRlQ4P52MEuGkF/xv6BZbERzvGt2wGsWlfVT1K3BCqB03PqXrIdpt6zg7W
	uALMNitbF9uGE/7L9IUN0PIETDz8fx7osNUORPnG0Soct+VNPKAesMVBnWjAxv9Gp547AWydT1q
	in/Zuck/5RkyW3Btb9TaWYeGNF6drwci7koRWz2a8SIhed/nVkqayYpJ9bUmr2Rse1Dz7dyhHZP
	0IP7wUggJHKU37QyU0Qmc2NAiWmK4LOQeM5+3ayOQpjzqIUwwep90rCQ36636FLsWeST+TwrcZY
	6PT3d/QbA8syUI16d5ihhbjIq9kzQQoqb3C6pIVp87Y9L2sNQFarIwLIgaxyQ3UynTalIZmUo3/
	zR0q7yigkEvEvw0MZfFMWHADO3Hp8JNwOdxIi21d9+8yVKhhvgTkmXCYS95/AwP1P/GMIvQDa5p
	roPG0nIN8Bct3/tVFhNgBPM+560GjMnr45UCsJ8gJ1Wv8=
X-Received: by 2002:a05:7300:3215:b0:2c5:9595:661b with SMTP id 5a478bee46e88-2c595956c37mr2016783eec.0.1774862298269;
        Mon, 30 Mar 2026 02:18:18 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2601:647:5e00:4acd:93d2:64c6:bab4:293d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c6e9c088sm6473690eec.21.2026.03.30.02.18.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:18:17 -0700 (PDT)
Date: Mon, 30 Mar 2026 02:18:14 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
CC: =?ISO-8859-1?Q?Nuno_S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_1/4=5D_iio=3A_adc=3A_ti-ads7?=
 =?US-ASCII?Q?950=3A_switch_to_using_guard=28=29_notation?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAMRc=Mc0hMh2vL1qPo2SdKqvOKDEJaXm6rGKYeuA6mc8va2FWA@mail.gmail.com>
References: <20260329-ti-ads7950-facelift-v4-0-c568c508c49a@gmail.com> <20260329-ti-ads7950-facelift-v4-1-c568c508c49a@gmail.com> <CAMRc=Mc0hMh2vL1qPo2SdKqvOKDEJaXm6rGKYeuA6mc8va2FWA@mail.gmail.com>
Message-ID: <0A3A1E2F-0A03-46C1-A7B8-A56B4610359D@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.96 / 15.00];
	SUBJ_EXCESS_QP(1.20)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-34418-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email]
X-Rspamd-Queue-Id: EF0F23581C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On March 30, 2026 2:15:42 AM PDT, Bartosz Golaszewski <brgl@kernel=2Eorg> w=
rote:
>On Mon, 30 Mar 2026 00:47:06 +0200, Dmitry Torokhov
><dmitry=2Etorokhov@gmail=2Ecom> said:
>> guard() notation allows early returns when encountering errors, making
>> control flow more obvious=2E Use it=2E
>>
>> Reviewed-by: David Lechner <dlechner@baylibre=2Ecom>
>> Signed-off-by: Dmitry Torokhov <dmitry=2Etorokhov@gmail=2Ecom>
>> ---
>>  drivers/iio/adc/ti-ads7950=2Ec | 83 +++++++++++++++++-----------------=
----------
>>  1 file changed, 31 insertions(+), 52 deletions(-)
>>
>> diff --git a/drivers/iio/adc/ti-ads7950=2Ec b/drivers/iio/adc/ti-ads795=
0=2Ec
>> index 028acd42741f=2E=2E6e9ea9cc33bf 100644
>> --- a/drivers/iio/adc/ti-ads7950=2Ec
>> +++ b/drivers/iio/adc/ti-ads7950=2Ec
>> @@ -299,18 +299,19 @@ static irqreturn_t ti_ads7950_trigger_handler(int=
 irq, void *p)
>>  	struct ti_ads7950_state *st =3D iio_priv(indio_dev);
>>  	int ret;
>>
>> -	mutex_lock(&st->slock);
>> -	ret =3D spi_sync(st->spi, &st->ring_msg);
>> -	if (ret < 0)
>> -		goto out;
>> -
>> -	iio_push_to_buffers_with_ts_unaligned(indio_dev, &st->rx_buf[2],
>> -					      sizeof(*st->rx_buf) *
>> -					      TI_ADS7950_MAX_CHAN,
>> -					      iio_get_time_ns(indio_dev));
>> -
>> -out:
>> -	mutex_unlock(&st->slock);
>> +	do {
>> +		guard(mutex)(&st->slock);
>
>Am I missing something? Why isn't it just a:
>
>	scoped_guard(mutex, &st->slock) {
>		=2E=2E=2E
>	}

Maintainer's preference=2E It was a scoped guard in the first iteration=2E=
=20

Thanks=2E=20

--=20
Dmitry

