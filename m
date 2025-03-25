Return-Path: <linux-gpio+bounces-17933-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C41A6EAC2
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 08:44:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D594188E982
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 07:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56226253B51;
	Tue, 25 Mar 2025 07:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xbdkhIqZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A3C25776
	for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 07:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742888647; cv=none; b=A8z49spuQJQXIhTJgnrxpmkFFPDl5/31v2232LEcU9LxdkLZnwZeMpNB4Y1rELR4zvmY+kduOn1UEQUCT/Qp86GOqGuL/SuMXP9b1W3xp0JiO0PnCPA7GpWzjV5ERMq7aZv0KcG0lRWgM+14ECcaay9Nd3qF91u0vYi9r/m55jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742888647; c=relaxed/simple;
	bh=4NiQgZMSwrlR+JP7H+qFxgTQg9u9tPLA/MMcOxm14aI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y1g4/NKlOuyiRtOOkyMm7bjt+CpFANdKMmy7ABBtp7iEApgSb0yf1h5xSITnWPDPI2JTw81Da21/y56EScyxbNmI3mFAS52T5sM1N0Ciq3l7xPWUNlo8AVZxowaDmgD9eIHLNAef7BjP/l9P5OwuyURdxlUWL9EuH8AyAgD2+Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xbdkhIqZ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso27682215e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 00:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742888643; x=1743493443; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eczzhwXoRgAcqLghhwJhTM97oQ4KgvKobW4G8xPa/PU=;
        b=xbdkhIqZw5hCXXi7LidZmGuKsoAPUV0HCNFzuQuAAeJ7D/10erMH4v1soxQoAU9SJD
         fMYCb+ykMbQJE/RM0FmGdeUNc1VWfOhHN3Z5hNJ18tuKWqyTRnS//EVhPOIAWsJ6wV8Y
         NCSOcfemkapWdqakw46NCwf8tfF2AsBzyrRBR/axsyo/0J4cYXz7OehQtgFpxBbTRU7D
         gcU7DcOgt644tmUroTD0HlB38ZOL45/b6rw0Yn8tyCF01KF5V06e048s4br/F8sg9SL7
         UmKzPH9RORvVv6BJNufS0rEnuX9rnAX9KWQUdEdHJE/E8gEaOQfbNVnXRRXyrzJo/Yar
         TfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742888643; x=1743493443;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eczzhwXoRgAcqLghhwJhTM97oQ4KgvKobW4G8xPa/PU=;
        b=hjoC3LBSCgakNy8p28tws+wZ6zwOTt7iT5rO6ALqH6jZvN9JdGwBDHDlk9xSMeEQJh
         Bq1kRRUKBRLGcCzckAOJLZCC0+lkf4liDeYqRERbjwa52QKKkEnYrRUMuds1c7WyyUih
         LOGiYwP0et4c7TrOoJZvV3Az/FWeWeZSCJQYn55IlRoGhQPdFlLbJRO9sW+VzWGEHwQF
         BbuG3xjggkV6LQM5q0KNw0ogYSzSPkBxYMgCxIfZ3jjSPUquI56KAqoLnPx8yo7dt1Nf
         6A+tETVvmz3kqRAvXFzTomPFOw6y8zjJrfuvKZ9e/aQzJvjjMiT7JVJoR7o8RPNsgblo
         trFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNI2Vzc25T+nQL9HlMJXc9IgJrdbS1DswYuURNIOkNeeJa0Mfy7IDsZa8eJW022X0HMtnhis/MXq3x@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn8oWK9winL6pM/YI7cPcXzEqshWGSMiZK7CzxRoOe5rErKbgq
	icEkjoCAbBL967A4kfearEzlAoadZRE60EqQvvejgbUlpIgu/DydBWGaIlId4SQ=
