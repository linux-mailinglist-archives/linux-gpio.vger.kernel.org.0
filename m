Return-Path: <linux-gpio+bounces-24983-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AC1B359A5
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 11:58:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0675C7C2862
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 09:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B81F31AF20;
	Tue, 26 Aug 2025 09:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Pu8tE7UN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E782FC87E
	for <linux-gpio@vger.kernel.org>; Tue, 26 Aug 2025 09:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756202282; cv=none; b=mv6AUes0koCny2BYq10wbgnScs6LgtkBcPeXze+tDATx0mGDNXb4keXah5IhYP1+MvuwfsCGPNrKkvZrcYdo7VrwXLU64FdBUuVtQtIg/1drbA3K+pz96rSx/PA4y66DdJW/bVyYnpmYtPZA4ZQfcRFvlhhazhm/RI37nCWc440=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756202282; c=relaxed/simple;
	bh=Rt1wBuOibWYMf11azApMmPxWPuGaXVXsAWpTctmwPog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LHhaEGsHRHihDrw+OeQEK0xflOPjAXc3ck5A2QiqxcGAV2iW1Bhc67qDV/97mYx0oPjcWCQlwDpSfYeI8HWakNZxS6lPFWA8CKZF4eWE8atQusbydIdXVlvNETdqE8IRmgWIbBeNQFbont0PePTP6uh/duWCiGp5QAXU1povKCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Pu8tE7UN; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55f49f96f42so1629307e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 26 Aug 2025 02:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756202279; x=1756807079; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uOUXkb1uF8zQdB/sKiLIuRwWdep4Dp9YFQhPpYg7e7o=;
        b=Pu8tE7UNSPb/mSu8D8XVNJ1m+w/gr9winhNLMNf5oNNhDIbwDbeoNasGh3h562/Z8G
         mCXFe1I8ZZxoJtKns/bQCKXoSXmIVoJtI5E19heex3sjrcGxaQU2kfr9wHdob98rL0Jn
         ly8fbX+5vAcNPWrQMMpcRo7UtVYluLIUCe3bwgfEp8uui5ohvG8u/Pe8Aq4aY9/+AuDM
         iVaw2BMpWe7M6WpsyOqJyY10Mo9VshFCDvsccyDqpIXKA43ZTVsStftFBfiRih1ZaMsw
         jGaf0yyIbgu+iiiE0pxmkgHTqTXZmDOFZ98vubSvsTAtcZf13nFmFU/HgXzYBVwJEear
         JFPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756202279; x=1756807079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uOUXkb1uF8zQdB/sKiLIuRwWdep4Dp9YFQhPpYg7e7o=;
        b=tfnIVimSa7fGLmaMboLr3QHZWm/NR7wERaYW1WlL68o2h720coIRQASG+rXzTIjVyW
         I6q/aUZU8w4lHLvaSQS5F1I8GNYlqHic3zM+ETIvtUMupEv9gh5BuZLGsN3WtfdLLEHW
         R684sTsSL8jPxps+UpxB5lyn0sb88Uwfqvc/1CrDb+IkLq7HOrd122lfRUxItmIs76e1
         hLymEsKa8Ol4Kp03QivJlrhwU6gwoGbAI1cViir3WR4zG/lZveanHm1+pgWzzCSf2UpP
         oN/kK7v64Bi7EuzTUQ2p0PTetD2QQpMtjq9XKGBiiyugPnaNQJyiCcXGvzBPVLH76z3W
         dutA==
X-Forwarded-Encrypted: i=1; AJvYcCWtq55+ciZJT8w/2gz43m3D51nFSDAy12PWjIrOIa35ikaurivHbBm1g5xbwKFddZcRUC0GkvQcm4Ev@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+h+83ARM+9z7IOGrlIRLhX2JftcTKBSj/c8iWhKR+L9Psjbfb
	lMqiVts1SeKXQuWM78woCGpbBLiJjeF+Agm++7HPVDCmXsfBGLnYv50k51TuTApWHcQ+gzUMNTx
	b7m5KS0XREwwa7MGZwBwgDMXPs2BQMAQIrhmXq9/vJQ==
X-Gm-Gg: ASbGncuYJ5CBYAJPX25+Y2aHQXU/Qjaf2l6RmaFtQxI1Yewzj1GdGi/BrBAeaUNkRiA
	jT7GHH6P8ADBcDIlVIU30kfea75R9sV6/dlz2oCJpczSG8YzRBUToqo4EzAUWl40IPoHQ7087XF
	ugYEyya271E6uQOv5rThlmMnKICzknfYAMW8fZvz1ncy9hm1f2BGChMVIXGpdeooHOSMdmDr1ju
	5TKM6aND4uV16hb8nbQPOHelAgjoH2XvphGohunB4jY8CF4tw==
X-Google-Smtp-Source: AGHT+IHZlig7uTIvb1Hm0+VQCqd18Uy1yI/ilX78XfwZSj12J+ieVVBnbFx5cn43CrziQFS1Bp5XyB1Kt9NlfkCCxzM=
X-Received: by 2002:a05:6512:440e:b0:55f:42ca:cc03 with SMTP id
 2adb3069b0e04-55f42cacd56mr3019395e87.56.1756202279297; Tue, 26 Aug 2025
 02:57:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <372550a2633586d2f98b077d3f520f3262ca0e2a.1756104334.git.christophe.leroy@csgroup.eu>
 <ac7c79b3491cb48ef7c193420b9a9e4614b88436.1756197502.git.christophe.leroy@csgroup.eu>
In-Reply-To: <ac7c79b3491cb48ef7c193420b9a9e4614b88436.1756197502.git.christophe.leroy@csgroup.eu>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 11:57:47 +0200
X-Gm-Features: Ac12FXy4Ibm7fbO9KiNfYE73-dyWntHoWbLgchN6hbkj2Va2bGEIGeT9v8x9Fxc
Message-ID: <CAMRc=MchS5d3RHjtpc-fAVzKyhMchdUhvZCgTNsJ94u5Cc5FWw@mail.gmail.com>
Subject: Re: [PATCH v4] soc: fsl: qe: Add support of IRQ in QE GPIO
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 26, 2025 at 10:41=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> In the QE, a few GPIOs are IRQ capable. Similarly to
> commit 726bd223105c ("powerpc/8xx: Adding support of IRQ in MPC8xx
> GPIO"), add IRQ support to QE GPIO.
>
> Add property 'fsl,qe-gpio-irq-mask' similar to
> 'fsl,cpm1-gpio-irq-mask' that define which of the GPIOs have IRQs.
>
> Here is an exemple for port B of mpc8323 which has IRQs for
> GPIOs PB7, PB9, PB25 and PB27.
>
>         qe_pio_b: gpio-controller@1418 {
>                 compatible =3D "fsl,mpc8323-qe-pario-bank";
>                 reg =3D <0x1418 0x18>;
>                 interrupts =3D <4 5 6 7>;
>                 interrupt-parent =3D <&qepic>;
>                 gpio-controller;
>                 #gpio-cells =3D <2>;
>                 fsl,qe-gpio-irq-mask =3D <0x01400050>;
>         };
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

