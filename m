Return-Path: <linux-gpio+bounces-26481-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D63D5B91C26
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 16:40:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B75AC18965EF
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 14:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7182027F74C;
	Mon, 22 Sep 2025 14:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HpZE7SAf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8582D27F160
	for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 14:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758551993; cv=none; b=F5ByjOIt56JG9vdoqDxlZxy18doDJ8x+lmbnUdtJBt/w0QYs731UDchnCu94Coizr18cXuzsBSDzBL3N7cG4WSP+BVGCpxwUFx5luI2YL2NcysEhN8qYWgXMt0CBfGskcUsHj3dRmf3Iiuux3CvVKvbEc+hm72I2fPhyBMbsm68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758551993; c=relaxed/simple;
	bh=1qb/PhPcrTa7xKmIVwUMrRZk69KrdxahU7Zve9sj4Kk=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t5lQiXpF4BBdZ4SgFBvi7vr2dKCUFrwKvOw7g+5NrdX1vPjgKsv9xfiXUoGhR9jvqdR/uyKJ5zR0amdJ6d8k/5bSIRar4KrRsgwVfhiAUJBGFWSlQtFXQs7m35xhVV0MUE71YFtwb63m/hsKCoJ58Qu/OftyMSCMnpDpDo4r0DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HpZE7SAf; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3652d7800a8so23430831fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 07:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758551989; x=1759156789; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gmPELkULJYImKCx1BhsM+Vu7fjNRwtbTTMHczanPvlU=;
        b=HpZE7SAfU3wPHIrvIh4TEl6K+nqVKQw0UmXKD8ugeOBNC1OKM0bTnk7SV+pFNpSy3W
         iuCRkM8iLwAjnsXZVkIRVUbuq10XWTKe7+i+2KCHAAWpSZoQzcD5BNTA2bumB5K+jSvT
         6+NJ4FhO1NvgbqyRzc6w/ZuVSO21fVu0aczNv1v9PmqKZPK+xycv4gTc005l9jJXEpUs
         5Kq6EWFAaYs4EYu5x2TpVTK996jdK2C/+Akvb3YBdrcoJTZYKx9ojEDxxcFaP5oPbf8a
         s+4dg41LqmJR8ftDJLWCkaSZf4e5LO5hDpXfh+tHmZKEN2SvJLkNYMARX75r0KFxf+xj
         Litw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758551989; x=1759156789;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gmPELkULJYImKCx1BhsM+Vu7fjNRwtbTTMHczanPvlU=;
        b=csPDzGP98L7ZnUFEREYw6ytPbIK4CIU8tyN+0mnW5Ah1lHOI825fkCciXWDlAvWXZw
         yTup6+DDWpxdU2OC0qSO+h9vaxCrQowKq4puZLF0/jNGampgq6SXy9mLNxfCgiMkcfxM
         xL2a64r/zQKUjL5Ud9LoGajGgF6+qlWtQK9W1ckjUtiXlxFx11Tg7wsjVqBYqyQAc1VT
         k6v9QP/cABd8Yt/DL6XUJQYN8EczScuG43N26gEW8bqSs/x2SiSqo0fTWkbl0iVgJPSm
         X7BEoXVohjdeiPz4IPCtT4m0ZdFJWu+yU2mQRiK1NxePapYVNy9AB0x4+7zBbchpkHhh
         TaYw==
X-Forwarded-Encrypted: i=1; AJvYcCXfJevOr6NNaVraIpoQHi5vTOHmqrLU8Kls9d2uEC4LdY5RincxquplSnNqLaZZQ82Ktb9vTxicF6oS@vger.kernel.org
X-Gm-Message-State: AOJu0YxBFZsk6DjjTuUAsfq/zZxAT09MUYa6kECdToPjLHytHmfr6/7c
	VyxXlmMViJAidnQh/+uJkXxLsqshL4289x4RvS+NQxhuv/Ge/tnfjflW0fL5+9lPxz3ODjsaCR+
	PSpoGa9LVgyMGxgZMSsekE63ZgoLTsSXkMscVXuP10g==
X-Gm-Gg: ASbGncuIFgfNZ7AuhRU233NfQw7P6eZZ0S16HVGXt+Hp5XsdnEEVs1f9hmenqK4NSLg
	7krovEMfJuUuooXOqAcIJzvjMr/ig998OwJqZQ2o/CrubPSqur7KnaYrZqrgs44Ek6+IGf604So
	rAcUQC2O9vMRvPut5qRyqsgC+GePOiiqnIy1iFLLjn79puVbvGynnusjl/4aQnlm0p+Y+dF1KVU
	TxszAx1HcA1EbGbLTWvahiRzsT2zLQ2Mx9tcw==
X-Google-Smtp-Source: AGHT+IExZvu8LaOkD+FFW6unD2a0DePvm8B7wQ5voZaVzHneD76y1XY5ORMFjW0HfESuNlENS6VkMBHIa4vtWl8+mWo=
X-Received: by 2002:a2e:a985:0:b0:36a:5be2:610c with SMTP id
 38308e7fff4ca-36a5be26b03mr17593061fa.42.1758551989460; Mon, 22 Sep 2025
 07:39:49 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Sep 2025 07:39:48 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Sep 2025 07:39:48 -0700
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20250922142427.3310221-9-ioana.ciornei@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250922142427.3310221-1-ioana.ciornei@nxp.com> <20250922142427.3310221-9-ioana.ciornei@nxp.com>
Date: Mon, 22 Sep 2025 07:39:48 -0700
X-Gm-Features: AS18NWCusPQ_ZjuN8MoZetaRUxQ4865VBVL6jpxaDsdoZyr1QW7ZOWPBnamzLQk
Message-ID: <CAMRc=Mf0i+_1VKdumcHyK_vBU_dK5CZWhEPhUwsFX6dRyJ=sjg@mail.gmail.com>
Subject: Re: [PATCH v5 08/12] gpio: add QIXIS FPGA GPIO controller
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>, Lee Jones <lee@kernel.org>, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Sep 2025 16:24:23 +0200, Ioana Ciornei <ioana.ciornei@nxp.com> said:
> Add support for the GPIO controller found on some QIXIS FPGAs in
> Layerscape boards such as LX2160ARDB and LS1046AQDS. This driver is
> using gpio-regmap.
>
> A GPIO controller has a maximum of 8 lines (all found in the same
> register). Even within the same controller, the GPIO lines' direction is
> fixed, which mean that both input and output lines are found in the same
> register. This is why the driver also passed to gpio-regmap the newly
> added .fixed_direction_output bitmap to represent the true direction of
> the lines.
>
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
> Changes in v2:
> - Use the newly added .fixed_direction_output bitmap representing
>   the fixed direction of the GPIO lines.
> Changes in v3:
> - Remove 'drivers' from the commit title.
> - Remove the qixis_cpld_gpio_type enum since its not needed.
> - Remove the NULL check for device_get_match_data().
> - Use a bitmap declared on the stack as the config field passed to
>   gpio-regmap.
> Changes in v4:
> - none
> Changes in v5:
> - none
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

