Return-Path: <linux-gpio+bounces-27838-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6D9C1B81C
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 16:00:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1C0445A3866
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 14:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF6D1279DA2;
	Wed, 29 Oct 2025 14:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iPmuKBsz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2003267B89
	for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 14:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761747710; cv=none; b=BpeItlIiWm2DCLGD+N0idcXdm5OJESKdP24zaH1O1fB0b//7Q0boMUDsif5fqEh60zUVmKX3nJ5cEq/rDcp296wzw97pGBUxxG1eBD9CUBzwPslrUt55E7vuPoUg8LlhaVyrZjl3gv286mKoZnV1Ss24AY0FX9dpb3+AjcaTYPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761747710; c=relaxed/simple;
	bh=W2MmcX2vCweI9Q0W0BLZEPy3CkT01KpRkvvdhb0j4RU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZmVwMqNDK9PiG5q5QMCm7gWnr8zSw7Avcxn0l/XmrFRDN3CwDW686PbkqIKzB0EwUEYQ3buhXkftt0XGCYT8nSFWbP803BtH+6aqNKnvtjfDhdRuB1WjuHuqwOI4JTEE062lDRdvOrLCAogphmFJu/v49MuoWOUlvl9/KwwM8Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iPmuKBsz; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5930f751531so2405399e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 07:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761747705; x=1762352505; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVuX2dWoAgb7QHLLOTB16BwhmwEzZ8jO6zQdan0Y+2I=;
        b=iPmuKBszqzRuJQbXmV7ZqrHkGQ7zzFPI5fCiy2pzoDtPjlRPUxn/iBGENRd/ptR9K7
         3VBKIZJP1O0yUFj7/fCcbOwJ6Jrfg+aPV8Qe6xEI+yJbt3zW5MFm2vbkHPWUEusZbsG9
         9pDt6yHUt7It5usEE7V6f8zm2g/wPOsuVhT8wJtzZZCpNR5pe56ZlKHI8y6UiF8K+aW0
         6QnQ2mRi0kkStXvJzZuY7GofiTxN0n9PLm4/uCs5Swf6Aq4grVIHoojnEHTsOwvkPK9h
         byUFAKzmTHWTLC+KE+CJwCtlAzXP6ZbY547Jy05lqxEPqw1USDxJedUjrktORkWq++Nc
         KPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761747705; x=1762352505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LVuX2dWoAgb7QHLLOTB16BwhmwEzZ8jO6zQdan0Y+2I=;
        b=Kk8cJyJCyXcPqluDF7oit5x/+uQd+T/6W/0lgmIoVKf06s8NwxSXX+qhDcnKO08Vw5
         fAVzYZ64nl1zkgWqmAiNkzrGbfzpu4Y2jJn+Ey1cz+IYm4flNqWcIujgqkH/4kl05Y75
         xO1dCTw2YpxZTo/UoLND+sMReKAxII3L9vuD3IgxsUBVypPw15l1DS2XQABD587uqFRb
         RMZBrRowg10ncLCX5ulOAURHNMHGIBhoRL4r4zWqcW73oQXPU3X4eXzEoDkkLIN8hQ4d
         Ku4W+hodwtQnPdpw3E5lWToXcYmnNbKTHfWtej4dkToDm+E8obL2KAYohL2fye6vJ0hE
         CaUg==
X-Forwarded-Encrypted: i=1; AJvYcCW1ox2JgVx4ofs/4u1M5HJ/yBQNVg9odrxb0EY2oDoBcxj5bJRdiD6va8lxwl5Y+Ho/I57PYLuf5AKD@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5vE8RHmyIK0a1es4hY+oO0FrWfzpTuAvqbeqlw++D7vtksCzT
	B8BRcxd7d8qZpfpu6QA8Dre5HDhOTpQRzkK+7etn+G4ug7y2mtiH7+hkeETvepBwXehdcU9aWhK
	Rl8d2HEor0bK9Va2gqeJjyrBhHOMuSZumD8TQl1nNhA==
X-Gm-Gg: ASbGncsDkH6oRuhhRBYjZjWKOt9CzjpeFYU4xGRQjuIL3q7qLFvBQXXDV5lK9sS1PX3
	QN//n+PdoxKAmU8TUdbFtr5irdpE9ulbaC3lWR6EgaafdB/fizT5rUmbjdDxfCBukH7RK8bxn4E
	YyIr24CMghDIUbMXgU2E+NJLG9Smoy6Flf0Yt+7tU7uQOobIytQJEjPcH8bOHBKHiDI8QSAI58g
	pyaEvPB2q0EtUoKhfPvRCKKmADWDClPoYsUZ+Pp/czjslbpOtgEfc1K7ur/
X-Google-Smtp-Source: AGHT+IH/WV9TTRDue/YlQPKqZJ/rOmSLCumqELYgQ//HXfU7luOPdKKEVQrj3vn51BUY/zZkRojEs9B5VMPxZwJpOnE=
X-Received: by 2002:a05:6512:238f:b0:592:f814:3852 with SMTP id
 2adb3069b0e04-594128b7bd8mr1157709e87.20.1761747703432; Wed, 29 Oct 2025
 07:21:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761588465.git.geert+renesas@glider.be> <ac3e718c5de6a23375055dd3c2e4ed6daf7542d5.1761588465.git.geert+renesas@glider.be>
In-Reply-To: <ac3e718c5de6a23375055dd3c2e4ed6daf7542d5.1761588465.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Oct 2025 15:21:32 +0100
X-Gm-Features: AWmQ_bn0qj1HdhGI-E5owVSGvqmNxBgXc48MF5-9CHRtkVWKXcvNelNuCdps5kE
Message-ID: <CACRpkdYMv+R-NJ5R4+UyhK1+DJia0z72kZgt45+0eubXMuGpEw@mail.gmail.com>
Subject: Re: [PATCH v5 18/23] pinctrl: ma35: Convert to common
 field_{get,prep}() helpers
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	David Miller <davem@davemloft.net>, Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Jakub Kicinski <kuba@kernel.org>, Alex Elder <elder@ieee.org>, 
	David Laight <david.laight.linux@gmail.com>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	Jason Baron <jbaron@akamai.com>, Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Kim Seer Paller <kimseer.paller@analog.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Cosmin Tanislav <demonsingur@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Jianping Shen <Jianping.Shen@de.bosch.com>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-edac@vger.kernel.org, qat-linux@intel.com, 
	linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-iio@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 7:44=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Drop the driver-specific field_get() and field_prep() macros, in favor
> of the globally available variants from <linux/bitfield.h>.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v5:
>   - Extracted from "bitfield: Add non-constant field_{prep,get}()
>     helpers".

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I guess this needs to go with the rest of the patches?

Yours,
Linus Walleij

