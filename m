Return-Path: <linux-gpio+bounces-10835-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E1204990235
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 13:41:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7736AB21770
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 11:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66D2A15990E;
	Fri,  4 Oct 2024 11:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cmH/dN+p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D30146A63;
	Fri,  4 Oct 2024 11:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728042052; cv=none; b=ssYIGil+n1nN5zB9zrVnze1nRJve5XQoEhC8XkS4XUWgIFU6e7JUAwaUfvreCy5zASTu4oiGVX5lyG7rBQ+eq1qIQDFGjYPHfsAGrhOlnA1PKyRrgAob8GDIJz1tdtVylcjLooKHeWaNOXWHPmJMYA0m0er4+wXE3wpvP2bsgTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728042052; c=relaxed/simple;
	bh=otYBiSqYpzQvcEOzrqVXTkSSDkEtAGRqXVxQRVTPTtI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WmNb76MvknDfc7Bg0nis9udN1KCN9/b7xapoyYKfLychas4FIV2C/MIIqLSSn+5NOrs/1LwP7yNDbR+3rKHk8KVyEfirtcg04EnLWyIkGVJLQZaqpwbX+IcgPS6YKNb75Zjzm0nzs1IbVHiSNr7SaoOssLGTyYqbQbGqoVHzn+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cmH/dN+p; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-50923780607so569869e0c.1;
        Fri, 04 Oct 2024 04:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728042049; x=1728646849; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gKCQdo+p8Gze0vcICMzXMRiWujRcC5yLqN4wtvnwSaI=;
        b=cmH/dN+pICvFiKF2aGOFg/PmqZLXUPlcRMoKNhSJFkaOUZbl9R1t2Hlppo1wxurK4f
         zMk5esdcOycvLOk0PN1fhzSHGAbiwpAYVSkkvnC81j95JyYTbxGHkfU7c5FcGEUk99W4
         Ocnwko9pvkl/PJtN9RkYK69u3ue9x/ZSvvt/h/sQ4FNh9FnB3djLZDNArqO7ZRU6x0VI
         ha5eauv3Bdh8rmw/56N9hmJBrG9eIBe300hLnThhWCWh9v74J6iZKgz6nmdjSdo9MKH9
         B6JhEF4hdbJBolU0EWP255xXDJCKu+pQ+9kqo5HFJ6z3z6oHmhxjNdFZaDW1/AN8TV4d
         Kphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728042049; x=1728646849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gKCQdo+p8Gze0vcICMzXMRiWujRcC5yLqN4wtvnwSaI=;
        b=KFTBvtaeiOgfw/m12v21Q/dfy+UzaWx6ZS2qQfBhXf5iiRbRLP0VJaprV1kVNVelNr
         3UQoKNhbThbSS3H3nfTkLoQqBjxnghMQYdYzDQT+kWQ9/evpXTx6Paj9FlcVuTRPnvHs
         9k/nt2x17yVsVNnXrDWHdIneQ1WAuSM3xYfvt0rmIUoK5LcZag63qq7FiQEDQ8neMzEA
         0eJn5dVuaBpD3yytvmqrTrCu8vWBbUwZ1Q9XRJDedOvzgraK98qW8Aw4XSfP2NOKW5KX
         wzTl6zgZmIgrtq7d/B4TA3Gamkdfyl9A2t7r/KRCWFEVmbrByCvoR0W/qadm+PzNMiSC
         NcOg==
X-Forwarded-Encrypted: i=1; AJvYcCUDQGa3FlMuZKNsOJuMmzpt+bvSRMSNvjJcLUwhFVLNKXVRrCt+dRRo0FqTXD1cDZcYzzKgr2s/L0hi@vger.kernel.org, AJvYcCUEorBTeBK9JNdT6GqZgsS9eaic8aiQxvWsEQJyCErlUwGcqXgkwcQznGX+ljzURewdE8a+9uUKkblD8kV1@vger.kernel.org, AJvYcCWvX8S7spi0ILEUnwBWR7G/iDVUjTda5sk9Ma8hbvhml/CoL9PUl7oHIFcl47S96fsoOeEPVWdX8JPetg==@vger.kernel.org, AJvYcCX0ydIEyVWrhvSb7X3HnM1v9HgW8H7fmcFQjgaehtFG6p7VpIpTKKuAb+U1+0Az2sxJZiyEkg2D89te2QM1pVKqQ+4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym+CfpPWbELDQsN3rJm5eULTcLtk/w62eL4Cl3ZlqkPP1Ymvbp
	MiAhXDRMXymtuUf4JoAKGH9WUV10R3NbuKXIe+VxcMA4tClfis0YZLblI91GOTE00Wr4ebDZzCc
	Pqc0tXqS6TQFFxUpviRHdDxHJP3w=
X-Google-Smtp-Source: AGHT+IFC3OyNNIPDOrsFuuPwGn8CfLR42u8mLnHhuVlMaBMOyEKFYgtYXlGu9lM/6h3sqSwjih5kARz8PE6Wwu/A0Fs=
X-Received: by 2002:a05:6122:180d:b0:4fc:e3c2:2c71 with SMTP id
 71dfb90a1353d-50c85444ac7mr1617808e0c.2.1728042049555; Fri, 04 Oct 2024
 04:40:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240918120909.284930-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240918120909.284930-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWkHvHh=AhJhOutFRAJMczpCGdUCPvPuqjY_V4aiMvmAg@mail.gmail.com>
In-Reply-To: <CAMuHMdWkHvHh=AhJhOutFRAJMczpCGdUCPvPuqjY_V4aiMvmAg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 4 Oct 2024 12:40:22 +0100
Message-ID: <CA+V-a8v7Y83cS4EHd0K5hvbCLFxE8xrv9zajDMvwT_R0RH59vg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow
 'input-schmitt-{enable,disable}' and 'drive-open-drain' properties
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Fri, Oct 4, 2024 at 8:54=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Fabrizio,
>
> On Wed, Sep 18, 2024 at 2:09=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > On the RZ/V2H(P) SoC we can configure the 'input-schmitt-{enable,disabl=
e}'
> > and 'drive-open-drain' of multiplexed pins. Update the binding
> > documentation to include these properties.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.y=
aml
> > +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.y=
aml
> > @@ -119,6 +119,9 @@ additionalProperties:
> >          bias-disable: true
> >          bias-pull-down: true
> >          bias-pull-up: true
> > +        input-schmitt-enable: true
> > +        input-schmitt-disable: true
> > +        drive-open-drain: true
>
> I think you also need "drive-push-pull", to disable open drain.
>
Agreed, I will add support for it and send a v2.

Cheers,
Prabhakar

> >          renesas,output-impedance:
> >            description:
> >              Output impedance for pins on the RZ/V2H(P) SoC. The value =
provided by this
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

