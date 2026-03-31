Return-Path: <linux-gpio+bounces-34469-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDugM6iZy2mYJQYAu9opvQ
	(envelope-from <linux-gpio+bounces-34469-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 11:53:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFB8367643
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 11:53:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F9403088E89
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 09:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 803D33EDABD;
	Tue, 31 Mar 2026 09:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="adzEQltm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A573ED5B7
	for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 09:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774950482; cv=none; b=EaxXc2tC4GaPuEql0T9QOPkOxunMCm8NZA8HPzasglsZydn+3cIHx0YYSTm/QIFXOgSFiKB1En+P/B7VxYuU82iCvh0bc11y7UrZ3RwIGggKzuhpKdp9HTEyjvZrf5owtKNpKRAD3dWkXk39yhjYn/PV3bLks32q7xuyu7ZZZnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774950482; c=relaxed/simple;
	bh=enjXq1IaosHLxnBgQhk2lHI8aL7+jqMUWCiR5kNvnlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WSq15439ZU5LEEOi+KM1l5nK9v47YJMBDdT9scxuKeileVRm8TzFJqNCVyZdhFu1aFNAWxLzCnxEqXomY9uyvtXjF6z0VAFN9knCHtEi5vFuuPl/JKq1SjBxJYyBquvjW9MP49n73lnThDCyHEAJBf7NW6eVHpxHfTxKbs8RU7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=adzEQltm; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-486fb112c09so51275355e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 02:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774950478; x=1775555278; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HmEtPoEG1EUMKwQsf4OvvafgJCsYzJUriFfog6MNbws=;
        b=adzEQltmPRXJzxV64O8v8A+IFV8kFJoXexFbIIoSwvYutmRN9qZaOwWysUZkM+Hpa2
         NFdcRYQvUnuySWJA5DAtHYaAdoMx5E7FCodw2oF8kgxAdPzzk29snueyyQ79FIARaPl4
         EEvzQDnvDw8MKn8YhJkvQSVehu0Tkr8OslqT+iLoFWY9JAiIya9UYTaG/kZyE1qYVhJB
         cp6dLe9D3s6p83aCu/nqnsQ1MeZ2BTjLItlXL+FN7HUNm2NVc5r2V/CjDb3TyGzKf81q
         vNZNACzlI+r3W7FDtZgVfewB8jfTZRBP767CO+Hk1fOWwdEaFM0ev8oqY0N1P8JG4P70
         eMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774950478; x=1775555278;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HmEtPoEG1EUMKwQsf4OvvafgJCsYzJUriFfog6MNbws=;
        b=VMJN4PE8r/wf+Mi42hDxkV9lXf3MpT9RISi9ZwKGxUb773396rIOOQX3mK8GvsrM9v
         EjZQ2ZUX31dV3LjC+MtHOktF4089MwWAqHxrG4LW2eDdfjYB0HnalKcS2aCynEpM5eDd
         Ibr7xoxhGqCCLDGR2myIPCARlyoB//Pme0/4tapFGb1svDvR8JP/HPt6grSHqCO3mhvg
         wPCyiI6Nmka1f429jc4pp/jaORvignzjPyjgu0xKD44+3vJdTc04Ynv5rH5xefxLQ8Ud
         +ehiXG5/UlHpABlTydfNefm8BCjoRt5vRCm/u2uPukobxCHHxBwI4wupgBBT+6ImrUqo
         xI6w==
X-Forwarded-Encrypted: i=1; AJvYcCW8BMqTy1puaHRmFfNlysr+EHv0lviMz/dedNIeFOgU9cfQTGGqmipy/czBRIO9yDG18kIvYT3J8A+H@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm6LcPJvRKl+3nL/+OZBM+coBTYQwkeYwMA22LCc/kAPCD+P13
	aDCjvUnqjxbvVz0KEkLQ8GTqzOS3UZMorUuL89GDPQmxKTw32vWlIj+U
X-Gm-Gg: ATEYQzz4KUMNSQ69CSa0dzGu768/jMho/9vvOFH74Rc0hNGor12ay1fhUruNpCfAXQt
	vHcblUI2dAuZjnoxDm5+K9XJ4MNG0SBM2yLdRapYv+i1mJoOr3Fib44oa3tD/Q/3ImfeLWALi5z
	5hOrHrnSj83GJ9Cckcud5wHGtmY9U2tNFW8iIrggWHk5IOC/JvHuXGWBAwNshQ3l1w2PU8ZYY3S
	o/BSE4dR0o+cPbDGiMkzBDsOW+U0sExyGyt41w9LIYLLA23PaCSHbuYEo5wO31bq1456cGHeBxE
	MCvMtshsYb1V4IvM1aTyLDnryG/Hq6UJDHgLnf5j8eZY7IqKjJRfcG7sLTYwLSfu1K9MaoMQwql
	rywd5/mUaQsmakwFF2IOzKcWEsqRXc7cYTqjwY8aeZ2+yZfg958BJxWE78uBd3IiSQMk4R5W5gb
	frUS3DJQyCulZx
X-Received: by 2002:a05:600c:b95:b0:485:5c6e:8a38 with SMTP id 5b1f17b1804b1-48727f63664mr250648925e9.17.1774950478236;
        Tue, 31 Mar 2026 02:47:58 -0700 (PDT)
Received: from nsa ([185.128.9.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887aacb8d0sm14105285e9.3.2026.03.31.02.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 02:47:57 -0700 (PDT)
Date: Tue, 31 Mar 2026 10:48:43 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, linux-gpio@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v8 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
Message-ID: <acuLynb1hRFJRcEf@nsa>
References: <20260327-ltc4283-support-v8-0-471de255d728@analog.com>
 <20260327-ltc4283-support-v8-2-471de255d728@analog.com>
 <aco5L_6SZIB2DdpF@nsa>
 <e0c96f38-6742-4b86-8938-64e4e6063119@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e0c96f38-6742-4b86-8938-64e4e6063119@roeck-us.net>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34469-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5EFB8367643
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 08:47:32AM -0700, Guenter Roeck wrote:
> On 3/30/26 02:28, Nuno Sá wrote:
> > Hi Guenter, Regarding AI review, I think most of the points were
> > discussed in previous revisions, but there are two valid.
> > 
> > On Fri, Mar 27, 2026 at 05:26:15PM +0000, Nuno Sá wrote:
> > > Support the LTC4283 Hot Swap Controller. The device features programmable
> > > current limit with foldback and independently adjustable inrush current to
> > > optimize the MOSFET safe operating area (SOA). The SOA timer limits MOSFET
> > > temperature rise for reliable protection against overstresses.
> > > 
> > > An I2C interface and onboard ADC allow monitoring of board current,
> > > voltage, power, energy, and fault status.
> > > 
> > > Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> > > ---
> > >   Documentation/hwmon/index.rst   |    1 +
> > >   Documentation/hwmon/ltc4283.rst |  266 ++++++
> > >   MAINTAINERS                     |    1 +
> > >   drivers/hwmon/Kconfig           |   12 +
> > >   drivers/hwmon/Makefile          |    1 +
> > >   drivers/hwmon/ltc4283.c         | 1796 +++++++++++++++++++++++++++++++++++++++
> > >   6 files changed, 2077 insertions(+)
> > > 
> > 
> > ...
> > 
> > > +static int ltc4283_read_in_alarm(struct ltc4283_hwmon *st, u32 channel,
> > > +				 bool max_alm, long *val)
> > > +{
> > > +	if (channel == LTC4283_VPWR)
> > > +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_1,
> > > +					  BIT(2 + max_alm), val);
> > > +
> > > +	if (channel >= LTC4283_CHAN_ADI_1 && channel <= LTC4283_CHAN_ADI_4) {
> > > +		u32 bit = (channel - LTC4283_CHAN_ADI_1) * 2;
> > > +		/*
> > > +		 * Lower channels go to higher bits. We also want to go +1 down
> > > +		 * in the min_alarm case.
> > > +		 */
> > > +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_2,
> > > +					  BIT(7 - bit - !max_alm), val);
> > > +	}
> > > +
> > > +	if (channel >= LTC4283_CHAN_ADIO_1 && channel <= LTC4283_CHAN_ADIO_4) {
> > > +		u32 bit = (channel - LTC4283_CHAN_ADIO_1) * 2;
> > > +
> > > +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_3,
> > > +					  BIT(7 - bit - !max_alm), val);
> > > +	}
> > > +
> > > +	if (channel >= LTC4283_CHAN_ADIN12 && channel <= LTC4283_CHAN_ADIN34) {
> > > +		u32 bit = (channel - LTC4283_CHAN_ADIN12) * 2;
> > > +
> > > +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_5,
> > > +					  BIT(7 - bit - !max_alm), val);
> > > +	}
> > 
> > "Will this condition handle the ADIO12 and ADIO34 differential channels?
> > It looks like channels 14 and 15 fall through to the default return intended
> > for the DRAIN channel. Since reading the alarm implicitly clears the register
> > bits, could reading these ADIO alarms unintentionally clear actual DRAIN
> > alarms? Should the upper bound be LTC4283_CHAN_ADIO34?"
> > 
> > Good catch and should be:
> > 
> > -       if (channel >= LTC4283_CHAN_ADIN12 && channel <= LTC4283_CHAN_ADIN34) {
> > +       if (channel >= LTC4283_CHAN_ADIN12 && channel <= LTC4283_CHAN_ADIO34) {
> > 
> > > +
> > > +	if (channel == LTC4283_CHAN_DRNS)
> > > +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_4,
> > > +					  BIT(6 + max_alm), val);
> > > +
> > > +	return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_4, BIT(4 + max_alm),
> > > +				  val);
> > > +}
> > 
> > ...
> > 
> > > +
> > > +static int ltc4283_probe(struct i2c_client *client)
> > > +{
> > > +	struct device *dev = &client->dev, *hwmon;
> > > +	struct auxiliary_device *adev;
> > > +	struct ltc4283_hwmon *st;
> > > +	int ret;
> > > +
> > > +	st = devm_kzalloc(dev, sizeof(*st), GFP_KERNEL);
> > > +	if (!st)
> > > +		return -ENOMEM;
> > > +
> > > +	if (!i2c_check_functionality(client->adapter,
> > > +				     I2C_FUNC_SMBUS_BYTE_DATA |
> > > +				     I2C_FUNC_SMBUS_WORD_DATA |
> > > +				     I2C_FUNC_SMBUS_READ_I2C_BLOCK))
> > > +		return -EOPNOTSUPP;
> > > +
> > > +	st->client = client;
> > > +	st->map = devm_regmap_init(dev, &ltc4283_regmap_bus, client,
> > > +				   &ltc4283_regmap_config);
> > > +	if (IS_ERR(st->map))
> > > +		return dev_err_probe(dev, PTR_ERR(st->map),
> > > +				     "Failed to create regmap\n");
> > > +
> > > +	ret = ltc4283_setup(st, dev);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	hwmon = devm_hwmon_device_register_with_info(dev, "ltc4283", st,
> > > +						     &ltc4283_chip_info, NULL);
> > > +
> > > +	if (IS_ERR(hwmon))
> > > +		return PTR_ERR(hwmon);
> > > +
> > > +	ltc4283_debugfs_init(st, client);
> > > +
> > > +	if (!st->gpio_mask)
> > > +		return 0;
> > > +
> > > +	adev = devm_auxiliary_device_create(dev, "gpio", &st->gpio_mask);
> > > +	if (!adev)
> > > +		return dev_err_probe(dev, -ENODEV, "Failed to add GPIO device\n");
> > 
> > "Does this allow multiple LTC4283 chips to probe successfully?
> > Without allocating a unique ID per I2C instance, it seems the first probed
> > chip takes the generic name. If a second chip is present, it might attempt
> > to register with the exact same name, resulting in a failure in device_add()
> > and aborting the probe."
> > 
> > Also looks valid and I suspect is one of those that a quick look will
> > find more "offenders". I would purpose:
> > 
> > -       adev = devm_auxiliary_device_create(dev, "gpio", &st->gpio_mask);
> > +       adev = __devm_auxiliary_device_create(dev, KBUILD_MODNAME, "gpio",
> > +                                             &st->gpio_mask, client->addr);
> > 
> 
> That would still fail if there are multiple chips at the same I2C address
> on multiple I2C busses. Check drivers/gpu/drm/bridge/ti-sn65dsi86.c which has
> the same problem.

I did looked at that one but totally forgot the multiple busses
scenario.

> 
> > If there's nothing else and you agree with the above, is this something
> > you can tweak while applying or should I spin a new version?
> > 
> 
> Please respin. Also, regarding the other concerns:
> 
>   Can BIT(8) * st->rsense wrap to zero on 32-bit architectures?
>   BIT(8) is a 32-bit unsigned long and st->rsense is a u32. If a user sets a
>   very large sense resistor value via the device tree, the multiplication could
>   wrap to 0, causing a division-by-zero kernel panic. Should the divisor use
>   BIT_ULL(8)?
> 
> Unless I am missing something, this _can_ overflow. Try to provide a sense
> resistor value of 1677721600. Yes, it is unreasonable to specify such large
> rsense values, but why not just limit it such that it does not overflow ?

Yes, that's pretty much my reasoning (regarding the unreasonable
rsense). I could just make BIT_ULL() and be done with it. I can also
also cap rsense to a max value but i'm not 100% what that value would
be. Maybe 1 ohm is already more than reasonable. I can also ask internally. Any
preference on this one?

> 
> Also, for the overflow concerns, if you are sure they can not happen, I'll
> really need to write the unit test code to make sure that this is indeed
> the case.
>

Hmm, for the val * MILLI case, well it should not happen but given it
depends on user input, better if I clamp it before passing the
value to ltc4283_write_in_byte(). Yes, we clamp again inside the
write_bytes() API but not a big deal.

For the st->power_max is again one of those cases where the values would
not make sense (I think - the combination of vsense_max and rsense). Just looking
at the code, it can overflow but this one I'm not really sure how we could handle it.
Maybe clamp power_max to U8_MAX and have a warning message in ltc4283_read_power_byte() if
we overflow long in which case we need a power64 attr?

But even clamping does not make much sense here. The power limit register
is 8 bits, so if our design (rsense + vsense_max) overflows that,
there's nothing we can do other that erroring out.

- Nuno Sá

> Thanks,
> Guenter
> 

