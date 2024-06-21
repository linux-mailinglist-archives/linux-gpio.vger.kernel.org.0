Return-Path: <linux-gpio+bounces-7603-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17849911F68
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2024 10:54:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0F1328D5F5
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2024 08:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17CE916D9BF;
	Fri, 21 Jun 2024 08:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SIhxydNv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CF216C856;
	Fri, 21 Jun 2024 08:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718960035; cv=none; b=csnA7YIthm9orDnObyN3YSjKqoTjgAnC3koFr9v2hPZE4EE7jyaGFkhFKTvusP240sJkVsXmArEAaWrssXzL141XbN/lncslqQJiw5f8DjDkCKvMnMUqo+Ms6dNhMUfCgNfp4IXIudWMPaYfj4fAMZL/ZsHnbX7yhC8lagmlxV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718960035; c=relaxed/simple;
	bh=AtFinZsMgiIIHjA21Sc0KoGjJvdqQ5HCKFk1uDEBWL8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=keoybxCJL/8c6tRu4x/qFvj6wJpg3eVB0AdZBxfoW/07H9Ju1mNL44P+VQaUk1j46+6cBm/uoAZJQ320c0E9vwG024qhUIpRkh0C9enWrXYomwF00b5Fk3eLF/LbM6byf0YlaZwInysOdXxLr2ii7YiHzylfelNDYACXUFsH8iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SIhxydNv; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2eaae2a6dc1so33362471fa.0;
        Fri, 21 Jun 2024 01:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718960032; x=1719564832; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C2NbmAeSPtr+VJPCDZGzIPSzbzCrEPpKv2Ul8cjGJpg=;
        b=SIhxydNvnzMqk3equVSf3SmEblz7poLkj2sOUODgHPrQCp0b6UH1FjdtWqZlWDkInn
         dsNV7j+5IQnjWu4N6tvTJoPJFi1RP0m+VkcBStpmy/hM9inb+hB5R2hXj8zx4NNL6EKJ
         /9HRCCxLpYzBH65ynnFYddhj9wNTqrw7FeBOmlkJIx3IA6T1FH57YJdxiuduh0Xn+q77
         NrnoHaKTAqPqcRDqWRMEZs+310Bpz5rlekx6DExnLyTh+65LZfHhGiEf0xuR4xx2idq2
         M7L3yVYb4uM41sPBaJcdQIFL3HfSdDkV4kk6cKD+0/ovfm5xluBc6bceDeJbZHOEaCdW
         ovzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718960032; x=1719564832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C2NbmAeSPtr+VJPCDZGzIPSzbzCrEPpKv2Ul8cjGJpg=;
        b=HIJvuOKuFT/y+/AjN3tY9Z6re0w+Q61vjuznDYghELeeiIy7tsYMWbre98jokbTTiT
         SwxuetjZuCtWRU7mXoUCnKsNctRg8vFMxVE9XZ+Qj/v8NPuiWf8ivci/3J47mtGa8lUu
         icT/4SK+rU6GTA/vtVvzw/4r25f7sQR7HsE9wzWPTGnYW8A2wMs6QvzMsMlSUEFdN8Qw
         3LwzGMP4GHpb6lwbp1OKDLNhv8zSQDbcK97OkKAEZ+SrE6mvTdXxVJq2a9DKHMaWWzDe
         n3MZLIhUYHFLsSTyvaWznVvckNjQoQKwqHYjKXk+KXPu2q1RZwSkKgphCsonHYfSU//o
         w68A==
X-Forwarded-Encrypted: i=1; AJvYcCVM+ok2BcItshtC/UV/psOD98unBrN27uK23KqQIKS5sETpxVbev0HxGBUkOdxbhnNJb1U21eTWkNxIOXHGcP04GUmDZYq3tp5cat7vVrWr4Z3ym4uigLeOQR4hY+KiMUNV7mWA8NyrW1xBDa8lvJwzjyVhFosQky6gipSzd1NVWf3Ly0I=
X-Gm-Message-State: AOJu0YxjvpdR1eywBn1NNZJn21RQk6pOjRSmlujCbum/qCiDCmn9B8N0
	a2UoTPfRu++9k7Sm7UJF5NNLiqGT2viwLZ1dTUDakbk0Pw7twDrzQxmIrX85xOvbFmgxL0k0gIp
	hEXYCtjPSVF248j9iDnEcm/SQdc8=
