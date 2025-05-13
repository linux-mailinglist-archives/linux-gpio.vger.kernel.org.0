Return-Path: <linux-gpio+bounces-20012-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF027AB4EFD
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 11:15:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95C741B421F9
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 09:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 198C1215046;
	Tue, 13 May 2025 09:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nfi8nwt/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8032144D2
	for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 09:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747127710; cv=none; b=py2FIm41bmA94Njt4W4uo0eqlA3t5CsDlqZl4+Ue2ITd9x7m88jJHwrMnlNXsTTu88pntzjJeZizIQgoJnucdNUge+TLHakQFQOciSVLkHhQqqxsLthkllyQKYOrS/SJNla5Y2emkgVOp3PHxWSZT8JcUCc3BXF3rI2sPLFu1s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747127710; c=relaxed/simple;
	bh=W06RFHPV8gonnsmgauUbgxPzser5B7x04G1quNKfCEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sW5T05ucdTyrgL82m00D+r2z7PY5kQ9IacIv7+kaTHGxTJ0uYYhY2DsyQizuyeFN+cqtWGrsbe4S3WHWsylQfa8A347aWAo0spjrErAuKA/PrDo2EQ4PSZp8BEyH8atXbJYrkW2bPJXscukQ8N+o0YhiPMdfd/7IJwXOAS55Av8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nfi8nwt/; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so7160685e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 02:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747127706; x=1747732506; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jAi9rrC5F3j79jXbmUzojQw3jaZE4Bz634vHF8LgQG8=;
        b=nfi8nwt/P7ekgP9NWzXr6wPMOgiCLtCZEX5G6Vic0bG06xGlKxt1EZeNRRqfRVjsBQ
         Oz+3IEXvrj1AMrto3DSMlWEe6igUX48AJmmPkQC2iuYP5g37ZPsfSN0LUQ2PLSWcNK+q
         2GUckCnQ8UKDo2t4nTszF7+WNR7QnFBRglQ9txIACU8EcFOS7W7G+77iFf5WENCPQQuY
         tcxjQVpFsRstsVjZELXgJG6QgLj9TofZhRyF0p5NrxkmGuV6YfAD0LbGrPyDqhX3D+C5
         5/SxB+tKpsfVenlzf91+Ivxv0+Nh4CmSdR21YJBec4YyvxfVETMajP+I83ylD4cCIk7n
         5EWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747127706; x=1747732506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jAi9rrC5F3j79jXbmUzojQw3jaZE4Bz634vHF8LgQG8=;
        b=dAPhXe1Wr/SLxw5H+TwC0VMZ9vxNe69W5PpMkoXpVIaqrQhBz4hCRlnjo8aEocQZo9
         gm0XNBXAz2Bz0bC8aVF5lKM8u0beHTfiMl7w8bnIqu5pQAz+s6eIVf8aXAB7jse50qu8
         WaM46pBP5N2YeTTbp1UkUiD+aaTahw6uxKVdTNsTZZWd1rOuKTu1WBU2wgrEMmSkW8QV
         DuzWTm5J+hlYgI4zwYZhPTmB16dkJJ6NjIB62IQzj39T30VbCLz4oojNLyIARqMlGErw
         XRHrQJniKgGPv802FzYaqNph7ctIxda9B2rwDPJbqTlVw/dePdd110NDlPpiuFL+CrO8
         S/qg==
X-Forwarded-Encrypted: i=1; AJvYcCXwEDFrRb9c2BjPIeKP/7b4IuBcruUc15HQa/yOgtNZ99iB2HUJtd39o3G9lI1L0aGsYPdJd5lsNUOH@vger.kernel.org
X-Gm-Message-State: AOJu0YygjNl17mhV0aWgzLmi+peEscEhJ3RmNKLwSXQ8y1mWxUKgqOh6
	pZxBjO1knzXT/wSPbyhTaKc77s55muZouGsxMuubMbty9xq29y2kZF5xrYMhYOUSIceUs/cuw82
	ZBJF51j/GtaSiqBsBc5VEMESIiaQ7Po9IRgIYejdtGVvkWY+qnqw=
X-Gm-Gg: ASbGnctC+Hd0PQFVOzf6Hmr5B2W7r6LKEQ6YI8NQ3GUQo0zvr+dEs/CP6xfAFwvUgqz
	0cROqsGQ28kKaamCCAiaoLlPBQU2gsIhW8wdmFb6MvdIuvOULy3YcZhTQmelBLFSqNDwUhnw1AE
	6huQx1KjayX2aPUlG88l1bvKb/qaL2vKLe
X-Google-Smtp-Source: AGHT+IG5Frmll3jan8XW4q+c/ZaO7HyTn73Ya+M5QP0nrAUGDePv5va3dllLSktvNB1+Cx7B6+76W/dccZj2jM4v9L4=
X-Received: by 2002:a05:6512:228b:b0:545:154:52b0 with SMTP id
 2adb3069b0e04-54fc67c95e9mr6259507e87.22.1747127706188; Tue, 13 May 2025
 02:15:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428-csl42x-v2-0-e8056313968f@nxp.com> <20250428-csl42x-v2-9-e8056313968f@nxp.com>
In-Reply-To: <20250428-csl42x-v2-9-e8056313968f@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 11:14:54 +0200
X-Gm-Features: AX0GCFvRRz_CuxUgIsjJYkT-hxEyuMzIQVYUiGbnvV1LNLCfN6Vvua5kol4mBmU
Message-ID: <CACRpkdbBKo8Qp5em+CngJOAQF+FPohfsi_V2SLUpNEsim=XykQ@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] ASoC: codec: cs42l52: Convert to GPIO descriptors
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 4:11=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> of_gpio.h is deprecated, update the driver to use GPIO descriptors.
>  - Use devm_gpiod_get_optional to get GPIO descriptor with default
>    polarity GPIOD_OUT_LOW, set consumer name.
>  - Use gpiod_set_value_cansleep to configure output value.
>
> Checking the current driver using legacy GPIO API, the
> reset value is first output HIGH, then LOW, then HIGH.
>
> Checking the datasheet, the device remains in Power-down state until
> RESET pin is brought high.
>
> Since the driver has been here for quite long time and no complain on
> the reset flow, still follow original flow when using GPIOD
> descriptors.
>
> Per datasheet, the DTS polarity should be GPIOD_ACTIVE_LOW. The binding
> example use value 0(GPIOD_ACTIVE_HIGH) which seems wrong.
> And the binding use reset-gpio as example, not same as driver using
> "cirrus,reset-gpio", and there is no in-tree DTS has the device,
> so all should be fine with this patch.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

