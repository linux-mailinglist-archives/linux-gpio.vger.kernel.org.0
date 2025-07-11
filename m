Return-Path: <linux-gpio+bounces-23173-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E001B02364
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 20:13:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBBFDA6215F
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 18:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFAAC54758;
	Fri, 11 Jul 2025 18:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YC28NgXK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B132EF656
	for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 18:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752257614; cv=none; b=ig7DzpR17en4u6vvvIU8RWHciKC2B238+awE1RcAA73gTix4SQk4iHq6zuXU1zUOHa0qTyoBODNlZvcBJcupTTs7QhMu9fnEa2+OFnR6ckCYJTBzrc32O/pUMHeqB2gxpQov/zJwMTweuezaDk6yL98yXQ81lt9rtzjOupr1+VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752257614; c=relaxed/simple;
	bh=z0FAINHMrT/mXWSwLLS5ITQiWYyUydXHEsbDIHwLkNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=svFcpDhflPYYIJhSkLKDolcrY+x1PwMWMy33inrlWYI3L+JaWA0j6gOwoobSNL3RgTQaDknhufELgCV1uaPD0SWMgkOC43iK2TY5mJY/63s4eUiZ/tCwoKGG8rjCWegEACkAPAFLGYGIBpj87v8bTKjR1W8eOT3f7ARkuyp25vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YC28NgXK; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32ce1b2188dso22472241fa.3
        for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 11:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752257611; x=1752862411; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z0FAINHMrT/mXWSwLLS5ITQiWYyUydXHEsbDIHwLkNQ=;
        b=YC28NgXKQU4MfHLvCSx4TbwDnLLJcR2LnuM3/xqBffmNhSypes9jr+FEFrhYacYNnX
         ONMLcxbGH6zFMbUXq5QnB8IzjRG6EGPCvemyD3rpJEReBZLFTdGypsmMAWPICJEfk/qq
         Tw5jL3dwkKQ0rAl6FZ1h8APqPT1q8vo+gz1GeVz2kOoeV/6P2dty3DkAoygFIwtA6vi1
         O0GgWTRJyjl+ymyFczLMvrnh0BlKEjceif6EpqjTbYNUAkrSfo5mMx0hTlQ3EZxNcu7w
         lZT9j2DqOaoD3RI37EwH8OpmI1NvrSZMckDm0TyOmHiTKNu0tdaFpD3Rv+lwqULW6X9B
         MUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752257611; x=1752862411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z0FAINHMrT/mXWSwLLS5ITQiWYyUydXHEsbDIHwLkNQ=;
        b=UNEtaPwaIjhd0i4I/28zZHcpZuxsmDUUmA6JNanyZ4BbrDZpI/pcJNqVvxSs8qmLiM
         A+FDbxF4zfSz2/OVz6vMRraaVphnyR98/9O/Q/ggpjOQZTciyBSKlJUXXucoCT8vbFM6
         pVwhOfCV5RLKRjN3bjzxT3Vqc5U7Lbe/ZRiWUGpK3bJRe+L23t5Yt5pGPpmosRUUmyNz
         kQFP2KhNZvqFg+E+xhTbyY4zx7entQRjNsB7BQgQ9ExmjKT98wnz2vC/ENEIIEnYHSqE
         s174RUeYL2OMntIgmY+qJ6AHrb1Qtp0G9DSX721foAl8xBO9q5wWZmlFx8BKPgFfSvzv
         cbow==
X-Forwarded-Encrypted: i=1; AJvYcCVNU6WrHJPP9fCLrTjdcwbwce0FNONLdKINs6E4OO0I35PIDX72DNeZUqH2AoR70ItQU6ayx9RAJrJs@vger.kernel.org
X-Gm-Message-State: AOJu0YxPr2oBEuWLPxaxb65VzPG/xMDi3YVy+m1HEARIsUeM9rSd4BUJ
	CtnJ/goalImrtGHb1eSxAeFxrS3yCx/FYYHvi4e6g6FZ2oWMyrgMeWFCmGZRP6WxyAu+ScSUf3b
	7bOWKeOemuQmX+Xdz3xq3SJEenkVSyV/uJhTRAEKnvQ==
X-Gm-Gg: ASbGncuOYInMMh+WKm4pAc672/kLzin5MogjNGie5UyTXa+wB0i3cWqdG3ARf+R5kBU
	SR4weyu5fU+/BtZELxJ+Kr8jzSq9osXABtMbHY/HBv8Ch3BbKFxM0m6vDOVuImV1VncGP78uH/c
	WFJametVl9kY+XKPpciZizIb4ZiB4Jj9gnG40cEOTh42g3W4J9PFtO+t81ki/jcmja2mxqL+vr8
	iI0XtQHkIXmnT83ZA==
X-Google-Smtp-Source: AGHT+IFMuBYHoAN7PSAu45/CxJxrRKT9IAF0+U0X5QcMw4v0k+dSQgdIENHIG/kIkaAP4cg8rAILHrMXlK3Z+M3lDSE=
X-Received: by 2002:a2e:be83:0:b0:32a:85ad:2162 with SMTP id
 38308e7fff4ca-330532d0602mr13483321fa.7.1752257611064; Fri, 11 Jul 2025
 11:13:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250626080923.632789-1-paulk@sys-base.io> <20250626080923.632789-2-paulk@sys-base.io>
 <20250704233535.4b026641@minigeek.lan> <20250705153825.2be2b333@minigeek.lan>
 <aGm8n_wJPiGk85E4@collins> <CAGb2v66s-nWA2dFRpgX6DbDET3dWOm1jPKWm1k9SmGSqhTWoWA@mail.gmail.com>
In-Reply-To: <CAGb2v66s-nWA2dFRpgX6DbDET3dWOm1jPKWm1k9SmGSqhTWoWA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 20:13:19 +0200
X-Gm-Features: Ac12FXygNb9Ktxv1UdTrJbOKhH4l5d3j_PT8j5_pIzh_inLuA-iMK4HxDAsC-Wg
Message-ID: <CACRpkdZSXRxhNORJv5TTaf=B5dpUgXfL-PBW1qH7uKC24o=Heg@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: sunxi: Fix a100 emac pin function name
To: wens@csie.org
Cc: Paul Kocialkowski <paulk@sys-base.io>, Andre Przywara <andre.przywara@arm.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 6, 2025 at 5:04=E2=80=AFPM Chen-Yu Tsai <wens@csie.org> wrote:
> On Sun, Jul 6, 2025 at 8:00=E2=80=AFAM Paul Kocialkowski <paulk@sys-base.=
io> wrote:

> > > So I would very much like to see this patch moved out. Is it just in
> > > LinusW's tree so far? I don't see it in -next yet.
> >
> > I don't think the patches were accepted for over a week so we can proba=
bly
> > still act. I will send reverts, unless maintainers want to manually rem=
ove
> > these commits?
>
> I can drop the dts patches from the sunxi tree. Linus might be able to
> drop the pinctrl patch.
>
> You definitely need to send a revert for the DT binding patch that is
> already in net-next.

I dropped the patch from the pinctrl tree, no problem.

Yours,
Linus Walleij

