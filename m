Return-Path: <linux-gpio+bounces-24561-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 150C5B2C4DB
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 15:12:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8600E723138
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 13:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D1B0340DA0;
	Tue, 19 Aug 2025 13:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rIFGX3Rc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0588833CEA6
	for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 13:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755608523; cv=none; b=BGMAGLYrzO6IMDikT5lOECWAiz7AlLPeEUHH8iqg75WvI7xGIHM+3J5z/7EGH+o4PqeaNBdyLuk13cmX5DtJtMRu7jwVx3c0kzPo35cEj1/gy6oBcqpNR9tHyf0zjQs4SJamD7z4i4zhC+76iTJ3UcnvmtkVhyCuGhO63vXpbyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755608523; c=relaxed/simple;
	bh=xDml88sPMX5R8HY2YfDw7tFyskzPjxRWQr7bMllRWeg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WYo4ygA1KiCS+lYaD8dzbsEj0S2cCuUFe6Lt6LTObWNrauPTeCnUw3jpunBpb7fVQb6fNY/rNkG4Q1G+sohaMiBLp9TdNoYONCTziQrOet/hZ7g5MRvEF/j/yYsCQe29Y8zLdLck/RHuXLbl1AQH2tXtKObTQMbqMLtoJrXyNsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rIFGX3Rc; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-333f82a3a9eso45057181fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 06:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755608519; x=1756213319; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qxb1RM5Ht9n1r5SEfzEp8KCVi3ssjTbIBjJD7cNdVUs=;
        b=rIFGX3Rca8BQbotWBuyjMi53L/jSLyggBdIK9QeWUWOf6ZFMfHN3rD9brhbAOpt+A+
         Nfb0R8GK4F+so43kB7dvW+mYl7mBOiWc8Q7arNcLhM7gC/wWVQPiOigCzLIg2BwNe/ZD
         xf3ExINAKjlFjkwMu8HJyXEFVCd5cGsBd2T0IZhG7pUsANV0hDKZuWRH5KclCm5I87GX
         8mFll2ksFAgQ+ey/nQrLq0/oVX3zO6n1bPJkVUrv7D182fnnFWZgBKqzrVoEE4FXvMZa
         lRA3YTirIsuosT3ZYCSOxq9oePQa8HJR4n5ED0eQq+L13d9qmg190A8XLaNDv/lX8iZM
         aEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755608519; x=1756213319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qxb1RM5Ht9n1r5SEfzEp8KCVi3ssjTbIBjJD7cNdVUs=;
        b=QIDfRF7nnPfXHftSDyVzDx4lNODg7bWKi/WK+jN/0uLBpAKDgcHCcn1KW5z0NBOEAt
         A8P+qptT7jOnUXb947H6+H4UyCDRUT+OKh1lhSvNF8MjYskSls+FFD1k87alx6axK+oW
         uyqKpoQ5NSKkFLjNckSB/1ko9+GhHu+f3KacyvQnBPTZbT7EFNeMQj3qV3MvlAyJg0+F
         NIUmx5Cqnxw3irXpFqOtZA3zN+E453xhCen9VvDQwU+hgUp8orDE9BEFvEKQsS+Vvp6b
         5hpU/ZjNdy/4HSFAObr9W7TiduuxuEWEZSSG2huL97y0tVAOrv09Xnurd5IJ9wNdR2vu
         CmIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzIwoHfWqrH4xFqQOfrS9VfnTvzDMLJsWIu9f6NW9Jhex4HBi0TsSBdD1+OoBn+PhsgDh4xnUKKiuk@vger.kernel.org
X-Gm-Message-State: AOJu0YzaA81Pj+Q8TBzOKqEA08o9nFieuegylLOypZDu4dltJTRbhciX
	seqp73vwnrPMQFwUkWygUdsqxuowBX2C6uqX9Onux0E/gLiTNGGKwciFm4sH8LO671EuqCP1xvq
	vHhJYsz1VXdOgZT3uvdw1hRRO578iG+9EccHPQlFLlw==
X-Gm-Gg: ASbGncs+klMzi5R1IAOuuCPutYtQT4S8exty/reJc9UqqHrcOZ2Cvi1RTcwY+++eQ9t
	RLpp8encUvv6DKUQYvApmTd0gPFobFhk0Uqo281XBLxreRjcZ/+HzvUd5uLe/IVHJIF61Q6iT0X
	BPu7KbfDo0VhZjl1nzFFZgflt6VYSH5Wt9qpTXXsMDhxSwPsC5NxSpWje6HY1M/EsIDhvvPtzFF
	qCISz8=
