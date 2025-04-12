Return-Path: <linux-gpio+bounces-18751-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEB5A8702E
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Apr 2025 01:00:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B4451898090
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Apr 2025 23:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C23481DE3A8;
	Sat, 12 Apr 2025 23:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oSDAhk2P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0127419D891
	for <linux-gpio@vger.kernel.org>; Sat, 12 Apr 2025 23:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744498838; cv=none; b=q2n3sezQyVJsedgKbvDERcZolg2zT05XgsRjh86oDKrpM4eSah3xFDI2NYdcEN6FUpLYoZCAALXA2y4zl6rvKMM/0gWvWsug8RFtNZEFKxXHaDyQurQOuupkhUVIV0Lnb7Oa+CAhwJ+dmaSLiZ3mWd/z/9D3YMaXLg7tg975bNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744498838; c=relaxed/simple;
	bh=oPo1blgwzyJP/bY5bwvLVevkdwQtLQb4S/wTulcJtJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ncaof1zzHNHyBaR5eyNJNH3uwIpwux4xDuXFWzZqyW84/SCTc/9F3sz6MA85Tbe7Mtif1ul+s1oo8rZijd2YggHIpnxJlB75ydBecVsgR/U/IT3giA7j1Xbc5ZrMMZvAmq4Zk2zLWoW8ugKcRhI7eXVqGUm4g1zqL5GiUTOhP6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oSDAhk2P; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3054ef26da3so2542359a91.3
        for <linux-gpio@vger.kernel.org>; Sat, 12 Apr 2025 16:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744498835; x=1745103635; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NU3iBfM7D5CeCGE+Vgvqc8yYV4eCj2ocSR/M1MRt/RQ=;
        b=oSDAhk2P2P7yLsJKFKXj/uDx5i0IPCrohIHsojpwsK807PTo8niAU/78/Wic4squMj
         /ZZUXyeACe6W1j0He1I6u5ljTQ1kgQkDkOvibKC1U1PUynaT+s2q7lxFj9n0QNtdjFSy
         VnPPh7InuuAu26lF/kOccM0hOHFRuY4Ua4Hhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744498835; x=1745103635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NU3iBfM7D5CeCGE+Vgvqc8yYV4eCj2ocSR/M1MRt/RQ=;
        b=HiORKzFXxjUh6ymltpeDm9PZDXaleZMPa79fl3PPliuxpYeG0HJDs14p1gIDvoYboD
         ngUAQ+1GzKnzmyPwKv0UWCeiu0DOFyROBfHuc7LK6JL1+NAhNOYVIK9kzcP0WVjy695Z
         byrMBk8wYhvHOfcQw0iEox3nm7gS2Zvc0CvhQGv13JduAoUcaip8eK2EhtLeXM98rrdv
         zFb9NNnj5MBxlHJRYkaJGUgkAro85I9bp61xXKTzTZg/MKrsRCuO9lUwbl0wWbV3kfNy
         Vz0GPq6tYDRxk4qTW2pYJavpeFwlas8Yp+UIvbiUR1TxkK9bpp4+m+R67c/nmOX8EL3V
         D9vg==
X-Forwarded-Encrypted: i=1; AJvYcCUeyGU3A1XKkh6t8qMDEPSNskiVUh0QzAUO5ZOj6m8AP6i2nQCntxRyJ2WKjuCl+5SUV9iOYH+MQk3a@vger.kernel.org
X-Gm-Message-State: AOJu0YzSy/X5vddD0ztnXLxGRsTfyQWVYZ6DM4O5yRb557VpcuhgqxQN
	FLjf9pH3fth9/YKWVS6P8CnWDrgpAVIfRlj+ZDi81JAwxE2+xq1To7udo2JvYGzTudQKprb9gPA
	=
X-Gm-Gg: ASbGncsCJWtf4pefsqHfJlaOEcBbhhvkgZPPPH2L7/eNibbb3Dr9uAx6SCd7aUbF1KG
	pmM+2fqgl1Fl0trBezeprNekZrsoFClfW3UMY2H5RCQ1YgppMMjFANfEG5SvIoZaeQ+4uDpUTG5
	buN55Vqw989ZJENrBpLzeV6jbp5FKT0oCL5kVW8gigPAT4joLV2HWW8ATN/uQSkxDq6jAK+gsFl
	bBEH6ON9EgHgIYNm8lTb1nNgskIjLp7HOPwVR/bpbRrD5fcYt/oY4Ch+iqpyL4EtxLuNyA+8A9/
	4ermfAtpy8NXWThZ4o0v6xxMnClMhNaD7hYCt+FFBJ2NSMeF3zSqFV+QgY2yQu3/+ndxY9AhgOR
	JF4lz
