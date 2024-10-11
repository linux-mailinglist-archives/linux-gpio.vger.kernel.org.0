Return-Path: <linux-gpio+bounces-11220-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE3D99AD45
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 22:00:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E1AC28239F
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 20:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF1A41D1310;
	Fri, 11 Oct 2024 19:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EHziWnCM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5011D12FA
	for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 19:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728676782; cv=none; b=IOd0iDra5qAPU7GDP/qeNFaQU2Hu5UxvywE5HJZ7CyC/8kN0MAHtqnF5xHKbkGCuE9IjgozSrk9DGFA62Kup6LbdQF2dQgu5zNBknz5+ED9NFJz5aXM6h3PQuuOKvv7AK5ACvBzjt6a+CTVLPnwcrUPJ14A4aHJNKTGaiUQLunQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728676782; c=relaxed/simple;
	bh=b3t/6WlSF/m01dr3JqwvO6A1PNlbPysSRIdrRHqnmAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XiOh1tfM3pHD5gFLzEBBWSc03XN2iU/RoYoOrcHkDfZTm6OOkTFZ79m1vMC4ycUgov7K+uurFxzEEBa7PM+jM8vgQ+pTeXJu4B7dTTNPAPqsdiiT7sxuv70oip6k0Zn07PWF8+zx2+m2d5J5t+3MER1O8aBg+L6Xyq+OJG9kT0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EHziWnCM; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6e35fb3792eso4217547b3.3
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 12:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728676780; x=1729281580; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b3t/6WlSF/m01dr3JqwvO6A1PNlbPysSRIdrRHqnmAY=;
        b=EHziWnCMURu34idNgNXQl4xyRVcddHTweLctXq8iK+REnwjG+In+bNzFg46FA3Au2C
         7xGhtXVC/eujF80m2u/SpW34juBEq2HGbHLRWoJX2U8SqKWFNU+//VNze0g6Zi5oH9KJ
         UmNC6AHvUy5nMcGnasgtugL4iQ6eqMZX3Yvm/PlUgd5fWGRrPc5W4CRpa4h8lX8HUKzS
         7BhQSdyNS870ZjMtOIdCQGKNQExRVgyM4KvW1wrYEA5iIdhmvT3xxE/mowLv/W0Vn7Ol
         7Vvl6HGUsd3VmB7rTeJM8K762xrlsy+Hf+DsCu2axpZ4gCX6i5cQyOhk+SLljVT4StdP
         VnAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728676780; x=1729281580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b3t/6WlSF/m01dr3JqwvO6A1PNlbPysSRIdrRHqnmAY=;
        b=hYPlU/zw95+9tX+OyPivgPzGXIMDGNC/mDZeZUBXCqvt9j3daOF//QTDh+6ykmT2fa
         AyipqM2amQzwDbKxzkz7efc6YlE6ZdunQ8e2vJS2COfeyyj9ANsff87NMnzcOpMTnTdM
         Zes8A0C/BteS0mdBATIjVIRoZUSwrtQweRoIo32//Z3935OVsYghCoapQ2mNFccQgEZJ
         krgKJ52chBtEmchiRIkI7JH9n641Fy3cYxN0ffrfEWSSwsuCczzlhwfJLEm0e7HGwwZc
         q6wf92IqNuOs4NkKMZk//81HJsMT8d+OLQJ7nbzodn0s0MlFzB4ZsuuT1FAJx2A30D0p
         0FNQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5EU1VzVL15HiAAYfDvOYA9OV+CPjvVl7l/mfmJcZV1YcQbCaasIAl52MUm2iWXk7hxEt2YDOKlxQX@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl/Eh/dnco2Mlo1Bl5WufkS57bRptuJY+an6BDJwmiLYViShQ1
	qViqYwSn3fSM9Vqq3XoLgD0i4DxvgVl8i9n9GY20ciRQqOfipkKUYj7Iu9PTsRS9mLn7z7DzqdN
	/SQVhyF4XL1iyEzroXUr3GSTYQDL61mXitcDiqw==
X-Google-Smtp-Source: AGHT+IHjM2GvHz3Aq3fHGIQKpV063T+kfFhYOorOlX0bt74yIAWxcubkag8mG5yY3qwwQRASFB0kIRqgK4TTo+XYaUs=
X-Received: by 2002:a05:690c:5608:b0:6e2:ada7:ab89 with SMTP id
 00721157ae682-6e3479e1d7cmr37079067b3.26.1728676779984; Fri, 11 Oct 2024
 12:59:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
In-Reply-To: <20241011120520.140318-1-y.oudjana@protonmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Oct 2024 21:59:27 +0200
Message-ID: <CACRpkdaWZ6R4wtTs_YqzbhSrUyfOCqd9tGWFP7dZTqp6v7ijzA@mail.gmail.com>
Subject: Re: [PATCH v6 0/8] MediaTek pinctrl DT binding cleanup and MT6735
 pinctrl support
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, Andy Teng <andy.teng@mediatek.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 2:05=E2=80=AFPM Yassine Oudjana
<yassine.oudjana@gmail.com> wrote:

> From: Yassine Oudjana <y.oudjana@protonmail.com>
>
> These patches are part of a larger effort to support the MT6735 SoC famil=
y in
> mainline Linux. More patches (unsent or sent and pending review or revisi=
on) can
> be found here[1].
>
> This series adds a driver for the pin controller found on the MediaTek MT=
6735
> and MT6735M SoCs. The two differ in the last 6 physical pins, which are u=
sed
> for MSDC2 on MT6735 but don't exist on MT6735M (since MSDC2 doesn't exist=
 on it
> to begin with). In preparation to document DT bindings for this pin contr=
oller,
> the existing documents for MT67xx SoCs are combined into one in order to
> eliminate duplicate property definitions and standardize pin configuratio=
n node
> names. Necessary cleanup is done along the way.

Once Rob is happy with all binding patches, my plan is to merge all
except the DTS[I] changes to an immutable branch in the pin control
tree and then you can offer that as a base for the SoC tree if it's
needed for the DTS[I] files.

Yours,
Linus Walleij

