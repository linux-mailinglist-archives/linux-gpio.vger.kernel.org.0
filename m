Return-Path: <linux-gpio+bounces-3622-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4D185F3F1
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Feb 2024 10:07:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CB461F2139F
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Feb 2024 09:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F3AC36AED;
	Thu, 22 Feb 2024 09:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="y70OeTvl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A97420DDC
	for <linux-gpio@vger.kernel.org>; Thu, 22 Feb 2024 09:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708592841; cv=none; b=V4nh++kKYl0iboM9FA9SRY1OAYhHNn/N7BcuCwDo3sMJ8v3GHhSS8XB9/I763BlF/auh3OigdJe76rQJDDenR0B2br09S6Q7572oR34O1mH4CYFcbCVXtquGG6B1vqNaOmk9MKGzLu04CjaFhcwSIZ4dPoomn05cy/Nl1JjzKPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708592841; c=relaxed/simple;
	bh=0ivX57rX4D6yQirT/8PQLMD0kbXDO3CjM8WXX9zJugs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Grs5rtOD/q5D0eJN0H1Hx5butj7nCAwg6fypSu6SN8CMRznJg3JMAOQylC5gk8eo8a69Cso0oWnsrhEklntfFlRR6OSzFyUhU549ug3sGmhi041iCOZCX3BcRd0ovNMBMPMS6f6imj52Xc6TcrHcK4xatK3V6ZbChsdiuvhKHeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=y70OeTvl; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-4cb26623d8dso787667e0c.1
        for <linux-gpio@vger.kernel.org>; Thu, 22 Feb 2024 01:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708592838; x=1709197638; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ivX57rX4D6yQirT/8PQLMD0kbXDO3CjM8WXX9zJugs=;
        b=y70OeTvlobdNShQOP0URGKThzG7SAILy19sYZI3vYxrZtmyEV53Ik93D8XeOYOAu2j
         zz6ibkEuuBp9gAyK7eHi8neRaE3Uoq/6fLYWHXuhkDUfrC3rDc8wjvvIfXyFbhQ3zml1
         UAErxSivKYt0DTgPO3dzXEWiDwM0Z/GiJvF+zHG2NH6ktoWjoRnODlNGypg+okOhnWVP
         80xzWEuYDj3ht1fyjlws7D3G4hXZENjbVRFWAWdqCuKUNmfLtBud9X//Mocme2YgQEYh
         DZu76VCTIMZIIp9Ox0VN5lQewcC0sTyP3J6/ed+hQFs9UH7bZD3yzanNUXYVzuXtjPEv
         XXOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708592838; x=1709197638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ivX57rX4D6yQirT/8PQLMD0kbXDO3CjM8WXX9zJugs=;
        b=uNNmJJVw3p09lSr7WnCzacR/GZP4BhLdyBSTUzz1Ks4X6LVuu7lovu7fRiu4B54MAa
         cugyWCaZlxnu60HGoTjKGBpvFQhX2lsTpTgFQQIDyYegnfhwG2I1a/n5ZP9gmJlxdUF1
         3VHEE1g16dUaKtjSVwt2Td0qwUbDjc9S871QN4TT9Ph4sy1qGWB2kOit4cSeODwTOE+P
         Vj0YXpKsJ0K5pMnHE/F0gDKCITuocWSQ2lgk9AbwgY339CK4uFDrcF0/VzWpyy+9onkm
         A9ySuy3GQz2L6cIOQOZnvOC5OFXZ+Lr/UBJ8Gpn6C0wP0lnvYmliO0CYKH3tTrNPomDU
         M2nw==
X-Gm-Message-State: AOJu0YzTxUXXYmXSmfKe4QDNjJhGRKN8GgdkocwwWvqJiWTVtXXRZWOi
	yXS2UB7YzEEjHWJB2MCCXLyYRfWuQkBiGSEcpT6lBVKyI/loUEV1tWXB/7zVxdAGjr4MtcvYQ6e
	DHO2RVER5Nyf3knbMP1ecSxcVOgScRobNXvucHfL/SHn2FEDS
X-Google-Smtp-Source: AGHT+IEzNIzKomd5sSPDpfbxWEG7uTeLUWfG3kKODuO1/Xi5ch980Lu/eOzY6is24+DoB2nnNLrbbKdcQHKLcvZgz6A=
X-Received: by 2002:a1f:dbc2:0:b0:4c8:ee1:5a0b with SMTP id
 s185-20020a1fdbc2000000b004c80ee15a0bmr10447535vkg.15.1708592838437; Thu, 22
 Feb 2024 01:07:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240220232328.1881707-1-andy.shevchenko@gmail.com>
In-Reply-To: <20240220232328.1881707-1-andy.shevchenko@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 22 Feb 2024 10:07:07 +0100
Message-ID: <CAMRc=MeDE_PpmzGrJhfmXZJo180X3uM5uvrcEf1D-7RHmo8ezg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: mmio: Support 64-bit BE access
To: andy.shevchenko@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 12:23=E2=80=AFAM <andy.shevchenko@gmail.com> wrote:
>
> Use ioread64be()/iowrite64be() for 64-bit BE access.
>
> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---

Applied, thanks!

Bart

