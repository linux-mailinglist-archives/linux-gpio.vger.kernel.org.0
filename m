Return-Path: <linux-gpio+bounces-6277-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 119A88C0FB2
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 14:39:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1FC0B2159A
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 12:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1BAA13B29F;
	Thu,  9 May 2024 12:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="f6IZ58UP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FECE14EC4A
	for <linux-gpio@vger.kernel.org>; Thu,  9 May 2024 12:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715258351; cv=none; b=aBG/QkSESrqw+K5bC4+09HlnV0ciaMHUo5x4MdlSpxyWnrkBSTHeTi9DBkHLVOpq7P1cKxZDpFer0tndCEltoW+8dfKHHjTrAqVX/XOVwSLedI+HDDidTE8wVzjob8c7nBuIN/3CPgPm/ihvXqEWAmnpL2IXDSV5NIcUzZzekHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715258351; c=relaxed/simple;
	bh=/qifQVBQEiWxE6aNXY+Qc/za2ggNEzkEvOY3b3dDxTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IcB1/EJhm/0GPVPmieySqi40kZbADQyL3Z772vgJfSwyGQWwzjtz5+2Ls5e0/DwhBU32MQFi5iS6V0Tg2xBjPE4ws1j0VS6kQdhNvLgkovJrb73RL02PmvTWJ8Hy+hsSkNMYpjc3QMMzIV6yW7QcFdP8k5fwPDW82ifNxIdmETs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=f6IZ58UP; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2e3f6166e4aso14587801fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 09 May 2024 05:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1715258341; x=1715863141; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/qifQVBQEiWxE6aNXY+Qc/za2ggNEzkEvOY3b3dDxTY=;
        b=f6IZ58UPElXDUxutc43G9CytGaBf0TjH+CiT8XX80mPljKpKUQYe9uVKslR2fRUeym
         Obx6ijeOpUuDWhw4jvB6+pq3cXDx4c/JGhHtsY62uimoWAHrvbjoREvtqQMPo9ozZP0f
         qCbhpQkRtSBKqPtN2VxcfJm1vNtneC5xggE0ZANp9UA1UIpiVXnoFpjSCI4P//K7jfux
         XTwMoqmNjGHhDzjC0ZaGMX/CJ4k77VdnMW/yQYRZYePduzBOF5av5R6qw/+RRQuPFs8a
         aByfCp0UBCTaSUXuc3P4BfYsx15+WB9auEKTho3w1NsWlbMf2z+iOdz15LxZa8TB4bHS
         E4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715258341; x=1715863141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/qifQVBQEiWxE6aNXY+Qc/za2ggNEzkEvOY3b3dDxTY=;
        b=GsT/Fu3jGECWqgaky3Hq/I0nBQbuJTyaTBTRUfKhbpUb0z8kGvN2cVhsEWdFsCZtmd
         qkY76W4DxJs2m+uG8ST4yTIBXIsKqMZrfuua9aDd7HbDp3XMbjNP9lIxGsnII2MTVq8Z
         4zaYE1aniHlNa4ypW0RpGYPla6a4HZufqpEN5ZWh3s93YUwwLexdl9nuXYnwkrWGZZ4C
         hOVksLeHJFKigiY/L3tBzKQaZ06OMXY4F2Eof4btC1EkGCzj4PQdL2V6++fcR55kXpbE
         HWdJQIppiJ1HmRmXIpS36st9OfB3N9wHPiV+KJozw4Xs+FhVLIdIPiSIu2hMKMDYO5t0
         gGYA==
X-Forwarded-Encrypted: i=1; AJvYcCVbvL4SysJ/DxBMmOcyaD8cKd59JvVwfRCmR0QNT5yvXyaPtm5BpCwGqgyk2d5R9DKv7mOD6G1ZDHxOGYlEZCwZl7fPzLGAK5ns/g==
X-Gm-Message-State: AOJu0YzKARg3ZCL4hLcZTFH0Ty7yb80gdP3a2py0Gzsa5/HQjVgSBO8b
	qP0H977h0WkRL+o8/fGc4M3u0h5pUcn6jqPTtAD06KjNCNSjcxbxR+zHfawrz2b94ViQ2Y2v4de
	ahJ1Xjp5mfLoCMZxvKGxrIVfvxAYMhi5a4DjBqg==
X-Google-Smtp-Source: AGHT+IHfXiZj2TynFBJXGjohXefpQ2d3aTOQldrHJcQ793c7mB2l2X8N/gu/5FkbfTCLdSs0zo81BsKipsMO4noFDK0=
X-Received: by 2002:a2e:350d:0:b0:2d8:8633:ff70 with SMTP id
 38308e7fff4ca-2e447084d0dmr44427531fa.30.1715258341071; Thu, 09 May 2024
 05:39:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507121346.16969-1-brgl@bgdev.pl> <ZjpnDTXUSYCOAFRz@smile.fi.intel.com>
In-Reply-To: <ZjpnDTXUSYCOAFRz@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 9 May 2024 14:38:49 +0200
Message-ID: <CAMRc=MeCX5YwggkX3X2O1rFH1KrQ1P7gRBMJmf_SburXdRaj8Q@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: fix the speed of descriptor label setting with SRCU
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Kent Gibson <warthog618@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	"Paul E . McKenney" <paulmck@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 7, 2024 at 7:38=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, May 07, 2024 at 02:13:46PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Commit 1f2bcb8c8ccd ("gpio: protect the descriptor label with SRCU")
> > caused a massive drop in performance of requesting GPIO lines due to th=
e
> > call to synchronize_srcu() on each label change. Rework the code to not
> > wait until all read-only users are done with reading the label but
> > instead atomically replace the label pointer and schedule its release
> > after all read-only critical sections are done.
>
> > To that end wrap the descriptor label in a struct that also contains th=
e
> > rcu_head struct required for deferring tasks using call_srcu() and stop
> > using kstrdup_const() as we're required to allocate memory anyway.
>
> If there is no label and we assign something like "?" (two bytes) we got
> with your patch the allocation of most likely 32 bytes (as next power of
> two for the SLAB) instead of 18..24.
>
> OTOH, I dunno if SLAB supports 24-bytes. If not, it means that up to 16 b=
ytes
> label there would be no difference. In any case, with a new update (as fa=
r
> as I understood the next move) it might return to kstrdup_const() or so.
>

Memory is cheap. This is just done for requested lines of which there
are never that many. I wouldn't stress about it. The rcu_head struct
is already 32 bytes on its own.

Bart

