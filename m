Return-Path: <linux-gpio+bounces-12698-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 178279C17D3
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 09:24:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C424C1F24224
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 08:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 666061DDA32;
	Fri,  8 Nov 2024 08:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lDEQ/1OP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1F01D26E9
	for <linux-gpio@vger.kernel.org>; Fri,  8 Nov 2024 08:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731054245; cv=none; b=rLM4zVGwFIlqlWYgJ+UWpstNzOhklLNjtcBiavr6dK1SKwPX2gJ9xkNoMxYZ+EYmJDj3SaRobJ2trwBQgq2qos6OQguEO7mHGpiTcqVM4I1G8KB25ELdZsgCi48/mBPqId4ydr1RcppuO+hALmbthZ1FuIjO9Fb1AvpqVWXnV74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731054245; c=relaxed/simple;
	bh=Jl0lx7Gsy6iH5afi7dJma9NiuABi3ClmekHLbyLNYbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qjqwhNqi2OfaCEuuS+34aqGjJM4nJkqrnWCtCWoDwuewbrZikrpzSSkzxmnGzRzeNitpGTCO4aptSnfOF8iWcJL3cpuwofvilKo0aWFRS1WEjKa/IhaKRtoQSvzzu6k2qgqkNmRk7LAYwR5xH4UuBkU6F3Yl7dvJpMTiUu5/KLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lDEQ/1OP; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fb5a9c7420so17880461fa.3
        for <linux-gpio@vger.kernel.org>; Fri, 08 Nov 2024 00:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731054242; x=1731659042; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jl0lx7Gsy6iH5afi7dJma9NiuABi3ClmekHLbyLNYbM=;
        b=lDEQ/1OPDXeZQgdRP9qaJxnG87KhKPu3e3jvJhAhGrG8A/rQdL/1hvXz0Uwt1ZVWYG
         GSGWgkKYsqWzu0W50Fyw/KGZ7t5kogR1BGiz4qPZUmZzLvV48CYwiGlQPpFTfbFNl0Hv
         lIlb5sILAcF2HQSdIxO4BmRDSTTK6h5VUbWedO2mlF6rhEbO9FFta2AYweH8rCORVaI3
         QfcGNA/dNk6DuQAYT9r2FyoD362qidhO8IUb4DF4VmyZlvInq5bRSKnlmlbN0Nn/ad9b
         TkBBVrXuM2F+EfNDTB7ZQyk5DlgyuzkL/E9oehXP1R5oNNAYFeBdJwkTA8md9g1ZSUZk
         JS0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731054242; x=1731659042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jl0lx7Gsy6iH5afi7dJma9NiuABi3ClmekHLbyLNYbM=;
        b=ERK/ooW/zOAbe2zhu4zC2sbFHnY9aXkp3f3qCJt+ahhx/5fUjK7LJ8PjwUnUwR4FQo
         yvbN8pG3TyUXkb/pFaw3+b5pMHC9Rz8m5dgP09ZvUdSmxUd2aWpKFQwQQLDqE+m8o4LT
         3OMYfnwtr1yTfrMjmacMR+pPCHlndmWaJfMwbK8/B+LwAKoCaVJCPjjAmOg/aPxyGjKj
         XTlCJmMp5VWY2Dsoydc5bNFokPI9uCYJRCZuN8XzDIvUKkdamu6XP3OES30SV8AYADSs
         cWFPAo3Ex6wUwj+ApVsEEq+kXn/lGopybTDQKKus8O3e3GesIgYtZG4J3BMr9AJtZjbK
         Q/9w==
X-Forwarded-Encrypted: i=1; AJvYcCUijAMcyJGdsl5PbV8Q1zxmh8m/2apHDHPwysRtnmQhILrC30ajZfYV1+SNTPm/5cEBLDje1OL5heA1@vger.kernel.org
X-Gm-Message-State: AOJu0YzI0SWA3RKPzR5ZPsnbMcOyiCjb2KxqankD+Z0iGUuioYgN1jK5
	mu1eUqrPRvbTTUFgKvLeFHnRpLbBw2daTQpW8s61eeM01cSH8gWBfW1rZctL+yIPq5nve7hvt62
	yoQJeZ5/E5LxTQW3P6Ywx9qCqihWlCzQNsvqu2Q==
X-Google-Smtp-Source: AGHT+IEoi4h9cOF0NrDnDfN2mcJ8OQ9IS7ZeEM0xCssVYgc2FE/qjtdzrUC7fSlflKMcaF1UCWmg7W2XU/WUPP4wOug=
X-Received: by 2002:a2e:9a16:0:b0:2fa:d67a:ada7 with SMTP id
 38308e7fff4ca-2ff201b1d51mr9123811fa.23.1731054241726; Fri, 08 Nov 2024
 00:24:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241029012312.3448287-1-unicornxw@gmail.com>
In-Reply-To: <20241029012312.3448287-1-unicornxw@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 09:23:50 +0100
Message-ID: <CACRpkdZB1RT=ATC1RKosjVyj2G1v4F8NYEPOTpfW16vmTG5y4w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: correct typo of description for cv1800
To: Chen Wang <unicornxw@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	inochiama@outlook.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Chen Wang <unicorn_wang@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 29, 2024 at 2:23=E2=80=AFAM Chen Wang <unicornxw@gmail.com> wro=
te:

> From: Chen Wang <unicorn_wang@outlook.com>
>
> It should be PINMUX/PINMUX2, not GPIOMUX/GPIOMUX2, see
> <dt-bindings/pinctrl/pinctrl-cv1800b.h>.
>
> Fixes: 64aa494de6fa ("dt-bindings: pinctrl: Add pinctrl for Sophgo CV1800=
 series SoC.")
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>

Patch applied!

Yours,
Linus Walleij

