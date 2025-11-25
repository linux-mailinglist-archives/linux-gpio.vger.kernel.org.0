Return-Path: <linux-gpio+bounces-29062-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1B8C8473B
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Nov 2025 11:24:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2E6154EAA32
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Nov 2025 10:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2316C2F25E0;
	Tue, 25 Nov 2025 10:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="s5LLKywi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C99B2F12B7
	for <linux-gpio@vger.kernel.org>; Tue, 25 Nov 2025 10:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764066046; cv=none; b=ZgfHWTJJIM1FOqQKl4/Wvd3Voq3RdtjI/cwZ5gppe3OneM2UX0dj1o8M3Xe3L/nLMe9ypDSWTEk+LAAWhAWb8fZDxxMKjInaeaSkMnMRoMkCx+9MUVkAIxzdQI3bS+pPLDMtCSSo9y6RrbHcTQsPRWkGcuw5IIhaoxQ90yjLPBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764066046; c=relaxed/simple;
	bh=V/R7VJHOEwxuzyxEWxS+mNNGTxF4LFP8HGB5hVPK20g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hvfE7/7uMHCwuIKL+tF1NV/ZeETpou7NdrMa0M3kL26MwgCEWecwXELoAxV7dZ+2yCuthdcbBkhcPG8Pb3jYLATKY5gGPlyTwiqya04QDRPNlnBGpqy8p21S5onntlu2CS5Op3q/wfE7Tss/qId2noXCicFSMEj3WruBvFdeNXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=s5LLKywi; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-37a56a475e8so47596571fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 25 Nov 2025 02:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764066043; x=1764670843; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVmat20iPYBoSP48oBFjSyQKAuYOJgrApfa2YxpJ1Hc=;
        b=s5LLKywikv++tu0+kooHsaZeM0ryDQFnSOpwOZfhHFzZW67rNc4NpLD9T36Uv+HYLT
         HBDcR3zJ5iu5FO/HK4NuhyMR7tWZQ5hlEv4vfK/koiA4zMwkl5dEqqFa7kcM/OVgUpRf
         DTvxK7M8xSR1SF8ZzvcGfLBwV3XdmUk2g/1G5vwM/xw40aX+gQ598L01PMvtGHFuc4aO
         mhHaMSqg+uESaOAV7Eowxx/4OM8PzFMT5DLIbjYTMkHbRxiNnmyK0nRKJwXqeMeOC2OO
         /S6TjnXVuX7luXasS2Rp7F3O06jtBVlXnk04eJTHF2aJ7HJMB4UPcvrTn2DeXfaFUWAU
         Gu7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764066043; x=1764670843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oVmat20iPYBoSP48oBFjSyQKAuYOJgrApfa2YxpJ1Hc=;
        b=EYcHLviJigM5dxlqxjKSztuN/A1IpbPFq1d1j+RnmplZVvSJgOluT230RiWkO5YC9n
         /Z+xfYFwtqDo6Plub8NRp6IXygoMOnlOyQ6WMJxyWKLcGxVm/kN5IhJMXVrrbQydDfcJ
         wDC9OrPGCAK4c6V5ftAvr6zUIa76vaGOWCRGZ11sjfFBZ6CFVtQdZqFoveFzVrxlfqPh
         PgH+NZhp1nxLsLuoRqVD4P+6Oz1+ufepYtTlmDEZyenRVxSe1Q/gJ2I7BoWw6rAero/L
         JSMiGpw3MSspR7/ad2x0GHywBXIETs7Bbh0bmYh8XC88BEAj2Xa9YxTfweDo36Rz/hzI
         nQYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXoiItim0pIyjVjI3WVOT9FFB8D+1Qs8tgyhqB1WFEche23W2/lSuun9pGiMfqXCyDNJIjY8idv3Vz@vger.kernel.org
X-Gm-Message-State: AOJu0YxMRX0iCUxWCBgKZ2OzINytfcReMgzAbTonwFy8u4EOEDw3fX26
	2ulIB5itg/sIInzYZd6d8NTlo+IdPt3BcWPhhpXO0pCEbiv8EkTU7k0iK3WkZe1HgAqcIDj6EMg
	vCNN0jhF0qeLEE1D/RhfKT+w7GkrefJZf+xp3+CX0sHyH13RWbnXaRxY=
X-Gm-Gg: ASbGnct5IXpGWOM5rCU97UKiC9vaHzmIplvJ3hKVvKHASUc6xyHBxCF3ggDdW44eNiD
	o4Ck46rERHqVjlT/3rSibP9mM7YYemijVBby7i3TQh/eC2ujtuamP+7Nzh+bu4nVPGRDUt44pJv
	P9G8DjsInKqXWLFZWMXuY/cukUvhMUytIrLmueEpMVFKXa5/aKm2+ts79IF+mF0COCee8Iyv8eO
	UPkYdvn9xEruhFs6nsWqSn+pU/5lQ66bC64jlBJL1FpKSy8oWmjKngG30H0hCSMz4tmSNHTTtMK
	nWnYseO4AIgCftvTffiKC3E+t1w=
