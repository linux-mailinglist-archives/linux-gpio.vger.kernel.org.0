Return-Path: <linux-gpio+bounces-28851-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B3466C7126C
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 22:32:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8D35D4E1B34
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 21:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C0BF2E8DE2;
	Wed, 19 Nov 2025 21:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lxufwLkS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F67C2BEC3F
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 21:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763587923; cv=none; b=aGvtChfRmQztaPOZSXUBgd/YQ5Klax02byh/cFc358uQY5uCw6grD4pddrIRpIWoZcjlw/+MZ2KXTGcuZ8+0lbXLyWSQ+Upev0mn8tAdFK7pwbMVIDyd/OBfiuys3iPxYWtKQb49Lrzy1aeqdC9YcrwM7+ssB4PLsIHaUl86cxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763587923; c=relaxed/simple;
	bh=mVB1MbwnQfQlHf07ijpysVavaLBaywlSzHCRmPkLJLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gpFhh2zGSvKtOkWwAtmfL0n0Knd++dNE5jRhu/+MwUvD4Kdg6TpLn1ked97Y6dc4WFkRdFmtJDZeABrd7+YQSAJQ3J8y8QU+wF29BlZmzT40WRruguWhd87sA6xpF4kjqvxgPD0dlgJU5uN4S7GMoLUoHAHcP5l8BNCw1pc7jq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lxufwLkS; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59583505988so221202e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 13:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763587919; x=1764192719; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HocDJXkQ2Q6yyvCf4hMp3RyQdj90OfFx0/4EzdPNA9M=;
        b=lxufwLkSMuFry7kQ2llQ6z3z173GsPxIfqXvVm7IeYhsEZXmXRb700IbOa4AOOnJK4
         A4ipvjU+k0bTs6XkgLQ1mnTJCPdTC+1gDFrwMEVnW78ot+BxN+6di4W1hpC05AHyA7LV
         GwsiEX1iWcS+cfXHoeXygfJZZ+OrXbNjupD7l+eRimkWiBsy8pdzeN3F2CjV2rLoQpP4
         x/aqCkKh73Zg/E2rB5Wr8T4YFKCvFyQnOrl8bKYED4Btts4Lqg6OcZXpHGFsINahbANE
         Qv2GkC8omi63FvMVzaqw13onYWXDE4hs4XB5d/sSaYS+Fm3HS7Um6zkTEOdkugPSVxnA
         ArAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763587919; x=1764192719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HocDJXkQ2Q6yyvCf4hMp3RyQdj90OfFx0/4EzdPNA9M=;
        b=B2+DTs62O9Tz6DUJZgYisrp1TxMTIId2HNtI6lpCY+X+XwplSJRIQtx+XB4KUwCtIq
         0wIIJGMIusu/PACh2eMqFHKHuLk0TmMQtaz7KnRrAsX22Dgd7WnEaP27LBjDeROSizcK
         WDRSbi1JvI8/lQWtBwfDYbZ7DEqH6vne2fpOPCP2XrLFiMo2UsGBorTWuB7OuKLMcVQE
         cZhcgTc1IoghHlHigTzzcjybmLkZ5iXbjGWBo0Scvw0IHeXWTgqmuis8DIoI5VIh0Rxa
         oJp192Nk15GKAukVHWkJzlytv8bE5D6dmhXtBf3Mwyv7ThTulLh3vaTVuA0TxrGVhaNK
         WUGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmP6xu8lFH3OHcrZ3oi+N0uWh798X76OX3TkjuRh6IqfMH00cvNKB0X87MB99AgbSN0yRDuJF4yFEe@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7brL4ZX8aEahpHLWTgEdDsTM6JHypX/LSLb/CF3llOAj3q3ER
	xZDx/abDj0XZdygWcSd1e8IdpgTkpEK/IO2X4V+iEl8zqdBZMkQd/KDIi3S9NXqKo3t213lXeYs
	WIdhGOxp7FpXrqxhGkGVQTXz7XdiQ97rV9dkJiiMcLw==
