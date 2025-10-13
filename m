Return-Path: <linux-gpio+bounces-27025-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E29DBBD2BB8
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 13:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ACF9B4F10A8
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 11:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3B6C2FE075;
	Mon, 13 Oct 2025 11:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o3ofcFc+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BFF4C85
	for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 11:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760353766; cv=none; b=q+7Urm27VrFBraXZE6VBk3LbLE6rlU5iTtbqY2knjh2S/HsUgQ6TcBtGy+Pfb5CsQ4gg/Tr2YR5VcA5BpPDh/O9UCLNZDKyzTHgsElN1G/Kpul2uKyngPI0lhW4ga6OMmuYl7Bf0Wrb4ZK9OOX8Hnl3xA84ZLrkpUXAZZ4rISd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760353766; c=relaxed/simple;
	bh=MpT6hXn4aVzifNN3nBALGbtn4EidYShjvQJLlFyRGLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nMEN7mWPenV+XYLgHhsW/xYMymYQZHToSZMv9OhD/ROKv/q+Q+OYsQUFNVhyGpcMcKKVVT3qUB+dYcK4p4/lSNEqMcjXWorfrdjz2iyBDqehtlXyFG2JlNwT7eflrxvudmaPn2dnbHSCVoD7ZVn2S+oAQE0bavQySGQV16/Gq0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o3ofcFc+; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-363cb0cd8a1so46284351fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 04:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760353763; x=1760958563; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MpT6hXn4aVzifNN3nBALGbtn4EidYShjvQJLlFyRGLc=;
        b=o3ofcFc+DdvBgK8rkMPM9JgYFKADSjoIfLneIiwLYNztzbRn4ynCGA8FXmTFrhbC0x
         ubpvDNhqJfyfEAyeyqrijPBwNIwax7Uu4nzhsRIPd+C1ttg5y/x/8QomgNuWmptXZZAC
         1jidbbhefQYUF48fJWnJYjH9MIPblQww8c4V8fZOHhFxmKJkAsN+9/JNrCULJQPwxURZ
         7k2IywOvJ72gJa2fBwEesr6iqhBCym2xWn/OemzH2palSMXygjz8iUEVPKIQTcSRUIVp
         YEGgRPCieDFKGLXq9ohGRXKe1IcKT/YiuUWD0KcaTXq8Dkb2al7rwvP1txrs8qKHmvjR
         hBHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760353763; x=1760958563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MpT6hXn4aVzifNN3nBALGbtn4EidYShjvQJLlFyRGLc=;
        b=hlkB0WiBI1EHSRjATol1WA/JKAQkflaq4maco8cB9JjoFQZOIX4nL8BjwU8aAnZVmJ
         EOHzbiD3dfOEh7F6tQQBXIdsmQPI7j5huynyYMr76OaWaupwoMFwVowkMfJGA4tNfB0x
         tiYJeZzwRdvesQUwGzxsCCdTBMI/+6V3P/WNlCL+S6Z9CGlRzlGuKvRzx/XTdd0X0+5+
         agYP7aE6TrkOAw3mvuoEiSI9DOVs0o3yDn1MaRDxdkkNt2mGJhDNBQ4MFiT3OIc0CUmW
         jAQqAJdzBcv3B6+/PgDRQQ0WiN9I6NruxPwOcKM6LjgEPXCfv9h8k21dNq/JhDosw1SV
         HtQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzuVhYoiHAU7A9KPlMGIusvgkk4M2WJI6fr0lEs/LW+ZuX0xeka1jNsXhNgEBIecfScMy9qhTZw83v@vger.kernel.org
X-Gm-Message-State: AOJu0YwOaC/HhMz5jIcCInZSlb7cdD+wSBwc5UxoaJcx7qdIsdc0YoLR
	n2w+phOPxqq508bD4n8o+NIdGKnC00T1NwdWajPkgfz2ZU1K7+7+hsXH1OHp1U157h/nVW2G7dY
	XyMyvSpdO2p2njhOxCub74YrIwCUn72Cz6vc/jY7Fqg==
X-Gm-Gg: ASbGncvlV9l5/AST+w6YjCtq7hxFtXwS7O8Xub3GGpRGHZxUg5Uf+oN9337AQXMCrd4
	IJdhYDPm17082RjFP/CzuFr3A9ueUrzmoeDBbtHc8NvMXOrhArbRo/qx7BdN0cORsgmsiVxdpxt
	51mmMyLRdencwTwGdlpZa8/QetcuA6BqW7Go728Y1uvtZj+YwabEVcH2T7mCwVuWnskb/UPyNDD
	C46v6eQCwqstlwT4SJoLoNAe4ihaA==
X-Google-Smtp-Source: AGHT+IHyxiqyIG1018vg7vc+mtcW6A59E8yUiwGYRJGG9KxCKw5fvAqslGiUqpn1l8NdSfenK2sicsLNKavqouk3DRw=
X-Received: by 2002:a2e:b8c1:0:b0:365:6b40:8656 with SMTP id
 38308e7fff4ca-37609eb8857mr54723711fa.35.1760353762857; Mon, 13 Oct 2025
 04:09:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251003-fix-mt8189-pinctrl-regnames-v1-1-408a2531b127@collabora.com>
In-Reply-To: <20251003-fix-mt8189-pinctrl-regnames-v1-1-408a2531b127@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 13:09:11 +0200
X-Gm-Features: AS18NWCBPX6jrMPcN6UDT2y68ZZSKL5gcB8CFxgIkLczrmPbcNs-ikNBr_vqb3g
Message-ID: <CACRpkda_BUvjBsrjG33mg-xV2_X6UACUPKRQMF0k8c76fSoS3w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: mt8189: align register base names to
 dt-bindings ones
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Cathy Xu <ot_cathy.xu@mediatek.com>, kernel@collabora.com, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 3, 2025 at 3:50=E2=80=AFPM Louis-Alexis Eyraud
<louisalexis.eyraud@collabora.com> wrote:

> The mt8189-pinctrl driver requires to probe that a device tree uses
> in the device node the same names than mt8189_pinctrl_register_base_names
> array. But they are not matching the required ones in the
> "mediatek,mt8189-pinctrl" dt-bindings, leading to possible dtbs check
> issues. The mt8189_pinctrl_register_base_names entry order is also
> different.
> So, align all mt8189_pinctrl_register_base_names entry names and order
> on dt-bindings.
>
> Fixes: a3fe1324c3c5 ("pinctrl: mediatek: Add pinctrl driver for mt8189")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Patch applied for fixes!

Yours,
Linus Walleij

