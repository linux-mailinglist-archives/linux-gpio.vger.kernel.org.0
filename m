Return-Path: <linux-gpio+bounces-18912-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A1CA8B1F7
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 09:23:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CA131904A1A
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 07:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B42322D797;
	Wed, 16 Apr 2025 07:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EdPOO+ei"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDFE22D4F9
	for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 07:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744788170; cv=none; b=KWgchTpH5SpN2LnR1YDhsdBt6I1UXMavaA3TJJd/UznkCO2ZCxWVHhoYukb9dccGA0PUzE7/onpX+SiBje3xOEi05+haEnmYumFsjxy107xlAFIvargxu/I54N3wW4/WabdqdQkW9+kx5D3sEQScLEGn7/MjD27Ow7g7OUrv2Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744788170; c=relaxed/simple;
	bh=6tPzTMhBIP4Ztm/pamoA9E7AfPXNf+05fR7f70iwjcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UXh5DTrrMDjQAEFXZ90zHxDC+6guGYDot9QITEXDYRsMPXTZUXSydado1+yX/+ufQaCO+kb6heahvDi29SNnhvslYAoh5nbKp0aS3klqJKwjSWaoqWmtWyglhI+HfAX40s8vUUiDVEYNfH6PKUoP2r4XrCahhSyruBauV+p8j+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EdPOO+ei; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30bf1d48843so54921431fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 00:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744788166; x=1745392966; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWD5DtO8Zmjj8hm/jgNeXXYBfzD9O0HKgWcyYm/pe+g=;
        b=EdPOO+ei2bPpqPvFGSAN5GkWEPL5g+w7K0Xg3ZtOd0xDm7VqxWZgXKJC2or7VdY8tY
         S3PSICLGT8C3k7syA6GtNAtVh+xacMzsXIN9Kjl6YKmKTqk020PDS/b+idXA61pmGDT/
         gUfMPPIn/Ohg18u1+R3fJdy3KlKH/SNiXjmBlfT4K4/zpDnBhdsCR8xqsgpI8VcUbZvH
         62Z+pgv4uFDP0ZYnR/FBvxbl1rgPAE6pCxfySCvSWCKpLWAoKDD6Xvo1DMfKzP4L9WN0
         mRnkvpdTfNylZUQU32QFyP3PZl/CzKfcjhQ7yNpTSdv43CWgkkZUUWBccTza4/S7+R/V
         5UKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744788166; x=1745392966;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xWD5DtO8Zmjj8hm/jgNeXXYBfzD9O0HKgWcyYm/pe+g=;
        b=jWVeC+c0GI2IxOiInzihnacbmRUFFZ6ULLTum2vJrpsshjqHz3yZXrelfqsMe8CrKW
         NsZ/AdUD5CNGp47lnLDx/wZRprX7PJ2SJCCCdwceAj71Sql5n9trp9g3zy0wkKXOwcpY
         MlN8emQeP7RtH3h2esHGQWSH7VNbK8MzvbkRnFZgGTi967Ti2oXxQMMJNL2jNJsu7hpd
         K19ihJ77f+5gb/gRCuLHKtLR1cv7oof/YSPSOkURpScWeUJw0YmyTi2zaXM31wUewSFc
         MW7H2Dr8g4tibzL1TvzFI65J5C3QPPJSY6nfxxxOOZvm5xJFEQidSWETfEwdZOP6ZQIi
         X/sw==
X-Forwarded-Encrypted: i=1; AJvYcCX64NZVyOWdUihrB+mdlsVUn0vt3o0EGNQ3q5tVUPFkFsi5KlCBUyHhTrO6R5XQYhKaiXsAEjevrxHi@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8nDuzWhNFAVa6xVFGsdwJo6NeSFBhrFBKZgl6G3TPeQHD4ORT
	Jw7Z30f2xOzji0vWZ+AUj9lnnMtNQDZoIA81QpDRxcdd5flIyYN2u5pey4HIzKhX0yHppUngnCZ
	vPb+Kzd2mlHs7eYPF1kLu6HjpxAIv9hiOGC0y9A==
X-Gm-Gg: ASbGncvQs7QIAXxNMrOAzyBF/O1dAiWAQokGHXr7gVC42iNZ/2p2Tojcwpu7wPBe65k
	drGcq7jzKDkO2K3QdezcoskF2Ox6cJnoXTuT3FsOHsce18itHnv02gQa+Wz7bldFM4fIdbk1moE
	jHEYZZtI8D/GlHDIESi8WckQ==
X-Google-Smtp-Source: AGHT+IFJzy+zttruUfUSE7DAKwZxb0lvHyIXLpWKETv/eqQTmvTOtmlAPv2KPiXrE9yHLzHL0bc/wktEHBwODzsfibQ=
X-Received: by 2002:a05:651c:243:b0:309:2ed:72df with SMTP id
 38308e7fff4ca-3107f6ceca2mr1915221fa.24.1744788166445; Wed, 16 Apr 2025
 00:22:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414090215.16091-1-ot_cathy.xu@mediatek.com>
In-Reply-To: <20250414090215.16091-1-ot_cathy.xu@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 09:22:35 +0200
X-Gm-Features: ATxdqUGunV3YCOGXGIOJ9QSL-oTOhWVqzDgVFDf8RsYkNrat6ruPMmmT7W9km-0
Message-ID: <CACRpkdYUqHzid4Rnuv4arC9wu9fmpcGR22Jc5JzJhyr7fABMCw@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] pinctrl: mediatek: Add pinctrl driver on mt8196
To: Cathy Xu <ot_cathy.xu@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
	Lei Xue <lei.xue@mediatek.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	yong.mao@mediatek.com, Axe.Yang@mediatek.com, Andy-ld.Lu@mediatek.com, 
	Wenbin.Mei@mediatek.com, Jimin.Wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Cathy, this version looks finished!

On Mon, Apr 14, 2025 at 11:03=E2=80=AFAM Cathy Xu <ot_cathy.xu@mediatek.com=
> wrote:

>   dt-bindings: pinctrl: mediatek: Add support for mt8196
>   pinctrl: mediatek: Add pinctrl driver on mt8196

I applied thes two patches to the pinctrl tree.

>   arm64: dts: mediatek: mt8196: Add pinmux macro header file

Please apply this patch to the SoC tree.

Yours,
Linus Walleij

