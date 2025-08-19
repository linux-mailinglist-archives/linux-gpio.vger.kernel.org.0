Return-Path: <linux-gpio+bounces-24563-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75857B2C4DE
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 15:13:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2E59243904
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 13:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F6D333CEAB;
	Tue, 19 Aug 2025 13:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PhyZ1McH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A895156F45
	for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 13:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755608741; cv=none; b=gqRiWXOJMOQpbtP5RFRpcvdtYCi+rKrYUrUjEL7sLvUGfbQ7oJ++ZTX/igVnj11sfpuFSljhNt+TdQ7BzKJRCaNyK01+yPTf9WFmSMw1g4+75LuMGhqnFPfoXStaOvi9F4UXcCmHwvD0bKtWgvEdrFBlbCCkp55WJAbuuB8A2eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755608741; c=relaxed/simple;
	bh=TydTBW5thx9mDJs/hCsJtwVT0BXigr4SrIrrv36m4Gw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pHUMucSqtOmNbcZ91Bf93b3dw5x38oSI0JF+lHVBpuH1F/vmONQ0FraeTnsuPPlY2tf7zGd6hMU9C9nxyhCq67Y5QTnXqnFglU7389FwY5wjmUekj6kIcoEIVqlI2exTMlSGS/J2hJQUcWKR5PD6oaHZOC+9r5Yz8VeIzCpfl3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PhyZ1McH; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-333f8d24c6fso44419851fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 06:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755608738; x=1756213538; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TydTBW5thx9mDJs/hCsJtwVT0BXigr4SrIrrv36m4Gw=;
        b=PhyZ1McH27tO8O6wlozW0gZSbyVAYJktXK99tCbcaG8onozJzZ/VspFLD5SSTyXp2y
         2VZZSl3bd5gDM98+smiC7zNGZyy3MMrLaUKh+cJSdO5tFxkxKjaNrIdcekJMBSrMGmx8
         yQlpKk/+I9BiSMLORsBg+RKPzyEvYFZT2LL4TZpJYUV/dqOQURODLyIV9LEyjxzaXcMO
         uHC1a2A7VONB5jMa0k418Cthp4GDGgrLlgQYvUG4jS8tDOTB4VK7pGTB1M/hUbGrMDgH
         rNc42ybK4OW7Qkn7wNb6u9/xwnFJVvM8CP27sEa852SXDj0TLxVoEmGqQDPtsCvjUgx1
         2drQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755608738; x=1756213538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TydTBW5thx9mDJs/hCsJtwVT0BXigr4SrIrrv36m4Gw=;
        b=Bv23NhwQSfWiycMASLx4OXk4wYzdTfeFxLfCT2Ii8a6qTanv+LfoPd1EXQ4HaobGPL
         2NS+Q711jd9cftB2elrqH/i0oK/EyfAKh0DupP2Qb8pcdsa55HBiz1AWJOpquFeuzdhz
         Z6znKKq01RpY3vG7Jm26aazPpCI4Id6HArf4CtTieJOGsnhOd1jUWXuE1u0ZghB7Hrae
         QTdBm1KaQFrvW2NI+9umWGSBwuIvD/BCDaLuMlZmASpqcQO/9Gcu1Gu4pkqSeaM/8zje
         dtumBrwJAV2e2roztx0bpyNmb+kKCZR+PjdlD9Vt+foLWLsahdVyUB5eon3CdBDktAcN
         7bNg==
X-Forwarded-Encrypted: i=1; AJvYcCV44KBnxoMMQJyXSMSf0wKFDx3mB6XURsgbyxABAUKOK+wlSX8MF+A1VYJjBXLmuV7PDMahnUclqeA7@vger.kernel.org
X-Gm-Message-State: AOJu0YywuctS/CgOLfekiwkeQY2rGo5QSvvlqoDk+MjJHnsJV8XpIxvA
	ZfwuEUH0y9XHgMn2wL7NW52EDMzLgqBt+ATDthm5m+TF8D3TbtmpziBSwiaRrme51z28tWM3s1u
	8od8KC77cnz9pvCDEQYhpFPVBlSDAe/BEPaMfLal1CA==
X-Gm-Gg: ASbGncu+RshpfXy7nhwtkYTw2Yw3DKRK2iHy+fCAgO8BT4nL1r8lllI+H+OgMy+dXm5
	cQ5kaMppp5YK3P3S3wEJ/xQ5QMTd+i+hOBY5ikr+/O3eYuIWbGBG1K3Nz5l0GBc8ZFcm6miDqdf
	t0bRFpeV6zlFlv1It7kvM56smHqzWmLvZc+J0tJUShW2dI6FWeMHrkGMV18TbgC9sHW+sIwlDel
	b4YpdJJd1dUo4H01ptxeDI=
X-Google-Smtp-Source: AGHT+IEpK76uxGn/DS7ICLCoTV8giPyjNjAYLxm3xST9mGFGCKp3eB6JQE/Gx6nRy13cnpDfXlqQrB6jbaGh+1eqiHk=
X-Received: by 2002:a05:651c:1505:b0:32b:805e:20d9 with SMTP id
 38308e7fff4ca-33530809c75mr7490841fa.38.1755608737688; Tue, 19 Aug 2025
 06:05:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <9652736ef05b94d9113ea5ce7899734ef82343d1.1755520794.git.christophe.leroy@csgroup.eu>
In-Reply-To: <9652736ef05b94d9113ea5ce7899734ef82343d1.1755520794.git.christophe.leroy@csgroup.eu>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 15:05:26 +0200
X-Gm-Features: Ac12FXx42oLVZo77dClNUGC42QVr3TSxbMmRbjTF7n6R6gJYcLt9jZg72zItf9E
Message-ID: <CACRpkdaV8EA6O1x3+UpruhXEqzA5Zb_6v+DVwURvOFH+rD5Jrw@mail.gmail.com>
Subject: Re: [PATCH] gpio: mpc5200: Drop legacy-of-mm-gpiochip.h header
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Anatolij Gustschin <agust@denx.de>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 2:42=E2=80=AFPM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:

> Remove legacy-of-mm-gpiochip.h header file. The above mentioned
> file provides an OF API that's deprecated. There is no agnostic
> alternatives to it and we have to open code the logic which was
> hidden behind of_mm_gpiochip_add_data(). Note, most of the GPIO
> drivers are using their own labeling schemas and resource retrieval
> that only a few may gain of the code deduplication, so whenever
> alternative is appear we can move drivers again to use that one.
>
> [text copied from commit 34064c8267a6 ("powerpc/8xx:
> Drop legacy-of-mm-gpiochip.h header")]
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

