Return-Path: <linux-gpio+bounces-15898-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 469B6A339BF
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 09:14:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2DE2164C31
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 08:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B02120B7EB;
	Thu, 13 Feb 2025 08:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qmucnGDk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFD220B20E
	for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 08:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739434463; cv=none; b=IKiPkwVJBFYsyTcM5Yhrx9+i5EONUeZyKHwOrbwrag0CU9N+XZzmVd5C5hAylFpXULHvS/NQokvJY7iLSdXSCYrgWNrYjXamyaAmjclWV6ie4+z7+ubO+MffbPYykN46JIj8lXk51GkgcNWEcVEtOBkTcM6dXn1+WSKqDwxNOZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739434463; c=relaxed/simple;
	bh=oxo5VknzmyosiN70TxoSyT6j6915qRwF1UviL6zfZrg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nU5kNI9Kb2s+xecej0YdaWblIuMuLhcR/kCvSm4ItSKSv8V+od6J8wQgKUY8h0v2HiF9cygHn5T/mOrwyQGMdAYbj5kSiM6NtYHbPiLqCXSQLSM2d1gpcHD+wYRiiHBjCUEpW3wXWFKl5Xrk002VLM52tsPPODPlh+XU34c8N2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qmucnGDk; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30902641fc2so5405361fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 00:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739434458; x=1740039258; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1ki+G0JPNrh9TGAEWfL+l/C4IFlJkUDv2DnvQNOIs8=;
        b=qmucnGDkYWFAZ67tP5m/CF9AuKWzO+jYMga2gfRdneE8x/vXg+2q2E5L32cClL4yzX
         NgUnH4boMBd/Kgg3/YgqBcgEZwosmI1sYy2yG5GbyYBnNgghh+/ZgNGiyo+5swWTLamg
         yLk64KmhTSqLRzSGBPpfttRSGUxw4YsK2wOVymeqsikZ3oa/0gAOXF9hPp3q7m3m54HK
         alRFQCIGDsAolfmV/TE5JweUltRv5TsgrzMLscCkDYQIjTa0/XNVLIS5XR+mIv8d6+7e
         YLDcYRz5LlqlYpzFds6SEcZPHCAOSdcwIUdiU89zBqRvyjk2kRSBigOvO+lpJWdSV+G4
         PkAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739434458; x=1740039258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J1ki+G0JPNrh9TGAEWfL+l/C4IFlJkUDv2DnvQNOIs8=;
        b=MxhEn0P8nteamOfrCPRB10HgCxT8GO1ab9j4kew2Nu3nNrDI3pIWEtaZGyTSxy1L68
         o786YuT8hr9ulUxZWQY8W7FMzsPhie3bLAWALkjl6WdENSvcHh3Ap/EcaQr6GUPVGPNO
         pCI4k3y2u10LnZF34uLTBLULl7ovHobIZWh5ZRbXvC4YprHDzQyP8CaLNfY2UYSTMO/g
         CoPKvyQNv4BGUOx8Tg6qoTKF1kC5d/GU8+o17iOEnX4zQGxqI3XT294jw7HzsrOlrhq6
         EpwfatEr1tFjVwMPkx8JH0V+BIl42W8sXl4xKm1ztaX0KzGGxJUr+j2IMpItctotyV3U
         lavg==
X-Forwarded-Encrypted: i=1; AJvYcCV0hoVEmpJsjmfH+H0ClUAHJgbO9/LC7L/WWA7jinkJbWBBEHKaOKoHCEDZX//tgKZmBJKD8//dDasP@vger.kernel.org
X-Gm-Message-State: AOJu0YzqLVVsC7x6n/9qIpDK/V4YksrGNMfmavgcrwE0UY6dRrU/aYha
	+TfF5ac75TFLTZZ6LNyS2Sbjew7VEIKzUuQ/W+JJSM9OqjsI1nVAbnXSs/7HuwznvgVK9FjQhdK
	efZsS0sQnVMQ9/7OvsUVGtoid+/OlBWcDK0rN
