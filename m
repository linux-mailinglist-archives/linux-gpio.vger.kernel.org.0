Return-Path: <linux-gpio+bounces-20050-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B085AAB555B
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 14:56:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 243FF1B4670B
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 12:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39B1F28DF0F;
	Tue, 13 May 2025 12:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z52omiM/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0DF171CD
	for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 12:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747140938; cv=none; b=TrMEhBMGaUlviaSUs2gmqm0dPFK3uVbgfzcvRzvd4VGUKm3BPWrFAVgIJzySfL8FsBWmMkpHFRXzmC2Yh1B34krEdfrpiMLv+8+hqainClkzq0yBY20SI57QTFGlzfJk9grbJrGqPTUxAnRmYfmCbdeCcIXLbNSo70KAtXtbluA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747140938; c=relaxed/simple;
	bh=iylBZ6YAVkkMCPfAbOKWmfwqvwPCdi6SPesOAiL14QI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=drtnvWlsGAfEiQQsQGy2v2oiuCmDdh+xLUKLbdbJ9JfrJ9nSzbaZb3VRr0FiRXzz5xGxT5Snu29QkPHAT3nNIJs6ic8M3MAMseMdkGzZBMX7Z3249/+jMV+8XhqrsEdPFEda+KrsphZo4/TBJolfyWztbvwNmJFiDLhYNOOhjG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z52omiM/; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54e816aeca6so7889697e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 05:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747140934; x=1747745734; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1xNrA0HPyCfJuTLRUZWT26fcpFWFmzMVhhKAX2/RlI=;
        b=z52omiM/mz4Cl8dd7yBrOlhVU8SenHLAMwaF7+1aghOdVKH12oQqsN34CzrYeDpvPM
         H6awPiEGVjzo6GmiMDHl7d+703bcW3BHF+ZS5puhc0ykRyjIDTUwcL+OOFtvtq1zceEu
         zGawtUFsbV0QB9AzM7ayo+gBhOzRKEKfdn+i/0yJv3/GU4w1uH93jafm1O5i0FULkUO8
         RcsPCxb6Rl+jpaWw/mlpmTTQ+Xh2JtXd62Tn3YONbmwghDtzDozDbs5X+3QcQ8T1pngk
         wlQAoA08YG41eJYuRn1lrAo29/FjjeycpsZ718fiXd84PRNZ2C2o7JuVanz+H1WAsebt
         GkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747140934; x=1747745734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y1xNrA0HPyCfJuTLRUZWT26fcpFWFmzMVhhKAX2/RlI=;
        b=jp+ZvdG3rFXO64MCZmn7hJUWSzsDwvfICI0rjqGBX4Rum/fkTiq3yKdGdWSO+rI/2L
         L/7/8x+PpiAjB+WuXtsa6JPc6NRJx750NCp0mY8AX+XuV0iQAof/+DhbfChpihgvH9S5
         Pm5P4uJ1fuAbydXhgBuY4RuRUGePI8jRAntyJNvQBkEUED2yLv8xvup/tl6Xo8dLZGBo
         9z5+Y7VDygqYr+2RrELTEnqPtNno2trE1kWSt71ktIDJkaJV9B7YuGRiq++HvtFvi3AJ
         dzvLRqXzUj1euhav41mcHSUa4QVm7yAJhF3kiNPin9/LwIpPi/OyavbqaYZT2AZxOq7b
         +vvA==
X-Forwarded-Encrypted: i=1; AJvYcCWOU8/HVTLh/+lqUGxjqAv2jL9LP0T6suca6vdkkdWcXlZr+9TG75KdNLlfqh2mrc2FFg2WsdIvnlhv@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1NmSk1C5V+qMbOEf9NA/wom6YlXEdFZ0qfbxPiORUoxG8mfM9
	GIWwpJQwJz4kzOSilsMdyD6piiqoWbxM+9ypRGeMtmqglwT5yU5F3kg9daoOSBt/N513yh6wnf7
	EyQRGo5vXRh+PSj1V/aAJzHoa6vfl+sinpx8ySg==
X-Gm-Gg: ASbGnctKPQG4pgNkQx6StdmXNqeTk7xyLdrzJO4MUMBAZkp7lmfa8G8qO+cTPxG6Zys
	a09pqycPYWoX3ORj72yQBKP6CQ0mp5rBUmH7QiNEMe3wKRmWlw6ofIRTBphyKF1DqiGLJw0HgYB
	th7mOZVltjFDwJqQLgeP424fZfGTOIY6cL
X-Google-Smtp-Source: AGHT+IHGovcuelmkIHIcldh5FppOD2U89RgWqFm070+YuOgGBNXYGlP0KiMRTWQlufrTDljXXvF3C/mspJXZOd7T2qA=
X-Received: by 2002:a05:6512:608b:b0:54d:6aa1:8f5a with SMTP id
 2adb3069b0e04-54fc67b883fmr5938671e87.13.1747140934068; Tue, 13 May 2025
 05:55:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-csl42x-v3-0-e9496db544c4@nxp.com> <20250506-csl42x-v3-6-e9496db544c4@nxp.com>
In-Reply-To: <20250506-csl42x-v3-6-e9496db544c4@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 14:55:22 +0200
X-Gm-Features: AX0GCFtLssLQUl20MHg0DqNZT_Bw55zYPugiENgOkv8p9lbTgkALLpNTHQswSks
Message-ID: <CACRpkda+QuDqBf4MvpE2=w=tg=EkDnA_dnfg4+kt6k2bJNtBrA@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] ASoC: codec: cs42l73: Convert to GPIO descriptors
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