X-Gm-Gg: ASbGnctuKueCQZg/LBgd/VUp+nGXLfilzp13GsOUhHStL8n8ScVvSPPjjoJ5xQuppMD
	rHVvz0TDtxWJSjKH2UivkO/F2z2LhmBNneqIQpc1FKXOivWZG63u4PLNb6xMNnw8TkNQrtQAkzH
	+BObtbOHkT/MdI10ko1MeZtv8157Pf2Rt+omj4mJmT5KFFq1PghtaGAFkrRDucoMIZVMJI+24Gh
	EUfWbaNaSbLDVuJdMx0V+5f30JWS27Dfk3CDFLiIspoZ9AEFBt8xm/F1esc9Tp/cmeHRAQGnTJ/
	kWMmQdkycIcxnruJLeTRd9l+tNJNc2LViP1k+jeGMXmxZ5/L8w==
X-Google-Smtp-Source: AGHT+IGE2O3IeAFMHRAltTNfiA5eMN0un3ogwPPEss4f2Fe3njXvrUl/tTHABRDHWxnCK4rwwyn/3Q==
X-Received: by 2002:a05:6000:1ac8:b0:397:5de8:6937 with SMTP id ffacd0b85a97d-3997f932ddfmr16284259f8f.41.1742888642897;
        Tue, 25 Mar 2025 00:44:02 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d440eda26sm193960045e9.36.2025.03.25.00.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 00:44:02 -0700 (PDT)
Message-ID: <0edda62ae5616bec2453467f21728334ded19286.camel@linaro.org>
Subject: Re: [PATCH v4 4/6] mfd: max77759: add Maxim MAX77759 core mfd driver
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski	 <brgl@bgdev.pl>, Srinivas
 Kandagatla <srinivas.kandagatla@linaro.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Peter Griffin	
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Will
 McVicker <willmcvicker@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, 	linux-hardening@vger.kernel.org
Date: Tue, 25 Mar 2025 07:44:00 +0000
In-Reply-To: <20250321105457.GG1750245@google.com>
References: <20250312-max77759-mfd-v4-0-b908d606c8cb@linaro.org>
	 <20250312-max77759-mfd-v4-4-b908d606c8cb@linaro.org>
	 <20250314123150.GM3890718@google.com>
	 <7d94ed5bd79f0081d392747f74773e7f866252bd.camel@linaro.org>
	 <20250321105457.GG1750245@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thanks Lee for your patience,

On Fri, 2025-03-21 at 10:54 +0000, Lee Jones wrote:
> On Fri, 14 Mar 2025, Andr=C3=A9 Draszik wrote:
>=20
> > Hi Lee,
> >=20
> > Thanks for your review!
> >=20
> > On Fri, 2025-03-14 at 12:31 +0000, Lee Jones wrote:
> > > On Wed, 12 Mar 2025, Andr=C3=A9 Draszik wrote:

[...]
> >=20

> > > This sort of goes without saying.=C2=A0 Suggest you remove this comme=
nt.
> > >=20
> > > > +/* PMIC / TOP */
> > > > +#define MAX77759_PMIC_REG_PMIC_ID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00
> > > > +#define MAX77759_PMIC_REG_PMIC_ID_MAX77759=C2=A0=C2=A0=C2=A0 59
> > >=20
> > > Is this a register or a value?
> >=20
> > It's a value, which the suffix in the macro name was meant to
> > convey :-) 59 is the value (in decimal) for max77759 that
> > the ID register is expected to contain.
>=20
> You mean the REG suffix, that is in both the register address and value?

With suffix, I meant the last part '_MAX77759$' above.

>=20
> And why do you have MAX77759 in there twice?=C2=A0 That's just odd.

Everything starts with max77759 in this driver, for namespace reasons. The
suffix could be different if support for a different ICs was added in the
future, but I'll use your suggested enum below instead.
 =20
