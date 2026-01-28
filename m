Return-Path: <linux-gpio+bounces-31250-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDoyNLtBemmr4wEAu9opvQ
	(envelope-from <linux-gpio+bounces-31250-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 18:04:59 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB23A6841
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 18:04:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3AC7930BFDC8
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 16:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ED482D24B7;
	Wed, 28 Jan 2026 16:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQY0pLE0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697EB31DD97
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 16:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769619360; cv=none; b=pKUDcckV4vEFZu97RKIbdz9b0zbIbi6MWppfqx6jPdYc0AqoSgp9a1qXk69CTTwycLUrVzZOvEO1QSNNQzU8tfND4TVCllmlhI4ggwzxTUrpHsVZRvxPj89B8t58tbdMSGp1aE1PLC2HAUeU2esDIj979hYpeqCQpMDsQL7t604=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769619360; c=relaxed/simple;
	bh=+PrAcvg+5OdtTUavt01TFD/L57Tt7DDcfpHsvpOvros=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QBq2zNDM0+uTc+pRc7JRb3advQPyCXj3rd1L0ls851nMNUHjM/t7KKDuXOsW4bVM8UeQ6aBmTBdGp55pTeMP6FlZTBzWzZSNFECFH1IaLp/A6/L/LImrExJOVV37gGLc1+DuXNLvq9BraI9XY98rA7CuZJF0nw2xQCxgYxaSS8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQY0pLE0; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a0834769f0so47303755ad.2
        for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 08:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769619358; x=1770224158; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CJ5JUPDgasrNDJPGG/r08vgxAhhTjKNkbpybrz3kURc=;
        b=nQY0pLE0nnde7DiGZvmZOge8Fv9Bt3YfyARhrE4FS1rnTDXxfADbPQW8y/lhNihN6z
         CFxctGBPjiKUEWycMhxhOkHQ0DbggfLPLDPQLXMJf8Zv/ZDlfsOE0KZqPhD9QEEeODln
         c6GzmIi5PtrhS/x70JwvXsaVfVNw1D+P3XekWFjsVvk5tiCu1okBSkODuhyDioGD7/Q6
         EPT1VC/570ACiDHeUrvjqgkyx9fc+dMSERGmIk3QO1KPxHDcrkUfPmtu/eXM93wuIy1u
         Lh0vAvwJWXzbgpThyRu7cMCYuMWdrsxceVzj4i3Mkqu1dZDkXaPx2oscz+CpGAbbajUh
         frpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769619358; x=1770224158;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CJ5JUPDgasrNDJPGG/r08vgxAhhTjKNkbpybrz3kURc=;
        b=fqXm3Zf4scWahmA5j3KFICyVim5uJONqYMzgz027eayjsrZtp44ZrBG0rXE65yZHDE
         CBSN2lHNl5I99WK22Xn3njAM1BKH+n4yLFsukL5eunrL2WSXPJFC2eEuKPDg57xLNNGO
         SieuglKuc76RyibVNh2Mb3qC8nygr1dq5i3555Ca+1E9ukTBYy1ipD0fFWHrdjdITtWM
         LO6jrUH55VnMC1d6UbpjBnR8B9e0FQLa+GkpAb7UWaj6MBSObtDyk9GuOgBd3eXWOVSE
         zq6bWNJjfWY/S75a7vs7SMfdiI+O4MQx2xsd141171lUj9fbTNzjUuNJBb+bgWqm460N
         sHww==
X-Forwarded-Encrypted: i=1; AJvYcCXYslkC5BMzHIsY/pyys07PDHGDSKwW0oW/XBApF4qR0BX6l+On0PPJeR2AG2qI1hN+g6wW8eskV6N8@vger.kernel.org
X-Gm-Message-State: AOJu0YyKWjgv+3bXrQmklNnHCtY1GPqy7H/Z3wPo8/5O5kP14sxsgmT8
	XWyBqZcXFKkwR9LBNPsqX/mIT+VJd842ap8zFLkU1Aaz3zf65ag4zmgq
X-Gm-Gg: AZuq6aJh3+r5h0Mb5oeEw5s07lneYIQLYHFNTlhGZXghGYkg/YqIhFiuYKkpYy9o8Pg
	rzJWiX9GW/ZyGNFQ9OMkc7OGbqSgH3+xNdWh8A3bRw2STS/YIDM0VfHShsaBLKwm3gClrRd7JXN
	P0SVf1/Nzdw/2vH+52p0Nfapr0vl4QVqi4KmiFtyGstLdUZsNVJrvD5kKwdvdEA0K/PAmsT4+EW
	TG//vxL431CblDx9fS/w1qKtU37vsgg/+C5E1SgrJyY0FmJoGVDUsZJmGIVt6qpgh/L8PPwB+eA
	h3JbIqb5Wj+XNTNmL/Bg2kQjT1gPjqu5XjcT82R86/f4LS4uE/2x5cFue3WpruJ2OKfJx5KVYo7
	RMBrl6F6Va3JEtJGVXgFScefC1t4/Xy7eK6uEycrZTAc/evdiEFmFbtKU6KL/0sTTwFOcYYgbA4
	5k3CkocQNN0a6VE0hMpVwENo92
X-Received: by 2002:a17:903:2291:b0:29f:2ec4:83e5 with SMTP id d9443c01a7336-2a870d55636mr50468865ad.12.1769619357703;
        Wed, 28 Jan 2026 08:55:57 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b7f32bfsm29327505ad.96.2026.01.28.08.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 08:55:57 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 28 Jan 2026 08:55:55 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>, nuno.sa@analog.com,
	linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v5 0/3] hwmon: Add support for the LTC4283 Hot Swap
 Controller
