Return-Path: <linux-gpio+bounces-38418-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b5gAJ5USL2rG7gQAu9opvQ
	(envelope-from <linux-gpio+bounces-38418-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Jun 2026 22:44:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E11B682359
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Jun 2026 22:44:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=HYWhiIa4;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38418-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38418-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81458300915C
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Jun 2026 20:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52E4F3264F1;
	Sun, 14 Jun 2026 20:43:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11E32F7F07
	for <linux-gpio@vger.kernel.org>; Sun, 14 Jun 2026 20:43:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781469839; cv=none; b=DuE47k/TsDbvABX+ShUjUvno7oNGsJkz5mUOJXaTCjGeD1LD78Qv4CuAVuiHkv6h5Aswd5iM3t3P/irPqSMlVuz7DhGO7PBE6F12GABZLkuDILwrJyLy4+upenpUT8//lLhPpXcoGvWQAq78o/prs2COX0f3VSru4pyD44swTho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781469839; c=relaxed/simple;
	bh=D27UulZYaetxYDKjX/8/X7LYBqLyMAuGnFuaAW4GWvo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=DfwI6+V6yX1yR04RCoIYCe9p6/wSS3FQrEntiAflBxvBuUDzf+tIb6Wh5Scc7l+FcCePQXOtlVn8KBxyAVAqieiPN2/v1Li0D4RDY1p206K2tkBXaBOnlIBzFSZFBmwxUOzGbgDpIfhrYEfIj4e0K+kZ27KFuoMECACqO1f+zuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HYWhiIa4; arc=none smtp.client-ip=209.85.217.50
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-6cb414a5d50so2220846137.3
        for <linux-gpio@vger.kernel.org>; Sun, 14 Jun 2026 13:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781469837; x=1782074637; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73FE8dDRzs2A2yFSDW5KK1ljxB2vUgkxUvq5kN7HbwI=;
        b=HYWhiIa42lb0pv7HPvRUnu/svzoLpVL07KJRWfHjlFzzO9I4ejpB41F17Nfa34hAsA
         x3gD/Ccn0l7KPbCj5UTeslwBAqdDp4aeB7aX/0XTnKiOTl3QJ1PcyneWOR5oW1sq3kKw
         GOVTydYLSJQ2fMOMLk/JOQX6ptxNfhI8P36ckE3kDFavp+5qrQvpuOO6+ICbz1q8L3yU
         37kLxKBl6uwPX/qSGS20TyxsIw0oaG1tazuLk+0r8d7FWiYBaT3/MCpihrsRQeGLK00W
         DO2sACQ3eSYmgi2HSikIs619hid/KBf60az9iFiuUda/k8BR1x7zOnVx+5xlMaJYZ3ma
         oOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781469837; x=1782074637;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=73FE8dDRzs2A2yFSDW5KK1ljxB2vUgkxUvq5kN7HbwI=;
        b=OQ7+oue0VWlPftbpPHgULbdx0ecFATHs1f7EBmDFdgzIffN0wxw1/jG5hWxLmpymMf
         /xRBZweOsq3Y58WSr/v+W48We7YkkL8zRqsKagYbPQFX+r/ghnwcpfZxkzHIkm2x3fHN
         mOM0M16rS/fOoTu8+yyy+5q/Qtuz2gSJPxKcYdcoZ/3nbGSgNwCzdIhDVat3vXxHNzlY
         ZxRbbt6WsykmDcDPgwAsIc3DXrD99eQSlyPb7FumK9YkviXrI+K/Y56EVcBSjiMZGEuj
         CMmmYdzDpEpV3NgTKOVJVvaQWPgrY8JFb1ZNYvHGyxjB/Kf4jMLxFDY3nm2DeATLLL29
         2YSg==
X-Forwarded-Encrypted: i=1; AFNElJ/s2o1VOQxCqhM/IFidMB/4nLBVmqoGgftsUeqJKOo6y/QPLylFcAd99ec5b1njuQUnfzIc+zjSFZdS@vger.kernel.org
X-Gm-Message-State: AOJu0Ywov/0uxW+u1Ua4JvT7DrNzLpNSf+A7ViWfpgrlWG+Fs7T4GIEe
	B/XlJWUMqt6oa356QCxR/P59LvydLEDK6HLTf3Mn/ZUat0YIup6K5oWdzPrB3A==
X-Gm-Gg: Acq92OGD8tuBzFu46G7+qzzCwpQ/h/1k73eypoNOHCxXOD1lBPerP9MndtH9h4f+TiS
	oBw9jtpG4vWc8eulzPL7+ROZISBB0YBzO+kwi33EbDeX171lXeQt6p0r9mImkNA5a+Zzugae6f4
	ECDpifcCP7xZbh0FjX4+57W9a1HHUvaek7ak9oxOeRDTzaeeK244tbWIHWFC8NCkz3N9XMsRknL
	nGqf+Ut80+UwbEF8+kbt89RbIAmD2P3Luya0/WbUKP8RTKR4x46a2HWsbG6zy6qgiaQisWRZx9E
	fDeBL/AXVYOA8D1KLbmzO3cAMTkehFDwUdeUT/F7bCimBsIXaTzjvr6YnCRuX5F3dNcVzhiMDwr
	gi8Y08O4ADinZY8PhrLj28Q97Q/SQqaPMsDvYkLSDVh71RVVK2zifY7RefNjTfLfhbiWfcs+a2g
	PzZBqpKoXNLddFPQ==
X-Received: by 2002:a05:6102:3f06:b0:64e:32c3:1458 with SMTP id ada2fe7eead31-71e88d95324mr6724172137.22.1781469836702;
        Sun, 14 Jun 2026 13:43:56 -0700 (PDT)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-966a05a7da1sm1696835241.10.2026.06.14.13.43.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 13:43:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 14 Jun 2026 15:43:49 -0500
Message-Id: <DJ92CLJIJ04T.3HSUHGGSF8EPG@gmail.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Linus Walleij"
 <linusw@kernel.org>, "Bartosz Golaszewski" <brgl@kernel.org>, "David
 Lechner" <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, "Andy Shevchenko" <andy@kernel.org>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 5/5] iio: adc: Add ti-ads1263-adc2 driver
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Jonathan Cameron" <jic23@kernel.org>, "Kurt Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260612-ads126x-v1-0-894c788d03ed@gmail.com>
 <20260612-ads126x-v1-5-894c788d03ed@gmail.com>
 <20260613151047.57cd074f@jic23-huawei>
In-Reply-To: <20260613151047.57cd074f@jic23-huawei>
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
	TAGGED_FROM(0.00)[bounces-38418-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: 3E11B682359

On Sat Jun 13, 2026 at 9:10 AM -05, Jonathan Cameron wrote:
> On Fri, 12 Jun 2026 17:46:23 -0500
> Kurt Borja <kuurtb@gmail.com> wrote:
>
>> The TI ADS1263 includes an auxiliary, 24-bit, delta-sigma ADC (ADC2).
>> ADC2 operation is independent of ADC1, with independent selections of
>> input channel, reference voltage, sample rate, and channel gain
>>=20
>> Add support for this ADC as an independent IIO device, through the
>> auxiliary bus API.
>
> A few things inline.
>
>>=20
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>
>> diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
>> index b33505e7fdc7..1a4b2f934d43 100644
>> --- a/drivers/iio/adc/ti-ads1262.c
>> +++ b/drivers/iio/adc/ti-ads1262.c
>
>> +static int ads1262_aux_device_setup(struct ads1262 *st)
>> +{
>> +	struct device *dev =3D &st->spi->dev;
>> +	struct ads1263_adc2_channel *chans;
>> +	struct auxiliary_device *adev;
>> +	struct ads1263_adc2_ctx *ctx;
>> +	struct fwnode_handle *node;
>> +	int id, ret;
>> +
>> +	node =3D device_get_named_child_node(dev, "adc");
>> +	if (!node)
>> +		return 0;
>> +
>> +	ctx =3D kzalloc_obj(*ctx);
>> +	if (!ctx) {
>> +		ret =3D -ENOMEM;
>> +		goto out_node_put;
>> +	}
>> +
>> +	id =3D ida_alloc(&ads1262_ida, GFP_KERNEL);
>> +	if (id < 0) {
>> +		ret =3D id;
>> +		goto out_free_adc2;
>> +	}
>> +
>> +	chans =3D kcalloc(st->num_channels, sizeof(*chans), GFP_KERNEL);
>> +	if (!chans) {
>> +		ret =3D -ENOMEM;
>> +		goto out_free_id;
>> +	}
>> +
>> +	for (unsigned int i =3D 0; i < st->num_channels; i++) {
>> +		chans[i].negative_input =3D st->channels[i].negative_input;
>> +		chans[i].positive_input =3D st->channels[i].positive_input;
>> +	}
>> +
>> +	ctx->chip =3D st;
>> +	ctx->num_channels =3D st->num_channels;
>> +	ctx->channels =3D chans;
>> +	ctx->enable =3D ads1263_adc2_enable;
>> +	ctx->start =3D ads1263_adc2_start;
>> +	ctx->stop =3D ads1263_adc2_stop;
>> +	ctx->read =3D ads1263_adc2_read;
>> +	mutex_init(&ctx->chan_lock);
> devm_mutex_init()

I actually call mutex_destroy() on device .release.

I think it makes more sense that way, otherwise we would UAF?

[...]

>> +struct ads1263_adc2_ctx {
>> +	struct auxiliary_device adev;
>> +	struct ads1262 *chip;
>> +	/* Protects channel state */
>> +	struct mutex chan_lock;
>> +	struct ads1263_adc2_channel *channels;
>> +	unsigned int num_channels;
>> +	int (*enable)(struct ads1263_adc2_ctx *ctx,
>> +		      const struct ads1263_adc2_channel *chan);
>> +	int (*start)(struct ads1263_adc2_ctx *ctx);
>> +	int (*stop)(struct ads1263_adc2_ctx *ctx);
>> +	int (*read)(struct ads1263_adc2_ctx *ctx, __be32 *val);
>
> I'm not sure I see this loose coupling as that useful. I'd just export th=
e
> functions from the other module and add them to this header.
> Maybe I'm missing why you need this complexity.

I'll go for the exported (NS) functions. Much cleaner that way.

I don't know where did I read this callback approach was a way to handle
auxiliary devices and I got fixated on that.

[...]

>> +static int ads1263_adc2_channels_setup(struct iio_dev *indio_dev)
>> +{
>> +	struct ads1263_adc2 *st =3D iio_priv(indio_dev);
>> +	struct device *dev =3D &st->ctx->adev.dev;
>> +	struct ads1263_adc2_ctx *ctx =3D st->ctx;
>> +	struct iio_chan_spec *chns;
>> +	unsigned int i;
>> +
>> +	/* Account for the timestamp channel */
>> +	chns =3D devm_kcalloc(dev, ctx->num_channels + 1, sizeof(*chns),
>> +			    GFP_KERNEL);
>> +	if (!chns)
>> +		return -ENOMEM;
>> +
>> +	for (i =3D 0; i < ctx->num_channels; i++) {
>> +		guard(mutex)(&ctx->chan_lock);
>> +
>> +		ctx->channels[i].refmux =3D st->refmux;
>> +
>> +		chns[i] =3D ads1263_adc2_iio_voltage_template;
> Rather than using a template like this I'd just set it all here using
> a designated initializer.  Means there is one place to see all the fields=
.
>
> 		chns[i] =3D (struct iio_chan_spec) {
> 			.type =3D IIO_VOLTAGE,
> 			.indexed =3D true,
> 			.differential =3D true, //not sure why this wasn't in your template.
> 			.channel =3D ctx->channels[i].positive_input;
> 			.channel2 =3D ctx->channels[i].negative_input;
> 			.scan_index =3D i,
> 			.scan_type =3D {
> 				.format =3D IIO_SCAN_FORMAT_SIGNED_INT,
> 				.realbits =3D 24,
> 				.storagebits =3D 32,
> 				.shift =3D 8,
> 				.endianness =3D IIO_BE,
> 			},
> 			.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |
> 				BIT(IIO_CHAN_INFO_SCALE) |
> 				BIT(IIO_CHAN_INFO_HARDWAREGAIN) |
> 				BIT(IIO_CHAN_INFO_SAMP_FREQ),
> 			.info_mask_shared_by_all_available =3D=20
> 				BIT(IIO_CHAN_INFO_HARDWAREGAIN) |
> 				BIT(IIO_CHAN_INFO_SAMP_FREQ),

Sounds good to me.

> 		}
>> +		chns[i].scan_index =3D i;
>> +		chns[i].channel =3D ctx->channels[i].positive_input;
>> +		chns[i].channel2 =3D ctx->channels[i].negative_input;
>> +		chns[i].differential =3D true;
>> +	}
>> +
>> +	chns[i] =3D (struct iio_chan_spec)
>> +		IIO_CHAN_SOFT_TIMESTAMP(ctx->num_channels - 1);
> That macro has recently become a designated intializer so
> 	chns[i] =3D IIO_CHAN_SOFT_TIMESTAMP(ctx->num_channels - 1);
>
>> +	chns[i].scan_index =3D i;
>
> Isn't this just overwriting the ctx->num_channels - 1 we just
> passed in above?

It is. Thanks!

[...]

>> +static const struct auxiliary_device_id ads1263_adc2_auxiliary_match[] =
=3D {
>> +	{ .name =3D "ti_ads1262.ads1263_adc2",
>> +	  .driver_data =3D (kernel_ulong_t)"ads1263_adc2" },
> 	{
> 		.name =3D "ti_ads1262.ads1263_adc2",
> 	  	.driver_data =3D (kernel_ulong_t)"ads1263_adc2",
>
> Though I really don't like forcing that cast in there and it should be ir=
relevant
> given there is only one entry in this table.  Should be fine to just hard=
 code that
> where used.  If you need this later, wrap it in a structure.

You're right. I'll add a NAME macro.

I don't think we'll ever add entries here.

>
> 	},
>
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(auxiliary, ads1263_adc2_auxiliary_match);

Thanks for your feedback, Jonathan! Apologies if this version was a
little rough... I'm a bit embarrased by the bugs found by Sashiko.

--=20
Thanks,
 ~ Kurt

