Return-Path: <linux-gpio+bounces-37572-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LnhMrPIFmpVrwcAu9opvQ
	(envelope-from <linux-gpio+bounces-37572-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 12:34:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D645E2CEC
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 12:34:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3522030C1F51
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 10:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A14553F166A;
	Wed, 27 May 2026 10:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fiQnfptP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC6E3E4C95
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 10:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779877500; cv=none; b=ZEw9cB71Ye0484xoUt7qQp/3VKte8ROe9o+EHaCAdSDNq33sEsRzr1b+4OdfuD/iWIW3tTKzoGtb9Fk3xwvtW1uTGeMxTdg6qR+wMGfqF0wlpOtB+yUV6EnWmrB/VesS61EEUOtOEjXBb7EiCEJ3+EtT49HvNtGkiROtCr4uo4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779877500; c=relaxed/simple;
	bh=54Vut8yEUPqwoDxtfS6e/+CRmN6rV6D4iOKfCHrDefM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F+a5omIm84tDdbEehCkmc7CjntQcuQvB+Z3og24oJcdzidhyjw6mh06p8RnTNO7Vc3rf0EyFQuuHPM92lSCVbcABii4wAfU9dIVv6v7EJL/jkptg4CyrZeR8Z2v9eeigoaOLhnTjpFHMhVNMIzSGdCtmM54LUl+0UBAtiTanIN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fiQnfptP; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F5261F00A3E
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 10:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779877499;
	bh=PhjmxFjwwCN9mtL0tweSuVfQWxjCoorbOogxFYHAm6g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fiQnfptPOhWQF4VrktqLigvY3/5wu+QuTdnXVssp/5NGyJeTZq/O4Fj9Ij+Fq3OfT
	 iE/JdEjaaBFqhrhJqv37ovl0nASlhBOmMmZi6jqCigYW9SIs2ExwYnfy4njIgDktAf
	 uz8FCmh8yyvranRiyV9OZZDqyiGdggBIys9dc6eiZOmG9sa7dtaU1mJRo8wG1wnvLa
	 phn23ZAya5dck2djyhgHKn4dPHP1AbMFQe6LM3Ve8WxjEExEFbAiorbNgpuN60uCds
	 3eJopsetYpIk2zwBKWs7WZUiSTBc+KVNPGEXTTm4xig0Zu9cMJDypYqrUHgilBaQ/F
	 Rukc/2+AEs1gw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aa4b50e054so637814e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 03:24:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8+VI1ZU+Lb0jZbV6iLRzoLBB3BE39RPCmqcm4WFSrli9Su3SRt9TGTWfuLHHG+8ifLmeugGT6fhzC/@vger.kernel.org
X-Gm-Message-State: AOJu0YxP2EQCKBtrSdw7SNMRTVUFAroT0NbVNQx6z21vfMT4AHI2b38g
	JhJBqSjtP0JdLqGOhG4V+ZPY0EdBn+7U8Hxjj+bCuUcnbx7Aww781xqXkalcXUN+qnbARRscmKA
	8UzEfB90r/k7k40lJtJ7kUFQUN0IttGM=
X-Received: by 2002:a05:6512:66c6:20b0:5a8:fbe0:bc59 with SMTP id
 2adb3069b0e04-5aa323713femr5083827e87.26.1779877497800; Wed, 27 May 2026
 03:24:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520173129.1382489-1-markus.stockhausen@gmx.de> <CAMRc=Mf6EQDF-fSVb+jhmLvMUi2eJ5QhukKC08S-T12HKinibw@mail.gmail.com>
In-Reply-To: <CAMRc=Mf6EQDF-fSVb+jhmLvMUi2eJ5QhukKC08S-T12HKinibw@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 27 May 2026 12:24:44 +0200
X-Gmail-Original-Message-ID: <CAD++jL=d9e5HiR=JtwNjiDy-ihq-kzPo+1JtxH4Mwm+LZ6CG5A@mail.gmail.com>
X-Gm-Features: AVHnY4KsezWlZhA89NKwYqbOlKvs0VxGBAW0VxlCJY7vE6O64KDdhO6fPwFE_8A
Message-ID: <CAD++jL=d9e5HiR=JtwNjiDy-ihq-kzPo+1JtxH4Mwm+LZ6CG5A@mail.gmail.com>
Subject: Re: [PATCH v3] i2c: i2c-gpio: Enhance driver for buses with shared SCL
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>, wsa+renesas@sang-engineering.com, 
	andi.shyti@kernel.org, linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmx.de,sang-engineering.com,kernel.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-37572-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 31D645E2CEC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 10:59=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:

> >  /*
> >   * Toggle SDA by changing the output value of the pin. This is only
> >   * valid for pins configured as open drain (i.e. setting the value
> > @@ -53,7 +72,7 @@ static void i2c_gpio_setscl_val(void *data, int state=
)
> >  {
> >         struct i2c_gpio_private_data *priv =3D data;
> >
> > -       gpiod_set_value_cansleep(priv->scl, state);
> > +       gpiod_set_value_cansleep(priv->scl->gpio, state);
>
> That one bothers me a bit. We're driving a clock line but may end up
> sleeping? That doesn't sound right. We typically do:
>
> setscl();
> udelay();
>
> I know it's been like this before and maybe I'm not understanding the
> whole picture so feel free to disregard the comment.

I think there are people driving I2C on slow buses, i.e. a bit-banged
GPIO I2C on a GPIO expander which is itself on I2C.

I'm not saying such hardware design is a good idea, but I think
I've seen it...

The only way to make that work is to use gpiod_set_value_cansleep().

Yours,
Linus Walleij

