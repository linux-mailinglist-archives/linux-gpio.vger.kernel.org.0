Return-Path: <linux-gpio+bounces-3933-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE08186C56C
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 10:35:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEA7F1C233CE
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 09:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E6A05F542;
	Thu, 29 Feb 2024 09:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EmJIgriT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C1F5F547
	for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 09:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709199320; cv=none; b=eTnS0a0fILd6JIGZGP6vY539PQsA+1p5VPyLmyW3b/XUC/dTHDp/Jw8+ZdSFfE/lZnm8EzsVEd3SrsH4TabQJ/G6REBwMT5C2/77tJQ9cJ1AtAsiUwNG6+oghiQY1aJGeSPDAe9ADW7eHGS5ibwf9puzwpW7sSkYVC8JDgoR8Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709199320; c=relaxed/simple;
	bh=E2BCwCWKr83pu1Ph0WYIAlvgDlw5ksBM/Bs5jndzFeM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n25xCHdyddvkoGrP54YjgTqZ6u85lvDNTbbAeuDJH6Xc04KASEks9R6mESP9R5FTCOFrOltpE8XsqUGR3Klg2GYJu+JviVPQbwqci9H3TgpevhP0DHKHn8JfEtRUNuyZTurDDgjDeHchGdFrL7cerhbQgiCfto9rO8ajwB4O6fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EmJIgriT; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dcd9e34430cso747324276.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 01:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709199316; x=1709804116; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f50x61FNXrIWBR6f2QHRlicPFI4c+LBiZV4KjCEImyg=;
        b=EmJIgriTLhwFa58qCl0w5+2kg9n1eUSXkpQWbhYvXRQKvuq5IMKs1050cmML5xRC2d
         6iB7gVpoVtNKCZ6IrkJRFKkU/pF5qo9uwVAeOZelGZxS3aadCNun0CmKA+X8RklR/vCH
         vRGcfw0bQOqWdisJUTNwlUqslQiKrDsHYncjLTWBQkVPXiZqI0RwL8+lAuE9huFI7SaC
         TPs7A7XH80MBRVdeWTiz/edLSGlbPSaKRShB6kDLHy9JeKc9zG3wZq+nUzMQ+A6x16ls
         UOTTacrQM2JWW2W/Txrbno7Ga6hbkrhHlGq6gFy9bIkB5O5LfcCo1nJcQD+BhhzQcDYH
         a8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709199316; x=1709804116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f50x61FNXrIWBR6f2QHRlicPFI4c+LBiZV4KjCEImyg=;
        b=qJWaTxJ+P9ZoOIp//ppiRi1oq5LRCdS3E4weBc6RVYmS/8xQ+wWycBR4KWiktEP7+p
         C9edmHl8GwzjweuvpqDqbXDbiYPwPPxlBwstb5wQlzzgdDahwvB3MebY78wPMB7Hbe0t
         jPbiyTnpvLbGjHv8o7OpMyj/yoK+gdhoFkJx7dwom3GvBW+ftCxObEk7/JITFjBIF3jX
         K2hxvnMtGmYA0aT5UND/S4swPlEickdHVW34ML8hnAgN3QDTiILfuGZYRoM+AeJHJFts
         5oAfs3uB9+N0kMawJacUo3X3MyDz9rIbRhpmGfE4wRx+xQ2TkY9gtuGE9MuRx92IMnl7
         j2iw==
X-Forwarded-Encrypted: i=1; AJvYcCXIeJxwtFq06NJ6pFC6pOBEY52qKrq/y6ViWKtTAgooFxe8G4Gw96sMyQz93SbKcgvpxMDHS0mTkLkG1LgCNRNrjYBxAC7359GsIA==
X-Gm-Message-State: AOJu0Yw2PzowpZNgv+Uj/eWlVBIAvd8HTZu9IV5u/BpoZG46BGrdRl2y
	9HvrtwjcdAPmkdrxvS8JzphOBsIpWChL2/coLQy8ZOfvWg1KQQguzYHdkKIy91TT/17aam6hXAb
	SfbdGzLVo3eH3Dur24Jkw0eLfgYGrvUM+cNYpbA==
X-Google-Smtp-Source: AGHT+IFfB1CzRcwoLd5A9MKz+8jkh/89e61JZ8wEvR20tH5L9rZAg6gSACHkzLEHC6fcpjmod7PS/OVzmdDO4jPTA5M=
X-Received: by 2002:a25:c904:0:b0:dcf:4663:ecd8 with SMTP id
 z4-20020a25c904000000b00dcf4663ecd8mr1840712ybf.8.1709199316704; Thu, 29 Feb
 2024 01:35:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com> <20240228-mbly-gpio-v2-21-3ba757474006@bootlin.com>
In-Reply-To: <20240228-mbly-gpio-v2-21-3ba757474006@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:35:05 +0100
Message-ID: <CACRpkdb4egmLuudmhv5Lk23+RbKNOnxfQWmYz8S5pB2hJyV2jA@mail.gmail.com>
Subject: Re: [PATCH v2 21/30] gpio: nomadik: change driver name from gpio to gpio-nomadik
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 12:28=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@boot=
lin.com> wrote:

> This GPIO driver is historically related to the Nomadik platform. It
> however can be used by others as it implements the ST STA2X11 IP block.
> Pick a less ambiguous name for it.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
(...)
> -               .name =3D "gpio",
> +               .name =3D "nomadik-gpio",

Patch applied after amending $SUBJECT to be nomadik-gpio rather than
gpio-nomadik.

Yours,
Linus Walleij

