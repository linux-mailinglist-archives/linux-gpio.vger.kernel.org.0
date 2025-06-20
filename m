Return-Path: <linux-gpio+bounces-21938-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED02FAE1C55
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 15:37:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 829AE172E5E
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 13:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 184CB28C01C;
	Fri, 20 Jun 2025 13:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ci4zGjDF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FB31E515
	for <linux-gpio@vger.kernel.org>; Fri, 20 Jun 2025 13:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750426629; cv=none; b=gNIHJXDZqLrz0tz6eZ7KqaxzerDctgKVs6RScUr/mAvxaavUv+9VfVDayZaqxA1c0p5+yDOdAcrLjRZYvehhi6oOHKVIV0SbLWX/FPlQuEhCHnEZEWC38feoHoJK+0HnWgJWagc0wGTGwrNVjIWmedXfTQtN1kDYi11dOgpwXl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750426629; c=relaxed/simple;
	bh=M0YT2iBaogn/DyTFdR1V9sCYLGYvYdijypQw0oPDd3E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YjO9ul8ekG3BcnOfmvHjnpU9sC28Q8GvDxfzL/1w3q1W8kwBvSyQOiev6UjCM9vgy7sfjjEww9mJ3VeWuHmQruiS35qiWzs/6nWgdzt6KpDfYCqhq+x1waNFt+8nmsWQcFpoqRskZsmyPdePHbtknJwAxcChTJJxJUfYlKtO3Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ci4zGjDF; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553e5df44f8so536079e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jun 2025 06:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750426625; x=1751031425; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4aJt4fkup5IZNsrpvVhEKVipXbYCZJtOBbKMV7cDmJU=;
        b=ci4zGjDFWHYuu0WmVl9fluwbbv4bE3t1sFzuIOyfRkehuAcoUZGUJxGMVSMMcKexJW
         unnVOFcFe5J+nMU7ujtEflCPJtY1/W3PwYcLpfDYy6zATpZID/wdXvcp1GdQV2ZLedDK
         7B45w58ZmPPlXVczKv5mG+UIx1sQO7luYxJH2AeymvpOuoohxY6knJoXJ2JIo2W05cxU
         TsjtlMGYlwsiCv+p9lGnTIZLygFNNzaV3n0TBaywRiRlxnn3/PtAfQG+Viqcpy832DSM
         jLt+X0nsyvlBz9S4lKp7KEk8HkIEbDsrEHoiv19C4+Q54SWDRfMshHMQ5KYQ/W9EULwj
         kL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750426625; x=1751031425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4aJt4fkup5IZNsrpvVhEKVipXbYCZJtOBbKMV7cDmJU=;
        b=Zi4UvTJz3dQZDjyPjcYIP5dLik0jsn9JtX+hgqI9UB/4VyTV6gbxUeZ1e/FD+erUZF
         GKyeDC/Ae+qGwa91Vf+yeciJt3zeTzQrffAS7NTBwI48lTBo6/hzzxzoiBrEZMhkna7z
         +dchDFsAse0cm+Y5bAO9EOtNsalqdGHaBRuNSq4xakJaGkFaIADfASYOeH/5ytqXAMn4
         dYNZYm79mdG7/+/xWho/ImpLNA8yD6QG0O1/VEE5oiHF6vnt/JpAItHJxU+kjIhoMBqk
         9kAjIKs03v5aZ64g3gudo4Zk2uOprljCEi5YOSVwNZ/50hisdY0R8vixa0Zu/g1mr8x9
         WAkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQblg6Hvtuh8br8jwB7RFrkJeW2pKSsE9/sm4K3F9JX87pkDWjwdjHzy/kGvCx8CfHnvVENLOkHN0n@vger.kernel.org
X-Gm-Message-State: AOJu0YwVgf+LTMuBN6m+qrA5LuqkBBIPSzwogQhP8pXGzCt76uoRMNvr
	CBFCmzcx578nfwCXK2neEz1FaVlZHIiUFUrcn6CgtxTU9wrX6F8CZ2XDsITVBZibFcpDfqRjU3x
	5a/096a4spQj5sGBGaGlL409xA4lJ7RdHOJTIXaLRdQ==
X-Gm-Gg: ASbGncschJHXvuBlEOlKcLkc5UG7yO87NBJS6trUB0M1yEt1CCdrJnZa6+bU9fU7h5g
	NDvpz6HGtv4nYCVYdtc5NUBx6zCvvbtKvdgV/Xx49rxaugyYiDr7o5QyNms4Fah8wKmv5AlAgpt
	WIeojXTpJXXQyhpJr1/3b3g6sKfC5CekIxPRQyTxFFpf36ID8qdIxuY7/+L5V1E/fyKGW8KIRu+
	MM=
X-Google-Smtp-Source: AGHT+IF5fLhfuC8hz4Rv1krK7DbtYye+VXaU6bceTUWd3ZX5FC4oEcmGEW+wthmMe7jT3GYqphVFIC0r8DxUKFP+CT8=
X-Received: by 2002:ac2:4e06:0:b0:553:37e7:867c with SMTP id
 2adb3069b0e04-553e3d028b0mr1105854e87.50.1750426625405; Fri, 20 Jun 2025
 06:37:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620130814.2580678-1-arnd@kernel.org>
In-Reply-To: <20250620130814.2580678-1-arnd@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 20 Jun 2025 15:36:53 +0200
X-Gm-Features: AX0GCFveiLVvzbVVb4pbzshJs5knTsbLzp0XOfzNaJNTrqpVl3158pRzAoNLUfc
Message-ID: <CAMRc=Mep0SNj6anWcmaNh4v8Z=J7eomujU69Gz_exuG2Wsd=8A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: zynq: add CONFIG_OF dependency
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Pratap Nirujogi <pratap.nirujogi@amd.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 3:08=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The zynq driver can be enabled for compile-testing on builds without
> CONFIG_OF, leading to a link error:
>
> ld.lld-21: error: undefined symbol: pinconf_generic_dt_node_to_map
>  referenced by pinconf-generic.h:231 (/home/arnd/arm-soc/include/linux/pi=
nctrl/pinconf-generic.h:231)
>           drivers/pinctrl/pinctrl-zynq.o:(pinconf_generic_dt_node_to_map_=
all) in archive vmlinux.a
>
> Prevent this with the proper compile time dependency.
>
> Fixes: 1982621decaf ("pinctrl: Allow compile testing for K210, TB10X and =
ZYNQ")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/pinctrl/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index 753692e9ecf5..ddd11668457c 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -603,6 +603,7 @@ config PINCTRL_TH1520
>  config PINCTRL_ZYNQ
>         bool "Pinctrl driver for Xilinx Zynq"
>         depends on ARCH_ZYNQ || COMPILE_TEST
> +       depends on OF
>         select PINMUX
>         select GENERIC_PINCONF
>         help
> --
> 2.39.5
>
>

I don't think this is the actual problem. I can build (and link)
pinctrl-zynq with COMPILE_OF disabled alright. Can you paste the
entire offending .config somewhere?

Bartosz

