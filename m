Return-Path: <linux-gpio+bounces-28336-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7B6C49CFB
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 00:47:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 47A524E9081
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 23:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C020B30498E;
	Mon, 10 Nov 2025 23:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zvip/Va9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D194B303A1B
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 23:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762818423; cv=none; b=BZ88Nj4yKkvB16wfoxa1lRPnyf4yBro0+7/RNo6msKvIOj7Mwr/XSu0JykmzjApyoOWT9vdu5aPjS7ZJCGdsZtb2uZ2VOleYOJbAzLDqEPpKf6jRInVUF0+6AKxzNUdJo/jd2qsbL+sjStK8S94AEx0mhrSrpWoqA4NluqL90Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762818423; c=relaxed/simple;
	bh=Gc4vjWJyen6pi7OfvcExBoeP+RP69p6S28dmjIeZ+L0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZLTBYUT0GfqUn40NNdKgM3URGRLfpcRUAlB7bXUUcy/Qv2zWhjj3sGrg/IulX2Q2NWJ8CHuhHNyg6qVa/+qRPmh3baUxESOkS7xhp0fOz44Y/6ewyQ16/np9iY7ixR6c3HY5JSZtAHl1/9+anEYy5mC0HEB1Vz3AqG5A1EHh53Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zvip/Va9; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5943b62c47dso3216750e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 15:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762818420; x=1763423220; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EdSyniY2TEhD2jr7Knryt0myief09VrFFo+8PkG04XY=;
        b=zvip/Va9Tf5Mzcx16SLrFEczDml/xLoOJF9tB8F4J9DB8F5vTG5LLSU+CfnvwM4Fey
         HhF/Fkprp3aESsrVQW1jaMhkpWHveNg7QnsOUvFrMAaX0VWpkovkdvZONp19ypAkMH7C
         QiB+Z7Ajp1/CgpkOnsAbNmptERySi5Wk4QcWp+lkrrFl9b9X74RNL4Vl2IChbvUOpMX+
         NDLdVJRUptwuk/y9Ltvl4CNC1gO4ILPTok2Nxs92GslOBmmU4jT/Fu+nRTZIa3NFLljF
         jdLK9xSmYv8DK4IACVUAUh3sC+3UO859goZ0I+Fy1d9Vxwa4HdhzYE8bsoB2Vy1quumN
         k3aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762818420; x=1763423220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EdSyniY2TEhD2jr7Knryt0myief09VrFFo+8PkG04XY=;
        b=Z2jjBswRFBkqvtXMHRZzrNoPCLIbka94SEe0pkrCs2zOOpKjHbFex3E1FwK7sD47im
         FY/+V9udVL/nEVfIVtdaugX57pLHTM3VE88RcjlGsUid8aQ9dNv74JQ4UWCZw3QqECRO
         SrrE19lBQ3lOo6WptdLDI4+3fdXzdjHEMannmDc5MpLkpcY8J4CcFnlPycP5A4aIL/vg
         92qy1InWEw/zefZ2KrVuR2+WUZKL6YlS4KnAHd+76juGNSJ7JaTuO7pxsDKrLLi2N+NN
         btSJFZqIaaqN9zJs1rd4rNVIgTnMWfvJkavS8SN+Cf14LcHTSjum0f35ii7ZipBvI6M3
         dI9w==
X-Forwarded-Encrypted: i=1; AJvYcCUxe56Y34cCTxVUTU8gvim7UQvDN2ioJyQS/CrV7r65ku98kPaP1ZVXLyH+WPFkn2x3J2Bwo+ADj0pk@vger.kernel.org
X-Gm-Message-State: AOJu0YwsdEavIiJTLzjG8p7+e8hVpWWPiAF8Wpg9WBf0AIcmF+uogDDR
	Ytpqde0Uyvc0wM9pSPS5qviX/lNTu9xX7gmqStXEqaSI3T5vlwqdkem/RR2ZSykrI5JpC3IzpoT
	cj7SG1MoI5U5d2D3u7k7J0tgaJZ4O2bYFDHDCcRBhFA==
X-Gm-Gg: ASbGnctrYkBobVyVgv2KZqWtmYwAIEzEadw+hkVDcIX7tIA6Rtw4BSmpLNYOSeGpSQF
	01IWynE+JgXe9VHxaBecshLcXb6JvGS6KEhpGeUOJWDZfi8kqP2uuJMMLmyRmsNBP6Hf3K1HW9w
	roq0Sn2/6qcLyWGuSmZgmPyF1gGv9fsMkmJCelMVD0NMyksO7BzO0aI6yTUlNYh8C2veqls7ygr
	lHkcB3RmWAdkNRlHrj17umAF9MBlaXD/IkY669AZhN0LUqiEdd7bNpEq82djUYi3JyT7yqjqDjp
	8U6brA==
X-Google-Smtp-Source: AGHT+IEYlHtlcaIbYzh4uIcS3eRGPuN1bn7uG7yYIbKkIFRYhenhwAQ61nxtn9INckW1qFWU7tGOevIpEsnyQ+lU0tE=
X-Received: by 2002:a05:6512:b96:b0:594:5545:b743 with SMTP id
 2adb3069b0e04-5945f1f4346mr2601951e87.27.1762818419930; Mon, 10 Nov 2025
 15:46:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106235713.1794668-1-ansuelsmth@gmail.com>
In-Reply-To: <20251106235713.1794668-1-ansuelsmth@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Nov 2025 00:46:48 +0100
X-Gm-Features: AWmQ_bmWEn6D47GtrYlRXbtf5iV6J32LnDgS7NEk87vjG42kQgZzdgtZdTywXVE
Message-ID: <CACRpkdYOXSm5BaHgij_=L32kq+fkx_ggSJ7G5a=064FDvMR4EQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] pinctrl: airoha: add Airoha AN7583 support
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 7, 2025 at 12:57=E2=80=AFAM Christian Marangi <ansuelsmth@gmail=
.com> wrote:

> This small series introduce support for Airoha AN7583 pinctrl
> support.
>
> Most of the changes are generalization and cleanup of the Airoha
> pinctrl driver. These are needed as all the array in the inner
> function were hardcoded to EN7581 and didn't reference stuff
> from the priv groups.
>
> Everything is changed to match_data and priv struct so
> adding AN7583 is just a matter of adding the structs.
>
> Also the schema is generalized where needed to address
> for the small difference between AN7583 and EN7581.

All looks good and bindings ACK:ed so patches applied!

Suggestion: since this driver has:

1. Exactly one group per pin
2. Use some accelerated GPIO operation, .gpio_set_direction
   in struct pinmux_ops

Have you considered implementing the new .function_is_gpio()
callback in struct pinmux_ops to tighten up the GPIO strictness?

Yours,
Linus Walleij

