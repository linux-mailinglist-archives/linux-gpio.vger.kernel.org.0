Return-Path: <linux-gpio+bounces-16093-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D51A3754B
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Feb 2025 16:59:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B22D81886D21
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Feb 2025 15:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 901E11946A2;
	Sun, 16 Feb 2025 15:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yaBr2Glz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6416C8E0
	for <linux-gpio@vger.kernel.org>; Sun, 16 Feb 2025 15:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739721546; cv=none; b=PTf/8eQdLVJ3rr/ExTqg93TEFwM6WgN27qjtATtWmRedALayUYvfd4KARtsC5VRu6BiVadYwPOhCuQ97iv6gVmOoX7jBV7KBiYybjvGcSW2NGw49vgu39b59/CQ6AziUtq8pWFj5yg5A28Y8eNcaYlfvy8s1KiMRudECXCOivJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739721546; c=relaxed/simple;
	bh=IFij8wrZ5Xes/0S/tgCYsJ2b9Mf6BOf6rIN/gEboWF8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nsyrfIxtIwYw4SgAi6pjeOLQzrioHOdeOXGfyl5dVbr+yGHghujmETo9cyJv3gjM5NCZYb5WX1cePLBT6nso6er476LXlyzRYOs52ctUT401KwCKwZYyEMIrDxtqqzTPYCJGr9hwYqNGUucHOB/hUED+vbpDRyd0anPVHjZT/iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yaBr2Glz; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30a317e4c27so616071fa.2
        for <linux-gpio@vger.kernel.org>; Sun, 16 Feb 2025 07:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739721543; x=1740326343; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IFij8wrZ5Xes/0S/tgCYsJ2b9Mf6BOf6rIN/gEboWF8=;
        b=yaBr2Glz6qBGdC5yhuGyqEKUgtQS0gvyRhU1hAxzCa1lYi/PH80bwV3Yj3+4SaJiyF
         v8drQBgR/bX5BojYK+BZtkEcvhDnnruH65BZCmwgFE4iP6hNaqJgnpAVsPJd0cG10UAl
         +Z4WNeCNAZrmtKDiGL1GTM7SHZaDhwi0HB7Zj8ftGn93QD3KWqPDwh6swR2NSvJpBeVH
         Ml4WzO1VIVgYceaYXXqZtJQKBPTa1fssdiwFixrX3OZMW1WCEsunadk0WqQ0oW1Y+4yd
         0KVmVTu02GY3U/FzxoRhDppPZzpryMluSw0LcdYzeH2ewSlLbYFw8vmMCsouI5vkuWcI
         S8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739721543; x=1740326343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IFij8wrZ5Xes/0S/tgCYsJ2b9Mf6BOf6rIN/gEboWF8=;
        b=p5TTfSa/DQ+dz0PiiryEtcQFX6tVmRNkZ1K3Q9bD/m1q2L33IqUUm1ASOejmkh3s+J
         zlPHAOTeMNNPUOGiVTFsRhvBrgHp41VU797j5jdvubg9X42fGb/iWOWZcPO0a6wmAT5F
         0NKtAmJGgNYedMieapf14qpOU20k0AzS+SNi1qGR15bHXcf9eJkGEVZxk8ApBYlXSJDb
         h7EfFvmnw6+zJMICgHfuvM53SfAsXX3eoODcyPO+f18sn/TFrA/DqqSGtAG7IOxc5stb
         3MDnmNyYe0dP9qL1ZmVw7o96UhRhljVrzG6jdSj+VBtEYpBiRj63usTiPOkT9K0kk0FZ
         bgQg==
X-Forwarded-Encrypted: i=1; AJvYcCU4HeB3iRq1hdsFlwYDWI5vLg+ysj7hqx2z/D4OyU+ow6ZX//lSGsKu/gNlInC05PsCwi/gsETCyfBj@vger.kernel.org
X-Gm-Message-State: AOJu0YzTqIZEQ8GdhIOyh5OWNR4h/dEZNltdh9y+i9b4zwC62g9DuY0K
	m7C31J1oZ2BJj4gkeEy8tiHPZb1Sq/gpyIso1eMH+/h2HzB8OEolU3Mh8RYlnS1ywC+BN32+qN0
	OdaoLo/oC/tNdUbmYnIvtOE4Lysqv32fRz6hguQ==
X-Gm-Gg: ASbGncu6g3jsfTtSOioyGK62kULR6f0Nq/JuwsDr/rtVZtWnlDFIGpZAtmubir2DKRE
	IVwbIzeZsDxUl1z0mRmOFxYH0v3eG0B+X1vYwHUIUlgsihxUSqfepC9OOxRMKRPxEBmlRhSt9Hu
	496xSwemUSn2WPIP2HTVJLMVn4YAOg
X-Google-Smtp-Source: AGHT+IGkC2IfSMRmxOqx0hkkTAOYeoWJ9dmkM5Ek/609sutnODD8nSQFDs34oVKxa1WUcVLm90JlqRJalZhkW19J53U=
X-Received: by 2002:a05:6512:2256:b0:545:17b:3cf9 with SMTP id
 2adb3069b0e04-5452fe73c43mr2132281e87.48.1739721542943; Sun, 16 Feb 2025
 07:59:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203031213.399914-1-koichiro.den@canonical.com>
 <20250203031213.399914-10-koichiro.den@canonical.com> <CAMRc=Meb633zVgemPSeNtnm8oJmk=njcr2CQQbD5UJd=tBC5Zg@mail.gmail.com>
 <CAMuHMdU24x9pxEjBHTKxySxwr-L+iKXSUNFxpM9hvaSTNAWDuQ@mail.gmail.com> <5mffw5s3p5biu726cfn6hrgcxiamawxz4qna4jajww3evoievd@itffjdnhijxb>
In-Reply-To: <5mffw5s3p5biu726cfn6hrgcxiamawxz4qna4jajww3evoievd@itffjdnhijxb>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sun, 16 Feb 2025 16:58:51 +0100
X-Gm-Features: AWEUYZkeX-EqpZNtXHF3Zoer-gkZGD1U415wFl9eUuh4ihhKh0d-eUGnLs0Au6U
Message-ID: <CAMRc=MdjiyzBzdQpYK=qGwS=j55W5mujoTWruRP9DeOv11Y8rg@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] gpio: aggregator: cancel deferred probe for
 devices created via configfs
To: Koichiro Den <koichiro.den@canonical.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-gpio@vger.kernel.org, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 16, 2025 at 2:15=E2=80=AFPM Koichiro Den <koichiro.den@canonica=
l.com> wrote:
>
> >
> > On one hand, I agree that it would make some scenarios simpler, and
> > let us propagate an error code to the sysfs writer in case of failure.
> >
> > On the other hand, it would change user behavior. Currently people can
> > configure a GPIO aggregator, and load the driver module for the parent
> > gpiochip later, relying on deferred probing to bring up everything
> > when it is ready.
>
> Thank you both for your insights, Bartosz and Geert. I've just sent v3
> (https://lore.kernel.org/all/20250216125816.14430-1-koichiro.den@canonica=
l.com/)
> which retains the current behavior, to not suprise anyone now.
> I'm now considering whether we might eventually deprecate the sysfs
> interface in the future. Doing so could simplify the codebase and bring i=
t
> in line with gpio-sim and gpio-virtuser.
>

Heh, yeah you'd think so. You can watch my talk[1] on how easy it is
to remove sysfs interfaces. :)

Bartosz

[1] https://fosdem.org/2025/schedule/event/fosdem-2025-5288-the-status-of-r=
emoving-sys-class-gpio-and-the-global-gpio-numberspace-from-the-kernel/

