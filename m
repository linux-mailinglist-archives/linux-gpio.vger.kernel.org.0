Return-Path: <linux-gpio+bounces-25319-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D24AB3E2AC
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 14:25:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17F1B189543C
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 12:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 250CD31AF08;
	Mon,  1 Sep 2025 12:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k1YTXQl8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37233257849
	for <linux-gpio@vger.kernel.org>; Mon,  1 Sep 2025 12:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756729535; cv=none; b=G9+3y4FUqfKu7DrTxyUBi+MNNUVF6OCWfn45GS01rMVwt5kWoH2dV2u5EZx8U/XfpIeLAyhmDQzGteqOri/VeMcQ908csUJrdQuj7petDLiO9Dya7TjoPQT3qbMkJqMoKM1+wHFB6A56rp9nDJ3P7Rwk5guaIssHPx11oQ5S6r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756729535; c=relaxed/simple;
	bh=ucQlHv/mXWXUQR94z0huHpLkFzXJxyJn2PT3FHlelh0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=banM6Qiy5Lf0IqqJ7Sflc5PbtyDq9+5rsXgnlag8/1IEImvSiXo07Nl1gn98LyMpPyRMqQWbOAGDDske6gyw0dTmcx9gg/78LbrEqIto3GRv0SbNSk/NR28ElrTUpFNjQVshOma6xgb/3n9ELjBs4j23t8eFGJ+lSY6i4yxvN+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k1YTXQl8; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55f78f32580so867975e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 01 Sep 2025 05:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756729532; x=1757334332; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ucQlHv/mXWXUQR94z0huHpLkFzXJxyJn2PT3FHlelh0=;
        b=k1YTXQl8ITl69NTy8KvKSxJZ56mlsVUakb7194brWogwJbBYYx0SMFWksHPLmxngQH
         8TPv3+3HNe3zOaI54NdJEYRLeULlx2q8uMAeIibxNF3/ZNlcwhGF7SI93G3vzx/L3A3i
         +LzVUJ04dl1SAhb2ahuD/EahbSpNPlTH9gnvmNu7knzniORsAE3pSksMhgUpXNgDg13j
         eW1JsTTN6RU1f8fhbDIX2PHIybhpB97Tq+EHixJilXbpZC092D10RuAWmCl/mfcEIBn1
         SHhQF+SCGFRa8zXKG5UjLcI2UYk50QyPJxxQmcPWGxISLvfla5fsz6GXwHXFI6w6LZrV
         kqow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756729532; x=1757334332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ucQlHv/mXWXUQR94z0huHpLkFzXJxyJn2PT3FHlelh0=;
        b=Frl4CYgKPXRp4N1sECUwsDBh4N1sc5HoXI5TaLUA52xmCpc2pXpVHT2Tlp9ONyRziP
         Q+gargrHr2G/J45hZvtFlYtFEPft+mRGIE6UQ90VFiCTF3NRu+2UwG4T6WC6tAnE7VZ4
         7Lx9bEa3p4LOcw5wESDCVw/ksEX2TCxvbds//ntLwe/Dl1WIpDxtT7QL/ASi/m8Ra8q4
         kpWrdN9s4RFq8kDCidW4cRVDW/irbXmt0LZ+ZSpggdLPO4GYUZ9hgWkYCUMx3rZsqmRu
         CzOpks7VPiyOKwzwXu/QCn97tNyr8u5miQJL3v6ZIGSlxlisQ32I6LE174ZMP80zSTnL
         4J1w==
X-Forwarded-Encrypted: i=1; AJvYcCVJD8YEyh9RKdq4+QvJtyvrGvRLTLPDSFgq8thf+K5SMAp4UDR5EFv/HI97+4r3iuVhM23AAPgaqw/Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg4AbTBU7Y8lD7KOuSDTo6F+jgrZpP+SGemfXxTsu9M4g4Z/C+
	uUYq1l6RgyAdfdifMN1EiNgYH5SGDxJ0s3bvYmoun/cR86P7lNBlpjVvopIvvYpFJ1Fiwdks+7c
	dmy+RnIL2OXZESqW8NPlQnmfNFO02txAoCwfVM1TEwg==
