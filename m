Return-Path: <linux-gpio+bounces-32000-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKwkAwx3m2mnzwMAu9opvQ
	(envelope-from <linux-gpio+bounces-32000-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Feb 2026 22:37:16 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A114B17076D
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Feb 2026 22:37:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D93223007501
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Feb 2026 21:37:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8020E35BDA4;
	Sun, 22 Feb 2026 21:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EEOTtyc8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A334035BDD9
	for <linux-gpio@vger.kernel.org>; Sun, 22 Feb 2026 21:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771796233; cv=none; b=fBjUb1lepUPhE8t964IizVuh7QHRnmJ3keO/97RWS6nkU54SpDrY7Ef+hQN2m9JGr6AH3MZfnX10slN9RPnmsSqikYoHwVyLUhmqxAms74c0Lr92SVBJ4DY2GYQxl4muvzGtwlBy7Nrh5MeE8JhuuFx6Je2DCH7bCOoxvMNYGTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771796233; c=relaxed/simple;
	bh=j6w1ZqKBSf98wkhfIbCweFEmRiSxHNsz6skq7q2g9vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=soQAP9NbS+hil3C7jU4wWUK89x077D/njO7YohqGttGHSUGicujvAb0muqtzxC7sLqj4GSCX1I+BrEoMEVaZjD1bLQKonTWdR3aD727i0iIxxvI7egxYzlwDfalvikZLCwKwoOia+sgU64Ur7ZDhrgITfESxMj1CZAp2GPALpJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EEOTtyc8; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1271195d2a7so3673723c88.0
        for <linux-gpio@vger.kernel.org>; Sun, 22 Feb 2026 13:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771796230; x=1772401030; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b4mMM5qE+qxfR6dazqNKHp062hw1pJNzveR355ArO0Y=;
        b=EEOTtyc8x3XnfA0xsSJCeW30y0ltev2Nt9gUV2kFoUTuagnigV1coM0yEsmPAGwGdG
         obpXlaVptmt0pCNp25/donCpllSkM1+IQtGnpSty/s0udjoRmHiStWqAsEAeQTanYRX/
         LctqezbKQvjrhnBdv5sZ5PtiO/GT+kzXF2f7WwVhj6dJ2IkY69iTjndP022fYIWWCI1M
         9toXbJ0cwTw7X2+9P0E4jD+C8QrvaQ3MUP69hkbxz61pS36ZKPgIomvQqoTfkXrVAAYt
         HibDvg4v6/8RWU0XipYOqDhxA1bf3pbnxkIs1pgpjpB43I+YURH8poXloNCrpFmeH9t2
         96eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771796230; x=1772401030;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b4mMM5qE+qxfR6dazqNKHp062hw1pJNzveR355ArO0Y=;
        b=N2zKg3JZFeni75/WLAeNPycLfGGUeQ/jKtQAiLo5tNdKT+UZtVaUBm7TDz6oQsnJbF
         5QkyadQg5gpwqno5pbaLnp2e1dCTeAROQzoYjL9YD2a/FflYeWuHEPesJTzZGL4NgJzw
         M0KDDXCBmDxiafYp+fFGoCTPSW/Kygnch25FNVUtcg81Gn6P31OxFufxjcaTtnnWiw02
         OOyDE0KJm1kOXWGbuypHqkoTmRpc24escqkhe5RFkZodHBE75On+zbGia/Do/bWMFwtt
         XGWDLaRVtVf4GjVIYQSUGTy0r+FSZJIxeoJ62UXl7OJ7BsuRj/kuED8sTKHhWtE6PQDH
         wIUA==
X-Forwarded-Encrypted: i=1; AJvYcCX/GWm5CqFF3rajKHJfuYssnJ6eIjKnWdq7N1vm/7ByuFytGhUQYl4yxleTYQ5GJAb9puaS9nzKJSec@vger.kernel.org
X-Gm-Message-State: AOJu0YwuKpDoXhIR+GLBzEBo60gGsR5VXFp2XkoqkxR3Gdc9f/lWVr5D
	YsDJDwVzZY8fhnggiNkdMLg/xqw9uwIP+GFxQgFL0IAT6Jg/gVCvt10W
X-Gm-Gg: AZuq6aIlp5E6G3NSKUVijUCKYYPSdYgdlJbYYbQiSw8+7gWnv3A4SyIcbUQ4nJ4KkrM
	clnrIcnJSRr5cnNm8SfOJolwQ7TfDT/bXWPOFq8xs4LeMAEs+LFWet/HtB+hi5O/dpw6c71p4n4
	oSmdti44+RNdoBlCMvSCy79FuPA/sYuya8zKw4Ld1ib2K/42jVK3z36rqdZcwBu17YSZuEWUHsw
	ECgs6rJnSk5Amq3nPeyOSkIT1mTHZyp6y8n+uflXgbw9uOFkkUd8J6G9l120JG6SogvGWViujy3
	W05LuxDADwGANTzz4pDHP80mTD1fXG9ZG7BD9Ju6H9PXCiwaEzaHylbVEVCKNoAzo07TloPXm1X
	agBlKIrVLLL2cLK7eg32fmVzc+vIUUJTf89iHLwcScgLpwHga1LWPFz1ZCs9t23FY3JN7VSwqMP
	YhaDTMVyud8c0p3t6M+Ks0o4YMFxzXUXJjmsZ9LrUpFQIGsH09vGtjEX3obH7yt0LiSFrijGI01
	w==
X-Received: by 2002:a05:7022:60a5:b0:123:2d4f:ef20 with SMTP id a92af1059eb24-1276ad2ec3emr2889618c88.31.1771796230364;
        Sun, 22 Feb 2026 13:37:10 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c6c:6cca:170e:c77b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7dbe8293sm3806939eec.16.2026.02.22.13.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 13:37:10 -0800 (PST)
Date: Sun, 22 Feb 2026 13:37:07 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: David Lechner <dlechner@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 3/4] iio: adc: ti-ads7950: switch to using guard()
 notation