X-Gm-Gg: ASbGncsJ2fj04z1ucH8+JV9JiUzrcDSxQDdR7InQcj9OlzsYxHtyOvdY95LDsAIJEjN
	qS+1rL6Zne9ydRToeXytk5m1Pn9sy32mfiHUxQ5tVFO6sDnZc86nkxyjrw68KohyfpFcDpCfsQS
	JV5TOO9otBF9jbQhjFQbJj1xK8gqhznzCrMuloKdzjk0wiccjFgS3a7fq6dIE1PRSIgYmRgpbOl
	SYSiulybWbck7L2vAfZgnJbyJkWomB88qgnyf2WxLn5zWHcQR/TOE6n3tbR4LtnuiaO9zVZBetv
	TVPlvAzMacUadXAC
X-Google-Smtp-Source: AGHT+IHgKJZ+SWPM4wa4nrVw15UoZXSYF+Rsbp7Y292h6A5/pwa6mBhxgsEzpCfYHBnPDRYXAHWslM9zDPk2zQkCQc4=
X-Received: by 2002:a05:6512:3b9d:b0:591:c8ef:f838 with SMTP id
 2adb3069b0e04-5969ea19b30mr8399e87.17.1763587919299; Wed, 19 Nov 2025
 13:31:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-lantern-sappy-bea86ff2a7f4@spud> <CACRpkdZuopbAyHaZQpeGh0+V7v6Cg5uJwscmVPCfjHghNbPymg@mail.gmail.com>
 <20251119-citadel-shrine-fabc3fb309ac@spud>
In-Reply-To: <20251119-citadel-shrine-fabc3fb309ac@spud>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 22:31:47 +0100
X-Gm-Features: AWmQ_blkeQoQzQj8RKExyC77QH3TjIh7D9NaBoglihjgPogd19TpoYdh4P2O0Go
Message-ID: <CACRpkdZOak-+Aahj7fte9gk9m+76LOguEsO7bBbHTMTfLExWcA@mail.gmail.com>
Subject: Re: [RFC v1 0/4] Microchip mpfs/pic64gx pinctrl part 2
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	Valentina.FernandezAlanis@microchip.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 7:06=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
> On Wed, Nov 19, 2025 at 01:16:16PM +0100, Linus Walleij wrote:
> > On Wed, Nov 12, 2025 at 3:33=E2=80=AFPM Conor Dooley <conor@kernel.org>=
 wrote:

> > > and b) how the bank voltage
> > > interacts with the schmitt trigger setting.
> >
> > Please check if "bank voltage" is somewhat analogous to
> > this generic config:
> >
> > * @PIN_CONFIG_POWER_SOURCE: if the pin can select between different pow=
er
> >  *      supplies, the argument to this parameter (on a custom format) t=
ells
> >  *      the driver which alternative power source to use.
>
> It's not pin based, the whole bank it is connected to has to be changed.

So there *is* such a thing as a group pin config setting for a
whole group of pins. Groups are not just for functions...

And I don't know what is meant by a bank here, but it seems
to be exactly a group of pins.

From arch/arm/boot/dts/gemini/gemini-sq201.dts:

 /* Set up drive strength on GMAC0 and GMAC1 to 16 mA */
conf9 {
    groups =3D "gmii_gmac0_grp", "gmii_gmac1_grp";
    drive-strength =3D <16>;
};

If you look in driver/pinctrl/pinctrl-gemini.c you find:
gemini_pinconf_group_set()

static const struct pinconf_ops gemini_pinconf_ops =3D {
        .pin_config_get =3D gemini_pinconf_get,
        .pin_config_set =3D gemini_pinconf_set,
        .pin_config_group_set =3D gemini_pinconf_group_set,
        .is_generic =3D true,
};

OTOMH it's actually *fine* to *just* use groups for pin config like this
and *not* use it for muxing, i.e. have this group correspond to
a bank and not use that group for anything else than to set this
or any other per-bank property. But have a look!

Yours,
Linus Walleij

