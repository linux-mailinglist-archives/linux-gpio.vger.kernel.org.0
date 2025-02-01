Return-Path: <linux-gpio+bounces-15165-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD376A24A2B
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Feb 2025 17:10:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BFBA1886D2E
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Feb 2025 16:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AA581C3BE0;
	Sat,  1 Feb 2025 16:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jDTYAN5l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D6B1AAA1C
	for <linux-gpio@vger.kernel.org>; Sat,  1 Feb 2025 16:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738426222; cv=none; b=qK+GrLCySzmkJRbM1a5LBvsdbBN/Q84bP22UnDyeLjWW+1dVNOg7XqLSmvOky/ooJmSKVSGiFIko9F/Xdry9Jx9Uat/EkCpEv02p0Sn+tyu2PP4YHv2jiwZ5ZR2hg3iLDvVNNuEefdmWkD4Bf5Z2XSLUb9l52Bhoxd6P2gR8grA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738426222; c=relaxed/simple;
	bh=JItcR8CbGZcrDCr9Z8EQprhcdsXHvwANLmyr5FSR5+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eNuzErdLvgl1D18BJYBME1sAfxWQdZVTrlwgH8gFuMzM7hJaFU7PDfOdVi8YmHRnl+ojuFaO5ImIFC2JmQZq1M2dT6Sr59TVl3H4Ag37X7YBsfwbsIfTfjAlNDLx/Pz7V4oaOmxcx+VxOKbkAblgEA9cXEummmt9r7Cp+1WFJ3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jDTYAN5l; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5401d3ea5a1so2589617e87.3
        for <linux-gpio@vger.kernel.org>; Sat, 01 Feb 2025 08:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738426219; x=1739031019; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JItcR8CbGZcrDCr9Z8EQprhcdsXHvwANLmyr5FSR5+I=;
        b=jDTYAN5l+x+Ns1mLCviL7XGegTDVIdknplz4Z9rWKn495vgtQ4caxobtKX1LLmGhU6
         iJZz/Wg8CfOnCkrk455cfkAcC3HKSoSZRroFPV19tRJbx9DhD7TDy0ZSJhY11s0wxaao
         a5LDvsDcPLoky6S+RcYpy5l9+iKGkV4Hn68WJ8L+jseR5pFMHvXAfUgkL/2UkSqaSefj
         xhXXllYKa2TxK3fqp8CpDrXo95GUV/NrAyzjIn/BKwAnML+NjR/qEy965IQAv4vZKBWQ
         R4XRy3hm2vtLWzO1coQPpXyeQwqzq72no7+X4SwxKzMn7i2sEA5i8leTDH+Lac3cwDBP
         J4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738426219; x=1739031019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JItcR8CbGZcrDCr9Z8EQprhcdsXHvwANLmyr5FSR5+I=;
        b=PX5hbbV5v2zF7J1X6IHgb/eBdenFlAOACgwSaf5TGgQwP+CSNZKCWJk7pDcfoKt0if
         CtKxmAHRJH6dLNPDTFdCZoUPSid2Tf7Xj8DmSdhiaqjpBdeJlU323IQtdhbpqwWQcHIg
         V3UVxSk1w6OZPqMyFZUBcxSm94Pe3erhl+Uy0CpDDSEQ4OtQHMVC56+2sOKc68U4UB2S
         5lMIkiSFgiAc4zW0uP+KjbtiqiKNWp0apl5SLv23AbyMRDlXsLjtNPLKpibA5BcbWTkA
         P3S5A/WB100dFxCj81NGZFOovVIgLLRA9F2fy4r7LrMdKz1ON/UT+/UDUDTITRHqsiIA
         4Z0Q==
X-Gm-Message-State: AOJu0Ywr5TxwUJEzPRsvSUyGAWtrWj2G/H3ZafZ6fMbCP26QUTlSqTzQ
	zEThspP+j/RLgaNVrADHyssVrVvX8CogQsJ7j8npHftotAdxaT3c8D3kE+5gSIKIsR2A6Y/X7kG
	1WVwNctK9Xl3Rv/RQCIg/qMDNhJr0NosjJeBDsg==
X-Gm-Gg: ASbGncv0guujbaWbPnQxGAzMkZFBRBrKM2OCO7epjEp5Bt1YdQRfsW8sq4D7msYJevi
	yBvDOi1HKOeTJG8+BKyRYSOyysvu+CB5VqCuzyezQTPA8Yu0Do+dHzDi8d7aURG/JF0UTao4P
X-Google-Smtp-Source: AGHT+IGrd88r20TOFapiU3NgcHkloNtM3Li03HGBvF4XYWzPb+4bQd0ojKD+4B2W1f3FkCcaIHamOflErkpVnUpD0Uw=
X-Received: by 2002:ac2:4c24:0:b0:542:2a81:a759 with SMTP id
 2adb3069b0e04-543e4be03a7mr3486052e87.2.1738426218660; Sat, 01 Feb 2025
 08:10:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129155525.663780-1-koichiro.den@canonical.com>
 <CAMRc=Mdim2aSBs+JsL8dECfG0Vvrvcq6CHaGHbBoVhNhSZn9Kg@mail.gmail.com>
 <2kz6mz6nglozgrwudkgziles4wievwfkkl2oo7qyvosirchjuw@y3wfna5dsekv>
 <CAMRc=Mc3qBXaATpYRAXeHne0+mBjErivjvUe4rBEj2ksansatQ@mail.gmail.com>
 <CAMRc=Mc5WWNErJfEQ4sFRQm_+vDRMa7KBKSPSnP3W8scu4G19A@mail.gmail.com>
 <rhdrieapetwdr3z7roguf5nex3esazhygjbjx4zklkrjzqrlsv@6vc5zmk3il5e>
 <CAMRc=MeRBABW6JCScGvsRR_4+W6u5QMWJwA7yMB9gj7=uOeD0g@mail.gmail.com> <xrllvn5tmshdbb2mjlxvoc4rpalnefy52wwd5p6s55ehhysl4l@k4w42cd7hxkn>
In-Reply-To: <xrllvn5tmshdbb2mjlxvoc4rpalnefy52wwd5p6s55ehhysl4l@k4w42cd7hxkn>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 1 Feb 2025 17:10:07 +0100
X-Gm-Features: AWEUYZmPwDEyLQgRS56YRHOlcMhb2tTSr-oBLgaMMeU7D0d2Gf6qtGRC8OLq1n8
Message-ID: <CAMRc=Mf6FZgTNBGUSsm3H2nSBLbp+DpamzbZiHZ67Xc62F3QnQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] Introduce configfs-based interface for gpio-aggregator
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 1, 2025 at 1:26=E2=80=AFPM Koichiro Den <koichiro.den@canonical=
.com> wrote:
>
> On Fri, Jan 31, 2025 at 06:22:50PM GMT, Bartosz Golaszewski wrote:
> >
> > I too think a-1 is the best option. However, I'd go for line0, line1
> > etc. convention as for computers it doesn't make any difference while
> > for humans it's more readable.
>
> Thank you for the comments. I=E2=80=99ll address your feedbacks and send =
"v2"
> later, Since we seem to agree on the overall approach, I=E2=80=99ll send =
it as
> [PATCH v1] (i.e., without the "RFC").
>

No, please don't. It'll be confusing. The RFC WAS the v1. Next
iteration must be v2 with a changelog.

Bartosz

