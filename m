Return-Path: <linux-gpio+bounces-20051-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCC5AB5560
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 14:56:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FFD71B46CCE
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 12:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3BDA28DF2C;
	Tue, 13 May 2025 12:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GHnh/U3y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009FD286439
	for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 12:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747140967; cv=none; b=AQUQkvePZ0ikeQQjRJ7bwS40k7TEgpZnr1eCiY0F1OoNU1SiPQsclFD8URyLZI2p9bpqH+CiUS+R8rk+9OA/1gaUVDcCmrRHGrZtaI1yA4dpvnLtbQcpX3sSFekyjMS1znK0dkBYxilGNUHulelWojF5bVZ03JrUNMJ8wiuo9vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747140967; c=relaxed/simple;
	bh=3DeTAi1I6ja/kcy7TOnjzoICqTpw6MKwiMgn5ZsOA6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BA+zSpbxV0ndBBRLbRdeNuUsgGg2o6FyTBcPlfDippF9y3mGVIR4yQoX6243nquTf24U9A4hpldyCSl0fiKBo4Lvc2s+4Mswiawvw6LVUiOWrUsotyT2iy5HCt1jXJJHj+Wn9dX7m9OEJS9YOVkAWX7MZFSxJi/H4HpgzHlBlqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GHnh/U3y; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54d98aa5981so8925050e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 05:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747140964; x=1747745764; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TnrDtFR/wUG3jSxJnmOhIX6bU0T3LAwlfTt3Gj6//94=;
        b=GHnh/U3yvQrPTI0GH2bf0nV1zxKYGm2ZXsTC9oWcIXAdnB02vdmyDkmbkSI6UeV2mZ
         D1Mf9xXNOKb54qE8AePLn4uKvjJMN0B60MzmW52OKyXxwZW1KDyv6TLFpC3MFtAorU3E
         QHdhY2V8xdmTfrMtFDPcemFptGugU/+QH/AkMZYxHHrzUzUJ5m+t/3u+K+W+eekaMBno
         j6sx8okRX+x0oobgF3DWk1uVaiDthsx2aKqACavpj4qK9zsqRAVPT29Ub3m/OyqIsfVJ
         ZWNtvgGsEgZ08HIYGvdxJ4Pjmq1uK4XqQbFQSfs5UCcUskqG6T/ce7fmW3q5BQBcBPrO
         KOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747140964; x=1747745764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TnrDtFR/wUG3jSxJnmOhIX6bU0T3LAwlfTt3Gj6//94=;
        b=tK2R+xwoqmw+K3d1YQRJSv3A0s7Ah9fr+kmV935XCks6vJXRP9zJyGjL/bQtP3oAK1
         QwUCySmiEfkpa+VHzFVOhc0uikb0mN+xzb5xumZAKkUtnoD35XXxpwH/SoitKXgXzd9m
         067RslwUSSmfKmN7Njabm+0hgkKbb36Hi0eYxmHrDcZwNPyp6QDG4yywODswGNwNibp+
         wlmz2thLDdWVcW8/u2fu6zCe95+KI62++h/lQ5WhPZuHH5P8h23yz4T4FQxakH+O16bf
         XmGKh4EbG0pE4CpMqSOndaZxq3NFXgbl1F2lQC+NuPZycsBQ3nondf9V57gMp8GYE6gO
         gBGw==
X-Forwarded-Encrypted: i=1; AJvYcCV0U5FdJlTMUs85Sc1O7vxL7Of9fD/+kISszimJkS9qpWDsqX1gr4QNn63miFi9wlFupnllCM1QsAND@vger.kernel.org
X-Gm-Message-State: AOJu0YzBwuRQmK3HJmnSfX+aoKmXkhimqzV9X4e0tAV/495v4yhmj6gq
	JNVjyekqunJOe66DdQIJIf9mm5W/9mV0LK9PKafceAYSP8OtpRrR2IK3qiy50dJrOYdNoT+vgJE
	zMM15XSAk9sAXtRFOU1CwPghtJ9EgcpkTalHR+g==
X-Gm-Gg: ASbGncscNmWDWriDtP6mt5mL0xQaefNaq7TfQjY+VPB979T/wwfWXmkCatSrI5SgwtF
	ResB+Tss5qTjGCRdgjEHqSZ9m58nBgeADTsTe8B9NlSyp2SvG51MNs9n/Dha53dQwpslyLyoNv9
	7knMEHld3pR0BqEZwXou7Uku1l6MAb4+m4
X-Google-Smtp-Source: AGHT+IGn3b+7Zh7S//+wx+Xxtb6ZBtSzHkIJbXRsy4U2x/LmPx9JYtJc5JoaPFpYaECnMq8H1yt+/F1ni3yf6HVA9Sc=
X-Received: by 2002:a05:6512:1194:b0:54a:cc04:ea24 with SMTP id
 2adb3069b0e04-54fc67e7ea7mr5900714e87.46.1747140963389; Tue, 13 May 2025
 05:56:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-csl42x-v3-0-e9496db544c4@nxp.com> <20250506-csl42x-v3-9-e9496db544c4@nxp.com>
In-Reply-To: <20250506-csl42x-v3-9-e9496db544c4@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 14:55:51 +0200
X-Gm-Features: AX0GCFtFzSwk7eRmxngH80W_FVCoWA7VvCWFx4m0A5ByX0Uxkd3cGc7bhazETXQ
Message-ID: <CACRpkdbcCGVQca4arnRD4rc1W+4L5g3yT8VTb35G1CrwgBfvAw@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] ASoC: codec: cs42l52: Convert to GPIO descriptors
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

