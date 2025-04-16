Return-Path: <linux-gpio+bounces-18914-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6E8A8B225
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 09:29:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC2FF17C7BA
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 07:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45ACD22C336;
	Wed, 16 Apr 2025 07:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VB7XOpYe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DBA2DFA4E
	for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 07:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744788596; cv=none; b=cSCqAPiUrps8dtTwAc5Au9CGnTEWdulnPOojXySgQOpZKwKglpZ4LhZifOFU/fgqEb6vsiIrvop2U5IypOqK5pUmkhQkX2mjlffVRuZirYwu2sbLq+rFLlp9xciaA0UcElZjO2y+RjHs+QoX+qhd7iL6glbB2JVUlE8G2UJIzNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744788596; c=relaxed/simple;
	bh=Vu1Z1iNyXH/P0QywYALzynooSIZlETxbTzFpRmXM8t0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C7XpfooTl5esbnSnfvOQYen4Z5tGreGodJe0uubEpBscmVO8erVXgi1j2j3mw/kZz7QAFayfU/RPe8IKYTS/DkG5nHHk9uMB0msTQXGbz7nP8puFZdXgsKk3UZkDO53wp3D3rYaqBGow7YmY5wgchwqCg/df/NxzsXyuejcVXBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VB7XOpYe; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5498d2a8b89so6498434e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 00:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744788592; x=1745393392; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vu1Z1iNyXH/P0QywYALzynooSIZlETxbTzFpRmXM8t0=;
        b=VB7XOpYeXsxjQYFLpY+qLwHfsWEoE8mvq5nvMYY9gOwAUhDfBFuiXlVz6OyucCQ9Yb
         Owmppq6GCgwfs15BbC8baenIljnkyh+QMbI/drRtn8SXhCSuIrzIKaHlnlXl6VwBNarT
         KS3Jm/Yo/M8F6ghW5Mv6fe26bYa2TvaLG6ezcehUK7SxLUBdwq5vxRvjy3N8kd/0i1tv
         Hbf91iHoI2q69z0TsAyFWncxv5o+PD8XLAesJWo0yxCclKnpL/6rfy/jzaEvq0WIAm3l
         /c60AwJaehSh+cWrsg0NPrQw9T/VV8RRO+MtSDmtgbH97zj4FYeEzS5Bsd2p4DxpYN0p
         M50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744788592; x=1745393392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vu1Z1iNyXH/P0QywYALzynooSIZlETxbTzFpRmXM8t0=;
        b=lOKPY+TwoDsU1xtrkBn5GgFzY2RR9wDusoWtPqA35/fBuEoCX7wd1oKLzdJIi22GPq
         hEnyYMqwF4PLIN8EI99ZalUHA7gKEeO/0OO36sPQyxvYzydO1q3GI2b/b2si/U5BoyXh
         Svop3iF2LIjCxUYlyjdr1O76RwSPT84eS0wqL2zJ8posOAg14pWd1c59BRTzhZW4FWb7
         cMqyrkIq2ngWZmIlGjr6SNjOFlAQOaYytUF1E4mCjjHMUXwIvKFbNK3V7SgS3q2CK3ZN
         Vxvyyv4qzUpcG7q0SjUzam31H93ragkDvhRzF0MZpxNMHLn0t3AkuMquEfjAufa0dzMC
         osdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWexbWXmrR39Xpm4cPDxP5dWUP2iSnvlnO3PZ3kTnaz43MZdpwZntJDaKZXsWJqhiEZ+5KI7TptWmJc@vger.kernel.org
X-Gm-Message-State: AOJu0YyURzQY43S6qd8r7nUM8Gq349cRwiyYFfswnxrtVYBChw7SRtOG
	1tOgQakXwS7ndsTdvIH0XFoZMYLDaeBZTjbMqaZYcYxzaICrQc1G0MqOBA+j4krpM3W2Tb5FZoP
	96nA+s9Nw72XuL1PuDA5o3zoeMHUk/1peYiB21A==
X-Gm-Gg: ASbGncvrTuMrOTYc/ttpaOaBD5dIeqQ1RmotWdOhdr7IvcMpQBgWnTUDNQ334MRqWiG
	OV2UHJXpH8EnrK1GSW6wWNlruxPvLLfCGucV5iyw9XFGr/o8hPH6FVoGocgI47GP9UJpz3BYAME
	xsAUNIQTm4c/Yw8hms7r3ouQ==
X-Google-Smtp-Source: AGHT+IFIpyoa4b37GuE7bShcO/RCUjBlfmU/mTjYO4extyxyEAUNDPyqKbiJFcyUDnd++AOe+MPmtXvLY9f9jwMpHVM=
X-Received: by 2002:a05:6512:108e:b0:54a:c835:cc4b with SMTP id
 2adb3069b0e04-54d64aea449mr196703e87.45.1744788592107; Wed, 16 Apr 2025
 00:29:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415112339.2385454-1-wenst@chromium.org>
In-Reply-To: <20250415112339.2385454-1-wenst@chromium.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 09:29:41 +0200
X-Gm-Features: ATxdqUGsaRj7mRwORGwu-YQfJxqBlwgA7akp1LopdnGat1Af2KKfApGkes9E8jA
Message-ID: <CACRpkda0HVd1auh1zmyX8QdDCL6jNVb+JYj7hbZrdg+v26BQWw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: common-v1: Fix EINT breakage on older controllers
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Hao Chang <ot_chhao.chang@mediatek.com>, Qingliang Li <qingliang.li@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 1:23=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:

> When EINT support for multiple addresses was introduced, the driver
> library for the older generations (pinctrl-mtk-common) was not fixed
> together. This resulted in invalid pointer accesses.
>
> Fix up the filled in |struct mtk_eint| in pinctrl-mtk-common to match
> what is now expected by the mtk-eint library.
>
> Reported-by: "Uwe Kleine-K=C3=B6nig" <u.kleine-koenig@baylibre.com>
> Closes: https://lore.kernel.org/all/43nd5jxpk7b7fv46frqlfjnqfh5jlpqsemeoa=
kqzd4wdi3df6y@w7ycd3k5ezvn/
> Fixes: 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple ad=
dresses")
> Cc: Hao Chang <ot_chhao.chang@mediatek.com>
> Cc: Qingliang Li <qingliang.li@mediatek.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Patch applied for fixes.

Yours,
Linus Walleij

