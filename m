Return-Path: <linux-gpio+bounces-17136-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F88A50D7F
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 22:31:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1730B171767
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 21:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD68F1FCFE6;
	Wed,  5 Mar 2025 21:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V8YIHdub"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E66E17B4FF;
	Wed,  5 Mar 2025 21:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741210267; cv=none; b=XjfZNx9k88rDqCjz4mZkWYOgmSs7td5UmqjSsud+r4ao1bBbg76esGXBHjYX1he87WR9Nmwfw0Pww2frle9EFOUssvawu2bdjAcH2MD8ToTuANnSwa9A2IqrdKEybmeNpYvi96WVQJ3A3TTxpBgkMnDLEOTXIVzNKYeOUSrRFLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741210267; c=relaxed/simple;
	bh=oKrzUcCs8fsrWhOs2L4zyb+abAMp9Jp6kCfuetWlgdo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eeL+9KCLQysQED2qb8WH2EBXjp33Lo+4gH2vWYBGcHeJzmOm2CzOnCLNQpzfPgrFsXoEMAhPDF6OL6DTt926Ctv7UT9BW/HqPUNhOvf2PsYoWHRiVgCQsRK8Rt9/2RHNvLaTTDgz+98d/OzxUcyK4/L5VhjzsiYEKyi3BSEVQVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V8YIHdub; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5239067df8eso1801074e0c.3;
        Wed, 05 Mar 2025 13:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741210265; x=1741815065; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HaZs59KszkHJ6dNUbQfOkF3cTdyV5cRyEr6lpvtQkpw=;
        b=V8YIHdub2En4E6vOfGsNc3VMkRb5xR5216OWF7vfjkbHSswdRRHFEK3+RYw8ZH9EjE
         NZvQa7JC9JV1YP1mDxtZXaGtpD5YWGypG1iJ4FP4TzNvVjXSMQbvCJ8tf116zSpai1JF
         a377Z669X/5Qqh1duo7RtzQuvw8oUBon4tq8lXEcc/TCxGKM4Y+QsU3vSR0PCUfaa4W/
         e6tD8ccAo4KtwmbL0TklwaGeONOR1z1RjfGxeqqZGPvOg5FIutYTZkhSoiuPNcEalk5I
         skYlJfoHUoxel8ZWsz9i0+3ZrKuxBjcZVrROwthpP4BJGNTcPRe3gbvpkjXTWk0nFdt2
         0xcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741210265; x=1741815065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HaZs59KszkHJ6dNUbQfOkF3cTdyV5cRyEr6lpvtQkpw=;
        b=NuxuwBNTxE5axcBOKo54e5brbfAFVdCLzOQVTcS1SxJTl7Wu4Qar4FLfT/bRlMVzX4
         qqtkSTDSV3gyC2Qa+kaRdqIoMW//FFi+r7scVPn2GH+Y7SOnLV/u/l1Y/KMfxLjgW7Dg
         8GtaoJoXx3okbzTf9vJZKlZs12QBeIC0N8JtWy+zgVl2skha3Nj9v47hE6Wh53cLNpeg
         NwWh0USkOXAOsmx6qArOwHJsxAt2wNDAfz6pbtYM6KCYNmybsn93RnLLbnJrmxFWLSk8
         qpViaSUzLOCjzORBCxPaZF+JkBvIlWgIXOL9eKl1XqZbGQGJHYvJWSSR2y5U3G7bazml
         UHMg==
X-Forwarded-Encrypted: i=1; AJvYcCVqIVt2K6SSF+kP+0UT1E856EXjYJyIgHoeloNV/sBppc9sYQdg4JlkCoTMFX+EPUq8c6I5lEaZnnwxhWDbSZpOxrQ=@vger.kernel.org, AJvYcCX+IbVdkPza9GmLgY02Y50jas8IQjui9eRTKi9260+NWx9/byg/6agafRmDHrynbEC7hdzLSDAuEMGP@vger.kernel.org, AJvYcCXnJLUghpOIulaDCJjhjxefKGQZLXAU545IalA2UQL9tZy9C//6WxV69m4WXtrsbzCteQLvEGTUFndajjQ3@vger.kernel.org
X-Gm-Message-State: AOJu0YxNJMxx3GGGTwLy+IYw4k1YDqlLNdaEa9dXQtxIRytjdYQ6qKbv
	TV5PJ83X8ZyybXHrXFOyzpI4dn50cj2Eel99HpVyaqDS8qEMXymoMT7ahQB2IfBO9GHuLr+OkvP
	xZTPfL22xdGFKbhhqDKiBDXR4CLs=
X-Gm-Gg: ASbGncv4LIBfCYlBCt6paBZTqN/X9oXCZJzund0isOD23I9tGsjZJa9yDEg6kmlgkG8
	DQYLrWQAe/CxnZ3z11O8nDeyt2nbqyS3YyFqpy+kTDIL0GmmK5awX9NR7D7mykCyfSAqE5FkYfz
	5fduNo0FsngPY6ugpaNvgnbeBS1VrXSw7J1JwKy+yBJlavkMnnslGeH+sO
X-Google-Smtp-Source: AGHT+IHOf1TXhA+6YVGvfvEgB68OYK2CxoN8ctAT7KFUhLv0X2XHwyjcI1QBLNUXjVXaMcvYXZ18FaAbuVUkr7n78YU=
X-Received: by 2002:a05:6122:3549:b0:520:61ee:c814 with SMTP id
 71dfb90a1353d-523c6109d37mr3025676e0c.1.1741210264925; Wed, 05 Mar 2025
 13:31:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305163753.34913-1-fabrizio.castro.jz@renesas.com> <20250305163753.34913-3-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20250305163753.34913-3-fabrizio.castro.jz@renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 5 Mar 2025 21:30:39 +0000
X-Gm-Features: AQ5f1JrW9YLVfi-951AuyL-RrEJRQuZ2HZ7se5P51zSYFUQYHzbWv-LDx6_QV_0
Message-ID: <CA+V-a8sVimKfvXdovptGvC9ZqfA9SnrEa2_mJdDMs-5o_-Cr2w@mail.gmail.com>
Subject: Re: [PATCH 2/4] pinctrl: renesas: rzg2l: Fix missing of_node_put() call
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 5, 2025 at 4:39=E2=80=AFPM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
>
> of_parse_phandle_with_fixed_args() requires its caller to
> call into of_node_put() on the node pointer from the output
> structure, but such a call is currently missing.
>
> Call into of_node_put() to rectify that.
>
> Fixes: c4c4637eb57f ("pinctrl: renesas: Add RZ/G2L pin and gpio controlle=
r driver")
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 2 ++
>  1 file changed, 2 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/re=
nesas/pinctrl-rzg2l.c
> index 9280bc37a623..c72e250f4a15 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -2763,6 +2763,8 @@ static int rzg2l_gpio_register(struct rzg2l_pinctrl=
 *pctrl)
>         if (ret)
>                 return dev_err_probe(pctrl->dev, ret, "Unable to parse gp=
io-ranges\n");
>
> +       of_node_put(of_args.np);
> +
>         if (of_args.args[0] !=3D 0 || of_args.args[1] !=3D 0 ||
>             of_args.args[2] !=3D pctrl->data->n_port_pins)
>                 return dev_err_probe(pctrl->dev, -EINVAL,
> --
> 2.34.1
>
>

