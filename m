Return-Path: <linux-gpio+bounces-16745-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 638C4A48CB5
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 00:21:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DEB016F18C
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 23:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED695276D0E;
	Thu, 27 Feb 2025 23:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ydAyX0rq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC10C276D04
	for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 23:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740698433; cv=none; b=B3BVoJBnUv0/dRxpbAv/cKBjxEuQ3701TfeStCuZYUz3vY+JrlQ70RXg/FVc4ZjV6jO4ReDE0WCoJNacr1GyVHh0CmfJT+hzzXgnG8364lN4bdACkrMTB4I7iRX7NVy8JmGv5y8MLqa4N2l9VU2kA7TNM6KEZBbEXiCzq3WEG58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740698433; c=relaxed/simple;
	bh=F5gFWd7NyXBKKAhyQwBh6+sD2PO8dFaOkquGSGOTL0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mg0CEGMKDJ/Y0Rv9bJgxqdkWl2MCbUnL9KXBSVQjzF++OKDWi1h+zA09uwFwslD3x9vn381o9/EBZK74UW6RuHEK28klDrv9yoOyFX+14NqFxumpVEJ5ZczNL4XRhQQo4EyDjE42blqef2ww9CI4dZ8QADETtpmYx7uoChKvP84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ydAyX0rq; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3061513d353so16333361fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 15:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740698430; x=1741303230; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5gFWd7NyXBKKAhyQwBh6+sD2PO8dFaOkquGSGOTL0I=;
        b=ydAyX0rqxF+fCL5DFU75Kco/rsfV9k6WY4TO1ASJLJnRRBua+4iriYMX825d21315K
         mS5QuZy413aAmsTzKAgqOgSUpdcoD5BgmvuCvTFAsiqvA2T4L7uy6Mc4RCGcgI+/BQEf
         /Aagsr4k5DpCdyamDh4wpcuTHM/v5NUmh0SJFvLnH/M0IKlwKtxzUIvtiYZqew5iulGK
         9hqQre+HivpL2tSLFZnc82g1mR269tjLhfNElixiYFQIKK0f3BhxmJbZVNymmbF0+yuN
         iZ0JS0LypFDrHXR0No1luBdDco87r6vz83z4+EWTnFOByNX3zeHwP6PvpYiBX0teaO54
         gEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740698430; x=1741303230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F5gFWd7NyXBKKAhyQwBh6+sD2PO8dFaOkquGSGOTL0I=;
        b=nTxlHzRpJggAk7XeQwYVcZ4M2B36OBYsiyPZI/TLYuJvCSbJOeFs9ZB/EXDEKLZ8Ht
         ixONF3kw64SduRYnRgtiV01vm2nR8AAxCdEoozcBrxK12Qfo25oUe7t588bsfZ5hXmYb
         nOQK4Xrpp4nYafTfAuo3wlf/hXh0+UBmGilTrJJwdwLkKjBHk4aOo8ra8RvsezH7pKUs
         7cXhkHq6Aje8Rjw3iigqq+j7yTEHvLUcyitASeltfOc1OXSycSKX9pcjgeTa1YaWF0Vz
         eMq0xNK/rntc42XlMcVGqJ2F3ew7aaj742iuceE2vKcwzMWVCwPdQJwUU7oy7HNfZAs+
         OJGA==
X-Gm-Message-State: AOJu0YwIguS7grF1FwG3Y4E0lITQ6fUhiU5/kp1xMjM+XPBJdQZd14w3
	dx/Vpl1WWRSLl59FRqxAx7JhM5cFBbptjGvw4Erck69jXgwr7lEfoWjJEJV6/cEWPw3DXkCrlWi
	ihLUDBL7p61gd2g1jFQDZMG9PQZp18g7vpM+iZw==
X-Gm-Gg: ASbGncu27N/t0/5NfW/k60F3NwouOcG8u3R6SUTGsjFr02mR5r++7lYEFOsigPgLZ7v
	8FByOv5QzahIsaEdscp93rBdjsdCgmSm12pi0+RjuUYWR4QQfrHK4LY3nRzPm8FnLlogGT8QVaE
	TkX2Pc12A=
X-Google-Smtp-Source: AGHT+IEk5RLYsoUHPzpYi1wiTH6QnjSPGHmuyXIkvEEGGR6cXNNFsRxuzVVGZXZ1pmZBSLNOo5vjsFK1Z56RwpC4YKU=
X-Received: by 2002:a05:651c:509:b0:300:3778:4dbb with SMTP id
 38308e7fff4ca-30b93212bcemr2482041fa.1.1740698429854; Thu, 27 Feb 2025
 15:20:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z7xGpz3Q4Zj6YHx7@black.fi.intel.com>
In-Reply-To: <Z7xGpz3Q4Zj6YHx7@black.fi.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Feb 2025 00:20:18 +0100
X-Gm-Features: AQ5f1Jq6Kdz3lQwhwmGuCGSn9vJfu8ox17mGres4abdL1zClg4VTMDJv0wNWJsI
Message-ID: <CACRpkda19xw3YSO3wL4FaDVHz4KV5Vrp4vR7PSHn3yLqK20PGw@mail.gmail.com>
Subject: Re: [GIT PULL] ib-devres-iio-input-pinctrl-v6.15
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux pin control <linux-gpio@vger.kernel.org>, linux-iio@vger.kernel.org, 
	linux-input@vger.kernel.org, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Jonathan Cameron <jic23@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2025 at 11:15=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Here is an immutable tag of the "Split devres APIs to device/devres.h and
> introduce devm_kmemdup_array()" series [1], please pull if needed.

Will the pinctrl changes come in from some other tree if I don't do
anything?

Then I prefer to just chill :D

Yours,
Linus Walleij