X-Google-Smtp-Source: AGHT+IE/3eFElLAWywztJkjUUWPtqM1vlRFcmakm3TZRMCxTsb/PsOe8qvx7celideFjwb1xIgFUQw==
X-Received: by 2002:a17:90b:510d:b0:2ff:58c7:a71f with SMTP id 98e67ed59e1d1-308237ce153mr9648806a91.32.1744498834988;
        Sat, 12 Apr 2025 16:00:34 -0700 (PDT)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com. [209.85.216.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8ea61sm72611925ad.103.2025.04.12.16.00.33
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Apr 2025 16:00:33 -0700 (PDT)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3054ef26da3so2542343a91.3
        for <linux-gpio@vger.kernel.org>; Sat, 12 Apr 2025 16:00:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV3W2ZZMeGVnDIgJh/CVIq44h+6+C9venqv6kKYynIaAV+G7Mm/I52bekjdYzN0oTtXuE3wmdTIflP+@vger.kernel.org
X-Received: by 2002:a17:90b:510d:b0:2ff:58c7:a71f with SMTP id
 98e67ed59e1d1-308237ce153mr9648710a91.32.1744498833042; Sat, 12 Apr 2025
 16:00:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1741180097.git.mazziesaccount@gmail.com> <4547ca90d910d60cab3d56d864d59ddde47a5e93.1741180097.git.mazziesaccount@gmail.com>
In-Reply-To: <4547ca90d910d60cab3d56d864d59ddde47a5e93.1741180097.git.mazziesaccount@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sat, 12 Apr 2025 16:00:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vg8_ZOLgLoC4WhFPzhVsxXFC19NrF38W6cW_W_3nFjbw@mail.gmail.com>
X-Gm-Features: ATxdqUHXuDUacWtFQbmrQv_egGL6K4UpbFGxUUNUsvQNVBATH0HPo_GCExTfnng
Message-ID: <CAD=FV=Vg8_ZOLgLoC4WhFPzhVsxXFC19NrF38W6cW_W_3nFjbw@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] gpio: Hide valid_mask from direct assignments
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Mar 5, 2025 at 5:23=E2=80=AFAM Matti Vaittinen <mazziesaccount@gmai=
l.com> wrote:
>
> The valid_mask member of the struct gpio_chip is unconditionally written
> by the GPIO core at driver registration. Current documentation does not
> mention this but just says the valid_mask is used if it's not NULL. This
> lured me to try populating it directly in the GPIO driver probe instead
> of using the init_valid_mask() callback. It took some retries with
> different bitmaps and eventually a bit of code-reading to understand why
> the valid_mask was not obeyed. I could've avoided this trial and error if
> the valid_mask was hidden in the struct gpio_device instead of being a
> visible member of the struct gpio_chip.
>
> Help the next developer who decides to directly populate the valid_mask
> in struct gpio_chip by hiding the valid_mask in struct gpio_device and
> keep it internal to the GPIO core.
>
> Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Revision history:
> v2 =3D> v3:
>  - Rebase to gpio/for-next
> v1 =3D> v2:
>  - Hide the valid_mask instead of documenting it as internal to GPIO
>    core as suggested by Linus W.
> https://lore.kernel.org/all/Z71qphikHPGB0Yuv@mva-rohm/
> ---
>  drivers/gpio/gpiolib.c      | 16 ++++++++--------
>  drivers/gpio/gpiolib.h      |  3 +++
>  include/linux/gpio/driver.h |  8 --------
>  3 files changed, 11 insertions(+), 16 deletions(-)

FWIW, I've found that this patch is crashing me at bootup on my
sc7180-trogdor board. The problem is pretty obvious in gdb.
"gc->gpiodev" is NULL in gpiochip_line_is_valid().

0xffff80008066c760 in gpiochip_line_is_valid (gc=3D0xffff000083223890,
offset=3Doffset@entry=3D66) at drivers/gpio/gpiolib.c:746
746             if (likely(!gc->gpiodev->valid_mask))
(gdb) bt
#0  0xffff80008066c760 in gpiochip_line_is_valid
(gc=3D0xffff000083223890, offset=3Doffset@entry=3D66) at
drivers/gpio/gpiolib.c:746
#1  0xffff800080666338 in msm_pinmux_request (pctldev=3D<optimized out>,
offset=3D66) at drivers/pinctrl/qcom/pinctrl-msm.c:152
#2  0xffff800080662314 in pin_request (pctldev=3D0xffff000082686ac0,
pin=3D66, owner=3D0xffff000082c02790 "3500000.pinctrl", gpio_range=3D0x0)
    at drivers/pinctrl/pinmux.c:176
#3  0xffff800080662900 in pinmux_enable_setting
(setting=3D0xffff000082684b40) at drivers/pinctrl/pinmux.c:445
#4  0xffff80008065fd54 in pinctrl_commit_state (p=3D0xffff000083a07520,
state=3D0xffff000082684a40) at drivers/pinctrl/core.c:1300
#5  0xffff8000806605bc in pinctrl_select_state (p=3D0xffff000083223890,
p@entry=3D0xffff000082686ac0, state=3D0x42) at drivers/pinctrl/core.c:1381
#6  pinctrl_claim_hogs (pctldev=3D0xffff000082686ac0) at
drivers/pinctrl/core.c:2136
#7  pinctrl_enable (pctldev=3D0xffff000082686ac0) at drivers/pinctrl/core.c=
:2156
#8  0xffff800080660814 in pinctrl_register
(pctldesc=3D0xffff000083223a90, dev=3D0xffff000081406410,
driver_data=3D0xffff000083223880) at drivers/pinctrl/core.c:2193
#9  0xffff800080660df4 in devm_pinctrl_register
(dev=3D0xffff000081406410, pctldesc=3D0xffff000083223a90,
driver_data=3D0xffff000083223880) at drivers/pinctrl/core.c:2313
#10 0xffff8000806657b4 in msm_pinctrl_probe (pdev=3D0xffff000081406400,
soc_data=3D<optimized out>) at drivers/pinctrl/qcom/pinctrl-msm.c:1579
#11 0xffff80008066afcc in sc7180_pinctrl_probe
(pdev=3D0xffff000083223890) at
drivers/pinctrl/qcom/pinctrl-sc7180.c:1147
#12 0xffff80008089583c in platform_probe (_dev=3D0xffff000081406410) at
drivers/base/platform.c:1404

(gdb) print gc->gpiodev
$1 =3D (struct gpio_device *) 0x0

-Doug

