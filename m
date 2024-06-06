Return-Path: <linux-gpio+bounces-7221-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1568FE12F
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 10:39:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19A0E28AE09
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 08:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 229A313D880;
	Thu,  6 Jun 2024 08:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VaA/Tuaf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D305328A0;
	Thu,  6 Jun 2024 08:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717663082; cv=none; b=HxUT1x2ls5YLbiHp4TE877wtOBucjIulGz6aQnDKg5edYnPOMb7kI12iJ/m2L4z8BCyq0+kBpYRiqcOsBj5N0nfR828TaEr7fOPzveRgAjkhv9MrhPMHLy5vEaWqzFCBYppergTvxzwIeF2PLIkzKlAI2/SLniElZyeVqNNx0Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717663082; c=relaxed/simple;
	bh=iXa75xesv8Th6dmsNR5Wmb3zCyYb+vzqBgePfuDZquU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r93RJR7sS//4v967CaQTHzC6D6nlV0mxEr/MRXIHZtJusoUvhHgAP6N62c6LE4FJ0Bwo/I9621CiX3FlJj2RspniGNBsZuRHzcXS5UUWAYaXRbMokbb9My2HphiMdh9KfLhSoyHUgR6h3AIvai9J/SNuRBm7RPnuEqm6lquWvoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VaA/Tuaf; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-804c45a47b6so249948241.2;
        Thu, 06 Jun 2024 01:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717663080; x=1718267880; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iXa75xesv8Th6dmsNR5Wmb3zCyYb+vzqBgePfuDZquU=;
        b=VaA/Tuafy3eAlU3KCFCGZ7AgXIEv7zmVRInrzSHOHyQkIolDVW0JstqqlHKN/HjzMr
         Z0KpWY6KjFFAOPYYXicAeDO+8BoCJYIyHSYTTKeRLJl1PneMjott0U/JpNOq/KGRqhWN
         jJvzL3l6h4GdrLnZDrR+q0xHviIeZ0U6YxfyEFmNgQwMpZjczeELuHNXo7ojG36jL3ew
         wiMJF973+83BY8qwlhQwxKQflU4jYp7DzKMWzEWV0vjlYdwxhOvzp9lTeJB0MzYPXx8r
         XPVs6gRAu0gdHmj4UBolaEyo6I7vbx4RLY5BIRqKaRIREuxwAnF0aq/t9Cfi6n0hHLys
         B6Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717663080; x=1718267880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iXa75xesv8Th6dmsNR5Wmb3zCyYb+vzqBgePfuDZquU=;
        b=pb46uh6YlgEqr2WlJyBPgq/Ouej+jMaVM9sZQnfM7IaEXXAzGNaRkAFTQ4a0k+Tjr0
         jqmS/xXLasEtwyJu8Ovyr4Ue6LDZAKvx4x932caFJsaVGxAJHvE3A8EWnntegVI/G8zq
         3dpLp+qwShMzQpJ5iIynU6qTEQV99TBhvpEmmctxbl9khGtK8MPXFoTVEl16h1t/yW/e
         hvLVNKi0zJGzt8tuaL7MlEph0B//oj5Fau0T0cycoZS6m8uHeXDd9J/EwZmP7tMyJk6e
         l9HNw9TgCPPDWq/ykXX4zyRn1nUhy5K/FIo1VcP7Hfpw5MbaayLdBoPhpaa4q3ukVJwY
         kKYA==
X-Forwarded-Encrypted: i=1; AJvYcCWs4vrBwcfHL50XX7SCsxeDuDxx1zEgAW8FQA5GSRUEWCi2arGsqwYNv0VKz154Z0gQ+tnTx700adQPegoOc5W3d9zRAxhI03uyA41BBKqwebdKiCzeliuvdDidyfZK3ZjpJqx++/QM/jnaD2EkR/DZ0u/rR8QOYWtCoF/Llj3hh08nPSsRWIbmDrR/ck11TkMPcB0eyer8Rl9au32uxRewqL6gNoVU1A==
X-Gm-Message-State: AOJu0YwLvHa2h5ed7DTjfzfVF1E7/2KMhFKB5ETIjfuLZmQttlHXxLMP
	YA4ju1wXz4IvjIj6c3eyu7WCn0o+iDPq7xsjAXG/fzcFnvo6gTTWIpfwF/jKeBZdjGmDwdXOsCT
	JRNLBz4YIKBc1HL331tnaURDYccc=
X-Google-Smtp-Source: AGHT+IEx3i+oV0HZfHXhaY9bOrHFh8+AFcQPC9XrF38X4JBXblt7qoF3QhQT+xgJ2GHqCqFeCKL8/NzNxS/al88GyUo=
X-Received: by 2002:a05:6122:914:b0:4eb:22b:492f with SMTP id
 71dfb90a1353d-4eb3a4e6768mr6279305e0c.16.1717663080137; Thu, 06 Jun 2024
 01:38:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240530173857.164073-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240604153612.GA839371-robh@kernel.org> <CA+V-a8tWxGBkuOY=G3RaB_0NXS3ShE-nL+5t49=_mJGvo6j6yQ@mail.gmail.com>
 <CAMuHMdWvdvmt42Wy=5Do2MeCRNbLOd2c8Nra2RFQtumnmZod_g@mail.gmail.com>
In-Reply-To: <CAMuHMdWvdvmt42Wy=5Do2MeCRNbLOd2c8Nra2RFQtumnmZod_g@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 6 Jun 2024 09:37:33 +0100
Message-ID: <CA+V-a8sbjD=KghOmw6OEWXxbbPkmW-ycwuxFxh43GL3nKhLWxQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] dt-bindings: pinctrl: renesas: Document
 RZ/V2H(P) SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Paul Barker <paul.barker.ct@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Thu, Jun 6, 2024 at 8:13=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, Jun 5, 2024 at 11:39=E2=80=AFAM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > OK, I will fix the above and send a v6 series.
>
> Please don't drag it out that long ;-)
Oops, that was a typo.

> As the rest of the series looks fine, a v4 should be sufficient.
> Actually a v4 of just the first patch would be fine for me, too.
>
As agreed patch 02/15 needs dropping, with that patch 07/14 ("pinctrl:
renesas: pinctrl-rzg2l: Add function pointer for locking/unlocking the
PFC register") does not apply cleanly anymore. Maybe I'll just send v4
for the entire patches?

Cheers,
Prabhakar

