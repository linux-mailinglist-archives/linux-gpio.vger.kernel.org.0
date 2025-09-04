Return-Path: <linux-gpio+bounces-25623-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D147DB446AD
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 21:46:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90E8E5A0C75
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 19:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC9F2272803;
	Thu,  4 Sep 2025 19:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U6SvjqDu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D605C202C43
	for <linux-gpio@vger.kernel.org>; Thu,  4 Sep 2025 19:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757015155; cv=none; b=FXx+bdMHqwlyqBgE7r5foTktmAvuWn8Lo7h1RHD8rZvYETfmxOp/yDyfu/suBrhGohAjyxVfYRRHlG96Lc4fKCh8y31f0lRaIme2Gb7KF5ygQozNzSW6KkNoJ8XDgxWJSuOCZ1iljdVE66CK91xgllIaeb4/umtgxEuKt99aaCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757015155; c=relaxed/simple;
	bh=hzWQ+NZvkCjPqaF5rQWuE+BV3WjbZDFdOwhEuuB25rY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O2hEWDx5jTE6+JnVX3fEMGFDhVt6vU9tI2ru8cjLxKppwRE+2KuLucdA7iZ0IjhgAjxpjeZYmMeK2J462QPQIVBeGFTLZoOvvzcEb11otvzxX1U6hHF6ZtQStJMkZD3ZYCup2+Yk9/tEDPe9nkSycFKWk7ENHww8LHTbSKZmekk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U6SvjqDu; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-336b0b3d753so15067781fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 04 Sep 2025 12:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757015152; x=1757619952; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hzWQ+NZvkCjPqaF5rQWuE+BV3WjbZDFdOwhEuuB25rY=;
        b=U6SvjqDug2r3Bh3E+xqa4ahbWya/SCsScNAUzYXo7STgzFY7SGDUVbJeGEwcP9uyLy
         yh7VoojAACI/g0vl6OpsjytJ5BJAu5Ve91rGKNEecJJ3DGeO6U9I1zjeOIfTFY1tKYaT
         E/HE1uZUECFVPxtHclhCgxXxMAeO3Qwo7HLVWP2mqXoP7IGdhPjzUybgKFLlwX1bRHXJ
         MlceJUyuQB974GiA7zwJ4xLi60HKG0XUtRSR7nJNSw4aTwBonuH3jGNcei/MxVfp9G2p
         y8C85NKksNxhBFDNgHw1AopZssg+8dZDHABoj12Qs3jMsiU3XnYi5lKVuzC7iyxEfIXh
         3gHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757015152; x=1757619952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hzWQ+NZvkCjPqaF5rQWuE+BV3WjbZDFdOwhEuuB25rY=;
        b=RGAQUPfW8R+JJYrNJ6WS+K5+nNCcDaH9fIqx0WnY84atK8CGjd8qZOIz4qXlVEf734
         Y6Ujssv7sIQ3k7Cufk+CkaOK2lruJEa4rIKg1vr19P+jbZX2IktHWfPYSc3YKLQm6St/
         OyfFS2ySoNoHrjbeWK5V5qk31CDCwmsMxzpvRJchvZ6KukFMsZarlsctcY+SS3t+15Tq
         pLG3s6H8t/+vonbuMAdjc6Th0BYU3A6acSnCceNHW9e0RN7iO3LEhnVJxB0jcb95cQQR
         fShmKoVk1g7hHKgymCaNDKVD4J+L3wvU9M1zEH1iWBiYmV70v8Hy2g+QNOImkFDaOCm/
         eV2Q==
X-Forwarded-Encrypted: i=1; AJvYcCURqULaxu5ZS1lFNEH/xZdFXEMUggONulNzGKpmwBkQDAbWNWMQhyfFSEzFcZQJa7xRmfSxuhAmXAOW@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3MGnnYsfDwnSSRkuVhOjX53MJforYUybheQW70guqePK9nhLK
	/eFt6qeDWBGCpXO/TOqUZoE1N2NIOF+TYObT67q0MBq1zCrlTg6vD65Mug6mxh2HuWOreU8bFch
	p3jx3j3hjx+LF3RVKfAN96oAEaxGPgM4okI7ujTrw6w==
X-Gm-Gg: ASbGnct/D07nMsGP12BOMZCcOGv316sjm0mQ21UdssTxVxspurw5jFrCvmwWAoeYmJu
	Zk+YV9UZ+u9PcNL/i2MkNHONp2OWeTFxLc/hSoJjTta2/NudLXMh+VY95jeiVpaOxt3wFC1iP2t
	QIj7ezJVQWC3ncPkgdLx/GQJ+iCJg62jBz6f3Lxp1hHcIC797LIyTPbEA5lXwGP83rwpvwq5Hzb
	pd15/QNaLdr/aeH7w==
X-Google-Smtp-Source: AGHT+IHyOco31RUv2Oe9cKuPvD0Htgm4IoRC25q2CFRrREw8Wo2WlCc9mBvTU1sMDJcN9tENLMEe0p4jJKwMHOJBxZ8=
X-Received: by 2002:a2e:a54c:0:b0:337:e460:bef6 with SMTP id
 38308e7fff4ca-337e460c680mr43543631fa.10.1757015152027; Thu, 04 Sep 2025
 12:45:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904013438.2405-1-ziyao@disroot.org> <20250904013438.2405-2-ziyao@disroot.org>
In-Reply-To: <20250904013438.2405-2-ziyao@disroot.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Sep 2025 21:45:40 +0200
X-Gm-Features: Ac12FXx4X2_pNhzcdcYEzziDJRvtowb7CpE7cKPonDOwSax6LARZw_4oRio8qGA
Message-ID: <CACRpkdZfruCqEzN-sMtxidh_e7JM1e_LG3JKaQ3ahkDAnx59Cg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: gpio: loongson: Document GPIO
 controller of LS2K0300 SoC
To: Yao Zi <ziyao@disroot.org>
Cc: Yinbo Zhu <zhuyinbo@loongson.cn>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, Mingcong Bai <jeffbai@aosc.io>, 
	Kexy Biscuit <kexybiscuit@aosc.io>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Huacai Chen <chenhuacai@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 4, 2025 at 3:35=E2=80=AFAM Yao Zi <ziyao@disroot.org> wrote:

> Loongson-2K0300 ships a GPIO controller whose input/output control logic
> is similar to previous generation of SoCs. Additionally, it acts as an
> interrupt-controller supporting both level and edge interrupts and has a
> distinct reset signal.
>
> Describe its compatible in devicetree. We enlarge the maximum value of
> ngpios to 128, since the controller technically supports at most 128
> pins, although only 106 are routed out of the package. Properties for
> interrupt-controllers and resets are introduced and limited as LS2K0300
> only.
>
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

Looks good:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