>=20
> Suggest that expected values, like IDs are placed in an enum with the
> other supported platforms
>=20
> enum {
> 	MAX77759_CHIP_ID =3D 59,
> 	MAX77760_CHIP_ID =3D 60,
> 	MAX77761_CHIP_ID =3D 61,
> };

OK, will do, although this introduces a new prefix for a symbol name
in this driver in case support for a different ICs was added in the
future.

> >=20
> > >=20
> > > > +#define MAX77759_PMIC_REG_PMIC_REVISION=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x01
> > > > +#define MAX77759_PMIC_REG_OTP_REVISION=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0x02
> > > > +
> > > > +#define MAX77759_PMIC_REG_INTSRC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x22
> > > > +#define MAX77759_PMIC_REG_INTSRCMASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x23
> > > > +#define MAX77759_PMIC_REG_INTSRC_MAXQ=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 BIT(3)
> > > > +#define MAX77759_PMIC_REG_INTSRC_TOPSYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 BIT(1)
> > > > +#define MAX77759_PMIC_REG_INTSRC_CHGR=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 BIT(0)
> > >=20
> > > These look like bit offsets rather than reg addresses?
> >=20
> > Of course, could you please clarify what you're hinting at
> > here?
>=20
> Register bits/masks {c,sh}ould be indented below the register names:
>=20
> #define MAX77759_PMIC_REG_INTSRCMASK		0x23
> #define=C2=A0=C2=A0 MAX77759_PMIC_REG_INTSRC_MAXQ		BIT(3)

Thanks for your clarification.

> > > > +#define MAX77759_PMIC_REG_TOPSYS_INT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x24
> > > > +#define MAX77759_PMIC_REG_TOPSYS_INT_MASK=C2=A0=C2=A0=C2=A0=C2=A0 =
0x26
> > > > +#define MAX77759_PMIC_REG_TOPSYS_INT_TSHDN=C2=A0=C2=A0=C2=A0 BIT(6=
)
> > > > +#define MAX77759_PMIC_REG_TOPSYS_INT_SYSOVLO=C2=A0 BIT(5)
> > > > +#define MAX77759_PMIC_REG_TOPSYS_INT_SYSUVLO=C2=A0 BIT(4)
> > > > +#define MAX77759_PMIC_REG_TOPSYS_INT_FSHIP=C2=A0=C2=A0=C2=A0 BIT(0=
)
> > > > +
> > > > +#define MAX77759_PMIC_REG_I2C_CNFG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x40
> > > > +#define MAX77759_PMIC_REG_SWRESET=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x50
> > > > +#define MAX77759_PMIC_REG_CONTROL_FG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x51
> > > > +#define MAX77759_PMIC_REG_LAST_REGISTER=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 MAX77759_PMIC_REG_CONTROL_FG
> > >=20
> > > You could just use MAX77759_PMIC_REG_CONTROL_FG in-place?
> >=20
> > I think this makes it more obvious in the regmap definition
> > below - struct regmap_config::max_register vs
> > struct regmap_config::num_reg_defaults_raw
>=20
> The attributes are already suitably named.
>=20
> Creating a new define to make this doubly obvious is not required.

Ok.

>=20
> [...]
>=20
> > > Where are the other registers?
> >=20
> > The intention is to add them once we start working on charger.
>=20
> Add it when you do instead.

I've added them here now.

