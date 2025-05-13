Return-Path: <linux-gpio+bounces-20011-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBDFAB4EF6
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 11:14:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D3B03ABA84
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 09:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA1F213236;
	Tue, 13 May 2025 09:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pBwloJcf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F64213224
	for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 09:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747127675; cv=none; b=QUgo9jCxbc6rSU7qWak59Id+16F04PD2uChrIKmATFGMILXCZ2YDWBIllDpj6u5vWZauZuz0jSvhcWS4OjYCvaedYV7VdLr7ADo9hdYUdi/a8Zoa+VrWtA3UqeW4DlM5iHGfMU2rqypMPCCCWFx52l0VowSGn2LhoFVFT2/StOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747127675; c=relaxed/simple;
	bh=Q/uYcJFCRbi9n0RluKfB8+V7rsioHHS6ix++3RBibK0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rCNTqFEyvBf6ysugPPR3213RRny3H/1LX3wmQLKEiCov9EHY3urK6jG5vieY4xtY4RIU3ft91GclfYtdwA7jaJKR+Av77V4hMb0cxU8xX9ozx4IvMR3WAFAEzJJvBZz68g6ide2rMpvPxxrcEAbAjm+DGTd7CYsSAU0qDk3wQGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pBwloJcf; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30bfe0d2b6dso51610041fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 02:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747127672; x=1747732472; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sPT2M7dQVCwoY0XoZtxpGqSt0WuF/VvupzxxIVxiXT4=;
        b=pBwloJcf+Zl8Km/4WgQ6d3MrxKrBWxYO4bxgQXApWoswbs5LN15rckFKaxei7/Q3/r
         Kg2doc5MewW750xKwtW4HSuW+Jt4TQg8kg++gct3fvbJ/UYn0LKz5E7cG0erzcwdTk9v
         40M/sFzrxgw4u4IJwFbzvJMcM3k7cM6QNqOmXbw/k8tS9xeK2Qbc8rhu232YlHHaXtGO
         ZHgHhcP3VK5NpoU8IoIl3DKiZUfD8B6kMWCiA0fItHklaIqZX/iRWgvIx9FQru61mJTm
         iMOgNXp8ufyr+fG0xyrxsOJDIDj1VzeYG8xwKgGgQBPrZTcCnRNOdJ+8EvIoSZ5UAhaH
         w/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747127672; x=1747732472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sPT2M7dQVCwoY0XoZtxpGqSt0WuF/VvupzxxIVxiXT4=;
        b=P9FzGFihfViBEfJgrwZXy/rsaF7FoEudTgCMmAIVeSjhycB7QRabvDDA5G8cqUX85P
         z2Ohgl96tJK2OHttx3LAMMk3bBEJxSm6vFvtZ8HAfg4talRp541AfW5acI9xUyKiQY6H
         djH78M8262oISjCgmYF+a69RKlvGANLQ+q4RpUN1iFWr+cEmhFOgwZrZGrGQ5esBvnrs
         IFtubjb5h9n/W5sfXRxQiVepFC18LWu1AUlbXyF8hygpzIhLlK5RV+X3PoRmHAFaFwWT
         4YrOdtUPj1t1GEBoxn1ZrpqyuxSuuNUgvQ2EXY5OspMqPF2aylmnWZijA7DM6wP58LQx
         dYIA==
X-Forwarded-Encrypted: i=1; AJvYcCXpTvB9Q2bpLGUxuQWZjsbxR0cbXcbeC6NxVqySTVx/LtuKnw99g014jhhq+n6POJYNl/zdR0w+jB62@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv8uoSI9tXN2Y3OCufyisKYYxh9YHdW1kL2NoNLsyxxWljuIdV
	ye6DAfNF4qcVrgFT8r12XTzZUrj0hd3ykGY5yi9bmqt7uuvboyYLcG19u27vk3H87NCWj2hfjIg
	Xo6hE2cNkPsQ1r62hQwUDY4eZFg1z3xiPqj/0SQ==
X-Gm-Gg: ASbGnctcMdGRr3HvV40ho3HWNbXJ9aD9ZG30uz8NOgKehmoUtkSSf1S/x9HeeqA38bK
	+6mrgfkY1W25X5gxBCOAbv9JM3pcdpmYriqia1raN9WZhmmKQQ7UP93Iq7fiPOdPEugHQ5BTaWN
	x+gyZoBBqsIJEvYAsQs0Up92XmxMGeAp/cKCzypPEjhnY=
X-Google-Smtp-Source: AGHT+IGT90r08/EPJLa7xFcHs8dEZsvVwsKtrD3SYtO3tsoUT874GSFGtEC0f0XouGML5FKHHLXmAaxRLlyV0iZOEsA=
X-Received: by 2002:a2e:bc86:0:b0:30a:4484:3ee1 with SMTP id
 38308e7fff4ca-326c45b2d9dmr66266921fa.23.1747127671769; Tue, 13 May 2025
 02:14:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428-csl42x-v2-0-e8056313968f@nxp.com> <20250428-csl42x-v2-6-e8056313968f@nxp.com>
In-Reply-To: <20250428-csl42x-v2-6-e8056313968f@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 11:14:20 +0200
X-Gm-Features: AX0GCFtWkMHEg69iQwsAHSe7I8-KBbaQqEui6BZnMH014mzUZ6UC1gyIf1ZRxWU
Message-ID: <CACRpkdZUxp3N+s=WdQGm8zpFP19LKUveN_5P+tfWi3OLeZWRxg@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] ASoC: codec: cs42l73: Convert to GPIO descriptors
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
> reset value is first output HIGH, then LOW, then HIGH.
>
> Checking the datasheet, Hold RESET LOW (active) until all the power
> supply rails have risen to greater than or equal to the minimum
> recommended operating voltages.
>
> Since the driver has been here for quite long time and no complain on
> the reset flow, still follow original flow when using GPIOD
> descriptors.
>
> Per datasheet, the DTS polarity should be GPIOD_ACTIVE_LOW. The binding
> example use value 0(GPIOD_ACTIVE_HIGH) which seems wrong. There is
> no in-tree DTS has the device, so all should be fine.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

