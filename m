Return-Path: <linux-gpio+bounces-16052-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C77DBA368BF
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 23:56:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E25A16FD43
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 22:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73B631FC7F8;
	Fri, 14 Feb 2025 22:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CawFL4dd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B18B1C84AC
	for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 22:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739573793; cv=none; b=os0aMO6I67jsi0frVrjuLd0i+F9ye4z5FjTT6MzAGFPPP3PQ8UII5PyB7x6w/MPH/LHvRWELFxiG5G/YTHkda4J4/KDvPbVktZwEJVXDvaqPhBMw3OqSiFkFDskgddIOFlTIMXNl7p8r4DsbUtkPBaVGkFwrwyNC8SgGKuZkF0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739573793; c=relaxed/simple;
	bh=/yhmfcxSxHlQtGT/4b/eJHb5cN5NdisMaRpl7TNf6w0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m59rstfkWQNd5EG2KaHaAjEAHDIgzH0txtApOeIxLMp+I68i8vOFBHe3zFWTt/0Bb2/jFi6oHe1fGrBB6NV5xzhEpsjaATmf44X+y4jDy79mlie6DyYfO4q3RHYzQrX+SqWd9jNTicEufMB+kJjos8y4vZms1Bq0pHZY97sUCyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CawFL4dd; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3061513d353so26802291fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 14:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739573789; x=1740178589; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G7s2oBa03f7imynSEMhSrTciv4QWSAvhHIGyHnMNs5E=;
        b=CawFL4ddMhFZ/ionhrlYcEL+oWApO6RIh+rgRMYkrF//O6p31BcAIo8PzzQeq87ZBg
         UrMmtpNt6NZGTtrTE7747Hl9dXlASY48iM1bLHTDA4R/bQY1fn+srlfxo0Y6DFboCuVo
         /l40Ud76kOYCxwV698dhJoVv8KCv56OLmkKU3QhxPbxk8qQ6KOBjhZfodY7CbWCjXsAE
         09/PvSGUhRH9kq1bE03vL7fmk5SphOr8XaRMpKKSVOJW6pZHvch55KrBJew790PQSMpH
         qUg0PZ96CjuMhEfB504d1Iw1kjdFJkHddZ1bGwtDlw8WAUFXtMnjfXB4RSDhNq+6eG2M
         XV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739573789; x=1740178589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G7s2oBa03f7imynSEMhSrTciv4QWSAvhHIGyHnMNs5E=;
        b=gBR/CEQa1YXDsELVaBK3x+R2mtqguTJls4HQhh60ODjSRD3QP0Q0KLyzaj6GhKKa/7
         xkzGFHIfXQLhAWPn1VAeztNkjWw1FOjdO+RWsiWbD/lyWsJbR036VL2ZOQ9GxEJZoaQx
         Y8fG53u+8ZnN8kUcANFS//X05gKROzWoSiNTM16FbyJNkwkr4WG/wLqy5Yz3tWXEooZe
         ve2IJ38QHAOPOMgUGbgQ7l5uABEfYuECRiXVtguCgfEHCFZ0D1piS/4qKpItiUFiagi9
         D/0dA5RLlQJ8IRsrVkv/hlXpUfgI72g3yulB8I83CXUJGNaj1nSIoIp1cTWu228sLffQ
         c73w==
X-Forwarded-Encrypted: i=1; AJvYcCW51RrPzVeZSrjiJ5RHi0rraMDXr7chNaBcivOjNcqyBMps098DX9pGNPaEaZKMxYq4rvJcbPAVi8VN@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtw6fuYl7nl13wT5Nt58R5Rv+96Z6dO28rGxwsJ84GwWPqdQBg
	uf2G440/9DIVhiO4IDZVt4lY6Ly2SuOeUFDlax+j2mRC2yHM/fV709+YSHQ8VP14gNUJElBSjFX
	226muva3bGpKr0WdIZ5vvQkZWKocwxUiNxArq5g==
X-Gm-Gg: ASbGncuxO83jkwLEdvu6ww+fZfyOw9NBJuqXz9v0Ek14Hz66CW/jAU3Lrjf0p3FSn+G
	nipCWdlDxWYGtSF/819MEARTf6cKYdiYE5oGFXCPKrO6gJWaWyJrO4NftsGYpmB6unGyHN1oc
X-Google-Smtp-Source: AGHT+IGtCLytUd6iKf0ppSdRNZRXXS27j10ot1Y0d8DZarpARc4OfB+Kt1lcsrcLrJhHDOli3LBm2AWVAvM2B2L6CR0=
X-Received: by 2002:a2e:780c:0:b0:308:efa4:d277 with SMTP id
 38308e7fff4ca-30927a74ef1mr4142841fa.15.1739573789109; Fri, 14 Feb 2025
 14:56:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250214-vf610-mmio-v1-0-6cccd0292e84@linaro.org>
 <20250214-vf610-mmio-v1-2-6cccd0292e84@linaro.org> <DU0PR04MB94966159FEE966ED235509B090FE2@DU0PR04MB9496.eurprd04.prod.outlook.com>
In-Reply-To: <DU0PR04MB94966159FEE966ED235509B090FE2@DU0PR04MB9496.eurprd04.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Feb 2025 23:56:17 +0100
X-Gm-Features: AWEUYZlmN2bmWNppz300m813ozN9q3Rm-Z9EUt7o2OWmXxs7N_YLUPz6LPpxc3o
Message-ID: <CACRpkdYTiQW_q6C+9HrX=LK+DTS+2rc18wGic35gtY4k=N_Zgg@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: vg610: Switch to gpio-mmio
To: Bough Chen <haibo.chen@nxp.com>
Cc: Johan Korsnes <johan.korsnes@remarkable.no>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 14, 2025 at 12:28=E2=80=AFPM Bough Chen <haibo.chen@nxp.com> wr=
ote:

> I check the code, seems vf610 has another limitation, refer to the origin=
al
> code logic in vf610_gpio_get():
> If the gpio is config as input, need to read GPIO_PDIR to get the input d=
ata,
> if gpio is config at output, need to read GPIO_PDOR.
>
> But for bgpio_init, we fix GPIO_PDOR to void __iomem *dat

The logic is that if the line is set as output, we read the output
register instead of the input register to get the value, and that
is fairly standard.

And gpio-mmio is using gbpio_get_set() which looks like
this:

static int bgpio_get_set(struct gpio_chip *gc, unsigned int gpio)
{
    unsigned long pinmask =3D bgpio_line2mask(gc, gpio);
    bool dir =3D !!(gc->bgpio_dir & pinmask);

    if (dir)
        return !!(gc->read_reg(gc->reg_set) & pinmask);
    else
        return !!(gc->read_reg(gc->reg_dat) & pinmask);
}

I think my mistake is in that I didn't see the dual
PSOR (set output register) and PCOR (clear
output register) in the driver, as the old one does, I'll
send a new patch.

Yours,
Linus Walleij

