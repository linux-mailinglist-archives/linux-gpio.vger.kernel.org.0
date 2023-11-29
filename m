Return-Path: <linux-gpio+bounces-669-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1E67FD8D3
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 15:00:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49D89282FEA
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 14:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D98D249F8;
	Wed, 29 Nov 2023 14:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FwqjyUo6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24CFA194
	for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 06:00:52 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5cd59f77d2dso63857917b3.3
        for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 06:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701266451; x=1701871251; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCC/9FFHNPmSAvzhxutRUBRRybrgfLjmAxexqz97QwM=;
        b=FwqjyUo60rfXa30VDKbLoezKFlRoVm3iYhoHayaNiT9O2KytflIPx7XN9vUmffyEX1
         w29DWIntpUv1foGz5EPYBElbnzRt50QusN29dhGxjklg/NIi41J55ckCpdmSY0eGSDDF
         7T+2Rg3iDwpxFjPvErZhTwaYSY2s3rAgW/AW3KFnCNqscDTZNFWzy99ojirkN03LACHR
         rbGn0XKVE3cou2/rwtAU3WHOm6mobNipKLbU0R4W0jU5pQENfIiuZx2PEVbCGIxYf4Fy
         km9lK0yWFJGU0uicGp3MVDvx/O58wkxW/JtxbZhEUX4qObdFavFA6dPYlC8Y3JN7lKjj
         d8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701266451; x=1701871251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oCC/9FFHNPmSAvzhxutRUBRRybrgfLjmAxexqz97QwM=;
        b=pWYeJD11kMTEbjjHqj3fqAL0eqI3pdHP5X4cQ3uTYkoykcIPLPp5IASwX+rxKfR7Zn
         Te1yhvbBXIlNwpMMVYUL8sTcC1FYET4z5W36VxkVdjOq5mLHuVfWCn1QxEiok8rviKNY
         VoSnUh5i065/B/SuVX+oqWguKvVxs41SOeSfdgEw1LkJg9OGp3LOoAtnT5xc2t86DlU5
         8tIzMaRUDMb9gfKWW97C1Z7QVa6ds636Q4b3LnyUN4GS2PSowoDyDfZGh+mGlhn03TWX
         LjL3m8EKVHYrzr6l92pzTcR68Bxd1JzL74hXlXsSO1/8zwxnqPcmrTBz4ACcRWEdknwy
         zVqQ==
X-Gm-Message-State: AOJu0YyatQp9q1bs/DcJT8Fy/2PXHIsey9+Rd+FxnEjYpCRhd0wnxfhi
	pfHqpBFlZsS1qQs477Bp7Z4HpI89yEfR+phxBSST1A==
X-Google-Smtp-Source: AGHT+IFyoJirUdQ/sHjIeBYN1D+GunZnohdARQN0SA5/H2NW+f4SA+dOckGi81cdAlrBV7YDQYJpmmvPxIePT364dOM=
X-Received: by 2002:a0d:c607:0:b0:5c8:708f:1ea with SMTP id
 i7-20020a0dc607000000b005c8708f01eamr19853375ywd.32.1701266451319; Wed, 29
 Nov 2023 06:00:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128132534.258459-1-herve.codina@bootlin.com>
 <17b2f126-f6a4-431c-9e72-56a9c2932a88@sirena.org.uk> <CACRpkda5VMuXccwSBd-DBkM4W7A1E+UfZwBxWqtqxZzKjrqY4A@mail.gmail.com>
 <511c83d1-d77f-4ac0-927e-91070787bc34@sirena.org.uk> <CACRpkdYmN4318b1wXwUOeFjPN0S2w8M9FpXHOs3LtFa+XoTxVw@mail.gmail.com>
 <20231128173110.0ccb8f53@kernel.org>
In-Reply-To: <20231128173110.0ccb8f53@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Nov 2023 15:00:40 +0100
Message-ID: <CACRpkdbrH-WWVrVWx6MvReUuUW8tU_J8Mb7nW3G8fJGAoiS38g@mail.gmail.com>
Subject: Re: [PATCH 0/5] Add support for framer infrastructure and PEF2256 framer
To: Jakub Kicinski <kuba@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Herve Codina <herve.codina@bootlin.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 2:31=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
> On Tue, 28 Nov 2023 15:51:01 +0100 Linus Walleij wrote:
> > > > I thought this thing would be merged primarily into the networking
> > > > tree, and I don't know if they do signed tags, I usually create an
> > > > immutable branch but that should work just as fine I guess.
> > >
> > > Right, I'd expect a signed tag on the immutable branch - it's general=
ly
> > > helpful to avoid confusion about the branch actually being immutable.
> >
> > Makes sense, best to create that in the netdev tree if possible
> > I guess.
>
> I think you offered creating the branch / tag in an earlier reply,
> that's less work for me so yes please! :)

OK I fix!

Just waiting for some final reviews to trickle in.

Herve: nag me if it doesn't happen in time!

> FWIW I usually put the branches / tags in my personal k.org tree.
> I don't wanna pollute the trees for the $many people who fetch
> netdev with random tags.

Aha yeah pin control is relatively small so I just carry misc sync
tags there.

Yours,
Linus Walleij

