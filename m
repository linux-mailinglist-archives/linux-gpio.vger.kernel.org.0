Return-Path: <linux-gpio+bounces-4991-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1EC8952F4
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 14:27:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B99961C21E8C
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 12:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7142877F11;
	Tue,  2 Apr 2024 12:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J9MOySxE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925BD58AB0
	for <linux-gpio@vger.kernel.org>; Tue,  2 Apr 2024 12:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712060869; cv=none; b=Wwu/1dbkvbmm5rB8R+CVSuodZIMrZqrYAF5dwBK0r5Rw0OSnskeo/0rgPXYLNteJp1uGV0DbVIBl6Xc+K3pQDrBcrFC3ES/3ergcKEcLXBXvfEFPJ/NVeDp0fxqrVyCq46YzAZM9t4UuRdo/t543CWvVQCO/ugfRSN6KRTwfT+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712060869; c=relaxed/simple;
	bh=OX9aAE+rsyjd9rU04bvDW0rrl1vTrXrygAuB19dKSeA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QNEYfVZBP16ak5fqj74BDnyi1UfNM4gIjmqndEYkpgrt1ut7i+2R6P3UXB8KihrK3IR1FAHOP1d6ao9dCKXXLHnu0B4nuGKdUots0hkf3B8AaUJeb9zz5JYG7zZ5h3M75OR7YygrYLexSQk5kKtGMU2s4DtdG+YhNAfyyH7ougo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J9MOySxE; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dc25e12cc63so5377000276.0
        for <linux-gpio@vger.kernel.org>; Tue, 02 Apr 2024 05:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712060866; x=1712665666; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7aFDDEzPr4uOdZH6qoLKZ/lmr4EJ2hpeblGOksnU/bU=;
        b=J9MOySxEEL9t6SlReuknbNGO9TmlIEGngR/GFkyLTQKxRmAy9bWCjJY0qj9s311EG5
         xK0Ah35Qq7RTxzq3yPADvaLX1r52trw9phx46DEnP8EGfjm/621gCkRYUyOPm2Dj6oHj
         T/5w9M2v0X9vYeD6xMCTGxcC/rESI5NlK3+Of8NWdJbIUV9ifKz5My6kUUUmK+bOG8O9
         GWWGj+ExmttxKtIdFGRmO4XXzeodR2z46Y4baYQhsq6i8/RkkXOBIhfMMExHFKJCF+eO
         +fstjoY8ZVdYvvjiShUTRSQgkgy2Jysl4VmZuhiFxjA/LxhT9VEuVSXeYCNt8CfledRs
         2F7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712060866; x=1712665666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7aFDDEzPr4uOdZH6qoLKZ/lmr4EJ2hpeblGOksnU/bU=;
        b=pz07gtTv/ZDpDhz92jLGkPch2WmWY3F1O2XLJvrwAdWXC4D9tfwCbI/FGxSabawX07
         y6PoiYKvYfm+ik1JVnTBGY4yZ34tosspBaaToxlVceHYXjDcSECGqzlrOfXQGnhNRubV
         CsECmR46mSfeKwpDZqlqlCKeQ8mP7aXWHhuDVr70o4G8fPHdcP9dAueuaz0ZagRh6SHn
         ser/bRFpotXC7WDGxpvjpqfcJWd07L5TzviM3JhsbdEya8ieRdvtDHIEueuZhGZFnS81
         XW26TeOMExc4PFy7k7FKaJN280I/hDlMLG0LeKafauqEAQUfg5/L2DX5nZjncUx189jO
         fx5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUpcXp8RY3kO7fVYowmSAyMTHRG87ZnZv8AqcfCtyZxbDJ24wJ7NFON0G88YCxvViJwAswCAur7uDn8oyftFIY1l+cp64x0kBosWA==
X-Gm-Message-State: AOJu0YwYO40cO8YV7nF0EQ5853ETSM/W0jMw8Mp9uaH16K5fgC33DMoj
	AgGWUBE8FEF3V/DRcagczG0wYrXkZcrsUpeQGsUCIFSCRuFeRfqS+6diJaGf1VQtBxduylq6ste
	mRFvXxKh9bjy1V5IzBoMFg4yXTvt6bZKnaT7hCA==
X-Google-Smtp-Source: AGHT+IF/MgDhH+cqpcl2n6iWdzGYhkD+F2Phv53TFG/u/SQ3SKg1xPykdw8tq9fQIh8eQPfxN74uIlXMMNpMJt8xVUE=
X-Received: by 2002:a25:820d:0:b0:dcb:df38:1c20 with SMTP id
 q13-20020a25820d000000b00dcbdf381c20mr8434209ybk.24.1712060866715; Tue, 02
 Apr 2024 05:27:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240322132205.906729-1-arnd@kernel.org>
In-Reply-To: <20240322132205.906729-1-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 2 Apr 2024 14:27:36 +0200
Message-ID: <CACRpkdbUZvAHSCD5C73rLize6XnPuPY1BCGFiTW_t_rM8sSngg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: armada-37xx: remove an unused variable
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2024 at 2:22=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> This variable has never been used and can be removed to avoid a W=3D1 war=
ning:
>
> drivers/pinctrl/mvebu/pinctrl-armada-37xx.c:837:6: error: variable 'i' se=
t but not used [-Werror,-Wunused-but-set-variable]
>   837 |         int i =3D 0;
>
> Fixes: 87466ccd9401 ("pinctrl: armada-37xx: Add pin controller support fo=
r Armada 37xx")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied!

Yours,
Linus Walleij

