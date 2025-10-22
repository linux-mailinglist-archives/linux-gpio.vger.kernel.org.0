Return-Path: <linux-gpio+bounces-27419-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C70BFAA69
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 09:44:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7044850556F
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 07:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BAE02FBE0E;
	Wed, 22 Oct 2025 07:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jyNITR6I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EF22FB973
	for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 07:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761118982; cv=none; b=X1N1nZTj829f+g9YOIC313KHrfK5PkKEaEi7WVL5uSE9BBS3peVysh1FvB1zayTmHx4GYI6olpGKYbXtZjsJOrEuFBr1VzLLSUAG/eVTkneDgQW0OmrI132LID/e/UNaa/SxPeI+14zBkkwBHuv++9BvL6YO3dkyvX0iBh0Ljig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761118982; c=relaxed/simple;
	bh=8srG042WcIwfpUeZ+HvXXN7keM9XIjBlEUNmAlUKTog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W1eyvxrVX5w9gECfQHmEJnTC6vrarxPu7e4ZESyF7/nPHxLVjrc667HNKNuhFDcM/ZG9URjmnmxVSVXPqPT8vMdUXqL2+dj/2hDmAO+K9zvq8X1CKqJZdupJw0/hGPEOaS+K6soO2ZcAroKHyghBzi7W0Tx1Ju4a79TP27ZViLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jyNITR6I; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-36639c30bb7so59382971fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 00:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761118978; x=1761723778; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3TNLAjhkgqHZPN7SHKf/AirJr2ThqMNuItE7JWwCB04=;
        b=jyNITR6IoN/oGFbwQIDE4I9PAX6Q2bIUpqgrGEqgxZ5n0b4x+ViuKJErmcZnXiUmVn
         qURxHNiMHydDJtPeduU6PBdNCpJRzLVTE+FUO5iG1IHA/waCoZQvHmztpqLWDKGRjCxv
         hpFzOezYlQCWrkLnHURNtGAFFYlpSQE/q1ZsdGCSTm5jMzTq92Qh3RM6tcBwepdff65N
         TFE6DjzpaVpr6PN1jAIdCppadu1rz6//gm0FOQT450i2sgrKT2ot95UcEzEcCfTvZ7Dt
         HRPN3yBWZavKJglIfwn5NT57Km8freFxbVc9bFp5xlncwDC763W5soCtAN/c0FSCCFFX
         gT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761118978; x=1761723778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3TNLAjhkgqHZPN7SHKf/AirJr2ThqMNuItE7JWwCB04=;
        b=UK6QDGQFSP6kRQSsX6rBKYDUo34rEh0YdVilxs8C14LKBOQWImNoTwGMURhz86SkK/
         dDzG2G7XtVgUVWuLkEb5jAUoVFdRxi2vwfm3X4ZxCikjk+KkI9HhdWikt8vL5O6XK4XG
         k58uJ9cCJ3i67Wbl9xgAulx7VaVLNi739VAD7R640jpE7HAoaX6lNV60hv/LOM/xLmHb
         rOnvzllARU92GYxO4/ZsVRWcxF6sUNapMcq9cktP9g1AVFzZHMb1S5p6+ntn6ZsgWbVJ
         NWxIshdZbpvEJN3gtOLQ6qvGw9QYnpkJc3hzsesGUTmZnOOLr0af7j7GrmaTp35tnmmL
         4Pug==
X-Forwarded-Encrypted: i=1; AJvYcCX1za2EJVaP4FcRBwfdNCk3htB18u9sz28kn/wn9ybpalIe+QV5wTaZSooQjVIg6ydrIgFEWg7iSKrv@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq/bNHnyqWXNK4tluiraVkfQrf2IqtS3+lOi+szI/+awmqsN8J
	3heVcB8Z7HI0eFAW2KEonkxEezZSy/787lCGR0z/o96BtJ8sOnVppvY0sQZcxawkBgfP3/up1ys
	8JPYC/JEJXfG5a865t+HdDrNsERedGzqF0uRXKsrhXg==
X-Gm-Gg: ASbGncvGHFtCnqtYiKJVwYass+miQfWxiG2XNu0XFUda6yeYssSaiBCFxutm5+p+elL
	VsdpnHtLbwZqRXJ8TQ3tJgVDF+vn4PY+a/m1rkDB1MYyqYjHJWjk3MZXp6Pxi4ubwklb8h9aXlI
	NZdsUPYf0wyIHMN0tNMpKnUwLOgvvLYfISMZMPUodSOsMWQDmtIGgYeCq0ar2urV03DQrwZ6D6W
	lHvZ4qiM3I8giP+37vgTbxC8rIWnNJV5RWfjGBtJODrKWdOrrGWs5gbPQkJ86vCGFVqDeY=
X-Google-Smtp-Source: AGHT+IF3wmaO/RAI6AHRa1eUfLujsXfSoyOJjO3vVqO2wvb1ZTN3XsaW5H5jnTeROH/SrLDcnMyHtIhVSJKUnCmfyCM=
X-Received: by 2002:a2e:be25:0:b0:375:d1e4:21d4 with SMTP id
 38308e7fff4ca-37797a9f7cemr64226911fa.44.1761118978065; Wed, 22 Oct 2025
 00:42:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251021142407.307753-1-sander@svanheule.net> <20251021142407.307753-7-sander@svanheule.net>
In-Reply-To: <20251021142407.307753-7-sander@svanheule.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 22 Oct 2025 09:42:46 +0200
X-Gm-Features: AS18NWC4q1xLV5cdKOkaQ3Uw-5JkGYLVSUeBiCU5sYUK8C3AufUKZRqVPVNjL6s
Message-ID: <CACRpkdYde+=85f6Zfz40bMwOxSE-bszHzvBhQwC+G-E2CZr3Lg@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] pinctrl: Add RTL8231 pin control and GPIO support
To: Sander Vanheule <sander@svanheule.net>
Cc: Michael Walle <mwalle@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sander,

thanks for your patch!

Overall this driver looks very good and well designed, using the
right abstractions and everything.

The build bots are complaining but I think you will have fixed that
in no time.

Just one minor comment:

On Tue, Oct 21, 2025 at 4:24=E2=80=AFPM Sander Vanheule <sander@svanheule.n=
et> wrote:

> This driver implements the GPIO and pin muxing features provided by the
> RTL8231. The device should be instantiated as an MFD child, where the
> parent device has already configured the regmap used for register
> access.

This is Realtek, right?

>  drivers/pinctrl/pinctrl-rtl8231.c | 538 ++++++++++++++++++++++++++++++

Should we put the driver in
drivers/pinctrl/realtek/*?

Yours,
Linus Walleij

