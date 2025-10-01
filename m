Return-Path: <linux-gpio+bounces-26698-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EEBBAF450
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Oct 2025 08:40:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 244364E1EFE
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Oct 2025 06:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7296926F2B2;
	Wed,  1 Oct 2025 06:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ndZnO9j8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EA326C3BE
	for <linux-gpio@vger.kernel.org>; Wed,  1 Oct 2025 06:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759300801; cv=none; b=kwiWZN6NbRkZTt0CIcFF55q/O306+E7a0j7sOy+4W/dBndZ4biEykpkgaJ2kSte2RHVn+kGl3MYkahO0PJMBLPK/S/xGXTbBfZhUxdLFzDclveNVyBoM76zshJMF2Hy2X+X4BCpzrwO2l54UNGseimiXEsgbIh4Khi8agteJpzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759300801; c=relaxed/simple;
	bh=cx98nY2Wuh/R0QLxHx+rOBNr28Ke1Ond79H5ttIERso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e37VK/Fh3B1zZBf58gQiPEBiiBk+wK0KCJJXGKuQE/OSNJgFUevRoHttDqS/2NDttzBiiLVQG5NybbsBME9mzBXqNQlIhrXUiINqrsS+Pt0LQ7ojPi7dAwEkHbr9IYpgJS2JeKOt+Fp/r0ZA7k9VW62rqbQ22IDrUBHq1xhInYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ndZnO9j8; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-57bd7f0e5baso6519534e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 30 Sep 2025 23:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759300797; x=1759905597; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cx98nY2Wuh/R0QLxHx+rOBNr28Ke1Ond79H5ttIERso=;
        b=ndZnO9j89mcpnNLnCDVECygfw80JVYud/u3pVZ+yJn+UodCeVK8fQqjsq27lXqbdPa
         kUbuGkj/cPrT4e3M9gqYqHe0ub1YfltLoSqse0/HDvKs87dkOuUqBNmTxgsQE8Rcezal
         MLvoik6em8Ds6v5YxFc0ZMOE3RSUXD68NhlEHkEuFHhQK90EgfddWJWYJcWRvSNePKKU
         Sz8ZJ2W+JxYNqhRtsBvawp3T4ydnaCbwOeFxDxBl1SM8S0NPyUHs3OeivTZt64YyRA9K
         ortxV8as7MQCy32Gt7KbDocWm/SKeZQ1TbL5kliFLnCLS6d6MYW5z6ek+DJLro5Ipqby
         BH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759300797; x=1759905597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cx98nY2Wuh/R0QLxHx+rOBNr28Ke1Ond79H5ttIERso=;
        b=Xk8Goa9Kc/eKkKfD4rP3lyjTCF+WRoeiu8VgiQQSDxZIXn7psqwRiA7CWYMxKXzcTF
         Y+4JZjfjuMUKngyi1FreT2WlY76jQ4cz848kNR9471x/KLrZLeLy8bDgk7PsYioB63VH
         Wrv9k5c03C/NQZaGyiA54jKrwFmUcWaaJD+tB/hEmUgj1Cb8CNSOg9Mz+tV5dSPlD/fZ
         cg2HKWP8B76aET2KsjD0klnde6EfuZtp2smeHHU7Not0eZB5z9U5s5AqcpO4R06CSPyp
         nrvD+QacssoPo0pr8VOb1NrVjmZqeq+IZFcrrM7YOTRqqwZv9/WA0bWHOkhApHuUIVpU
         x/MQ==
X-Gm-Message-State: AOJu0Yyl30Sa+4EDb+0WOHgzxU7X/Mu+hj89G5DjO9QOoAMEKsiL9SI/
	C7q1XdICsQcj4wGu8ekQcJ1jL3PSmcQIpLA8aBAlmWk3IsmNAav1UufCg5Klq5K3+HvZuZgWDXI
	CmVipDdPUTvIeggkYrdeyMSsrrqYLiBSKZEyUmhqa/mfzvT5Q+eCX0H0=
X-Gm-Gg: ASbGncuuEj3ikUgU+P69ScvwBtgJL8GLeTOLu9Znsye6H4Uc2UgoudlKNtayK80ED0F
	uZ7s5g4vfqMJ0znQnseg8ezBz3Gx4cGkuT9lDgl1XNZhChk1/M0BR712ZaFJ4J6TR0gwBNGB9wW
	OuVH5GQoIYCZVnn/2m2hBUA4gTpO/YwsqBr3EEU9JRYcgavDOCna7YjZ03RupwvexTSj7+6EivY
	OpsNQObL/E0+6IiX9436k3H5ZdcOwg=
X-Google-Smtp-Source: AGHT+IHsjJ1uKKsfAZJeXtqlzXQ+Q2c/+ZMxDMDEIndUVBtIVCy3R9bWJv0HFWzE5Jfq4QSBRXm1ooFEPc5dvZn9AIg=
X-Received: by 2002:a05:651c:1548:b0:35f:246:a751 with SMTP id
 38308e7fff4ca-373a710a6f9mr5660521fa.5.1759300797301; Tue, 30 Sep 2025
 23:39:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250922-gpio-debug-macros-v1-0-d99739dff711@linaro.org>
In-Reply-To: <20250922-gpio-debug-macros-v1-0-d99739dff711@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Oct 2025 08:39:45 +0200
X-Gm-Features: AS18NWDBRp2u0dRh0NLHjgjLSPkMkLODZzx8GDSTd53SVEgMmIU0Xp0yU3m2d6w
Message-ID: <CACRpkdbgaYPVzv=MqvehDyZfF_8bMTxN=6p7qhB5cQq3wr9h0A@mail.gmail.com>
Subject: Re: [PATCH 0/4] gpio: rework debug macros
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 22, 2025 at 11:54=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> Rename the chip_$level() macros to gpiochip_$level() and reuse some code
> in macro definitions.
>
> No functional change.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This LGTM!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

