Return-Path: <linux-gpio+bounces-21941-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E9BAE1D95
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 16:39:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BE3D5A34F9
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 14:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE0342949E0;
	Fri, 20 Jun 2025 14:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="g2oy9MDM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0531528FD
	for <linux-gpio@vger.kernel.org>; Fri, 20 Jun 2025 14:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750430351; cv=none; b=nWrPuLL/amj4NxoEnSk8izjNFq8T7IPW1bCr/HtJRaPqMA4lUbfe0UbWUduHjGKBndO8Ha8YjXSLdVahhqGZaXOisb3OfF1NlrerFfvBEDjZJ5ta14AK9BAKMNC+OdXB1rxCh+350xrc+Rbg2MWjZ2RAQ+s4EYFssPNqYdLvap4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750430351; c=relaxed/simple;
	bh=9u/UMVsbOfvdlKqQkHWv5U8ETyNtq+tbaBw59i8gUmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mGihRiYU3DNeXUVIjzF8+hrZjyW/yiZUgMZkcRvmglBIETGpQssPM/kD82pHUN8gXIgtu2LxC6Is0o5sR/hNwfCZKWrPHabgyvzddja59Kj25auRegc2KKQuirJSR2vYNp+249vO0sTKwD3aiuZtUrmy7MpYpKpQYqh3FIBUHD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=g2oy9MDM; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-553cf020383so1972924e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jun 2025 07:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750430348; x=1751035148; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8q9jPK46zsApDPOL6C1LivQIOx9eji9C57xl6gLXKoI=;
        b=g2oy9MDMdwlIDSWJAB+obLA89NKRH36+WzefQSTB/H6XBp+I/h4ivjsS4Qwt49bhHE
         ANTuXdAzl/T3pQ4OkL7NL2U7+5dFFhOK+NI2Nmh6IpMiViEqaAydxdHqZLm1QYWXNBm5
         gVnsbSO+VsB3nzZ4w+FnPBOVfRTepa8oSt0bF3WLUdgJgnkLn93EFaC5wuOSCctDpYCO
         pC4MBXNN5hs7QL8SH7rEqrVeGUDdlGV9JBvu5gDVhVYDn90KbCyWvZaMv1R1C4JLB5RQ
         YKIaHyuzRYw/zo8ScQe9q/rXK1ij2ArRGzpTDcNzoG15okb4bNeu6rme2Q2aEju4mAz+
         SuWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750430348; x=1751035148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8q9jPK46zsApDPOL6C1LivQIOx9eji9C57xl6gLXKoI=;
        b=dRKl+v8C1pDq38lVB7xFSaHA1iyYm+fUmpINajcUtaq8H+gUuAZmq6IXz1SdZJwCi+
         VHnh7SI1ydMt2FvwsfYPjA9JCooA7i3ReQZ2XLRBb02JZl9g/lShXJfrKRjebQ6Js7NB
         2me2elaidbTrNZ2nlf+Pf5YSFaw+XqZflWAFaxI40borjbCF/mj20/PTPOd6A3Yy4Ps1
         r5cHuqcuNWWECDkyaDWIM0zcRcWOLX12/Bqvv4LiKU0Hb16+u4kF0RiYTM403YOfc5AY
         mpi0H+mhugUvKSErUNuk5QPHYWfnrLOfaWyQYtBIrFS9ZnhMvWdAyzdv3VyKz4g6hMFH
         rzeg==
X-Forwarded-Encrypted: i=1; AJvYcCVYsEN2Q9FJ78azxa5UA9Om3/JtB1Vd34mQAI3RLsNdaOiColy7+cs1Jm8n/15kwY1dZ0fNoexWDTfI@vger.kernel.org
X-Gm-Message-State: AOJu0YxFEFz2kLOraJXOeQiBlkjZI7AmFIeX71iI+dvLF4x9sVapk6SP
	2spKlkqxOuBrQXqa7opvV0jkWQvmzqztUwi2RG8yDcu8+yCYcFccdEIWrsonUXliBPEvPR4uIao
	D436abLHXsigB/2ab0vc1QbKLhjnzijjsFZP0c4yNHQ==
X-Gm-Gg: ASbGnctLDiNr/oihv9VYuwvmSCKBBCSyinPZbn6CweJdDXqlqFSaDoDLptvFBuJV9Oy
	0bs6nb1RP2hEGsJqbiat3mnoJIZc2lWnYLqdq/Ybw84gBfK/yWh8FXz2st/8MYr6OrogZ1NClKG
	D8VUGql6mmbLcNUUuRXmdnOjMva68p2luUN34NWLjsg8ULwVo/kOkub5a6KYYn1PP8t1DnQr4jy
	3I=
X-Google-Smtp-Source: AGHT+IGjkgwvxLakGNgWVvM7O0xCSzMb0/KOdOUYDjcrFuGeTYUFULoeqZ3P82uB5n31lfl8yIBpzNsOJDI6YzmRriU=
X-Received: by 2002:a05:6512:12c8:b0:553:2868:6357 with SMTP id
 2adb3069b0e04-553e3d0b13emr1195210e87.50.1750430347854; Fri, 20 Jun 2025
 07:39:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620130814.2580678-1-arnd@kernel.org> <CAMRc=Mep0SNj6anWcmaNh4v8Z=J7eomujU69Gz_exuG2Wsd=8A@mail.gmail.com>
 <d05578a6-eedc-4c2e-94e3-e00fa293e4bb@app.fastmail.com>
In-Reply-To: <d05578a6-eedc-4c2e-94e3-e00fa293e4bb@app.fastmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 20 Jun 2025 16:38:57 +0200
X-Gm-Features: AX0GCFtvUEeaX9wqytjxNnYHkYskGpO6_dyNTKYjcEvttmf-q8EDtdSXs8QVaiI
Message-ID: <CAMRc=Menh3dPXbA7dJCRLRXu=FtQ19gwWLsDaWfjw=+nn2Bweg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: zynq: add CONFIG_OF dependency
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Pratap Nirujogi <pratap.nirujogi@amd.com>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 3:46=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Fri, Jun 20, 2025, at 15:36, Bartosz Golaszewski wrote:
> > On Fri, Jun 20, 2025 at 3:08=E2=80=AFPM Arnd Bergmann <arnd@kernel.org>=
 wrote:
>
> >> --- a/drivers/pinctrl/Kconfig
> >> +++ b/drivers/pinctrl/Kconfig
> >> @@ -603,6 +603,7 @@ config PINCTRL_TH1520
> >>  config PINCTRL_ZYNQ
> >>         bool "Pinctrl driver for Xilinx Zynq"
> >>         depends on ARCH_ZYNQ || COMPILE_TEST
> >> +       depends on OF
> >>         select PINMUX
>
> >
> > I don't think this is the actual problem. I can build (and link)
> > pinctrl-zynq with COMPILE_OF disabled alright. Can you paste the
> > entire offending .config somewhere?
>
> This is from a randconfig build: https://pastebin.com/ism57RPe
>
>      Arnd

Right. I don't have the time to look into untangling it but in general
all OF interfaces have relevant stubs so `depends on OF` should not be
needed. But it's more complex here in pinctrl so I'm fine with this
for now.

Bartosz

