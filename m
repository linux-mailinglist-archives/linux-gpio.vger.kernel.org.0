Return-Path: <linux-gpio+bounces-27534-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C010FC014E4
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 15:16:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 658215077C9
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 13:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19B8131B80D;
	Thu, 23 Oct 2025 13:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yTmywmVu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE3931AF1F
	for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 13:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761225249; cv=none; b=griMB3FNaMSfsJMOVNFKwZoNNx0LOwg+WfSSJqXe3J7obZweqlHQO5T3HNvSKDvdgxalHIntQ063ThdPVmcslCnqc2P4qRU/Yvfaheylsx1phS6RRFF9V+mM5kKVBO1/xjkUlNGs1uWqlabgax2UoKEwpAXO3MuYugUPjoSYwKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761225249; c=relaxed/simple;
	bh=rCgZQMvhqpJkSPW5CDm4P/9du6BfJf0oWn2sB/mg4js=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sR+ra9psjU0yc8/bNfpTUOCFKW8XMPUfQyaVIlXnTh78IuVllio4b1T6+yZSCaFy2AYgbBVK3GtHZo7m/cZnjfPGZ/bC9s6YV2P3771l2N/xsAkzn+CvP9Vm4qLHteLzBokhpBBeY7qMeVjixsdfsKS/bDNbJpj09UOEzOz+toQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yTmywmVu; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-373a56498b9so24652511fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 06:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761225245; x=1761830045; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gjHHHhlIwMyUNtV6qNO7lwTmbrTzq58N0AEeJA3rSmU=;
        b=yTmywmVuSScFS3RdPhtSge+WVKsWGnYEWKzlgM+s4T+Yit0f5qQBbmAO9UXkS0su9U
         /H2o1saHBzIL46cu+b0sNPguAdFS03ESxICuggmb5ZVHWUSxkF7NjOw0Dtge6n40J2wP
         y9UpToZ40YDelfX4etnFsgxIoULooQTRrMXzwSOKltzJ1uL058/I193olPJ0QPgo1YYY
         PiFBd4C+gHuBzEKYJQo7mHD73fdSTLV3NA/qNbQgEBL03MoS3Kj7RCDIqJzhqt+5BhBM
         obJYHHJQoQia1yjJfC+Y8tfuc9jEYFOqVpbLJ8ra2fqhlv6COfsOIVVXnyYIvk+H1BHT
         QP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761225245; x=1761830045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gjHHHhlIwMyUNtV6qNO7lwTmbrTzq58N0AEeJA3rSmU=;
        b=EXxqRGq4ZwhrAHuaExVn+jVeHphTExt3fpCT9sC/VyayPEgN3rCXDDww8BjEMHgd4K
         N3MFwJ2pZ998GnbSObkCSYb05hDA/azzVuJTzup567vi3A2QrJZ/CHfbEfyVRj3ve2Vg
         9hwNjcSWDLJYiTL+slcQZJPVQW5Oh/Rx+JwM3UuFzLycfIPfVhMgZFW6VeeH/0aRXJr9
         ZWj/EvmLgbxumKTPLb1WZVrcPK3vHggG5Lj2cqCHAMoVlBPSsXLqpL6liuUu/iHfdnTr
         5N+Z0o2u4lmlWXBzeWzV75HYjpsCQfdljw0j3S9vNIlBQcZ4M6+OO6iiSsZ2JVskhNJR
         m1Hg==
X-Forwarded-Encrypted: i=1; AJvYcCWFO9ew1e5lNK/WaOMPqbgRIDat1HwDxnFGgE5WljOgF8NzoIxu0D6wi7q2Qq0CjEa10D47FavA1AVo@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6I0NUUqfVbmHrwIIf96Z37f+UgkWpRi5N4neruOhej8POkA7d
	lnq0TENYARxJMlN8yVtq8ifDfc3PCKZKsqhwSZ2kPbe+N6w3dQqAcoZKMHJvB7se2ki5KRECbz6
	8VtI1KaRAmYUionnVDdJfoJX19mSfz314PpjHWK4zxQ==
X-Gm-Gg: ASbGncvceFgCdYAtBv9ktxwcpTblfJQ6hJZGHiTmYyTG+qojw5ZDAkAG8qU7xPUv9BG
	fBP0j+BNl+9Tc/aaH8fS8obOZaRPtsMYEZ/mXiHmG1bkTtiQNAHh7tnTC67Py4Mj0s8Yxyw1LMi
	nIo1hDwgNxyXKlrRr7UOKigMjbsraM7iq/M9twACOXJIM1CaZ5roD3hpQ0nkLFyK4w9FlRdzka2
	UjzN1W/ArqMtseQM1HrGfM62RmuJAHG7Jn2CtDBgMVJ5YvLi+bAnaMErhL1
X-Google-Smtp-Source: AGHT+IG6Lx7X4nwjjCbscanhtEBxXyR+h33EgNAu+2QCvEvhHwb326NmDGLUdbF/Vt5osp1coGpMRs1m4S+7/7joI7g=
X-Received: by 2002:a2e:be03:0:b0:377:d151:c090 with SMTP id
 38308e7fff4ca-378cf8633c5mr16810071fa.1.1761225245249; Thu, 23 Oct 2025
 06:14:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022133425.61988-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20251022133425.61988-3-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Oct 2025 15:13:53 +0200
X-Gm-Features: AS18NWDfHk0wnb9yCffDQKbucYaZNvR_wj0zVimsSTgrxikTdx8n5aED-luAQ8o
Message-ID: <CACRpkdZnmMHMWihudwYYuzCm9H_jN_0ZU5+mmS5G4R5m9XkV=w@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: toshiba,visconti: Fix number of
 items in groups
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
	Punit Agrawal <punit1.agrawal@toshiba.co.jp>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 3:34=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The "groups" property can hold multiple entries (e.g.
> toshiba/tmpv7708-rm-mbrc.dts file), so allow that by dropping incorrect
> type (pinmux-node.yaml schema already defines that as string-array) and
> adding constraints for items.  This fixes dtbs_check warnings like:
>
>   toshiba/tmpv7708-rm-mbrc.dtb: pinctrl@24190000 (toshiba,tmpv7708-pinctr=
l):
>     pwm-pins:groups: ['pwm0_gpio16_grp', 'pwm1_gpio17_grp', 'pwm2_gpio18_=
grp', 'pwm3_gpio19_grp'] is too long
>
> Fixes: 1825c1fe0057 ("pinctrl: Add DT bindings for Toshiba Visconti TMPV7=
700 SoC")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied for fixes.

Yours,
Linus Walleij

