Return-Path: <linux-gpio+bounces-8566-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CA59475BF
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2024 09:08:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8392B208C7
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2024 07:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FCF4146A67;
	Mon,  5 Aug 2024 07:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xndt+Mo2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C99143C6C
	for <linux-gpio@vger.kernel.org>; Mon,  5 Aug 2024 07:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722841700; cv=none; b=fx8W02GKYG3BSXmAbF5AUTaJxvMqX/Ebnkn+H2m7dX8hCLQNXni0Nfj7bHEMstQR7oiCis7VuBBe1a1x3VrLLhR9mHAWufglKpxuqHCP6LiXjKcEZOqYhset2vN+scItnRwLZIpMZviDYTdVt2DA15qkcpAdx0y3LNrKxQWMFiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722841700; c=relaxed/simple;
	bh=JigMBQHuoeximj8/IC6wBuOolRs3qpg2BF5ooo+VtA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SokS/zs9yfJ+IQV2nlQ4fVFMay/9WgywQCnuSQT7FGCC/0GiSQo2U0jNx7r5PpEmyM0FiWB3kWxruRgvwKI6aYdpkY1DoNoYCSdNFd8QfFJr0SRLrP823rW+9FwqdpoJH7UQK7/VNpTiF1BgKthSDeuGVFXf39791pwp7GR1Ve0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xndt+Mo2; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52fc4388a64so16068150e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2024 00:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722841697; x=1723446497; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JigMBQHuoeximj8/IC6wBuOolRs3qpg2BF5ooo+VtA8=;
        b=Xndt+Mo2IO3wLXqu4b0H+srkNDToP1MnC91oVb3owQBehT+A7EVFzd0raqnrVsCXdS
         NSkXlQmiuAUjnnC9vbDWsqoOPBajLIB+xSRVkMIP+C1QWpIpRhTRQ5DE28eSwt0uYGLN
         WzTGqlAsxQikyptqBe1XW/szG7VZVPCPOE6V3s9b1m5NwHrl2We9MmDRpi41/JpnQ2wB
         EBSrVZ+m6hhIzqPVcBWZMbGBieVjjeGz6y2IsJCc2uC9WdFnyNcu2cp/ReythONsVbfJ
         mJ/KdtCj9Kmu2uTit9lx4rZ2IF0W3a0i+zD5FfSYJHuuWrnqWQZpQYSaeoxgAdZhDwmS
         TwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722841697; x=1723446497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JigMBQHuoeximj8/IC6wBuOolRs3qpg2BF5ooo+VtA8=;
        b=PgGP3bnxoj4VMdD+gHXZSFLecYNseEHpCqcGGEaipgHX7HtyPADXcR6Vfd4Cdw7T7I
         JSBKQ2a34Fh+yThXK0Rl/6+j8CcTjEMOLKKSYc8tjIrMmnEVV6g/sX6+J8BsL5S+jhBP
         PCRq28+7s72Q/38Bp5D6oEtuhqjlSaEMDOK2b4hyt2Xe9TDH2ltNpuE96FmaquAI5pDd
         wWHcCyeugSqn6PT92voIz99qENGVBx+569zEv6bDpdXyGBVjh9hjVE0BTiQ91VXQqFsV
         oEEErHbxpN7/8naQ2Ggg851DuIJ7wK1akWN2tQfZJkkRM6MYtV//RTnTd0X1uk9WK94x
         fTew==
X-Gm-Message-State: AOJu0Yw1gAiLS/jl2ARi9AJAxHOb2FVhzOBUvVTF/Vf9aShCACuyI99J
	Mlzk16Bmgt7GAembXpKCNzc+WVRToTOWWpiMb6AU/8uYVzYZtUynRk8AugdD7i8tij6ypdvFu5/
	+l9DJwUvdamE1wKAguaZ+26meVQ9xptdqbzuYNw==
X-Google-Smtp-Source: AGHT+IGUNyfaJFjWk8BA92L0/xnKRR9vaRbFLTfDsoMxhm3Cd+zd19C1NT5F6HTMpjAQeVAaHckjwkijte4PFsXLu2k=
X-Received: by 2002:a05:6512:a93:b0:52e:9cb1:d254 with SMTP id
 2adb3069b0e04-530bb39dc80mr6822512e87.46.1722841696980; Mon, 05 Aug 2024
 00:08:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240704-pinctrl-const-regmap_config-v1-0-9d5570f0b9f3@gmail.com>
In-Reply-To: <20240704-pinctrl-const-regmap_config-v1-0-9d5570f0b9f3@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Aug 2024 09:08:06 +0200
Message-ID: <CACRpkdZjTDzpXhe5v65yLiP3WwcOdP3uBwpm9C1SZ8BWUDhubA@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: Constify read-only struct regmap_config
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 4, 2024 at 8:36=E2=80=AFPM Javier Carrasco
<javier.carrasco.cruz@gmail.com> wrote:

> This series adds the const modifier to the remaining regmap_config
> structs in the pinctrl subsystem that are effectively used as const
> (i.e., only read after their declaration), but kept ad writtable data.
>
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Patches applied.

Yours,
Linus Walleij

