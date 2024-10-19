Return-Path: <linux-gpio+bounces-11690-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E419A5043
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Oct 2024 20:18:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 713F31F22771
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Oct 2024 18:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B38118E762;
	Sat, 19 Oct 2024 18:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="StJczo3n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CAA18E028
	for <linux-gpio@vger.kernel.org>; Sat, 19 Oct 2024 18:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729361929; cv=none; b=TCnh3rR6bFphaZWeoOr4/bUS6fe1mQxhAjDPl1bNaoX94FGz603Qwz0tJ0NdmM8JbZRPDMihfx6nNRzSq+EUVBB9e+hT5rGF0xmIrmn+SV0jX9W31ZmFI3qixbXtIlNO3eo9wJ5qWbqnxipewkcX6ehaviOAJd1RiAlLDl226Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729361929; c=relaxed/simple;
	bh=vcu1pIHKlbhT+C/yXBiBq7acDfSq/mBzJneljE1DxKE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RTqIOd3S2oTpap63wx/Onuy9HCZi5dcYGC99YICkclYx6XgR6CYrefIi6X+bUF9oYvTNRADHK7NP4PSoMxfCUpCq6Fio/DmmyOYZ4ratIXwj80xFt8xHwm00WfseVn8LGS1J7E6DydhULToT+uWVLj8VKUKVm34ZBbprIkNZlBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=StJczo3n; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539f1292a9bso3928902e87.2
        for <linux-gpio@vger.kernel.org>; Sat, 19 Oct 2024 11:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729361925; x=1729966725; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9HyUnsDCM38k8wyFXiZZzuA4A+/AWjvfRCe2L6NTBA=;
        b=StJczo3n6K1kgGMqDBN0nd5X3gsOU1YSAcTYiCjakIoXTB/PQeu4mA23gLBYZBrYBe
         bUPI1HmHtQje+OWGr/jn/sIuv/VO7hqDH4LZexPYYg62VfD2r5MC7wJUr2ea/A/Cz0WP
         dwAMFJEEbXtSSJlWSkNwsq3XVqiz7nNMnoJFytQ4xULjUjQciBRI1YltIGeKHXHY8MXc
         mEhZs7PUNUBSIquNwoAkiOyZ9cs+9UNA3OXP9TtMRbrkpB6+M4VCNDaqqjpIceWOnNtd
         i90A2Of5obwM3NS6dPb+MDlrxIPEHFA1Wc/AV1zqUpS6oleR90rXxdeSvSj3aBVuW2gV
         1y8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729361925; x=1729966725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t9HyUnsDCM38k8wyFXiZZzuA4A+/AWjvfRCe2L6NTBA=;
        b=Vmpq9iNnKCOSyVNQPdmoCF4/ztsyrg27wKJyWuBjH1KhCVBdSCwkS4DjrP4X2HU/mn
         JFxp3JehYFkdeAcKDUK5cEx+mWOZq3e36gTBaDJwl1m/WT0iUkrnN51OrcnNM/I4fUt1
         MTBMDvS7qsbDXtbhRkMeTRafGqT7Rz70IIcStwPEnoA9BdcOdf2Hx2tpkNo5rQkDVtBE
         09k8AvS+X/HyLkS4Di+EuDwY5I9dZpxRzfKDEjaaKExYOKl7C4z3d4TET9l8NqFc4nEt
         NE8mfZIjSe3qSbLReKMBMp7p6cVv4c+SInBOrR5oJoekF96ih1mRBdKIcAFWFyXkNQjO
         4aMA==
X-Gm-Message-State: AOJu0YyXvC4GZntKlZzfph/ACjz5fufCta5frVKiS8HEpbrUauVQ5zvZ
	sKZUpy4I/yY5AbDjEIOehRcJFsf6tg2DSIG/fRjS1fPBR0Jewkpw7d5r1OPmjDE8ddOMU5WSmo1
	tqU1HFh8bbvC7FFirinEvPXbUEdbO7bCBOQAU5w==
X-Google-Smtp-Source: AGHT+IHfjM/VTG9kxqpK8XcBCFbTsJUUE1A1YLmNVXx7/5MhnK4KgFXy9BYa5HKo6Y+p0Xt1mMBu6U1qExreYYm0+f4=
X-Received: by 2002:a05:6512:b8f:b0:539:ebb6:7b36 with SMTP id
 2adb3069b0e04-53a1545df7emr3651907e87.25.1729361925032; Sat, 19 Oct 2024
 11:18:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1729252708.git.geert+renesas@glider.be>
In-Reply-To: <cover.1729252708.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 19 Oct 2024 20:18:34 +0200
Message-ID: <CACRpkdaHNPAkVAOxCH+jjdCM6mC73X-0vFnX0i6cb_wfWCUTag@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.13
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2024 at 2:05=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758e=
dc:
>
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v6.13-tag1
>
> for you to fetch changes up to 5dcde519a067ac5c85c273e550dde1873e2199bf:
>
>   pinctrl: renesas: Select PINCTRL_RZG2L for RZ/V2H(P) SoC (2024-10-14 10=
:02:13 +0200)

Pulled in, thanks!

Yours,
Linus Walleij