X-Gm-Gg: ASbGncuGvnu/fq4R7l7Z+rt1VQPwd8tsdFJP1hPLZvYrmC8hae1n5jMeIe8uqx1q2Ie
	vMfVQnQJUL/Dr7I4pH6Pl8NuzIU3e0YCNbp3Olcrk5IV3eRTu6IxfGrYfSjhF7hI1ceqOYEw=
X-Google-Smtp-Source: AGHT+IHf9iq2n1PUU5HCWe9soaH4SFA9WbopYOlEastjkCTCAX4hoUJGTt7Zw2wOUBlbY2AJ3VKHXgQD1OrOSfhwXZM=
X-Received: by 2002:a2e:bc85:0:b0:2fb:cc0:2a05 with SMTP id
 38308e7fff4ca-3090ddd1604mr8206891fa.37.1739434457896; Thu, 13 Feb 2025
 00:14:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com> <20250120-scmi-fwdevlink-v2-4-3af2fa37dbac@nxp.com>
In-Reply-To: <20250120-scmi-fwdevlink-v2-4-3af2fa37dbac@nxp.com>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 13 Feb 2025 00:13:41 -0800
X-Gm-Features: AWEUYZkG9pGG1E2hWQ62JNBsrZ94QFIvS7VdMRQU29qCe8Cm2dCEy_nhw7vZ3rE
Message-ID: <CAGETcx9E1MYgzd7Hupz8YAqk7-D1Aeb+AAyQiEMia-6hnFQTRQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] pinctrl: scmi: Switch to use machine_blocklist
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 19, 2025 at 11:14=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.c=
om> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> With machine_blocklist, the blocked machines will not have pinctrl scmi
> devices created. The fw_devlink will link consumer and supplier
> correctly.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/pinctrl/pinctrl-scmi.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scm=
i.c
> index df4bbcd7d1d59ac2c8ddc320dc10d702ad1ed5b2..f041478758b50e85d99214f4f=
e42208d0c8c808f 100644
> --- a/drivers/pinctrl/pinctrl-scmi.c
> +++ b/drivers/pinctrl/pinctrl-scmi.c
> @@ -505,11 +505,6 @@ static int pinctrl_scmi_get_pins(struct scmi_pinctrl=
 *pmx,
>         return 0;
>  }
>
> -static const char * const scmi_pinctrl_blocklist[] =3D {
> -       "fsl,imx95",
> -       NULL
> -};
> -
>  static int scmi_pinctrl_probe(struct scmi_device *sdev)
>  {
>         int ret;
> @@ -521,9 +516,6 @@ static int scmi_pinctrl_probe(struct scmi_device *sde=
v)
>         if (!sdev->handle)
>                 return -EINVAL;
>
> -       if (of_machine_compatible_match(scmi_pinctrl_blocklist))
> -               return -ENODEV;
> -
>         handle =3D sdev->handle;
>
>         pinctrl_ops =3D handle->devm_protocol_get(sdev, SCMI_PROTOCOL_PIN=
CTRL, &ph);
> @@ -561,8 +553,13 @@ static int scmi_pinctrl_probe(struct scmi_device *sd=
ev)
>         return pinctrl_enable(pmx->pctldev);
>  }
>
> +static const char * const scmi_pinctrl_blocklist[] =3D {
> +       "fsl,imx95",
> +       NULL
> +};
> +
>  static const struct scmi_device_id scmi_id_table[] =3D {
> -       { SCMI_PROTOCOL_PINCTRL, "pinctrl" },
> +       { SCMI_PROTOCOL_PINCTRL, "pinctrl", scmi_pinctrl_blocklist, NULL =
},
>         { }
>  };
>  MODULE_DEVICE_TABLE(scmi, scmi_id_table);
>

Definite NACK to this. Please don't depend on indirect
conditions/flags. There's no guarantee that this check will hold true
in the future.

-Saravana

