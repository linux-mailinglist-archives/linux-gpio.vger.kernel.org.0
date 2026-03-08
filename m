Return-Path: <linux-gpio+bounces-32778-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNZkByTArWnm6wEAu9opvQ
	(envelope-from <linux-gpio+bounces-32778-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 08 Mar 2026 19:29:56 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 94985231A49
	for <lists+linux-gpio@lfdr.de>; Sun, 08 Mar 2026 19:29:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B3686301CC4B
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Mar 2026 18:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10272395D83;
	Sun,  8 Mar 2026 18:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BMLTdusp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C099B395269;
	Sun,  8 Mar 2026 18:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772994581; cv=none; b=K+VClQZfHEVjMkU1zd/LgePTWwcLrDN1uqbr6ri6nbfRdKuZZ01fq6/kA0Hh6hoZjLHLpJs4SN1zaFhwVOI3AThPqWPhPWVnEpefprLjjtElsOIpe++UOPc1KXPAnV5f6pHQKZtrY+TmHGAbAYg7gDmQsAT09Ug/hYMMRJUtNjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772994581; c=relaxed/simple;
	bh=KPbaeZmtYCpLgYrmLl8YT+uTMZwhmNbFwGe0EdbjkB0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r5GNAR7X3bjXox0XsgNEHgqQoor7LAYi+MyUZFoA9/aODrCtxVARI35TRtRtuDq+gpwlbDOgevLe3sWlNO6jbcQlQJNImWn+hS/AIs7gVUVji7SegpY+9DQIE765eeW7q4pL1os27mYkBuoV9UulTWwiIYZ/P8rjEakRczjO6QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BMLTdusp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B181FC116C6;
	Sun,  8 Mar 2026 18:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772994581;
	bh=KPbaeZmtYCpLgYrmLl8YT+uTMZwhmNbFwGe0EdbjkB0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BMLTduspaPRNnMfDfwMMwOkFl9wKkchkoU0a78bAki6Q2jHc0jDA3+JLDK2cjZm7r
	 UeDGcbAK5uB7dOJXNe6VevXso2XMhDzjR9EaAej/KHZFjuSzw71J3MBRRisNPiKwKD
	 uc99zulCuSDduTe6JSHc3e3Gg9pv6ntSoMNvkx4/Ml+X6uqOmVfo0dtv7E9UWibSnJ
	 8ZZ9KUJTMARBzTxLTCvg45EDJ5KjuJBpSQvKHHtky8gaFUneJGdGbltB8INlPT1tUw
	 V21DSFMdqACikoe07Hnl4Wku+SYYmNwEaCytad+2syEPr+/13aiScaKWI8GfMjnKwe
	 vdp2l54PDsYjg==
Date: Sun, 8 Mar 2026 18:29:33 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Linus Walleij
 <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v3 5/6] iio: adc: ti-ads7950: switch to using
 devm_regulator_get_enable_read_voltage()
Message-ID: <20260308182933.5cc0dc85@jic23-huawei>
In-Reply-To: <9b63f0d2-24e6-4215-958c-42cb9d2e5536@baylibre.com>
References: <20260305-ti-ads7950-facelift-v3-0-a23fdd1a079e@gmail.com>
	<20260305-ti-ads7950-facelift-v3-5-a23fdd1a079e@gmail.com>
	<20260307114947.0b946dfb@jic23-huawei>
	<27ffa24d-a388-46eb-8df7-04624cd32ea1@baylibre.com>
	<aaxoIWL7NIa-2VkU@google.com>
	<9b63f0d2-24e6-4215-958c-42cb9d2e5536@baylibre.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 94985231A49
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32778-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,analog.com,kernel.org,vger.kernel.org,huawei.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,baylibre.com:email]
X-Rspamd-Action: no action

On Sat, 7 Mar 2026 12:07:40 -0600
David Lechner <dlechner@baylibre.com> wrote:

