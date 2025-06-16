Return-Path: <linux-gpio+bounces-21665-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 640CEADB39D
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 16:23:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30C8F174C9A
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 14:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32EC92080C4;
	Mon, 16 Jun 2025 14:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nVtO5PVw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6118E2063E7
	for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 14:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750083553; cv=none; b=D8AZouK2d/INrInVQIBsmZMDrcThoVi6twsw5uIumHs8xJrUrHHHJXqK1Yo+UJdokeIPeW/31kR+ZFdEGAXc3XW/D1W7aGZIcRmxIbYJDheMVL2XVf4O+smrZMoQRQvpsTBetrR0q+hcFMmSbCMAwKnNSBYkB9b/FVTiJM3jtsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750083553; c=relaxed/simple;
	bh=b96m7kxZHTBACeameOSZpw+VySdqhzZqCch4/6wPATY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gNyKtNlpAli7v8v7i6Hu98shrpMbbMCbkpoutNcq4vyoKohCflJxG8CArnCq4ohkSFBkYytX199SQA/jS6hhQRpKwTIaREPspPWlLD9jlDq5EFVYq42aLTPb24+2iZx3UJWeN2qrxO/vGPvZKPDR+abN4WkaPGRDU0uuHP35eLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nVtO5PVw; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55220699ba8so5601110e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 07:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750083549; x=1750688349; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pjlCKhc+nJk2NX1o1aydG/u9MSs+dWUFPeMh7cFAnJ8=;
        b=nVtO5PVwA3e0WjYNx49KJmQQltey1Yse+HI5mPnXm2tyPxV/XSibC3ZX6OOTXgRkCF
         W/RPXHKQkR746NwtW4x6mq/3I9osV7CjC325JcjVuyxWqzvLiHnCfIDKTTbPI/A8/ico
         qjmfgOQyLyVmzmM86Tb8ShFmknNak9VSAhHMXHFOSjOt8YP9sBxR93IFBeJyZYaEEi6F
         F6JBsq/QpeCqT6p4zUkpFDBbUhkUozh6bRMC19V2Z6ojhBEIQKHTW5vvloFyUTbnDQZ4
         Q+7+vgEazEfhiIyB49Zqll/Z81Yiyn9tyKoJUahrvQjyYZilbvMIuwq39FvS0TZ5mx8D
         SnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750083549; x=1750688349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pjlCKhc+nJk2NX1o1aydG/u9MSs+dWUFPeMh7cFAnJ8=;
        b=pOPwvNVm0Zho8FwqM/23lYV5CoTGz/FS7yF9SDxMNJbMgPnqYowCnGC79SZNWrCvgD
         xblP9Mpe91PvB8P84eiK97FxMGDC/2/KfP14+HA2uqARBfrEDTJwD7MD3Rx8DzCz3NnU
         BEZtwP0BD1eXq/imv+pdyhEZdCHD8FCgR0hU69qiZhmQQSiG2ZAcVhE9zuN3u5BW5HfA
         eFsruwpYl8XZ3R+bDqVusKa1weX3uND31gYzVejqcUVFQg69J/lAiM+affsmeAgwarp8
         PFjHhUVxcvUAkm+76Va4FBm0eF992S1PRAYe8UOd4PQ0FFtpXpxNXzNOvncWZWNfMONF
         qM/A==
X-Gm-Message-State: AOJu0YwpJf5RzSgjboJDqdkK1TnF7uIKybGgcYIzCvEsjC1FjxSvRoeP
	aXogv3PwtHWykiKWfBSCZX7V0JITekoZMo8PkafTi8aTjbZ/l64nLbTDbN8foI08voF7NNRurq2
	X6hYHarsbwj+DonbIA9W/BaMzoZxGAf1Bm1M3cBLCCg1aTtAwn2Y5lwY=
X-Gm-Gg: ASbGnctpwVu1VdLin3PAuiKNzGxPLoTIyrM9GFW5/ecgHZ903/S0ak9c380bUPiPsbm
	/sw2iHoLgyD+GdKQF52U1EJ/KtedMe6s6ZzHv/mFxx6U504mVB7UkhbP8bbcrPdG+aP+tIvJ56c
	1Rb66ZSWPno4z2SQjOxluEht8JZ8AyW4s95aIa6zi51s+ZEU4vV0q6OvxKh+4RuQ+KVFD5lGghs
	nQ=
X-Google-Smtp-Source: AGHT+IFhsJRNxrHop6DXKfCyU43YwbpjtsLT/Bcmo5G5HBLftVCHvVtNynD1qZ5BZd4IXfCUTatu5SORN9Z1hHQxrT0=
X-Received: by 2002:a05:6512:138c:b0:553:399d:58eb with SMTP id
 2adb3069b0e04-553b6ee2be3mr2564365e87.24.1750083549546; Mon, 16 Jun 2025
 07:19:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616134503.1201138-1-s.hauer@pengutronix.de>
In-Reply-To: <20250616134503.1201138-1-s.hauer@pengutronix.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Jun 2025 16:18:58 +0200
X-Gm-Features: AX0GCFs6KLo4fiC3VTNOPFqqONBs_YX3mUg6gQ5D174dhTdgyY6-2YDANOkq7Q0
Message-ID: <CAMRc=MdEN_xTm=LDkh7Hi08UnaEsVZT7B41WKf1XALxXBLvQBw@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: fix wrong error probe return value
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 3:45=E2=80=AFPM Sascha Hauer <s.hauer@pengutronix.d=
e> wrote:
>
> The second argument to dev_err_probe() is the error value. Pass the
> return value of devm_request_threaded_irq() there instead of the irq
> number.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/gpio/gpio-pca953x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index b852e49976294..e80a96f397885 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -974,7 +974,7 @@ static int pca953x_irq_setup(struct pca953x_chip *chi=
p, int irq_base)
>                                         IRQF_ONESHOT | IRQF_SHARED, dev_n=
ame(dev),
>                                         chip);
>         if (ret)
> -               return dev_err_probe(dev, client->irq, "failed to request=
 irq\n");
> +               return dev_err_probe(dev, ret, "failed to request irq\n")=
;
>
>         return 0;
>  }
> --
> 2.39.5
>

Please add a Fixes tag, you don't have to resend, just post it as a reply.

Bart

