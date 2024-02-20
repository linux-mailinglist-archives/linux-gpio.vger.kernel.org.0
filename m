Return-Path: <linux-gpio+bounces-3503-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBA385BAE8
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Feb 2024 12:48:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51E061C247C0
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Feb 2024 11:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EACBB67A14;
	Tue, 20 Feb 2024 11:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dos4Vqu9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D70664CE
	for <linux-gpio@vger.kernel.org>; Tue, 20 Feb 2024 11:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708429723; cv=none; b=LQFMtN6HrkzpcnLP6Ku1UkIKVc9ZFV9Hcy3JAKp16QToAthxRC/S3AwhrNSbm7LXrSPXvgYT5C0Yt0sGv/ARKBoBwx69LA3utlAo/x2La0v7wyr5fVH1iNZYA29uq1VudGEJA9ocuI60ck6yQXxpEqSROfrYTAwZQPI6Wc/+YnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708429723; c=relaxed/simple;
	bh=1paBppa9kXyF4t6jx2dx0KVwu75oULYWFXwh3w7uJhk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=agVRc5nBOmvd15vlAsw9bDD8GBbPqnTgHEJYtPvhFIfU1V/NvlfvYmqG/DxOmKxzkyqXsq4vx/UlqPGh5D5HuhlemAYSIKyIRhVfpDX4TXXnU/vM1Ao/V0LWkRlkX+ynoGMByATKv+kDL3XBeVPlKHfeLd2tBihWzqMl5AgicpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dos4Vqu9; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-4ce2cd0cee2so382215e0c.2
        for <linux-gpio@vger.kernel.org>; Tue, 20 Feb 2024 03:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708429720; x=1709034520; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1paBppa9kXyF4t6jx2dx0KVwu75oULYWFXwh3w7uJhk=;
        b=dos4Vqu9qn1f0VZfm4KPRbnXV0MZFq0GNdHNLRUhrd+n16n3FUa99zLSdVXrFTYPUJ
         nwIJxPXtoKQrbOG1EHw1KEpW644cYGjEMl+uUtONDhzsgu+CJf/XmP6pf4Hdw3Dq3lAK
         4S2bpy1W6Q9pwDFKcLfVehmBsOGwQg2kZQeMRpbGtqPu/vMsJn8M5NuTCqP0r0xNxDkr
         uCg0E7Ylb+lnb3me3oS3tyBaKN5oGLhtUZKfBOv0dJA0udAkg7XzR34DlvBY68L/QfGQ
         +371+/c4772e3tTNTIJe68YZlTnn8447RxavBjr/pXZenubkO7BQPkjPHHk4voFugvXb
         JunQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708429720; x=1709034520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1paBppa9kXyF4t6jx2dx0KVwu75oULYWFXwh3w7uJhk=;
        b=WvMwUqwr6jYVuoKdn0YiOgulr2JNtmVG11fdtNTIuswpUd3pjD+kB91hRfrYLwdT2l
         M5/y+zf0FS9VR2gr06vK6uE8lASVDiEgbGxrguQTm7gAl02HSPYphxqyEK++WppOwnkr
         Zyvd/vJlfhwiRL3AhDbNhR7e5tvnKEdC7+cJFebkaVqHMQJqExCuqL58XLBNwgN4V6M2
         0159RVIisZ7T4npbw1hNHnNEGi56KLFrpkaSbFeb7+om6kapBt2y8ikuegfDal6QV3jY
         KH1gdZm45ybxVEepX2Z4lXhM3d1XdZrhZWMHHuSmcDkN2guDqyrwXqDp6cUzI3XLSWBH
         pYng==
X-Forwarded-Encrypted: i=1; AJvYcCWhA8b3vKmVz+9jTtmwEUrg0Vw7/vCoUfL0mzpyJpc303fvP8RTEy4OjZC07J1XLVWfC5pbHaDNuKs5rYHt0n6S7GPJjRoCYWj5SQ==
X-Gm-Message-State: AOJu0YxcRkYDeoRKbdfbcHa6z95E/7Ai2rNWPgLaYxnHckyWkRa2yQeW
	+EGihoCC3Z0uPJsCEa7903gYiqeUrSwpSzhIjC08/vvauXoHe63qHaXrjj33QMwpAzSxPvdtYWD
	nL4mCsn1rdiFWQcwxJl6IluNhrpikWNMtCTEZ2Q==
X-Google-Smtp-Source: AGHT+IGSt+7LYikhDFYx0cLtpCAuzEqPHpTuVYE+MOnTWdXCL9GlyvAMZDlwfESCgNKoolfZRtNBCXYNBKzP3Qf2Hvs=
X-Received: by 2002:a1f:c743:0:b0:4cd:510f:4137 with SMTP id
 x64-20020a1fc743000000b004cd510f4137mr3182381vkf.16.1708429720382; Tue, 20
 Feb 2024 03:48:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240220045230.2852640-1-swboyd@chromium.org>
In-Reply-To: <20240220045230.2852640-1-swboyd@chromium.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 20 Feb 2024 12:48:29 +0100
Message-ID: <CAMRc=MfqOxOO3DXhvQ4W2THGc0vzkTTGWeoyDrzG6JWZB3Ao7w@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: Add ChromeOS EC GPIO driver
To: Stephen Boyd <swboyd@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Douglas Anderson <dianders@chromium.org>, 
	Pin-yen Lin <treapking@chromium.org>, linux-gpio@vger.kernel.org, 
	Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2024 at 5:52=E2=80=AFAM Stephen Boyd <swboyd@chromium.org> =
wrote:
>
> The ChromeOS embedded controller (EC) supports setting the state of
> GPIOs when the system is unlocked, and getting the state of GPIOs in all
> cases. The GPIOs are on the EC itself, so the EC acts similar to a GPIO
> expander. Add a driver to get and set the GPIOs on the EC through the
> host command interface.
>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: <linux-gpio@vger.kernel.org>
> Cc: <chrome-platform@lists.linux.dev>
> Cc: Pin-yen Lin <treapking@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>

Applied, thanks!

Bart

