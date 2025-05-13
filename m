Return-Path: <linux-gpio+bounces-20010-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC9AAB4EF2
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 11:14:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0E0516BFA8
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 09:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3AD3213E79;
	Tue, 13 May 2025 09:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zf0z9Dny"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35A5212FA2
	for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 09:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747127643; cv=none; b=RyqhvzvRHkrECXzHXwD1+WVsEMEC/fEzc98ghEhQJBWvwTSQMegAQ9yECDOnydpcDX1wY9n5FdOu/e36m663TW5usv4PuQiLp1cSIffFHuUb2bul0DHQnaIh4xwGg/7c+zs/WWQ9E8X1pwWy83LVtZNcnZwJ6Y8VUYW9WUedbww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747127643; c=relaxed/simple;
	bh=/SAD+E8PlcSH1+Wt9D26KNtrABdi7IHZQ0z3Lf1kx9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mgVWPFaCmVSmW5JIjzVIQKlfwXiZiSldndqQg2Y0OGMX8bjAQXdh0fawl1Sar2Qed+nJGMn/VLcOPQKRBrP0h9S/Ymz+VrK29DxG2YVHTYEZe7L2iAyaOu6HW9NfWyjOuxk6XS+E1xG/3J1yefJ+ES7TfI4TAyIZUUI7Ggptqbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zf0z9Dny; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54b10956398so4892537e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 02:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747127639; x=1747732439; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYE6rz8ivBX5c5Je+9pTAeUXcNTn8kHnTYdngeOsHIc=;
        b=Zf0z9DnyMoAIGaXecaARiH73B0HYtkZtVtbtqW5eArogBS158f4pcbPoZU40xlu0HI
         TRdxJy61usnw335iD8l+Lhq/cZJWuLkzYAo1UqaDLYPaq8csYFGNuXwj6bOtJWPpKhdv
         Ac8GGYLC9mA7+L5KKAaIOZYrXZnv0nQnO8dqQNpRPDkmIeZUAB6nLVpdgKDxw+eWtOxY
         RwFvDgnN4N3dIAuAf+NIxfbPRw3ZiyJMc7Q4SR1BdrJlnD5Z0yf+OP+4w7IbBgz4L5hb
         kuFeLioJMS/AhridnSBjOW2wTvBNuWPBxWRD0e9QN/quDhgcwrUFtvfiXHe95DgUAlo1
         xP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747127639; x=1747732439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYE6rz8ivBX5c5Je+9pTAeUXcNTn8kHnTYdngeOsHIc=;
        b=JB2sQZPnfsmqvBPZtVCWb2MtVj3+OiSum1DAhSZ38P9DXjDJHwcA++ti+TG8L5vbO6
         IiLXsdOEhY4OiXpzYhatlTW6i3+P6BA9/sfM3iUUfAJ6jrE5tLB33QZluatad81gPqVm
         tH/nJ+oUGqPL+Ef0M0f+8AbH4OpQyNl4OQ1HvjLO9ZTFd0cTCw39zDdayObGN+NRxo8n
         Nf4uCP+5I5ryW/fQ23ccTyQyOdD5kGP9N6rjs83P2E7e05GwU9wLg88FsVyUWLsoWbTX
         oMAiQ7Hn5M39t5dxPZ1CyiTgx7je5K71GBST1fbNcU656KsORyVG1K1uBDPlUeC2m7Cc
         pMKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTTIPSTijHg5PiJ5fvKaimEd9wFfFPxoBQt9JTRCbE71KBfEB2iPk8IzpR5dcTlJbBQ5IKITUeGJ++@vger.kernel.org
X-Gm-Message-State: AOJu0YwPcTi9LG0us4G2QH99nxouyawFFYfscCsKhoLwwzb0AGFxoD+T
	i3a7kb+3cbuhpzhsG1HEIHYFukD8kQ5E9HHaLLlsNnGUqWGFLM45PhUwgaqPFwUuDhT5F9u3gjm
	8C2wBwUSsLW8Tzgcfh8zthRbqg+0NIGEFCfXa8g==
X-Gm-Gg: ASbGncsdhqEjClu/j+LmuTwYtLV/TAjW90TrQj6ZoZOUjgS3oxyoleepsm7WgpJHIH/
	cCZuAEZ0ty3FZj1Y5RMItMr7093C99tw/gvU9TRHsDc35BPdkwS/koaKetFVB5dyf36lOisCmhA
	1WV0Z5V9dubQRtQ/vRDzE8WTBa//AzHh9P
X-Google-Smtp-Source: AGHT+IH/jeTxrV9HpMwi2pjeapptNJlfLhNnNzY1D3MSHE/hcFjWBYu5GOatTwYNUgShX23ZdgCZE+JMddotwLltrJY=
X-Received: by 2002:a05:6512:3f26:b0:549:8c0c:ea15 with SMTP id
 2adb3069b0e04-550d0b29ba5mr955737e87.0.1747127638909; Tue, 13 May 2025
 02:13:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428-csl42x-v2-0-e8056313968f@nxp.com> <20250428-csl42x-v2-3-e8056313968f@nxp.com>
In-Reply-To: <20250428-csl42x-v2-3-e8056313968f@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 11:13:47 +0200
X-Gm-Features: AX0GCFv6EYp1hHtdCbx7xVQ6OsQr3zpfxe4aZJqix-ETEXnpR-jVx_h06K8Q1co
Message-ID: <CACRpkdZeQ=A3dRGS0jLryPO65E7RutXDVZHFuAC19TTng-N1aQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] ASoC: codec: cs42l56: Convert to GPIO descriptors
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 4:10=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> of_gpio.h is deprecated, update the driver to use GPIO descriptors.
>  - Use devm_gpiod_get_optional to get GPIO descriptor with default
>    polarity GPIOD_OUT_LOW, set consumer name.
>  - Use gpiod_set_value_cansleep to configure output value.
>
> Checking the current driver using legacy GPIO API, the
> nreset value is first output HIGH, then LOW, then HIGH.
>
> Checking the datasheet, nreset is should be held low after power
> on, when nreset is high, it starts to work.
>
> Since the driver has been here for quite long time and no complain on
> the nreset flow, still follow original flow when using GPIOD
> descriptors.
>
> Commit 944004eb56dc ("gpiolib: of: add a quirk for reset line for Cirrus
> CS42L56 codec") added quirks, so the gpio request API will work as before=
.
>
> Per datasheet, the DTS polarity should be GPIOD_ACTIVE_LOW. The binding
> example use value 0(GPIOD_ACTIVE_HIGH) which seems wrong. There is
> no in-tree DTS has the device, so all should be fine.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Looks right to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

