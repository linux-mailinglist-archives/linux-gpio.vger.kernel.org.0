Return-Path: <linux-gpio+bounces-28718-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A337C6C457
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 02:38:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 1AD9A2C01B
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 01:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5BF623EABC;
	Wed, 19 Nov 2025 01:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DyrYJZc8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951012236EB
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 01:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763516289; cv=none; b=iuey7GVjyIuuA5lHPyWuwmuR8R23UXRn085d+owdIOdFwpkWKFa9Z/+4/FF3wUiqp1uoX9pX0uAGxGsaKBCr3dUwi6R+9lASBVUr73RUxSGQ19a8aOlt9rHxcv2/0l8nUyNtAPtyo8sbXEqNS/+dKRlkRJYol1nS1L9pvpnVuS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763516289; c=relaxed/simple;
	bh=1zFHC/D3qDhaCV+4B0RKeie8bN/hEL/zcC1isKO/Ij8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HBjBuk0yyOgwb6zlr71YMs+suAWRvZLHrUUfM9qWkg/2NArZhzIq5GW7Rjni5hX7HnIM2IdHG07LLujD0tZIMXoKfM4F8a8wkgoq2YLKTIohmHKCRwubEoYFsDDwBqT7QE98W9aUjcyyJK3RrmEB206G0o3ygMCgoAu9p+m/HYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DyrYJZc8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E37F3C2BCAF
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 01:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763516288;
	bh=1zFHC/D3qDhaCV+4B0RKeie8bN/hEL/zcC1isKO/Ij8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DyrYJZc8PgBRbAWOD6ahSAjnzIZaAqEDmWlYJTBg0b3QY4dMYvGY0G2Tn5olZ4p2U
	 QNnPAldLRTslZLnkMYnS5Z1+lq6Tq66u+4Yr+obMtLYF4pOmQItSd38GqYdktJE2sx
	 MRD5Ju7sIBAeUc6ppPCrGjezJqskwzg+qe+7bU6c+tWJyfFlT6L+lPHw3+bKVj0+3A
	 iuzhnfwQNKHTAJaVd5y345ThFOeP53Du8E0dYPpizfNat9k4HX9deSmtYDxf02eHXc
	 4KqYP2Hq9PuTzQmxkf8QVXz2dvcCmjb6m89tssDv66CxklYSgoDttBfhpasEuPt4p9
	 5LOFRx6xZqWlA==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-640aa1445c3so9613652a12.1
        for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 17:38:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWvTwAZlC1zAkYrJ5Tb0XOIPk/7pmhgQopIvuA0EJaLn63p1gw1nmaPg+RtPJPXkSmCX0ZXK2gG/xZS@vger.kernel.org
X-Gm-Message-State: AOJu0Yx71NtcoXkYQJkjeJ77ApzHBPNi8xpaVXyV6S5TEpr4p61mv8HE
	BHmQcOCeWY7rhqqDSX6xiiD5NgsME0uhZJomvjtuHguMiuiFgrmjuBw/xv+jHVHrwkFgqHaFB75
	qFfaiFA2s+YQkwN+Df+qQKVeJECECbQ==
X-Google-Smtp-Source: AGHT+IEGIARixQQxL/Z1vr1zZwusANAarRAXKjnwQT9SgCWjwfycQbJPhMJgCUV5i3+Ije/OVDWoe3jsxHkuyDWz110=
X-Received: by 2002:a05:6402:2396:b0:640:a836:eacf with SMTP id
 4fb4d7f45d1cf-64350ead477mr11536886a12.26.1763516286855; Tue, 18 Nov 2025
 17:38:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117215138.4353-1-sander@svanheule.net> <20251117215138.4353-3-sander@svanheule.net>
 <CAL_Jsq+Mzj+3d4q+xQLq_GEYzRJA6E+CEJ9M8FQH6kL9eBZhVg@mail.gmail.com> <9fc358372ef267530b4304b4fa1cf5643c18cb42.camel@svanheule.net>
In-Reply-To: <9fc358372ef267530b4304b4fa1cf5643c18cb42.camel@svanheule.net>
From: Rob Herring <robh@kernel.org>
Date: Tue, 18 Nov 2025 19:37:55 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKKpymk_i9c=29Zq0QSzHMU3x0RPWjBMmW84k_5jUe4Jg@mail.gmail.com>
X-Gm-Features: AWmQ_bma3IwgMlrXQXQ04kE3R6adJH2pYZDDa4bWglo_Mov9dGx6o8xd45F7CwY
Message-ID: <CAL_JsqKKpymk_i9c=29Zq0QSzHMU3x0RPWjBMmW84k_5jUe4Jg@mail.gmail.com>
Subject: Re: [PATCH v7 2/6] dt-bindings: mfd: Binding for RTL8231
To: Sander Vanheule <sander@svanheule.net>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Michael Walle <mwalle@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 3:57=E2=80=AFPM Sander Vanheule <sander@svanheule.n=
et> wrote:
>
> Hi Rob,
>
> On Tue, 2025-11-18 at 15:28 -0600, Rob Herring wrote:
> > On Mon, Nov 17, 2025 at 3:52=E2=80=AFPM Sander Vanheule <sander@svanheu=
le.net> wrote:
> > > +patternProperties:
> > > +  "-pins$":
> > > +    type: object
> > > +    $ref: /schemas/pinctrl/pinmux-node.yaml#
> >
> >          additionalProperties: false
>
> In this case dt_binding_check doesn't recognize input-debounce. The follo=
wing seems to
> work for the provided example:
>
> -    $ref: /schemas/pinctrl/pinmux-node.yaml#
> +    allOf:
> +      - $ref: /schemas/pinctrl/pincfg-node.yaml#
> +      - $ref: /schemas/pinctrl/pinmux-node.yaml#
> +
> +    additionalProperties: false
>
>
> with this included in the led node properties:
> +      input-debounce: true
>
> If I understand correctly, "unevaluatedProperties: false" (like for the l=
eds binding)
> would allow everything from the referenced pincfg-node and pinmux-node sc=
hemas, which is
> more than is actually supported by this device.

Yes, that works too. The first way lets you be explicit about which
referenced properties are used, but either way is fine. If it is only
1 property, then I'd probably go with the first way.

Rob

