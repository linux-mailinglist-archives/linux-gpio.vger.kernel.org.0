Return-Path: <linux-gpio+bounces-9078-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D54A295D1FE
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 17:48:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C0232823E6
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 15:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AC1B184550;
	Fri, 23 Aug 2024 15:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OxuRE89G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D38E188010
	for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2024 15:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724428092; cv=none; b=kGOtbFukU6+h3TI8HoceEAyASegBRMo6DE0cq8BbN19EJja1r7KKPQpQJMgeeCKJzcIkKuYc58opHmGzvuDwUxRBFQ/HNaOZ282Uher2iKUjbjHlCRprhGDiImTKJqHmtc0e0mFIWXWiFSr76vlx1zfFX75P+TW+pM8iLgoI8VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724428092; c=relaxed/simple;
	bh=LmPjT004Pu+b0lGXNhjt9mxzluLGxiZs+Qgq47unh9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b0m9c6pugEiNlMm9xrIGnkn+d8rYcMQ3jlbxjuMIkjFQyayzzsfa3nNEQh27ZTsM5NHzovZBoeLLh4xrEo/xsoUT1sgGVAfBWtbIDv7xK+HHz4h/rUPWTrSkFN/cdtkY4VcNj2MvcLpdTxHmRZAnO3Rpa0CvbJ5N6TOokPXIhvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OxuRE89G; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53349d3071eso2644391e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2024 08:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724428089; x=1725032889; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LmPjT004Pu+b0lGXNhjt9mxzluLGxiZs+Qgq47unh9M=;
        b=OxuRE89GlU3SEWYQpWlwh5UrcHuh/xEyEGicpZHNvWmbW5BSSEgMNh72jWOMPtEPlq
         tQXi/9JvQTugSgUDmnjHvzE89vWSyu6VLEFxC1tvEyVDvcSe+WfckfHd/J/N8djZaw4Y
         h0g1CJx60joy5/ERAqNPmbHldffa77rSI4Obj+4pIGGseW4jB2gIxHZAD+ZljUzfRXOq
         p7A6w0oFKMdqJVVamEsv/K0Zgb1B92j7by1HCC+ZyR80iOp5rQsQq89h070t4F6E3IeN
         cv7nales0LHYXO22IGLgZKtt6+vwh7nWaCNCnrnfRiIBjqCMiMCQYeDlUX+1gtDbmlks
         i1Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724428089; x=1725032889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LmPjT004Pu+b0lGXNhjt9mxzluLGxiZs+Qgq47unh9M=;
        b=F/UkWryJ/yAZqp2NJTOIYT5EbsCxe4JUg1a6vG/D+h3DRdf3rZP9On1lbt7qSIrxWr
         EfcgH6Xl0B3AIaj7gGYDe5erkpB6xhW1z4ixCxm7bEkTydkRPpIz++LNurmrg8W0HnkB
         83WKSDv61dtDjWs7Iq7mbwqVYlAZmw8IqIH35ZqEpjrasDYgGdMm0g9F80z+sj15hFEs
         goyXo+SRlmiXnHaroVRhS7HMf1cb3MhQPDi8htl6eFveAMlv584AxXgbxjKsgPTKmVR+
         b3i+jVptzdgvUu4l/TerjVcWmKVGD74uWd5wgqUwftdENRE4NR9PMHKS0a5kLEo9fCDw
         knvw==
X-Forwarded-Encrypted: i=1; AJvYcCXAJaaamT02Y9bJ0nvPl/MWFYXaFme7MZcbH8iSH0jQcw6e69YVbi4oSOZuHtnQF6jLiDTRLArT2Fvz@vger.kernel.org
X-Gm-Message-State: AOJu0YyC39S0JvL/B3uAIiXchTo9o5Gu0aM7gdRGD9nhIAQuZcsMSO0i
	fasnrXOR4fMIkF7kLui9gv3phLt4pYRcXfd30ojawVHRXecrpWDmdcaMkJK7TXHefMFezTW3zWA
	ET3vaLBYUxAU46uUo/UoqbBFlOxJ78oXYpMEi2Q==
X-Google-Smtp-Source: AGHT+IGPIsPltYDrMbENTRG8ZR5qzvz5WC80feYuFQqeN6sGzjfgHPtnsMGj6lpcAU4PIZVuuR1kVHhNrtGIoL9x7eA=
X-Received: by 2002:a05:6512:4016:b0:533:ad6:8119 with SMTP id
 2adb3069b0e04-534387786e0mr2117298e87.14.1724428089108; Fri, 23 Aug 2024
 08:48:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240822195706.920567-1-detlev.casanova@collabora.com>
In-Reply-To: <20240822195706.920567-1-detlev.casanova@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Aug 2024 17:47:58 +0200
Message-ID: <CACRpkdZW+g4_szvMhuYXFHCjoekYKdux8s9u6zXkhDSDuF_i1A@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Add pinctrl support for rk3576
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shresth Prasad <shresthprasad7@gmail.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 9:57=E2=80=AFPM Detlev Casanova
<detlev.casanova@collabora.com> wrote:

> Add support for the pinctrl core on the rk3576 SoC.
> The patch from downstream has been rebased.
>
> The grf driver is added support for the rk3576 default values:
> - enable i3c weakpull SW control
> - disable jtag on sdmmc IO lines
>
> Changes since v3:
> - Set GRF bits through the GRF driver
> - Drop the rockchip,sys-grf phandle

Patches 3 & 4 applied to the pinctrl tree!

Thanks,
Linus Walleij

