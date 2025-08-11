Return-Path: <linux-gpio+bounces-24135-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C02E4B2029E
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 11:07:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7C1F18C017C
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 09:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D0A2D8DC5;
	Mon, 11 Aug 2025 09:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Hm8dxJkL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5542E3706
	for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 09:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754903251; cv=none; b=udrdp9z+meXmI8qIYdPef+d8qMLPD4JbfH2McwGw2QvKSBsYTfjvlfUAHjFyBeWgzoAOSdtEc4+6Mq/ScxdHamkZ2Ehf3oEOg12KFBBjqxYqA8uOLzvPP3SQ3W0CNzcauooUnbTw0MJ+z4kHEVp5Dv07bHQfs9AEWEn0d99lEc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754903251; c=relaxed/simple;
	bh=xju3broIRlUVn+vTv2wS7dCJ6IPxFLIEfMinCyxUGdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T/UmXeEdfLOk69EHUX/GqQLzlMR2zu2pFlfH366bMh888xgRfyLYZj/obN8nd+2NSQ7VYjEO68eVWhn9GDpvmA55GygNEkKMDVzwaX/paHgHpe5MY+x4ew5LCv3+scBEmSGfyqr45vej7Sq/L2vQK/NvK8gThydbIScBEx508w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Hm8dxJkL; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32ca160b4bcso34924071fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 02:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754903248; x=1755508048; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xju3broIRlUVn+vTv2wS7dCJ6IPxFLIEfMinCyxUGdE=;
        b=Hm8dxJkL/W6J6FE5YdMAWYweVLt5gFQVjQMkWnK/VZRbDi+cAs8cPOo/VVyKRo9xel
         CjLiu4bhX9gAvZS9UNBTO4kiMkrXEbDd9H2a82+5nI79qi1mwbajMcC/sn/5pmJ8jgdy
         8f/4srBdiiJwT15QW7n3FZk8yGdXIZFyi/Zm1jiWT3s6cGCQqEwkcLdk3sc35vPOD+jy
         Qd1Q8/UjvCqTd+9wws8yw51DA/c2qACEBLAgQme193EkOzx17U+pklHNS+SV9rMjPYjg
         l+39TNLCp/fx9z/X9vnp5WH1cQF+3GUXKrSV7wC3vXu1DKPbCB1L+kDGksnaF7FXsEdA
         WwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754903248; x=1755508048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xju3broIRlUVn+vTv2wS7dCJ6IPxFLIEfMinCyxUGdE=;
        b=FIwUsuAYN75oQF0z084h9ua/aHz/KDaYSqTo7sGie8dsR1r3ZgMn6tuXuqbmIHLsSu
         CIQ+8Ic5ZuOd4x2wPyYNX2ABDt2U1v8lVoD7mZacJu8LAN9WM6qM4LaOZ/3971LByfQE
         BcCXLhPrKldr0XOejzlxGj8OJ91DE0MkG5GDvMlhFVWfwOCZ4MLC0hdaNF/hLbVIJ+om
         BjaMHsfFw6WuxPTHTR80/QxIX5kVwCLis9aKReeWEbAtszgmcLFRHiZTwFoBvjQzqyWD
         IiVaDDcOeaefOC0wK23Hn+ChLZV/JaomGu/yMnQFk/X+C02pNG9lBjowGdZBsA9F0dEy
         y0Eg==
X-Forwarded-Encrypted: i=1; AJvYcCXsRimfWCRGC30PdBqHzRy+rUI/38a1WsFfntjH3D2AcV/gyAW2NMMRplPkHcHVmE1nJbCzhXsEdsni@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3wJf6ZVHp8Hl+4y6Q58GMbzfdzzi9c74tzuJFJM2IlhjmnsO9
	cv6alT3GVzy9xSQtz9/WfJtw50jqTNyPJoVj8SFK6RmWfuCGRVPi+n8+zaxkVKVPzc/r+UP6tqZ
	4hXDgaqGvv+JG3f9wK32J2ClVgrFZizM3wQTdMBhr4z5C6GEaXJpq
X-Gm-Gg: ASbGncvspnEKO14nONPXSrWOylrgPsXcUbGlkp69KFCSX8djvIm5S0aFcOmwJopNnW4
	FrGJYqDUIwm5xon8+PSMK3Ae4ApeY+jlGJiLf0rAsbmt5HlxI7tmmqEcjyiV6+4ChDYUMrgEYwH
	vAan3J218XvdXLgv+vmMjWnYqO3IkSs4lMOFnkj8JzJlyQaGVm5ooKr1XyzAqWdzryUqkPai/oZ
	Y5lzgYt7ZYtErFtVR6KhQDtxOjNgTa/bz2JVY8=
X-Google-Smtp-Source: AGHT+IFZveq0nmy94r0OrCJPpvWF608g9l9IJLEx4ZUAZNS9I2vPTNhdTJD20+fk6XEDEab+NczHMLZHLLz7KDn0I8g=
X-Received: by 2002:a2e:bea1:0:b0:333:a710:e4fd with SMTP id
 38308e7fff4ca-333a710ec2cmr27856481fa.4.1754903247709; Mon, 11 Aug 2025
 02:07:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250731091637.595136-1-lijun01@kylinos.cn> <CAMuHMdXFk+f5oxfeh2MePwpBGE2gqZXLePHzZputc6j8HwumUg@mail.gmail.com>
In-Reply-To: <CAMuHMdXFk+f5oxfeh2MePwpBGE2gqZXLePHzZputc6j8HwumUg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 11 Aug 2025 11:07:14 +0200
X-Gm-Features: Ac12FXyFxexQW3O-5wuqKLT-gYXTOq0jr1L09H-nY-ThA2WDRo_RoBDOkqq3dbw
Message-ID: <CAMRc=MdiXQ5iRa8qbV_cdDh-MoQP-OQ96CQn-jAynn3ZSC9qhg@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: aggregator: fix macros coding style error
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Li Jun <lijun01@kylinos.cn>, geert+renesas@glider.be, linus.walleij@linaro.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2025 at 12:14=E2=80=AFPM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> On Thu, 31 Jul 2025 at 11:16, Li Jun <lijun01@kylinos.cn> wrote:
> > These changes just fix Linux Kernel Coding Style, no functional
> > improve.
> >
> > -Macros with complex values should be enclosed in parentheses
> >
> > Signed-off-by: Li Jun <lijun01@kylinos.cn>
>
> Please add tags given on earlier versions.

And also the changelog between versions.

Bart

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

