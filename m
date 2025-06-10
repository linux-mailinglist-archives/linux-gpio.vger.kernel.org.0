Return-Path: <linux-gpio+bounces-21274-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE05AD3ED6
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 18:28:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF6BC3A7510
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 16:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AFC02397BF;
	Tue, 10 Jun 2025 16:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KMzqsanx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D101A8F97
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 16:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749572873; cv=none; b=Uroa3JAyEyf4mZSraWVxYWuxqtHh8YVyLab69x3uGJub2O1JvwSzMQLM3W64cFqtu8oYxJ4/TVgQnIk6iA4EjR7e0xEIo5kXd2hJnXXLgCfyC+VOp6oCUSLa7PztdE198L0zTcyQ83zm+40kbhwc/BiwWLLzQZfMF9dyDm9QIi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749572873; c=relaxed/simple;
	bh=E9uy+WeeyTRFWQAhgxLER4hMEEGRG4YhfQaDeAKuSp4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bCbSMAH+pyQUN2fKNRE19v0PErk3r8i06rUeuVHjhxJwxF3qTEO/AFD9Et3wkUqJtElRM0P7A4KW2SYLzUu+W5ia7PcXYmkX0eNuxW/0NnUahPTGlIArifJyH1OPv1n0FclXkJGP2inwRzUeDnnp/U7QhGiEPS2Ewnjj112+R/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KMzqsanx; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso5041060b3a.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 09:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749572866; x=1750177666; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sRKty4r5poxGqV6J4DOkHwQy0EnjswzgP31JT1/VNiE=;
        b=KMzqsanxP96EJMpf7w86fd6/ATycpVKxdMToH1eMyWstKTjt58USF+5M2o6gCdhTrI
         5gfSKZBU7A944eU7jlMJINdiH+PXm3w88KNV26KmQFiy/jLwjifaPYdDKSZoktgjhvdV
         H649RqdzuNpt4WbULADheKummoAQBrqG6AAW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749572866; x=1750177666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sRKty4r5poxGqV6J4DOkHwQy0EnjswzgP31JT1/VNiE=;
        b=wxFAfPP6L84vVB9Ob9UXKfenHVBSV6FKhbO7k1eXQi4s8wqO3D0yXLj7hawR8+0Ug+
         URXMgRPCEm+DLLNuALHAuNaN8q75HdVh0I9CTnR7776BXWkSZZ9pf+V7WJiEJ6DXSlEq
         yyPuy9eiylO8w4Cb8BeiubCg45tFbxYJJwgobVK30dhNUPGmEqsUmQx8PddgaHyMHxNP
         dQlZLRTOo0oWqP+mf6fvX9MyCEo/h6B8p8JJ6BcSYClD0GOjY4BtFxXQUU0TKEMTDOsp
         0ay2G7Ikf05u/PmPMcagSoqtHFGDqOeGyEEs8eA/eJ9JT4ixfPs4mKl3RboN0r+2G6s6
         6mwg==
X-Forwarded-Encrypted: i=1; AJvYcCXcys90fpj+bdPO4eWfikRD2sCBbnaQkrozWtNfnDonpbTkO+6fTP+LbGxa9zoOiQutXs8xsw5hzm+4@vger.kernel.org
X-Gm-Message-State: AOJu0YyAe4NPAGv77Ep1wjyEmclFc1L01+fJ9PLU1uZ3aPfe045ijf8u
	6zQUzyydJlgl/m8KsgcIZD0Gbs/xOplJe1WuMy+hgnci3TMayDX5KBEKe/AK4FthmbsbXNJhDLz
	gzLjZ5w==
X-Gm-Gg: ASbGncs2ZVxJ4eba1bU+G7cs4Y9F+GHuEwc0lKH80dB5xD7NJE+EaT79I6t1z9ybJE2
	uZWgvs4X1s6UkCKqcKxLWftEQK6SYn8RZHJLYICjWjXRvkOEyWPQINJaXl2efefA/DPwUCKn5Wn
	ZwTh2YMyMFdyAUGamt/lIEs7odOFATacyGxxd9CvwIbTRG7hyLNQeR8hrHHsWY/fGr459dGozj6
	MmyXfY8GTpxqBC29Svj/9LUFHmMxAmZtm2bKNPPpSXrsKmH0U1xk+ZVpAvTjMyQ1oLjjPtgClDq
	RDpOO8d6QcAyF2j3Pr1BaWzwwFr91UkKvhqDfwOhD5DN/2uTqM8u2tHrsdvLW4Y2SkUSDe49aUp
	D2M/fIcxz7/9c89fG1jkzEDUwyW+22C/+puChlNP2
X-Google-Smtp-Source: AGHT+IHUtuaWnbV05+yk7Py7v2k5jGRZfe84Q/93O+JsfMt22EeVfaioiuyxXbeWEwb6N8nCYt1qjA==
X-Received: by 2002:a05:6a00:4fcf:b0:739:50c0:b3fe with SMTP id d2e1a72fcca58-7486cbb408emr296831b3a.8.1749572866012;
        Tue, 10 Jun 2025 09:27:46 -0700 (PDT)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com. [209.85.215.172])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0ea2c8sm7955020b3a.146.2025.06.10.09.27.39
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 09:27:39 -0700 (PDT)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b2c41acd479so3344409a12.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 09:27:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX/ihZBwrvgiJnaRDJ9oQFXvFhNPKvScqrPsJsgrPJOf/YH4kUX45GXpvWex8k4RI68ETrx/Udw2Ck6@vger.kernel.org
X-Received: by 2002:a17:90b:3949:b0:313:1a8c:c2d3 with SMTP id
 98e67ed59e1d1-313af21cf49mr214070a91.22.1749572858943; Tue, 10 Jun 2025
 09:27:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-gpu-v1-1-ac0a21e74b71@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpu-v1-1-ac0a21e74b71@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Jun 2025 09:27:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Unb1LdKV7iuPME1KJ35OBbP5OXD=_=A0ESQFCOzFBSXQ@mail.gmail.com>
X-Gm-Features: AX0GCFvetYujnkiaHWr_4-CoTJH6_0-yjm9ImscbNd_BInX3tRbNZVj0ki_sWAE
Message-ID: <CAD=FV=Unb1LdKV7iuPME1KJ35OBbP5OXD=_=A0ESQFCOzFBSXQ@mail.gmail.com>
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

On Tue, Jun 10, 2025 at 5:34=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones.
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Looks like this should be fine to go through drm-misc. I'll plan to
apply it next week unless I get overly distracted.

-Doug