> On 3/7/26 12:04 PM, Dmitry Torokhov wrote:
> > On Sat, Mar 07, 2026 at 11:43:32AM -0600, David Lechner wrote:  
> >> On 3/7/26 5:49 AM, Jonathan Cameron wrote:  
> >>> On Thu, 05 Mar 2026 11:21:56 -0800
> >>> Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> >>>  
> >>>> The regulator is enabled for the entire time the driver is bound to the
> >>>> device, and we only need to access it to fetch voltage, which can be
> >>>> done at probe time.
> >>>>
> >>>> Switch to using devm_regulator_get_enable_read_voltage() which
> >>>> simplifies probing and unbinding code.
> >>>>
> >>>> Suggested-by: David Lechner <dlechner@baylibre.com>
> >>>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>  
> >>> Hi.
> >>>
> >>> I think this broke the ACPI case (where regulator isn't available).  
> > 
> > Oh, you're right.
> >   
> >>>
> >>> Jonathan
> >>>  
> >>>> ---
> >>>>  drivers/iio/adc/ti-ads7950.c | 45 +++++++++++---------------------------------
> >>>>  1 file changed, 11 insertions(+), 34 deletions(-)
> >>>>
> >>>> diff --git a/drivers/iio/adc/ti-ads7950.c b/drivers/iio/adc/ti-ads7950.c
> >>>> index 273c35e03185..847e83baa876 100644
> >>>> --- a/drivers/iio/adc/ti-ads7950.c
> >>>> +++ b/drivers/iio/adc/ti-ads7950.c
> >>>> @@ -341,19 +341,9 @@ static int ti_ads7950_scan_direct(struct iio_dev *indio_dev, unsigned int ch)
> >>>>  	return st->single_rx;
> >>>>  }
> >>>>  
> >>>> -static int ti_ads7950_get_range(struct ti_ads7950_state *st)
> >>>> +static unsigned int ti_ads7950_get_range(struct ti_ads7950_state *st)
> >>>>  {
> >>>> -	int vref;
> >>>> -
> >>>> -	if (st->vref_mv) {
> >>>> -		vref = st->vref_mv;
> >>>> -	} else {
> >>>> -		vref = regulator_get_voltage(st->reg);
> >>>> -		if (vref < 0)
> >>>> -			return vref;
> >>>> -
> >>>> -		vref /= 1000;
> >>>> -	}
> >>>> +	unsigned int vref = st->vref_mv;
> >>>>  
> >>>>  	if (st->cmd_settings_bitmask & TI_ADS7950_CR_RANGE_5V)
> >>>>  		vref *= 2;
> >>>> @@ -382,11 +372,7 @@ static int ti_ads7950_read_raw(struct iio_dev *indio_dev,
> >>>>  
> >>>>  		return IIO_VAL_INT;
> >>>>  	case IIO_CHAN_INFO_SCALE:
> >>>> -		ret = ti_ads7950_get_range(st);
> >>>> -		if (ret < 0)
> >>>> -			return ret;
> >>>> -
> >>>> -		*val = ret;
> >>>> +		*val = ti_ads7950_get_range(st);
> >>>>  		*val2 = (1 << chan->scan_type.realbits) - 1;
> >>>>  
> >>>>  		return IIO_VAL_FRACTIONAL;
> >>>> @@ -580,30 +566,24 @@ static int ti_ads7950_probe(struct spi_device *spi)
> >>>>  	spi_message_init_with_transfers(&st->scan_single_msg,
> >>>>  					st->scan_single_xfer, 3);
> >>>>  
> >>>> +	ret = devm_regulator_get_enable_read_voltage(&spi->dev, "vref");
> >>>> +	if (ret < 0)  
> >>>
> >>> I think you need to check for -ENODEV and if you see than then
> >>> see if the acpi route below applies.  Otherwise on ACPI this will fail
> >>> and we'll fail the probe.
> >>>  
> >>
> >> Or do something like:
> >>
> >> 	if (ACPI_COMPANION(&spi->dev)) {
> >> 		ret = devm_regulator_get_enable(&spi->dev, "vref");
> >> 		if (ret)
> >> 			return dev_err_probe(&spi->dev, ret,
> >> 					     "Failed to get regulator \"vref\"\n");
> >>
> >>  		st->vref_mv = TI_ADS7950_VA_MV_ACPI_DEFAULT;  
> > 
> > We know that concept of regulators is not exposed on ACPI systems, and
> > we'd get a dummy here, so maybe just store st->vref_mv and not bother
> > with acquiring and enabling the dummy regulator?
> > 
> > Thanks.
> >   
> 
> Sounds OK to me.
Likewise.

J


