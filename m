Return-Path: <linux-gpio+bounces-30364-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F54DD0AC0B
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 15:55:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 767CF3084D2B
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 14:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F24F53101DC;
	Fri,  9 Jan 2026 14:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ezH+LWsg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55132D641C
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 14:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767970323; cv=none; b=n6MvkNjT5WX9iYqv7ai/iATERWIppJVNtrzgcwp/t2kMxohjWbCXRsGpJIdB9md9cEh6Km7t9ePGhV7db29SMJtU/q6+Ae//p04WCpZm+0mCFBIGSTr7OHI6GPenUUjwOaSPJ3DzAM63TKppeNuUljBv01vN04GUAIzRM7FZKQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767970323; c=relaxed/simple;
	bh=8UyaPuLBA+XJW3f5S9HbudTC1tH9uGmlSdX6acM/Jdg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QO6VSIJIwFX42Ycd5GPQETzs/xwgutIUKA38tgpYWM7XG1JZeCPx06NK2cyVm434OmnRiK4wko4r15mYgHaVmhIFyOkYb2BFJXkkV4MlrltA48naC1B7sHUJKA/EyvfzgPBVQy3lsEBy+F33YCvAt0AcEWltXukkLYIfjHI7f1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ezH+LWsg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6430AC4AF09
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 14:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767970323;
	bh=8UyaPuLBA+XJW3f5S9HbudTC1tH9uGmlSdX6acM/Jdg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ezH+LWsgCo9OiRHy7kN0FGnOO3fS6kjATQn5rdKVBwDN/8m5VcjcrnLXZhjgNpeWA
	 IjfqzRBLxrITPURPIf0ERs7o2eTDGEJxoWKtyF5dSLvF0gtA5PerrfA3AnlMUEDUaR
	 sN1W4LHJsEXtD6b5z5mQkirSa67rG30vRAV/2pIXLfiQ/WXhLgoVQUXrXr2/mga8qB
	 ZtqemA9K+uR5GBF9Bjfxg+rjst+qORy887HBqUa4eaf+876sPhH6Imc21xtmM5dbeX
	 92VFpCvoZADDPvfQjXisPWwQCK/IZiIqVO+qv7/SuldgywoxbLeD+FduZ3e5XIhWgw
	 jeuFMDhZA8Kng==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59b7be7496dso1846378e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 06:52:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXKdLQ2875W0SjFBoXTEuApiGGSzrxp19plNpVB7sQLwS500ISDe4nS7+kYKC4myg05mwn/nJHvC1dS@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs33zOyyi8JjVAxK5MiY5AWNHGTnOfXKSKlb17C8jn3ei+0eB4
	2MF8yoDuEIEOkH8P96aYDUEhietHjT5pYB2CTsCptLptT+eJ7IOW8/4eS7C+Ra/crobV36I1Nf8
	9ZuUifcHzouZXKumCdxPUUd5Q/I00WzIDYVQkaRMTWg==
X-Google-Smtp-Source: AGHT+IEY/2Tqdl2FXRVWMLK2bgJNZzVwcHVsOpUD7sAl3iQ38Co2Em14j9Srg7KxGk9FGChlDc9ktgRTqUg8iosJajA=
X-Received: by 2002:a05:6512:a8c:b0:59a:181b:d6ab with SMTP id
 2adb3069b0e04-59b6f058052mr3052914e87.41.1767970321919; Fri, 09 Jan 2026
 06:52:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109130832.27326-1-bartosz.golaszewski@oss.qualcomm.com>
 <DFK4BWTWHHQF.2IBES82YDKAEC@kernel.org> <CAMRc=MeV7djF27Jd6DWEJK60Fe-PcFSM_8dN2ydXXYSKPWVAMg@mail.gmail.com>
 <DFK53GQFDR4C.2E5KOGMEGY61P@kernel.org>
In-Reply-To: <DFK53GQFDR4C.2E5KOGMEGY61P@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 9 Jan 2026 15:51:49 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdJhqKMH4ap5zDf0Andy9h2XF1Z9bME6XvMSY52YRWGBQ@mail.gmail.com>
X-Gm-Features: AQt7F2olTeZlSAn8MlFU7kH4KfR8wpxCbKr5asyL8e6PMrj9x536reHg729gZ28
Message-ID: <CAMRc=MdJhqKMH4ap5zDf0Andy9h2XF1Z9bME6XvMSY52YRWGBQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: davinci: implement .get_direction()
To: Michael Walle <mwalle@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Keerthy <j-keerthy@ti.com>, 
	Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 3:48=E2=80=AFPM Michael Walle <mwalle@kernel.org> wr=
ote:
>
> >> This will need a
> >>
> >> Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO suppor=
t")
> >>
> >> Otherwise the sa67 board will be broken with the defconfig (or any
> >> config enabled ARCH_QCOM).
> >>
> >
> > Can you confirm, you're still seeing the issue with:
> >
> >     https://lore.kernel.org/all/20260108-gpio-shared-false-positive-v1-=
1-5dbf8d1b2f7d@oss.qualcomm.com/
>
> Yes, latest next, with that patch applied, still causes the same
> issue. I don't think it's a false positive as the same gpio is used
> as enable for two different regulators :)
>

Yes, I responded under the other thread. Let's add Fixes: and use this
as the solution?

Bart

