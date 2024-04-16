Return-Path: <linux-gpio+bounces-5536-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5A88A6BCF
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Apr 2024 15:07:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C5F51C21CE4
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Apr 2024 13:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE3E112C470;
	Tue, 16 Apr 2024 13:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DWmgPb0N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B8812BF2A
	for <linux-gpio@vger.kernel.org>; Tue, 16 Apr 2024 13:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713272843; cv=none; b=p6ZJts+CRm90iqgyGSLo2l/qU0xoKX1M+NLhnoWcD5lah2lmwZ9OqPyWATzvfWswZfQdDrwSIs13Y+XJbgdzIoibkYk57WNzEX9DtFH2/K4V91V2+FADTjZOIUq0ESsW+3GT6wdyAIK2Krv2kuAHkgFR0lWuf1gOdM02sbURQxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713272843; c=relaxed/simple;
	bh=HmvXI03R5pI/zAKZJlsrVo2+wK/0GPdxyq1DQa8OqhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vEV9kvXQuorwD6bA/bi4GXxqoRa52DI5e8nVExX37b6/VF3mn1UAzq+dkAVwGF2G9CJ/56aEf9m0fhfpSNLNIDVRMrUKaQI66tsio9U/Ho8tJB8tKa2xe/290LFReL7L5hu2Pz5BKCbfyKnq3Mnos/ofQ7WwC2WtKARmBl12qQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DWmgPb0N; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-617dfcf80aeso49573797b3.3
        for <linux-gpio@vger.kernel.org>; Tue, 16 Apr 2024 06:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713272841; x=1713877641; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t1wZ4RlxPXvTNTt155bxNVqHJ65kss0cZ6zzPcL8MBU=;
        b=DWmgPb0NmQOrd4jA1gi3TbyCJ67dSQiZf07YA1YuXkzXtF9tln+KzWyrsngwt+NHB1
         tjIFhiZIOrAqFDnjtDKyM2hyIuRhCVd9P55wFy16augpprdz47xpdgMaDuC/KXZ/1CpK
         PKM2JakGzGJe+OjDGiu+hbQqNVv9W1ygBtYdKlo9Vbhau/f8XPS2rjzSGgynHVd1yteo
         iq5oBzROFj8r3kC3JNBpk7c/7FQ+QopXkckH3hLN7XoTwci7E3SMgRPSxS/vEQFxMYJM
         MoyZqSKQGJdGhJgQJN4ymEZ0TLRZO0UYh6+Nbz6nzx2obqw2XnpvClZlRMXMpUNtpZEW
         8qnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713272841; x=1713877641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t1wZ4RlxPXvTNTt155bxNVqHJ65kss0cZ6zzPcL8MBU=;
        b=PJAMv2Bdfc4kXzF/sIriLbHw1a4nOfsqLlgZpsK0nj29juBF2JNdScfjLPtUMQ/V7c
         cpY/Od+TiDvmVoZngbYnkRsWrTMaZzDKg/KmN1OHr/of54Va91Ps3fMFE9xBQX78RyWN
         DDoq0W0UserPoDJNeJPzO3E1rqOOOdKCIGNjLJRq/bRwS0dx7rjhSyr/HHXsBF9Z38iw
         1twsan/EPlPxzMhk3lLPcBHObz90f+APSZdj0YjCpDypG3bwhqSQ1cARuGFcyH6xVyLN
         b2xknRigTUcalc1Zdhu+EpamkyS5mbCv7hYkkD+2Nuy3QyT/ujmbRYAVOSA2woko5C+4
         9S8A==
X-Forwarded-Encrypted: i=1; AJvYcCWoC6+U7+10SWEh9dWY08Qgyz8RLiimNORmU+3u8dZdLNDoBtE9Y6OVsrtlBkKX9vUPT68KaUJsH3eo1oBz3SavV2hCXKy21YI5qw==
X-Gm-Message-State: AOJu0YxEgwAcsBwbjvg2b5wQe7ptWTJbdH9wm3NBNJcjh4pjIhYkDEDn
	9MpOippovXaei2Ko2UIY7prCmvdUSCdxqaC3bG2Z/8eqOfA8Ah5izVVnvJz/ty3CT/Y9tkw0lJa
	S2jrtRJk24uk6ZNwFTc634X8b1vS48ZFVT11Myg==
X-Google-Smtp-Source: AGHT+IHb8YezJrIKOfLoMoc7uIpD4dtBShh3owNc8+qLs30nvSoLDk2eI9a8QHBtTaFEE0X5MmFpb8tz5c6JqPQMdjY=
X-Received: by 2002:a81:7e06:0:b0:618:517b:9dcf with SMTP id
 o6-20020a817e06000000b00618517b9dcfmr11136789ywn.22.1713272840743; Tue, 16
 Apr 2024 06:07:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1713036964.git.andrea.porta@suse.com> <8fb5dde9404875777587c867e7bdb4f691ab83f2.1713036964.git.andrea.porta@suse.com>
In-Reply-To: <8fb5dde9404875777587c867e7bdb4f691ab83f2.1713036964.git.andrea.porta@suse.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 16 Apr 2024 15:07:09 +0200
Message-ID: <CACRpkdYmfEz-eM_R3ifGnbu6saL4Fd60D2ksyCr0SW0X6M_1VQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] pinctrl: bcm: Add pinconf/pinmux controller driver
 for BCM2712
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kamal Dasu <kamal.dasu@broadcom.com>, 
	Al Cooper <alcooperx@gmail.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Jonathan Bell <jonathan@raspberrypi.com>, 
	Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrea,

thanks for your patch!

Some comments apart from was said already.

On Sun, Apr 14, 2024 at 12:14=E2=80=AFAM Andrea della Porta
<andrea.porta@suse.com> wrote:

> +#include <linux/pinctrl/consumer.h>
> +#include <linux/pinctrl/machine.h>

Really? Why?

> +#include <linux/pinctrl/pinconf.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>
> +#include <linux/pinctrl/pinconf-generic.h>

I would just expect these.

> +static int bcm2712_pinctrl_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       //struct device_node *np =3D dev->of_node;
> +       const struct bcm_plat_data *pdata;
> +       //const struct of_device_id *match;

I don't know if others commented on it but drop all commented-out code
or make use of it.

Yours,
Linus Walleij