X-Google-Smtp-Source: AGHT+IFACBZJL/JrK568qW0O9LvAd+FrY4FSuAOLFmRWXPL7E3VDBY2O378p7oDlZU5U3E2pPeP3u6Glqf31Mu/d0J0=
X-Received: by 2002:a05:6512:4ca:b0:52c:d5e4:9a99 with SMTP id
 2adb3069b0e04-52cd5e49ccfmr1025377e87.17.1718960031907; Fri, 21 Jun 2024
 01:53:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240620084337.3525690-1-potin.lai.pt@gmail.com>
 <20240620084337.3525690-2-potin.lai.pt@gmail.com> <cb55efedaef63e4580c11415aa2e29606edcaf9f.camel@codeconstruct.com.au>
In-Reply-To: <cb55efedaef63e4580c11415aa2e29606edcaf9f.camel@codeconstruct.com.au>
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Fri, 21 Jun 2024 16:53:40 +0800
Message-ID: <CAGfYmwWp2dayGvySdYvU+nmtxZ-x3PPW_j69ZoBD4mxzPMQAzg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: aspeed,ast2600-pinctrl: add
 NCSI group
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Patrick Williams <patrick@stwcx.xyz>, Cosmo Chou <cosmo.chou@quantatw.com>, 
	Potin Lai <potin.lai@quantatw.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2024 at 8:46=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Hi Potin,
>
> On Thu, 2024-06-20 at 16:43 +0800, Potin Lai wrote:
> > In the NCSI pin table, the reference clock output pin (RMIIXRCLKO) is n=
ot
> > needed on the management controller side.
> >
> > Add NCSI group to distinguish the pin group between RMII and NCSI.
> >
> > - RMII pins:
> >   - RMIIXRCLKI
> >   - RMIIXRXD0
> >   - RMIIXRXD1
> >   - RMIIXCRSDV
> >   - RMIIXRXER
> >   - RMIIXRCLKO
> >   - RMIIXTXEN
> >   - RMIIXTXD0
> >   - RMIIXTXD1
> >
> > - NCSI pins:
> >   - RMIIXRCLKI
> >   - RMIIXRXD0
> >   - RMIIXRXD1
> >   - RMIIXCRSDV
> >   - RMIIXRXER
> >   - RMIIXTXEN
> >   - RMIIXTXD0
> >   - RMIIXTXD1
>
> I think listing all the pins for both groups obscures the fact that
> there aren't more changes than removing RMIIXRCLKO.
>
> Can we instead drop these lists and replace
>
> > Add NCSI group to distinguish the pin group between RMII and NCSI.
>
> With:
>
> > Add "NCSI" pin groups that are equivalent to the RMII pin groups,
> > but without the RMIIXRCLKO pin
>
> ?
>
Got it, will update it in the next version.

> >
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> > ---
> >  .../devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml     | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-p=
inctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinc=
trl.yaml
> > index 00b6974a5ed3d..3f02dc94a7ce2 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.=
yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.=
yaml
> > @@ -337,6 +337,8 @@ additionalProperties:
> >          - MDIO2
> >          - MDIO3
> >          - MDIO4
> > +        - NCSI3
> > +        - NCSI4
>
> Can we also do this for RMII{1,2}RCLKO (and in the driver patch as
> well)?
>
The power of RMII{1,2} is 1.8v, which does not meet NCSI requirements.

> >          - NCTS1
> >          - NCTS2
> >          - NCTS3
>
> Overall, what I was hoping for with the comment on the earlier patch
> was that you would add the discussion in the commit message to the
> "description" entry in the binding YAML. Can you please do so? That way
> the information is always present for people reading the binding
> without them having to look at the binding's change history.
>
Got it, I will add note into aspeed,ast2600-pinctrl.yaml.

> Thanks,
>
> Andrew

