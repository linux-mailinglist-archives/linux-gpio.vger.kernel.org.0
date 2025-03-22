Return-Path: <linux-gpio+bounces-17875-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1B2A6CC30
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Mar 2025 21:27:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 07DAF7A517F
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Mar 2025 20:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE95233D65;
	Sat, 22 Mar 2025 20:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h6X6gFQp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825544D599
	for <linux-gpio@vger.kernel.org>; Sat, 22 Mar 2025 20:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742675218; cv=none; b=FnNfvYljun3fKhkmCzBEGMM86bn3oV2NRTNrBz37GQFNZR3lEheJTY3fAm1PrWFhCXUtMyF3iIrZLSjHyGGqFiO8AaL+xpkKlhbzgJL487C3yTqQISQGdUZoACAwOGXtKUqAnQFV/sI93zeaOiCUXdrVrsLi6+FS/xTwSknF5k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742675218; c=relaxed/simple;
	bh=ljbAa5s6Z2FI9zB1H91oADDkd6fPz4zPC9SJhrGQ/k4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ovxT/Ot28SDT4Qt6rzAsvSWO/WitjvYizjhxXeLwYAhRh0CQLz05Bo7zpjoR48zFl8T142RjOU/J1znrAP/tSsLAkuEq4+xt8VcIlCErkbuMB3iQUv1yYz/G5P2LhLeN/lNGg2TSBa1fAq/JvUAqFFEFUumb2QhAbfktuwU5ssc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h6X6gFQp; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so3240944e87.2
        for <linux-gpio@vger.kernel.org>; Sat, 22 Mar 2025 13:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742675213; x=1743280013; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ljbAa5s6Z2FI9zB1H91oADDkd6fPz4zPC9SJhrGQ/k4=;
        b=h6X6gFQphsjHXrIAScyylueD3QYeX4DmsbaPTBoRmHHMvsjelk9FDZnU/Krm7nd/Us
         84j1fqrtUj4bHS5YKlXq8r6T7Z0ga4KeRYzR7c8H+ajb55mXDphO2LhQF8WhjZ4aBDh2
         4toVH0+GTbsu3s9pmhnwAjep+//PKgE8lqp8LEZ0i1Xybl2RSEWiLalIktnAONLDm0zj
         JkD/FbDfdytqqS5l0/GFnUDfijuZwDAEV6AuxMCHiZeV5CeXlhF0omwBJwZ9BVrHGDxm
         tAq6Dg5/Fu1pqCYtYr5bCul4EOP/l9jGaIKeWz6oK4883x3f6Bno3Ujg61LWlaHK/f4V
         02fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742675213; x=1743280013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ljbAa5s6Z2FI9zB1H91oADDkd6fPz4zPC9SJhrGQ/k4=;
        b=SqpVGWxSPE10+QFmvEkv6/aQ4w9SNwmlMrLDk2mbq4Qy9JBdxQYWD+OZOEFc/geS80
         zQDgBwS/MIeAs4sz30DGvDFoIKWRWQeH79JyqFiKPFwNsx0vigP7ACfmAPu9ja81tEYm
         FZD70tg8mL4JXAQvenmRkO7B5ktNbCXwmf09fXM/T1RLKf1GEFGlKLQwky0dYsq2My0G
         BEOfsNlci/Nnb0/LnVnFD27n0HN29iAwmNoVA5dfb/O7zuZ/v/Hb/6njR6lcgz0YMupO
         l7p9FVbQcPZrLA/9nXqBfbSRNtfOA53PdoVowU7vpH+R7gc2FqAkPQBNxagi+fgh2FIN
         TIDg==
X-Gm-Message-State: AOJu0YyTXIBxjMKi4AnEsXZC1IiNtk+gfF//yc3z8Q08KebjsBh/31Hm
	ckvpOAJvxia+pvwj2XnvMKL6QeuAozioTzjzhBBFFwfFcQhzBu1wO/hwOoOo1agheCewP4jLQdr
	UtyJ9ICrvPr0P+LSaTE+z9/kJrQwoGhvC31DjZA==
X-Gm-Gg: ASbGncsIAIJx3nEjBFnuROlKjh2Nxs5HYTCECQvr2AL7Vr9nwJ/aXU4r/K703ccrDpj
	TfZ8/N5wlw9CHYdXYG8LTij5S6VSZIN9F5SRF0jJSEQJRK2zrqIpwdy8aPML40CKAJ92Q23gfOS
	vlchiNigfwxlbMu88IxZWn8GI=
X-Google-Smtp-Source: AGHT+IHZM76jRtU6TXNoAtDN/VnB6qXNW6ovpjvvY0THEAovFKfynZjEWlA0H/2vsGwjjVf8rWLa92VxHvcRwumRTCw=
X-Received: by 2002:a05:6512:3da8:b0:545:f69:1d10 with SMTP id
 2adb3069b0e04-54ad6470acamr2373527e87.8.1742675213442; Sat, 22 Mar 2025
 13:26:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250321-gpio-todo-updates-v1-0-7b38f07110ee@linaro.org> <20250321-gpio-todo-updates-v1-1-7b38f07110ee@linaro.org>
In-Reply-To: <20250321-gpio-todo-updates-v1-1-7b38f07110ee@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 22 Mar 2025 21:26:42 +0100
X-Gm-Features: AQ5f1Jq0ivH31Pe07AD2K58EV6v1_l7EhkpQ6zjOojoKiaGM64uFvLaROZbRihE
Message-ID: <CACRpkdY=bT7BFDOSd2BGiwu3aAHYqBxaTM1Sew=2t5MD_WCXbg@mail.gmail.com>
Subject: Re: [PATCH 1/6] gpio: TODO: remove the item about the new debugfs interface
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 4:49=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The consensus among core GPIO stakeholders seems to be that a new
> debugfs interface will only increase maintenance burden and will fail
> to attract users that care about long-term stability of the ABI[1].
> Let's not go this way and not add a fourth user-facing interface to the
> GPIO subsystem.
>
> [1] https://lore.kernel.org/all/9d3f1ca4-d865-45af-9032-c38cacc7fe93@peng=
utronix.de/
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Okay then,
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

