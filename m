Return-Path: <linux-gpio+bounces-20059-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E678AB55EC
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 15:24:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8E131B4335B
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 13:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFC4628ECFA;
	Tue, 13 May 2025 13:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DbwhB7RF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EDF28DB7B
	for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 13:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747142650; cv=none; b=QLYx5b+5+sPaevp1rGd6e6EJ45kqYgZkJjSEWkxaCzIJBwCNhq3dx+a0D5S+TQzut5/7Ft14I0LjJl8llv5ygN22c2UzcidPZ3rqdcrSW00meshW1wTZsaR7GOyykGgodVpQHpj4zNyY11qbyyDHVDoiSeKccvZOjWOMn05DVVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747142650; c=relaxed/simple;
	bh=5eKxaIX3fw3jx/+XOFOXndB/4SjWjO6DJ61Rmj65mQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t1FsRd7Fvn8C5Avi6mUCe9RQMePaoj60JxWvoqdhWu5Osk1phCuCcnagV4fyc6R1fUoAw/MKQifidX4wxRLQkHCVL1vLo1U03ybz1lfl3VHK51Uq28i8ZHNPod5vVlFLRDo6zbKt1FzTA5E9cHwn6O3klVX0X0g5FFiXIe8sCpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DbwhB7RF; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54b10956398so5144136e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 06:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747142647; x=1747747447; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5eKxaIX3fw3jx/+XOFOXndB/4SjWjO6DJ61Rmj65mQw=;
        b=DbwhB7RF1JQqu3Vx8YErtq3rTPzu9DrvuTZHBpumUlQ9Fqckpe1d5klxFnDVlvW9a0
         mbStNuiJFw6GfBvu77Ue2MiUVYjGnhfDkvYoBPIMkNngWUkdhBZXjME64mxikNmE9Obl
         Bx6okDN+VXaiokTpeMVKPodEUSYw7zYVqSwGTEaDg0KBuIMuEVTI8rbJ6jNHXfC0JJNX
         dBwe8fYiS2PsBI2LA87kD88l/WduHaiVSySc6bJYyqGQwtAF0gt4vSo2bG7RupqrIt0i
         P4v1bE3w+K2sqOjV/XJOYUMhzq9cJZChC3eoTF8Ug7CPfW77rOzm6g3EUgOlE3oJw2G8
         PoGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747142647; x=1747747447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5eKxaIX3fw3jx/+XOFOXndB/4SjWjO6DJ61Rmj65mQw=;
        b=IFntFlU6Ae7iw1I3cyYxkMvrO2tYfJrwy1+8l1S7FsRinKeGX2HY4kRg0dCsyIDh1E
         3UyY8pwKI+Adq9qhb9yCIjw+HrE7uQaDvon9TCIT4ASKGjXz6Gpv0hoCYMavmnn7kgWq
         zCkileaNvEgVwrP7VFQ86/TNQqOmZquB/DSzPu8QbcwGt9K6Dg3oqjd1SuFWkok0vNZr
         cW0+PATqr2dpxA5ncgMRxU7NfpqYtz1bqfgbSrfQRnUv1aND+lbNHIGX+lZc1J0fFh2c
         w//+yXjGRywbe4XTmKZpsXYuJ/vpiiyBfMuwMT+3sgGn+elRJy+E8vF1O1OVCOlbTlIC
         iIeg==
X-Forwarded-Encrypted: i=1; AJvYcCXDC6pnz1rSfps4aTbSeAEKbF/tVUd/2Gt90LEKHYyY5C9nbwvvutn5NlckwSWTkgvoahNzrI3aFW2W@vger.kernel.org
X-Gm-Message-State: AOJu0YyS2B302NjmRNFZHaLwSp6JndErx/4MYbCQsUrwXwWVZo23U/ay
	FBC1wd8FsdTGKFfInFod/rBDn6/zjIGmDg3y5L4xeVaba1JYFRSg1SPYxpvySShfjMeOWd4D1L4
	2VNgQQLK320J8d1SHV1s1XFyX+hJQhsQ/M1vXQQ==
X-Gm-Gg: ASbGncvj1etURW1YNZnyw4wWkLD4He4t7WY/aZ5GPpsIhYVA4/2dhTXhfYyNJFTc/E3
	2CCjXkDadiL01ADl7zL2s2DdH/1n+blYgHuB84A0Mw7TCge1Qt/+A27PHS2oauO6B/Alz+KSRHy
	Zp13KgllgdenrPwxUb5+fr5CqATtb2k9pa
X-Google-Smtp-Source: AGHT+IFQKowijPtKxWmuvEciX1nJf+TDzv0WZoqM/uKvRSmSrIT4h7hRJwXNUJZcQ/uYhV04L0dGE2029I5lSw65p/4=
X-Received: by 2002:a05:6512:2586:b0:54a:cc10:1050 with SMTP id
 2adb3069b0e04-550d0bc78b3mr1158871e87.15.1747142647002; Tue, 13 May 2025
 06:24:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509-max77759-mfd-v10-0-962ac15ee3ef@linaro.org> <20250509-max77759-mfd-v10-2-962ac15ee3ef@linaro.org>
In-Reply-To: <20250509-max77759-mfd-v10-2-962ac15ee3ef@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 15:23:55 +0200
X-Gm-Features: AX0GCFvUasElVjJYv3I7eVQPe0A6FsXnY_zILsVN3taTVIhvI167ZdVbaeRULuk
Message-ID: <CACRpkdZg0ZLcmGbFPqUmRpkw8DJYe5bY8yEDe5+KrnzTWxeXFQ@mail.gmail.com>
Subject: Re: [PATCH v10 2/3] gpio: max77759: add Maxim MAX77759 gpio driver
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-hardening@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 3:22=E2=80=AFPM Andr=C3=A9 Draszik <andre.draszik@li=
naro.org> wrote:

> The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
> includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
> Port Controller (TCPC), NVMEM, and a GPIO expander.
>
> This driver supports the GPIO functions using the platform device
> registered by the core MFD driver.
>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

