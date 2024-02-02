Return-Path: <linux-gpio+bounces-2898-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 158DE847133
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Feb 2024 14:33:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 421811C26AF1
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Feb 2024 13:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 064EE46548;
	Fri,  2 Feb 2024 13:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ErlnoUYW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7885946535
	for <linux-gpio@vger.kernel.org>; Fri,  2 Feb 2024 13:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706880787; cv=none; b=PBZF6kjbcy+8RF3lXs0ZDzFzg9b/g9n4U6z+EvOjd620Xe5RXLFpdE7xXIyfrQBh8c5ZtpyTYwyJ559nMEMSF7XvFNTvNY+VQIm28d05BjbwRg0/TfUCbm2kPlxBK/Bp9yS8ygfmhuApMLKdizP0XfjjjSQvSPoCRr5mlYubtgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706880787; c=relaxed/simple;
	bh=t91s0mL/o0byDIL+UXIyCYRJ4C8dkVrkqJnTEQgrmH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SZ4krZnd8erWpu/Q5u0tM7Ri0Sd6Zm6vrxSaCpWwWM0l/U2mKFGIa0+7j7UH587D5H+tIMPLYpzOSG7gpHdnvN7I1N0GIcKvSBqAx1gK+JG7Qbtfo7rvzghbJqT8vpYuFYPCLp2lJ+dhCKntlf8/WcqR7kINYjXkTkLD2u+xEeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ErlnoUYW; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-7d2e15193bbso1034776241.0
        for <linux-gpio@vger.kernel.org>; Fri, 02 Feb 2024 05:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706880785; x=1707485585; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t91s0mL/o0byDIL+UXIyCYRJ4C8dkVrkqJnTEQgrmH8=;
        b=ErlnoUYWXYPVA79hDEROn4USe0cQFhU8zKicBGIviEE65yDnCKchPAwJqW6hl+lT2M
         Wlm8ulAvyhg46SZndgPubXzP1yQh4yzsetQj5KqMIywtRGvLJF7Jb753zJK6dZec9DNT
         IbJMRemBZkbzYUTmj8acPGXV0fe9mNFxBeUyNWwegotB4HwVhgMuWus0pIXe6Fx68F3n
         MqV6ShkkYnpHoiakgYWRGTFqaLxF25Se9EjS9M+M+3lGiIqKV3MEbsRYnAgIHI6Ko/nT
         ZcbubRvn9jWrUbCIVSK3+FoWX1EKMEi4MF8OfsHQd/LA+SQsb2A/kj30AKt+TLslfs49
         oYUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706880785; x=1707485585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t91s0mL/o0byDIL+UXIyCYRJ4C8dkVrkqJnTEQgrmH8=;
        b=V5jtOh5h8Cpb4LYApfER1pK+yDYBKX95yjER6Rkww1cZAaA6bHYP6idAe8vnTnmIFT
         k41k2mGoDmxpGOnHyXWKnVSC0yZG6y8kXwKwIdSz5z59gRChtTMNqjKUI4YuqwHM5XOB
         xXM4rv5NMDnhIsgypzJBuv0FP2AjYg/TlLjrHS0M19QV85O5PG6OvilISjRAZpGb/KGB
         K+ZSJAGoxVpbyP53lDyQRXNR3XUOnMk4uqGkgHejwiF01ZMmn87zN7jYy5Qm2DmJA/qX
         bXRYJSurEDVVe5Db4R0JSfSZc3hBsL+XD9aK0OXsNlEXopdOoRxYgkMmvOiu0kll7XWv
         1tqQ==
X-Gm-Message-State: AOJu0YxQhDsl3ph+Ra0K+mHjGR+38Xg/h97QuR8OZL8A3JEYcEij5jsI
	WbguGia81bUh/X5XkoZkT9CXMh/YenRLeco2ALNJAVirO2NejtzRKtRooQS27i1UPkJBmHu0t4U
	ixRPuv822o7IzDN4M9PaH4AsGIIJfEJpz6c8MKw==
X-Google-Smtp-Source: AGHT+IFGWRQkNHVpKRzENL6DBKR2SJ8NyE2HtNOW9n2HP7M7/CMGrLj/MqT1RHfg72HDMgBmriRlG2kdzZc3opEAJhY=
X-Received: by 2002:a05:6122:4599:b0:4c0:1037:eade with SMTP id
 de25-20020a056122459900b004c01037eademr1050005vkb.15.1706880785225; Fri, 02
 Feb 2024 05:33:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240124205900.14791-1-martin@kaiser.cx> <20240124205900.14791-2-martin@kaiser.cx>
In-Reply-To: <20240124205900.14791-2-martin@kaiser.cx>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 2 Feb 2024 14:32:54 +0100
Message-ID: <CAMRc=MdZQ+TGQTAQLGqeT0DidgVUxSTTkXHwNwiat-ADahjwSw@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] gpio: vf610: allow disabling the vf610 driver
To: Martin Kaiser <martin@kaiser.cx>
Cc: Shawn Guo <shawnguo@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Peng Fan <peng.fan@nxp.com>, Andrew Lunn <andrew@lunn.ch>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 9:59=E2=80=AFPM Martin Kaiser <martin@kaiser.cx> wr=
ote:
>
> The vf610 gpio driver is enabled by default for all i.MX machines,
> without any option to disable it in a board-specific config file.
>
> Most i.MX chipsets have no hardware for this driver. Change the default
> to enable GPIO_VF610 for SOC_VF610 and disable it otherwise.
>
> Add a text description after the bool type, this makes the driver
> selectable by make config etc.
>
> Fixes: 30a35c07d9e9 ("gpio: vf610: drop the SOC_VF610 dependency for GPIO=
_VF610")
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---

Applied, thanks!

Bart

