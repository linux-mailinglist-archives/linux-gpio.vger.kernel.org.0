Return-Path: <linux-gpio+bounces-12965-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB099C713F
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 14:47:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 142FF289C53
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 13:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4258D204093;
	Wed, 13 Nov 2024 13:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sr3hiz4L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F230A1EF95B
	for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2024 13:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731505497; cv=none; b=AF/gHzzy+YJuTZzTN/RNyP3JK2INXwqPl9PFJ8EuNWzHmg+gOfIBw9EUdlR41M5qH5jBzjNTqt/OA91Us66NBCV7X3djDHkyqBF5CbWncX542cKiYDNLgIb6rw509y/LQ9F+wOjx4aSbgUQYjFJsNbzGxf3LE0you1ysSFsA0PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731505497; c=relaxed/simple;
	bh=ps1gyRF4sV/jPf5mXq5CfuoualCziyGjdNljGcpAjsM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZCuCzfgpETVFjZffVseR2GE981CXO3csYDaTbkeF9LkYiOPRRMPqPuyMkI7NQ5JVKx2Br2Wi/z1RNl9/TlQOIvV7n3W59q+MnlbWPHfoMbVuN76ki7OTMFKBr9qhGNeuJzFiRPCVwYj8LsIkPhRLjxZN5EVpAjvxJOqiVCTCUA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sr3hiz4L; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb50e84ec7so47086181fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2024 05:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731505492; x=1732110292; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n8EhfYVRnnDaaDgm96KhczVA/W2i6QYF4ETYO5Uyxvg=;
        b=Sr3hiz4LSNME5W8AzoJ1HlE/P19gGYTPw+FXLvBWKHEJ+nz9/hytjT/ABctmUGdp0h
         5g6edP71Yc6vDKSwFP6J3JpAAPWnLTMEATu9Z+qYj3QUBgr/DReHyYQ4aYOHozjgy9tG
         HJW91gm2wDGvjzCsk6BW+7z4m9Fdwp9/GSkK2xp1JtFYqWBujRbcDH9XL2arv192ZLJU
         rKKAg6nF/qm19f+imMtmGdMS4y5lPg8BRUfOClCoewhjc6zjjTwjWA+CuZFa6kDY3kuP
         8YXDI/xZLlC1Q9TP0x9WmglCzwGs8KLAbNmYk7WD3PrLFb2n+Az7ppOorwzku568UV/x
         wi8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731505492; x=1732110292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n8EhfYVRnnDaaDgm96KhczVA/W2i6QYF4ETYO5Uyxvg=;
        b=IWKifLBuyJ5t5wKYxinKqli9DCW+ewIAr8YqhSDNrTZAeeunKSGYSbqPsKHmHJuiv7
         Rzq/9QVF5mNHlIbqXAwRVlrUXg9fll1y5O80RyyjCe49aJqXnjGHCFVkwPlYQlLI+Bze
         6R7nGfQ+LqMNqRMhg0Bp8HFXRid7f7fB70+PJAeeSlQQy+xzCJyOjU7Ol2r5SYm3k4Jk
         kBLUFBQNbT84q+FlK4w+OyRJd5QgnrWkQM9XKhEawFHoDiAIpMLY/b+/uhUbgDszk1Cv
         Y6k9L8GFgLMRigfabzPEy5PAPr7AVxfgbLvTFyb7iihe9d/vc3RpSY095lJvwIt0T//B
         WDJA==
X-Forwarded-Encrypted: i=1; AJvYcCV/0BI6fSoeZuttEjq2H9u/IrAEA3wadeBVHA5UkZFWQquvU9eWzBGOjNUFyU2WSnjQ4n8vxznI7bWz@vger.kernel.org
X-Gm-Message-State: AOJu0YwjzCflT4dsLz0jl0xLoZ6lMlHs7uXH2QjUaM/Bwzt3wllUTrrN
	WDPSxrWc9p0bpECE9SxBxL5VkSXbRwMpZH4woKHTOuCaak/z68PQrdixyBZAno3CVaTNKT3CHhM
	qgc+9w6qqlwO9DGQO3lUxjgYijSs+hQIvmIYMfw==
X-Google-Smtp-Source: AGHT+IG+b5aWSuZA3i2xX9eloxv3604GVUnlQQDb4BSsgZiEIKgWWJy1Jg5YtPgwVqZ9JZiAd6sMw7fi49j+Y5nheN4=
X-Received: by 2002:a05:651c:1542:b0:2fb:5038:3eb4 with SMTP id
 38308e7fff4ca-2ff202686a4mr114192251fa.29.1731505492020; Wed, 13 Nov 2024
 05:44:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241106100741.173825-1-y.oudjana@protonmail.com> <20241106100741.173825-8-y.oudjana@protonmail.com>
In-Reply-To: <20241106100741.173825-8-y.oudjana@protonmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 13 Nov 2024 14:44:40 +0100
Message-ID: <CACRpkdZBwSBD2ueM=5zZX3wBxxd-ZJoEKS-zTq5fuqiKOSu3mg@mail.gmail.com>
Subject: Re: [PATCH v7 7/7] pinctrl: mediatek: Add MT6735 pinctrl driver
To: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Andy Teng <andy.teng@mediatek.com>, Yassine Oudjana <yassine.oudjana@gmail.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 6, 2024 at 11:09=E2=80=AFAM Yassine Oudjana
<y.oudjana@protonmail.com> wrote:


> Add a driver for the MediaTek MT6735 SoC pin controller. This driver
> also supports the pin controller on MT6735M, which lacks 6 physical
> pins (198-203) used for MSDC2 on MT6735.
>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
(...)
> +static struct platform_driver mt6735_pinctrl_driver =3D {
> +       .probe =3D mtk_paris_pinctrl_probe,
> +       .driver =3D {
> +               .name =3D "mt6735-pinctrl",
> +               .of_match_table =3D mt6735_pinctrl_match,
> +               .pm =3D &mtk_paris_pinctrl_pm_ops,

.pm =3D pm_sleep_ptr(&mtk_paris_pinctrl_pm_ops),

this is why you get build errors.

Yours,
Linus Walleij

