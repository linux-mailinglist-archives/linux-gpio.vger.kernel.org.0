Return-Path: <linux-gpio+bounces-21677-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD62ADBDFA
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 02:15:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B0C47A6A2E
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 00:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2636BF4E2;
	Tue, 17 Jun 2025 00:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MIC81niD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0C8749C
	for <linux-gpio@vger.kernel.org>; Tue, 17 Jun 2025 00:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750119295; cv=none; b=JJZnRZrYnZjos82MvJM1gBGjPJ3YAFalvbQHPYXXu1HB70zGesixKSNYczeEWuBXCJa20kvF/i5sFy7HBAf3joz2ywy3GXQdpgolXHlrTZ06b9FZh39mcXR1nKsDNqjZQejoSgheO07xjQTAeHEhGavPtKVCoW6aN/EAEsyfd+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750119295; c=relaxed/simple;
	bh=7SrDLj6XmjtU4+fVEKPUOsrQn1rKnLtSHwFF1cUDvb8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nOgL/bVq9Qs7O5DxOTnM9wIaS8Vr4vigdkXW13wcKUCTnq6lC8CesidI882ddhObcA4XIniQzchIuPf0uVojESfcXtcNRHH+pslug79g7MGAKLqCYtbzCR/ZMy4pHc7ZO6plqpB/Sq/UE/cl4/6mdkDce4pn8FFLR4QBwpwXRT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MIC81niD; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7485bcb8b7cso4040550b3a.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 17:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750119291; x=1750724091; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tdpbl3k/YSmDDGdsuwN+GlqcV59+7D5igTv++Q9dI5Q=;
        b=MIC81niDsiwzjRv4avS+R4BR3STC2ApCextBPikRUHIy1ILwIWhvdxBy99IPNrapeb
         2bmbcbefphFfuNN3/OhogbmlA823e83r907eq+Pso0gV+sF4d3CBhBbUGta1N8pTmfXn
         RvfIrqmbf8d0P8ipQHz11n55LepbsAnFaDxKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750119291; x=1750724091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tdpbl3k/YSmDDGdsuwN+GlqcV59+7D5igTv++Q9dI5Q=;
        b=PzJHBROh1eZD8IvKPcGpj6CnfddZ2KNhPjbq7nuhxZUKXW4BgSck6cauFP9N59cCnS
         QS2EnIbwz0SxOGn3UK5W6DWsTu4YBQlycrnD6vuQRf1sVQBaYIh0pGhCfGzmzFXecAve
         MObQ2AvMd2wKVPWidCmNlV+kcwVqKCNDdwKerf8diPEEyMPMpzYFLyJMlicNeaf9XGw1
         z6Z3G+az1BLPDK1U9vCxlq/FSGs0nCSEOK/NNS7EaGEj73Hh4Ki+LIZxZEoth8Hk73yV
         XN2ATkbyvsMKrm+PBh8JJd9bJsHdG/J9cG/nS+zHIQFm7Z/Hvv/nNngf0r3C/2xeHLtr
         Nk6g==
X-Forwarded-Encrypted: i=1; AJvYcCUmpwe1BhMvGNrvqwqcLJc2/I2AfkejTvD/lP/MS7yFSAfILde8Z0ydkdIueuyix0dHw151XXUWh/uz@vger.kernel.org
X-Gm-Message-State: AOJu0YwiPqC33CIepvDkNvji1zwxbhLPxIaoFnHDIWB27QI7+dLrAYnh
	TQjYJFMxlW2bOY+vHfo/W2D5wr1b9WR8ilLUv/HaKMA1ZhKXKaM8bWOPbSJDWl++EJykb3erfJd
	beCA=
X-Gm-Gg: ASbGncsgtqMC/IFNITxGJh+GEiHuE9OLsZBThxf2tX+dCRBDWuqFwSB7iccmz/hrCTF
	2iEVhMo2YEmK+2vxterj7547Ka5XhNDU0bFtdDZCXJ7wsSGM3x7OxEc0E8yhXbA8A8PH37HdcHf
	BQpo4pea2CYOzF34OsS06Ehs5Kd1lr4nQ50/voMWsSqsEHYQ7zYyC6j1wu3Gq7HVuj+J3hSOqkv
	GJfYQKZlnn0BZ5hX7n3TsAMXx5mu62Svt480NHKhqlN3231cvRotiXV/xc7g6yRMqxFNBJ1o3ct
	GdpJxDEGc6yjxqqrCL7az6cTsgG4zxpZTaanFuHOCThNaAq54+lODEMCRxq8zAsxcfY4FbFpGTk
	WG9+K/jjlEFkw8xnjahQQejwUvSDl3ojbRacEuppe
X-Google-Smtp-Source: AGHT+IFHuVhonmMJ95Svdrcey0gw/6mhHt7lKqdHrc7U6/LhL6AHb+yIduhcWTqGrHszvl/bKK/aQA==
X-Received: by 2002:a05:6a00:3d10:b0:746:227c:a808 with SMTP id d2e1a72fcca58-7489d04fb27mr18107867b3a.24.1750119291561;
        Mon, 16 Jun 2025 17:14:51 -0700 (PDT)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com. [209.85.215.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900064d1sm7768423b3a.61.2025.06.16.17.14.44
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 17:14:48 -0700 (PDT)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b2c40a7ca6eso5362420a12.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 17:14:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWNYV3xTVpvN529kNQgiyNRI+PrFUxyDGSkO64U7MtYkw0pzindn+gGKGXQzjF/4WCZwb1ODgfUREfJ@vger.kernel.org
X-Received: by 2002:a17:90b:5104:b0:311:ad7f:329c with SMTP id
 98e67ed59e1d1-313f1ce5cacmr19759622a91.18.1750119283755; Mon, 16 Jun 2025
 17:14:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-gpu-v1-1-ac0a21e74b71@linaro.org> <CAD=FV=Unb1LdKV7iuPME1KJ35OBbP5OXD=_=A0ESQFCOzFBSXQ@mail.gmail.com>
In-Reply-To: <CAD=FV=Unb1LdKV7iuPME1KJ35OBbP5OXD=_=A0ESQFCOzFBSXQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 16 Jun 2025 17:14:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XXCkqWmKT-bA5wqtbUy0nFRkewyApAkAx_1OCGAXV9Eg@mail.gmail.com>
X-Gm-Features: AX0GCFuDw-NZx-6lsELE9bQYvQioo6Vrln5eCE046cB2GyvGfvnR5APAhOiGf30
Message-ID: <CAD=FV=XXCkqWmKT-bA5wqtbUy0nFRkewyApAkAx_1OCGAXV9Eg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 10, 2025 at 9:27=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Tue, Jun 10, 2025 at 5:34=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> >
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > struct gpio_chip now has callbacks for setting line values that return
> > an integer, allowing to indicate failures. Convert the driver to using
> > them.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> > Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> > values") added new line setter callbacks to struct gpio_chip. They allo=
w
> > to indicate failures to callers. We're in the process of converting all
> > GPIO controllers to using them before removing the old ones.
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 18 +++++++-----------
> >  1 file changed, 7 insertions(+), 11 deletions(-)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> Looks like this should be fine to go through drm-misc. I'll plan to
> apply it next week unless I get overly distracted.

Pushed to drm-misc-next:

[1/1] drm/bridge: ti-sn65dsi86: use new GPIO line value setter callbacks
      commit: 98df1626ae036c1ba8c844c9fd995ab8f23bbe37