X-Google-Smtp-Source: AGHT+IE05r40niW9QB8z+PreLPxu/l4ph46emS9hFUI8J5FZ33ADlUwToZG3LKYVmJWN3yx17C8YoY/BhTlJnjyR6h4=
X-Received: by 2002:a05:6512:3188:b0:595:7e9c:cdfa with SMTP id
 2adb3069b0e04-596a3eb5e25mr5935758e87.6.1764066043028; Tue, 25 Nov 2025
 02:20:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251121-gpiolib-shared-reset-gpio-fix-v1-1-cf0128fe4b47@linaro.org>
 <be7fd390-e81d-4e93-880a-1b6404398408@packett.cool> <CAMRc=MdW3AkkivE=sA4STZAmmee7bCBkD5oEsXiRcKA80Ggd4A@mail.gmail.com>
 <CAMRc=MfQhu9GY2+3G+Ba71JnXUnU4akAfNbsMDnwkCRNzAXQCw@mail.gmail.com> <98c0f185-b0e0-49ea-896c-f3972dd011ca@packett.cool>
In-Reply-To: <98c0f185-b0e0-49ea-896c-f3972dd011ca@packett.cool>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 25 Nov 2025 11:20:30 +0100
X-Gm-Features: AWmQ_bn4tKvX0CTDPxZFQN9E-LQf6ALLGHofuB4nUXoGf_WEn5sdcB5h6VF4OeA
Message-ID: <CAMRc=Mcu_BhUo8zRJd+fXN0tWM5v6DY-_vLc68k7VVSquYyScQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: shared: handle the reset-gpios corner case
To: Val Packett <val@packett.cool>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 12:05=E2=80=AFAM Val Packett <val@packett.cool> wro=
te:
>
>
> On 11/24/25 12:36 PM, Bartosz Golaszewski wrote:
> > On Mon, Nov 24, 2025 at 9:38=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev=
.pl> wrote:
> >> On Sun, Nov 23, 2025 at 2:03=E2=80=AFAM Val Packett <val@packett.cool>=
 wrote:
> >>>> ---
> >>>> This is targetting linux-next where the reset-gpio driver is now usi=
ng
> >>>> the auxiliary bus and software nodes rather than the platform bus an=
d
> >>>> GPIO machine lookup. The bug is the same in both cases but the fix w=
ould
> >>>> be completely different.
> >>>> ---
> >>>> [..]
> >>> Tried applying only this, as well as this +
> >>> https://lore.kernel.org/all/20251120-reset-gpios-swnodes-v7-0-a100493=
a0f4b@linaro.org/
> >>> + https://lore.kernel.org/all/20251121135739.66528-1-brgl@bgdev.pl/ (=
on
> >>> top of next-20251120) and the issue is still present.. am I missing
> >>> something?
> >> Can you try this branch?
> >>
> >>    https://github.com/brgl/linux test/gpiolib-shared-reset-gpio-fix
> >>
> >> I confirmed it works on my setup and fixes the problem with multiple
> >> users of reset-gpio AND shared GPIOs enabled.
> > Actually linux-next got updated with all the prerequisites so you can
> > try this patch on top of next-20251124. I tested it and it works for
> > me. If it still doesn't for you, can you enable GPIO debug messages
> > and send me the entire kernel log?
> >
> > Bartosz
>
> Rebased to next-20251124, still the same..
>
> Here's a full dmesg: https://owo.packett.cool/lin/sound.gpio.dmesg
>
> I even added a custom print to confirm the reason of the EBUSY:
>
> [    9.233613] gpiolib: swnode: swnode_find_gpio: parsed 'reset-gpios'
> property of node 'node4[0]' - status (0)
> [    9.233624] gpiolib_shared: Adding machine lookup entry for a shared
> GPIO for consumer reset.gpio.0, with key 'gpiolib_shared.proxy.8' and
> con_id 'reset'
> [    9.233630] reset_gpio reset.gpio.0: using lookup tables for GPIO look=
up
> [    9.233640] gpio_shared_proxy gpiolib_shared.proxy.8: Shared GPIO
> requested, number of users: 1
> [    9.233652] gpio_shared_proxy gpiolib_shared.proxy.8: Only one user
> of this shared GPIO, allowing to set direction to output with value 'low'
> [    9.332317] reset_gpio reset.gpio.1: using swnode 'node5' for 'reset'
> GPIO lookup
> [    9.332337] gpiolib: swnode: swnode_find_gpio: parsed 'reset-gpios'
> property of node 'node5[0]' - status (0)
> [    9.332343] gpiolib_shared: Adding machine lookup entry for a shared
> GPIO for consumer reset.gpio.1, with key 'gpiolib_shared.proxy.8' and
> con_id 'reset'
> [    9.332347] reset_gpio reset.gpio.1: using lookup tables for GPIO look=
up
> [    9.332353] gpio-856 (reset): gpiod_request_commit: flags 200043
> test_and_set_bit GPIOD_FLAG_REQUESTED -> EBUSY
> [    9.332356] gpio-856 (reset): gpiod_request: status -16
> [    9.332358] reset_gpio reset.gpio.1: error -EBUSY: Could not get
> reset gpios
> [    9.332362] reset_gpio reset.gpio.1: probe with driver reset_gpio
> failed with error -16
> [    9.441612] wcd938x_codec audio-codec: bound sdw:2:0:0217:010d:00:4
> (ops wcd_sdw_component_ops [snd_soc_wcd_common])
> [    9.441644] wcd938x_codec audio-codec: bound sdw:3:0:0217:010d:00:3
> (ops wcd_sdw_component_ops [snd_soc_wcd_common])
> [    9.445771] gpio_shared_proxy gpiolib_shared.proxy.8: Voted for value
> 'high', effective value is 'high', number of votes for 'high': 1
>

Ok, so the checking in v1 was no strict enough to cover the use-case
of two reset-gpio devices consuming different pins from the same
controller. Please see v2 that I just sent. I reproduced the issue you
reported here and it fixed it.

Bart

