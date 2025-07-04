Return-Path: <linux-gpio+bounces-22783-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4719EAF8B1A
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 10:21:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 735CA188CD4B
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 08:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F20DE328AF1;
	Fri,  4 Jul 2025 08:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JsYe9ptU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34A4328AE0
	for <linux-gpio@vger.kernel.org>; Fri,  4 Jul 2025 08:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751616080; cv=none; b=R8XfEgX0WRot5aPkeB/gAES9Y+6pbyl0wLAMn2joNb+fJkzrQlgqJwoy+pyycGyou4NugDT2wqxTDxzcJTL6KG1VMeD8W6hQj9OawC+YN5jSuQy77OBsZ8OgjxQxPRR1AvOu0D19XsBfzImF67rgk7e8QPLAR9uskbvvkibG53s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751616080; c=relaxed/simple;
	bh=W5hy85hwlDseVRTu07tUllVYOTsjRbqVRAcm6Mv7UyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RRkX5W4blEJewX29vL0sh/anwRzsSc5Keb/nk++E2EX8T461FLo8QoyiJtr8jPrbaMdLXLyZwGlO2KO3qutRSLDvqy2nzWYs8eM2gWrxBJ5dF7ZkNo8fw/aGVZG8+vJPuKNxo3ONK26jNiQc2cvqBLXrkllyqCdHYI7vcHZG4Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JsYe9ptU; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5551a770828so686697e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 04 Jul 2025 01:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751616077; x=1752220877; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5hy85hwlDseVRTu07tUllVYOTsjRbqVRAcm6Mv7UyA=;
        b=JsYe9ptUbRq6ygTfZJ8qav+YgV6KfWWlDestKyxznjWfjFfBiF9FWut1LEiCmE4zNs
         bWCMcPoiFmzvQVT5uw8Gl0sLHU5avS7iCPu2qQheKSZFuQi0J3E+Cerssto2XrXAWaDN
         m0guWsEP08rtH53zQxzWaakfuUy5ZwGRAzdgNM5fMlmF0l/WyWGUdqqttagbWVXEb/7U
         TfaAzKbmhmSHZEJS6c2GKTIRfaGQ5pgggLhQtEctSEFSbALnaiWrSZswpNGvD34aDMaQ
         DG2IqwRes2t+rP9nyAT3DEcynYE82IjmRdLXErjKz6hJGAuLV8t9VXBEoIUncbYX3UjX
         Xtug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751616077; x=1752220877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W5hy85hwlDseVRTu07tUllVYOTsjRbqVRAcm6Mv7UyA=;
        b=L1voDT5RZIXSsdNbN7ZiMv7DcfCJKkZgbFbLMCJEotcO2KcYvDvT43bRsRC6PMWSdB
         dBQ5nqKwZr4H51nkn2yXH+GjAVsnNac93ZBKHafObFlhlN19BTRB4j3XeZOOWHMFfWsv
         CTyQUY3qTm6032V+2s/bRsSSt9trbDJq7XbpARGk1p39/i2q2G3SNY6XTONf58zcKBTS
         3q2EsYKlqKLJA+KxW72ww5Ef/5P0gHx3h2f1vmgQh0oBi3nB3Q4pbbrO2dcU9s5jhjfz
         tpFaWL9bw3ItzrcJqdHgPAYBD9dhX02kTAQxVd32UA4yH4gGfvXF+vIXtF1Sn3ejYBzE
         fZFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXo8tphq5aNx2uiKBZwkyo7AuA9Sqp2ncrba9a6d+zHl847Io77BiWUMr0AFbedLNeZOUwf+cezr32q@vger.kernel.org
X-Gm-Message-State: AOJu0YyB75/4KOgD0jAaSPc/bJq+Unxg4jci7AoEOFv75aF0e5mywmJJ
	2lBJr6sSTQF/bppG4GfD2Ar9VCJQ8GirzizgnNz/pdSaY+IsR33MKAc3VFVciaayfrCKyRmPxRf
	g11Dnsad5wlfdAFk4bU1P0VX9JUP4DHxdAfz2Z/eiNg==
X-Gm-Gg: ASbGnct0do7a3Z1gf2TTZpZFAk+dXpiuWcsV8DjuNyBBSwWqfp8Hhmw8NJohXWXiaOh
	AqUcL9O2LaJ87sH8TiMg47HCBUPkDsHUGoxMutr2BMRakjY7ZpSLdFtfB1C85jPNVVVhzK4Ptl8
	7+TCA91CikjKFIEZave6dk5+5xPrs/8Kemftj6QkhKd/E=
X-Google-Smtp-Source: AGHT+IE/4XahMx0H5K8e3G6kGLPvEJmDNT+z5yGiSFu4fWzVouleMPU8+EMqNIa7ZAvHuQVSQceFfXnXHQe0peqw8UY=
X-Received: by 2002:a05:6512:b26:b0:553:36b7:7b14 with SMTP id
 2adb3069b0e04-556f1f62c4amr441161e87.37.1751616076829; Fri, 04 Jul 2025
 01:01:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701201124.812882-1-paulk@sys-base.io> <20250701201124.812882-2-paulk@sys-base.io>
In-Reply-To: <20250701201124.812882-2-paulk@sys-base.io>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 10:01:04 +0200
X-Gm-Features: Ac12FXztT7uc15QsZMvB3fPDcO72_tN7xc565ddgY25DgxMR-aqghVzmCalro_g
Message-ID: <CACRpkdanKtZBkH90yAOjm2+7+dcNri+j7wV5AFL7NHSXHi+bSQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: sunxi: v3s: Fix wrong comment about UART2 pinmux
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org, 
	Yong Deng <yong.deng@magewell.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Icenowy Zheng <icenowy@aosc.xyz>, Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 10:13=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:

> The original comment doesn't match the pin attribution, probably due
> to a hasty copy/paste.
>
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>

This patch 1/5 applied to the pin control tree.

Yours,
Linus Walleij

