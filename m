Return-Path: <linux-gpio+bounces-20407-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FC2ABEF40
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 11:12:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2CAA7A58C7
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 09:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04C6F239E62;
	Wed, 21 May 2025 09:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vxFsyQd5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B2E238D53
	for <linux-gpio@vger.kernel.org>; Wed, 21 May 2025 09:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747818753; cv=none; b=XJ4+RDdYsTa10a0XCHVdRH5+Cc2kMKP4xtvkevV2C8vyZ20VvAPxh+t7oZ0h4dQNFnpQWcrdb3E6wUUehlL5G2NhrnPLvEvDszdVUhHJshP/QXLWdORL9CGr99Dmnd4fYe/4xXv9SEeOijHvgE+fPHafsFoztC/9akunT+vOBq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747818753; c=relaxed/simple;
	bh=QFKNZvDbXSe1MHFbyHHsrmWveGN+OlWpUW7e5hHi6gY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gR4qobD3499vw/5kAE+Ry3P4kWCfAUdlKd/0ryOuJU2+IWfRo6od3qKr68oeVSQ2J5LvUdr5J5THz8MLxH8xPgNkQmFduKbF5MU6pHLeR+Ym48fwkI7rHdSigkCnweaD2LzjWLYKP/e8p/ohnBzzRQmZDMPd9tBX6UJSX0ekf8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vxFsyQd5; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54d6f933152so10072259e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 21 May 2025 02:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747818750; x=1748423550; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dh9o4fpIUVGSGHu7S7cRDAzq07I5BwJlujMFINVUUGA=;
        b=vxFsyQd5Fhj0/t6JWdrPZz9OYrXUxpvz3Ghag8iop325CQqCjKuJwBH66WvHEowIoz
         I2EV/GV3wlDtS9Sw9CX2HlhIV7nD15LiMmfIAdxttGarQfdpa+1g3ddZ+Y+g1l+LA/x4
         ttoY2gRXy2sEBu/jf301p5spW7IjGjSYckc+2dnSMRUWnzCCsojzvYNewexJaG7nM/A1
         RLPrEBfxwomZ1jjk7hGsr7leTk+xShHmNo6mDCgZFcCmtdnXZDoTEZY0xv71hiKweplQ
         Tj8uDjkmtHv9k9LclnLBogtXvYdd0UWZ39PrTMlsLz9vvguYWwqmD8yxp2OeM3bEN7ct
         FeRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747818750; x=1748423550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dh9o4fpIUVGSGHu7S7cRDAzq07I5BwJlujMFINVUUGA=;
        b=HHzyWe+p3DRGM061VajsdqabNKBFuWv1Pg5Q9fwqwgdAch4YdF/Gi8sJKBnT8bVKXK
         wWQuyMx4KZ9m+ADKt0JnjdExmVPi9qoo9XgMRsfPTsv2pI3T83OqWxksH9zH1fhmYvPT
         KlxBVN207TdHzG2rXCtQ/IjNQzpaHJWs6fPiLv7m5uB6hlOzmLF0TRbs2wljKz1HPwQV
         +v70DTVguUjXYKemLxw9Pk2uGCKm1WYKKfnIST6S/mBWovEBhs1xw50xXeKM8qQiP2Hn
         UC3SKYgsWaBEK7mk1TKoXWF2ShrYOfA6ymXlzko99vIZFu7QmDt1/tHjXapAMQ8TiKDs
         ViyA==
X-Gm-Message-State: AOJu0YzRy1p0sIfW3GG65CjWOtYfZbxg0/MlJ3WW3mhq7l3lqK6oeAJ/
	m2STxbSEYiHO09iRHZCS5ALdiHbjk1mh8gYlgoRseWWKqkpXeU6lQdCKHGkBHppkKktMfU9tZrH
	8HQqdzPZFsdDvKIS3wqi4tG4dnejVQ6Wj42fW6KkPG9SZkkUjXRib
X-Gm-Gg: ASbGncvHuKGLyStv6ISaKhNlP1qnWyaWKCRirgbusWp/5QhTDe0ysYW7hLE69gN7d4b
	1DltYLnBWLLLYbjNNkTFgCaH7i0trBn3YDy4lyi4aJwebhPcKOVvH/bKATgeQY9K7tXxcN/UUdN
	ZsIJ1d7bxnsqyDP4Uw1wxw0bv2rZnbRYufQ4yxEjclW5ykZQGruyOt3AS2VwkOwOJm
X-Google-Smtp-Source: AGHT+IHwi86hWSRjKj/WHJaAnsouifxHP9NMbCvyr5//3z4ybvV0Xnt+Q0rWOgLy3x0y7WW7Qc74cWlT6Yh7WiNvwjM=
X-Received: by 2002:a05:651c:3041:b0:30b:ca48:1089 with SMTP id
 38308e7fff4ca-3280969a0e9mr55892561fa.2.1747818748198; Wed, 21 May 2025
 02:12:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aCzbya_FW7hg1Wkr@black.fi.intel.com> <CAMRc=McMOH_S8Kf1TPV3Z0QYPz+cfS9hxZh++fNvMc_U+TssLQ@mail.gmail.com>
 <aC2W84mKGzgbRsL9@smile.fi.intel.com>
In-Reply-To: <aC2W84mKGzgbRsL9@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 21 May 2025 11:12:17 +0200
X-Gm-Features: AX0GCFsy6hBZuhmK5HNUD7r4ZFDsWtHrT4LrSlGpGCveZM_hEc2zeNDawyRzRtg
Message-ID: <CAMRc=MeXzWZ9YaxfEZwbeO7ApVMGN_cV=71e2U+OpPnD-UZ4=Q@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 6.16-1
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux GPIO <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 11:03=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, May 21, 2025 at 10:44:16AM +0200, Bartosz Golaszewski wrote:
> > On Tue, May 20, 2025 at 9:45=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> ...
>
> > > Bartosz Golaszewski (2):
> > >       gpio: graniterapids: use new line value setter callbacks
> > >       gpio: ich: use new line value setter callbacks
> >
> > These have been in my gpio/for-next branch for a long time and the
> > ones in your PR have different commit hashes. Please remove them. I
> > don't see any notification about you having picked those up neither in
> > my inbox.
>
> Really? I though I commented a few weeks ago that I prefer to take them
> when Stephen complained on dups. After that there were no dups noticed.
> Since you haven't answered to that email, I (rightfully) assumed you are
> okay with the proposed course of actions.
>

Can you point me to this email? I have not seen anything and can't
find anything.

Bartosz

