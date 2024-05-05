Return-Path: <linux-gpio+bounces-6113-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A66438BC058
	for <lists+linux-gpio@lfdr.de>; Sun,  5 May 2024 14:23:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EBFF4B21001
	for <lists+linux-gpio@lfdr.de>; Sun,  5 May 2024 12:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD0FF18C36;
	Sun,  5 May 2024 12:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1rzayCna"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6604186A
	for <linux-gpio@vger.kernel.org>; Sun,  5 May 2024 12:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714911791; cv=none; b=Aue8qonIZtAD65JAeawFiD8e9I6joTipUAxnoZ03CJaSN5tDAY/KtzIKUP9w4czK/PqWTQsHeJvJymtm2P+h0KfhQNpMFxe9UygrrGHZlhjavPfMsqPAdowhiqqJyzBGgqn4p5V5rV0tJXeLFL3PuYEEaAcAQtgNK0NDM1NUmzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714911791; c=relaxed/simple;
	bh=E2e+KBmb9YTZIQNw7gyRcdAdxmO8Wo+zcNDYQn6wDQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UVjEInMvUsqkVb1SaBiYQZFNqrAYZS3Nxv+LvDV22IN5p9Y+GKlSkDpUrIaBJuxClIlt7IEaruRdfkNZi/3yb3CQwI0ADJUJAGM2tHNOEDEQbtNmu84sr+I31xNIxTFhB8QHteDcDVO0CPTLrXiqCjsJriEF2HSP7uTGRVTPArc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1rzayCna; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2db17e8767cso13553061fa.3
        for <linux-gpio@vger.kernel.org>; Sun, 05 May 2024 05:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1714911787; x=1715516587; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HSAr4n5Bmz/3NAuqmrIGiy0YoVXgzQXcdQqMh5u4C3w=;
        b=1rzayCnaxyHOzto+mDJPLTWQkHDzAOI+Prtb16+WjlkDdcWlvzuUdnrFEBIweORjeU
         74zPT7u915252rS8GHjvqhPSsBsyGgHVRoAuJNtpMKFk7t4wxEzd+9AsdL+03AzrSuEu
         n+0yT63Do64C6RtAU3EQyrGv3xsxKZ9105k7apwfOK+Jx5U8ijH8jkaFOwPBYDI1Hse/
         SPSar6mSHL6j/fKGca2hMJ4UzI0Qwmqfx10f9YzRSpv+vSlSR1K/flRO0IBR8oW2DFQ5
         wxgxXqzmYKJh17FGpMM0cZ/8WMrsG0udMyLa5NcWcT4StQapchgJWp/GX3B+yDapy3wq
         zasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714911787; x=1715516587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HSAr4n5Bmz/3NAuqmrIGiy0YoVXgzQXcdQqMh5u4C3w=;
        b=uPBPQYrRnvk7q1cNzCfqyGvoUy+CHOKA46orpL4v44hHuFW6NpTZwGybjlDF2d0nMy
         neqOu2U2ggpEchD32JY2ay+DIBPi8fY5A2k0MbQMJFwwRRtZox1ClXcUnCu40SzAYW4o
         iGhxrHO/MwuM4NJUyeUbCXZ42G38bJx20i2qPqJyf79d7acGQsLPEzsMcbssQrNi6BGa
         ZH78XW2mQeaTfZFM1VhPClBJJU7duXjTc5Nc5rfcFK9ffEj6wfO1wRNlXiMHnlrM8MJ4
         kQv09PUdjVoYjrZCnHqruFkQb0rfwYAMmVumZ2g8voqcRyie9Nn8n+Wk+s/cKR5wAlgY
         Q+WQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8tqKcyAihtYh8+niOcPyCDwYQqBjo5vf2q9F5FfLoUyMGS3v3qBSVbb7HZzUDX3c1wt1rvB4pDAea64XCjYw0iuJBKHkEMHzzaA==
X-Gm-Message-State: AOJu0YzvQZoBTw144ZUogWojsj0N33FhG62lTzfs06mhhDxYbKDl6iff
	g8U3KExVLvLiK2SkE1oo4lnL78iqri003B0RF5ULuZdGE0q1xN7LcyCN6SPEFc79aXV6COzWEWg
	QNFxUEVhf9ADk6AKXY9R5LfoOLNwYkKjDm61zCQ==
X-Google-Smtp-Source: AGHT+IH4OgvhpTuR8NUJ0jT6ZYIBg3xi09T3TZ+qCyKws+N3dIcP80CxmF73NvNBxMflur5QUexUGUAZiSDxbWdANgc=
X-Received: by 2002:a05:6512:1256:b0:51d:4c0a:a512 with SMTP id
 fb22-20020a056512125600b0051d4c0aa512mr6180164lfb.68.1714911786804; Sun, 05
 May 2024 05:23:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2d27e1ad360dec2c3d78d9800bc93ecb6f9b50c5.1714573214.git.lorenzo@kernel.org>
In-Reply-To: <2d27e1ad360dec2c3d78d9800bc93ecb6f9b50c5.1714573214.git.lorenzo@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sun, 5 May 2024 14:22:55 +0200
Message-ID: <CAMRc=MeQp6FFhXSr1HbvVAd+D3wOsmtLvoxjt7QmT2a=NNTHmA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: airoha: en7581: Add gpio controller nodes
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, nbd@nbd.name, 
	john@phrozen.org, devicetree@vger.kernel.org, dd@embedd.com, 
	catalin.marinas@arm.com, will@kernel.org, upstream@airoha.com, 
	lorenzo.bianconi83@gmail.com, angelogioacchino.delregno@collabora.com, 
	linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 1, 2024 at 4:26=E2=80=AFPM Lorenzo Bianconi <lorenzo@kernel.org=
> wrote:
>
> Introduce the Airoha EN7581 gpio nodes in Airoha EN7581 dtsi
>
> Tested-by: Rajeev Kumar <Rajeev.Kumar@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
> This patch is based on the following pending patch:
> https://patchwork.kernel.org/project/spi-devel-general/patch/189790802f3b=
a1a80c4ab5e064b2425e5a360098.1714571980.git.lorenzo@kernel.org/
> ---
>  arch/arm64/boot/dts/airoha/en7581.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts=
/airoha/en7581.dtsi
> index 98c2a86086e1..5d0d76cecfe0 100644
> --- a/arch/arm64/boot/dts/airoha/en7581.dtsi
> +++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
> @@ -178,5 +178,25 @@ spi_nand: nand@0 {
>                                 spi-rx-bus-width =3D <2>;
>                         };
>                 };
> +
> +               gpio0: gpio@1fbf0200 {

These labels are not used anywhere.

Bart

> +                       compatible =3D "airoha,en7523-gpio";
> +                       reg =3D <0 0x1fbf0204 0 0x4>,
> +                             <0 0x1fbf0200 0 0x4>,
> +                             <0 0x1fbf0220 0 0x4>,
> +                             <0 0x1fbf0214 0 0x4>;
> +                       gpio-controller;
> +                       #gpio-cells =3D <2>;
> +               };
> +
> +               gpio1: gpio@1fbf0270 {
> +                       compatible =3D "airoha,en7523-gpio";
> +                       reg =3D <0 0x1fbf0270 0 0x4>,
> +                             <0 0x1fbf0260 0 0x4>,
> +                             <0 0x1fbf0264 0 0x4>,
> +                             <0 0x1fbf0278 0 0x4>;
> +                       gpio-controller;
> +                       #gpio-cells =3D <2>;
> +               };
>         };
>  };
> --
> 2.44.0
>

