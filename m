Return-Path: <linux-gpio+bounces-29911-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C47ABCDEDCE
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Dec 2025 18:46:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2ED71300663D
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Dec 2025 17:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A4DE227B95;
	Fri, 26 Dec 2025 17:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AmI/6adO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4925F7E0FF
	for <linux-gpio@vger.kernel.org>; Fri, 26 Dec 2025 17:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766771171; cv=none; b=I0yeGbJonFUXFpyt1KcrJoV+flBjCW2Gldrfs6le1qhEaMVAvtFQjz5iLuvE3cxqInzxrC+kExv/aUxqo5uAToxnn5Ei46tsT39rRP1BDnIAJ22Rcrk+Ry/h89iVK9BLvmIC7LRhX6YGKRIPW+Qfn/2ciW3ivxB4P/sQl+WebQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766771171; c=relaxed/simple;
	bh=yaWWygL8WsP4cVvJT6R3siyfFYnRS5lDtTG/t4oXvO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XkdAlPixJww90scLiU/Bl+iY2Ygi72Z/5zIlSEt2Hi2x1Si0u/pJU6wVPYc04Krh08htUFU/0oolnoN4/99hIDTM4+e0vF7jq1AAEhfVZbFWouW8+OGD3My8mPClxOXzO8SZ1bLopJfFYRj4dBHBwPdp4bArp9WgBDgrVrwYtIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AmI/6adO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E432EC19422
	for <linux-gpio@vger.kernel.org>; Fri, 26 Dec 2025 17:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766771170;
	bh=yaWWygL8WsP4cVvJT6R3siyfFYnRS5lDtTG/t4oXvO0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AmI/6adOPlKtoWCWqKZe5yJ8oG3l7QmB6BbKWw9PHiLE4tV6bO6ppPs6EZc4/Mvo5
	 BjWFzvBn3Qb+2938U+x2In324OewndYjEoiGA/Hw5Lu/asj+hGzh2cw64zgT7fE4/u
	 U/n2g3PR+kAcRcNK7qFD+pdAZr4pwngYfob6YN3eD7/S/ulXVd5Rnl+Sfj+LvhRFSg
	 nGuEoUds1QWt16egeOkTcuQVERlbhN7u/q3mpxsPxTWlCJTsfc/SPGD4dNKcGKsOZI
	 7Sj1/m7i30EuY3YG84OmaMZArKg4RaWE1y6BIuUKyZ7mb/7fl7maX3SxZ/FpXjkRaK
	 IwWMLTZ/mE13w==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-787df0d729dso61345167b3.3
        for <linux-gpio@vger.kernel.org>; Fri, 26 Dec 2025 09:46:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW+149Wi2478tCZ5Vg+Zq2YxuClAe8EuXdGb+slNCEYrdhNcnapvv09lpglLo9A/msqcoIZ1+z8XXjb@vger.kernel.org
X-Gm-Message-State: AOJu0YziuKArek7DHZnQSiY3iDtzpdWsGQCSZHAzh4CTMr6sMtkO/OcD
	XsSHBsu1ubY+Izh7B6jRVJI4aBM0jGdB5RuzZcGJcjU2CgVo/Hg/3HgGZUjAHB+n5n/cZqOpwZi
	NI63q2pe226DtScwM3+AvSZceaFhUSE8=
X-Google-Smtp-Source: AGHT+IGkQ6XUIR2QS+jzQzwyb+uH06UnhoOZauP500HEuu+uE09VYZhz6TrKU/N7A068s7lGjbjGraZIx3VxSmvZI40=
X-Received: by 2002:a05:690c:680c:b0:78f:9854:2603 with SMTP id
 00721157ae682-78fb406ad93mr234198697b3.28.1766771170211; Fri, 26 Dec 2025
 09:46:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251203-mt8189-pinctrl-fix-regname-order-v1-1-16c8ff5490a7@collabora.com>
In-Reply-To: <20251203-mt8189-pinctrl-fix-regname-order-v1-1-16c8ff5490a7@collabora.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 26 Dec 2025 18:45:59 +0100
X-Gmail-Original-Message-ID: <CAD++jLnfTdN7Wwa+a-ze2112vkMPcTtvEUoOZDtu166hu4DP3g@mail.gmail.com>
X-Gm-Features: AQt7F2rJr7E3FC3Q9d909t1YtxKsBcuUtJWHcYVrXihmnvhQlQW_9VrzDPk4caM
Message-ID: <CAD++jLnfTdN7Wwa+a-ze2112vkMPcTtvEUoOZDtu166hu4DP3g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: mt8189: restore previous register base
 name array order
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kernel@collabora.com, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 3, 2025 at 12:33=E2=80=AFPM Louis-Alexis Eyraud
<louisalexis.eyraud@collabora.com> wrote:

> In mt8189-pinctrl driver, a previous commit changed the register base
> name array (mt8189_pinctrl_register_base_names) entry name and order to
> align it with the same name and order as the "mediatek,mt8189-pinctrl"
> devicetree bindings. The new order (by ascending register address) now
> causes an issue with MT8189 pinctrl configuration.
>
> MT8189 SoC has multiple base addresses for the pin configuration
> registers. Several constant data structures, declaring each pin
> configuration, are using PIN_FIELD_BASE() macro which i_base parameter
> indicates for a given pin the lookup index in the base register address
> array of the driver internal data for the configuration register
> read/write accesses. But in practice, this parameter is given a
> hardcoded numerical value that corresponds to the expected base
> register entry index in mt8189_pinctrl_register_base_names array.
> Since this array reordering, the i_base index matching is no more
> correct.
>
> So, in order to avoid modifying over a thousand of PIN_FIELD_BASE()
> calls, restore previous mt8189_pinctrl_register_base_names entry order.
>
> Fixes: 518919276c41 ("pinctrl: mediatek: mt8189: align register base name=
s to dt-bindings ones")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

There have not been any comments on this so patch applied for
fixes.

Yours,
Linus Walleij

