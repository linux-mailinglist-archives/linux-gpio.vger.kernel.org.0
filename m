Return-Path: <linux-gpio+bounces-8578-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E2B94770A
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2024 10:19:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 263D51C20F26
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2024 08:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C25AB14B970;
	Mon,  5 Aug 2024 08:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n+CiZ/wq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9A6143738
	for <linux-gpio@vger.kernel.org>; Mon,  5 Aug 2024 08:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722845952; cv=none; b=mFVhA8v17XIvxoqJ0WfQkofzNCcQxW2zIoCLaJE5MvkNREbSj9HmLVltgT9QRq/M4EdndM1sdMguJMcYK4wIhwXPWy1c2UStcSYBVdGfRJDQPXIDd6q9qjmR6yG9/CTVt+04t9/sSh9XGeASFg0vGmGYm3claJxRvX0pkA4jeSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722845952; c=relaxed/simple;
	bh=pM0IMTiOTKe5KCUqezcHg0ntyN8IcDTCQQUuwjFwbIA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mSjkNaDdU3kDJ+zNgANA3CVBeghX3Dqf1M/LuonXQJjqzD2vm93EVfQ5IYysx2ndCbxFLGpGx1C/AP/WG18lsJmazvsF9xhIcRgDs+qM4vBqG9Wfsg4r4wcxYknSTirZbMsRuSj0/H+MYb9bVtw0L/SkOrRYokkq97LUNU9ypbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n+CiZ/wq; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52f01b8738dso9709790e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2024 01:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722845949; x=1723450749; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pM0IMTiOTKe5KCUqezcHg0ntyN8IcDTCQQUuwjFwbIA=;
        b=n+CiZ/wqASAnWAExU3JKOj9nU8WRxHACyMbNr0RlZ1mpg/1EH5MpEHBliEKKL+2Tsh
         viv70f/IDsHjUeTZxSogb/gYf9JTIurAsnhySCkenjDaJR1Z73+LSWkcAo2NTOyq0ZEp
         eqStYc6FqaoaCP4jjcTb1CxJit1tVoC1ByG6XPvu9mN8F3inip0vq0iBW+HLS6CPzeLp
         mwnBoEpcw/aLklVlNAqOD2UYdekzBT6uFlV0Z3AQvYKiNJ0V62zUv4Sq+JLrkrBws7Nd
         66xOeAOs7sR6BM49usIu6fpLWb4vxnDwtkWnLSa2NyNa5q9ptCSlT1OcsWxdlvXbMk3S
         Uy8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722845949; x=1723450749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pM0IMTiOTKe5KCUqezcHg0ntyN8IcDTCQQUuwjFwbIA=;
        b=Mqy76xujGYFJRmX7FqynuxAhmFG6hGQF9gauqpKiF8HlPhqLftZ4GwglAVWqc68Qil
         Bsm2tL5F4bEPmTLmdfB9FvuXlcnFZozEMV4Ve4VRhf2tEbFMtpiY93cL5B4n3sF2rSRQ
         c5vkJA0YN6qGSLHcoeR1h2hALfvxnGzBSXYZmph76JwCSWWqmIKjeVnq3RWMMzVqIYw0
         77ImqpVksC/xoCMkPfZZat2SkR4zxx6jjlM/Po5WX5jur9muzFqQF5R/Hwjzy7LCiMxL
         3F7EEW4iufafK8FoTw45L64vdS/U+zg3rOa4kfvGGWH2SFtdNZ3JhgikpP1Puba6fY4k
         ySmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXODGSkS2ySPyI+5X3zvRX5n3EeXfqCeuCtGeEMLTjhlTbMz48J3n8/0B/2q/T1i6RBndOFU5MZHWXfOLtiZQv1CULWCk0W1b78gA==
X-Gm-Message-State: AOJu0Yy8ePz9qBFSaosUgt9eMvK9LGdv8VMmHjkGpufYpveJ/fHJgBzj
	IT7YMcH7Ys254ahYuBeh3Dcf84PjQwRPX1MywzvFv/ERasvUdCQCbEf6KKjBramOOEsb21cvaPl
	m+O3+5TRae537t/8vMTDQT0rvMFCmRoACJyCEWw==
X-Google-Smtp-Source: AGHT+IHyDztPOvwT5bwlrkJ7L/ic8s27xLixHmZL/+ssWK7Ut4H/UydlxUp+ffYzZozG5sm3azq0OdViRA0Jh4juETg=
X-Received: by 2002:a05:6512:a8d:b0:52e:a68a:6076 with SMTP id
 2adb3069b0e04-530bb3b42d7mr7236285e87.49.1722845948838; Mon, 05 Aug 2024
 01:19:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240723131832.1171036-1-andrei.stefanescu@oss.nxp.com>
In-Reply-To: <20240723131832.1171036-1-andrei.stefanescu@oss.nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Aug 2024 10:18:58 +0200
Message-ID: <CACRpkdbLZPZpnLAV005Xwuf0isbgmXgwszHgYKgh0ewroh+7Gg@mail.gmail.com>
Subject: Re: [PATCH 0/3] add small improvements to the S32G pinctrl driver
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Chester Lin <chester62515@gmail.com>, 
	Matthias Brugger <mbrugger@suse.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 23, 2024 at 3:20=E2=80=AFPM Andrei Stefanescu
<andrei.stefanescu@oss.nxp.com> wrote:

> This patch series adds various small improvements to the pinctrl
> driver used by S32G SoCs. These can also be found in the
> downstream kernel version [1].
>
> [1] - https://github.com/nxp-auto-linux/linux

Patches applied!

Yours,
Linus Walleij

