Return-Path: <linux-gpio+bounces-23626-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3E1B0DEBD
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 16:34:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22EBC188FC49
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 14:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D18482EA492;
	Tue, 22 Jul 2025 14:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="axhpDc8X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DD42DEA8E
	for <linux-gpio@vger.kernel.org>; Tue, 22 Jul 2025 14:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753194683; cv=none; b=XUBSUg86WrT6MDr/6vmFfJniRMBuqSDvjuF+1r8K97L3/s0psMoWdfrIirdeUZ9svIyhMW0tBpDDmHwh/FgPwfnXbBpayRvt19/BXwWCLju2hGKtQ01R4UkTVEqBr2tEVh9m4LXjTpySN88VVJYcgEMWKGZpXWZ8LRvxkO3K3GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753194683; c=relaxed/simple;
	bh=UZ+zBV2JeyxDYayE20yxFBEI2cnrLC+AvEyRTZiqdzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qlsP1yGbQHT5GLC9jmkeH9gPZsdO1u+Z92NmxO0L+UyD+LW2+1Lw2oBzjYL4ZBGRkLk621ZxnbYhw8Dp/DdCoOrBxLVFZzT+Bs1pLqj21v36uIOjkF57yb9vwOFGxD7969PMgqGRVGyPPEcB3J1NqYhMQNBfiGYJFaat4qfq9QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=axhpDc8X; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5551a770828so6117816e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Jul 2025 07:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753194680; x=1753799480; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BV1WGtpxAkHZqPn5ByrKWI6F5o4/gV/EdT2Vc2w+8Qw=;
        b=axhpDc8X4VmYOSSWitSMM0Rl9MmZd4ePLcjYSHXHSVXY5VSYxz0Q7DChhnV3VDnOBl
         s/Q/VKVXOzLximZuY46EiBoKrHMemquRfjRjBNA8VusBMg2b57FQ3hqFPh1u+f+OIYzQ
         K9ImZF+KHlt0pBHODImaqSjkI0WYRTT0+Jf0fn9B2uXKmRH2pkuDWFCDYBlikhsddDvc
         rmTqG2OqZVXCY9GlHiMMa0UHNMwCKVMDsAg4IZekw+qyy7ERrIQvLVHC9p3Fi1T8wPgX
         C59zelaKyYBZ6AI4L10AbUqCJKusaJ7+W+NqCkDp9jxWVY1LYZWXjk1ycROs2c4PZ36Z
         hAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753194680; x=1753799480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BV1WGtpxAkHZqPn5ByrKWI6F5o4/gV/EdT2Vc2w+8Qw=;
        b=PzOvozpIk7FBjP3lixpSgizzHEH/kRDjnFCUlhLkRtMEEM/Ojgnqnt2HOKFOyGE/Vw
         G6yFm9Luay5cQzoDOr1hHgtkTi+Aqx0ntlbNtAbouR3p4KrVPcHU29fKBTdxCKqjW6kJ
         BKlhdscysL25GuyqsBSOKYsnj1kGcrzeXrn2vv6Tr+ZUvkHFQzeKwpgrBsYFYBy6d3Ly
         JohdzYxd1Gb/w5ajsBVecTe8GRSr7kdoewzW9vWj2IQ4ShTIoFjJWHlksEDUxY0Rm84E
         jQAglPNs1ae/wtvqEJmHWlo+TV/dTSVRMERQ5KZxDDkcY4U5YNVOFT7L917n1v6we6wn
         XHSA==
X-Forwarded-Encrypted: i=1; AJvYcCW42C4H3O5AoLORZbc6s31JvpK1GWQgMphRoDKnB4fMBe6mH1LUL2gxP+ShT27yO25kqA+H2mLgvBJP@vger.kernel.org
X-Gm-Message-State: AOJu0YzErIKJBY6gmgj9fQzUoEHCfNP//VXvDg+5Mw3EHfsqAi9t0cMQ
	AH73hFbutV+Sh8sr+jo9VxjiWrWmwaQovNBt1oNdym6m2UMgPa7lEnTKcatcI7hf4ansmlpQU1i
	LITwEPdAksuHdDAqX+5ZlQU8Liuz2nT615CPz5cPx0Q==
X-Gm-Gg: ASbGncv3PRP1YZxHrOzd14oxxEyeZuCBPZsbE9hetP1IMzCo16uXOPUBhbhfN16RAJK
	V38bkIDT3oHOqxbbKOVonw8XQKir1q2QY/1cQK7Oqx5zqdRophHgX1nfn8apNE6o/rMUPJi+CqE
	gvsxkZP0Dj5y6AYEFQVE8I7a8YORqCmbW5MkNx18MdnLgaFRiakXVsmzrAzjzZ53YtcEzXFiqCc
	o9rQ4+6nMV9cHy/zL4+1LAnOpg7JO4WhHMmq9BTXhk1/2Io
X-Google-Smtp-Source: AGHT+IFEqOvUZdS0xFaiTKwfEoQAuQOvPLkieUBzBnWGqxyef23UMwYYSmoW4V1YF8P8O4BYxzngOKTcYEWjVpbw5cE=
X-Received: by 2002:a05:6512:1323:b0:553:ceed:c859 with SMTP id
 2adb3069b0e04-55a2331da49mr6069204e87.21.1753194679879; Tue, 22 Jul 2025
 07:31:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250721233146.962225-1-s-ramamoorthy@ti.com> <CAMRc=McTJnTn1sf6Kc42yePvUyP87h1utJ7B_ynWjUxxm0E4Lw@mail.gmail.com>
 <CADL8D3YaF4zt2Wu0Vv1=8W9e9n5BKM+2npgfVmLhJ=wz-jHMKQ@mail.gmail.com>
In-Reply-To: <CADL8D3YaF4zt2Wu0Vv1=8W9e9n5BKM+2npgfVmLhJ=wz-jHMKQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 22 Jul 2025 16:31:08 +0200
X-Gm-Features: Ac12FXy7NJ_nraRS25UNlwGulNE3E8mn28sh-4PSfu7qcum-O7yR_ClX6M5nv2I
Message-ID: <CAMRc=Me7ade2aSJhn4tEAdNUvB3Y5TRLp8j8w8zgP5J3C6_MkQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] Add TI TPS65214 PMIC GPIO Support
To: Jon Cormier <jcormier@criticallink.com>
Cc: Shree Ramamoorthy <s-ramamoorthy@ti.com>, aaro.koskinen@iki.fi, andreas@kemnade.info, 
	khilman@baylibre.com, rogerq@kernel.org, tony@atomide.com, 
	linus.walleij@linaro.org, linux-omap@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, m-leonard@ti.com, 
	praneeth@ti.com, christophe.jaillet@wanadoo.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2025 at 4:16=E2=80=AFPM Jon Cormier <jcormier@criticallink.=
com> wrote:
> >
> > This doesn't apply on top of my gpio/for-next branch. Do you think you
> > can quickly submit another iteration rebased on top of it?
> Maybe this is a basic question but is there a rule of thumb for where
> to base patches to be submitted to the mailing lists?  I've generally
> been basing them off the latest tag in linux-stable/master.  I suppose
> this might be one of those it depends on the subsystem things?
> >

I feed my tree into linux next, so generally using linux-next/master
would be your best bet. The rule of thumb typically is checking the
subsystem's git tree in MAINTAINERS and using whatever branch goes
into the next release.

Bartosz

