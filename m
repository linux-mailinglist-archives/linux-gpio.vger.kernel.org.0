Return-Path: <linux-gpio+bounces-20048-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52850AB5552
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 14:54:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC870171F6C
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 12:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A280A28DF0C;
	Tue, 13 May 2025 12:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IBjDClJE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4252C347C7
	for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 12:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747140874; cv=none; b=klDHGSzShW9aDI9lCxbSdKToBBXf7BvSiMWaBTTYQgOWQ7UlMgVdPdfrymiEejjMyRj/prh6hfRh+1mP9l0DOlKRBJ8Jg7Bjhy9UM6ALTYkVGz+mCt3ExsVzBkKxgUDb6emVbYMuJOFze5GdYDJTUXE9AU8BDeRp4G4mEKXKNwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747140874; c=relaxed/simple;
	bh=FldTC7QPzO/JuYsWl1oV51mqVB8rbH1BdDCuwPf3AX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SsQS8p/a/8wcjAq8JB4xxwsZ6oDZDM6lCH+5maP32wrK8l1QH2seGmtJ59TM/cst+qJ5dd5jG6IK2cRgwvQ3IqB6h+SZLPYktolMBy1MTB10zHzy4wIEy/zvSp0WixGSoh9rY3+JPu0v8Cuqd6FpmOArsorIG7vaNMSgEI7inqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IBjDClJE; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3104ddb8051so59353111fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 05:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747140869; x=1747745669; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6OgU1k6A4H6ei9goCYDt4Oj811juJ96ljNmi3AbJV0=;
        b=IBjDClJEpm0vNhQ4L94lnHelAUHxiXLqCnDPMhWKMlflmIVS++Ne/4mZTMUivviHHU
         x+WkJQPSb8RTSUlGNCpzAKhSFlECxozKfHGzJpgZ8K0EB7YpyiZddR04/wvpW8LcYOHD
         fXW5Av0z7rou18ZN+riFWXV6iBocEPpZx3J87L7B/V73Y07eWzc3QLwi9Ap7uFz2cOex
         0eHZEmpsiHO+aox36YglnakUkPmkANcKy56eMmOZ/W9qpaY3++F+cEp2m6v7EvknmM5k
         8FS/qS7EaGZDuTupCpUp5Ia7sV1eMUAT+kSg6HRaMMUxwejLrU2MtSwkq/uY7fQ+EuKJ
         ABSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747140869; x=1747745669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f6OgU1k6A4H6ei9goCYDt4Oj811juJ96ljNmi3AbJV0=;
        b=dvpDJFA7HMA/y8S6eVN5KKuMgzFoS6FWxLPZ70k84OKB8tAWeq78BhdlMitZ0V00x2
         eHhjGPtrnWublAeiwZ1rFYNwqKvWDtRi/Rb3HhB0qy/VrasRbolSTBlO0ZZlVQJunAOZ
         Gu8kfXVUs8+/Ib1/CD6R8tkoC/8BS8I15lypaWW/ni2e2rHDmbypBaZOxiGqhleEiTjE
         E2dVptU6L9slvK0SmASNfYuD4FtG7CCeVnF0UbB5ikmdH1pp6NcfwrhKFZ4qQfuSP2Bl
         wCSfpMAOAGuLr8QwcmepnNYY/jtRPJ+wHobYq/f+BwTeyjVFWs8nsRtWZrXfX9j7NX1u
         YCZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhHd36eGzfkmKjE+y+upJAjJ/NZ6sQUwMun6QvV8uuypJ2/FClFL7AFRMHOhqaPVcyCIle8u03h0nE@vger.kernel.org
X-Gm-Message-State: AOJu0YxNjxWzgQHteQbjrJxna9Lo0NbQKOnIwQhZ/VvhflWTRBMMzavn
	orGO2wrbIacUIKcKPAJ9rk4DeiJwghmWxrgQugVZbW6LBsqHmo+ugGHshxCGgpSFPDVcU1RvnWi
	yOS3ZsLDzvdGPvEO+K3TQWNFibilYfJLaq5ahWA==
X-Gm-Gg: ASbGncvFAUXtziv/OGdwKWF1LkcwkbMr0Pzo3chwKoahcPTnMqY21sDE4hKyhIE2b9R
	NtKw/yxkYY8UIPkc9xfoi42GGexxr9LkpiC1gq262a8flUM+g+CcF68Q7La0YNSKoWCTvgYdlYU
	13mZ7KT/mMwaiZWTUywEbkLs3l2iDsd9Ijm6mNUNyRi40=
X-Google-Smtp-Source: AGHT+IFIqmhHDo8vb7POzdyLwF7ZPulGmRIq/MhufmURuwlm8UfvslfSSIYa2FrwrYENtbF5p5QmKMmvXbe1e8Aw0JE=
X-Received: by 2002:a2e:be89:0:b0:30b:fd28:a771 with SMTP id
 38308e7fff4ca-326c43ed095mr69143841fa.0.1747140869246; Tue, 13 May 2025
 05:54:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-csl42x-v3-0-e9496db544c4@nxp.com> <20250506-csl42x-v3-3-e9496db544c4@nxp.com>
In-Reply-To: <20250506-csl42x-v3-3-e9496db544c4@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 14:54:17 +0200
X-Gm-Features: AX0GCFsrWir3tfYihH5SvRkpnFH_pjBd6oI5teeB7olEtOSu9RNDEIYNOTiuEtM
Message-ID: <CACRpkdZj1j+mUA40+pdVz83UUqSR4Gow6Z6u5yQn48MCA7cQRw@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] ASoC: codec: cs42l56: Convert to GPIO descriptors
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 9:31=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

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

