Return-Path: <linux-gpio+bounces-1228-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB77480CA19
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 13:45:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53E25B20ECB
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 12:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ABDF3C066;
	Mon, 11 Dec 2023 12:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MD71feyT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35292BD
	for <linux-gpio@vger.kernel.org>; Mon, 11 Dec 2023 04:45:29 -0800 (PST)
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-77bcbc14899so274633685a.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 Dec 2023 04:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702298728; x=1702903528; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ciTb8X7sSYaGOT4UWkd550gPDBthZN4x3zDDJKswrc0=;
        b=MD71feyTXsRUpjaEAMVx1rbSYeC3aWOn2xg9RS0SC1o3UJKEIZjSiqE07xBHybts2C
         T8IHB0QodWLqaf5ZYUOaVsX9+Mc/zKX3RgMGy7jAAqaOhN67Zw2z+wYGaojTRgMqDNZY
         4IlM6WUV3Rr1GrZAexc1y8ayyPBlCOFAPkK5VZHdsOo9jIGQItb7yp8aWUtuk27j796L
         5gQatQsuUrbAlsLSzN4C9WyaH13R1yRoQnqXpd+BtVaRl+bcj/eRD/gj6l7RHqO7S83y
         kqRBTGP6YOuyr391oXgzA0uE1TubKEmxOR8xByBjzq9KMXHy59WFG7a4GD2eoq1TW9vM
         kwug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702298728; x=1702903528;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ciTb8X7sSYaGOT4UWkd550gPDBthZN4x3zDDJKswrc0=;
        b=V3AS7Ky2tNleKFuIl4vWdzUo25WEZS/Utg3aS/QPA5jqQySdxFxAZcaKC2nzKrpcA3
         shmOgabSTlK4nQpBg1vxgC1/NzQNbKFFCRtAah9drHVeV+5l/nOTy6qJpsSwwR/We2yi
         9BYnaeB8yDxBWhIsyS55GPHuZUnkxvMbo/seTwxpp+91qKnxjmAo94LwaDPAxzf6mGsM
         AKLjfMWv0UhbIFHDZq1lw4c4jv5Cxewx0QAwsi9WIa8MTDUq1XAUwBV3S+NHEoloLGwa
         vocDnBAx8cNMuqeyJKrnOKm2F4UgVAhuguztru0rEoueEds1c4zYJeZhD9ahZIQ+YA0/
         LSug==
X-Gm-Message-State: AOJu0YydFT/pI13nXkZ8mSmFpxXT287HtfPZrNj+6GyKoXHuTAVLJKHS
	ar69XMg4c9JeI+wRt+Tcy9da13dgnzG5tbKEepHY/A==
X-Google-Smtp-Source: AGHT+IEpuGvMmwJK7KEtP0GssM6BhrUf01e5r6sZWErKY3vlOr/IGzS7HSTqH7gTZbrJhzfyaEJCH937yl3bmQukKsg=
X-Received: by 2002:a0c:ef8a:0:b0:67a:8cf8:3fb with SMTP id
 w10-20020a0cef8a000000b0067a8cf803fbmr5908480qvr.61.1702298728335; Mon, 11
 Dec 2023 04:45:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231209233106.147416-1-peter.griffin@linaro.org>
 <20231209233106.147416-20-peter.griffin@linaro.org> <03603f37-ec3d-456c-95a4-e543d1df4801@linaro.org>
In-Reply-To: <03603f37-ec3d-456c-95a4-e543d1df4801@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 11 Dec 2023 12:45:16 +0000
Message-ID: <CADrjBPr7tqdec6z_NL0EEm+G3WTUkjj_dE2Lpm+f=4hdg5BA5Q@mail.gmail.com>
Subject: Re: [PATCH v6 19/20] arm64: dts: exynos: google: Add initial
 Oriole/pixel 6 board support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Sun, 10 Dec 2023 at 14:39, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 10/12/2023 00:31, Peter Griffin wrote:
> > Add initial board support for the Pixel 6 phone code named Oriole. This
> > has been tested with a minimal busybox initramfs and boots to a shell.
> >
> > Tested-by: Will McVicker <willmcvicker@google.com>
> > Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  arch/arm64/boot/dts/exynos/Makefile           |   2 +
>
> ...
>
> > +&serial_0 {
> > +     status = "okay";
>
> Keep status the last

Will fix

>
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&uart0_bus>;
> > +};
> > +
> > +&usi_uart {
> > +     status = "okay";
>
> Keep status the last

Will fix

regards,

Peter

