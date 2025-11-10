Return-Path: <linux-gpio+bounces-28329-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EB4C49938
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 23:32:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5B1DF4F5770
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 22:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 104CF339B58;
	Mon, 10 Nov 2025 22:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NGE+TXPc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CE22F83BE
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 22:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762813507; cv=none; b=Pbi5liO/Xtr514j6VVsPLioij7Rl/PhUX5hWcFVB/QRmkUeTm/nBne1JrtNLAzOKcSEmP/UuKkzLWFrP2Bf9CA0CMljiZjnVPIdadGTEOPG99DQSMrWaRWXF7idzfsXb7FNrkT6/LGSWn88b4h79CS/jYBwCgg+V38HpuCbxZag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762813507; c=relaxed/simple;
	bh=lbYOlnC3WJYLBwDfb+oYRZV/rKekA5V2jSftip3URFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mUbuuhCTkSnBvK2Ur/miLbxlnPpb+8FDwAdLKIzq++43kZFdsgqXt0vvze1/5mBVKGJywf796NFA1XNuLjlk1HyFFUiKATdyF99AWEvDGqus5DFM0kRIeBx/wOg6x+GN3GFOdFLRV7OCuCOdGFkvDQb6Hf/5+2qhLr7kOExRtJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NGE+TXPc; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-592f7e50da2so344942e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 14:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762813504; x=1763418304; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tkykz3S1CyycQbNzf0lzIqKhpFUnZB571m9tUf64HTs=;
        b=NGE+TXPct30zyW7TAFUMXCRFW+JBU/5Nyd1usdotgrc/8g+kkFwv2wiOsh2VzadjtC
         IDDhl69dnhFVPXphMxO6/Tat1Rj4WeqmvZeGSI/uf7G+hC1+rvp2RxzupvSVwLpnUXvr
         xvqKv0ESYra6Unt5AzLLFRP7NHM/jJ49ko7VJSvn7x0+fONODNhOuxz8W57JpVLfxCpA
         CdPukyJyGqqDzyjowjqJG5d8Sk5wIN7RmVi/6nxBrHkbHd1wnWMEQG8EVrEZaJFAvW5U
         MrC2T4tVAoqU8DPGJqtaJ3O8NWIIJ0p8E91j6Unn8vLNRBWtrVQ5GZOfk6kEbDvKAUx/
         nQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762813504; x=1763418304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tkykz3S1CyycQbNzf0lzIqKhpFUnZB571m9tUf64HTs=;
        b=rBxTJ366ay8nl7juOS8M2mkIIFgdfUSyQNYiVVcATdH2aKS+L2+AwthZdZ7PaAVfcS
         SEh67iBQtuXFgrgNnULeea2oODcjZr8uh2qSAoEoD5d/P97Fi9P4pAjkmF+vmHvTvmSd
         8CjXDsQhuZpBypM2oqe+F/BWsphBYINNfj4cJhrr7EhH8vgJbSBILSERGyEaTTpJ6PE4
         6ysl/Mz4SI2x8mE+A7c1KnzMX8YNPnDiMgRonX7ZJafGojoypQygl1do8GGBkz4sc94f
         XBflaEzC75DPhaIm4P1BsZy0vRz19L23TELj5qbinVSdW1XNSZbtMGG7JQ0PphkPaPnG
         uGXw==
X-Forwarded-Encrypted: i=1; AJvYcCXKbrFto+rlpZcXelZNnfJWm4xsXcDfpdomC2XMNatWCLAeDb/Yy8X2ekhDll+oUm1QT3m+LVgVEd6M@vger.kernel.org
X-Gm-Message-State: AOJu0YypZL/yhewCM6eisMU/JA0/uUnylolY4l1t+OTNCYJgmljntCZT
	D/DWNKgEK8UbApErPvAkjSFwVP1zYTeODOnSpIcMvVhnnnZSGpXVAvm2KEMPV8DpJ2pY0YyJpMO
	rEfHNbJ7/9xqLEkv2tTHtn2mhVRtJGkXAEsvwAxqxww==
X-Gm-Gg: ASbGncuF0sL+n+NeCOf6Z+ujqu4KMNTgNwIcCxLOp6IpqE54SqntbatqIyXSjX/BTvf
	rhxra24fg23PHmKa4Dsz9T1bC5Grbus25pR921eE/GAnZVksJiv+PoTa8WPRrhCRzp9VY8QSdlj
	rSjr0mV8VqYiK3sFxxnGB0jPAickMjVV6NcIXWqY9m4rcR4Yqnqm4QdL7qrIhkaCls3u6R4XDS3
	BELkkjLRaxr8s1iLkADHq1u00Mz+32UkgoO6+v/PLJH4QKaBG/CuUUQBZHv
X-Google-Smtp-Source: AGHT+IH/bobBHFWFdtH9zZZK7pDa53PdeYG6iIiYCN8HDJy4OkCpiUpXjuiD4ZHFmsvNrZImVkrpEn3cIhnyZOsajDU=
X-Received: by 2002:a05:6512:3408:b0:594:2c42:abd4 with SMTP id
 2adb3069b0e04-594745a4d40mr256456e87.5.1762813504005; Mon, 10 Nov 2025
 14:25:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251104021223.2375116-1-ye.zhang@rock-chips.com>
In-Reply-To: <20251104021223.2375116-1-ye.zhang@rock-chips.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 10 Nov 2025 23:24:52 +0100
X-Gm-Features: AWmQ_bnqL4tp4-XtSfjpF2SJDcbcu-l1tzSoL6TKzmSJf79bXaH7H2zLWLM2NeI
Message-ID: <CACRpkdaR=_K-hewNne2fPN=RKu7iyOe0gLYhMEBfQVvemJJuoQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] pinctrl: rockchip: Add RK3506 pinctrl support
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tao.huang@rock-chips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 4, 2025 at 3:12=E2=80=AFAM Ye Zhang <ye.zhang@rock-chips.com> w=
rote:

> This series adds pinctrl support for the Rockchip RK3506 SoC.
>
> The series includes:
> - RK3506 pinctrl driver implementation
> - RMIO (Rockchip Matrix I/O) support for RK3506
>
> Ye Zhang (3):
>   dt-bindings: pinctrl: Add rk3506 pinctrl support
>   pinctrl: rockchip: Add rk3506 pinctrl support

Since we have consensus on these two patches I applied them!

>   pinctrl: rockchip: add rk3506 rmio support

Now you only need to discuss this with Heiko and iterate it.

Yours,
Linus Walleij

