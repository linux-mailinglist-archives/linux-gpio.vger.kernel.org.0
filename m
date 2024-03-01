Return-Path: <linux-gpio+bounces-4036-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C95AF86E37B
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Mar 2024 15:40:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 614791F227E3
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Mar 2024 14:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AE5E33C9;
	Fri,  1 Mar 2024 14:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d7x8mjPl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB1839879
	for <linux-gpio@vger.kernel.org>; Fri,  1 Mar 2024 14:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709303982; cv=none; b=ichYtEPkwgiVcKX4v4Uh39cmctLnnhhrpkzvtcPJ5BYMW8FyH+OUGlqINtlP/qJ6YaYW0slTXbk8l+g6b0DUT6z6SRVR3mV7NKs+rD6PNOeSvEz9MrKp6PAbjQpR7MpHmWopZVVTLbmYL2o6XQ7jpAOIi7MCvR6PMCOi8uS12hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709303982; c=relaxed/simple;
	bh=hhOiuxD/7I2XtZlyGE+8MWxyIp1mdrvLK5p2WFjNQkQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kM5d0BsBkrcVOxh1lS8YT7o46ydUzuisebxpGJY4qLU53uQlAChxw0XCpxzrUQbWtADHzsGF+SsvcL+vLNYqC2pjKgbvswz7dDf9KWUP1P9o4YOCtFj4l89sgdEKzfGLYXXm2o47Sn3LbW2kKDsO86xhNWUHYnPd2vSi/55G8ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d7x8mjPl; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dc6d9a8815fso2260753276.3
        for <linux-gpio@vger.kernel.org>; Fri, 01 Mar 2024 06:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709303980; x=1709908780; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhOiuxD/7I2XtZlyGE+8MWxyIp1mdrvLK5p2WFjNQkQ=;
        b=d7x8mjPlL5cqjpENIzqKjoLCfWObvxJ6sKDKgPtdJStsPe0E7i458BfORbHxeKWziA
         N5GrrPgeX+cNllhf5mxit/lqLaG+foNKaD/NOB5Jl+GUWW9dxtlF5XxpvOKjON+bmjg1
         60v57kzlF6UIR5H4m1qlycZu43ISBtkzOhA5OiDFnBowPbzrjFnxA2inE88onpesVEWs
         tdAghWAJAPQsXCCQVSjs2rb0KSeOU9P4ku9ZcQPFrEGy2ZVVJKgmMOI84z4Xbhk9UJH+
         TFUMcumWVMhO71w3uGilZX86RqPU3VDu5KFGxWueXkb3dFKvDxYr8R7Y/WvQLyoGgx2a
         Oe0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709303980; x=1709908780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hhOiuxD/7I2XtZlyGE+8MWxyIp1mdrvLK5p2WFjNQkQ=;
        b=NY7hXsQ3c+tSo/DK+tBRnT0+kdEs9pzNg+KOOg/8TJ8qdrpHfxqHuG8iwsbkVyAn9d
         UpA2dDrP/pdt5LTl3PKoMeNdnuIv7WZ/ILjbXVmuaoqb5UEc7VrnF6LQv5w7LQfzjySh
         aKrl2MNCQo2X7bUdvyQxdOUrm3M8kEB14fUFTfK5S1xh4X0MyyeOhWVXUBgywR8saUh1
         +14w2rdjyxbiGvQaQ3kgh3QLJuNbrnBbpYp9IVnv/eNOgXZXSb4CZHFzEUFsL37wnw1n
         nT2dvsdb3eArEt+eakTrT2PFA42WqBq4RXRpocVWXHfe1+HqDZQy2NeKSfVtFExoqBPl
         yMUw==
X-Forwarded-Encrypted: i=1; AJvYcCVKkD0pd9fK/H8YPSSly1/oQVlfqVV12wSMpi2I0b1nx156Hjoj63tnRd2vde0vi0YlYfW2/5faRswlLKJ6bViS1WBFY56V5OQxAA==
X-Gm-Message-State: AOJu0YzxbBxc/7W/rUsHgL4WbdtzX47PBsDN6j5GlbHLfKMPVKl27WB1
	Dk39SGb5ioEsTL/VolWGZIN/jnNd54z9fSb/G79eVkL/jbP+I17qpGD3/b5LgtX7cpGGhWwrOYJ
	dS9+fYyycAFI7SRfDSY2ckiBEBG9UTuKDM87cXQ==
X-Google-Smtp-Source: AGHT+IHk/6HtxsiZdN+Qd0QXXpvSBbg1h2sMTZtFLQ6r2OIGZks/3qDqGmIOb93W+LJfhpd4AHjB5kBTgFcpcAPar8s=
X-Received: by 2002:a25:b94e:0:b0:dcd:2f89:6aac with SMTP id
 s14-20020a25b94e000000b00dcd2f896aacmr1557192ybm.10.1709303980278; Fri, 01
 Mar 2024 06:39:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240301-mbly-gpio-kconfig-fix-v1-1-2785cebd475d@bootlin.com>
In-Reply-To: <20240301-mbly-gpio-kconfig-fix-v1-1-2785cebd475d@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 1 Mar 2024 15:39:28 +0100
Message-ID: <CACRpkdaBsBNb7r788V=dNeNuAANfS7MWvyFNHYq=spBk6Qj4MA@mail.gmail.com>
Subject: Re: [PATCH] gpio: nomadik: fix Kconfig dependencies inbetween pinctrl
 & GPIO
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 1, 2024 at 11:39=E2=80=AFAM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

> PINCTRL_NOMADIK cannot select GPIO_NOMADIK without first selecting
> GPIOLIB on which GPIO_NOMADIK depends. GPIO_NOMADIK depends on OF_GPIO,
> it is a direct dependency.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202403010917.pnDhdS1Y-lkp@i=
ntel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202403011102.v8w2zPOU-lkp@i=
ntel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202403011329.1VnABMRz-lkp@i=
ntel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202403011546.Hpt8sBTa-lkp@i=
ntel.com/
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> ---
> Test robot usefully reported four related issues; see Closes
> trailers for links. Here is a proposed fix. It applies on
> top of ib-nomadik-gpio [0].

Quick work!

I applied this patch and pushed the branch again!

Yours,
Linus Walleij

