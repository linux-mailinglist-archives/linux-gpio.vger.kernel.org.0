Return-Path: <linux-gpio+bounces-38764-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QLgGKYH0N2rLVwcAu9opvQ
	(envelope-from <linux-gpio+bounces-38764-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Jun 2026 16:26:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B216AB0EC
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Jun 2026 16:26:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=YW3o59y7;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38764-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38764-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08222301111B
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Jun 2026 14:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC0936CDE8;
	Sun, 21 Jun 2026 14:26:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F0336A03B;
	Sun, 21 Jun 2026 14:26:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782051963; cv=none; b=rxJs1MX9VwKZnOitbiSE6MUYXUoQFk2G0kwaXjFGoYTE3kzQFJHaaNEIsVKNw9MYZwuJwwtvz2wMP1eThvdbfJBjLsBI/YCRjYdZoPJLmZfKpfs3qDzOuSHKf4ArwdZ5gOK43gFyxFBsLxMluFtXt9oqmysf9oPZQlnhK/c7nts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782051963; c=relaxed/simple;
	bh=lt5+qyrI5LA9cHOzb8k/ijAuDuiNo4c81PGYT7Wultw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bCcGGCIGgRbSXxvYG8c2ZIGwfhvtFxhAbpTSlbdYYXl81M2F4yakiYUysDaoM0taNiVLm+tyXrjq+8Ba3q4e2tHJkN241dyjUJ/VW+ZCEMn2/K0x0OGUX8NKIPTerqyINoK1GxrRo9gJ9l3MH0jvsyu0QRk7vOqjLxW47OAKev0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YW3o59y7; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EE7B1F000E9;
	Sun, 21 Jun 2026 14:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782051961;
	bh=1uvY5XDgU6syIvNn2GdaPP2IZGYVcEX4rjROu2JWywU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=YW3o59y7Zxei5lpnvSqHgun0kPOEm8SdP/b7jJsavLLcCi52CrPXFyx74r4fUJFXp
	 1V1ll5+xvrWbYAcBq8Br2k2fgIRyO4LyX6jJbPQew4+Az2tm5aDxvMAkTKgbX8on+s
	 kZtDye6EYVtGTvqDj3hz7QTsUye/kXwsqS6zRolKiCniwfWgc2S3gwN79HPneSZdwG
	 olLANSb3kxUZ1jM1UwUUZUezUpMyuuhyBpg2b2otyli+RMhp+S3S6NcZdgkvPHGnvr
	 sbOn/1Sr/zPLujrIpFQKFrqOHuhnk2aA/v9E05FlMBThTw2Kls7oi5lmK2Y97jqrPz
	 rWHtd1Txok1wQ==
Date: Sun, 21 Jun 2026 15:25:51 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: "Kurt Borja" <kuurtb@gmail.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Linus Walleij"
 <linusw@kernel.org>, "Bartosz Golaszewski" <brgl@kernel.org>, "David
 Lechner" <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, "Andy Shevchenko" <andy@kernel.org>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 2/5] iio: adc: Add ti-ads1262 driver
Message-ID: <20260621152551.733729fe@jic23-huawei>
In-Reply-To: <DJ91ZV8FQOMZ.YLIC552K4G5D@gmail.com>
References: <20260612-ads126x-v1-0-894c788d03ed@gmail.com>
	<20260612-ads126x-v1-2-894c788d03ed@gmail.com>
	<20260613144544.0594a7f0@jic23-huawei>
	<DJ91ZV8FQOMZ.YLIC552K4G5D@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:kuurtb@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-gpio@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38764-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,jic23-huawei:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 44B216AB0EC

On Sun, 14 Jun 2026 15:27:11 -0500
"Kurt Borja" <kuurtb@gmail.com> wrote:

> Hi Jonathan,
> 
> On Sat Jun 13, 2026 at 8:45 AM -05, Jonathan Cameron wrote:
> > On Fri, 12 Jun 2026 17:46:20 -0500
> > Kurt Borja <kuurtb@gmail.com> wrote:
> >  
> >> Add ti-ads1262 driver for TI ADS1262 and ADS1263 ADCs with initial
> >> support for the following features:
> >> 
> >>   - Power management
> >>   - IIO direct and buffer modes
> >>   - Channel hot-reloading
> >>   - Internal or external oscillator
> >>   - Internal or external voltage reference
> >>   - Filter configuration
> >>   - Sensor bias configuration
> >>   - IDAC configuration
> >>   - Level-shift voltage configuration
> >>   - Auxiliary ADC interoperability considerations
> >> 
> >> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> >> ---
> >>  MAINTAINERS                  |    1 +
> >>  drivers/iio/adc/Kconfig      |   13 +
> >>  drivers/iio/adc/Makefile     |    1 +
> >>  drivers/iio/adc/ti-ads1262.c | 1816 ++++++++++++++++++++++++++++++++++++++++++  
> >
> > That is rather too big. I think you'll have to work out how to split this
> > up into more manageable chunks.  Staying under a 1000 (preferably a lot less)
> > per patch makes it much easier for people to review.
> >
> > Given the complexity of the device this might be one that has to go
> > in as several series, building up functionality as we go.  
> 
> I'll split it up as much as possible for next version.
> 
> I was thinking of taking out the hot-reloading stuff for a follow-up
> series. In that case I would also add IIO_ACQUIRE_BUFFER_MODE().
> What do you think?
Sure, bring it in when needed.  I just missread the code completely ;(
> 
> >
> > I'll ignore all the DT stuff as sounds like that may radically change and
> > just take a fairly superficial first look at this.  
> 
> Yes, I will just address Krzysztof comments and leave that patch until
> we can discuss it with David.
> 
> >
> > Jonathan
> >  
> 
> [...]
> 
> >> +#include <linux/lockdep.h>  
> >
> > Fairly unusual to see that header in a driver.
> > What's it here for?  
> 
> I included it for lockdep_assert_held().
Ah ok.
> 
> [...]
> 
> >> +/* IDACMAG constants */
> >> +#define ADS1262_IDACMAG_OFF			0
> >> +#define ADS1262_IDACMAG_COUNT			11
> >> +
> >> +/* REFMUX constants */  
> >
> > Naming is good enough I'm not sure I'd bother with the comments
> > to say what these are.
> >
> > On option is to just group them with the register they are about
> > and using extra indenting to visually separate them from the register
> >
> > #define ADS1262_REFMUX_REG			0xxx
> > #define   ADS1262_REFMUX_RMUXP_MASK		GENMASK(5, 3)
> > #define     ADS1262_RMUX_INTER				0
> > #define     ADS1262_RMUX_AIN0_AIN1			1
> > #define     ADS1262_RMUX_AIN2_AIN3			2
> > #define     ADS1262_RMUX_AIN4_AIN5			3
> > #define     ADS1262_RMUX_AVDD_AVSS			4
> > #define     ADS1262_RMUX_COUNT				5  
> 
> I like this...
> 
> > However, if you are going to have a terminating entry, an anonymous enum might be better
> > with that just as the last item.  
> 
> ...but this sounds good too. I'll go for what looks more organized.
> 
> >
> > #define   ADS1262_REFMUX_RMUXN_MASK		GENMASK(2, 0)
> >
> >  
> >> +#define ADS1262_RMUX_INTER			0
> >> +#define ADS1262_RMUX_AIN0_AIN1			1
> >> +#define ADS1262_RMUX_AIN2_AIN3			2
> >> +#define ADS1262_RMUX_AIN4_AIN5			3
> >> +#define ADS1262_RMUX_AVDD_AVSS			4
> >> +#define ADS1262_RMUX_COUNT			5
> >> +
> >> +struct ads1262_channel {  
> >
> > As a general rule we tend to avoid bitfields because of all the problems
> > with how loose the C spec is on how these actually get laid out.
> > I'd just have this as a suitable 32 bit value and then have
> > defines for masks within that.  
> 
> Are you suggesting storing this whole struct data as a u32 and
> reading/writing with FIELD_*() helpers? I think that may be less
> readable but it would save memory. I don't know if I understood
> correctly though.


Yes.  It's a pity that bitfields are loosely defined in C :(

> 
> I'm dropping the bitfield approach for next version anyway.
> 
> [...]
> 
> >> +struct ads1262 {
> >> +	struct spi_device *spi;
> >> +	struct regmap *regmap;
> >> +	struct iio_dev *indio_dev;
> >> +	struct iio_trigger *trig;
> >> +	struct gpio_desc *reset_gpiod;
> >> +	struct gpio_desc *start_gpiod;
> >> +
> >> +	void *scan_buffer;  
> > I think this is always accessed as a __be32. If so just type it as that.  
> 
> I was hesitant to do that because of the space reserved at the end for
> the timestamp. Didn't feel right to assign __be32 when it would actually
> be something like
> 
> 	struct {
> 		__be32 buff;
> 		aligned_s64 ts;
> 	};
> 
> But I have no problem doing it.

I looked again.  For this case we have some magic macros and generally
it's not worth the effort of making this dynamically sized unless you
have hundreds of channels.  Here I would move it to the end of
struct ads1262 (so the _DMA_ part of this does the right thing) and use
	IIO_DECLARE_DMA_BUFFER_WITH_TS(__be32, scan, DEFINE_FOR_MAX_CHANNELS);
That will declare a __be32 array but with the timestamp + padding etc.

> >> +static int ads1262_read_chip_name(struct ads1262 *st, char **name)
> >> +{
> >> +	struct device *dev = &st->spi->dev;
> >> +	u8 dev_id;
> >> +	unsigned int val;
> >> +	int ret;
> >> +
> >> +	ret = regmap_read(st->regmap, ADS1262_ID_REG, &val);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	dev_id = FIELD_GET(ADS1262_DEV_ID_MASK, val);
> >> +
> >> +	switch (dev_id) {
> >> +	case ADS1262_DEV_ID_ADS1262:
> >> +		*name = "ads1262";  
> >
> > Given, at somepoint I would guess you'll want to support the auxiliary adc
> > on the 1263, I'd start with a struct chip_info  (with the name in there)
> > and pick that rather than just the name here.  
> 
> Makes sense. In that case I can add a dev_warn if the name doesn't match
> the internal model. Would that be ok or would you prefer dev_dbg?

dev_info() probably as if we do see this it isn't supposed to be a problem
(unless DT is broken). Note there is an ongoing discussion with Kryzsztof about
what we should do for detectable parts like this.  So my mental model
of this might not be where that ends up. (See the various versions of the SLF3S
flow sensor driver).

Jonathan



