Return-Path: <linux-gpio+bounces-17138-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C42A50D85
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 22:32:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A5763AEB69
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 21:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FAD21FDA61;
	Wed,  5 Mar 2025 21:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="haDZSxST"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693691F561D;
	Wed,  5 Mar 2025 21:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741210366; cv=none; b=QYadKjJcKgzK+Zfj7NgDjRRIincXloCW6BAO+Z1+K40DkSEVQr9Wh/gEJtDI5q2XQNSskdRAjHYodYDOLioilFWt5pgMYAJNgzdYBpktSBBxqTMNIS5dEIelhKsCV6gETbYW+ZYRVpucAQcYmGYDdgd0Bi1jMI3sernCMu5NnVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741210366; c=relaxed/simple;
	bh=d0TUTMDC9Phzvv9YddhfCZ1GH9YyBlDq++qJFQyZwf8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V96dPdmiCejw20S5IOzjP+Y4ZzVFzJtx++n+i3lKzOVVHJ4yzImS9Au0zJz1JLrv3N1hkXTl3u8eMn6QYW7Zye8BuH+qCMyNHJd1SFXTUUWqJ5s2UjJxPLclY+SwTLL8QR7c0AvKX3byz6rl3shm05JnmjzFySvTa2ojrCG99Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=haDZSxST; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5238b366e2aso3738485e0c.2;
        Wed, 05 Mar 2025 13:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741210364; x=1741815164; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0tDpHHCxl/ANDLpe4bNjK55QcoUa+SA3to/uuw06xrc=;
        b=haDZSxSTJknLMhVmFNa84jplkqKcIigoIF7+smn+d37ASTJG/qHQNFNfddds6s7TGZ
         Mexin58kdMlisKeAMw3vgnXa41QsQLnX5nWybo1w3l0hboRQqcITDz50VHKg9W4IHMD7
         3k+qQ4zJJxJ2oDLSXpe91Ls7HN3wyIm3GtG5X8neY+9aMZR8ntfy1fk6C1hE6H7SVazP
         ky69cMW1LwwidUjsUkYqpENTZdPdKw7dzJYDRxhkpTrXV1e6ATKZAj0/6r/m6ZqpR5pM
         CAhf/WfxngY19Hd2WR8h45zXrZMK76Nn5w+2AcmpIWNETcCcQUlnmDMN959SPms/fwJ7
         CWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741210364; x=1741815164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0tDpHHCxl/ANDLpe4bNjK55QcoUa+SA3to/uuw06xrc=;
        b=RBZWhrGQ+gq2z0ymyXJszC6z0g0kjLLj3cG0DNFwqqZv5w8bzv3NasDT47cbVfC/Gx
         Vt9iDvm771VhLnHikQ4VAmMYUUC3Kw3H8XkzalyPM6jHw2nXwG0T6efY2mWNgV8ST+Wl
         0ebp7qEdHxJgBKzw11dy9sJRQHQAPyo9BX18/ZKvJL8G+PFk098pqn0UQCD5xTdBIbzl
         6/w6Ohhj7rRjAx3Gz0qmwxglGzq+6MvaJtYnRCPLEPlKpH4xtTRLtrank3OC6kbABbxd
         8ijVXnK7ceqMMyoOfRkfVAhGGC489TeqH2/zVYsap8j8Hzcl4O31ssIYrjQHF7mm5Rj9
         4uqA==
X-Forwarded-Encrypted: i=1; AJvYcCUtF1uvZZfpMPkQ9nJ7OXkIUWLn4qDmWmJ4AadGXwt7raPidThEF1eY131ZOjd63xcbFphEkzJHw4T4LYmU@vger.kernel.org, AJvYcCX8RsFT8Czx3zsnRXrMrGDm2mOCyLiLSpGB9n5cAra9fSNW2+EDCmuRfytk2hQ8IP3qK4WGD2UNTlJ6@vger.kernel.org, AJvYcCXAAgvz9jlDA6U4Nus7SAsrX9Tky/fWAz4YQRxs52YOf+YWA3OJrwY1L88HmeG9XJskdnfO7Y/1X/lHaVLsVyvoBm4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+6q78XJ/WqH1Npv4wONz18eoL82QbKEcnsTY2rWCOpM8fPD9v
	BcSvj+WJ0SDfwuPikMZlR5SM6qa2rcc9SU4Q9owW/y2mf5s4d5i/NA601VQDm35Hia8PexvNjxJ
	B27WKpONvDI2vh44gL2bjd9IQkcY=
X-Gm-Gg: ASbGncso5JIb0GWKeYlDrK7TSo6eDFflkyp9aLV/g5MrH49+MYU6vBWhdyfr8TJPdwu
	EbXhzWZk5jEPPsgwC8sBmoHNFp1Hussjnpbk31jLjLbPyQCQ19jqw5pI5D8nuXteBfAgCbK1mMo
	Gqe/KCICfqr8n0wrYS1qJB8YptOFYtffnEAbByu5ssQlQF5CTNipSglWmm
X-Google-Smtp-Source: AGHT+IGxunsmZMLnzdiSds1vzUfhB0SFwMm9XbQiru83GY192Hn5o9fRsn7cZOxJmll9Y7n1m0YUUwiWIaFKowbi4hk=
X-Received: by 2002:a05:6122:658d:b0:523:a88b:9ac5 with SMTP id
 71dfb90a1353d-523c62929f6mr3138891e0c.9.1741210364275; Wed, 05 Mar 2025
 13:32:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305163753.34913-1-fabrizio.castro.jz@renesas.com> <20250305163753.34913-5-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20250305163753.34913-5-fabrizio.castro.jz@renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 5 Mar 2025 21:32:18 +0000
X-Gm-Features: AQ5f1JqxeK9Bb9t5UKyGHoXRP7cnMN9TLuawhJsqKDBEuOZHP1baRAGCAgs4qJI
Message-ID: <CA+V-a8t1W+fN4TfBwZu+UsgOEjame4dcBeKMc-W8XAVcnEwBbQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] pinctrl: renesas: rza2: Fix missing of_node_put() call
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Chris Brandt <chris.brandt@renesas.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 5, 2025 at 4:51=E2=80=AFPM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
>
> of_parse_phandle_with_fixed_args() requires its caller to
> call into of_node_put() on the node pointer from the output
> structure, but such a call is currently missing.
>
> Call into of_node_put() to rectify that.
>
> Fixes: b59d0e782706 ("pinctrl: Add RZ/A2 pin and gpio controller")
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
>  drivers/pinctrl/renesas/pinctrl-rza2.c | 2 ++
>  1 file changed, 2 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/pinctrl/renesas/pinctrl-rza2.c b/drivers/pinctrl/ren=
esas/pinctrl-rza2.c
> index a654ede01f70..3b5812963850 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rza2.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rza2.c
> @@ -259,6 +259,8 @@ static int rza2_gpio_register(struct rza2_pinctrl_pri=
v *priv)
>                 return ret;
>         }
>
> +       of_node_put(of_args.np);
> +
>         if ((of_args.args[0] !=3D 0) ||
>             (of_args.args[1] !=3D 0) ||
>             (of_args.args[2] !=3D priv->npins)) {
> --
> 2.34.1
>
>

