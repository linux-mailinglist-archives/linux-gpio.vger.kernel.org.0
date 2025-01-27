Return-Path: <linux-gpio+bounces-15065-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 238EEA1D405
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jan 2025 11:03:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73E727A16C6
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jan 2025 10:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731F31FCFFC;
	Mon, 27 Jan 2025 10:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qAH2+U1o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FD71FCF79
	for <linux-gpio@vger.kernel.org>; Mon, 27 Jan 2025 10:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737972197; cv=none; b=Hj/8YkOdmIG+rVyEzBaUlssOtsWY0yR6bq5YpCJ0Sv4YlB4/G2RBRYJAMjDoL+7MUw0LR0cOifbRxjtqhAGJgsPDcs1qGLJPZfsYL/OG6e8hG2gcjzoqQ357Bvg4saW+Soyz/OVevJTg15ofsqMi9poyE0DGRzkkCvaexlrmX4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737972197; c=relaxed/simple;
	bh=N538vEYu6XnF0WHkONMmPonotxgHMdsCAfvL8a6mQr4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jmceEJpIRwGrEMChB7PQRyzwFp1j9+GbC3hy6kxoe/0AjzmrsZsaRLj9At4eFHfvtL/0hi8cwb5flDk9ASbr/PF6DasQjJpYdL+a4pNN3/wV/9XahpgeIvSr2m1GdgtGgjML1Iimi4l7Qp0MlualeDFH39E4tJdgh+FxOEmSl9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qAH2+U1o; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30613802a04so43555791fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jan 2025 02:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737972193; x=1738576993; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4NmMIOuTviTZNb+IfZZhp63v5XOHewcC8VSW/yb66E=;
        b=qAH2+U1o0pEM2aA3T13Rmsm0/V7/sU5DKiYfFUNI2FSuK8H+WjaorQEoJRMDsylkMs
         dGKB4XwbbxK0F7NYHqS+nSqyM/LUg6gH6/Q7d3aBtvQnnu/iELsPV9WcPSKWHjSXGEos
         jysPtNgRmM8SEolqigOnkaM3y8r55/THlRTfYSmdEqHlZqx35UIYNiHmvc7xfHHXQAD8
         wgdb0wjR2TEsqYJ8h1KsQnQalGmAVZlUy400Yybw2nsLc9S7hTxJXne+RiGDF83T2Ngz
         Hp2iEr4oV9QuPsSsv8dRqOtYdA4KqMsXysJSN/UPeI8VE31n+o8ki4EZGWNESGb/ZEDh
         DY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737972193; x=1738576993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J4NmMIOuTviTZNb+IfZZhp63v5XOHewcC8VSW/yb66E=;
        b=Gv9/ega5x7kxKS5/8N4Mnm+YXxraxnOh9FP+EMTVQnZrxfOjJ//gcw1D+b0oE7LBIN
         51Rpwqjk63DCF6ylvMNyWpZH7YkRCEoSKfApg2Kgetl0eNKUPWsb9JqPr4+ALiacquKo
         UBmd/ek/vLbr5PBvVBFhCY61rhgSVDM7gQMp6p0v6sbkr49z2aUZtlHF1cFbbsA0oekV
         E1TpHXrpeyMvUTOfAhYF4oCUcWioOgzgOTS/Op0YAnE/y/1u9wE5Qv+DNkooNnVg+R3L
         ji7UPo02Zti82DGplBR0+LL9F/4O3PZDiMoaWh3nkuAQsN/OaZBKvWlSiBSuUFUNNeID
         FVyA==
X-Gm-Message-State: AOJu0YwgHVYhQBum0a0zaNdnxG8c+/CheMVJ8NKtNdAA7pcaBRsQ6Nql
	jhrqE3yhPoXsP6+w7DpEDmdbrAcowavA32zC0PXzMYR443XXlkEVueFHGrH9KyzPrV0gkGsuroF
	Nmw1WYgHigLDN+CDHdRTBpAU1fW7Fl0VCOc4PiRWlMDVpvaR8
X-Gm-Gg: ASbGncvAGBPRaJmSMGu7qGt+gC1uZQ9H79KqSTxg5bxzyVbrvkaWlG0pkHxQ0xAptgS
	SGZHpMSIAZKltvCgRbtDokDUX5RoSnm4HwPR2MzAYUXjrzR4KMgO1zh7VEUyu
X-Google-Smtp-Source: AGHT+IFXibelyUSQp2Gr/mOGUDbFIR4zvBx87cq8TNFbyN1svgKCukDrrYoUkm1G/479hFHHReF4d+bUFSiAVXgjVZo=
X-Received: by 2002:a2e:b7d6:0:b0:300:317c:9b75 with SMTP id
 38308e7fff4ca-3072ca6a6b4mr116564231fa.12.1737972193490; Mon, 27 Jan 2025
 02:03:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250117142304.596106-1-andriy.shevchenko@linux.intel.com> <20250117142304.596106-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250117142304.596106-2-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Jan 2025 11:03:02 +0100
X-Gm-Features: AWEUYZkbltOc0Gz_EJbR18RnU9jd0obin9Q4Izw-dghUXpRFQH_pR7bPJO1_bHQ
Message-ID: <CACRpkdb=WDLxerQCS4oGoxe4p+A6VZDw-WH9NJuDaxoxju8PeQ@mail.gmail.com>
Subject: Re: [PATCH v1 01/16] pinctrl: cy8c95x0: Respect IRQ trigger settings
 from firmware
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Patrick Rudolph <patrick.rudolph@9elements.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 17, 2025 at 3:23=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Som of the platforms may connect the INT pin via inversion logic
> effectively make the triggering to be active-low.
> Remove explicit trigger flag to respect the settings from firmware.
>
> Without this change even idling chip produces spurious interrupts
> and kernel disables the line in the result:
>
>   irq 33: nobody cared (try booting with the "irqpoll" option)
>   CPU: 0 UID: 0 PID: 125 Comm: irq/33-i2c-INT3 Not tainted 6.12.0-00236-g=
8b874ed11dae #64
>   Hardware name: Intel Corp. QUARK/Galileo, BIOS 0x01000900 01/01/2014
>   ...
>   handlers:
>   [<86e86bea>] irq_default_primary_handler threaded [<d153e44a>] cy8c95x0=
_irq_handler [pinctrl_cy8c95x0]
>   Disabling IRQ #33
>
> Fixes: e6cbbe42944d ("pinctrl: Add Cypress cy8c95x0 support")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied for fixes! (Speling mistake on first line fixed in the proces=
s.)

Yours,
Linus Walleij