>=20
> > > > +enum max77759_i2c_subdev_id {
> > > > +	MAX77759_I2C_SUBDEV_ID_MAXQ,
> > > > +	MAX77759_I2C_SUBDEV_ID_CHARGER,
> > >=20
> > > Are these truly arbitrary or are you relying on the fact that the
> > > compiler usually starts from 0 and incs by 1?
> >=20
> > It's not arbitrary. A conforming compiler is required to start with
> > 0, this is part of the C standard, e.g.
> > https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1256.pdf=C2=A06.7.2.2=
.3
>=20
> I'm aware of the standard.
>=20
> However from a readability perspective they look arbitrary, so either
> add a comment to say that you're relying on this behaviour and that the
> presence and order of each entry is fixed and should not be amended or
> do future contributors a favour and hard code them from the beginning.

I've added a comment to clarify.

> [...]
>=20
> > > > +	struct mutex maxq_lock;
> > > > +	struct regmap *regmap_maxq;
> > > > +	struct completion cmd_done;
> > > > +
> > > > +	struct regmap *regmap_top;
> > >=20
> > > What is top?
> >=20
> > One of its functional blocks as per the data sheet. I think
> > it makes sense to use nomenclature from it.
>=20
> Maybe a comment should be added to say what top actually represents.
>=20
> Not all readers of this code will have the datasheet open.

I've added a kerneldoc to the struct, hopefully that's good enough :-)

