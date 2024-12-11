Return-Path: <linux-gpio+bounces-13764-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 601429ED063
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 16:50:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9117A188D25A
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 15:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F00C1D63F9;
	Wed, 11 Dec 2024 15:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HgRhQ7i6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338461D0F50
	for <linux-gpio@vger.kernel.org>; Wed, 11 Dec 2024 15:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733932055; cv=none; b=OQWFEY7KXMv+/qFIHpynzRuxB+uOkccaYx15Y1AbrnrIghDbjMy1pvYCcW79bwWGEc2vE6O42A7wcenc+KobQch3AzPNMw20z+tcVmxdKui7qzHyqnNmenwrSx5Css88ZF+g17ZtZJh7QTvJ8RumupNFV27s4sUxSiWqhCAnBbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733932055; c=relaxed/simple;
	bh=PD4zhgl0BsZhU7qS8NABFOTUwyzuE3FvgIrGT7i3sOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qbXpYslSSm8mTymhc6UXjfY4LH+74t3ieOKMlttcoP/Rn20XGmiHskjjFAZuDYB71I28K69jQYVB8QdIw9bvPCcR1CNSfdC5Li0Vm7tSUkf0K3GcEmhJD+Nh/+zp0+Rh3W1W/ujlzhpqfXtz7UiTSFH35+OKK5auyKGOCh1aGO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HgRhQ7i6; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30229d5b1caso29173181fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Dec 2024 07:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733932051; x=1734536851; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PD4zhgl0BsZhU7qS8NABFOTUwyzuE3FvgIrGT7i3sOo=;
        b=HgRhQ7i6Y3y53nPLDJgWdqBi+kqHUqpoLzPfLrGbXkk2Z2uD7EqoxkNOi230ZWyou2
         BvIErryhl3Lbr6jchGFEbOpC0ln56k+9ms1Dj3KG0dK2NL/veY52yW32q04EJwuW7iI+
         fhClJCCohbd6sOcuJoHLv33At/CJXbtzFxAoNXEAayzfOhdlQHI+yZt6CfjwoUYO/ouL
         19ISIa4c1gsitoAXZlaH2ITtrAiU/KGKM1Bsq0r7AqJmpxblYzcdmsIbAYs2KdodM7Nm
         7qtf+XeaOKeSpGptVg8TkMD/pYMX+5XHSCkFc9Qf/ERQXihnwDMcgUg7do/VNiFUK/Ri
         tLUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733932051; x=1734536851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PD4zhgl0BsZhU7qS8NABFOTUwyzuE3FvgIrGT7i3sOo=;
        b=rJx1L/0HyhoGzzmFoxNeyR9+kN3SOoN35jUsioG9IdYdK79t72HfpjbI+gpk6KAW0w
         t9PNckTE6bh8PEtdJUm7DR4dNVvoU7YOEjF4FZU+o/G2Aa3quT8cx78UeMJwa+kLoOtM
         MLCgPGmvh2MPFMDEOgXZ7Vdg3kzPclDn5n9lghNQl0OgC3DT5z4OnaxNPjTH/iRLGVEi
         dm6G+QRQh1MrfmJ3wL49Z8PDOOUAthmz8bzInLXi7Cq4s5MDcpDCkRYjygpDEqqQ0pZA
         cm/TplDJgyxTPfhvcpGrfv1v6sh9y6Q2hMwzZgNjHrYA0L2Z1bhX9vFzEbYktItlFTbN
         rhPQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1sZullBAY6XwDSWfUcXNUzfg8s4HDhFNp9vtMTpTAjVuTJ8U7HmZ/4uKLqRtbZkRJyIzpLt0bQgR2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6d6glTqR7CJZORQAEAdVX+grqSwzgOfkTOn4n3pIBriWCkyoz
	OAQnCZF35+5XJDjQegi+Xa0bp6B+Kh1bgDYXEiWsw/0JYRpSYETCBNFIsTWaSallnlX2hXh/N3H
	bsg59WJlKMBnrS/QPhBtlzchAyaWIT2WuAcDPow==
X-Gm-Gg: ASbGncuoZkEIaSplmZk2agi9LLin0WmQ2aIg8RWriGAtQN+CBbAW81Lci543MFQCMcI
	0fXQoBEMdPJ4YL+LFuEsJ9I6gK7WykMXeXcE/6DDGscjmVvCfhN5B1n+iFE9Tw4xOhpo=
X-Google-Smtp-Source: AGHT+IG1Ix1jbxaeu+naYpep6NosuFKWyNO80GDX8yaop49XV+PqcQnkEf3Al9HtsrlscO8/W4MKKpF5JoG7dR3zC0U=
X-Received: by 2002:a2e:a815:0:b0:302:3356:7751 with SMTP id
 38308e7fff4ca-30240d9155dmr12363541fa.40.1733932051283; Wed, 11 Dec 2024
 07:47:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1733739697.git.matthias.schiffer@ew.tq-group.com>
 <CAMRc=Mcw-r3b_a0XmpfVbF04MuZYnmM05AZqGav8GA_PM0-ozA@mail.gmail.com> <3ceb31ad50046ada646f91e45c857f6350a06116.camel@ew.tq-group.com>
In-Reply-To: <3ceb31ad50046ada646f91e45c857f6350a06116.camel@ew.tq-group.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 11 Dec 2024 16:47:20 +0100
Message-ID: <CAMRc=MdFP1J8cCa_-r2JjRCBLRuTgNRWUdObBc3H3E=cic-fGw@mail.gmail.com>
Subject: Re: [PATCH 0/4] gpio-tqmx86: cleanup + changing directions
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux@ew.tq-group.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2024 at 4:35=E2=80=AFPM Matthias Schiffer
<matthias.schiffer@ew.tq-group.com> wrote:
>
> On Wed, 2024-12-11 at 16:12 +0100, Bartosz Golaszewski wrote:
> >
> > On Mon, Dec 9, 2024 at 11:36=E2=80=AFAM Matthias Schiffer
> > <matthias.schiffer@ew.tq-group.com> wrote:
> > >
> > > This is the first of two series adding new features to the gpio-tqmx8=
6
> > > driver. The first 3 patches are cleanup/preparation and the last patc=
h
> > > adds support for changing the directions of GPIOs.
> > >
> > > Once this is merged, the final series will add support for new TQMx86
> > > variants (SMARC and COM-HPC) that feature up to 14 GPIOs and full IRQ
> > > support on all lines.
> > >
> >
> > It's not like this series is very big, what stops you from posting the
> > entire thing right away? It would probably add more context to this
> > series.
> >
> > Bart
>
> The second series is bigger and involves both the GPIO and MFD drivers. I=
 kinda
> expect a few rounds of reviews to be needed before it gets accepted, so m=
y
> intention was to get these smaller, more obvious patches out of the way f=
irst.
>
> Best regards,
> Matthias

Fair enough. Could you address the nits I pointed out? I'll queue these the=
n.

Bart

