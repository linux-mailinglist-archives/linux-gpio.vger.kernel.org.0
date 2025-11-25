Return-Path: <linux-gpio+bounces-29050-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B876C82F09
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Nov 2025 01:32:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3844034AFC2
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Nov 2025 00:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5C1A1DD9AD;
	Tue, 25 Nov 2025 00:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XyHi3n+F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641CB1F5E6
	for <linux-gpio@vger.kernel.org>; Tue, 25 Nov 2025 00:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764030721; cv=none; b=lHV8tfHE7JHXnH82E8Lk4zlPtcDmh+JoDLk9RTjmi/HYh3E2AMSiBd15S3aTEulgFEzli7f0/+M8Jejfs/NyUD87EN32iPPLDp6+A2EgqAeGSk/uXPCx0Es8JIJwezxrj9O12MDT3MTH8foqpCSlLctI20y/U+Bexxer2ko7Ovk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764030721; c=relaxed/simple;
	bh=YXRMmDcOf3SBmF0ybmtdfDmy3iWblMD9XwQvvi9imaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XAjjO/3MmdR7rRMYk1plK6FNklXqKw/XQ1JxzagGVct0Y0uwbkawUBOrWQQ0lnlvciZ2jN/3t9MqOVqsmtYrBQA41Ra7iRxWRDvB4mpzhSYv1Fce4QgGp1jW+RFOaqcqtDir/UClD9B1aeEGAbPMV2ozwtnyC94b5IRojHjMZgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XyHi3n+F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B6BC4CEFB
	for <linux-gpio@vger.kernel.org>; Tue, 25 Nov 2025 00:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764030721;
	bh=YXRMmDcOf3SBmF0ybmtdfDmy3iWblMD9XwQvvi9imaI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XyHi3n+FXn1U+hyOgxhp2mBGbf72oZT3W7/aMg+rB4S4Q2uLnInvHIHpgNVcknEx7
	 YBLOHXWxV5GWhYU2XiGzGHdgLF3jCdrq6Nfc6Hm8zMpv6SKXBI0Cgpdl+i2Eo9wr5I
	 b9oz7hFBEbybb00LPEmM0h5IlRlcj3KmCQ0P+QWDLskEazyaI9cft88uY5Ird1p98G
	 SPiD0JYccNimu50n9FAQuU42SNxrJpbeai2nPYBw/NfKUyXJu1Db/Wi+KSuIext/NA
	 4UXM9gY774FkmRZLKAdF7zuXU5lqCMBF8NPlZQaGd6622utTrfv9Z0czz10oZMhp+u
	 C8EAVhjvebqjw==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-78ab039ddb4so11814237b3.3
        for <linux-gpio@vger.kernel.org>; Mon, 24 Nov 2025 16:32:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVK1BHxb6hwDm/UrSJoSWGYdwkpLdC8DWmmLwPgoTLI7y5xTbwZgDUu1f4pY7541qSITCJhmcVQ+Fdq@vger.kernel.org
X-Gm-Message-State: AOJu0YwgOYo1ACN1UccZycEec2qAUULY+HiYEehn4RH4AdIzTu1Un1FQ
	WkVUWivb+QSr3sdI9L/8STltmpW1z9GL88vlfj/Hu08XyoFVZ+bKfqFN4N3Olp1vLj3dkszJ+kh
	3EvHWi9ysIeDxP9XqC8+D2tXp3+AgdwA=
X-Google-Smtp-Source: AGHT+IFieSQ/ae+kgkMUYbZx+XFJqpSVSCv1nRKKV5z+TUZTUDYUw/33xebYY0dwRi57SIMyogySO4uHTpRS2JRkK5w=
X-Received: by 2002:a05:690c:6286:b0:789:4f19:7fc3 with SMTP id
 00721157ae682-78a8b47a514mr114312557b3.12.1764030720388; Mon, 24 Nov 2025
 16:32:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-lantern-sappy-bea86ff2a7f4@spud> <20251112-improving-tassel-06c6301b3e23@spud>
 <CACRpkdYQ2PO0iysd4L7Qzu6UR1ysHhsUWK6HWeL8rJ_SRqkHYA@mail.gmail.com>
 <20251119-bacterium-banana-abcdf5c9fbc5@spud> <CACRpkda3Oz+K1t38QKgWipEseJxxneBSC11sFvzpB7ycnqsjBA@mail.gmail.com>
 <20251120-silicon-oyster-5d973ff822d9@spud> <CACRpkdaM3Hkbxx99uXx6OVdSbdhNNc3voS1FoUsz2oAUEc1-qA@mail.gmail.com>
 <20251121-epidermis-overdue-1ebb1bb85e36@spud> <20251121-skimpily-flagstone-8b96711443df@spud>
 <20251124-operative-elephant-16c2c18aebde@spud>
In-Reply-To: <20251124-operative-elephant-16c2c18aebde@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 25 Nov 2025 01:31:49 +0100
X-Gmail-Original-Message-ID: <CAD++jLn4z9KFTRoROZ8aKnK-1v=_magjgSq7JJJYt0=CO=gH4A@mail.gmail.com>
X-Gm-Features: AWmQ_bkn9EePTgm0OSsoOxFfH0goMSJAGfSKKK1uQTpQck9jEVcydWtB4EYS7LA
Message-ID: <CAD++jLn4z9KFTRoROZ8aKnK-1v=_magjgSq7JJJYt0=CO=gH4A@mail.gmail.com>
Subject: Re: [RFC v1 2/4] pinctrl: add polarfire soc mssio pinctrl driver
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	Valentina.FernandezAlanis@microchip.com, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 6:16=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:

> I was looking at the kernel part of this today, trying to figure out
> where it would make sense to actually check this, but I'm not super keen
> on what has to be done. I think doing it in parse_dt_cfg() makes the
> most sense, setting flags if the property is one we care about during
> the loop and then checking mutual exclusion at the end based on the
> flags? The gpio example you gave has it easy, since they already appear
> to have these things stored in flag properties.
> Is there somewhere else, in addition to creating the config from dt that
> this would have to be checked?


We are right now parsing with an array of
struct pinconf_generic_params:

static const struct pinconf_generic_params dt_params[] =3D {
    { "input-disable", PIN_CONFIG_INPUT_ENABLE, 0 },
    (...)
};

(Sorry for not using C99 .initializers on the above array)

Struct looks like so:

struct pinconf_generic_params {
        const char * const property;
        enum pin_config_param param;
        u32 default_value;
        const char * const *values;
        size_t num_values;
};

Can't we add a
    const enum pin_config_param *conflicts;
    size_t num_conflicts;

And rewrite the parsing table to be more explicit:

static const char * const input_disable_conflicts[] =3D {
    "input-enable",
};

static const struct pinconf_generic_params dt_params[] =3D {
    {
        .property =3D "input-disable",
        .param =3D PIN_CONFIG_INPUT_ENABLE,
        .default_value =3D 0,
        .conflicting_properties =3D input_disable_conflicts,
        .num_conflicting_properties =3D ARRAY_SIZE(input_disable_conflicts)=
,
     },
    (...)
};

Then in the loop we can use of_property_present(np, ...) to check for
conflicting properties when we encounter something.

Yours,
Linus Walleij