>=20
> > > > +	struct regmap *regmap_charger;
> > > > +};
> > > > +
> > > > +struct max77759_i2c_subdev {
> > > > +	enum max77759_i2c_subdev_id id;
> > > > +	const struct regmap_config *cfg;
> > > > +	u16 i2c_address;
> > > > +};
> > > > +
> > > > +/* TOP registers */
> > > > +static const struct regmap_range max77759_top_registers[] =3D {
> > > > +	regmap_reg_range(0x00, 0x02),
> > > > +	regmap_reg_range(0x22, 0x24),
> > > > +	regmap_reg_range(0x26, 0x26),
> > > > +	regmap_reg_range(0x40, 0x40),
> > > > +	regmap_reg_range(0x50, 0x51),
> > >=20
> > > What are these magic numbers?=C2=A0 Can you define them?
> >=20
> > This is on purpose, as I think it makes it much easier to have
> > the ranges as numbers, otherwise you always have to look them up
> > in the header when trying to verify correctness or simply looking
> > at this. Additionally, things wouldn't be nicely aligned anymore,
> >=20
> > Without data sheet, whether these are numbers or macro names
> > makes no difference, and it's impossible to reason about them.
> >=20
> > With data sheet, it's easier this way to compare.
> >=20
> > But I'll change them.
>=20
> Or provide come helpful comments.=C2=A0 Magic numbers are generally decri=
ed.
>=20
> This is made worse here, since it's not obvious what this function block =
does.

I've added some comments, hopefully better :-)

[...

> > > > +	struct device *dev =3D regmap_get_device(max77759_mfd->regmap_max=
q);
> > >=20
> > > > +	static const unsigned int timeout_ms =3D 200;
> > >=20
> > > Why 200?
> >=20
> > This is what downstream uses, I can add a comment to say so.
>=20
> We're not generally interested in downstream here.
>=20
> Why do downstream use it?=C2=A0 Is there a value in the datasheet?

No, there isn't. We know that 200ms must work reliably since downstream
uses that value, hence I re-used it.
I've dropped it to 20ms now, since in most cases in very simple tests it
takes less than 5ms, but I don't know if there are cases when e.g.
the uC is busy (e.g doing USB-C related handling) where it might take
longer. I guess we'll see.

>=20
> > > > +
> > > > +	if (cmd->length > MAX77759_MAXQ_REG_AP_MESSAGESZ_MAX)
> > > > +		return -EINVAL;
> > > > +
> > > > +	/* rsp is allowed to be NULL. In that case we do need a temporary=
. */
> > >=20
> > > More details please.
> > >=20
> > > Why is NULL valid?
> >=20
> > The kernel doc explains it:
> >=20
> > =C2=A0* @rsp: Any response data associated with the command will be cop=
ied here;
> > =C2=A0*=C2=A0=C2=A0=C2=A0=C2=A0 can be %NULL if the command has no resp=
onse (other than ACK).
> >=20
> > Do you want me to duplicate this information?
>=20
> You already did, just in a less useful way.
>=20
> It's arguably more critical to document it here than tucked away in the h=
eader.
>=20
> > > Why does it need a placeholder?=C2=A0 What are you using as the place=
holder?
> >=20
> > Here, we still need a location to write the response to, as we
> > need to verify that the command was indeed completed correctly.
>=20
> Then please tell all of the future readers who may have the same queries.

The header / kdoc is for API users, so it makes sense to have it there. I'v=
e
updated the comment here as well.

> > > > [...]


> > > > +	ret =3D devm_mutex_init(&client->dev, &max77759_mfd->maxq_lock);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	i2c_set_clientdata(client, max77759_mfd);
> > > > +
> > > > +	for (int i =3D 0; i < ARRAY_SIZE(max77759_i2c_subdevs); ++i) {
> > >=20
> > > Any reason for the pre-increment?
> > >=20
> > > If not, it's more standards to post-inc.
> >=20
> > My reason is that historically compilers have created better code
> > with preinc, and I generally still prefer it, to make it obvious.
>=20
> Is this still true today?
>=20
> Historically, we used program computers with punched cards as well.=C2=A0=
 =3D:-)
>=20
> > There are thousands of users doing preinc in for loops in the kernel
> > tree, so unless you really insist, I'd like to keep it that way for
> > that reason if you're OK with reason :-)
>=20
> Let's play top-trumps:
>=20
> % git grep "++i" | wc -l
> 7062
> % git grep "i++" | wc -l
> 75158
>=20
> There is more than an order of magnitude of difference between the
> styles and I bet quite a few of the aforementioned cases were authored
> because they _required_ pre-inc.

It's unlikely that

$ git grep 'for (i.*++i' | wc -l
5861

_require_ pre-inc. But sure, since that's the preference, I've changed it

>=20
> [...]
>=20
> > > > diff --git a/include/linux/mfd/max77759.h b/include/linux/mfd/max77=
759.h
> > > > new file mode 100644
> > > > index 0000000000000000000000000000000000000000..b038b4e9b748287e23e=
3a7030496f09dc8bdc816
> > > > --- /dev/null
> > > > +++ b/include/linux/mfd/max77759.h
> > > > @@ -0,0 +1,98 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > > +/*
> > > > + * Copyright 2020 Google Inc.
> > > > + * Copyright 2025 Linaro Ltd.
> > > > + *
> > > > + * Client interface for Maxim MAX77759 MFD driver
> > > > + */
> > > > +
> > > > +#ifndef __LINUX_MFD_MAX77759_H
> > > > +#define __LINUX_MFD_MAX77759_H
> > > > +
> > > > +/* MaxQ opcodes */
> > > > +#define MAX77759_MAXQ_OPCODE_MAXLENGTH 33
> > > > +
> > > > +#define MAX77759_MAXQ_OPCODE_GPIO_TRIGGER_READ=C2=A0=C2=A0 0x21
> > > > +#define MAX77759_MAXQ_OPCODE_GPIO_TRIGGER_WRITE=C2=A0 0x22
> > > > +#define MAX77759_MAXQ_OPCODE_GPIO_CONTROL_READ=C2=A0=C2=A0 0x23
> > > > +#define MAX77759_MAXQ_OPCODE_GPIO_CONTROL_WRITE=C2=A0 0x24
> > > > +#define MAX77759_MAXQ_OPCODE_USER_SPACE_READ=C2=A0=C2=A0=C2=A0=C2=
=A0 0x81
> > > > +#define MAX77759_MAXQ_OPCODE_USER_SPACE_WRITE=C2=A0=C2=A0=C2=A0 0x=
82
> > > > +
> > > > +/*
> > > > + * register map (incomplete) - registers not useful for drivers ar=
e not
> > > > + * declared here
> > > > + */
> > > > +/* MaxQ */
> > > > +#define MAX77759_MAXQ_REG_UIC_INT1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x64
> > > > +#define MAX77759_MAXQ_REG_UIC_INT1_APCMDRESI=C2=A0 BIT(7)
> > > > +#define MAX77759_MAXQ_REG_UIC_INT1_SYSMSGI=C2=A0=C2=A0=C2=A0 BIT(6=
)
> > > > +#define MAX77759_MAXQ_REG_UIC_INT1_GPIO6I=C2=A0=C2=A0=C2=A0=C2=A0 =
BIT(1)
> > > > +#define MAX77759_MAXQ_REG_UIC_INT1_GPIO5I=C2=A0=C2=A0=C2=A0=C2=A0 =
BIT(0)
> > > > +#define MAX77759_MAXQ_REG_UIC_INT1_GPIOxI(offs, en)=C2=A0 (((en) &=
 1) << (offs))
