Return-Path: <linux-gpio+bounces-27225-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ED94EBE5B5A
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 00:41:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C52214FCB67
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Oct 2025 22:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A34892E1C6B;
	Thu, 16 Oct 2025 22:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a9+6M9ah"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A261E25D1E6
	for <linux-gpio@vger.kernel.org>; Thu, 16 Oct 2025 22:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760654496; cv=none; b=MLUunc8fDTTuWzk3lttcCSfjvGrERGLSqU6ZezRwddkk3sA9LJTy7FUE/ZAHUPnm8ZcB/YGmsJGSjnoEBs4WOlyTCtn2xxGp6M2e1WsPZtGQMbwHD/UFps4LK3/mX3Grb3cveI9wiYlW0gO+4QnvSKsL30V8/LgrPlXTqMs+hFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760654496; c=relaxed/simple;
	bh=aMIxLZM/6U/tLtbB22xRRXB39dw+qCRALwooxcdMsi8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oNk/D8iC8l50oG7MoCF+uIyFir995W7auCL3nPlNNq+Vg+MHqd1mPHybN5Flq0QX9CffqkOH/VnGdCW7snRRNUoinmQUSsBEzlXOQnzejOGpwL/tLaFPPNmVruaMcO4rzOoLrFjuzEZtomqaGssFBpi54uy5/Grd5HPekrLcjlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a9+6M9ah; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-363cb0cd8a1so14933311fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 16 Oct 2025 15:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760654493; x=1761259293; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aMIxLZM/6U/tLtbB22xRRXB39dw+qCRALwooxcdMsi8=;
        b=a9+6M9ahKo1+CjWD7/s7qjkL1rdPbze2hysdRpm6Yl+YAhDdxRCo+3GHSbZjtWZd/1
         fmEJoQa/i+LE7lvtv9ZUJ67bXX3+oLCFz94Uez+vaLRgVvgJosOy7gZ4Ze1G6obp3w4w
         BKnkNjXgK56LNxe+Ip7GSgfwBd5yqtWfdIRJuZzSPb0IzDsUofNc06vidRN61++PJ8lf
         HF00/iyXeLOT8LIQBerf5xCM67meAu1mKETNaQeLlytP1tI28RAXIwcjdh++uwzFNyAr
         UJxzrz7U89uRxdmerLBVamPO9O3qzPSojCWg09IoP50oxCftJ0cqE+/C78hf9lGq+M47
         EbOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760654493; x=1761259293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aMIxLZM/6U/tLtbB22xRRXB39dw+qCRALwooxcdMsi8=;
        b=Du+AM8R5b3N++9yLtzSPjKVkzsBCFGdDlv5lLp5ygvNpnOo+2xc3YeoJfughKxzzCi
         BIOJdUjg2vHheUNTwo7Vj8N8wcBm0AlvFVB85Eulm37DvLiHPA8FWD9tvKJzFzW9n1fC
         f9sdllGz9LtJjYcDmvS2F4NU5xcc3Fx3XZ7SbJphnXjAfBOr3YpjaYg713qyAZDeAXuJ
         v6FhCCs2/1hY2MilmlRkbRPUgmhrmX5kCLeH0vbli4mu/aYIYdJhNvATxiahZHHbqyW1
         QfXb8ZGosV3VF6LN3wpOq8T+ev0yFGJRxwJTemTQC4MbOnH8DnTtkmlGirbrJVBGJceF
         Re5w==
X-Forwarded-Encrypted: i=1; AJvYcCXiTvABFgxo8n9EgYCXa3ZFTX2bOlqucXfWO8X/J2jEyUL9t3qXksqYF5PAeDNwvC5JyaqVkWW/Vo1P@vger.kernel.org
X-Gm-Message-State: AOJu0YzVbZewqrbOT9a/g6Kp40T6rL8FbRtuNGlsz4ju5/tk9/7Wiufk
	+5NzonAUEtlxKz/kSSvEANc5uxIjPdRrsbNH37JCKRQV7RRf5qmxNEamPTEcjRBxOtk9ILZfqS6
	T7Dc0FMiVrpNbv7QcpoiqK6lOBVsj/3C/PFhadE5z4g==
