Return-Path: <linux-gpio+bounces-28850-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 16295C71239
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 22:22:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 04EFC4E0F24
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 21:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86D922FB624;
	Wed, 19 Nov 2025 21:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="paglm16F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96912E7F1E
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 21:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763587338; cv=none; b=X0Lt2BfjrTA0UBFp/m4YDObQvKQOkVBSedCAIj6md82rY5FMLBpi4wojJ/GNoVSX6sVh9x5NmcJT+8QrMRlJ0LgdZmJxQk0YJRC94CBwaf98kok66e+BCP2Tn3/nzmOySGan/o7rLLMOkElPUDG3R04WEbbc+OsuZZSYp2Uq6ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763587338; c=relaxed/simple;
	bh=DBz0niONnl+seOVorkJ/1kFeqhbKAlpzYMwEYSVEOlM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q3BqthtWgIYs5u4w4owbzmawp0W2DqM97AGwT3NreZ1fzFMgHHTZGWfxXO2Hy3/qdAO8hJ0/hTBNQKXPenn4pLn9kGSuzuSuaQsNETgh9RUnYC6ycGnndXuNzQGETjEtK8YcQ8N7xw+E9mv8GAGSdszvEoO48vP7jYtOEBpM7Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=paglm16F; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59578e38613so124371e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 13:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763587335; x=1764192135; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=66eo3/FCxbT46WW1S08bhZLk8NV3Guy/KGsyPNbaZKQ=;
        b=paglm16F5/OclCayPw+IY/tD7YtH2HmV+Thh/it20JFPgY3jEmdMHy4EYNAdnci0Ky
         vAE3scjVbqzQM5hWNSHLsfqVT6Nr2k0rvvobWH06EjRgTakfNwC874MT7st4BspyLYwC
         Ecfx9bocqKJPJkiIWQntSywi3uOl22+ISd9I4BsYXgJl6gnxguep3hq0DLF+QuYXxWxv
         Gk6+nTqn7XBBT0mDHHrHTbiG+JXsBly0usElkrvJ0VtnSsTMoi4ldIX20kJq9W36Guag
         ZJZFDDSnRHi+ODh2/arRFEvtzQm9OuUanhLLn4kSm5qzxI6iR1GZove0ebwadf+dcHon
         xgAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763587335; x=1764192135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=66eo3/FCxbT46WW1S08bhZLk8NV3Guy/KGsyPNbaZKQ=;
        b=LuKDuapom4Dn5gqJX4NTNfP6DX3mY+gfgnqVamOpNF6a9hzNJ5sD/nYn8PJ9BeS5bO
         y88yL9R0g5or8ouFfPxp0hdhuICrqUU1trEUAHkzvWAoyyZQrr0x2WqWQVx3ovxTq037
         07/1+q5ssHW/ddK6G2h2YRukV8R8nmkfKALJT2GiVQTs/wu4YkWcsUGmTBwtRlzWFS3Y
         DV2jYGAHeOMrbAGhIjTyF7lQsDxFw+76cVV0lWyKLTO0LsudA2xUfYxp4j7VLOkgJPqi
         3Hs9+ewKyiZg4OQ6BHRbiyNtvmD7ijvWO8+EMI1427eWM6cpSCxutit3+br+Gfh+IyOf
         ZJZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUr7OmCe3VZouHJ4tjisMB0zXLHpeJFSovkcxoiqFVGXQuORaER0cUmBBOUsN0blmkzgU4uFBo/c1xI@vger.kernel.org
X-Gm-Message-State: AOJu0YxGYXI3lPGS8pRsxB35SI66NobLiFejQoZRR8ur5aWyvabnAYRO
	r/jF/zY8BrVuTXW0A4Y77JrfzXFJEc85nnc/1xpb7OS6IwpIzwEJoLEydCrW/nA3ajdXoJwZ10k
	ey62hd/zfPWILH9M/arxIbQeogUa/49YBYTRJ8A0+3g==
X-Gm-Gg: ASbGncut8WDOmLJApYOANxWxH9QmvjF1GD1b8R3h6EqlqKbp99kIOyKfVq/MwBX3YVx
	t49fkvvt3+PUpyxeQcJswxz43GD29CqOtFhFTbgqRkJdzaqmpNN1veVvIRaVv6xrv6DBONUuQ99
	BO5VbOTPkuavt0LOUrXZtcvSw4LEn93Sg3zUp8jLp8+EGGHBJNPL1aNbHZlotLo1OWTK6sGzwph
	zXnzhZ9uuJB0iazulhWPpUGT2+4bsjbD8Yxj+ccuGrMdjEyizGfLSUZzgJUOdXy6YmlAM4yec//
	OVdcdw==
X-Google-Smtp-Source: AGHT+IELiSBP2aXqm08BReCsgwxpMOYg15fH+SMrgMDaXnTxP8h9xFapGyVh9++EymMn2Bzw6LukssCo7PGt0VpsR6E=
X-Received: by 2002:a05:6512:3d09:b0:595:82ed:ff28 with SMTP id
 2adb3069b0e04-5969e309670mr93355e87.32.1763587334880; Wed, 19 Nov 2025
 13:22:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117091427.3624-1-antoniu.miclaus@analog.com>
 <20251117091427.3624-2-antoniu.miclaus@analog.com> <20251119-violation-enforcer-1362d3eecb69@spud>
In-Reply-To: <20251119-violation-enforcer-1362d3eecb69@spud>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 22:22:02 +0100
X-Gm-Features: AWmQ_bkWCJ5flHFo7S9tQWx88Mz6raD_BwO06QspIghe4e7ST0AyUuf6Ba9-3ns
Message-ID: <CACRpkdayt+upQxxT-GdQOENWjdF2zz3DLEjcvD7sdg9-oaLwoA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: switch: adg1712: add adg1712 support
To: Conor Dooley <conor@kernel.org>
Cc: Antoniu Miclaus <antoniu.miclaus@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 6:56=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
> On Mon, Nov 17, 2025 at 09:13:22AM +0000, Antoniu Miclaus wrote:

> > +  switch-gpios:
> > +    description: |
> > +      Array of GPIOs connected to the IN1-IN4 control pins.
> > +      Index 0 corresponds to IN1 (controls SW1),
> > +      Index 1 corresponds to IN2 (controls SW2),
> > +      Index 2 corresponds to IN3 (controls SW3),
> > +      Index 3 corresponds to IN4 (controls SW4).
>
> Did I miss a reply about my comment on this switch-gpios? I was asking
> if a binding like this, which doesn't permit any of these not being
> provided is a good idea.
>
> > +    minItems: 4
> > +    maxItems: 4

Maybe we should make them named GPIOs after all, as the switch
has exactly 4 possible GPIOs. It was my request to have an
array I think, and now I feel a bit stupid about that :(

> > +  switch-states:
> > +    description: |
> > +      Initial states for the four switches (SW1-SW4).
>
> Missing an adi prefix? Also, probably should say initial if it is
> initial states.

It should probably be initial-switch-states.

I vote for a generic binding as it is a new "subsystem" in DT,
and this can be exepected for any new switch.

Yours,
Linus Walleij