X-Gm-Gg: ASbGncsEcGRcsYlXLThy9FgBl4eD95N/WLynw6xbXCZNKRaaOAGLBoNH4Rs1LRvhwyh
	boJ4RIhW1Hm6jnhSOZNDV5O1ultf6EPQPUIYm4grubf5DOlFuPOkp/negyR3cZsewqbM7gExt/4
	kLQFSYk4y8QAYRY97Gf0zkVlsNJIYRbUUhMREFigZ9ZmSIMNQa2BceJ13YyyOLcjc5R3VN1vQ35
	RaXEdE7XKB9NE9Pbg==
X-Google-Smtp-Source: AGHT+IFh849P9Mw3V1twXyau1E0d8+tMpeq/kD/1dtYcV8RQnEr8UjIQMobQi9sqOIke7vnU9ah+2huaprvtZVk3XKo=
X-Received: by 2002:a05:6512:eaa:b0:55f:4ac2:a58c with SMTP id
 2adb3069b0e04-55f708bafb8mr1947722e87.22.1756729532129; Mon, 01 Sep 2025
 05:25:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
 <CAHp75Vd+q5NZ=4YSouU-EdbR4TZf7S8PGqR0B0HJG8DkVKKtAg@mail.gmail.com>
 <CACRpkdZcPwwpie51D55AHTQRSqG_EQ=tVG+0aMJpHhYZLGq1yg@mail.gmail.com>
 <CAMRc=Mcy8ia5Cp-hpvZp4Pz-gLEibzjg=MHA01YTeFk-OkFspg@mail.gmail.com>
 <CACRpkdb=8GFLaAtSyWx4jgV6BN4gPAFH3tDKmDQT8b0b1xeasA@mail.gmail.com> <CAMRc=MeAHn+r0YHq5KgT2xVUuT1uOodcTLhfF6fc668tgs1saQ@mail.gmail.com>
In-Reply-To: <CAMRc=MeAHn+r0YHq5KgT2xVUuT1uOodcTLhfF6fc668tgs1saQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 1 Sep 2025 14:25:19 +0200
X-Gm-Features: Ac12FXxZChHxriu2Zd-C_Ts1xmuNQ7MlL_uPIJIHm3MOdmn11xm4R3hRlEbi1Ww
Message-ID: <CACRpkdYf1pi6Rf1r0dEkgFuR7unUKd0MYkGphVNNAqW_P1P20A@mail.gmail.com>
Subject: Re: [PATCH v6 00/15] pinctrl: introduce the concept of a GPIO pin
 function category
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Andrea della Porta <andrea.porta@suse.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Shevchenko <andy@kernel.org>, 
	David Hildenbrand <david@redhat.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 1, 2025 at 10:55=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Mon, 1 Sep 2025 10:44:04 +0200, Linus Walleij
> <linus.walleij@linaro.org> said:
> > On Mon, Sep 1, 2025 at 10:34=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev=
.pl> wrote:
> >> On Mon, Sep 1, 2025 at 10:31=E2=80=AFAM Linus Walleij <linus.walleij@l=
inaro.org> wrote:
> >> >
> >> > On Sat, Aug 30, 2025 at 10:19=E2=80=AFAM Andy Shevchenko
> >> > <andy.shevchenko@gmail.com> wrote:
> >> >
> >> > > Note mainly for Linus and Bart:
> >> > > I agree with the patches 1..11, but starting from 12 needs more
> >> > > discussion. That said, I hope Linus can apply the first 11 ones to
> >> > > make it easier to continue with the rest.
> >> >
> >> > I applied patches 1 thru 11 so we get some traction.
> >> >
> >>
> >> Ah, I hoped to get a Tested-by from Mark on the IMX first as I'm not
> >> 100% sure the fix in this iteration actually works.
> >
> > OK I backed it out for now, let's give it a week.
> >
> > I'm just a bit jumpy... I really want this to get some cooking
> > in Linux-next by now.
>
> I mean: pushing something into linux-next and seeing if anyone yells, is =
a
> viable strategy too. :)

Yeah it's what I do when I lose patience, however experience shows
I need more patience ;)

Yours,
Linus Walleij