X-Google-Smtp-Source: AGHT+IE7bjsIxvb3/p90/iX8lbM0JfYfSlfdYQ83gKcwpD46fl2MWv7BXJs8CRajKFvUVpb0cf1UMxfJ5zwUc8D1bZs=
X-Received: by 2002:a2e:a490:0:b0:332:20c7:2820 with SMTP id
 38308e7fff4ca-33531348988mr4833881fa.5.1755608518741; Tue, 19 Aug 2025
 06:01:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
In-Reply-To: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 15:01:47 +0200
X-Gm-Features: Ac12FXyC72fjsmfBKj8qknXL2IcZGnP7oQB_by_QmlQnlUNrEkhpI-BF0K24mIM
Message-ID: <CACRpkdaDGmdhaik+1saRv7Ts4myQ+tg1aQqGU3xQyT7ma8dJFw@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] pinctrl: introduce the concept of a GPIO pin
 function category
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 15, 2025 at 11:09=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> Problem: when pinctrl core binds pins to a consumer device and the
> pinmux ops of the underlying driver are marked as strict, the pin in
> question can no longer be requested as a GPIO using the GPIO descriptor
> API. It will result in the following error:
>
> [    5.095688] sc8280xp-tlmm f100000.pinctrl: pin GPIO_25 already request=
ed by regulator-edp-3p3; cannot claim for f100000.pinctrl:570
> [    5.107822] sc8280xp-tlmm f100000.pinctrl: error -EINVAL: pin-25 (f100=
000.pinctrl:570)
>
> This typically makes sense except when the pins are muxed to a function
> that actually says "GPIO". Of course, the function name is just a string
> so it has no meaning to the pinctrl subsystem.
>
> We have many Qualcomm SoCs (and I can imagine it's a common pattern in
> other platforms as well) where we mux a pin to "gpio" function using the
> `pinctrl-X` property in order to configure bias or drive-strength and
> then access it using the gpiod API. This makes it impossible to mark the
> pin controller module as "strict".
>
> This series proposes to introduce a concept of a sub-category of
> pinfunctions: GPIO functions where the above is not true and the pin
> muxed as a GPIO can still be accessed via the GPIO consumer API even for
> strict pinmuxers.
>
> To that end: we first clean up the drivers that use struct function_desc
> and make them use the smaller struct pinfunction instead - which is the
> correct structure for drivers to describe their pin functions with. We
> also rework pinmux core to not duplicate memory used to store the
> pinfunctions unless they're allocated dynamically.
>
> First: provide the kmemdup_const() helper which only duplicates memory
> if it's not in the .rodata section. Then rework all pinctrl drivers that
> instantiate objects of type struct function_desc as they should only be
> created by pinmux core. Next constify the return value of the accessor
> used to expose these structures to users and finally convert the
> pinfunction object within struct function_desc to a pointer and use
> kmemdup_const() to assign it. With this done proceed to add
> infrastructure for the GPIO pin function category and use it in Qualcomm
> drivers. At the very end: make the Qualcomm pinmuxer strict.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
(...)
> Bartosz Golaszewski (15):
>       devres: provide devm_kmemdup_const()
>       pinctrl: ingenic: use struct pinfunction instead of struct function=
_desc
>       pinctrl: airoha: replace struct function_desc with struct pinfuncti=
on
>       pinctrl: mediatek: mt7988: use PINCTRL_PIN_FUNCTION()
>       pinctrl: mediatek: moore: replace struct function_desc with struct =
pinfunction
>       pinctrl: imx: don't access the pin function radix tree directly
>       pinctrl: keembay: release allocated memory in detach path
>       pinctrl: keembay: use a dedicated structure for the pinfunction des=
cription
>       pinctrl: constify pinmux_generic_get_function()
>       pinctrl: make struct pinfunction a pointer in struct function_desc
>       pinctrl: qcom: use generic pin function helpers
>       pinctrl: allow to mark pin functions as requestable GPIOs

I applied these 12 patches as a starter so they can
stabilize in linux-next.

>       pinctrl: qcom: add infrastructure for marking pin functions as GPIO=
s
>       pinctrl: qcom: mark the `gpio` and `egpio` pins function as non-str=
ict functions
>       pinctrl: qcom: make the pinmuxing strict

Neil reports of regressions on qcom platforms so I assume it's something
in the last three patches that's causing it and I hold these three off
until you have time to look at it (and focus at just the final qcom pieces)=
.

Yours,
Linus Walleij

