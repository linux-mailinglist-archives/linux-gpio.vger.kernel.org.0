Return-Path: <linux-gpio+bounces-20005-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C94EAB4769
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 00:42:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A5617AF97A
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 22:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68D93134D4;
	Mon, 12 May 2025 22:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y2ashljb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD7025DAFB
	for <linux-gpio@vger.kernel.org>; Mon, 12 May 2025 22:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747089722; cv=none; b=INDVFYSvAIH9S9utxlqDVOBZdIRONM59aUXm07s6280lvgxhrVpvIeRJ2r11rK/4X2MQAcdcOLGR7upMCa3RTtEpTfy3GBzBLPWNWfqqWgiAfF9IjS3wuiPFrNrb30wt5cYvolB41V1Lmjdw9py5iv2DryL8ipP9oxGojJVVSc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747089722; c=relaxed/simple;
	bh=gbER9ODRTr+/muQJQayKd6A0bSVq6Xe71wly8pd2QuA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rJhoH09Txls0rr6vk3iDHrIoXwo9wX385qERAsMcSGwDHVpoL++BS8cJm8XExsGz5gjrqu+v6qQ+Cbd/nFcdNT+U7c23qVXOtOQcwcEcZPhDOObYFP5iXOuv1MQZdeLqNdsuXmBBviZzcVhUrj6iwOSUN2mx7zPaaAd7c0yTIFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y2ashljb; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30db1bc464dso47865421fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 12 May 2025 15:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747089718; x=1747694518; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiRFSiWUb4r5PsXM4kpuFyHFHLKUMuVdMyNox1qvG4o=;
        b=y2ashljb9Wa0ZsdkcMR7Y48lh2V6l8KMJpvoJpIAXXTNjfRDimfJQHpJxVDPIBUfmc
         5j6J+euEobtgndTlzRi4bxP79fTuKOrTWVIU8YzlPpTFLyqlxvD1TS4+47BQ8GvNbGP4
         fvZ2l3wpe2xqlv3FY2dXatbJAMbdxctQsRrQygXhOZdv1q5JVLKzggZI8X3fvRuP4tJm
         vOhBrcMVRPcKUUN+2Kyv8CuSGXk1V3LktEe0Nf+HstQiOWcV9UzaIGr69LH++vYrkGbY
         a8rpoXHLdOKQ0FGTWqERovXVI23DnECk1OaBUQ2zrVXGg5KElv0qzd3OWBDnzq/LhCQ2
         O3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747089718; x=1747694518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yiRFSiWUb4r5PsXM4kpuFyHFHLKUMuVdMyNox1qvG4o=;
        b=McCrV3yxKlL9LwCp+DXdvHdriaAgfSzEiR/EJi93nzDsOYWfYsE9PdZ24/SxDHfyOf
         8cjIIfl9BfsbhgEhPD+McsLjoeEg7Cubbv3aR/r3azylHIZ7LxHn4kyrWapO4trCN5Rb
         J43POdyoruI8lRPPy05f4EcD1Tx7ZVUUUkMWVDg8TTmkHBN/sYiwe60hT7gUkBqlJFdf
         sXEYLyOYrqP6Avp42zMsLg/7gYuDxtwHOMk7vhf+bYeaJDmd/VwHBxP11tOoM9bd7t0S
         D9pHyboLAw287Q5pWfalo3rsfEgXgQTHceN6xfOFYxJMPn7bB5Amcnu7PpXLhD/Z0uAc
         P/0w==
X-Gm-Message-State: AOJu0Yz6BpDODGjbfQdxpFQtUo7DYrz1TldcJMAQSBwUczYqa1bzNdXe
	1U7hpbXl00XStLvmQGlaO0Hv+pSVKEx4ZcAcYhAMfwNo/TZz/Opmxswn/IwrUEZQFJWd4Cdauut
	PfknNqWy82euu0c+D2JY85WfoQR7vPUnhg5W1WQ==
X-Gm-Gg: ASbGncst890stuhl2NvWDSeKnWciyrDz/kcw+oEs/If9pcIpfCmjlb6VGMZ2Dfr4pAp
	corO1h70hKfAlkklOUS0H99uAIETBjgF1aeWdQN77jdI/oThEE3+qG29rhCbY62DfJSwVty6BLM
	xO8Sa5Hfbz4grebnD6zBaPUchWIIlgeYil
X-Google-Smtp-Source: AGHT+IFXjOKZthFhcTlNQsTsKqef/Rgt56rl2GBtkoS/pphHdUadT/0pZiZYgcx8ARz4Yh7FcK/VHbyarzMTviWO/H0=
X-Received: by 2002:a05:651c:30c6:b0:30b:d543:5a71 with SMTP id
 38308e7fff4ca-326c45543demr65717101fa.1.1747089718300; Mon, 12 May 2025
 15:41:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1746798998.git.geert+renesas@glider.be>
In-Reply-To: <cover.1746798998.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 00:41:47 +0200
X-Gm-Features: AX0GCFtUz2ZLARsY2YFB7UklcSBzT1V0AJ_m7KvoIqt7UdEGVkQCKWYBKMOK4KQ
Message-ID: <CACRpkdb=nmOE3AOuBaPn6=xikdbr_EgbSOU-7FuCCBjZj9twCg@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.16
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 4:23=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089a=
c8:
>
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v6.16-tag1
>
> for you to fetch changes up to 5488aa013e9ef17c4c7aa8c4e6166dd89c69c3c6:
>
>   pinctrl: renesas: rzg2l: Add support for RZ/V2N SoC (2025-05-05 10:50:1=
0 +0200)

Pulled in, thanks!

Yours,
Linus Walleij