Message-ID: <aZt1ypf6msZxc2U1@google.com>
References: <20260219022929.3558081-1-dmitry.torokhov@gmail.com>
 <20260219022929.3558081-4-dmitry.torokhov@gmail.com>
 <0b9e1c9d-9bee-4fc3-ac19-28d969f65ef2@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b9e1c9d-9bee-4fc3-ac19-28d969f65ef2@baylibre.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32000-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A114B17076D
X-Rspamd-Action: no action

On Sat, Feb 21, 2026 at 11:34:33AM -0600, David Lechner wrote:
> On 2/18/26 8:29 PM, Dmitry Torokhov wrote:
> > +	scoped_guard(mutex, &st->slock) {
> > +		error = spi_sync(st->spi, &st->ring_msg);
> > +		if (error)
> > +			break;
> 
> I'm not a fan of scoped_guard() because of the hidden for loop in it.
> It hides the fact that the break; is breaking out of that for loop.
> 
> It would be more clear/obvious written as:
> 
> 	do {
> 		guard(mutex)(&st->slock);
> 
> 		ret = spi_sync(st->spi, &st->ring_msg);
> 		if (ret)
> 			break;
> 
> 		iio_push_to_buffers_with_timestamp(indio_dev, &st->rx_buf[2],
> 						   iio_get_time_ns(indio_dev));
> 	} while (0);

OK.

I could also make it

	scoped_guard(mutex, &st->slock) {
		ret = spi_sync(st->spi, &st->ring_msg);
		if (!ret)
			iio_push_to_buffers_with_timestamp(indio_dev, &st->rx_buf[2],
							   iio_get_time_ns(indio_dev));
	}

to avoid using "break".

I think you will find that scoped_guard() will gain the foothold in the
kernel so having implementation that does not follow common pattern
might not be the best option.

> >  
> >  	/* If set as output, return the output */
> >  	if (st->gpio_cmd_settings_bitmask & BIT(offset)) {
> >  		state = st->cmd_settings_bitmask & BIT(offset);
> > -		goto out;
> > +		return state;
> 
> This can return directly instead of using local variable.

This will require the explicitly normalizing, which we avoided by
introducing "bool state" to begin with...

> >  
> >  	st->single_tx = TI_ADS7950_GPIO_CMD_SETTINGS(st);
> > -	ret = spi_sync(st->spi, &st->scan_single_msg);
> > +	error = spi_sync(st->spi, &st->scan_single_msg);
> 
> Can just return directly here now.

I think there is benefit in explicitly calling out the error paths and
explicitly return 0 on success. It removes the doubt whether a function
can return positive value on success.

Thanks.

-- 
Dmitry

