Return-Path: <linux-gpio+bounces-5405-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9488A296A
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 10:35:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76D3D1C218B6
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 08:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDFD93218B;
	Fri, 12 Apr 2024 08:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l3XjiX9/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC0E205E22
	for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 08:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712910951; cv=none; b=YV/lx1+v4p4xQdg6a/q0EjJUn9Xp1sJFAGjFGGeP7H6YphqnXZUykAMxVvtqVOm5jOc82r/aOFdIlg4ioyNl8ziV/YPKixcfuoH1EgRF2V/waMyOx1bInvyMrJEWXEXMeWA1gt2yHcEFVc8apWMjyL81396P44tEKN2Wq+qCrDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712910951; c=relaxed/simple;
	bh=NXQ75a3FjwYxIteev28RRS+HqX7YmAFu1v3daT9bg2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=De0uPrEUPPhekZitKqXI0Cz72uiyyrnsmXCXQyEj83troh8ejdsjPHyaUrBqSo2suQcTJOzQC4w1tsJd9cKOglqX6GEn4rXbgzcAd93xwtUIhnJHwMhMD3gm9NFV8YrVZ9OLRG4txaMRNcLGJIbgXqa05uCn2jGd+1rS5h8pdOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l3XjiX9/; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dcc6fc978ddso520819276.0
        for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 01:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712910949; x=1713515749; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NXQ75a3FjwYxIteev28RRS+HqX7YmAFu1v3daT9bg2w=;
        b=l3XjiX9/TaO9E4fxMD7ZXlofpjM6zFi3WbHpp1dtZGu0DM1j13YQaolnK8Xq9rMuyW
         vfwCyrIDEdvjQBifVmF6lQgQEItp/xeg2B0JjyUBfRJAdQclM1drxMwqt3Rn+ufiDGPH
         ESmflo+aTfTMiP5w8V4oEiWyYzLDd1Hu94O6BzlPbVtTCkrgpiLD9/nRQvOTHCf6O8H4
         otqPsNMzXljPqEisDAbgiw4PwfIBDr2iK4SE+3BPN7aHEQPPZWQmIh0RV7RCc85/CnwH
         HTGrW6iTG/aIDpfZQ/RMCmXEFZJ0dtJ4v5qvVFv5YREiR13e+uvGuUDk2oFp0wmSd4lG
         lWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712910949; x=1713515749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NXQ75a3FjwYxIteev28RRS+HqX7YmAFu1v3daT9bg2w=;
        b=P9Jj9EgAUFWM8JgA8YPJ4oX8rZKsCPOzJDbuOqYBAY9uwjECb3NRbhMFOI/9q5y9KA
         CF05e/4TRx+vBjJ/BRCfDeu5Nx+r7rc/bWfqXktF/QTxAyKtIwlx6l/VCJZOJvctA0Ou
         UrUTFWA12LhGn6qI/QG++EBfL5gAJtgH9on/0uhpiPvWsU4GIp5QFt2FP6ydXlLz71uS
         wGiGZ6GsOvw1OQ8LJlENGersZpGNOoEKnO6M+J8qidmvkguF80rlBx4QMCTqrb3b8ImS
         NTaHgxMyEy4mpxXVXZPA3x4BD7y3Fy9k0e59ezEfAsbNbpll/jNTPaGj6DwgNE5FFeEJ
         EdJA==
X-Gm-Message-State: AOJu0YwldEEiw7NbQaHh/cLym1q/r5egF0z/1Ru14S0uGdrsbk8dHBXc
	qztmT52vgiWCV5om4BJil/I09RfKfL4PXbOkXKlC7G/qGcOs5cZpoEFueNBgifS9wuWTg/nsGNH
	YWn+8rey+AkbglH2Y83x0pFyAl7Vem4BAHz6KlQ==
X-Google-Smtp-Source: AGHT+IEQMDPCClORhHrFh1S7GZ4UFVkhjRVOKCR8Ltk1OQIkxte25m2JtIrAmfkvoiUWEk25cgZKOj2DzKEx6IfW534=
X-Received: by 2002:a25:5557:0:b0:dc6:d1d7:c762 with SMTP id
 j84-20020a255557000000b00dc6d1d7c762mr3907022ybb.11.1712910949423; Fri, 12
 Apr 2024 01:35:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240410072102.1200869-1-andy.shevchenko@gmail.com>
In-Reply-To: <20240410072102.1200869-1-andy.shevchenko@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 Apr 2024 10:35:38 +0200
Message-ID: <CACRpkdbOhxp1z15LE2FS36+zzhoxrqBMELt8PppnK0NXRyeqFA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: sch: Switch to memory mapped IO accessors
To: Andy Shevchenko <andy.shevchenko@gmail.com>, William Breathitt Gray <wbg@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2024 at 9:21=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> Convert driver to use memory mapped IO accessors.
>
> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>

If this is the direction we want to go with port-mapped I/O then
I'm in.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

An ACK from William may be in order, he's usually keeping track
of the port-mapped stuff.

Yours,
Linus Walleij

