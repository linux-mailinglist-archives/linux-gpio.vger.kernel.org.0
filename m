Return-Path: <linux-gpio+bounces-18518-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 61127A81320
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 18:59:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D5381BA036E
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 16:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25D0F23315D;
	Tue,  8 Apr 2025 16:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yWTcg0Q9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3483622ACE3
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 16:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744131572; cv=none; b=XrFuG1IT8hR+WERlahYVLS5P1GZeFfsuSR96mIjUBpyFkglCzARLs3PbXpQQiEjQ62XB/7Wtdrj+HLIhxQqZtRieL64P4i9Fjrs90SwIt9YOwpgtw/VTXgKlbFxJsRuyXgu+lcxSDo7FkJ4KdbFU4jZ1fMehq6huijytn47PzUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744131572; c=relaxed/simple;
	bh=EUen950rVlqD3ijE9T6pVem2TJoWkuc5INbmibM4S0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nvB2POZgtG3fjjphbe3UX8Di2S5E69nRRvMs6IcDH0azg2li7LA471ljZo4IXeKY2Yd5Gi9LODI2wOLPtcM6Ar9W/6uTETC1eR+7xxtqCDNCht0nb7o5S6MGyDOZrcuHGjyetH79vTKKuShu+RWZ7JWs9bMp1w1Kl7PAkc2tXr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yWTcg0Q9; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-549946c5346so6834191e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 09:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744131569; x=1744736369; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b9bdlMTBH0pZP1vfIIBZfl68hQHlVUhTU84A0dLxWUE=;
        b=yWTcg0Q9PBfR2Ym2DaddAHf3W8UbbqVkapLAay4CVch/G/aS9nderc0tMxiaqa3ECD
         BiySVswKx2OQsLHqouOvuM36tX9nflTAmpGV1C5/dEea9PSD6WG8iimMRGi/+t2HbV2N
         XUrLh8HAvlTyOkRPI9twLp5tOTiTaqgRXY9+DqrBFHOfqDdBamizuZV71WbZf3FWn0mJ
         x2Nt7Clb76dIGoFjsgAcoH8cVcmsUdnMPhsgKytWeVcNfaIF5RG/yDpq2Hs5MaLEcYQB
         qA0QfY/lrsEGjMaZdT/ogkt6XLca0UaAfx+D90612FiPVDgiJaADM06R3nIcNnhEKPMU
         0STQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744131569; x=1744736369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b9bdlMTBH0pZP1vfIIBZfl68hQHlVUhTU84A0dLxWUE=;
        b=A5fK1jX5rGQpIwas9CdXpXJV/t4DC54+oZpyqMiBTrFL/WMnAqlO37QC0qcT6HAWBV
         Jp+fc3djFNpBLPEbs+/lLnf53tveb+ece6Q6uW2l1dcD9reuVJzp1EaBj9jC6RdR+BCM
         Hm7J4uONvZ5vOzHS3Sziz1YX9TJ+Zxcv8t6ktnv8ROSltEtHyH7dALTz8FXpuXpXIcXt
         IEvNzPTvMjjibbZ62VQlR8XmQwHSJDb7D4wAnt983kLewTX5uIQxsotvctaZyFz8gdf2
         WZ90qHC3ylckOcS/A2ilITv4NTd/sChmsbLkURr4cEynKNiQcrgfjBPUAmuTOvy6fWmf
         /5AA==
X-Forwarded-Encrypted: i=1; AJvYcCXbMStJPtb+8z1lCtTJiw8CWCfxUvbXb0F5cBMS4o2vOeqqC2WfMWwIluz2S/var91xpW0jgUR49dn7@vger.kernel.org
X-Gm-Message-State: AOJu0YzpmiTofFzjDoXlhw5moW+XeOsx2HNkRtGrQJ5Tf6UM1YC3I2NF
	vKR5V6I/DHaDCmMOZpZRgo5RVMpDRvmRxFM5kieI8lu5MIRwAaPqxOYEuqaKuKuREOEsv6KO2EY
	CSRP3qT87ah61M7nDX7o1NKrWd5ePpDtOl5H25HtGJOhHhq1g
X-Gm-Gg: ASbGnctoEY3cmrH23SuGbKrnIIHtQ93JzGnsVTBRyGYVm/nKYfFRIlkhiOYHCoxqLXU
	X6wots64aJAexHCRnESqnk6ISanNgZs6c0LBb4NpsE8wt6ig65cRJeluD1yw+Rh6CeXDAW3HGhT
	lOfzPy3lXp5vUhbrg6Umq75At3iZW0ETQJBtRFuBazTQDfnEyDT4Wnq/Fwqw==
X-Google-Smtp-Source: AGHT+IFf+rKu3T7g4RXnGFAVwKLGYMFo6Zqu68CucFmhU42UIICJdAnEONryqtNi8mj8oclBDQsJoWOTWw94ILqOE3w=
X-Received: by 2002:a05:6512:33d2:b0:545:944:aae1 with SMTP id
 2adb3069b0e04-54c22767d83mr4780246e87.12.1744131568769; Tue, 08 Apr 2025
 09:59:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408-04-gpio-irq-threecell-v4-1-fd170d5e2d2b@gentoo.org> <6790f337-8578-4ecb-b879-f5a254f109e6@riscstar.com>
In-Reply-To: <6790f337-8578-4ecb-b879-f5a254f109e6@riscstar.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Apr 2025 18:59:15 +0200
X-Gm-Features: ATxdqUFebT_4pyoTiD_cVWGxoRBkYoQNT5n1rg0F0zfP1Dh_NRC8OHcIuixy1l8
Message-ID: <CAMRc=MeEQi0rnr-mA1bsvAZu-NxqKp2Rjg9x9HYaSbuWY1seiQ@mail.gmail.com>
Subject: Re: [PATCH v4] gpiolib: support parsing gpio three-cell interrupts scheme
To: Alex Elder <elder@riscstar.com>
Cc: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 6:05=E2=80=AFPM Alex Elder <elder@riscstar.com> wrot=
e:
>
> On 4/8/25 10:11 AM, Yixun Lan wrote:
> > gpio irq which using three-cell scheme should always call
> > instance_match() function to find the correct irqdomain.
> >
> > The select() function will be called with !DOMAIN_BUS_ANY,
> > so for specific gpio irq driver, it need to set bus token
> > explicitly, something like:
> >    irq_domain_update_bus_token(girq->domain, DOMAIN_BUS_WIRED);
> >
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> > In this patch [1], the GPIO controller add support for describing
> > hardware with a three-cell scheme:
> >
> >      gpios =3D <&gpio instance offset flags>;
> >
> > It also result describing interrupts in three-cell as this in DT:
> >
> >      node {
> >              interrupt-parent =3D <&gpio>;
> >              interrupts =3D <instance hwirq irqflag>;
> >      }
> >
> > This series try to extend describing interrupts with three-cell scheme.
> >
> > The first patch will add capability for parsing irq number and flag
> > from last two cells which eventually will support the three-cells
> > interrupt, the second patch support finding irqdomain according to
> > interrupt instance index.
>
> Did you intend to send more than just one patch?        -Alex
>

That's alright, the original series was 2 patches, Thomas picked up
the first and now I'm taking the second through the GPIO tree.

Bart

