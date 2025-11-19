Return-Path: <linux-gpio+bounces-28748-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DE884C6E688
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 13:16:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 8BA482DACF
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 12:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A60A9311C07;
	Wed, 19 Nov 2025 12:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xyCYeZHO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2A78821
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 12:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763554592; cv=none; b=Rcd6S/CJ+ZOCP1ieyFQlQH06EVfrE1D3gbbOqO76X4FKMvAhEsUGPkHyHtxte7/NbQlpXVUOU+ExoOr+09IgD+3tpOmP3obAuZCZgCTrJtruJVSipnOmnOn+hQb/zcYaw0Z1atfb1fJeNe57kYX8dK+mTQDwltRozoW5iY9++2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763554592; c=relaxed/simple;
	bh=6/PhrrVSQDzzgciifbMK5F9YvfY+nnwOb5SXC9Sks0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EISDGKUuVWj3LnOkBdlumChzWFWIG8UygCQpxTWQbdf8qaJumtC/E7zleuJYkIKQ8JEuRp1r1L6pSmRV1/a0lVHUtuY8NGH/mGEha3wNCkeDGXOqIS4zKDvsu7LC/LODwLDmXUoWpTpJBuwUf6RHuM84Ws5TlIKfW7d4ooX95qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xyCYeZHO; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59578e38613so7243957e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 04:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763554589; x=1764159389; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sHPaeKsEbeRiFEHcjj+tBilONoLgLzURpxTSyMgOFPA=;
        b=xyCYeZHO9IvtOyecCZbcHN3CIpb7hhZkw3PynVCA3yBYq7iThGYLOtxnDUM146ihYm
         W2ws4hLulGds+g96vuSsw74ecOfXCawgKmESbwVjjhIrJHLKhjN5aTblmRBjn+ioDVOL
         v98J/osc802jPIKUl1lL3lfMQgfafpzit8njf6DBeKofD6OzdevblwBfBNO8OMEg621/
         +hE9Pje+HmySW8GrDkKDgYq8Nsc4QwsBilsAeBCfG6wEyIZwu2p8u4jEGJ3SK8hpaIKA
         3+e3z2Lw8huUYwueyycd6s9mnJAfaKJyBipRKFepAb1mqGi3KIdkHTQWqbwIVzffVSEF
         0wnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763554589; x=1764159389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sHPaeKsEbeRiFEHcjj+tBilONoLgLzURpxTSyMgOFPA=;
        b=IcffrFyVYFAB8ap8f83nYKrZxPiJuVEiod2BDYVSjq4GakjMY8g7P9vwtsS3RTNU2u
         06zrPbWVEfeIuoMxiFna8jazzOXRn7gTVJy/1jRkU7gwdES+ouBJ20tnXPiDRACxzASH
         A8oPR1WGsKgyEK+dxYZpuXP8l0bU9G8xmDfvghbUjhV6RFtjTrSmqv8Wa9+eZpaqiAbQ
         bCuQAnFzi4w8730C0NPq644VHve7qjeNP0InTGNfdMPUbfbEKBziCxclZzCYQv4IWjz+
         qI9HAARESYYP5Be2ghxC+O1fAl5KGvBbnDFVIOdqabsVoAkUok4u+ntYCvYOp+g98ZN9
         JRCw==
X-Forwarded-Encrypted: i=1; AJvYcCWFt4dgynCTKiKJ2AB2GJcgAhB9vn7EEu4uGr7JuPCRWSy4k/etKyXuGff+iQ+d2KXZShZnApTZ5B1s@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1PHwL7iwSQjbY469V2qPdYY2oQCNy/jK53DXjvAgNOd8IgU6O
	y3ej91n+/HWCs+qQEEHHH6XGZDgzNukfFq96fhzI+LAZ/FgwL9u5DdgjY4599tazcSRd/nWbaOn
	DGd9sg9Gc6Un0zWRV81VJrmZEXcE8w5vtgRqvxn7ujM+mYOAPE6iXIv7vRA==
