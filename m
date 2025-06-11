Return-Path: <linux-gpio+bounces-21370-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CE6AD536B
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 13:14:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C87D1C23B15
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 11:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3374A2E6108;
	Wed, 11 Jun 2025 11:04:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5FA2E6106;
	Wed, 11 Jun 2025 11:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749639884; cv=none; b=IDiPF/KqXfpUBephJCA1auIJOf8HjGek7CIOnd63TgSYbNeGIdY6tYO1IuqnQsC9WLo0NUmDq+B7nPQZxO44IB1BsTVHKHHJMVjwDGqu6EXa7gfEIbpzAAgz4dziO3H9yZgJhVrRCxTqUpEB2JCiulDZJ/SEpzeQKjOtacQleGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749639884; c=relaxed/simple;
	bh=vKM9URE6VH8VYC800QExPP7HP+rcx4qnoJaslsSum4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bwDLNRAWamL7DeRWqmP0Jul1qI2PqfpM4XWg71Sc2sZTXrv/sJgH+5tAsrEdslp4ZPtAWhMzkLgJNTWuqQmTVeZO70dYI+6n0L4z0Z0OyOji/it/MXtKShFkFr9oDdjJjl5Qnm1RBIW9G8ApWjf45DvNtHy/rYw2dwaTbMdcKIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553543ddfc7so6333651e87.0;
        Wed, 11 Jun 2025 04:04:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749639876; x=1750244676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xIkIaaPsxO4m2eJwDcrS1OSphLUaIwh9HxpS06D3sV0=;
        b=hFOBOOwaijxCtO/Cab3ecih4dATLoHgU8oqW8VrvrWuIZER9mEpKFpbO8zV3jN7yg9
         CvJOht1P94Z2VC1Tg+YWc+QHcPuaifvo30JEghcRVjq2mDwdz6CmyrurV+An0FFqyPB7
         0MAUYy4o9eQaxWS1bJ6E+BAqWJVvXc6BJcwjwAKAgS8DeNE6V0rnXxzM+s5FrUaCy17R
         fdz4+s4eeO+PuOLo+wet+vsBuJT7dplCzo7xI4JJPlgIa0ANp7fPjJz2kAGq3GYyupZi
         L/Us8NDViIYyk6bVsUWXT1sMEmXw+5VpgGp83Tvzr1vrTj3jxv5RrorOn0cZvqDfpJyc
         WpWw==
X-Forwarded-Encrypted: i=1; AJvYcCU2tD4prAP5/Clv3xwYWY3jeI6QN9zgKjEsp5qwG20ebhvHU+nAfCa1uESZlGReWC0InfAFRmsHNQNc@vger.kernel.org
X-Gm-Message-State: AOJu0YzjAbtIn8Lkmbjv+PYu2IDe7+5fzqbBQFfLFg966V7DRWELbfOh
	MDy5X4ZykjjQDIjRfOkXm112+Z2LShsJqDE93+1zgawENSV5xRVEwXuD3KooVC+B
X-Gm-Gg: ASbGnctNjabYXsGZnvxhJJ6oK+253MHdat/tAXSCwhjVcb44TC2ua21bMRpw2CvXgT2
	SJ0r4goQWc/wZeBwdPtXxVjiuscqtB288OvAOVK2g7NIlXm6FIxuZeHpYnojfrG3GtL9zKzpgS6
	EV1UzvfOL8yW+SsyjDUq/1DG9oqunNoURN3qkjTNPKmXX+V6SpLjwCmlzph3CSOCnoqKdnBbBhw
	LGCQCKUhQB3LYlRmrw2/eUcMz6NOpBsv20gUBOrd6SMqFWjh0F/EFpkNJuEpcej6weprremMFG2
	2SS5GvKs2R/SUB+vQ9m+MpBXFBqejSIi+gA6UbcNG0tkO0v/xln8OyhDykej2sVa9YpvkXA4YPa
	AUd9TZuVsDuRhoENvVY4=
X-Google-Smtp-Source: AGHT+IGFluEtmN/JqLEof4+a1SMqMCfED1WMKFyTmLvGqNeRw/zgxIsDLiJuaYElVWz1X+ec8RPOFw==
X-Received: by 2002:a05:6512:15a5:b0:553:354f:1fe2 with SMTP id 2adb3069b0e04-5539c21f291mr948156e87.51.1749639875406;
        Wed, 11 Jun 2025 04:04:35 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d7b37sm1905301e87.67.2025.06.11.04.04.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 04:04:34 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-32b019bdea3so27171171fa.2;
        Wed, 11 Jun 2025 04:04:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWcEcv5AGruDc9xCN2bsoEO3PeyD2qdjmd74U2Wvx9q+m+O4hdZQZRMeuw/WmuLoez02qGNHVC/tiY3@vger.kernel.org
X-Received: by 2002:a05:651c:b0d:b0:32a:648d:5c0f with SMTP id
 38308e7fff4ca-32b21d1135cmr7885761fa.16.1749639873377; Wed, 11 Jun 2025
 04:04:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611104348.192092-1-jirislaby@kernel.org> <20250611104348.192092-17-jirislaby@kernel.org>
In-Reply-To: <20250611104348.192092-17-jirislaby@kernel.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 11 Jun 2025 19:04:19 +0800
X-Gmail-Original-Message-ID: <CAGb2v64zi_gXQN+6y6W0AiAVBrfn6qO0=Qoy3b1ojEMNFWaBSQ@mail.gmail.com>
X-Gm-Features: AX0GCFtGlMh3Zzni8gRt8ry0nlQX_sI9OVMA75h6YXhmJIEc5H7iod5f7NlW8tI
Message-ID: <CAGb2v64zi_gXQN+6y6W0AiAVBrfn6qO0=Qoy3b1ojEMNFWaBSQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Use dev_fwnode()
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org, tglx@linutronix.de, 
	Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 6:44=E2=80=AFPM Jiri Slaby (SUSE) <jirislaby@kernel=
.org> wrote:
>
> irq_domain_create_simple() takes fwnode as the first argument. It can be
> extracted from the struct device using dev_fwnode() helper instead of
> using of_node with of_fwnode_handle().
>
> So use the dev_fwnode() helper.
>
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Sean Wang <sean.wang@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
>
> --
>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Samuel Holland <samuel@sholland.org>
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-sunxi@lists.linux.dev
> ---
>  drivers/pinctrl/mediatek/mtk-eint.c   | 4 ++--
>  drivers/pinctrl/pinctrl-at91-pio4.c   | 6 +++---
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 2 +-

Acked-by: Chen-Yu Tsai <wens@sie.org>

