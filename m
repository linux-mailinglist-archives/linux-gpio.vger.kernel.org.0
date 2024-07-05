Return-Path: <linux-gpio+bounces-8063-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6963192842C
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jul 2024 10:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9ECEEB2156C
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jul 2024 08:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 716F1145FE0;
	Fri,  5 Jul 2024 08:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vg7Gnau4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4E7144D28
	for <linux-gpio@vger.kernel.org>; Fri,  5 Jul 2024 08:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720169560; cv=none; b=KqlD+KNeUxM/Ajw0aOSUVijY+fSFWUCgrnOYSkaXQ3e67S2acN1JHxTz/6Z2nbpJxh1+ke9s1b759K4FshsE9HC5+yPaDWikmtWmAqGvtl8+4iC1RixNn6Oa/qlNDYLDWGqB6t4Ol94vcJXCO3Ldcpm5QEkhyBj7bMB2IbZBXlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720169560; c=relaxed/simple;
	bh=nN7bsChoKD+VcXCEBRcLG7JH8o73GTocHnqeU92nWaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PALhGkMV66i5H1ulyhMeXj4s6mFD6niRU2xqjMO/XovNy0Y4P690WNMetTBMTRFUrThWVvEQlJ91V3p8+cULhac3W+LwuwNIn7boKBR45dVtPXZ0r4YhDDYufI9T6X58qVAOlCrefut3faSGJjFemJHaMNHxF+UTVkWUuIsNSXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vg7Gnau4; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2eaae2a6dc1so19857041fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 05 Jul 2024 01:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720169557; x=1720774357; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tm8BTCx8h7cfKJSdK68vXadL7NHJYI5R7P++Unzvos4=;
        b=vg7Gnau4B7aeRV4B91DU+9LD65EBJ+OgP94cwEFPb8thm0VGtqMEEUi+zSWhI5pS9F
         GGg4GNP1MOJ4DDT1k3eT3nE548SAKWBqXTn7HVP4jIAdG+B9QJj6c4h9qjeI/jw4t3aj
         6gmXdVyB+LTZd7A20tvo3QuHUcWjY935HllqKVgHxdplvugTUwyMMOEvBzMYp69JvdQE
         KTTsUJfmcOoTb3W27gfZsRqc4I4IbyN0EcbTuXzHHxjemk2ZkO2tMQfN7O1RIi4h2qXo
         XDRgvrZDKWgcIudZDGLUraeAB9JcRDD872J2NW8YaVsPpj8bR1cbEk359fmZ3zIdY+L+
         QZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720169557; x=1720774357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tm8BTCx8h7cfKJSdK68vXadL7NHJYI5R7P++Unzvos4=;
        b=C3V+f4LAnzog5RT4C69fmu33UNa2Gggtc1IC4FSxQ9DrpIebKEuUVaLWY/zKR1Epxl
         zG+tGmeY0Gls+Wq1fSMyMbGRJRJd6GAuyimIcsbTGnj3MFItplX2CcrVIgtGubIYkKgI
         MPX4zqeef0JolNNrYhc52xLlPTKS11GtFcT4mJpZgqOR8J/LLS47MeM18H0W80hjtfxZ
         SwhIG+t0X5kQhi+cb22FSwxgxRaWBzqy0fpbYJn4qMD9QBcFXj51DcKsoKm6AOlx7/rS
         GMIKlDSSoxCxyQLdAWweZTC/gcVoSPfe7OIZQ+bJtenGCUFmxlILI9jjy9SZ9xh0AvQF
         t+rw==
X-Forwarded-Encrypted: i=1; AJvYcCVwPaCyNS7xzQbfbrccnGe8520GFBnU/x71Fax8wMQWVA22MkpQDRuxx0YI03zmikja8uUfv1d3YHvX3UxOVhM93wpSG/I1Bio+wQ==
X-Gm-Message-State: AOJu0YwZbGhauHRU47pkMUUsCLXtj0uEJKZ6duW11bZSQkAKSujH3SW/
	V+XdsDP67OjT+mg8O1JW9+GmujuniFGKfQCdOcRN8NITygmUF0sK00fHEqp5No9q02gYDQTzwXt
	153Oc+gSjPG7dAIgrrBsMkyW6PfITH2E4tgtV0g==
X-Google-Smtp-Source: AGHT+IEyStM8bjx9bavuGPC5GSUaOWfxD2PnzW5v4/QvDQ8yynppqbpSFxWdpusnNU1frPjGzXjLFnAHphiwhd3Laxk=
X-Received: by 2002:a2e:9515:0:b0:2ec:5843:2fb8 with SMTP id
 38308e7fff4ca-2ee8ee0e795mr32501771fa.42.1720169556609; Fri, 05 Jul 2024
 01:52:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZoWXwYtwgJIxi-hD@google.com>
In-Reply-To: <ZoWXwYtwgJIxi-hD@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 5 Jul 2024 10:52:25 +0200
Message-ID: <CACRpkdY2S+G+u88P3x8emeq3-hEiRP89VbwM2TyRBd956Ro9BQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: of: add polarity quirk for TSC2005
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Sebastian Reichel <sre@kernel.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Pavel Machek <pavel@ucw.cz>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 3, 2024 at 8:26=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:


> DTS for Nokia N900 incorrectly specifies "active high" polarity for
> the reset line, while the chip documentation actually specifies it as
> "active low".  In the past the driver fudged gpiod API and inverted
> the logic internally, but it was changed in d0d89493bff8.
>
> Fixes: d0d89493bff8 ("Input: tsc2004/5 - switch to using generic device p=
roperties")
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

> OTOH if this was indeed broken, then it was broken for ~7 years
> (d0d89493bff8 went in 4.11-rc1), so maybe the best way is not to worry
> about compatibility with old DTS, update
> arch/arm/boot/dts/ti/omap/omap3-n900.dts in the tree and call it a day.

I think anybody using the n900 wll be updating DTS and kernel in tandem
so yeah. But I think it's nice that we do both since you anyway made
the patch, it doesn't hurt.

Yours,
Linus Walleij

