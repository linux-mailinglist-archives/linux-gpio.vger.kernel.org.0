Return-Path: <linux-gpio+bounces-8575-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 493F8947680
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2024 10:01:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09895280DB3
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2024 08:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF19414A609;
	Mon,  5 Aug 2024 08:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vQlQitgg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77B61448E2
	for <linux-gpio@vger.kernel.org>; Mon,  5 Aug 2024 08:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722844853; cv=none; b=Z7Hbh47eEoG48KJnnvVjqc6TD8kiIPyrtIC8Wk2jBEGL3BWXRgWH0cOEQHtlqtMmX23nanUK+DSuipnNTIHfD+80eoq40doc5EZ1M/zpXTVKuDZoyJegi0TSmUXXgKwHDi/lMdJlSLxKNMTgNYCb0Nlp2E5hrg+HxwAc+75EMuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722844853; c=relaxed/simple;
	bh=V0XBLdWPsEfluunRhLptNbPEUeInLXsANcgHR2jT3fE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lVa1Lrua7suBOmXqLC9SCwHNLyyaCXX+qpPCqcBzVgZOSRV2grqUKgZ46ZvPeNAS2yQh0gvpri2FSCrlax2VUuRE3lwpTD+ZM9Rwl0dikcOPbfidN2B1/sc/c6uzrnGXYF32k9+HfnMm+ZZjLQxlSBOfK8D9ggTaCEmnorpWcjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vQlQitgg; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52efa9500e0so11898338e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2024 01:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722844850; x=1723449650; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0XBLdWPsEfluunRhLptNbPEUeInLXsANcgHR2jT3fE=;
        b=vQlQitgg8MyKgVBqn9roFoJioZPR4FZHlPEt5jOkCrCLsZFYsHzr2F+mcKg40uk/3N
         jQnMlRLEqz0Xk13WAixEGKM99yaxYlZAlL4ArkB09FmUK95eFOJpGX0ygTVzU0PdYEH3
         tV8f5RGGqfjg1mx3GhyLN1QjJnO3AzH5jeCb49OZjTT6/H5ZUO3H8CsVyS18Zo/6Lwrn
         4sWCi23BsP1S1W/yM5jbhab8cWdkOK8KtxA1cLmxtMW07C9cf+jGfLkFIgWItQ9Z4nOd
         3wLjL9U0TAs3TKo4h5puEzo1xvGgczdYpbWczHjjwDS1FTSomYi0Ofwsp14V8UPnQRZ7
         tP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722844850; x=1723449650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V0XBLdWPsEfluunRhLptNbPEUeInLXsANcgHR2jT3fE=;
        b=IY2X3/D0YKsK328Zbn2raMztmkj4POx5pyZC3dZDGBad2or0nn/lPPNMx5G9CDY3Ad
         Vpqb/Lnx1K1ItH2790TvA+p3r5C9D84rQayLvHRqy7ofQoZ+4+wAZaji+7iQJcQBCKN4
         oBJmc0opiw4F38zNZz6NpLVKfgbx/gYGUdQwrB5M+3eqvSuHQz2GcNuoojv88Y9joJcL
         OG9RhCcK1W6NuCxq3L3ziNcDxp5ZqzgNGcRp4HdffdQbW2XSdt2DazqlWxjrt88hnNBm
         E6P/sv6znSV/C/a7kIV9LXfOCtxhZ3vf1kgRdJaZkX7q2cvmPY2yXNnT86ZAoxpntGnB
         ZAgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXnIyT15/xG/QOfoMF8hRJ2lgjs7SV/jAJkaH5731wXaUztOZfojXfE3KzYfn9L4FQe3CmZGTNw4sH4ml9VBCv4vIoV+pD86G9zg==
X-Gm-Message-State: AOJu0YyXZIPIRXbi+h8Lll+YpkIM0nIZKZn/zQBqMl62pZGUsqg8eLeV
	2VNBjeP0kqIV9m6qPhgLFmEsjSR1SyHv6kDbcdryXWbSj6FQgi/s2GkA0pA9DpHIkdjUUubJt8+
	cyNq3hlSZbp0BFCi389O+SC7FJQA05u7BTeQ4lw==
X-Google-Smtp-Source: AGHT+IE4e1ypq3XkPGGxUNLRbeIjoKSdEBrPK+4BFko20jBg17ItwlycPxb12bAyuzMocKZw3XI+Eygzrzew8wFEJfQ=
X-Received: by 2002:a05:6512:ba7:b0:52c:9e82:a971 with SMTP id
 2adb3069b0e04-530bb36640fmr7509297e87.7.1722844849933; Mon, 05 Aug 2024
 01:00:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240723-supervise-drown-d5d3b303e7fd@wendy> <20240723-underage-wheat-7dd65c2158e7@wendy>
In-Reply-To: <20240723-underage-wheat-7dd65c2158e7@wendy>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Aug 2024 10:00:38 +0200
Message-ID: <CACRpkda-QEnywHSwMQDMtbP8-rZEbUZT58D+hvXVRdMkFu09wA@mail.gmail.com>
Subject: Re: [RFC v7 4/6] gpio: mpfs: add polarfire soc gpio support
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-kernel@vger.kernel.org, conor@kernel.org, 
	Marc Zyngier <maz@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, Lewis Hanly <lewis.hanly@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 23, 2024 at 1:28=E2=80=AFPM Conor Dooley <conor.dooley@microchi=
p.com> wrote:

> From: Lewis Hanly <lewis.hanly@microchip.com>
>
> Add a driver to support the Polarfire SoC gpio controller
>
> Signed-off-by: Lewis Hanly <lewis.hanly@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Looks good to me.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

