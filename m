Return-Path: <linux-gpio+bounces-7089-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C528FA510
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 23:58:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F50B1C20E23
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 21:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE34613C827;
	Mon,  3 Jun 2024 21:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aiil5IpI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54D612E1FF
	for <linux-gpio@vger.kernel.org>; Mon,  3 Jun 2024 21:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717451923; cv=none; b=CFrwF07jc7q3NZk2EFZBHeEr8Ueh/8wDDaWIBnsOu+VtPTxchV0dOZHrpXlugp2Ki8V0muTXt7E00J0+hFYnHIE1ksLdcOTFSyrgZGVQ/yX5J+uz4sWPZS2v121eW6dtFjRteY3CSu/40xNcCDU3d7bN94dhBKEMrqCtuBgfM+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717451923; c=relaxed/simple;
	bh=wN4/WFcqfAe5c9eAQkw7+lyUpzRnR6hK12SvuT5DsQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fXTsfwVR8k30wQEBu2778WaF9j95Lm5G8wJNIEPX1GnBLYMmZgjCawv1+Fc5HVN1Xm6a2oP2cRFDDUsnhrqoXCyoTPmvrxALVhopwV0KEGCMAaL3Tic4W6KHZKVxhJJNoR08rp1DTodo7FMFohFNNPHXz5VVlXOd1OnZyf2jp7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aiil5IpI; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2e73441edf7so53409781fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2024 14:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717451919; x=1718056719; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JNRpufp1GdPfpkj//wG2tsrExygVRim0BWrgMX4dCYU=;
        b=aiil5IpIDOrtEu2OOJNkm4+9GNOBy0YzCj8b8rl5unuaBhbq2UsvwwvZIq7826Y4XF
         q49KR4GUOwKAiMeowTvXUvEoODTI/MrEpLIklUn0H+yCGNb7B64W76IL1tK082/ibrQT
         SmArIBa3NViPKI2X2vZJ0dWVVaDwEySFTOfTcY0urPK34DAMDOxbwbdZZ+SZdmHlS+Dn
         Wt6HSdlFxqFJoCduzkVrhbmvwpJHVB3Pv3JPuM7wk2XD6btLOwf1gDEmub6PwCpEJcnn
         +Hv+vdqAzwRHpOmYtqW2U1CXKE/Ok/NxyO/qu9QtQTvpA4eJANrs8WE5gn7AQwjxsNB9
         0xeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717451919; x=1718056719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JNRpufp1GdPfpkj//wG2tsrExygVRim0BWrgMX4dCYU=;
        b=YL02NHND4vKQOlP7D3g+OHSiHNyk/Cucc7z4ZuiupCrF1LpQlfPiPppnVFfMXFASsz
         sxhUwbWb8l2bNKnd3Ms0gEUBl8tzBpyTZinhpq5nxDinZgQURU6STRpliJV/yzNbm01W
         FA/PrAY9EDwQdQ3Yo7JW3un8O5YKuB0KirmXrTbervRKi3WZIrYJb+671Oo9n/ZEOv0t
         0pfrQewUdw29x+DRVMf4XTCpnUiIKivjRKt4FQnEs2a3214oMgIwlImdd3Fr610dN2T8
         iPpuGOAkdL1PLJKYHNcfc5I2n+Ki6n6Rysmwum85D6vqFyTOqU2APLjbrBOgqRn5md/8
         NxFA==
X-Gm-Message-State: AOJu0YxqO3tW4BJ4a3tRRoInSRVGIt/Oo8fkFoslOJQj1Tox0tsKTqsy
	158M8RKeendWoR02ccjf0OA+3nlMdS2KtWyVQx3yBiQssqXnWRKBpsZ88BtmUs9UdJfVxLvWnU/
	lglzl6pQJfZD1YW/XOMnUyjiZRLzazgFQjRMk8Upox7aT8az01e8=
X-Google-Smtp-Source: AGHT+IEwezwI+tCkg8w1+8oR19Y3NC5bC9ftWzVF4mS0Qz28LE1PFLM3HZhbKd3pRtQ7vvGLHJ2n10uLYgbQ+xgQPDA=
X-Received: by 2002:a05:651c:1502:b0:2ea:b44c:c47c with SMTP id
 38308e7fff4ca-2eab44cd30fmr20093811fa.46.1717451918871; Mon, 03 Jun 2024
 14:58:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1717403902.git.geert+renesas@glider.be>
In-Reply-To: <cover.1717403902.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 3 Jun 2024 23:58:27 +0200
Message-ID: <CACRpkdahageYBWPw3N3vWOMMFnggkD-9wT5NJQPBxg9oABTXgg@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Fixes for v6.10
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 3, 2024 at 10:39=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfab=
d0:
>
>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-fixes-for-v6.10-tag1
>
> for you to fetch changes up to a39741d38c048a48ae0d65226d9548005a088f5f:
>
>   pinctrl: renesas: rzg2l: Use spin_{lock,unlock}_irq{save,restore} (2024=
-05-27 17:13:31 +0200)

Pulled in for fixes, thanks!

Yours,
Linus Walleij