X-Gm-Gg: ASbGncuUCCC/xl04dHArYAUczuwmGMiom8CFc2iQKDUSdEQfxTr+xyGB8dyyyafBtJM
	uFyTH+dXGSLoLUS/xWALsGkJ5/UyuBw1NniDn+LeQm6ZmRVXYQ+gp/49dCx1VqLKv276H8NTS8x
	GZJKqcIuNmwHj3bQOUYPLXlwKdYlMEuVXrLnUyJAR53ZGFdQPRtjDyZAO8OReXLJcFSwTvZG15W
	p2/ImWqx+UGnd0RB2mYX5tE59iA7qVlgY+SHyJdXtvIq8MpvRKrBCA6oi265Pc34uH9mQoE3Ggi
	RTBuNw==
X-Google-Smtp-Source: AGHT+IHDywYiWcri0I745jv79pvTBz4VunGvT3/T6dEdfyVdHk1YRWLlH1QfwFM6eBV3bVpEzskWBVibEPo3gaoFC64=
X-Received: by 2002:a05:6512:3056:b0:595:8258:ccc7 with SMTP id
 2adb3069b0e04-5958419ebccmr5995505e87.1.1763554588792; Wed, 19 Nov 2025
 04:16:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-lantern-sappy-bea86ff2a7f4@spud>
In-Reply-To: <20251112-lantern-sappy-bea86ff2a7f4@spud>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 13:16:16 +0100
X-Gm-Features: AWmQ_blX1Suu08MFi1LMSKPgGOqo8LltGij5xY2-PL2zAc2tvG1HjaDITzQtWKs
Message-ID: <CACRpkdZuopbAyHaZQpeGh0+V7v6Cg5uJwscmVPCfjHghNbPymg@mail.gmail.com>
Subject: Re: [RFC v1 0/4] Microchip mpfs/pic64gx pinctrl part 2
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	Valentina.FernandezAlanis@microchip.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 3:33=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:

> Got the other driver that I was talking about here for you...
> It's in RFC state because I'd like to get some feedback on the approach
> while I try to figure out a) what ibufmd is

I was going to ask about that :D

> and b) how the bank voltage
> interacts with the schmitt trigger setting.

Please check if "bank voltage" is somewhat analogous to
this generic config:

* @PIN_CONFIG_POWER_SOURCE: if the pin can select between different power
 *      supplies, the argument to this parameter (on a custom format) tells
 *      the driver which alternative power source to use.

> There's some specific @Linus questions in the driver, mostly where I was
> unsure about how config bits should be handled and looking around at
> other drivers wasn't sufficient because they did different things.

I tried to answer as best I could.

> Finally, on the dt side, this was using the pinmux property before the
> other drivers were submitted, but I didn't really like it to begin with
> (shoving two things into entries of the same property gives me the ick).
> I moved to using pins + function which at least looks prettier in the
> devicetree.

I think this looks way better than any pinmux properties.

> I had been hoping that I could move to some sort of generic
> dt_node_to_map function, but I couldn't figure out one that'd work
> without creating groups in the driver. If there is, I'd love to get rid
> of the custom dt_node_to_map stuff.

It seems like something that could be added to the core
(drivers/pinctrl/devicetree.c), if you feel like and have time for going
the extra mile. Maybe it would be simple to move some drivers
over to using it if done right.

> I want to avoid doing having set groups, because of the number of
> possible configurations in the MSS Configurator FPGA tool is fairly
> large, and I believe that MSS Configurator actually undersells the
> number of possible combinations for ease of use.

FPGA:s often have this "phone exchange" property.

> I haven't tested that
> and the driver technically doesn't support it, but I feel like not trying
> to define groups statically and using pins instead would permit those
> combos in the future should that use case ever materialise.

It makes sense for a driver for this type of very flexible hardware.

Yours,
Linus Walleij