Message-ID: <02b7cf63-4f87-4cdd-8d9e-53a7d0e808a6@roeck-us.net>
References: <20251223-ltc4283-support-v5-0-1152bff59a61@analog.com>
 <eed64bf1-93af-4b36-adf5-1476cb40edbb@roeck-us.net>
 <382e259ea3835ffbd2be9c36b529875f5a43f38b.camel@gmail.com>
 <8efa188b-8b91-479c-ac10-3fba5b0cbb5f@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8efa188b-8b91-479c-ac10-3fba5b0cbb5f@roeck-us.net>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31250-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,analog.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[roeck-us.net:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4DB23A6841
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 02:04:35AM -0800, Guenter Roeck wrote:
> On 1/28/26 01:44, Nuno Sá wrote:
> > Hi Guenter,
> > 
> > On Tue, 2026-01-27 at 09:39 -0800, Guenter Roeck wrote:
> > > Hi Nuno,
> > > 
> > > On 12/23/25 04:21, Nuno Sá via B4 Relay wrote:
> > > > This is v3 for the LTC4283 how swap controller. Main change is that I'm
> > > > now using the auxiliary bus for adding the GPIO device (done depending
> > > > on FW properties).
> > > > 
> > > > Similar to the LTC4282 device, we're clearing some fault logs in the
> > > > reset_history attributes.
> > > > 
> > > 
> > > I ran the patch series through an AI review. Results are below.
> > > Please take a look.
> > > 

Another run through AI below. Please let me know if there are further inaccuracies.

Thanks,
Guenter

---
commit 82433332ce165903d56fae327ced975aeef30475
Author:     Nuno Sá <nuno.sa@analog.com>

hwmon: ltc4283: Add support for the LTC4283 Swap Controller

Adds support for the LTC4283 Hot Swap Controller I2C interface.

> diff --git a/drivers/hwmon/ltc4283.c b/drivers/hwmon/ltc4283.c
> new file mode 100644
> index 000000000000..402b53f81548
> --- /dev/null
> +++ b/drivers/hwmon/ltc4283.c

[ ... ]

> +static int ltc4283_read_power_word(const struct ltc4283_hwmon *st,
> +				   u32 reg, long *val)
> +{
> +	u64 temp = (u64)LTC4283_ADC1_FS_uV * LTC4283_ADC2_FS_mV * DECA * MILLI;
> +	unsigned int __raw;
> +	int ret;
> +
> +	ret = regmap_read(st->map_word, reg, &__raw);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Power is given by:
> +	 *     P = CODE(16b) * 32.768mV * 2.048V / (2^16 * Rsense)
> +	 */
> +	*val = DIV64_U64_ROUND_CLOSEST(temp * __raw, BIT_ULL(16) * st->rsense);

Does this overflow *val on 32-bit systems if the calculated power exceeds
2000 Watts (approx 2^31 microWatts)?  The intermediate calculation is
u64, but the result is assigned to a signed long.

[ ... ]

> +static bool ltc4283_word_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case LTC4283_SENSE ... LTC4283_ADIO34_MAX:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}

LTC4283_SENSE is 0x41 and LTC4283_ADIO34_MAX is 0x40.  Does this invalid
range (start > end) effectively disable access to the word registers
via st->map_word?

> +static const struct regmap_config ltc4283_word_regmap_config = {
> +	.name = "ltc4283-16",
> +	.reg_bits = 8,
> +	.val_bits = 16,
> +	.max_register = LTC4283_ADIO34_MAX,
> +	.val_format_endian = REGMAP_ENDIAN_BIG,
> +	.writeable_reg = ltc4283_word_reg,
> +	.readable_reg = ltc4283_word_reg,
> +};

Does max_register = 0x40 prevent access to the sensor value registers
(LTC4283_SENSE at 0x41 and above) which are intended to be read as
words?

commit 5998c620fbd8915340a4b92635c9489a91fae567
Author:     Nuno Sá <nuno.sa@analog.com>

gpio: gpio-ltc4283: Add support for the LTC4283 Swap Controller

Adds GPIO support for the LTC4283.

> diff --git a/drivers/gpio/gpio-ltc4283.c b/drivers/gpio/gpio-ltc4283.c
> new file mode 100644
> index 000000000000..fa0c106d4fac
> --- /dev/null
> +++ b/drivers/gpio/gpio-ltc4283.c

[ ... ]

> +#define LTC4283_PINS_MAX			8
> +#define LTC4283_PGIOX_START_NR			4
> +#define LTC4283_INPUT_STATUS			0x02
> +#define LTC4283_PGIO_CONFIG			0x10
> +#define   LTC4283_PGIO_CFG_MASK(pin) 
> +	GENMASK(((pin) - LTC4283_PGIOX_START_NR) * 2 + 1, (((pin) - LTC4283_PGIOX_START_NR) * 2))
> +#define LTC4283_PGIO_CONFIG_2			0x11
> +
> +#define LTC42823_ADIO_CONFIG			0x12

This isn't a bug, but should this be LTC4283_ADIO_CONFIG instead of
LTC42823?

> +/* starts at bit 4 */
> +#define   LTC4283_ADIOX_CONFIG_MASK(pin)	BIT((pin) + 4)
> +#define LTC4283_PGIO_DIR_IN			3
> +#define LTC4283_PGIO_DIR_OUT			2