X-Gm-Gg: ASbGncuIHWbxRf65nI3WJwFuvnnl+0eEqBQRtcJftRiqGV1Wvp6vQkrkmL6UVHfv0Vw
	q0DFqRlMw3fepDbrLzZ1ghDk76xxFXrhXzSXPNjTAqPMO5YRBmhNigNxBe9F1DZMkoA2wQ7S57Y
	dDhMa8xQNbTyaDIQd7JwJUxvRPaS19foApVzpjU8deS6pLb1cUwN8r6VCYQeraDBbmicDGNOoVR
	cAyo61Vg/FNXoCl4nSY9aEO1S4lNQSiZFFHCax+z07OicXvJPIT7aVpDT1N
X-Google-Smtp-Source: AGHT+IGgJO7Zemo+LpoVZasQFrmgPrpk7XQQVTw1/TLYvKF3dmLuG/UrVSSNariPEoGP40bDmIuuuFjLjUnIT++2s6Q=
X-Received: by 2002:a05:651c:211c:b0:365:6b40:8656 with SMTP id
 38308e7fff4ca-37797948f9bmr5445311fa.35.1760654492708; Thu, 16 Oct 2025
 15:41:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
 <20251014140451.1009969-3-antonio.borneo@foss.st.com> <20251014-barbecue-crewman-717fe614daa6@spud>
 <CACRpkdZT20cdH+G6Gjw8PopAkir+gGgMtRR4pkjnXFrmDkdfog@mail.gmail.com> <c2a0f301-ec5e-42d7-9df9-09a852a199ad@lunn.ch>
In-Reply-To: <c2a0f301-ec5e-42d7-9df9-09a852a199ad@lunn.ch>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 17 Oct 2025 00:41:21 +0200
X-Gm-Features: AS18NWCfvCVaxN-I2xhCPM2ryQoUWNo2dnNVl4LEycz99TO_NsvVsr2xAwj_RzE
Message-ID: <CACRpkdZX_KJ-G_teTBTwjm_KNmTa5iX4n==yovixvKTOBqqSXw@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] dt-bindings: pincfg-node: Add properties 'skew-delay-{in,out}put'
To: Andrew Lunn <andrew@lunn.ch>
Cc: Conor Dooley <conor@kernel.org>, Antonio Borneo <antonio.borneo@foss.st.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Christophe Roullier <christophe.roullier@foss.st.com>, 
	Fabien Dessenne <fabien.dessenne@foss.st.com>, Valentin Caron <valentin.caron@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 6:37=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:

> > I don't recall the reason for this way of defining things, but one reas=
on
> > could be that the skew-delay incurred by two inverters is very
> > dependent on the production node of the silicon, and can be
> > nanoseconds or picoseconds, these days mostly picoseconds.
> > Example: Documentation/devicetree/bindings/net/adi,adin.yaml
>
>
> I'm missing the big picture here, and i don't see an example of these
> properties being used. However, since you reference an old networking
> example, for RGMII delays....
>
> adi,rx-internal-delay-ps should be deprecated, we now have the generic
> rx-internal-delay-ps. The point about using -ps is however still
> valid.
>
> However, i would not like to see pinctl DT properties used in place of
> rx-internal-delay-ps. How the Ethernet MAC driver implements
> rx-internal-delay-ps is left open, so calling a pinctl API to set the
> skew is fine by me. And if the real use case has nothing to do with
> networking, then i don't care.

The scope here is to describe skewing the timing of any line
connected to a pin, no matter the purpose. Could be an MMC
card for example, or something else, but the point is that
the control registers are general and inside the SoC perimeter,
i.e. around the pins, not necessarily related to any specific
hardware block.

But I guess it could be used for a line used by some ethernet
interface.

But the config here happens on the pin controller, so a specific
hardware block distinct from e.g. an MMC controller or Ethernet
MAC, the latter just have their lines routed through it.

The pin controller will handle some pin named "TX", which is
just a string, a pin controller does not know what this means,
if it is a UART TX or a MAC TX but it can configure the skew
delay of the pin named like so.

Yours,
Linus Walleij

