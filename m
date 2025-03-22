Return-Path: <linux-gpio+bounces-17878-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4F4A6CC35
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Mar 2025 21:29:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 03EE87A5CA0
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Mar 2025 20:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9750D233729;
	Sat, 22 Mar 2025 20:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HxFysXxh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4272191F7F
	for <linux-gpio@vger.kernel.org>; Sat, 22 Mar 2025 20:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742675348; cv=none; b=L2I1UFR1fcIkZ6nnm8jEd1ziFZSVIiPKIK3tKOLhMu3R47lvoEoyBqXU1H6j+VOalL3bdcGqonBSJP3OB0xk0hsUB/wAS+QE2V3LPxSCy2HvRlnWcepOX+P1B1/oZxY0JzzV9Tl2ohuRCILatYym6akSfbFD9/SoKWkYN0eEklo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742675348; c=relaxed/simple;
	bh=KHWFdlZ5NopWz5JtmK2NAcSudHEsFBasqGr4YPt9k0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FqovN4E8FRqdRN2C92okW2ty5FCd28qxGbvvoMampDQtv/Ffc3WbOssBFQmOPimgY+PHock1+IDqQ9oB3Q1PO/+zs7fHuRuJTkflGdBC7KzN8mGOuCPDAUOi/qCO4YXEFKiN/kzulNslYdlxKeCI9/xGbFMueD481ugQ+J4E/eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HxFysXxh; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5498d2a8b89so3559518e87.1
        for <linux-gpio@vger.kernel.org>; Sat, 22 Mar 2025 13:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742675345; x=1743280145; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHWFdlZ5NopWz5JtmK2NAcSudHEsFBasqGr4YPt9k0U=;
        b=HxFysXxh+q7EcMXLSjcJLWWrsZ42xa74FLZuJWHFwRTlIV0DAoxjnVc+HrqzMj6NrW
         7p4msISCfsPNOhSb3RJFfAc4WhRA+l42xf35e1+/AFwmRhNGlSMe4r/B78Fi/5pj8MmU
         y3/5IAh+B8bQ2Y+28ZbdUaBtg0Rg8gOl2Jfwerr7LIQ+w1fNJNlPGanh3oAcb3J1lR5r
         jupHqt7Qr0g+cuZAl9YMUmx3Cconb2qQZmKl1bkA7sx36xMudbdbDEzv8u57DMXmnkOy
         928/cA4foy1PK5l0hoTYJQbJMALHIm0ZSekYv1U/iz4euUCMxSaUK5EaSzHaP53lyRg8
         Zs8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742675345; x=1743280145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHWFdlZ5NopWz5JtmK2NAcSudHEsFBasqGr4YPt9k0U=;
        b=F670ZCcK5sren1j4tSqdlL0V3zQP71W511o2WMAe9K5cpA5owl2IviSGwP4snFKbNw
         deN+L8ojNYidvOpi4Z6I+zPZs5L5CNEV+jqUR5tNZiPm/yD48dtXNwTX7g7i/QdIi/2c
         klDAH11TKxObpliSjeFRYbZtj12Q0bDYAD2VGGBc0s79aI6vNfB3FZFTTiUW8wF+Xbu8
         V5kPUmGEFLE45KpXDukEQoPnpBHEWkyGmj6FJUxlFp5ykGWc00FeNINM6+dnh52ClZH9
         DhP042Qx1No74W/a6wgI4lXrauy0DMTHYWGsivuBQLocirSJfmX7dgQpay8RqMHqLIqN
         Uf9g==
X-Gm-Message-State: AOJu0YyWRcp7Hlq7H4nwvs19abSceBK6p/mvxq7iNEMueetBeo3b/pze
	9jvKF7zrv7m2O/nqVEV93MbMXC7AxI39HpCGwfAfvjBrMnO1Hu6r0naCWZ5D0TctVfghpZpm8xB
	bZYF/Bx8WZ6JkJ4eQJdGp4SGzLeocEBTb6D4KpQ==
X-Gm-Gg: ASbGncvyQDTscEMefw/A32bTiXTT/ltynZXkn8QySPn6XkXf0HrdgoaBHbeBtVzODTA
	AdfeSeTQ9jwO4cMe4ME5l4HO5HECkTaOC6G09zsOPHWCT5gMelQDPI3GJdeNGNoJ8Ji4inqv53z
	zVTM5NoIrg0q9IkT/ZaFnHmG4=
X-Google-Smtp-Source: AGHT+IF2q6jwtXEXdISMrTEJsZHuwMHpkZMrd/gSEhHtVx1XTuAURdVMpBsW+SbKy9wbfa02UJPs70fKEdTSL8nUrvc=
X-Received: by 2002:a05:6512:1190:b0:54a:c835:cc44 with SMTP id
 2adb3069b0e04-54ad65097dbmr2877513e87.46.1742675344711; Sat, 22 Mar 2025
 13:29:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250321-gpio-todo-updates-v1-0-7b38f07110ee@linaro.org> <20250321-gpio-todo-updates-v1-4-7b38f07110ee@linaro.org>
In-Reply-To: <20250321-gpio-todo-updates-v1-4-7b38f07110ee@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 22 Mar 2025 21:28:53 +0100
X-Gm-Features: AQ5f1Jo1LvJv_MJPBONuBG0dLKXQjmXaUgF9Pv6wuPi1WRfXl51LTlK5Z0RR9nQ
Message-ID: <CACRpkdaW2JRYH6UTRy04VZ4mtV4bD6LFeU+G3fX0j1vkShjc4g@mail.gmail.com>
Subject: Re: [PATCH 4/6] gpio: TODO: add delimiters between tasks for better readability
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 4:49=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> For better readability of the TODO, let's add some graphical delimiters
> between tasks.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

