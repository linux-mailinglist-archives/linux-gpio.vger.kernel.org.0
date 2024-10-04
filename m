Return-Path: <linux-gpio+bounces-10836-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EB699024C
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 13:45:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFC3F1F23C2B
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 11:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DB6415B11D;
	Fri,  4 Oct 2024 11:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HjR8GugK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F9614A4F0
	for <linux-gpio@vger.kernel.org>; Fri,  4 Oct 2024 11:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728042303; cv=none; b=jrX4abtRvrck9+pzGEd4wqpqu5Wrl+J9HfQ2/REglsEEt/saqkvt5oY4A2vEzx9HD1vl4Pgbu91uURCYfyGUEtM0gf9g2nIldx9cGi3QGDoQ1iGFKjAsVt1L8NcsyDOYGq07pd3r17AzkR2gyUdGV6MSS44PzpMMiO6PQYR1SgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728042303; c=relaxed/simple;
	bh=ddGvXf1L/Fq3c4RMPyxrOA14cqgWI9P90J4zJ4pJs4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JsGJIry7yye/SgqUXPygZiXOOkWbPcjSvgf/XIy43vcerGi5zoih+pEIjwd6pFQpBovpxC7su69ZIERCDSaZWYeuAifd2t/tbVSGzbBmOxJdviMUvFjvl8dSSzJL+VH1tKO5wWT+xBEPH+D6vPPZNBDRrTuayyjYgSofK1fEwa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HjR8GugK; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2faccada15bso20988861fa.3
        for <linux-gpio@vger.kernel.org>; Fri, 04 Oct 2024 04:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728042299; x=1728647099; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Khwkr05lsMPVSpq7TCjaX0gPVi7sWovxm4CAOdt4/3s=;
        b=HjR8GugKRCDjLPeodO8HloyjgQ1OLPxVoLDlQlXKO2iSZOkvjJy0DTvLv2+4rxk8A2
         9QtantMsXz4bxkjCWgpec8Nhg9JuUgDOeTjdVEFVgGtnNqcOMvwq36OgW1nPFYPT2760
         H7fUVJRbq7EXeYfn7sEZMaTr1OYR5cJZuYS+tpPdlNKEtALPfKBeh9XkJ/e0Ta61XMXh
         c6QGKeRXtjX5gB1uBpNfUrarXzxpsKiV52MAsiv86aduOF4HO7FMIT67lAttqYVjp6Ak
         EoeC3GBL1oqtoKOPwM9D7toIcqNiuokz8gBOFcgK6dl/x0Xsbosk7zgOdMuVK+3hc5uu
         If+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728042299; x=1728647099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Khwkr05lsMPVSpq7TCjaX0gPVi7sWovxm4CAOdt4/3s=;
        b=w1P5aLifuUc8K11YDgaeU+a7ChYGJQr4/VJNosO45dLEWoxtmOrPIg5Pl2mGw9+qbh
         rcGsqn6NoYzNfz+3L6FrO279+MzugcJc9uITVH48blNxbgv8SsQve4n8SkCHPnTpdfxk
         bNG4H9rbm/TiTxe9lAEoX8MAFHplWAOcwYVborp/HXlt1S2oE8RSfRQpSG81dYAu45RY
         Hk+9DEYQxasNIzuYZV4SrjBYM/NsmKFob4HmJyfYj03v+4jxxGuUjoPzGAaYMXEojzv2
         xpPJ15zYkJIUiCYYUtO6IVz9GIl200/w8vuYfu98B+YO75DRqrGWn9IJNqobgM6bupxf
         5FVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoRXbzLeTIe9PamQQaDqDSYitSzLZjYMl0n6SW6eee0OjAiismR5LPE1s0B2AeNbKN9VBG4/7DjzQy@vger.kernel.org
X-Gm-Message-State: AOJu0YwZmaAvCxOb0UaPSgB+XfxwsEYI3HJTHLAJN38eAgKFWoXFdCxw
	OKKXuWyS9+bryVKGR2tlwSCSjD5vB/XKaSFPyVooLKhLKj7oIwf8nqNMomuDcGYaw7iHugQGRvE
	w5bIYrKOAINY9NxeOYXo5kF3CK9rVijSXv5huAw==
X-Google-Smtp-Source: AGHT+IGiTQzYERLjm/jzUGh/crV6ATYuQpv4nXIEVrS7JrXOOcQzJB/z1NXK08Yox/oqqZ9WwDQ8tFMFsN0Zrte3h1I=
X-Received: by 2002:a05:651c:b22:b0:2fa:d4c1:3b6b with SMTP id
 38308e7fff4ca-2faf3d74e2cmr12168961fa.33.1728042299452; Fri, 04 Oct 2024
 04:44:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241002232804.3867-1-exxxxkc@getgoogleoff.me> <20241002232804.3867-5-exxxxkc@getgoogleoff.me>
In-Reply-To: <20241002232804.3867-5-exxxxkc@getgoogleoff.me>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Oct 2024 13:44:47 +0200
Message-ID: <CACRpkdZnBBAEgHZ=HShwvaXaN-6icC5hzwHqDNWWy_PKJDh+Fw@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] pinctrl: qcom: ipq5018: allow it to be bulid on arm32
To: Karl Chan <exxxxkc@getgoogleoff.me>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 1:29=E2=80=AFAM Karl Chan <exxxxkc@getgoogleoff.me> =
wrote:

> There are some ipq5018 based device's firmware only can able to boot
> arm32 but the pinctrl driver dont allow it to be compiled on
> arm32.Therefore this patch needed for those devices.
>
> Signed-off-by: Karl Chan <exxxxkc@getgoogleoff.me>
(...)
> -       depends on ARM64 || COMPILE_TEST
> +       depends on ARM || ARM64 || COMPILE_TEST

Can we get some more context for this?

Is this another one of those cases where the SoC is actually a
64bit core but vendors just choose to run it in 32bit mode because
that is what they want or what is the reason here? AFAIK
IPQ5018 is always Cortex-A53?

I just want to know if this is something we should encourage
or leave out-of-tree.

Yours,
Linus Walleij

