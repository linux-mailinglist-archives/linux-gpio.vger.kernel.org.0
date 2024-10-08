Return-Path: <linux-gpio+bounces-11065-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1063099513F
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 16:17:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1ACA5B294B6
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 14:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC721DF976;
	Tue,  8 Oct 2024 14:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jj80nJOD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A2E1DEFE0
	for <linux-gpio@vger.kernel.org>; Tue,  8 Oct 2024 14:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728396314; cv=none; b=MsjwRi+NRwn0MjBPvHjxGDWC09XIKCa0Fpx9HyBekTwTbxWqHaBx8VN8v4q6pSrkyM+7sGIT40gkQiz/tCchFqbVQ5G+5SFrdAxsAKO3Qf/7RgmbmOlL5nEcnb8VBgCZ+i8InIekcruAzsg5e5qfTklicBBPhtymbSj/jd/Qu2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728396314; c=relaxed/simple;
	bh=F/zAtiWZQI7SQwrRf3j8mFudmNdtJgba/frtTc8eoX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bhNpPxUjuhCMb8b7Sh14zEuQYTVodLoBKpIOf3V2WVOXFrlSBrcc8AJV68nFQLwZSjzH928aKMw6DpoXBjZogrR0YCqE1HI0rwzkK/k9W0oNOcOWbtB0oFIYkx14qhHs50MYVDzyaPnMqlGMMGw/jC/riG5L47G57lNku6+Bqhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jj80nJOD; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5389e24a4d1so6945817e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2024 07:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728396311; x=1729001111; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/zAtiWZQI7SQwrRf3j8mFudmNdtJgba/frtTc8eoX8=;
        b=jj80nJODha1dlCx2y9/E0MowoKSZLlvro6pslO4Kh5Es0TNNs52060QpnlNLpgiTyp
         voXNlOz/IoT1rd1ckri8zFVCTyUQZNVLHXRr8rtbOsQ1Jpregw1Nuq1OKVFSBKrP+HHM
         wfgI919uvLrvQueqEG4257VkVrx2xJMnGqHaqvaUYPfIvtZRHER+VOO1KUCmoUUTztiJ
         /u+ClM8CLjvAYc7eypNeU62EIRvLa2YMrPsQ3nhYH6RcOAikWA/cBrKQwzoKbS+sASe9
         oHE3cTOA598Lg7WqR95oZOYxR+BbwZymf6o1RIUZSseZ5hSh31P8V+hawCofj0iixQye
         soQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728396311; x=1729001111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F/zAtiWZQI7SQwrRf3j8mFudmNdtJgba/frtTc8eoX8=;
        b=bZ5HNlYJpQZapOXfVqqLc2iNnqGgnCU7NQa8RsDvUkhw9Ys0iV50CxzuOVS6ULTM3e
         DtJVyKfaIBd3PNs65VqNNHqWqrWgzTY3trZOmbbCnTDn6BoVNXsUOiVUI/iP7I9A3QEk
         ET2bi131227SZSKj9hUZy/d7SQ2SgOMSESycnF+eryrK5tTSu6WQq9T8ofGuvmSnrnUu
         N9dC8nRnhwIKMGhHbHyylo2e/61hQOiRlZ5gjDVmwfWN1P48oeRUn0g9ic1oBkHnuRNn
         D2A6YBcXorfvjPWDKLMwvsCgWuqQ0Ct6dvaA8jQ/gpSuxxfTt0hp0W6cqT/ivRhJ3tLl
         DDkg==
X-Forwarded-Encrypted: i=1; AJvYcCWhyvOrbDcKKwun5Fvqy+d8Uq3S16i6+dRXGAH0+ggqtEvCn69w1tx74KOqSSxhA62APS0IYI+AGUGY@vger.kernel.org
X-Gm-Message-State: AOJu0YyK0AMWDJjAtP6dNCZ2s1SW/qyE/KMjdYmeZDmZLiRC5Q368G0l
	ndBxS4W3x4A0zman+wA8XiEG3oBpHbhjWSQvIZ8Vmls7wJab2nFsJmZTazWzckGuuQmpd4KTXk6
	NClJx3ayJ6zEYzfymvHjtoRDCXH2GthvCeg6Daw==
X-Google-Smtp-Source: AGHT+IH1k+VS7+QOkdRfKiZ/ppDlZVYCrXPrQ0PrBFHAOvGlq7s9Ltc5V63YkuZv1c4KqrPzzDwk1k5PEzavj/a9qU8=
X-Received: by 2002:a05:6512:12d3:b0:535:69ee:9717 with SMTP id
 2adb3069b0e04-539ab84a7cfmr8460693e87.3.1728396310565; Tue, 08 Oct 2024
 07:05:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008081450.1490955-1-billy_tsai@aspeedtech.com>
In-Reply-To: <20241008081450.1490955-1-billy_tsai@aspeedtech.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Oct 2024 16:04:59 +0200
Message-ID: <CAMRc=Md4BOsdv=w+ju00X_R1Z_RAXz2vidVMrb7riaE2HoS9kw@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] Add Aspeed G7 gpio support
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com, Peter.Yin@quantatw.com, 
	Jay_Zhang@wiwynn.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024 at 10:14=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.c=
om> wrote:
>
> The Aspeed 7th generation SoC features two GPIO controllers: one with 12
> GPIO pins and another with 216 GPIO pins. The main difference from the
> previous generation is that the control logic has been updated to support
> per-pin control, allowing each pin to have its own 32-bit register for
> configuring value, direction, interrupt type, and more.
> This patch serial also add low-level operations (llops) to abstract the
> register access for GPIO registers and the coprocessor request/release in
> gpio-aspeed.c making it easier to extend the driver to support different
> hardware register layouts.
>

I picked up the first two patches for v6.12. The rest conflicts with
my v6.13 branch so I'll send the fixes to Torvalds, wait for rc3 and
then apply the rest.

Thanks,
Bart

