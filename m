Return-Path: <linux-gpio+bounces-13963-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E869F4D19
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 15:07:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0C70188988C
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 14:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD6481F4274;
	Tue, 17 Dec 2024 14:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H1903JU5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAB81DFE00
	for <linux-gpio@vger.kernel.org>; Tue, 17 Dec 2024 14:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734444435; cv=none; b=nX7WuW8cpbHm/34Az49BLa/3lbeKfDBrZ0Bm8FogTsIw+Bl3ZGEzGNOtKj8mW2tVCgI2jYxbcZ+9CAoDDOXP0clSnsBrQBgmhLsNgLXmftV4x5Vsw61V5e0HD1EorzfzN7EcuwOHEkd6VFrVa36pgV5FWlSQkZc7udr7XyebL9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734444435; c=relaxed/simple;
	bh=AJ8xar4h5rk9ad9pw56nXrCo7RziMoyia/Xag/oqRJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u2rTQm1tjAEBaMvpfq/PjTuCfhWsRf06MihyudJRycvLwcQ202C1RiYuvVleWShgLe8uprjv9d6OhyyDlo+nzPLDtLfe93UyodaTdsJ+faXnUpNTjm8XOMglC1/lyDk94onVUW6I2AZJnVWAXdqkAqqbkVqqp0zwBcONcA2rIfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H1903JU5; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54026562221so5465650e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Dec 2024 06:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734444432; x=1735049232; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJ8xar4h5rk9ad9pw56nXrCo7RziMoyia/Xag/oqRJk=;
        b=H1903JU5jwSaiweql2YtxIOekIkzQKMHzqMlwcXyBZ8+HjDu2PTLBNIQdEcKBFJwGs
         l9hGcxrWsaJZFi+V0Jf57LxIgPJ0lYKuqRZrQ4nF4cTyWEvjMlEnPJt5+d07hNpuPwsK
         gtpi51FvdeLrsv8CfweMlblGnBuex+NMej5YsA5gOr4Ey0Te94MmSmQxxLaHHVpCWK0k
         UnNgcwHFCL1Q4zn05+GYWBR2FQMzDHz4aRfq6k5hkB2Dbs+90lH63Jc4bGkEp+QTvylB
         bLTjVakuJJwOiViWNbgsbexIeGQtW41B/txXhmmaImpBEj5Ev9qYx5YGxt2hJDiRPrjd
         76Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734444432; x=1735049232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJ8xar4h5rk9ad9pw56nXrCo7RziMoyia/Xag/oqRJk=;
        b=DlOlIVwH1Wp22mYK97Ibvil3Eg9u4pUsZLQXQKI8bm2yZjA3W17Hx54fLwlRAxUtwp
         klV88wnjWVp0/lBoy45FF7kligIC3s5c2N6blkWDjTmfApcrNv/5WcypLSy/1gGY/1aN
         AszX5T55u2chO3zSRK/kWn+ZGYyBzXwcpOzXY+roATZG1iLNzrx//8LoQScSSg+tfpU+
         9wOZMq7D/xM/AbsaAGD1z1FAgF8LP66NCQ1/J2PWcIg0wQnAoZ38hZ1jMIg517GnGmM7
         FLr8YqReUUFDmPuWlcFtl/byGBKpsxWCq+DTkaBIZE2E5++O1CjbCVC/ggMAJU0rBB6b
         8qBA==
X-Forwarded-Encrypted: i=1; AJvYcCUdsLY1FNOecHU+F5yXBRgOtZftKOct4ZwaiONS+Q2cS3J5WKodYTMaHhwwRwySSANV5G3n9famAp00@vger.kernel.org
X-Gm-Message-State: AOJu0YwoqKI2Mrq2WCZXMy1ibHQqvnvRUA6V+nWDNzlPZOEtCcBNcEbz
	zI0NnAitNYWy95Zc24u06a+nOgZckYm5MQnjNB9Lh7neo/HoAV0EjZUpCWFFYYJwSmTaarCmqj+
	EccUruZTe6ifMD9XZtm1XNPQMPyRAdglgCNwS+A==
X-Gm-Gg: ASbGnct/Niq7SeaylXCY1XQFcPlsZ79LdadKL8vETlGQhKpHkgSlfpyidIBpcGQmZPq
	0ZQuJ90m/q2+sOl21b9SeQuCoIEfGIh36tmVwoQ==
X-Google-Smtp-Source: AGHT+IHZjPHjo4Swh+bqa4UnyeL5dWjKS+tvSH7lJWm3TCu3xkZDTEkEtpQJJwyqbndJ5XwyTn9A1top8YhlHpFm1kc=
X-Received: by 2002:a05:6512:124c:b0:540:2311:28c5 with SMTP id
 2adb3069b0e04-54099b72020mr5875156e87.57.1734444431628; Tue, 17 Dec 2024
 06:07:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206221618.3453159-1-zmw12306@gmail.com>
In-Reply-To: <20241206221618.3453159-1-zmw12306@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 17 Dec 2024 15:07:00 +0100
Message-ID: <CACRpkdZrkt7R+NzjQmo60M9sMom_f4SRU8+g+=UEq7hqG9pKJw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: nomadik: Add check for clk_enable()
To: Mingwei Zheng <zmw12306@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jiasheng Jiang <jiashengjiangcool@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 6, 2024 at 11:13=E2=80=AFPM Mingwei Zheng <zmw12306@gmail.com> =
wrote:

> Add check for the return value of clk_enable() to catch the potential
> error.
> Disable success clks in the error handling.
> Change return type of nmk_gpio_glitch_slpm_init casade.
>
> Fixes: 3a19805920f1 ("pinctrl: nomadik: move all Nomadik drivers to subdi=
r")
> Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>

Oh I took out v1 and applied this instead, I didn't see the bug
but luckily you did!

Yours,
Linus Walleij

