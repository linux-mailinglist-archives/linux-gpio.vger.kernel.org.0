Return-Path: <linux-gpio+bounces-27369-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B28BF6712
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 14:27:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B3013BD979
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 12:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0CC432D447;
	Tue, 21 Oct 2025 12:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="POOJgygX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD3232BF20
	for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 12:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761049300; cv=none; b=DPbtAz4VUY70WG06EP5gQ4/tFwuUTjo+uJ1vDovBcgQZT1HZk37nBLIZTwxqASPNSCgVk7E4LKoPfDvxQrFNQpUxzQm3refMcPF+SNR2j2WQPaTuvbYwquLvmepeYOxs7KsjqIDNujAg5NFhgMDeHcu3TZYvu4b6+SlSc4k9Bc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761049300; c=relaxed/simple;
	bh=p8PoWDUe38GeATBcrEhBoKdXkmWRLxhum7J2BWfx+1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AwbzRySaza0wkMnOEob/ea9w40gkWQs6ovxsJhRGyriJqfIjnI1NU1YSuc1LmAF2EuC4wTouaKxwLJi2PHV+Tnr1k1x1TxL+FgcxewqOcovOO2T8rcGOsFJ1oA0IM65PaaDvuGYMwoFpVbgx8QhlZMXTdaOkpohB69sTiK/5uws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=POOJgygX; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-591ebf841ddso731360e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 05:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761049295; x=1761654095; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8PoWDUe38GeATBcrEhBoKdXkmWRLxhum7J2BWfx+1A=;
        b=POOJgygX1NCgRgBFU0H9mADFXmU/uqRgGTalPpj36SiG8iUOzbyvU7xegmcWzCzSxN
         /sv9xc5TLlaoTCNMX7XhOi6mQad/VfvA7mEw4YinsKWhVJbCQnYaVyOvLY4hdeMA0hex
         1+iIbbGxistsgN6KGktwm/DPJ0kxE+id7BiRSx4CR00b2r4lTESZ2y2/d1LDScJ/B9yy
         XsMAydr7Rg8VG9bbwQS7lYMFYhvQUBLrqkS36vadgeVHMMgp3C0A1rrrV+jgBXtC2iGq
         fYj9Z5nwACemhoQuDSvttiwPwN7SHWnsCTygiaTxsBE8sW0ayMxOt5vArTkUX7LYS/fM
         mdHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761049295; x=1761654095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p8PoWDUe38GeATBcrEhBoKdXkmWRLxhum7J2BWfx+1A=;
        b=SQ2ZW4iU5lgw+1/6Xza3I6ClUURH/W8WrftE4ib/+KDhoe/GkN5r0bBxA5RsjgRsr+
         y/ZL6tgDsRqNkkTk3CXYIErR0+e8N2OjRcwz83FvEPvKCeYwyThlrXKFoq4aVZRkUV52
         IKLEcQmgVslUZv7xMSD4PtBXXVfbG14N7eSf16J4LbWGA4/WKK9yxIRWeannC6Jdc8wP
         d41rinrWEW00ofuB4EhNWxeMTGfOxuFc2yhuxELof1vXGaSC2gqNtNp8ippVRVbVZFjx
         2oyqYZcuaIm1ycCAa+PYSky5iJxZo47SCon845xb417BmuDnQkYR20jyO5GeFaFv5HXh
         F5Gw==
X-Forwarded-Encrypted: i=1; AJvYcCUJ4Y1hyi+qC4pT3h+uieWYoWm2JH+07c9Q01loud+HW7YXh6KB/L0QWKd3bbkvTWPZfUJiRvBxe1X+@vger.kernel.org
X-Gm-Message-State: AOJu0YzPyosCd/rrAtkm14K15irzYDuErs6JOez4c/8Rt5/a6LutUF7m
	hYZEultSmPJ4O2yU0FMI6MhrBxDb+O+RWam1tfYlvJBvqWpvV4lb3mMim0Y+KjIOhbK/kvt4NGW
	BUGTM4rWqIm6GALZOqzkf5VBE9gIWVQ1WbWiNlBSqog==
X-Gm-Gg: ASbGnctGwcfZmNTHhbOLVX352CZ8/6CYMaLWN/gZFc4rFzn3z5kDMrOemc7+il3293v
	d8ULimoPGrorI6pZGvs5u9ETM0vfuFMOTOLZvF1MdnALbigCee6fe29s8oMrRWCxFDDTHKS4AqL
	cfSd1C4qZwnf4skksPZzTIdI7fgDVMKKFjbHgGQzgmxwgNFTlb94/n0M8fGIsBWUDBreL0dX686
	Vcv4ES8ybsFDHmqmOPLmUuaP9GJZimY7u7YjvXvq/UQTfCJ2L0EHboMCHY8BSNNWBNMxemHIYq4
	qwYaLvLZ2g2obQMq
X-Google-Smtp-Source: AGHT+IHv4TglYoME9k8y+Cf9kIURaChu7OTeBga17eJoWa/HSDvZHHqbfu/wH9BS05ZJ93heiZHjDByHwbia9lKViz4=
X-Received: by 2002:a05:6512:131f:b0:58b:151:bc0f with SMTP id
 2adb3069b0e04-591d85aa254mr5050304e87.54.1761049294940; Tue, 21 Oct 2025
 05:21:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251020115636.55417-1-sander@svanheule.net> <20251020115636.55417-3-sander@svanheule.net>
 <CACRpkdaqXzogkbcnR3uaDeGFcVtwmUq5DbETSqzjVQECJROF7g@mail.gmail.com> <77ae9012af0565fe64e585043541081e48627566.camel@svanheule.net>
In-Reply-To: <77ae9012af0565fe64e585043541081e48627566.camel@svanheule.net>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 21 Oct 2025 14:21:22 +0200
X-Gm-Features: AS18NWDHq2YSNmXMDRZ-1n819DAV0BzEWNWF__ppzibzJcFlIacaLF28QFfPKf4
Message-ID: <CAMRc=MdzjKfhc5vwQVVg=VwCNJ8iMaH5RY3ky1uh_Kxo9gdv=A@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] gpio: regmap: Bypass cache for aliased outputs
To: Sander Vanheule <sander@svanheule.net>
Cc: Linus Walleij <linus.walleij@linaro.org>, Michael Walle <mwalle@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 11:01=E2=80=AFAM Sander Vanheule <sander@svanheule.=
net> wrote:
>
> Thanks for the reviews, I'll prepare the full respin for the RTL8231 patc=
hes and
> send them later today or tomorrow.

I take it, you'll include these patches in that series?

Bart

