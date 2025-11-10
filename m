Return-Path: <linux-gpio+bounces-28335-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F41C49C68
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 00:35:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1CF93AC6BA
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 23:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 919742F60D1;
	Mon, 10 Nov 2025 23:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nV128Xrt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B8523AB98
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 23:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762817699; cv=none; b=uP8d8A94qXhmBEvfHEqSHhghMGcGpUZBh+IQsf/eQOeduMKY5tj/U6mrPnV1N94UMNp6ELynTvINDuBp8FBww0C4n342hGy3AzeYiXKe+98xb7jn+aKw/P7OLsFxx8GhS1Z7iW8McxtghvpYbHemgEVIBtZv774DjCT4H7CBCyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762817699; c=relaxed/simple;
	bh=yhp78e/c+JzJpivrf0ZSW9REEjpcgf8Be2/rchU61Pc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sL2hWTxCYwHNIeJiMt+s/CEOKD9PYhqd6iMGBZYWrhKDIz0GQNirhoatv4nxqFyag0mJV/7YIOxN2d4enN0I97Pfe3cJCv/x3gieEsA0kmRxThLkHM1nvEZx9GjSslpY0X6fJCfP5Gm3rRbw15rIML1yycA6fWf1KE0TxZsIIHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nV128Xrt; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-378d710caedso30494011fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 15:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762817696; x=1763422496; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhp78e/c+JzJpivrf0ZSW9REEjpcgf8Be2/rchU61Pc=;
        b=nV128XrtiQu3m+ZCh/Z1AscSVrL5nIRwaM/0020FbtxSV3q/nBNsCxpmVy11DBqrEI
         DpGCOnAYhVDbCOuxXWbbvU++f4pDYpW+GLDENxtgYlefX+cIvZ9sW2RTeANrj5jsSLFP
         ZVb0JYXQuZSz8FrLvuyb255n/QvrLVU7FcQ1zKzag0MOchYE5kJf/Stm91OAfdsmGiRh
         3p7P8+2++pq7r9QJ04PUT24KRCJg/pTP51UR8FUD7VYh6KHZBdycgaXrt8zAOmO5Yur9
         S3ja2s9p1Wa+elbWjxo4/8ExY+ffSKeM7YCocHSr6Tub/GPuiKbKVZvPbQd8crShZhNv
         vgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762817696; x=1763422496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yhp78e/c+JzJpivrf0ZSW9REEjpcgf8Be2/rchU61Pc=;
        b=m71OmXMrf/zzY3tLJ2Jd9QI1Ewzw1Sm3/Cexob/KzpLOXkLAGCJ5+FCQkeLbAXuxJ2
         M2WZW7ML9odmPI++fEpW/snevg1LYF9X8liAIA6yrM88FtdwFUPgpEB84HSVHmVRRlFh
         0fTuOLsw8Jzpfl0DJXE3eKfl7TotFmwSsyBa/8M3E35I39RVfBJz8RHX8FpAIj3dE1pw
         k4MUAGYIC+b7KbVPQxE9kZ/JeFlE3v0orw4KUA1wY8ZL53f0uxMg4pf78Ke5Zz/PP0pn
         ktyni2cRQtPVoDnF9RjSth3aXzYfq/mux6FETd9mIiPv3OeJpKk+eJkgJUkODp7x4M5p
         gcFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWiGoWkY1AwqmIUJf6ozuTZlJxUHz3gNtT3sD/D2F2QgQXHGRi4t7HloeVzofFACclHr1g0a+d1ERS@vger.kernel.org
X-Gm-Message-State: AOJu0YyO0N4IUsc1+MDCNB2Yxlv++7s/gkYB2ksVhpWr2I0m/oUVw0uD
	Xb83cmqudyamR1DyvpWs8I1HkBL+n58cIMECKwkBCitkmU8ScS23bKZRRCiMTJL79CrhgRHHj4k
	BdpFQqiRP13X8gHTI3+oQlG8mhdWWf7c2o9ujKP+A2A==
X-Gm-Gg: ASbGnctNtdVLp0RoInsVhVhGMK2S/1PJWYVcIcpJV6q1KxR8JwbsFZwIlVoTLkoNSeS
	yfwdf2beM377rl2DYwzuqZDs3siQYYibBNDRpYi0b3pzLyayLNI2elOubxkPJzW5GzYXLJfLujn
	oXoKFy8o7egn1IMcWSxVo6pc6eerKBGrGkeVZmCklrA7O7B6HBKRy7fEL7mFLVjFO0Yrg6lq4gg
	KEXYsD3n+5NtKm8EkpKPZLarUTAACZOLuuzY3mlETJvGC1Nodp8RyHgMtoWdvzWkG9sdT8=
X-Google-Smtp-Source: AGHT+IG82Mi1A98FfG7yJz0vIc3+2ARkilByhg2O+8Fl+qHjePdN/o/dGr8Q9VvGwKtcezeBk+2GUuqJSQeCVKslfy0=
X-Received: by 2002:a05:6512:130b:b0:594:29c8:9ae5 with SMTP id
 2adb3069b0e04-5945f1e54demr2482118e87.53.1762817695621; Mon, 10 Nov 2025
 15:34:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251105195007.199229-1-linux@fw-web.de> <20251105195007.199229-2-linux@fw-web.de>
In-Reply-To: <20251105195007.199229-2-linux@fw-web.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Nov 2025 00:34:44 +0100
X-Gm-Features: AWmQ_blvjYyNcyzASnRUO_VL5niJ7bbXr0Fy6afKuC--gzCCa6ihk2uw5R5x_5g
Message-ID: <CACRpkdZ6wJGRhobbTxvm2ZstHA=P4gaUsqvdm3_n1tKqWJ=50Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: pinctrl: mt7988: allow gpio-hogs
To: Frank Wunderlich <linux@fw-web.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Frank Wunderlich <frank-w@public-files.de>, Sean Wang <sean.wang@mediatek.com>, 
	Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	AngeloGioacchino Del Regno <angelogiocchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 5, 2025 at 8:50=E2=80=AFPM Frank Wunderlich <linux@fw-web.de> w=
rote:

> From: Frank Wunderlich <frank-w@public-files.de>
>
> Allow gpio-hogs in pinctrl node for switching pcie on Bananapi R4 Pro.
>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogiocchino.delregno@collabo=
ra.com>

I already applied an earlier version but it seems identical.
Tags were picked up.

Yours,
Linus Walleij

