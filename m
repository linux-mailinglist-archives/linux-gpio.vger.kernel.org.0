Return-Path: <linux-gpio+bounces-34423-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AR+Ab1Dymky7AUAu9opvQ
	(envelope-from <linux-gpio+bounces-34423-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 11:34:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7296835841E
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 11:34:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 546383041788
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 09:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22A513B3C08;
	Mon, 30 Mar 2026 09:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RqYuHeQ2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A59C3B2FE8
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 09:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774862897; cv=none; b=lpmMYlfb6wDc5Oz1nQWPeWN7nkQEjR/PzHJ794RwsCslFirah21B1u67UMP0QO2+AgltyQPZVAuXVEDLnSxOlfjSy3kXmvnUCO9pzfyERikoCBCHluOF/4zibIDfAhUaGL8/DieIy+LljPiBgac/c1/yaLnhVKzBzfpiLeVPVZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774862897; c=relaxed/simple;
	bh=A0pfCojUiGgrrf0Ej5R1kBaQcEv947GaCDZ90NppBa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iooAM7c/v5vfOGqkfCeJQG5NJQsKmm/Goc9PwgdSBfxYazUCQ1NAeLNed+Eb5qC44148f4ma4vO0R19PZCXhMbBCnDyupiVfVf5hI+Xazb/8AADUngmlPjSTe9J24iQC+wUmcz3MjP4/nxjTaRQdfV1HxJWTFd0NEqRz+gmM6Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RqYuHeQ2; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso35986615e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 02:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774862895; x=1775467695; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3zDHIQyb3IezUESO9F09MAim9FoAsOYTRYDFkmxzVFg=;
        b=RqYuHeQ2zIlSNVIp8Y01sDKtexz5NJFxXDwwOWBCgszHinnN4Z6/AMcNkBLcWbigFn
         OXY8/eVUs/bkVcNDvMJlHzG5ZHfIIux8kCXkFXJv6CNVckuazEgO6KLX2qe3IYUHsX4c
         t8gjAvpYHbbyt2MWTK7717BHmVI9u8WhTcMDvNtN7gwhCHKEzoSpvPKa5Ra79xGJWsDg
         sPAaMwlVl6IaItM3tynUcu6m4jdFSTaWDJ9X+VW4N73b6pp2fo6oEOkdY8utKBA0gM+w
         x9wWINUCYasrsN1eyIyuy/pxjHHeZz6ACik8eHIMcNsVRucUQO1fAoHUWGSjMi5yDzAX
         BbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774862895; x=1775467695;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3zDHIQyb3IezUESO9F09MAim9FoAsOYTRYDFkmxzVFg=;
        b=UvQfCP/eKQ4H9Yb2DmivmKPjL685/3BqlDLna5N+IMcEdycJshQU5Ic7hcvVzNOl+g
         NEquy9RdWJTp/qw/WGC7DaoULkm011hY/pycw9pIHZGY+D17wiO31kem7pDIwZXZowL3
         i/AilRDMaj3RkEYRJl6Jkb0HUWPA/Myqz9Ru3bF43YojUFdg43YgUp3LWfc6B1wG0E9k
         cxWiUqQbnK2h5SWdPMEHoatrGSmEXY0oAnCGbq3Guv3b/9MZqBJbCkgifX96QIUqGRdt
         dtldo/Dvr8VOGiOunOzEZu2gNyYNVzk15eh3fLO1wSYA9CHcArKfcNLuQg4IiK74wy11
         G55w==
X-Gm-Message-State: AOJu0Ywn3xEb87E06J0+cutagMrL/FsFOSHMIzzNbZ9vheoDA9Bkt2+X
	v7eOQ0Txr05TOHEBjZl4moWxaRRcvyBAn0z3ZL/+ZvJ/nqaMeM3Zje0J
X-Gm-Gg: ATEYQzx7dwzT4Xjp2IfhBZFU9aGokt8wgqFGi7M7xFB5ekH/lI2EHxyvMD2IKHwvrti
	5yzFSI64L7jwtKwz69R+F+YH0IaPz2ZSZdssSaSWoiRRwYTkSOlEOcqi2WyKMq7egb8DwC3NjKm
	U65DAl90ghX9ZTqgmz3QYnVwqoVNh6R9Ctdf16mBKwGYtte1q9+9ZsIfrhVcELtnELkEvOXEKgT
	ZFVJuLTDJBI16HQChIJM2gr4oOmtqPnRdYMjwcp+aBuSn1tuY3MXpGhy5PmY+2kVN3uQjcPJpUn
	b41DOEmerfy2WocHtIi/tsVVsM0wSU5CRGoPuX1ECOK5P72dhFeUeJBWb8s0JSN0GY13TCSuNM/
	WCHWSJG884l1g8CZm295P5k8OTqNfvClpecZiCR1VSyBrqvIxPv1dQcbqgzTRDse6+PQpEy6qWt
	2pJgLRil1ggCH/
X-Received: by 2002:a05:600c:83c5:b0:477:7af8:c8ad with SMTP id 5b1f17b1804b1-487280a25c4mr210099595e9.31.1774862894489;
        Mon, 30 Mar 2026 02:28:14 -0700 (PDT)
Received: from nsa ([45.94.208.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4873ab203e9sm74265215e9.0.2026.03.30.02.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:28:14 -0700 (PDT)
Date: Mon, 30 Mar 2026 10:28:59 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>
Cc: linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v8 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
Message-ID: <aco5L_6SZIB2DdpF@nsa>
References: <20260327-ltc4283-support-v8-0-471de255d728@analog.com>
 <20260327-ltc4283-support-v8-2-471de255d728@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260327-ltc4283-support-v8-2-471de255d728@analog.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34423-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nonamenuno@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 7296835841E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Guenter, Regarding AI review, I think most of the points were
discussed in previous revisions, but there are two valid.

On Fri, Mar 27, 2026 at 05:26:15PM +0000, Nuno Sá wrote:
> Support the LTC4283 Hot Swap Controller. The device features programmable
> current limit with foldback and independently adjustable inrush current to
> optimize the MOSFET safe operating area (SOA). The SOA timer limits MOSFET
> temperature rise for reliable protection against overstresses.
> 
> An I2C interface and onboard ADC allow monitoring of board current,
> voltage, power, energy, and fault status.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> ---
>  Documentation/hwmon/index.rst   |    1 +
>  Documentation/hwmon/ltc4283.rst |  266 ++++++
>  MAINTAINERS                     |    1 +
>  drivers/hwmon/Kconfig           |   12 +
>  drivers/hwmon/Makefile          |    1 +
>  drivers/hwmon/ltc4283.c         | 1796 +++++++++++++++++++++++++++++++++++++++
>  6 files changed, 2077 insertions(+)
>

...

> +static int ltc4283_read_in_alarm(struct ltc4283_hwmon *st, u32 channel,
> +				 bool max_alm, long *val)
> +{
> +	if (channel == LTC4283_VPWR)
> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_1,
> +					  BIT(2 + max_alm), val);
> +
> +	if (channel >= LTC4283_CHAN_ADI_1 && channel <= LTC4283_CHAN_ADI_4) {
> +		u32 bit = (channel - LTC4283_CHAN_ADI_1) * 2;
> +		/*
> +		 * Lower channels go to higher bits. We also want to go +1 down
> +		 * in the min_alarm case.
> +		 */
> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_2,
> +					  BIT(7 - bit - !max_alm), val);
> +	}
> +
> +	if (channel >= LTC4283_CHAN_ADIO_1 && channel <= LTC4283_CHAN_ADIO_4) {
> +		u32 bit = (channel - LTC4283_CHAN_ADIO_1) * 2;
> +
> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_3,
> +					  BIT(7 - bit - !max_alm), val);
> +	}
> +
> +	if (channel >= LTC4283_CHAN_ADIN12 && channel <= LTC4283_CHAN_ADIN34) {
> +		u32 bit = (channel - LTC4283_CHAN_ADIN12) * 2;
> +
> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_5,
> +					  BIT(7 - bit - !max_alm), val);
> +	}

