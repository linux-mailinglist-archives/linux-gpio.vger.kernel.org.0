Return-Path: <linux-gpio+bounces-38416-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bOutEb0OL2pm7gQAu9opvQ
	(envelope-from <linux-gpio+bounces-38416-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Jun 2026 22:27:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 965CC682284
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Jun 2026 22:27:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=lG8Nqp7A;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38416-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38416-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 564E9300C926
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Jun 2026 20:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 351DB31E855;
	Sun, 14 Jun 2026 20:27:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4A62E1722
	for <linux-gpio@vger.kernel.org>; Sun, 14 Jun 2026 20:27:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781468843; cv=none; b=kMW6WvSfxSUODw/AK/5lro2thgW/pRlxi8S1/R3YhUcjDXUPSX3G0ytcE/vssfBNCRZtiEab50SNfiMv93BOwpkR6Chw9WCnbpY+6BJEgTeSeXKuu8y6967nI1Ganahck79EwrK3jFDgWnLCb7P49KbRTBn7d9KAtMw1hsA+2kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781468843; c=relaxed/simple;
	bh=h9xk+G+xayD5RQ4g2h7FGIIaCxcLrzsO9b0YSlCPg9M=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=aUv4Za1cS3zNN50fiToj7yuUTceo2zs/Hly22gM4RuXmimBfSbeDc9m9w0U+Ec2jCy9hBufs+GcmwDXVOaFPrOilWg7vMcmEWYOR5Upq0QePDyIFemwSBX4mxso7+iM0Iiol2PKGEMACbLHxECQlgOCBntKMtP5TQw3k7L28/ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lG8Nqp7A; arc=none smtp.client-ip=209.85.221.179
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-59ebde7d704so824725e0c.2
        for <linux-gpio@vger.kernel.org>; Sun, 14 Jun 2026 13:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781468839; x=1782073639; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8ijRA6s0uqNGh2yBan54U2T2vOUvgrEDPKm+USlvSY=;
        b=lG8Nqp7Aj5+DnGGQZNLI/TmEUWTNzmgRJwS5h3RuN1CzC9qRuMXUO6HoQms6qe7NKR
         an9N6bHx4XdhVhlK13nsQYl99p5GYmeC7TcYrHy+E5Veh3IYpoTMhZ+8If5pu25M1LeG
         ffn+KFoBUZhtIpeCtNhtq6GcNGLD1IV8fDtVlQlrtv0IxpUkZHUXg0bYUfO9CnRHftH/
         is4znB2aimGFLi2G99e9P96v1hRc0m/ey64NvEY0V7AtAB7Z1dN72oELQYWRyicKNdEE
         eZYGQjh+PDZXtzPUBSJOBoq0elIcSA+WtvgT+Hc8LyHal2GY0OdYUDvngHMH91zU0Ocl
         38bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781468839; x=1782073639;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D8ijRA6s0uqNGh2yBan54U2T2vOUvgrEDPKm+USlvSY=;
        b=Ul/dych3Mua+oKD8llRO1gtNjQoSQs+UFbm2DwXTM1/aQdSBkjGQOHZoBrmfzMwd9+
         tSn2XF5Klsu3BG7OYO2uVaAzCbjcKoVBaTLMaAFBWeCnp7He1kEsJFrs/JYXAJQvj7Si
         WHYcoTLY1sGmZWvtjTlUS2GCbNgzRllEmMox9WmjXImpdLE/EUjXGrH9D4nJNeoLhWk+
         8TNvP8EjKJSZZ6g66zN90+YnKLgyGUxSbOwDxotW68hw61SEJgEP4IvTffSOKjSEDIMJ
         OKWvYorYRvvNrPCWfyrghiLPgBqK54LyTVf3/a2f66TCgoKYrEpQq0mDAIjAvku5ZzTi
         yt5A==
X-Forwarded-Encrypted: i=1; AFNElJ9CHHIhYTKJKH6DYfo8gShGPN3VQhwdYBvvz+5DjSgLTIqbJ9y8bC/OZt4IYzHcACitHXvf3fNhX3vx@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm6YHHdlQ0xZZTOd+7Q6Wkc4+RGnWXz+4KdrTeF0qiX1FrrpRp
	NCv99qlpez/QxZ00MJSkkfp3QWW+i1NHDviYO6c82RLYNW8EJ+cxMnZA
X-Gm-Gg: Acq92OEvCYtyuxRu1mDL4UfhSratCnXhsYJFWpY4itDkea0ipovl90p7RXF+Gb20NOX
	rURf4vcBQCG85u5ovp4j4PIvx2c9tDf1yQ3ycIana86hh0ED1MBNT8VMMk6kYwXO3AoE9kk+jWx
	Cg4j62mpshsq1XTxBVyByWkALr41ijJY0WiYPZPaOG0I8loqqgvvEvbOMramYJysQIWCGF9S5Ky
	1DnKYq5EN3YxoJQG9KReZtJXwe5YlGuoKimN0oTDK7rQ8MpzIYpnBThaWSH8o6NsvB7j/jqzzjH
	5ReciF0VgyG2AhFdQ9BZethg17cndauZtGif3Y1JOTCD50ygCRx4HwrFg6U/hKCSI8867+M3xy3
	TeTRVfEw+S2mJovNxOGtrsFWAVQYqRusoaGWJeREKP8KKHgotjmHS5oOLr64oY64rchjdsZR/au
	I0cQO6mIk6SZcSsw==
X-Received: by 2002:a05:6122:7d0:b0:59d:6004:d453 with SMTP id 71dfb90a1353d-5bb6c05b321mr5101381e0c.2.1781468839085;
        Sun, 14 Jun 2026 13:27:19 -0700 (PDT)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb9018080bsm1995179e0c.10.2026.06.14.13.27.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 13:27:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 14 Jun 2026 15:27:11 -0500
Message-Id: <DJ91ZV8FQOMZ.YLIC552K4G5D@gmail.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Linus Walleij"
 <linusw@kernel.org>, "Bartosz Golaszewski" <brgl@kernel.org>, "David
 Lechner" <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, "Andy Shevchenko" <andy@kernel.org>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 2/5] iio: adc: Add ti-ads1262 driver
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Jonathan Cameron" <jic23@kernel.org>, "Kurt Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260612-ads126x-v1-0-894c788d03ed@gmail.com>
 <20260612-ads126x-v1-2-894c788d03ed@gmail.com>
 <20260613144544.0594a7f0@jic23-huawei>
In-Reply-To: <20260613144544.0594a7f0@jic23-huawei>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38416-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:jic23@kernel.org,m:kuurtb@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kuurtb@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuurtb@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 965CC682284

Hi Jonathan,

On Sat Jun 13, 2026 at 8:45 AM -05, Jonathan Cameron wrote:
> On Fri, 12 Jun 2026 17:46:20 -0500
> Kurt Borja <kuurtb@gmail.com> wrote:
>
>> Add ti-ads1262 driver for TI ADS1262 and ADS1263 ADCs with initial
>> support for the following features:
>>=20
>>   - Power management
>>   - IIO direct and buffer modes
>>   - Channel hot-reloading
>>   - Internal or external oscillator
>>   - Internal or external voltage reference
>>   - Filter configuration
>>   - Sensor bias configuration
>>   - IDAC configuration
>>   - Level-shift voltage configuration
>>   - Auxiliary ADC interoperability considerations
>>=20
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---
>>  MAINTAINERS                  |    1 +
>>  drivers/iio/adc/Kconfig      |   13 +
>>  drivers/iio/adc/Makefile     |    1 +
>>  drivers/iio/adc/ti-ads1262.c | 1816 +++++++++++++++++++++++++++++++++++=
+++++++
>
> That is rather too big. I think you'll have to work out how to split this
> up into more manageable chunks.  Staying under a 1000 (preferably a lot l=
ess)
> per patch makes it much easier for people to review.
>
> Given the complexity of the device this might be one that has to go
> in as several series, building up functionality as we go.

I'll split it up as much as possible for next version.

I was thinking of taking out the hot-reloading stuff for a follow-up
series. In that case I would also add IIO_ACQUIRE_BUFFER_MODE().
What do you think?

>
> I'll ignore all the DT stuff as sounds like that may radically change and
> just take a fairly superficial first look at this.

Yes, I will just address Krzysztof comments and leave that patch until
we can discuss it with David.

>
> Jonathan
>

[...]

>> +#include <linux/lockdep.h>
>
> Fairly unusual to see that header in a driver.
> What's it here for?

I included it for lockdep_assert_held().

[...]

>> +/* IDACMAG constants */
>> +#define ADS1262_IDACMAG_OFF			0
>> +#define ADS1262_IDACMAG_COUNT			11
>> +
>> +/* REFMUX constants */
>
> Naming is good enough I'm not sure I'd bother with the comments
> to say what these are.
>
> On option is to just group them with the register they are about
> and using extra indenting to visually separate them from the register
>
> #define ADS1262_REFMUX_REG			0xxx
> #define   ADS1262_REFMUX_RMUXP_MASK		GENMASK(5, 3)
> #define     ADS1262_RMUX_INTER				0
> #define     ADS1262_RMUX_AIN0_AIN1			1
> #define     ADS1262_RMUX_AIN2_AIN3			2
> #define     ADS1262_RMUX_AIN4_AIN5			3
> #define     ADS1262_RMUX_AVDD_AVSS			4
> #define     ADS1262_RMUX_COUNT				5

I like this...

> However, if you are going to have a terminating entry, an anonymous enum =
might be better
> with that just as the last item.

...but this sounds good too. I'll go for what looks more organized.

>
> #define   ADS1262_REFMUX_RMUXN_MASK		GENMASK(2, 0)
>
>
>> +#define ADS1262_RMUX_INTER			0
>> +#define ADS1262_RMUX_AIN0_AIN1			1
>> +#define ADS1262_RMUX_AIN2_AIN3			2
>> +#define ADS1262_RMUX_AIN4_AIN5			3
>> +#define ADS1262_RMUX_AVDD_AVSS			4
>> +#define ADS1262_RMUX_COUNT			5
>> +
>> +struct ads1262_channel {
>
> As a general rule we tend to avoid bitfields because of all the problems
> with how loose the C spec is on how these actually get laid out.
> I'd just have this as a suitable 32 bit value and then have
> defines for masks within that.

Are you suggesting storing this whole struct data as a u32 and
reading/writing with FIELD_*() helpers? I think that may be less
readable but it would save memory. I don't know if I understood
correctly though.

I'm dropping the bitfield approach for next version anyway.

[...]

>> +struct ads1262 {
>> +	struct spi_device *spi;
>> +	struct regmap *regmap;
>> +	struct iio_dev *indio_dev;
>> +	struct iio_trigger *trig;
>> +	struct gpio_desc *reset_gpiod;
>> +	struct gpio_desc *start_gpiod;
>> +
>> +	void *scan_buffer;
> I think this is always accessed as a __be32. If so just type it as that.

I was hesitant to do that because of the space reserved at the end for
the timestamp. Didn't feel right to assign __be32 when it would actually
be something like

	struct {
		__be32 buff;
		aligned_s64 ts;
	};

But I have no problem doing it.

[...]

>> +static int ads1262_fill_buffer_mult(struct ads1262 *st)
>> +{
>> +	__be32 val, *scan_buffer =3D st->scan_buffer;
>
> Avoid mixing pointer and no point, or anything with assignments
> as it makes the code harder to read.
>
>> +	unsigned int chan;
>> +	int i =3D -1;
>> +	int ret;
>> +
>> +	/*
>> +	 * This routine enables and reads channels in a full-duplex fashion.
>> +	 *
>> +	 * When a channel is enabled, the previous conversion is clocked out o=
f
>> +	 * the shift data register on the same transfer (Section 9.4.7.1). Thi=
s
>> +	 * allows for low latency software sequencing but forbids any SPI
>> +	 * activity happen in between or data corruption may occur, hence the
>> +	 * need to take the xfer_lock for the whole operation.
>> +	 */
>
> Just to check: Is SPI traffic on the same bus to a different device fine?
> If not you'd need spi_bus_lock(). If it is fine then reword this to talk =
about
> communications with this device just to avoid confusion.

Yes, to a different device is fine. I'll reword it.

[...]

>> +static int ads1262_read_chip_name(struct ads1262 *st, char **name)
>> +{
>> +	struct device *dev =3D &st->spi->dev;
>> +	u8 dev_id;
>> +	unsigned int val;
>> +	int ret;
>> +
>> +	ret =3D regmap_read(st->regmap, ADS1262_ID_REG, &val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	dev_id =3D FIELD_GET(ADS1262_DEV_ID_MASK, val);
>> +
>> +	switch (dev_id) {
>> +	case ADS1262_DEV_ID_ADS1262:
>> +		*name =3D "ads1262";
>
> Given, at somepoint I would guess you'll want to support the auxiliary ad=
c
> on the 1263, I'd start with a struct chip_info  (with the name in there)
> and pick that rather than just the name here.

Makes sense. In that case I can add a dev_warn if the name doesn't match
the internal model. Would that be ok or would you prefer dev_dbg?

>
>> +		break;
>> +	case ADS1262_DEV_ID_ADS1263:
> Not particularly important but common practice to just change the prefix
> for anything device specific.
> 	case ADS1263_DEV_ID

Good to know!

>
>> +		*name =3D "ads1263";
>> +		break;
>> +	default:
>> +		*name =3D "ads1262";
> Given we'll ultimately want fallback compatibles to work and so allow
> for firmware to specify which device to fallback to, this should really b=
e
> using the guidance from firmware to select rather than always guessing
> the 1262 variant.  That is safe though given the 'subset' nature so this
> doesn't matter as much as it normally does.

Agreed.

[...]

>> +static const struct reg_default ads1262_reg_defaults[] =3D {
>> +	{ ADS1262_POWER_REG,		0x11 },
>
> Is it sensible to specify these in terms of the fields that make them up?
> Can make it easier to see what the default state actually means.
> Sometimes it is just too complex, so we don't bother.

I prefer not to do it because it would be too complex. I'll try though.

[...]

>> +MODULE_DESCRIPTION("Texas Instruments ADS1262 ADC driver");
>> +MODULE_LICENSE("GPL");
>> +MODULE_AUTHOR("Kurt Borja <kuurtb@gmail.com>");
>>=20

Ack to the rest of comments!

--=20
Thanks,
 ~ Kurt


