Return-Path: <linux-gpio+bounces-34607-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qG1QHHGjzmlZpAYAu9opvQ
	(envelope-from <linux-gpio+bounces-34607-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 19:12:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1197238C69B
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 19:12:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ED28B303C67A
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2026 17:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C27F33DEAFF;
	Thu,  2 Apr 2026 17:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/IRgyQH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A666C3D5656
	for <linux-gpio@vger.kernel.org>; Thu,  2 Apr 2026 17:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775149914; cv=none; b=IE0Ayl069kJ5sX60fYIsmOLDBsxqYghAQZ4Hb4udU1ELMMumT8AhBiBtLV9pYLMIeYSJfOEz4zEhLGEo65esCTAQpDXMmxnXmP/W8AOhT5648jNvLNVitTCrpCGpiyUpI7qVa2LixBvyAG4Fc5QhA+i4m7NSOgw7wvQJdM1ua5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775149914; c=relaxed/simple;
	bh=IBuFRNBGBaBjd9eZE55+VJyYFcLcjL8kQrBse1nHfG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=id5g5mNh3KuAcKtH2pK1oRbYOBzccJxEzgoeDDPgMADJAG/BUZvmDqNq41Jetav9VnEuKMMvQB2lILvOtjg5K/3Ld7Z/GjsoxjvdPS6l7w0LEuh/lGXRxS4gnS9APw322Crtt4n2GQRmhL1edM3sQZzOV9wBfU/TEIX3Ip4u9Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E/IRgyQH; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4887f49ec5aso15866625e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 02 Apr 2026 10:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775149909; x=1775754709; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q4nHYoH4lQZS8z/1UWtS0Bd4HeYd52xdlIi7BxO3080=;
        b=E/IRgyQHts6By0MbTveh7PHS1B1sHG5b8nvjCjBNvK60cvwCZIi7jveax8fqMQYXXi
         2VnfRguCrx9Re9V1ESBLv6lSTgJoPHmMNQ8oxlSsNJlZL/f67uKbeJ86qjUzs63ocLbT
         pwKipsEQDUqWU7pacnzx+dFrDlCxkFlpKF2mOh6ju2lVa9OvM5Mbq1ZyymWXzw2tztfI
         iHjPVN8EC3hUqJvKQMuxKdocnhhwQwx3czB5CSmOAyjDYl7KiMaDTtVjgwEtOF+59PLl
         EXnrPz4viJ6jSzTALCXE3/2N76nbMagd7A7lX1cGj4YBdeklvzCyYL57WRzsTmwqaUkd
         /Kxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775149909; x=1775754709;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4nHYoH4lQZS8z/1UWtS0Bd4HeYd52xdlIi7BxO3080=;
        b=jYT9eQBqJV2y/EBSLbT8fZ6v24RSDj0nYjl849xE8vGxHhoq1dEW3524nCqAiIjQJ9
         eIrioNyK//01zKtrE1PaSvpkSfSA9KEbLiAcrWoHnGZv+m+1aekiu5BZulQEDMjpa09U
         LqTodHYV6bX17iSsffieg3FLkyg6hww9I+a+csTyeGsrUlC8UcTsbOIABu7PBx5n9Oyt
         9cfYlAUDXLEnFdVtvfE/TrWY2WRGtfkIfJIDXVl2BQqzMUHHvn4N8MdCZqTBlevjZ587
         r74FTniG4RMoH9sxWJ/n5PyVJvOt/OkTXN7WyCuIHAd2A26XU/xa26lB9SdoFakLIYAO
         C9/A==
X-Forwarded-Encrypted: i=1; AJvYcCU7g0ZZB1PdgTxhHjbieHI8tzSNsr091v7c3FotSRwOl16/XCu8bWPA1l2ffHWCobrAv5jiCIzECOWA@vger.kernel.org
X-Gm-Message-State: AOJu0YzAGy/NWe3dbxaW37tyDywbVYBvoFqfXxZwQIQ19+TNQBKV3AA1
	ZwK0dle1T4zB8kU2S37VDq996RPm+vRSDDbm/xmnXqbMSWK4pOpsSGjP
X-Gm-Gg: ATEYQzzJB69RzVrtyE2arc1NoDI9crROWE50U4aZZBumvIIiXTHTzLcgGJsY94paQOj
	YvT5p93MoUdojDLZ+vwZYMkg+Esfd7aaUpy+FoBeEnhqxUJXwaFmHWRLegm7tanrcew9/5R6XI7
	+qmtltOq8y9Z4+K89fU5J0xLbHBfSX5M1U6XIJBkBfkwt2QqU53qeviTYcGY70PVecWiSADXUko
	xAEaBxB4adK7pJdAykLqRQcntgQrQEQvq5Qcs1fV+ITtJ3JsFLFSc0J0Z/HFFpt9nEXMt/tSGbH
	gojRHSXV3V2v1pFbUoHeSMKnz70dJu1lfmgOp35A4iXnrGDcrGLRhT+p5hu4EdX07UT4ETUwsqm
	ldjmjMGFCjiGCL2Av+wiKNjvqprvaqW9ZXyFTV1AAWRQBgvAtLvb30fVzvXckO5X47UbKro22ik
	BRvSoDe198glu2vw==
X-Received: by 2002:a05:600c:8184:b0:483:9139:4c1d with SMTP id 5b1f17b1804b1-48883590456mr148967405e9.14.1775149908448;
        Thu, 02 Apr 2026 10:11:48 -0700 (PDT)
Received: from nsa ([185.128.9.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488977e43absm1368775e9.28.2026.04.02.10.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 10:11:48 -0700 (PDT)
Date: Thu, 2 Apr 2026 18:12:35 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, linux-gpio@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v8 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
Message-ID: <ac6iNzw9aW6Lgziz@nsa>
References: <20260327-ltc4283-support-v8-0-471de255d728@analog.com>
 <20260327-ltc4283-support-v8-2-471de255d728@analog.com>
 <aco5L_6SZIB2DdpF@nsa>
 <e0c96f38-6742-4b86-8938-64e4e6063119@roeck-us.net>
 <acuLynb1hRFJRcEf@nsa>
 <32c4c4dc-91db-4286-82e5-1d3269c76a74@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <32c4c4dc-91db-4286-82e5-1d3269c76a74@roeck-us.net>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34607-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nonamenuno@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1197238C69B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 06:31:59AM -0700, Guenter Roeck wrote:
> On 3/31/26 02:48, Nuno Sá wrote:
> > On Mon, Mar 30, 2026 at 08:47:32AM -0700, Guenter Roeck wrote:
> > > On 3/30/26 02:28, Nuno Sá wrote:
> > > > Hi Guenter, Regarding AI review, I think most of the points were
> > > > discussed in previous revisions, but there are two valid.
> > > > 
> > > > On Fri, Mar 27, 2026 at 05:26:15PM +0000, Nuno Sá wrote:
> > > > > Support the LTC4283 Hot Swap Controller. The device features programmable
> > > > > current limit with foldback and independently adjustable inrush current to
> > > > > optimize the MOSFET safe operating area (SOA). The SOA timer limits MOSFET
> > > > > temperature rise for reliable protection against overstresses.
> > > > > 
> > > > > An I2C interface and onboard ADC allow monitoring of board current,
> > > > > voltage, power, energy, and fault status.
> > > > > 
> > > > > Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> > > > > ---
> > > > >    Documentation/hwmon/index.rst   |    1 +
> > > > >    Documentation/hwmon/ltc4283.rst |  266 ++++++
> > > > >    MAINTAINERS                     |    1 +
> > > > >    drivers/hwmon/Kconfig           |   12 +
> > > > >    drivers/hwmon/Makefile          |    1 +
> > > > >    drivers/hwmon/ltc4283.c         | 1796 +++++++++++++++++++++++++++++++++++++++
> > > > >    6 files changed, 2077 insertions(+)
> > > > > 
> > > > 
> > > > ...
> > > > 
> > > > > +static int ltc4283_read_in_alarm(struct ltc4283_hwmon *st, u32 channel,
> > > > > +				 bool max_alm, long *val)
> > > > > +{
> > > > > +	if (channel == LTC4283_VPWR)
> > > > > +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_1,
> > > > > +					  BIT(2 + max_alm), val);
> > > > > +
> > > > > +	if (channel >= LTC4283_CHAN_ADI_1 && channel <= LTC4283_CHAN_ADI_4) {
> > > > > +		u32 bit = (channel - LTC4283_CHAN_ADI_1) * 2;
> > > > > +		/*
> > > > > +		 * Lower channels go to higher bits. We also want to go +1 down
> > > > > +		 * in the min_alarm case.
> > > > > +		 */
> > > > > +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_2,
> > > > > +					  BIT(7 - bit - !max_alm), val);
> > > > > +	}
> > > > > +
> > > > > +	if (channel >= LTC4283_CHAN_ADIO_1 && channel <= LTC4283_CHAN_ADIO_4) {
> > > > > +		u32 bit = (channel - LTC4283_CHAN_ADIO_1) * 2;
> > > > > +
> > > > > +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_3,
> > > > > +					  BIT(7 - bit - !max_alm), val);
> > > > > +	}
> > > > > +
> > > > > +	if (channel >= LTC4283_CHAN_ADIN12 && channel <= LTC4283_CHAN_ADIN34) {
> > > > > +		u32 bit = (channel - LTC4283_CHAN_ADIN12) * 2;
> > > > > +
> > > > > +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_5,
> > > > > +					  BIT(7 - bit - !max_alm), val);
> > > > > +	}
> > > > 
> > > > "Will this condition handle the ADIO12 and ADIO34 differential channels?
> > > > It looks like channels 14 and 15 fall through to the default return intended
> > > > for the DRAIN channel. Since reading the alarm implicitly clears the register
> > > > bits, could reading these ADIO alarms unintentionally clear actual DRAIN
> > > > alarms? Should the upper bound be LTC4283_CHAN_ADIO34?"
> > > > 
> > > > Good catch and should be:
> > > > 
> > > > -       if (channel >= LTC4283_CHAN_ADIN12 && channel <= LTC4283_CHAN_ADIN34) {
> > > > +       if (channel >= LTC4283_CHAN_ADIN12 && channel <= LTC4283_CHAN_ADIO34) {
> > > > 
> > > > > +
> > > > > +	if (channel == LTC4283_CHAN_DRNS)
> > > > > +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_4,
> > > > > +					  BIT(6 + max_alm), val);
> > > > > +
> > > > > +	return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_4, BIT(4 + max_alm),
> > > > > +				  val);
> > > > > +}
> > > > 
> > > > ...
> > > > 
> > > > > +
> > > > > +static int ltc4283_probe(struct i2c_client *client)
> > > > > +{
> > > > > +	struct device *dev = &client->dev, *hwmon;
> > > > > +	struct auxiliary_device *adev;
> > > > > +	struct ltc4283_hwmon *st;
> > > > > +	int ret;
> > > > > +
> > > > > +	st = devm_kzalloc(dev, sizeof(*st), GFP_KERNEL);
> > > > > +	if (!st)
> > > > > +		return -ENOMEM;
> > > > > +
> > > > > +	if (!i2c_check_functionality(client->adapter,
> > > > > +				     I2C_FUNC_SMBUS_BYTE_DATA |
> > > > > +				     I2C_FUNC_SMBUS_WORD_DATA |
> > > > > +				     I2C_FUNC_SMBUS_READ_I2C_BLOCK))
> > > > > +		return -EOPNOTSUPP;
> > > > > +
> > > > > +	st->client = client;
> > > > > +	st->map = devm_regmap_init(dev, &ltc4283_regmap_bus, client,
> > > > > +				   &ltc4283_regmap_config);
> > > > > +	if (IS_ERR(st->map))
> > > > > +		return dev_err_probe(dev, PTR_ERR(st->map),
> > > > > +				     "Failed to create regmap\n");
> > > > > +
> > > > > +	ret = ltc4283_setup(st, dev);
> > > > > +	if (ret)
> > > > > +		return ret;
> > > > > +
> > > > > +	hwmon = devm_hwmon_device_register_with_info(dev, "ltc4283", st,
> > > > > +						     &ltc4283_chip_info, NULL);
> > > > > +
> > > > > +	if (IS_ERR(hwmon))
> > > > > +		return PTR_ERR(hwmon);
> > > > > +
> > > > > +	ltc4283_debugfs_init(st, client);
> > > > > +
> > > > > +	if (!st->gpio_mask)
> > > > > +		return 0;
> > > > > +
> > > > > +	adev = devm_auxiliary_device_create(dev, "gpio", &st->gpio_mask);
> > > > > +	if (!adev)
> > > > > +		return dev_err_probe(dev, -ENODEV, "Failed to add GPIO device\n");
> > > > 
> > > > "Does this allow multiple LTC4283 chips to probe successfully?
> > > > Without allocating a unique ID per I2C instance, it seems the first probed
> > > > chip takes the generic name. If a second chip is present, it might attempt
> > > > to register with the exact same name, resulting in a failure in device_add()
> > > > and aborting the probe."
> > > > 
> > > > Also looks valid and I suspect is one of those that a quick look will
> > > > find more "offenders". I would purpose:
> > > > 
> > > > -       adev = devm_auxiliary_device_create(dev, "gpio", &st->gpio_mask);
> > > > +       adev = __devm_auxiliary_device_create(dev, KBUILD_MODNAME, "gpio",
> > > > +                                             &st->gpio_mask, client->addr);
> > > > 
> > > 
> > > That would still fail if there are multiple chips at the same I2C address
> > > on multiple I2C busses. Check drivers/gpu/drm/bridge/ti-sn65dsi86.c which has
> > > the same problem.
> > 
> > I did looked at that one but totally forgot the multiple busses
> > scenario.
> > 
> > > 
> > > > If there's nothing else and you agree with the above, is this something
> > > > you can tweak while applying or should I spin a new version?
> > > > 
> > > 
> > > Please respin. Also, regarding the other concerns:
> > > 
> > >    Can BIT(8) * st->rsense wrap to zero on 32-bit architectures?
> > >    BIT(8) is a 32-bit unsigned long and st->rsense is a u32. If a user sets a
> > >    very large sense resistor value via the device tree, the multiplication could
> > >    wrap to 0, causing a division-by-zero kernel panic. Should the divisor use
> > >    BIT_ULL(8)?
> > > 
> > > Unless I am missing something, this _can_ overflow. Try to provide a sense
> > > resistor value of 1677721600. Yes, it is unreasonable to specify such large
> > > rsense values, but why not just limit it such that it does not overflow ?
> > 
> > Yes, that's pretty much my reasoning (regarding the unreasonable
> > rsense). I could just make BIT_ULL() and be done with it. I can also
> > also cap rsense to a max value but i'm not 100% what that value would
> > be. Maybe 1 ohm is already more than reasonable. I can also ask internally. Any
> > preference on this one?
> > 
> 
> I'd suggest to reject large (unreasonable) values. In this case, rejecting rsense
> values >= 1677721600 should solve the problem.
> 
> > > 
> > > Also, for the overflow concerns, if you are sure they can not happen, I'll
> > > really need to write the unit test code to make sure that this is indeed
> > > the case.
> > > 
> > 
> > Hmm, for the val * MILLI case, well it should not happen but given it
> > depends on user input, better if I clamp it before passing the
> > value to ltc4283_write_in_byte(). Yes, we clamp again inside the
> > write_bytes() API but not a big deal.
> > 
> > For the st->power_max is again one of those cases where the values would
> > not make sense (I think - the combination of vsense_max and rsense). Just looking
> > at the code, it can overflow but this one I'm not really sure how we could handle it.
> > Maybe clamp power_max to U8_MAX and have a warning message in ltc4283_read_power_byte() if
> > we overflow long in which case we need a power64 attr?
> > 
> > But even clamping does not make much sense here. The power limit register
> > is 8 bits, so if our design (rsense + vsense_max) overflows that,
> > there's nothing we can do other that erroring out.
> > 
> 
> Again, why not just reject unreasonable values such that calculations
> can not overflow ?
> 
> In other drivers, the common approach is to reject unreeasonable values if
> provided through devicetree and to clamp them if provided through sysfs.
> I don't see why that would not work here.

Hi Guenter,

Just FYI, I intended to re-spin today but then I started to double check
the st->power_max logic. If I did not messed up 14.5uOhm is the minimum rsense
we can take so that we don't overflow long on 32bits systems. I'm not sure but
I think it's plausible to have values lower than that. So, bottom line, I
asked internally to some HW folks, who definitely know these systems
better than I do, about that 14,5 min value. I'm waiting for feedback
but it might be that we end up needing power64 attrs as you suggested
some revisions ago.

- Nuno Sá

> 
> Thanks,
> Guenter
> 

