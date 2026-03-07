Return-Path: <linux-gpio+bounces-32737-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDycN7lorGnPpQEAu9opvQ
	(envelope-from <linux-gpio+bounces-32737-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 19:04:41 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAA022D1F3
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 19:04:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 48D82301624F
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Mar 2026 18:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 608A036A01F;
	Sat,  7 Mar 2026 18:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iXoDenpx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF333491C4
	for <linux-gpio@vger.kernel.org>; Sat,  7 Mar 2026 18:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772906679; cv=none; b=JeWRtVd5I3eFrIVxJwo0YRzfn4OMVsOylF3rVx2o36YUjsI2O5U4kqRXn4oEo6y925a6bLRj6JcI+TkoLoWVVPCpJUov/kToJ4H56nU9tmWXQK1QvDDIzR1qvBDQPKAoqrjilHi6UYXd1uyg1LWiycMvRC4K/MjiHAJNtaT0yCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772906679; c=relaxed/simple;
	bh=PIWAY6q+ap1EOwu7fIbVwLp8hf3bGvW1uAse7EGNdcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YNnUmojosl+WawQ7jW2rzO9iRxqsXdVFAzccvUGwx1tzMjGxkO7EMHTLXAWWbqqWNYdMXE5NctYw3arQBFH5ANgECBQqGi8WulzZXyF1rQEu9frP1qS6wELoSWtvOSLruF+w33uDsS3ZdI83bg789yvXbLT6nMzdG1nEKqV/rpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iXoDenpx; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso9588790eec.1
        for <linux-gpio@vger.kernel.org>; Sat, 07 Mar 2026 10:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772906677; x=1773511477; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tEdYN3jRsyLYGUSSW785KXgJq2PqLPyTq0Ql+kXv6qQ=;
        b=iXoDenpxVoVaQbcM/AOdxdMgRYE039Pjeorv7bpY6xr/NcyzQOgsWYAYvTuTIDbPes
         N9MskFnJeYAeUOTgbWxfUEZ4IyFLRkWtvk7ic+3Ji3+Do2OoXj+xJDTep0r4nZcvs3t0
         HVPYLVgGY4HYggrvfe15PR3Fk+1zqKzJoVYF+oEDvJPwsiHVvno2Vrod2ff1q8tQkPEC
         FzEwDorj1VpCQfPAs+qslkfG7dqkMIVnaOOXMJ2VXkVQHkaddrfru1MToDlMn1BXVF6Q
         9UfwrkyV1VwTClh8lMC90LgqQJ4Aepd75oeVAPuYVbR52pXs+45hefhSq9/yCfFznXCs
         OLdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772906677; x=1773511477;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tEdYN3jRsyLYGUSSW785KXgJq2PqLPyTq0Ql+kXv6qQ=;
        b=kO6mptfPciB44wpvVuzw+06A6YgihPj2/x7P6LmQ5VTu9kwdvdkud+LmFu+K1lkYFD
         tByxJ+y8gE2l7qMYQH6sXxyARG/gADpqDVRurSTm5QPzxQT6xvr8JBvPWCTReCUDt1kh
         /ohoeEWOpDC1yYb/HEorBXd26P7D6v3aWyQ8qAoe8jcorsVUpeIxoDIweuOlln6lgSOn
         g+vJXMIL/UQmsfrOIbTl7oNqwfp5tV7XftdZdWFHtt9/F09yrLgIlxM95ZFG9YBwwBFz
         MB5muM39GTu+kKXGCGNP12yCdrYLpVozPzgUQlB6qj6mXHVTOoMzja9+nRrd9MXPOKRH
         5ewA==
X-Forwarded-Encrypted: i=1; AJvYcCUSr/Bbhvtt5ynEzTk8kxeZSTyDypsnDWji0ekW4+K78jah0keAWaVTrkWIP5ivXYaGCVy2oN3HizmX@vger.kernel.org
X-Gm-Message-State: AOJu0YxytCnCv3fGlq8Z/56x+VsLycWP6bPf0jewx5mvFRMKvUKOEoZb
	mEcOhwD1sKIoxfWm2lyht8rLPWAVVWOgVGtH7w+xYCh+mdmKO4c4/CEG
X-Gm-Gg: ATEYQzzANjripwbUpoqj1+csDhL7k6ttf9HwpXWi0BokeffYA62u+b5j1QqMoTwMk1V
	VjdT3WyEM6LMJRZaElE8YLC2DTHF8NtBIG7X66ApUXesHWI5NWoTiOA7wUjAHUZVosH0C91WWNZ
	R1P/9EiN9MviY9n4FCRfSKo7DHmQ/VarZcBpo1eNmabqykqmiKy5FX4RklcFF151kwOmaejN/xA
	nkDhOktzabuI2TPKYv5P9wFp5mcyW7B/WlkRSIsFDO8VN+J5gskDAOTXldoGrNsyGvF6RMmHjVo
	QgtUj4fOIoVnZcL50P5LO3QfsbShnxqP6V4iHkkAC+CeuEirncsCHmVymJfJSFeJGsrvaZpdsAd
	r6S10ROoGNwNBnL38IiDSLNKmbPbPPP0TkG4TLrCh0OuDjVYlrK21ujEV4O01qPUwdBpfVyPgxx
	dbzbwt9IhTvI4NQBrnzvAKfcCOe0SCRDWQ
X-Received: by 2002:a05:7301:4188:b0:2be:e4b:60bc with SMTP id 5a478bee46e88-2be4dfee268mr2231460eec.9.1772906677079;
        Sat, 07 Mar 2026 10:04:37 -0800 (PST)
Received: from google.com ([2601:647:5e00:4acd:6ebb:c69c:ad7e:23c9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f948324sm4383540eec.17.2026.03.07.10.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 10:04:36 -0800 (PST)
Date: Sat, 7 Mar 2026 18:04:33 +0000
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: David Lechner <dlechner@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v3 5/6] iio: adc: ti-ads7950: switch to using
 devm_regulator_get_enable_read_voltage()
Message-ID: <aaxoIWL7NIa-2VkU@google.com>
References: <20260305-ti-ads7950-facelift-v3-0-a23fdd1a079e@gmail.com>
 <20260305-ti-ads7950-facelift-v3-5-a23fdd1a079e@gmail.com>
 <20260307114947.0b946dfb@jic23-huawei>
 <27ffa24d-a388-46eb-8df7-04624cd32ea1@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27ffa24d-a388-46eb-8df7-04624cd32ea1@baylibre.com>
X-Rspamd-Queue-Id: 5EAA022D1F3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32737-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.853];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Sat, Mar 07, 2026 at 11:43:32AM -0600, David Lechner wrote:
> On 3/7/26 5:49 AM, Jonathan Cameron wrote:
> > On Thu, 05 Mar 2026 11:21:56 -0800
> > Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> > 
> >> The regulator is enabled for the entire time the driver is bound to the
> >> device, and we only need to access it to fetch voltage, which can be
> >> done at probe time.
> >>
> >> Switch to using devm_regulator_get_enable_read_voltage() which
> >> simplifies probing and unbinding code.
> >>
> >> Suggested-by: David Lechner <dlechner@baylibre.com>
> >> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Hi.
> > 
> > I think this broke the ACPI case (where regulator isn't available).

Oh, you're right.

> > 
> > Jonathan
> > 
> >> ---
> >>  drivers/iio/adc/ti-ads7950.c | 45 +++++++++++---------------------------------
> >>  1 file changed, 11 insertions(+), 34 deletions(-)
> >>
> >> diff --git a/drivers/iio/adc/ti-ads7950.c b/drivers/iio/adc/ti-ads7950.c
> >> index 273c35e03185..847e83baa876 100644
> >> --- a/drivers/iio/adc/ti-ads7950.c
> >> +++ b/drivers/iio/adc/ti-ads7950.c
> >> @@ -341,19 +341,9 @@ static int ti_ads7950_scan_direct(struct iio_dev *indio_dev, unsigned int ch)
> >>  	return st->single_rx;
> >>  }
> >>  
> >> -static int ti_ads7950_get_range(struct ti_ads7950_state *st)
> >> +static unsigned int ti_ads7950_get_range(struct ti_ads7950_state *st)
> >>  {
> >> -	int vref;
> >> -
> >> -	if (st->vref_mv) {
> >> -		vref = st->vref_mv;
> >> -	} else {
> >> -		vref = regulator_get_voltage(st->reg);
> >> -		if (vref < 0)
> >> -			return vref;
> >> -
> >> -		vref /= 1000;
> >> -	}
> >> +	unsigned int vref = st->vref_mv;
> >>  
> >>  	if (st->cmd_settings_bitmask & TI_ADS7950_CR_RANGE_5V)
> >>  		vref *= 2;
> >> @@ -382,11 +372,7 @@ static int ti_ads7950_read_raw(struct iio_dev *indio_dev,
> >>  
> >>  		return IIO_VAL_INT;
> >>  	case IIO_CHAN_INFO_SCALE:
> >> -		ret = ti_ads7950_get_range(st);
> >> -		if (ret < 0)
> >> -			return ret;
> >> -
> >> -		*val = ret;
> >> +		*val = ti_ads7950_get_range(st);
> >>  		*val2 = (1 << chan->scan_type.realbits) - 1;
> >>  
> >>  		return IIO_VAL_FRACTIONAL;
> >> @@ -580,30 +566,24 @@ static int ti_ads7950_probe(struct spi_device *spi)
> >>  	spi_message_init_with_transfers(&st->scan_single_msg,
> >>  					st->scan_single_xfer, 3);
> >>  
> >> +	ret = devm_regulator_get_enable_read_voltage(&spi->dev, "vref");
> >> +	if (ret < 0)
> > 
> > I think you need to check for -ENODEV and if you see than then
> > see if the acpi route below applies.  Otherwise on ACPI this will fail
> > and we'll fail the probe.
> > 
> 
> Or do something like:
> 
> 	if (ACPI_COMPANION(&spi->dev)) {
> 		ret = devm_regulator_get_enable(&spi->dev, "vref");
> 		if (ret)
> 			return dev_err_probe(&spi->dev, ret,
> 					     "Failed to get regulator \"vref\"\n");
> 
>  		st->vref_mv = TI_ADS7950_VA_MV_ACPI_DEFAULT;

We know that concept of regulators is not exposed on ACPI systems, and
we'd get a dummy here, so maybe just store st->vref_mv and not bother
with acquiring and enabling the dummy regulator?

Thanks.

-- 
Dmitry

