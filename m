Return-Path: <linux-gpio+bounces-13107-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE029D27CF
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2024 15:13:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A99FBB261B8
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2024 14:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C52E31CBEBF;
	Tue, 19 Nov 2024 14:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NAfgvx26"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEFA1798C
	for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2024 14:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732025003; cv=none; b=tbb5mp/QaHUy+DC6eH60xRkMX3D7OI2GOysTvF3p20BOJubBn2pC9+cOj5lK/G3qli/qcjEVQgSRW50WN6/8q8JzhX3MB4HhBoCZD7qVcqIg6DpjkCBPKloUV8psnMcFQSf4+Ocnjz4JnoDxKUVbzm5EuDFCuJo7msiPxEiLCA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732025003; c=relaxed/simple;
	bh=XDan2pMdxm1JcsYRxdwJ29E80Ni8T4tMTAZHfhiJ9es=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NbDENV7iROSb1xIUBBXRGnFKoi0gb/iFuEG/pluo/PRJSHYdKX7duTGnLoxU5k2NonNtYeWCYK1LIrIkl8qiMdfSsg9XeAs/uiZQc8fJw2OlN8PH0/p1hGPkgc4SE6/VGOWM+rZ0NWsRr5+TEmx03muuAi0Xrfy0bM07EXswXIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NAfgvx26; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539d9fffea1so929340e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2024 06:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1732025000; x=1732629800; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XDan2pMdxm1JcsYRxdwJ29E80Ni8T4tMTAZHfhiJ9es=;
        b=NAfgvx26V1LqcqO3kaexaBpNVrYUjIy/ZUmtMPndWv+DzGusU3b06aT1d0rTzeV4Sa
         1ql3O7yTNCjnWbsWcInSpgE7GzkVF3tBNMXyuAPmyPoFnl+wLSY8B6A9SptHOwBJQft/
         jJ2E1NEE5r4rbE5fGFvICxsGZ1+Ppt0hNm8fZpIP0buY7ZZIR3H+8pN/eaCuw56cEFTG
         dOcLc4RRnMdKoBcojkQczwRZAyGuCG5xhWodpu4IGZzK7SpAezzZx4+9gt6CCN//UN+w
         6aioTI30TXLszCw++5eCQHrhcDMxnLKD1+6pDjjCI1AcmoGCsoVmxG463aPAaE6n8Yfv
         RHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732025000; x=1732629800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XDan2pMdxm1JcsYRxdwJ29E80Ni8T4tMTAZHfhiJ9es=;
        b=WoG4uejPA7qfacgSXHYLmsVkOMYUdaRYPQZ+KLfnzqOtXnmUEt7cfi27D4HzpEilxg
         louoPKJvuhQv82IIaGb9G9dJTMAqIuSoE/za/PjkjUApWtK6fG7URV1HUblzg9VlyXuK
         ok+78OrGP5sfhG0YgcJ7SMjROE9n5UUw97clocWikfiFJCdzFT+FwIWtvLmHhNavJJ/3
         WTiLBZSpxMoqf6nymj5JFjOuVcqyRCqIYWZPv9ym4/+orqdAMRQ1PNh6xwxlGhUgBU2c
         FZdxaHQ8AFRdjkIB1qj2HO6a1Jwtw/AEuYL2P/euBex6m/eurWqZyEnMrSoojCFXpA7o
         xU3Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3WzSj38oBLG/Zj/11lmNLmaNVMgPmhyVOjoOPy7LVTLqzXS88lbidjiQbFMuYk5UGK6G5w0VfWus4@vger.kernel.org
X-Gm-Message-State: AOJu0YxFpZed1SEbeGRcQPPJGZpKr3u+Gg+YzRn53qneq+S6Krk+g0ZA
	FJ0WWhGZSdpzsEtr9v9f8lND61ilvRQ47ZYH6SvEDAFZLLTi8XqAHD8YDGkzB2gu45Doo54KNms
	7IzT+5TQkpFx5qpOtsUkifWsw5ySgY66M1k9Wo1DuFo4I+dSt
X-Google-Smtp-Source: AGHT+IG5wCW2DZ+DJlZVZZu1aIKijqV5FP5BC+Ce+pUzMX6/lpkeXtmFptFPAUm6W4+BNgUmIbntR4NIAeRtZOzdcYo=
X-Received: by 2002:a05:6512:2213:b0:53d:a860:d13 with SMTP id
 2adb3069b0e04-53dab257c62mr7058172e87.0.1732024999667; Tue, 19 Nov 2024
 06:03:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241114145116.2123714-1-vfazio@xes-inc.com> <CAMRc=Me9qD-VRr-JSXfFkE2O4xUhoKBSo5ug-nyw0b4wkQ7WrQ@mail.gmail.com>
 <CAOrEah5PHxr6HR2KBpV3BT1xM_eSdZWmeyUKA-bGswmk0G=JHg@mail.gmail.com>
In-Reply-To: <CAOrEah5PHxr6HR2KBpV3BT1xM_eSdZWmeyUKA-bGswmk0G=JHg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 19 Nov 2024 15:03:08 +0100
Message-ID: <CAMRc=Mf25FKYz7ARi8wPfXa=4oD7XuAAXieG0sWJjg5qJv6mVA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v2 00/23] bindings: python: conform to mypy and
 ruff linter recommendations
To: Vincent Fazio <vfazio@gmail.com>
Cc: Vincent Fazio <vfazio@xes-inc.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2024 at 2:57=E2=80=AFPM Vincent Fazio <vfazio@gmail.com> wr=
ote:
>
> On Tue, Nov 19, 2024 at 7:51=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> >
> > Thanks for your work, this really improves the bindings.
>
> My pleasure!
>
> >
> > On a related note: we still have some uses of deprecated distutils in
> > the code. Do you know how we should replace LooseVersion to not use it
> > anymore?
> >
>
> I can look into this. Should we create an issue in the GH repo to track t=
his?

Sure! I will apply this series shortly.

Bart

