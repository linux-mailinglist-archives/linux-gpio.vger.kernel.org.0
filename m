Return-Path: <linux-gpio+bounces-10400-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8BD983F96
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Sep 2024 09:45:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D4F31C22874
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Sep 2024 07:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0937F7F48C;
	Tue, 24 Sep 2024 07:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v5zsaygw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F3F2110E
	for <linux-gpio@vger.kernel.org>; Tue, 24 Sep 2024 07:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727163946; cv=none; b=pJLuebwrbCQShelyVeAJGU2LysU8eYi6g7uGiK2NA3gntKIpM4k3Y+FmxmnWCO6LnaqbRa1+LPfhSnrnVatplQ0s85Oyfg1wlDlPWEs4z9FOEilQ2GcKPcJN9xZr9VLEb/h8+7FShp2WCp13c7V3Is8spsEyMGkm56X2B88VG1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727163946; c=relaxed/simple;
	bh=MqhA2gxS9MTxmqX69mbrOYHAL9N8LKtrtunB9LWCxLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OrCDB9tSHhb3JG89mn7hFd9IBZCBuarCaADr3WCGx+/EiWBSuNkPfIiJftPRmHcGp1yu5FbCNMW4D6DlW1eGIMj1F27kKEuO8ZvmO6iZHH7nVfyg9mFGQQHeXJONCn829SoppwGWTVxgvRc/KbbI0cIiavIhjGZ5SDAagC3xZIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v5zsaygw; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53659c8d688so3952249e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Sep 2024 00:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727163943; x=1727768743; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MqhA2gxS9MTxmqX69mbrOYHAL9N8LKtrtunB9LWCxLw=;
        b=v5zsaygw55t6J8yCFDIQpwzyIClLUVNB5Um1Gsxzf1Yn0/QnuCne9JF5yOTK/7q6ns
         ESf8b+0GbBTUAV/NQd2QCRZJAb+Mk2dY/aQPHYX64q9jnb982/GLiXhZ0xVstNPZq0Bd
         5wK0+RoMcoc7Ixb1C9shlMA1jDybIHos+39UVR6OLCEG6D6wn4YcZzom40P27fd3l2Vu
         8Ryoz6RNesjihCKyPeF/p0BIJ73rHX2PkLTYCEqNjgFfjEPCFbiuu67ySj6pl4iiMLEN
         zWUl2Ftte31xs9Pg9MfYdLZiJdhZKGDKABFnzQ/DixyDu6L+0S6Ao6QuR2QlgBJiQSTq
         wTkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727163943; x=1727768743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MqhA2gxS9MTxmqX69mbrOYHAL9N8LKtrtunB9LWCxLw=;
        b=d6TybGLr6AcJKYD5QsPHvVElvDk0YaKVNR+tBDUa9PJaadf7JduHBZ8p3NRVCUHbJd
         wCgquMl6TS297/yXG7VUWlUaKOYHbspjOsld696s6IiBCj2Fi9lybo9YCIWOeViQM+X4
         2aiUka5ywO4p4uHIA/9O53fTDw9OA1cQk7VgrLnqAqOH7JKHt11Z7b1rX7U4ix2ZSW/X
         5yhJbG6y8/l+wxoMdj0TGm+zE66XgQ8tgk25+/kAAhHt36uZonRLBcHXdkGPp+ZXKfxz
         mISPV+iqKbCrA6CLviLov9l1f4zaA0TDKvmc95QnM0jSFvkOcSx003/ag1GiesvTkWyn
         d6gA==
X-Forwarded-Encrypted: i=1; AJvYcCUx+4Opgh/ODEakMZ32wtRF/Gd1n5+KZlZQwrKvj0KdzOSB4TUq8kjOwxit7ykkLAT61FkDUKp+W/5L@vger.kernel.org
X-Gm-Message-State: AOJu0YzlqhDS2gt1ZWjN+M9llZ5yBNoga1JAfhoKKYYobbsME1yccYYF
	l2is5hezDz+L0S2L9uWilwUlag8wH1E9M/YQSADFsIAJ2CnGmpGeWuPNeu2YT8BKPPsoE2iMOhm
	hFtNszr9iyNZ9rpBnByhWoR1+5TpXA9juldhi4w==
X-Google-Smtp-Source: AGHT+IFSnhi2g8RCS4Pf7Wrz3+5o1CeBJkl9cOue8TFxLcfAoHEaLB+jSarR5GR30yYmfSCZziuzfKQojHEPSL+b7Q8=
X-Received: by 2002:a05:6512:1150:b0:533:1d4:546d with SMTP id
 2adb3069b0e04-537a651ac4amr734820e87.7.1727163943165; Tue, 24 Sep 2024
 00:45:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240506-imx-pinctrl-optional-v2-0-bdff75085156@geanix.com> <20240506-imx-pinctrl-optional-v2-1-bdff75085156@geanix.com>
In-Reply-To: <20240506-imx-pinctrl-optional-v2-1-bdff75085156@geanix.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Sep 2024 09:45:32 +0200
Message-ID: <CACRpkdaW14PgLXTRPHUjaLNKfCMRs+hpHrYyMiNaqSs+m0rhqw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ARM: imx: Allow user to disable pinctrl
To: Esben Haabendal <esben@geanix.com>
Cc: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Arnd Bergmann <arnd@arndb.de>, Rasmus Villemoes <rasmus.villemoes@prevas.dk>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 12:24=E2=80=AFPM Esben Haabendal <esben@geanix.com> =
wrote:

> Making pinctrl drivers and subsequently the pinctrl framework
> user-controllable, allows building a kernel without this.
> While in many (most) cases, this could make the system unbootable, it
> does allow building smaller kernels for those situations where picntrl
> is not needed.
>
> One such situation is when building a kernel for NXP LS1021A systems,
> which does not have run-time controllable pinctrl, so pinctrl framework
> and drivers are 100% dead-weight.
>
>
> Signed-off-by: Esben Haabendal <esben@geanix.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

I guess this needs to be merged through the SoC tree.

Yours,
Linus Walleij