> > > > +#define MAX77759_MAXQ_REG_UIC_INT1_GPIOxI_MASK(offs) \
> > > > +				MAX77759_MAXQ_REG_UIC_INT1_GPIOxI(offs, ~0)
> > > > +
> > > > +#define MAX77759_MAXQ_REG_UIC_INT2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x65
> > > > +#define MAX77759_MAXQ_REG_UIC_INT3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x66
> > > > +#define MAX77759_MAXQ_REG_UIC_INT4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x67
> > > > +#define MAX77759_MAXQ_REG_UIC_UIC_STATUS1=C2=A0=C2=A0=C2=A0=C2=A0 =
0x68
> > > > +#define MAX77759_MAXQ_REG_UIC_UIC_STATUS2=C2=A0=C2=A0=C2=A0=C2=A0 =
0x69
> > > > +#define MAX77759_MAXQ_REG_UIC_UIC_STATUS3=C2=A0=C2=A0=C2=A0=C2=A0 =
0x6a
> > > > +#define MAX77759_MAXQ_REG_UIC_UIC_STATUS4=C2=A0=C2=A0=C2=A0=C2=A0 =
0x6b
> > > > +#define MAX77759_MAXQ_REG_UIC_UIC_STATUS5=C2=A0=C2=A0=C2=A0=C2=A0 =
0x6c
> > > > +#define MAX77759_MAXQ_REG_UIC_UIC_STATUS6=C2=A0=C2=A0=C2=A0=C2=A0 =
0x6d
> > > > +#define MAX77759_MAXQ_REG_UIC_UIC_STATUS7=C2=A0=C2=A0=C2=A0=C2=A0 =
0x6f
> > > > +#define MAX77759_MAXQ_REG_UIC_UIC_STATUS8=C2=A0=C2=A0=C2=A0=C2=A0 =
0x6f
> > > > +#define MAX77759_MAXQ_REG_UIC_INT1_M=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x70
> > > > +#define MAX77759_MAXQ_REG_UIC_INT2_M=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x71
> > > > +#define MAX77759_MAXQ_REG_UIC_INT3_M=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x72
> > > > +#define MAX77759_MAXQ_REG_UIC_INT4_M=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x73
> > > > +
> > > > +/* charger */
> > > > +#define MAX77759_CHGR_REG_CHG_INT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0xb0
> > > > +#define MAX77759_CHGR_REG_CHG_INT2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0xb1
> > > > +#define MAX77759_CHGR_REG_CHG_INT_MASK=C2=A0=C2=A0 0xb2
> > > > +#define MAX77759_CHGR_REG_CHG_INT2_MASK=C2=A0 0xb3
> > > > +
> > > > +struct max77759_mfd;
> > >=20
> > > Place the definition in here instead.
> >=20
> > I would like to keep it private. There is no need for it to
> > become public, it's meant to be an opaque handle.
>=20
> No, it's not.
>=20
> It's device data that you already shared with all of the children.
>=20
> If you don't want them to have it, don't give it to them.

It's normal to have opaque handles for API users if those API users
don't need to know implementation details, like in this case.

Anyway, I've made it public.

Thanks Lee!

Cheers,
A.


