Return-Path: <linux-gpio+bounces-18921-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 640C1A8B3F7
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 10:35:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7A8A1895DE3
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 08:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1407A22F14C;
	Wed, 16 Apr 2025 08:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rbi00JcH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE381D8E10
	for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 08:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744792522; cv=none; b=mWNyLlmC0Th41b8SLkrQr7JeatghXzboB6fwFlqRwVI3pVYdL5NX/FS7kA671sYmtq+NTsV3VZ/Df3DTeHnelFofhnROpPYWn/navucoh16C+kGYkDW324lVz3z2gA9yJahIT9AooFcC1JVWlLUP8A2e75k41hgHxpOX15nv+dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744792522; c=relaxed/simple;
	bh=U/aqoPDk4qPcIGtIJdWVdsmpBx0xCpuPY/P1kNqi40U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vnys56VqyjDZXK/7xLshDt9R4Wmh1YO3VkmH496zIa1WPQD0nwIIozoDIFgVjVA3JYF0cplfglbxh6mJgdxCxMCnuSI5aJVEQEEVZ7JVuBW1yWwOvYnCPw55Zy+XMaLHCUjQo/U5sx/W8r9wNrNDEU6gjz4/nH3lYnNcBz58P+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rbi00JcH; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30bfc79ad97so5268411fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 01:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744792519; x=1745397319; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/aqoPDk4qPcIGtIJdWVdsmpBx0xCpuPY/P1kNqi40U=;
        b=Rbi00JcHKOXvw5OCBFZjml4lzlCEk8uL5ZQEgLAypzBrxipnS3TX+WdMXAflSnSiNu
         Zmd0Bao9/1kLmF+oqBuXv4TMdsT5uOYR3/sQ8ZJ6Q3i8iJap7ix/d/GYcYOmuo0sM7l3
         Vwhyjn5DjmCXs27Menx+RWYwIYF3D0Oj5LFd6fZ2s9yI3Gfr+OdOmGwKFvOldKcVA6qv
         IyXJN8+Rv1TCGWQ4QMtnS8HUcWhNnA4SqkmxRWElhKD90lgT/QOnKhD9OzPdITUdBSXD
         3OSXpe5j2u2zCp5HOwJtNoObbfS6rBAx2uww6SKOGwGZ7QyaXBpTpDJ0Vw9dd6pqOQt8
         yoYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744792519; x=1745397319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/aqoPDk4qPcIGtIJdWVdsmpBx0xCpuPY/P1kNqi40U=;
        b=U6PPhFbw+VgEPtwyLq9n7kVzfRHcn+v9RTCGeyXAtMO0D7xDJ9twmfsRNFXThIWs/Q
         dUj3T8Mp04bNy7QL7S6qaT3w3qdrlQPf79uCY5bMQCWf7M5+wj7UKaEdGXFX43zEbFrz
         oIFRW5vGoXJsO+l8ZIctfc8OkhRhnZYPeLo/XkJH3sFbwnW0N3tfs2C7cOQof1FXiusl
         SJ5Cq7gz7Sj0zViMMQJ8/z7e0JUln092Mgtut7/pO2M4yENId+f6VZYroHJZfPNL9u4w
         goEEdIQDT0/5sq3tTg51XwnDhzRAU5Iw6ysU6GOkO9S8jeVPexk9/CXUdJ3aYUiAZkTe
         Qf6A==
X-Forwarded-Encrypted: i=1; AJvYcCUihqO27ddiVJRgC0Lf7IB9K/fFZALBwPWm0YN0Bs0kZYZWxufISYecj5kcoiran0xUZCIr9NWIQNWp@vger.kernel.org
X-Gm-Message-State: AOJu0YwAuAiAW67MeoHaZwkDgK6+hLRV/ipR3EaiFW0qH0MOdpyeg6ej
	unquNc/dBG0tU5cDdFnS5wv+ON8IwZqdStnfg3aDT03F/wj0uKOoMeRfE0MvglwtdYja8e5aEYC
	VwO9P1vrPhGm4v8+qcZB2fsFYAk0vXy3fh+010lNsFETApEf4
X-Gm-Gg: ASbGncsaTmX0VlfXwVHvtAtJp+XF17V/GYpUtzN9+R/GsGmB7KuH205GxBIGSCv8KVK
	wFKy9elD1XENlvIEQhv+4LLvpiDaEc4Y5BTN875vyySwz4w4uRKfbeT31VBcs+6FuuEQzqTrSLv
	j3Pn30FGKQvF4TVk/b0x7Cmg==
X-Google-Smtp-Source: AGHT+IEk01/SrahZkX/WwPGiS0BGB/c9p/43YKQ+5wZUlyCgsVLcawfd7xSjA1Eg9Ofa6Sx5qYOZluvwYSJlMTRuqyY=
X-Received: by 2002:a2e:9e0f:0:b0:30c:799:8418 with SMTP id
 38308e7fff4ca-3107f69607cmr2192731fa.4.1744792518989; Wed, 16 Apr 2025
 01:35:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412193153.49138-1-chenyuan0y@gmail.com> <D9694O0MKV31.3SY6ZCTSKXWI9@bootlin.com>
 <CALGdzurLWayryjUEdSy4iuHAgFO=RA=HN=u+BZY96JqESKvi+A@mail.gmail.com>
In-Reply-To: <CALGdzurLWayryjUEdSy4iuHAgFO=RA=HN=u+BZY96JqESKvi+A@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 10:35:06 +0200
X-Gm-Features: ATxdqUHN29Cyzw5aGGyEp2xHZ9Bkh3-8G0lN_prliWzQGyvEc34B3QIRU94x59o
Message-ID: <CACRpkdZqyTphs0k6k2tOXwYzT_K=Jbt7h1CZX1Rh-2LDjWhxcQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: nomadik: Add check for clk_enable()
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, brgl@bgdev.pl, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 2:11=E2=80=AFPM Chenyuan Yang <chenyuan0y@gmail.com=
> wrote:
> On Mon, Apr 14, 2025 at 4:24=E2=80=AFAM Th=C3=A9o Lebrun <theo.lebrun@boo=
tlin.com> wrote:

> > Seeing the __irq_startup() code, my proposal would be to turn the retur=
n
> > value to a signed int, but I haven't exhaustively checked codepaths.
>
> Good catch! I agree that using a signed int could be a better option.
>
> Dear Linus and Bartosz, could you please share your thoughts? If
> you=E2=80=99re on board with the change, I=E2=80=99ll go ahead and send a=
 new patch.

Yeah that would be great, thanks!

Thanks for noticing this as well Theo, I think your team is the
most important user of this code right now.

Yours,
Linus Walleij

