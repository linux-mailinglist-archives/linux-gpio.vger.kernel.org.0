Return-Path: <linux-gpio+bounces-13509-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCB69E43A3
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 19:44:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73D71B2B544
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 17:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 558E31C3BE2;
	Wed,  4 Dec 2024 17:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OPtpGSc8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D5182877
	for <linux-gpio@vger.kernel.org>; Wed,  4 Dec 2024 17:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733332210; cv=none; b=PS1yfjLnKF4KnTHKXG9XPu1OVODTs06RjgTUDqxL4SYZDed+lqxjY95lJHgNGrip4SVRENhoqtOJrdKtVPdlSE52k9Jm6bIL4cCahWrn7EP/Gcvqw6ylJbMCLoka0POOLHfqYR7g6/Ho9zgpftv/N5smhmHQuQXpEVSpszGpXcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733332210; c=relaxed/simple;
	bh=kQlK3Whc0f+yVBbClUo/otUHCpEsE9OWeQ2QkoCxms8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cYdBXo/ue+mCZOC5pSqriYyFivbv6hshSekFKVTXFzfOzoxzMsUk1N9TITY6LEXcZFEDl19+BpWH2c/RprVU7IVg66hoNpAi/H0gfewYYZtxo/bsxLIBiyvR0raveoSPU4LgXDiYOCGTJWLyzXLCjyvtot9wqAvCztXDSLmQ8yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OPtpGSc8; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ffc81cee68so70944581fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Dec 2024 09:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733332206; x=1733937006; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQlK3Whc0f+yVBbClUo/otUHCpEsE9OWeQ2QkoCxms8=;
        b=OPtpGSc8bmJNg0sACE73wA6XwnfuRp0KCn4YImstdooFda67Cyg3swBl0C0afvPDKa
         FueXDkWSJddNumlSC0UeA7a9CsclhXwgwiBm52fAXBlGhy61nxBl44L4xldvGH35SJv0
         P3xSLg20mKgwGYTYVa0sP/9vyeuIpzs83B8hjJCQ8QseBoMsJedbM7eqDqjoRe2nI8Iy
         zffdhF4MGw07L8juFvkRuitnnkkpl1XHBX17IXTqRWXfiOadbGhrBNc9szRSW+JGoyGX
         3gC1fe8+BZmPZaLwvqm8q0UQEd0xvTXTbdXQ8WWprdLmO7txwm2Tlk09OcGY6RrVoO4z
         Y07w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733332206; x=1733937006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kQlK3Whc0f+yVBbClUo/otUHCpEsE9OWeQ2QkoCxms8=;
        b=Xm/lGXw/fMNcaguxLOXrqyc2oNn9vTERsVCnOqtj2lzBJuegQ4qMVddyOEifZUEtyI
         GUSCt48sOOSORmjBoHNM6757ElleHnvDhSv7Jw5ktK1ltbeeIyggsFMsJECsMWyMJ2mv
         5JmrTBNeh0CdlvuysZq5ywW0DBAV4wYLpStlYfb/O5TCWjT9t0oxTnVdWSEb2vCnpuA3
         mARf9RMMqkqADaeRK6IrZCJkq1NKizYc/nVL6HwCfndxQxnPMzKlkKoKI94leniwsYPZ
         RQGmzlg0PNDmeXnaRnSAOHhAHbLaVx3jHPRuzuP52IlqRoWdSosMBGrN1v9yqqt7POLU
         NJhw==
X-Forwarded-Encrypted: i=1; AJvYcCVQRNJQKA/Szc7gbiyyp/N+vK1pETtdMcy0uUxCBscHpd3eHaQNuw/FFxX9d0oOMH9MeXpq7GtJ01xj@vger.kernel.org
X-Gm-Message-State: AOJu0YzXnrHVwMmffEsUnzZLo30eft9DrG/3NC598tIByTY5q3PDUDVk
	QoF+osE7izH2kRzHllfloKLtpPc3PdfeoeMKGinKsChWEQKY9hBwVtu9fIuyDYCjCVW0T9qgipS
	4XucGbC2skJbanH+WNE3fDnkP6cgnbN6Qj8xTIiMcGGAXiEyy
X-Gm-Gg: ASbGncuPrKM97Z3i+0qq+JFocw9eL/o6nhQyRzKleEBU7vKE0jUXIhlNsnb86zFR1gq
	u7g8RsFrX4PNZU79W/YDhtidJAJf9Pw==
X-Google-Smtp-Source: AGHT+IGkoKErRErn26snnpKyKxNQL89sHOuwh0gL6UukUpZXKdWdjCCf6iK+2Syr+cedJBsPLjsVmhu5UngHRwjsMM4=
X-Received: by 2002:a05:6512:b9d:b0:53e:20c8:92b6 with SMTP id
 2adb3069b0e04-53e20c8933emr296058e87.5.1733332206202; Wed, 04 Dec 2024
 09:10:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241204122152.1312051-1-joe@pf.is.s.u-tokyo.ac.jp>
In-Reply-To: <20241204122152.1312051-1-joe@pf.is.s.u-tokyo.ac.jp>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 4 Dec 2024 18:09:54 +0100
Message-ID: <CACRpkdbSO5NqDTQgV0R9YG41yRtZmABfwzOC7jWHfv4aXDNZ=g@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpiolib: fix refcount imbalance in gpiochip_setup_dev()
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: brgl@bgdev.pl, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 4, 2024 at 1:21=E2=80=AFPM Joe Hattori <joe@pf.is.s.u-tokyo.ac.=
jp> wrote:

> In gpiochip_setup_dev(), the refcount incremented in device_initialize()
> is not decremented in the error path. Fix it by calling put_device().
>
> Fixes: aab5c6f20023 ("gpio: set device type for GPIO chips")
> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>

Cc: stable@vger.kernel.org
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

