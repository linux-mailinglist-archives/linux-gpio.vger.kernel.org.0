Return-Path: <linux-gpio+bounces-32001-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KUlLZd3m2mzzwMAu9opvQ
	(envelope-from <linux-gpio+bounces-32001-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Feb 2026 22:39:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 583A71707B7
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Feb 2026 22:39:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D61BE300EFAE
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Feb 2026 21:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D4F035C18D;
	Sun, 22 Feb 2026 21:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yn1tevL3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D097335B645
	for <linux-gpio@vger.kernel.org>; Sun, 22 Feb 2026 21:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771796362; cv=none; b=PF3OtYceXP2DrUeY02DNenFy/3Y8oISGJibIaslqdHi/Okr7yR2KNjBm9lSBmM8XJLkgnlCFZ2w+RdD/vrQSz5rCSKX5NZRKzMpZh9nBLt5ZkGi2BMH8VUcPnprQIgGpUqowkWxCohkEVKv0S35PqDNs0uGDwaZTSLjsz0iF/OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771796362; c=relaxed/simple;
	bh=HzrKTPvXlTJ+y/nQ94Q31CSXj4sSzxZ6mrkMBtYDf+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eziO/gB67cluaZn14skDMp8PEBHcxzt+1npf7HwWqOpme7CzNRED/T55vplmVNQg2DZNCU3tju60vjHGw1i5UfaIdJpOodYoQkojWU9NYjUzoCn0VkFiHNml3W/mr08kabdnogBd58aHm8F71r2WmqEXvYoUuTeQW1063dGN7YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yn1tevL3; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12732165d1eso3950089c88.1
        for <linux-gpio@vger.kernel.org>; Sun, 22 Feb 2026 13:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771796361; x=1772401161; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B+Ki2+Wg/SQ/F2z698NW70nywxyMc5k+gAsNO7ctLsc=;
        b=Yn1tevL3/wwuJVuLOU8KBiAHXeacUF1Pa3/X6DooDGcqPDV+zOWho+JvRKNFrt5Vu9
         WeP/edmf9Ln66n/0N1PpE5cMrqp2M8/BLCwgZBgAde9OqVi7MRSlNpw5ekyeZi+5yBvx
         3MF+gAYrXAkNu8LuSWf4Lem6jbtzQWO3kOBP+jTdf2jQE2Xi4Ts2acLKkjN9+WJkbwm0
         9ZMEVUNgPEmOUiOMl0exU5liEQIW400ML9z0mGIJCEdUzAoAoCJHUzS+RFDeQbIAgH8F
         Zlr9pAYfqgtOwi3SNK6DbwBY4jI/x9BFxQtBEV5a5oRqDMUkxjctH/QG2f0e+ke3DkdE
         821Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771796361; x=1772401161;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B+Ki2+Wg/SQ/F2z698NW70nywxyMc5k+gAsNO7ctLsc=;
        b=Css0tL8+FMIJ2BLpw5MChJd4nQ8JGefvFI4DKDkYSf5lV8MTEiCRW3Cc6DDSwzB1Uo
         anzMxXmw5dFPJ00ptYtECqV3xdK3rL/q4+g+o9yR/HLmJ8GJt2wOgUGFPUhCks8k1M3m
         mnVJ4VyxfEHS1ibLJKT7pir481d6ViFVrKhHHV2Yd82YFLGmUikI9ewY989bh0DUE3JV
         ttJBGDfqqqrLHQbcHRg325qcapiwpKcKxap6mAgtwp42h0bm230SfLf6GGtDcGtu3Skv
         sfoJJI5ac9l/gbX+gYV6+7wSR6Cm1rHCqkWs13uyLFxCOitxJDo4H4clEVjokBkG9qfV
         SVuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJ2h2fawyy6Ru0hb2S4qNQVkS7iFezS4LwcDwgcRZ2T+iZRRpIcRHixczUZFlP2wv+W+2ww7h3B/hu@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq3j3wJimlF/YUGsG7CrKxJ2y2s2WLwHWDeJ1YRImvIkaHePqE
	nPsEc1XPH5S0s0HNC9/cUj2wRNToFgCGOL5re/6mhrswM0XEU3hwCs3G
X-Gm-Gg: AZuq6aKlJWIYRX0y+d27giINLHBPeA8sF2FKp9ESZcESPsnkJlmc+E+EQpKmPB6qSQ9
	eLxQv/p8NzZ/ooJYHa55l4OxuuPXyan8ggvHMQcW7DeUR/hLGWXqzH9/UphpRsrD4s4gO22AHhc
	OGSwAEx5LcskZ39VWXyQBZO9o3dFVTxmp9NLt5xyhshfnO/MvTUAXvCbiK8weYrt+qEKPCPKMJx
	oMn+12+pmDNVcVyn7oLaelK43RnXyvZ+DVxPHLrBvElnRxd7AS4sCA/OmpF+xQXHvr5xIdjEQuz
	+JYIJUihOGAOCtS8502bnmEJ/vuQZn8l/R9J7nhFBdb4v+lC5j55Qgj7+JsznVR4+zJGqH7WQ0e
	awV5ODyrZsz6gU+sw1fnPkOc8tdRpxzoNbcJ0yS6PzxNpWkiwpxGAVanfiIwlb3P07MxI19thU+
	FvNUAReARUu2Cn2BdrFXabPrVA8wO6EYaylYJuS8ugnQZdriFXKMX/a/6mGV3a9yo=
X-Received: by 2002:a05:7022:608e:b0:11a:61df:252a with SMTP id a92af1059eb24-1276acda11dmr3017797c88.6.1771796360879;
        Sun, 22 Feb 2026 13:39:20 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c6c:6cca:170e:c77b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af8c936sm6588341c88.14.2026.02.22.13.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 13:39:20 -0800 (PST)
Date: Sun, 22 Feb 2026 13:39:17 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 4/4] iio: adc: ti-ads7950: complete conversion to
 using managed resources
Message-ID: <aZt3FRfuZEWrvQsO@google.com>
References: <20260219022929.3558081-1-dmitry.torokhov@gmail.com>
 <20260219022929.3558081-5-dmitry.torokhov@gmail.com>
 <20260222140923.10bd9b7a@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260222140923.10bd9b7a@jic23-huawei>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32001-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 583A71707B7
X-Rspamd-Action: no action

On Sun, Feb 22, 2026 at 02:09:23PM +0000, Jonathan Cameron wrote:
> On Wed, 18 Feb 2026 18:29:28 -0800
> Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> 
> > All resources that the driver needs have managed API now. Switch to
> > using them to make code clearer and drop ti_ads7950_remove().
> > 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> Hi Dmitry
> 
> One additional comment from me.
> 
> >  static int ti_ads7950_probe(struct spi_device *spi)
> >  {
> 
> >  	indio_dev = devm_iio_device_alloc(&spi->dev, sizeof(*st));
> > @@ -598,36 +605,36 @@ static int ti_ads7950_probe(struct spi_device *spi)
> >  	mutex_init(&st->slock);
> >  
> >  	st->reg = devm_regulator_get(&spi->dev, "vref");
> > -	if (IS_ERR(st->reg)) {
> > -		ret = dev_err_probe(&spi->dev, PTR_ERR(st->reg),
> > +	error = PTR_ERR_OR_ZERO(st->reg);
> 
> To me this reads worse than original IS_ERR() / PTR_ERR() pair.

OK, I'll keep that in mind. It is no longer there anyways after
converting to devm_regulator_get_enable_read_voltage() that David
suggested.

Thanks.

-- 
Dmitry

