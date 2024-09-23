Return-Path: <linux-gpio+bounces-10359-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBA097E837
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 11:09:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C08571F21DE7
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 09:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 269D11946DF;
	Mon, 23 Sep 2024 09:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zTjHjh2s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3790C1946BC
	for <linux-gpio@vger.kernel.org>; Mon, 23 Sep 2024 09:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727082534; cv=none; b=bFWo/q8bcbYgvpdzNOqY0Yay6/Nw9IKMjuidqxrphrijbvuW7HDZ0Xtfiv88LQYYnACqiDP1rI7CdE/2y9eZHplDrr4xGzEltWEaoODJhxj1d6R2+i/uIFVabjFhF4uqSGjWI+f0YD7EYMZnr4lxbkbBzH7bsBSFWl/CYsZV4n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727082534; c=relaxed/simple;
	bh=JELDF/Zw79oZ0FUIS2rLWoMNSuxFhGD3+cD8JeDI/eg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lsYV0Szq+W7ZgNELfex9f2po4Uo1021J1VOlY3BsGKZ2gNMlDwqlVWi8cDjKOzlIy9LcZxQpPDJQUNNTghWUX6bxAJKTRuLIo/pggCjE4nRFG74YVWqPjFn5l+cn0k5oEr9LwSMFoKdlxpaoTY9ufWyhdhiK5Sofu1a2m2JoVvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zTjHjh2s; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5356ab89665so4774279e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Sep 2024 02:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727082531; x=1727687331; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JELDF/Zw79oZ0FUIS2rLWoMNSuxFhGD3+cD8JeDI/eg=;
        b=zTjHjh2sMWoJu5owFEYbdlF+4UWLgteX9a/kwFOebMBVFAkyzWrdbET+h1rjkA8shv
         oydzO7mndNH1A3PvJJjPtScGFUJi/lg5FGllkwawkz5tZYhxp4crGQLOjZ1MnQVF/2+l
         a2vNArGW8Z0IISmFYUf5D67EJMvhrW7B8fPOa4OWTwX5rHdfLgI732hWcveOkl+25tj6
         VQYIgvG1vLhghsfbLmuDsuGpEZCaZ+P8Tym7K6U9WS+SO9kfKYsf/o0houN481hnA567
         wMmHlZP79Kx0IQT5yKRXshkU8sMtyeekXVdBy2rtz89TelrTwQbwfM+kKGhy9FMocUSg
         2whA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727082531; x=1727687331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JELDF/Zw79oZ0FUIS2rLWoMNSuxFhGD3+cD8JeDI/eg=;
        b=UmYcMhCaPlzi7Sw1tjZR4B0FYWVz8q4wV8S1obJZb4HS5igP8PI8T+WSTFVx1UDQuP
         3zd5QcbvnQj1sAvcIikyHd7LbUPTPV3LKvq4MRFAL2PQ6hwPCQqhralliLUxmEM4uFDo
         d5LK8PpKGFyhWBxchHk6h68ldo4fiEEpMSCOXJNc3+BKoIsALGpP1O6Q/YPbg/uvFzG1
         RpFq8bT4sFYyGubHaL9TMS/hDqMS2zqpQbq3E4/26PDovtndyQn6oOD38JIHuFb+s+KW
         Fn36uErpaTLwzedVnBBRNIaVBkD7iSNLLTMwLcpFB5tKtTmohzDcn2uQi6kYnOZM9aaG
         0E3g==
X-Forwarded-Encrypted: i=1; AJvYcCXnPQghfcpqHAhN4qWFahpzx95Gv2PB/PdhBfVI24d2jhk4HKmOZfe6fpj9wenGcRW3tfUlbkRYXbqd@vger.kernel.org
X-Gm-Message-State: AOJu0YyLxpGx9lrUHBt3YqFmVIaIsHGhCl+vo/ECe+5IWetbCloN4+4g
	u0xHfAZh8W14NdhYO0ewCCNLXG1aZdCBZ3lVu7fXwA1Wkiej8+aobfxIC5Z62dA4+6grHe0l5D7
	Dp0hbNPoxg/zKRq98Jn4EgRy2AGRgXiy4ZbCjx/CVrMvlQ4BC
X-Google-Smtp-Source: AGHT+IHo5OqAsBLecq0W7uEgoSonYeSP+z4Hl3h5JMui3ZaIwaomJwFKc1/L2fAHd4MtYPhb8fguCO69PRbjQ+Nc6rM=
X-Received: by 2002:a05:6512:3a84:b0:536:550e:7804 with SMTP id
 2adb3069b0e04-536ad161b01mr4635287e87.18.1727082531360; Mon, 23 Sep 2024
 02:08:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240905020917.356534-1-make24@iscas.ac.cn>
In-Reply-To: <20240905020917.356534-1-make24@iscas.ac.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 23 Sep 2024 11:08:40 +0200
Message-ID: <CACRpkdZYnwbpqSLrxaOZ-0rbbQq7XHjznnCqOx1Pk=8kPiYL9w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: check devm_kasprintf() returned value
To: Ma Ke <make24@iscas.ac.cn>
Cc: marcan@marcan.st, sven@svenpeter.dev, alyssa@rosenzweig.io, maz@kernel.org, 
	joey.gouly@arm.com, stan@corellium.com, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 4:09=E2=80=AFAM Ma Ke <make24@iscas.ac.cn> wrote:

> devm_kasprintf() can return a NULL pointer on failure but this returned
> value is not checked. Fix this lack and check the returned value.
>
> Found by code review.
>
> Cc: stable@vger.kernel.org
> Fixes: a0f160ffcb83 ("pinctrl: add pinctrl/GPIO driver for Apple SoCs")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>

Good catch!

Patch applied for fixes.

Yours,
Linus Walleij

