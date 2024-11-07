Return-Path: <linux-gpio+bounces-12672-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 890EB9C0843
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2024 14:58:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB3151C20C85
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2024 13:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9327B21262F;
	Thu,  7 Nov 2024 13:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="refZ/lFP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCD120F5AA
	for <linux-gpio@vger.kernel.org>; Thu,  7 Nov 2024 13:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730987881; cv=none; b=DimNY8j6RU5aEUXIXK+Mhmmr9s1nn04xSqG2i1wXo72lq/2Sl8O0gmTzSnHq3D7zrjsz2NrQHVa2Jrr/JXkqom8S5DgoDES8Jr7QyJCW3h5A07UkBeBMZf4y8oJAfDXhAFuJmX3IRaYbeM7fdEnDlIPjnjMNdbd5ATU2Xn49PXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730987881; c=relaxed/simple;
	bh=3qbBNpmUOGrReqHVVDjQW2I5NomJf1SLr4J7mIVaCfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZsZoekiNbopdHaZOSpp4If1imTP6KSNW4sFJ97BCNyWHJJ8V2Qulmoc0WLRoy7q+yvA1tMos5hFUQ1YF3CEiJnSjF3q5Hw8ePuHOUrot5kIXLpqvsp58p/5CG42hdqi3zyW5Rcpq6KsamhOqTokIILIFVopL4ki2hH/ZBdtiJRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=refZ/lFP; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb50e84ec7so7880521fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 07 Nov 2024 05:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730987878; x=1731592678; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJYUlqeWWKYMuN+Qvg7ceJ2AAR8pi0zjQ8Veiy3yBI8=;
        b=refZ/lFP6bKJ7SJU+DGOE54O+xt24u4U2RzllKDGUTwqjyTSKJtmMOSCdNk6mFVCKB
         0eIWluNv7psUbYUDETR9jrw4yqKR4JW32oMDDKxvsPl80HcnabdCxOpGLqIeFgE8T46S
         AVW8VCDtEaFIEDGGHtHqB0ZjBEK3CaXo9UbQ3UASg8H+bRsTAkVxmFcvSyFcu9/RXa/x
         7uEuem/PyTBOZnoU9pKThrw/RfyXpBC8Xm5X9EkpCOuvfW07e8tXy8nJ3EPpOFzEswFR
         eGUkwCniu09F7Tv0KEt1AgpOoTo/frLq+61f6q21h8DEnIEcMgEisIphD0mC9FK8OCSP
         7/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730987878; x=1731592678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tJYUlqeWWKYMuN+Qvg7ceJ2AAR8pi0zjQ8Veiy3yBI8=;
        b=KdR1DzEMcjQ/pFdZ8Nn8pKvXmDFGWxk8Nxmm4ApfY7oQCN4BaoZ2hC3+IlH78UxgLO
         /4j/wfDL9zEsXKELyjwtUzDMB88RdMADCX+Yf9CEneCR5pp3nf38IY8TWhNYHxiTu+b1
         WI3C/00K9LXBjgcXho/nei3ZRjnrk5tbRVkppDm0VD36/vJYt9RacHGzrzfSM8XmiVzj
         Y3u5BCZ7MJqyo60Q0VEfcW8uLusQ1icz6PNbQkPrevHyT/7F6dVre2ptOobHJrwsjsAz
         8a4hdFUfmbOBdBnhUMi/e+v/3bHnUKTWesf7rSa4Ox0UIX6YJ/WcRwp5v57N9CMgTwJ7
         c42A==
X-Gm-Message-State: AOJu0YzUleXHp5LjiJ4GP8lFPKLvMpX6BMWdjPkyesgw38F5BWcogDom
	2WQdWkUw+IKqFNhagFRq6G0RECKsWK/6a1aKumEaLV01aIzFG1Skb5uGynbIrkq9HW8VmvvwL/+
	d1zZBnDw8NZeLbjcaiDcroQEXSVLOuCsHcZLGCfqLtHrOlCjk
X-Google-Smtp-Source: AGHT+IHD0184U8G/T9QOh0ulWFi43uyjf9DqM7wZuoJbmycRRT/zuhtwFAebBi4l09xtEJGJPWDaOILHC3e7gxNVel4=
X-Received: by 2002:a2e:e11:0:b0:2fb:62ad:89fe with SMTP id
 38308e7fff4ca-2fcbdfbb311mr169104361fa.16.1730987877772; Thu, 07 Nov 2024
 05:57:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241107102606.GN275077@black.fi.intel.com>
In-Reply-To: <20241107102606.GN275077@black.fi.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Nov 2024 14:57:46 +0100
Message-ID: <CACRpkdYmB+VHAVN1XpBwTzkGUM-SDdH5NFtPQRofuyN9M3ND-Q@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 6.13-2
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linux pin control <linux-gpio@vger.kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 7, 2024 at 11:26=E2=80=AFAM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> This is an updated Intel pinctrl pull request, now based on v6.12-rc1.
> Please pull for v6.13 merge window.
>
> Thanks!
>
> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758e=
dc:
>
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/in=
tel-pinctrl-v6.13-2
>
> for you to fetch changes up to c6235c426d2ac78ab843a55cb1556b0f43175d9e:
>
>   pinctrl: elkhartlake: Add support for DSW community (2024-11-05 07:48:5=
8 +0200)

Thanks, pulled in!

Sorry for being so picky with particulars, a few of us kernel developers ha=
ve
this trait.

Yours,
Linus Walleij

