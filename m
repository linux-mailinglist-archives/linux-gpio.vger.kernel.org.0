Return-Path: <linux-gpio+bounces-22774-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25013AF835B
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 00:25:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE48C7B0503
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 22:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9494B299922;
	Thu,  3 Jul 2025 22:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TOaOCuq0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A323D29C339
	for <linux-gpio@vger.kernel.org>; Thu,  3 Jul 2025 22:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751581533; cv=none; b=RVVxCkWjaFZVppH6f3+l1aTmRM45RhTdC7ze0LQlF+eu2+zZE6IP07NpDoYN7lNp7GPpAHb74CtFXKc2rWZjQNXOUxd2/4SyZKjWpWzBWi9nBt6sP81JUKSgqJ0tBlZ9t8jIHp6j4XwhBzf/07pz+kBZ9qNt47El+dRJLTNjOvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751581533; c=relaxed/simple;
	bh=3dg026OXBaz64140theCbznjUd94Zseq4+vDYcRqHaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=td5uYrBBXAoXjgZQdBR4oFwBsAlJnCk7pelW+NDwUOYyiHrHpIJqgQjXLB66kf04EJHoCMSZgx7VgovGMSaoi1TmRgNtG5XF77J9HGG6aeC47tgEsrVimMGP6sYc7kRlc8r5qu+3Lsy+posfmFuBwrvhYb/S4A0QJsLhU2lPsOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TOaOCuq0; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553b60de463so394167e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 03 Jul 2025 15:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751581530; x=1752186330; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dg026OXBaz64140theCbznjUd94Zseq4+vDYcRqHaI=;
        b=TOaOCuq0jm/AzOpwnuIZRpo+9hAcl0evtq3gVTkkltEArV17ndKcoCInwXbEq/n62p
         yif3tu5efNQ4bQ4hc1hkJ8z9SWHR2AQOausCwz+6kEx0CuRcfKhprMaFKFrwOnZwujr3
         CYid/AmMS6+DM0iHIRSbD9knuCVV8xSu4Vj+SxQgZGbrdc6rl7QU8pmymyEWiTAh6gjD
         vZnmbCRJQFGW1cpCfQFwmpqhd0nRv5ml3RsASl9/wTFWe1yl9HqRBxIZrKMjFpiONSms
         o9dgRM7sNpSclUbJc+gMNUxPnu/kO0BUGAUfPwDvAgAVb6rvBTJW2The8NK9iso67lGf
         qr7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751581530; x=1752186330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3dg026OXBaz64140theCbznjUd94Zseq4+vDYcRqHaI=;
        b=tm1Vl9nIx83kSTmvnPg1xqdDXtA7epzHK9C9kKBl9Ktd01Do0kts9lbPvq5cU9alTX
         tz6HNQSVxGdbDwSj+9likszUmBYZP+CHDaJd57OdzAeLRmQAc1B34OS8s/u4MqSGSXFl
         9hKO1+c4P1vdPzskyQQQWM87Q74i9O4WaKgPV3/ZwK+pEOIo2h9F/u4fkWOpZQN6jubh
         heStnEtfMpW6quw0dsBp2xJ3xNk3KopqMrcdLVlSzvlMUWFPcNdnlXXO4JHPtKPVRkwA
         xJXuLGHAwVCikhm5KwKqiQ2UnXgsq9cUHLYN2W0cGvlM9Dj85Ad1e8v/GgtGR0Umr20+
         +kTg==
X-Forwarded-Encrypted: i=1; AJvYcCXjA+1bXjHIvtYAnafGpo1sCijGtJeAsJkCOWwcP26yuHUFyCZyK2zYgdPbn5CN9nnzCZblbqcs5EoI@vger.kernel.org
X-Gm-Message-State: AOJu0YwL+IIlmlLAyEGZvR8Gpv2tMB7uwdniSJtN75yPpphlXXC54rtf
	DxCpfG236Ej/stdU7gLIt88xI9bgIxC+xRuIyBJXHgRhermHAEzL6xsyG4k+fQwdS+JGE9LOdgI
	Pc5V82Ao5zhZR3M/xSDbq4kpGicCrJ9XpcZkFvV4IDg==
X-Gm-Gg: ASbGncvVDq3M7dvYHY/KbYwiierHobqXTznvsRDv3sGr1Nh/jPwRp5NQyuSo2WvmqF9
	kFMqHWpu5wD2ivWHnvd1h8N74It7nK53ZPRDM8PEmYMsKT+4fF6WHfez89gsFgPicZajy1z1wVF
	HOf9N/y2sbyIloYntSdXbr1u+ZzmmxBlG8jZ4C+0J+Jns=
X-Google-Smtp-Source: AGHT+IG2yDJU6EevZh+2WpNjwvjSICFO2im7gFoIKYYP1RQqqZXmXe6QILiOr8TwkjXNbLstDw/HOzWjKS48MDrn82o=
X-Received: by 2002:a05:6512:e88:b0:54f:c10b:7290 with SMTP id
 2adb3069b0e04-556e894f6d9mr33053e87.26.1751581529637; Thu, 03 Jul 2025
 15:25:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627150155.3311574-1-superm1@kernel.org>
In-Reply-To: <20250627150155.3311574-1-superm1@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 00:25:18 +0200
X-Gm-Features: Ac12FXxyV30kVk6PEnJwaW8Bwo4CcdHTz6_JsxQKyWK5nrCD6JQRwqrJnjCbXcM
Message-ID: <CACRpkdbFRNbua+u2pbPyrnLMHV2EtBLdbXcFO43aO1=zJ6x5LQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: amd: Clear GPIO debounce for suspend
To: Mario Limonciello <superm1@kernel.org>
Cc: mario.limonciello@amd.com, Basavaraj.Natikar@amd.com, 
	Shyam-sundar.S-k@amd.com, dmitry.torokhov@gmail.com, hansg@kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 5:02=E2=80=AFPM Mario Limonciello <superm1@kernel.o=
rg> wrote:

> From: Mario Limonciello <mario.limonciello@amd.com>
>
> soc-button-array hardcodes a debounce value by means of gpio_keys
> which uses pinctrl-amd as a backend to program debounce for a GPIO.
>
> This hardcoded value doesn't match what the firmware intended to be
> programmed in _AEI. The hardcoded debounce leads to problems waking
> from suspend. There isn't appetite to conditionalize the behavior in
> soc-button-array or gpio-keys so clear it when the system suspends to
> avoid problems with being able to resume.
>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Hans de Goede <hansg@kernel.org>
> Fixes: 5c4fa2a6da7fb ("Input: soc_button_array - debounce the buttons")
> Link: https://lore.kernel.org/linux-input/mkgtrb5gt7miyg6kvqdlbu4nj3elym6=
ijudobpdi26gp4xxay5@rsa6ytrjvj2q/
> Link: https://lore.kernel.org/linux-input/20250625215813.3477840-1-superm=
1@kernel.org/
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Patch applied for fixes!

Yours,
Linus Walleij

