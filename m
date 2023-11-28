Return-Path: <linux-gpio+bounces-584-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 621787FBD32
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 15:51:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E426282DFE
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 14:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7AFE5B5DA;
	Tue, 28 Nov 2023 14:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pGA1AxnE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7144D62
	for <linux-gpio@vger.kernel.org>; Tue, 28 Nov 2023 06:51:13 -0800 (PST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5cd3c4457a0so53452317b3.3
        for <linux-gpio@vger.kernel.org>; Tue, 28 Nov 2023 06:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701183073; x=1701787873; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mtKmT2DzohXXoeUBiHE1NcptmxFv6Dlq3tIhE5fHNKY=;
        b=pGA1AxnEi0vbxlKeQTOZmHBhbdAZg/XT8T/uVzs6SlTOCS/gE09/1JHaHENUP8BHvw
         916kqWzTq4du3rRsYUDSkMsQBjPh9uy/YkqA80Fsq80SFqKtgx997MrvEtxQpPjkogt9
         lx445AtC7C9M2jnZgQhmpS+C9s3lXBsqldeMwOBu3RodutPKgzlCx+OkI8cz1389e63P
         S/11yo5yDQTzAnMDfqxW2Rgn3ScLkTvFa3bhIuQdJug0OGgY5l3WjTNVG6P9E1s8ZwI5
         L3RF42wP0Z9nsIDoU3/Rh53QEhjdPSYHuYloEHQQMHH/hrPNiaARB/DA2sVjxbDEauUu
         YxlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701183073; x=1701787873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mtKmT2DzohXXoeUBiHE1NcptmxFv6Dlq3tIhE5fHNKY=;
        b=lb7PWAKrrOu4/ZuC6KWKflzh827ZmSqWSppWfrJ8ghtTEbyK9PDLH94HYxyhSNjfVk
         VXEmKm3rjQbu50Vf6Iw72F3rw2FJ07OzpopOuHJvWZmQl0/rp2KBWLGhExXjkKFzPN0u
         im/mGmfNJdyefA1U242SdbUGhtRkVAWVc6/fQ9yHwiK7YYBzyPWUD7Sy2lpfByLHhoNp
         2nXZeZikwWrZuC2i/vnj+u/IVfyM2O/5/q6HOYMpTFYf2Cp4FNhuUv8tdJrMcriZqX7p
         9YqSmxYSlthbpVxhx2mtJj9hodcwZfzw7gqN8SlTwVQNIhGLB7AbGUgnfRggCwYbVnZR
         iZvw==
X-Gm-Message-State: AOJu0Yw14GSoEr4+bKJ0ZA7nwvSJvMkQaz8c2LIrQQUx5M2CLI5GNiFF
	lKpjNQYXkxLYG6bsMhGv4KuxHc9Wh2LWn5DLNCsFBw==
X-Google-Smtp-Source: AGHT+IFicSzJpbzDad6aZAB4TqQT3PWofoExEOGqMaEEhn64uKOyh66vKgcpu9+rbTZ3JgFvV5lGar3bJdV2yzjDIas=
X-Received: by 2002:a05:690c:2d87:b0:5ce:98c8:df07 with SMTP id
 er7-20020a05690c2d8700b005ce98c8df07mr11919406ywb.26.1701183073137; Tue, 28
 Nov 2023 06:51:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128132534.258459-1-herve.codina@bootlin.com>
 <17b2f126-f6a4-431c-9e72-56a9c2932a88@sirena.org.uk> <CACRpkda5VMuXccwSBd-DBkM4W7A1E+UfZwBxWqtqxZzKjrqY4A@mail.gmail.com>
 <511c83d1-d77f-4ac0-927e-91070787bc34@sirena.org.uk>
In-Reply-To: <511c83d1-d77f-4ac0-927e-91070787bc34@sirena.org.uk>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Nov 2023 15:51:01 +0100
Message-ID: <CACRpkdYmN4318b1wXwUOeFjPN0S2w8M9FpXHOs3LtFa+XoTxVw@mail.gmail.com>
Subject: Re: [PATCH 0/5] Add support for framer infrastructure and PEF2256 framer
To: Mark Brown <broonie@kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 3:41=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
> On Tue, Nov 28, 2023 at 03:26:56PM +0100, Linus Walleij wrote:
> > On Tue, Nov 28, 2023 at 3:03=E2=80=AFPM Mark Brown <broonie@kernel.org>=
 wrote:
>
> > > If this gets applied it'd be good to get a signed tag based off Linus=
'
> > > tree so things that depend on it can be pulled into other trees (eg, =
the
> > > ASoC mapping for the framer).
>
> > Do you mean my pin control tree or the big penguins tree? :D
> > (I'm guessing mine.)
>
> I actually meant mainline there.

Ah based off, not residing in. My bad.

> > I thought this thing would be merged primarily into the networking
> > tree, and I don't know if they do signed tags, I usually create an
> > immutable branch but that should work just as fine I guess.
>
> Right, I'd expect a signed tag on the immutable branch - it's generally
> helpful to avoid confusion about the branch actually being immutable.

Makes sense, best to create that in the netdev tree if possible
I guess.

Yours,
Linus Walleij