"Will this condition handle the ADIO12 and ADIO34 differential channels?
It looks like channels 14 and 15 fall through to the default return intended
for the DRAIN channel. Since reading the alarm implicitly clears the register
bits, could reading these ADIO alarms unintentionally clear actual DRAIN
alarms? Should the upper bound be LTC4283_CHAN_ADIO34?"

Good catch and should be:

-       if (channel >= LTC4283_CHAN_ADIN12 && channel <= LTC4283_CHAN_ADIN34) {
+       if (channel >= LTC4283_CHAN_ADIN12 && channel <= LTC4283_CHAN_ADIO34) {

> +
> +	if (channel == LTC4283_CHAN_DRNS)
> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_4,
> +					  BIT(6 + max_alm), val);
> +
> +	return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_4, BIT(4 + max_alm),
> +				  val);
> +}

...

> +
> +static int ltc4283_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev, *hwmon;
> +	struct auxiliary_device *adev;
> +	struct ltc4283_hwmon *st;
> +	int ret;
> +
> +	st = devm_kzalloc(dev, sizeof(*st), GFP_KERNEL);
> +	if (!st)
> +		return -ENOMEM;
> +
> +	if (!i2c_check_functionality(client->adapter,
> +				     I2C_FUNC_SMBUS_BYTE_DATA |
> +				     I2C_FUNC_SMBUS_WORD_DATA |
> +				     I2C_FUNC_SMBUS_READ_I2C_BLOCK))
> +		return -EOPNOTSUPP;
> +
> +	st->client = client;
> +	st->map = devm_regmap_init(dev, &ltc4283_regmap_bus, client,
> +				   &ltc4283_regmap_config);
> +	if (IS_ERR(st->map))
> +		return dev_err_probe(dev, PTR_ERR(st->map),
> +				     "Failed to create regmap\n");
> +
> +	ret = ltc4283_setup(st, dev);
> +	if (ret)
> +		return ret;
> +
> +	hwmon = devm_hwmon_device_register_with_info(dev, "ltc4283", st,
> +						     &ltc4283_chip_info, NULL);
> +
> +	if (IS_ERR(hwmon))
> +		return PTR_ERR(hwmon);
> +
> +	ltc4283_debugfs_init(st, client);
> +
> +	if (!st->gpio_mask)
> +		return 0;
> +
> +	adev = devm_auxiliary_device_create(dev, "gpio", &st->gpio_mask);
> +	if (!adev)
> +		return dev_err_probe(dev, -ENODEV, "Failed to add GPIO device\n");

"Does this allow multiple LTC4283 chips to probe successfully?
Without allocating a unique ID per I2C instance, it seems the first probed
chip takes the generic name. If a second chip is present, it might attempt
to register with the exact same name, resulting in a failure in device_add()
and aborting the probe."

Also looks valid and I suspect is one of those that a quick look will
find more "offenders". I would purpose:

-       adev = devm_auxiliary_device_create(dev, "gpio", &st->gpio_mask);
+       adev = __devm_auxiliary_device_create(dev, KBUILD_MODNAME, "gpio",
+                                             &st->gpio_mask, client->addr);

If there's nothing else and you agree with the above, is this something
you can tweak while applying or should I spin a new version?

Thanks!
- Nuno Sá


