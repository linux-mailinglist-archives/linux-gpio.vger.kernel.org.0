Return-Path: <linux-gpio+bounces-24734-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 15468B2F6BC
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 13:32:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B2A81897029
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 11:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EAC230E852;
	Thu, 21 Aug 2025 11:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hcHuGezN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7861930BF76
	for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 11:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755775772; cv=none; b=CqTTHyoZHKVpFUKz18kOE2wFMrZkMuLdLxYwF4b/XV0OeQ+6KIHzj9jPJ4MZh6EhkkVYwFR9+SpEwDH84x5N9zNioZrW1aedI80yPDPivXWCZeUPDCy0PNKrOJnOEOLt8N+T3GzhdLo8ry5i9S8lbZ4Sl5i0SO8R/ys3BOSOLw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755775772; c=relaxed/simple;
	bh=ugqKLFVMtPcn++sTmPVPHBoR7r9xcjVBC4sj6ZCWHTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ieqbtPy2Ql6OJlTFdl21mroS1xWkGjAP+ic5DhiztXmGVn5HHR16DLT5ocAU+X95xcZv2buaiDK52cgM4ydyiavCYBChkrsgsaMQMTg6sfcxDKgnG1p7/sG5AvEi/DLTachdWEyrPB69Wl4GLYnUQje29mC58FOUBLrblI0TS+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hcHuGezN; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55ce5247da6so899266e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 04:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755775769; x=1756380569; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thHtO2n6sNZWx1SbCy0fCNK9DuaQMmc6UdcyydBr01s=;
        b=hcHuGezNOHLfBYsTQf8rBLa6xKJst6zpponuFMRjm0Cat7CgMihFKVb19NEsdHK5Xn
         LDzw1qw41pZJcurTJOExnh/P4U1vmsCofxdkT0gmhwygqtxXQyDmqSWSG/8nyg4PfXTS
         r3XJpf4kpzi7jip176YPCSL6RPTRR/1D+xjUFOuscSF6Lz5HRp7ItS0JK+X02by2zAae
         jYybKDi8E4z7lMcr/RJLhKxTYVprvWi+5Z+2fMKD5C5akAEa6kRleaB21DAgCv0zaT6y
         ky5SU4mooAUVsGy0hpA20tZpYd/5Nenn90B5KxOFCPRJHTG9riy+75VI4Dw7SWFAGYbt
         sk3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755775769; x=1756380569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=thHtO2n6sNZWx1SbCy0fCNK9DuaQMmc6UdcyydBr01s=;
        b=LByOhbhc++f/rU/PaYUHdUf9d1iZuhW7aLu0SyQX4rpmJkSapa3+3YBcrBWfAymy+5
         eSGR6UxPegv/oTK6/E27XhkwznMMSombS9vbiBu1z5UpwsoBd1jPZ8nnRUmK77MdJR36
         pbt4tGJ2VKIXLEd3yxYgkBYATBvgMjWxoo2ZO/FfTTRmuOgk0p0nRmQfRUYwYHX4Sbs/
         85/pSrMuOqK8blTlM3r2RV0SM2O1FmBKh4eW0G4Sytv4RWs+IgO6TRgWKvPJ7kaJtgUX
         k9rlgDlP8i4alU6Z0v+R6PevSdEbuxJYw02DUuvrh1Y8ic7KjgoSM6HDrH13OeIZevqC
         PESg==
X-Forwarded-Encrypted: i=1; AJvYcCXV0hNMyfJjoFaJePdx4sW1JZ5ecl3LMPITGtwKaBQKB5dCXLvWIa9hfSXESdcqqMjpnZP1MfbhMpT8@vger.kernel.org
X-Gm-Message-State: AOJu0YxO6QYXltCKfBChQIQJR/2q4PLWhKZD2bYhS2QeprCg7PPmXeVC
	ejJkdrFK67mU7uXdlmPQerEHpR1+pVWNCXhpQHDAvnSUJNj0kZX6LL/ardUAmt6EbUBlWnRt9H6
	EkUmrO9ZxWhtoFV9kO31fyTQmyDCRnzwy8BTy7bNEKQ==
X-Gm-Gg: ASbGncu+r7A3KPgCkJEhThCd8l+g3HMyP38us+r1tLYF9JKjqNd1NTR37gPlqN/csQD
	01Ev5xrpnU6r7Ld1ZORyL+u6WgNWIY6nUvCNgknkPnVWit5VHqS77k+BxOBECrDAZYaBpKt3nIh
	p5d/hVzJ9S5AxgR5heLoEwkMRu6dQ4nxc+epyVb0ii4lUluGBAOibDql+rG35wYpke/tYuydEQy
	ihE4Xo=
X-Google-Smtp-Source: AGHT+IHQpbI8EfP56lsdQ7upknLdRczUpIad68ohDd+RyXmgnTMqsII7yK6Kd5DP/t9BtkAowd9rcI8Mod9ChuDrSAE=
X-Received: by 2002:a2e:bc15:0:b0:32a:6b16:3a27 with SMTP id
 38308e7fff4ca-33549fcf105mr6386421fa.35.1755775768541; Thu, 21 Aug 2025
 04:29:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250819143935.372084-1-rongqianfeng@vivo.com>
In-Reply-To: <20250819143935.372084-1-rongqianfeng@vivo.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Aug 2025 13:29:17 +0200
X-Gm-Features: Ac12FXyxvIa75EjP0r9nO3EJkEnBx3tdsuFNWsnV0Q0Q5_jZ7NS8Y38A1xB9ZIg
Message-ID: <CACRpkdZrDRH9figXST9G7QbJbwSJqg4E3eXmXQ-+2z=k2+jYjg@mail.gmail.com>
Subject: Re: [PATCH 0/4] pinctrl: use kcalloc() instead of kzalloc()
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, 
	"maintainer:ARM/Microchip Sparx5 SoC support" <UNGLinuxDriver@microchip.com>, Michal Simek <michal.simek@amd.com>, 
	Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	"moderated list:ARM/Microchip Sparx5 SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2025 at 4:39=E2=80=AFPM Qianfeng Rong <rongqianfeng@vivo.co=
m> wrote:

> Replace devm_kzalloc() with devm_kcalloc() in drivers/pinctrl.  As noted
> in the kernel documentation [1], open-coded multiplication in allocator
> arguments is discouraged because it can lead to integer overflow.
>
> Use devm_kcalloc() to gain built-in overflow protection, making memory
> allocation safer when calculating allocation size compared to explicit
> multiplication.

All patches applied!

Yours,
Linus Walleij

