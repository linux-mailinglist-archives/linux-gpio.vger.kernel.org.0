Return-Path: <linux-gpio+bounces-26571-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CFEB9DEBF
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Sep 2025 09:52:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E26CE3B7002
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Sep 2025 07:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 258072580F2;
	Thu, 25 Sep 2025 07:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lfJKPzOq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECEB1FF7C7
	for <linux-gpio@vger.kernel.org>; Thu, 25 Sep 2025 07:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758786731; cv=none; b=ZkxAexlid2p81Fwx1oBD2fIeb301ZlljoyXsVTgKs+UI8mM7+bSp5IYqHDFDb86yKP31+9fEGEoo410++Ko+xWixfrQ/wfvYMwCP1YMr+G9m/QjAoOXnABaIo1dexDEya13BsuXXMpvYJeO2JVO+uwGYyWppPa/vt8TvUt4f440=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758786731; c=relaxed/simple;
	bh=Umxh39nHGfkgypJPyOPbacKoWCRJ+9b9PmAXkmDpko4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ODBe67xUmCwrca4qHNDWRi/6Nu5msApqYTN7+cIsGgtGpL17iI44rJrCX1N6gEN2zNHoYR7G9lo/iIXyZ1Me5nbWNjw/9YXx4eThH5THMpJyTvrG3OnTm5JKHj9HY3AzDtwDN+KqgC2BGKngNC13t4WiQSaMTa5l9nHQcbzbEss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lfJKPzOq; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-57afc648b7dso777018e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 25 Sep 2025 00:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758786728; x=1759391528; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/pmdbPSS1+PFGOQZXgEhCWxoqVsYqlqHhZMSV2rIROA=;
        b=lfJKPzOqCUrq+Uat6EBSiSVoDSB+T7Nkll7waVBeAYahSvGf5OqRAGuZQcW+PDrQ5e
         Jg3q0tF2rk4jDvEt09axr4jid7+IHz5fhZkvhDXHMRl85v8EvwuivylLfWOBlxnjZ2d9
         ZT5npTLCbNIwgeW6h+W/yvJLX2JYqEz+60/XVNdAVHyZvak7YVQ4Coj281u4ZYMPb0JJ
         1kJF8hWZvHWY9ZvbFQ4mUuHAXU0Mo/sc+flLiYSZOc93na95aq7VDGx8UoKXylmNAVE+
         gzpxR7gxwYbjgXKq7z8DI4PeaKvrvqQO6mXfLyZNaHkcx1gLiWverqjcOmERMAYTVGov
         kidg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758786728; x=1759391528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/pmdbPSS1+PFGOQZXgEhCWxoqVsYqlqHhZMSV2rIROA=;
        b=dgmuUQzR2eOkTagaSHll0hBq/aE/70EpQm4ZU4ES0qZaWRYgWona/8j+3Gv6IAdDve
         O3xLNFlVYfA+cmb7B2nqkXc4w/uhJ+HCevlhBMFXxxZyd3VyVWhbmzQNvyZBtdW3qZNh
         jmQ2ZEioS5lxkMCBTmB/2xDKPGF3PD0/he1NQSgoi3gJ4yN0JteNQ+7nzDsmXGMZKGa0
         ES7ZmkjD9PJ3l3dLXI5kvpej+HXWNsgBLmnCqM+mrn49Yx/BtQ5HJVM/JguQLscLXs6O
         uguIumA3s5t9nvil0qGfb4eLymR6YZXgwJ96eB+0KNgwaeASOJnrr2ZRHSh0viIb6Net
         Y2Fg==
X-Forwarded-Encrypted: i=1; AJvYcCXdmBq9H4p8MgPwWK15ZHD17ujdS+8PqCsvBBNVk8m7AlatCy7rtYRGJK+uxYuFUYo9CQkoec9eleK/@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv3B5sUTdp/6AOR7TPHXyeuJPaaHajthhGwX/rUOCo3m34vY+N
	RFEIDwkn+eHyG9uNY5YTRZ5lkYsjY8WGlIiNBtos1y4LK6R+YzyLot6Ts/L+PUSHscaSvUrKr4J
	wo1iaAD5ou0TLkk2x65zhw4zQi8hgwOVutFFUTkpHvg==
X-Gm-Gg: ASbGncuH6hrjIprl/YXE0a29Uvd60jKxuUtsAFhUCHW7cr044ngO7Y9ML2UENXJImMT
	++HCumh6ymy14PiaotRg+yLcps44m9Dy22fO591JhpMnq6dnWf2inCmYtjESpXcBQrbsMFYAhSO
	SlO5mlo1NRRuNqK5dOIJV9hsQUEDxLfWytxpcCl2Pp6mcQFbWxWoc0gMDgNjnPmhSvcrmFz5xVx
	Pjwv2HSCfpjKVCKuN5Hpw8eIPjsKdw+x7EMTg==
X-Google-Smtp-Source: AGHT+IFjDFQMappKZZFROu+v6o3bME1MjtTxrIbJ3f6pWVz6MpCD55Lk6Fra5LzFmOtZoqCjtC5vbl0PRHtSU8AsH3Q=
X-Received: by 2002:a05:6512:3a8f:b0:57e:4245:114e with SMTP id
 2adb3069b0e04-582d14effcfmr700774e87.24.1758786728179; Thu, 25 Sep 2025
 00:52:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
 <20250910-make-compound-literals-normal-again-v1-2-076ee7738a0b@linaro.org> <CAMuHMdWoEXLTPyQL4kt1OPVbrDDcBdBigqUM7EbNZjZUsSmRHQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWoEXLTPyQL4kt1OPVbrDDcBdBigqUM7EbNZjZUsSmRHQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 25 Sep 2025 09:51:56 +0200
X-Gm-Features: AS18NWCh67p36-1DiEra54BRYeOZGMgpqlB-NSoS3MdBtkk6GMB-z9-7UGdMnvw
Message-ID: <CAMRc=Mej9fQk-1zYKhPK6aWdptXKvjq28TywRyP+iZExRuX9og@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: use more common syntax for compound literals
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Lee Jones <lee@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Linus Walleij <linus.walleij@linaro.org>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	James Cowgill <james.cowgill@blaize.com>, Matt Redfearn <matt.redfearn@blaize.com>, 
	Neil Jones <neil.jones@blaize.com>, 
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>, Hoan Tran <hoan@os.amperecomputing.com>, 
	Yang Shen <shenyang39@huawei.com>, Imre Kaloz <kaloz@openwrt.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, imx@lists.linux.dev, 
	linux-unisoc@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 25, 2025 at 9:48=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Bartosz,
>
> On Thu, 11 Sept 2025 at 12:02, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > The (typeof(foo)) construct is unusual in the kernel, use a more typica=
l
> > syntax by explicitly spelling out the type.
>
> Thanks for your patch, which is now commit da3a88e9656c17a3 ("pinctrl:
> use more common syntax for compound literals") in pinctrl/for-next
>
> > Link: https://lore.kernel.org/all/20250909-gpio-mmio-gpio-conv-part4-v1=
-13-9f723dc3524a@linaro.org/
>
> Looks like you (slightly) missed your target. The correct link is:
>
>     Link: https://lore.kernel.org/aMAP9hAWars0T83r@smile.fi.intel.com
>
> > Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>

Hi Geert,

This is a link to the discussion with Andy as per Linus Torvalds'
recent request to use the Link: tag to point to actually useful
information rather than just the patch's origin. Linus Walleij doesn't
use b4 so the origin link you'd normally expect to be added
automatically is not there at all. That's probably what caused the
confusion.

Bartosz

