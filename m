Return-Path: <linux-gpio+bounces-6721-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9598A8D196A
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 13:29:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34DD81F2338F
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 11:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FEBB16C69F;
	Tue, 28 May 2024 11:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xmNMDcdW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E3F16C444
	for <linux-gpio@vger.kernel.org>; Tue, 28 May 2024 11:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716895766; cv=none; b=OU9sS9Cuw2ODAigR34Mm79CWy86EuyxSd0CLuEhI3RYls9dMGMTzpmEIS5PQn8wzBjK9lZ1n6j7D/NSkC1uvI8j2pDudxkgIeV+klL+J0cp3eGbazMSNcBALzUZn3X5go/bIpBdp0ZaxF+yjDv7zzOk3H43ZN7i9seCasHIkoDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716895766; c=relaxed/simple;
	bh=HrLuMk+QemkYNFhy0HrMjcUhynlD+skk3KpAQxbcfcU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R9Ntgt+B/2Zd0AaofPXSjNeI11QDMyij/64f7SxwQE82D+kXLogdVetFr4mx+OHOaSvYBfEc+zv45jeB1uzWsO7iMnniKs+ZsgYTMAmGkulSCAJqsiwCpHd3jp/RNTVaCHahjhnkKsKHRHCNrJgWc2HWYYiranO8uA3WinavBKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xmNMDcdW; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-df7c1a7d745so557920276.1
        for <linux-gpio@vger.kernel.org>; Tue, 28 May 2024 04:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716895764; x=1717500564; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HrLuMk+QemkYNFhy0HrMjcUhynlD+skk3KpAQxbcfcU=;
        b=xmNMDcdWNuSwYh85TiXII5UFy4pcSeAkcqt9MaVS9tDMlWbCy09qyAPaLVddFDp7Zh
         nhd5lYz7SfCIjG+ku7aNsJUP7p621DR1agS5gzqyIJnPr0mLUPZZWyTLZjPY0J/h2bUe
         m1/CXxnfh7jmPFsW573fbp7ueXIGPrKcZ++v0SHFGHFC6+GNocEnrEHAxVbVk4ABFClP
         u32zoRHz0oE9uUmKWv9Zw8s9P089VKW+stsgzRN2DWunEjXRW8gjwWPdlbL27/hU3IGd
         6wo+I/c21dDPnjGd9QSZMdhvaIynYubfVOIvEAv/xs42XLL2K8lt8uLLVjE+NiHglJVC
         NHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716895764; x=1717500564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HrLuMk+QemkYNFhy0HrMjcUhynlD+skk3KpAQxbcfcU=;
        b=Bb9S5JuKaCBfQ7RZL88xNphOE4jAZ0r5ladLIQNlw4TQLbTsaH/X7S1OyGurEhKIaL
         mWYf/16esFPtqd/GlFtqRUWQrHDA3ki27EjcxeaOAQNtuoYG8ojIpbxs1iu9cjLf6m9t
         5DI0rcK5rmtxybtju+lONxOn/bU/aJ0gvLDr1GJoZzZER0DR1y7CVxQPLNq6NjTCXPAs
         T9PSK7nsLR6evQ1XMrEGNwpszmLP7cAyQnk1DnDUSU+md9P/xxfvVgwMbC1f5ErAMxMo
         OsSyCXHyP5qz6aVZvtPh8BpBA802Pv5vBKkwDyIfIoM3GoIYzythOgues4KAH9MhCSS9
         17gA==
X-Forwarded-Encrypted: i=1; AJvYcCWf9qICX+DX/xh0jeQOefChl7FX5VBE8o0K+D2ig3xmvw6GszoCL1TJXJ5SBE527ZG+9HJGZEBDxooAGwt6tF+2t/KNmAk1zCWY4g==
X-Gm-Message-State: AOJu0Yy/czVluiXIBPs4Qpky1tacDtiJ+leq2MPA4nb35JxSW83WRsTf
	1DKxG0d7U06YFWUUWQCfEEh5KeDRXVkuYkuRRCb79E841qEVoqkeekVavmbeDn80xJatUNzQlAk
	5OC/6SnqT80iOystwK+bBvXeg2h42y+3YMG0cHxF87jW0awjO9BmCHw==
X-Google-Smtp-Source: AGHT+IEk6wsE6F4jE8aDIDCXOolP04kWcVWKcPIVc0WwOa4C3mfNwJ2alb6IUhDHtVxsQ6/JzHOzIjBnpoOasKo/B/o=
X-Received: by 2002:a25:bdcb:0:b0:df4:e4fc:16a0 with SMTP id
 3f1490d57ef6-df542239ee2mr11528398276.13.1716895763808; Tue, 28 May 2024
 04:29:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240515121634.23945-1-dmt.yashin@gmail.com> <20240515121634.23945-2-dmt.yashin@gmail.com>
In-Reply-To: <20240515121634.23945-2-dmt.yashin@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 May 2024 13:29:12 +0200
Message-ID: <CACRpkdYO_zr=OEZCv8LKtw+fNOwJ906ZVKyPhbbyA=9gP5XQgg@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: rockchip: update rk3308 iomux routes
To: Dmitry Yashin <dmt.yashin@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Jianqun Xu <jay.xu@rock-chips.com>, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2024 at 2:17=E2=80=AFPM Dmitry Yashin <dmt.yashin@gmail.com=
> wrote:

> Some of the rk3308 iomux routes in rk3308_mux_route_data belong to
> the rk3308b SoC. Remove them and correct i2c3 routes.
>
> Fixes: 7825aeb7b208 ("pinctrl: rockchip: add rk3308 SoC support")
> Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>

While you guys are thinking about the RK3308B support, is this fix
something I can just apply?

Yours,
Linus Walleij

