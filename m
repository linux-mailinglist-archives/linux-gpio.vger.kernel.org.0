Return-Path: <linux-gpio+bounces-18047-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 83365A72BCF
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 09:51:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74293189A1E2
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 08:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B674120B210;
	Thu, 27 Mar 2025 08:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="KSCHo55b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C7320B1E5
	for <linux-gpio@vger.kernel.org>; Thu, 27 Mar 2025 08:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743065468; cv=none; b=Rgwz/RuitTIdO3bJtrPVl5NF96Za05gpBuZZKC4bXPHTiyzC8M9KJSyCNUNL7f57Om5SsMFHHK9JEbF4rI1Us1oFpoaKSdSk1ikCNvRGLsmGP+ohRRqjKzG8qCJDSx7TywxULOoPMvGvf0sPxU2DcAWta7UwNxbT9A+fIsWTwZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743065468; c=relaxed/simple;
	bh=Chd7hV87fMstfABp9jK5caNlln7CTMJpB06aC3hmqA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZfawypxAPjsoRHiP07MGpy9q5btqy638cFrDCg7W/OaezyPTVHuXsEWcZWx6ycVEvGVwVPGGadDfNC3Jm0aCjC32EFRtAfmKDMNQbVuZW74DRovFfxGlP3xj6ObgJ3/PpfrjMtwuHTC4i7YaF+NpzJvx++urTvJrGG6nrj2PU7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=KSCHo55b; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30613802a59so8367491fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 27 Mar 2025 01:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743065465; x=1743670265; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Chd7hV87fMstfABp9jK5caNlln7CTMJpB06aC3hmqA8=;
        b=KSCHo55bRWBA5XdXK8agew7wFlr0ZDszIuEN/1CNn4aVB54L02Oqmjy2YMnTAlu1EO
         X3xVTJvjHUHysLQunigsa0uC7Xqx6ZrVz7em0qEf/mEDigBp9y8m+shXyD3qnDAPJHxa
         kNLZUVZnPqO/ap1AYWO4WHoKjQbcsIniiY+yi9Mv6Kn8UBcANBMfuLoTNykJWInaGHZt
         +fW+yGtLzBFLWtOFZqvlV34VwxLT89IrBRQelkw3h9YTgPxVHIcjHfq7F5kgVaSWEB1x
         UgCbWa+3xJJjDVnGV1TSrLx70YF45OHOJaQbE9pf2UbZggIWCyK7EunKyUGEzd6bAMDC
         2BBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743065465; x=1743670265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Chd7hV87fMstfABp9jK5caNlln7CTMJpB06aC3hmqA8=;
        b=daCNbJIhSkDewcqMMjKC0NrV5EvOoc9NMcxxGxG9EyvEwoHKHlHfJH7hB18fjSYKm4
         dDdK8zxLW+cpOrABQZDC9Mg7ROZ1vGn2IkvZgAgXeQ0UtcFkASMikCBy3VCfEHwTzqYI
         vZsXZMSl5tnzQSZH0irO0hunRgaWtIHlHwxZgzzvEJR/liXt+VVadjHTvdHpVwGKgpsD
         KyyiiPIfC0rTpF9kpRz843BCSIz6DHkAlPDExX+qQEvxyRMpKgm2HF8VKF/aCZI5DaEx
         mZ75LXNbwRTQWVNnb4t1VhxAZdigdXlUfvx5yzouWYVQHytJGlDT0LUwylvJ4hWhQ+yI
         5BNw==
X-Forwarded-Encrypted: i=1; AJvYcCUi100iDKuGSHfDCQuurulEBkjlwmqOgnMCSwx+JJBwC2vlUWwd1S3VvWPupRmeOVUQSK2/jY7Go2rn@vger.kernel.org
X-Gm-Message-State: AOJu0YybeWebPLbfnYSpGw+MydBnfnn6bWhYMVwnFbYDOBsB1lD4B27A
	CWzFBIwvT1GihDcM5obJZJvs8J0ktuP789hX0RxurgwD05LZalsEAR+3gXt3K3ZfiLpSYSXLdyk
	zL5ODcd/3jiZQ9xKeKdaw0X+I1ABYjrVOIkbPQQ==
X-Gm-Gg: ASbGncu//bIikgxEn7SGGzPs+3zEUHix670PQrM4ln5Y99tSXa7svORYZAVzmZhLvvT
	lvAUycuScq8PoeA30BJaCe4UnDBWxTUBKj1HKMWZd8zI0ZDF8TmFYE1E0m2ov1CpQFli59IVQWV
	TybXy9f+QN+A94EH11HlIETXlWMWV9bhQcmPhvZxGk1OFZmHAzHnbuZAC60Q==
X-Google-Smtp-Source: AGHT+IFPu0lCqg/NzG55Hhzb5Yfk7gIP1B9dtoDG00BoDotsQb/t1nSt3ZrZXOd20MXHsbzYgrruADonZ7RBeFn8M8M=
X-Received: by 2002:a2e:9219:0:b0:30d:b8a5:9b8d with SMTP id
 38308e7fff4ca-30dc5de5c3bmr8771991fa.16.1743065464987; Thu, 27 Mar 2025
 01:51:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324-wcd-gpiod-v2-0-773f67ce3b56@nxp.com> <20250324-wcd-gpiod-v2-3-773f67ce3b56@nxp.com>
In-Reply-To: <20250324-wcd-gpiod-v2-3-773f67ce3b56@nxp.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 27 Mar 2025 09:50:54 +0100
X-Gm-Features: AQ5f1Jr1uyS1LW_ZZ-k16r10JDuLde-qlxl8EiU9L7CNTVYt_fgQcsPB2i5r2DM
Message-ID: <CAMRc=MdGs5_EFfieiRBwMV6p+7pM+cTCCQ7ZuiOmrR4OtFmffQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ASoC: codec: wcd9335: Convert to GPIO descriptors
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Steev Klimaszewski <steev@kali.org>, 
	Johan Hovold <johan@kernel.org>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2025 at 12:52=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.c=
om> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> of_gpio.h is deprecated, update the driver to use GPIO descriptors.
> - Use dev_gpiod_get to get GPIO descriptor.
> - Use gpiod_set_value to configure output value.
>
> With legacy of_gpio API, the driver set gpio value 0 to assert reset,
> and 1 to deassert reset. And the reset-gpios use GPIO_ACTIVE_LOW flag in
> DTS, so set GPIOD_OUT_LOW when get GPIO descriptors, and set value 1 mean=
s
> output low, set value 0 means output high with gpiod API.
>
> The in-tree DTS files have the right polarity set up already so we can
> expect this to "just work"
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

