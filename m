Return-Path: <linux-gpio+bounces-8770-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FB995468A
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Aug 2024 12:11:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5579F1F22C43
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Aug 2024 10:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E74C4172BCC;
	Fri, 16 Aug 2024 10:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HfmrIPJU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21E5172760
	for <linux-gpio@vger.kernel.org>; Fri, 16 Aug 2024 10:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723803085; cv=none; b=ezc/hg41tgWM7jq+YrhB4D4B+9+v9cbrSi/fFMzVbQFv4XkXoIAUEvZpMHq+onJmC7u3A9IvY2YyMwY8sTFi753O4cA43S6A/4rJKs7MbITWPJHVLoeNtKaFkTVZbpDW/kIyHeDA//QYYo/hJS4c5tY8nHGxAlyuBdOyB+lzxZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723803085; c=relaxed/simple;
	bh=jgW8qR9dd1GpYhXPsruabtVGV0P70quPl95KW8r73/M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KsS9boKd4oLrG1+kUL42ANPO3oyyx6x25WDwtShIRUMqKBEhwleZE80DMnOUCKHzswBTIjhOMgeV8olI/5ibs1HpWZG3xtToSUuhWVYlWPxyRQamWGQMohwWBE3fyXv1Q8ZwxMAMlMHNJEHhy0nH0LCVhjuPYF/Ih8/V7Vp67Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HfmrIPJU; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53301d46c54so2521626e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 16 Aug 2024 03:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723803081; x=1724407881; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jgW8qR9dd1GpYhXPsruabtVGV0P70quPl95KW8r73/M=;
        b=HfmrIPJUeFGdQACbuIm/vJgTJiMS6/uGIQl6yQY1SXYphCBrI0kg1z8Y4BgK0oRX1E
         X7qPmwzkEQ+GfZAAbnoJtBBoSap7wmU27zbiCjUtSITmuqypFjoTgnF5caRid8JglvNJ
         AhqM2wLZFzp1TMk5pTRtyTjIjrlGrSJ55rSkv46zcK///r+3PBSLhH2lal6Cza4D42tB
         YkJJLAzZCuWTcO7ZFUSonE0koWnF2MzkvnKTftcNVuWSEVwqAbGAXBnCwvexwHKhLDOi
         kmh7Y5vaZmD8IG3nXMkczFHX466Pag7H+5/xSgZaPUhh4R0YisyE0f3PK1FvyVAZKx3H
         aaNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723803081; x=1724407881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jgW8qR9dd1GpYhXPsruabtVGV0P70quPl95KW8r73/M=;
        b=checc/GZmWVLxOoKsxDHYUjtvoh2Bj0DpAcq4Am1oDC2gmgB8Biq3uznNa5ufIY493
         yShtl2Xgwk65Z1R80f0GaMCpRtNguWvKSOmPquYW/ebb5c9bheehcOo65yaTRSB7kaQC
         qAuWMeBe+IpPoxagAit9+dddx7UqgYcNG3tFxocz5V+ZywWxk6nd4l21/nNBF+JqzRel
         UImlYa4CLvsK0Vd/CbWCxh5osGVYyI7ZWyxFRWfbvZqtibLDwLg2LE5mxD2rx3Q+sooI
         XvBW9AqAidWe9cxXXCvbOWnLtmgOFaJRS+KVECsSiGUdfqfWUB0N1SHoDV4w+JU1Im0B
         KL8w==
X-Forwarded-Encrypted: i=1; AJvYcCX3BiPWkmLq7Li2ddD5EnOrryQdGU1Sa6X67UrH0wESG8EsrywYcgYrgGh3gs/jsibbmY+kRCl46h2LcGKiFBmUiIe+xSBxk3+2mA==
X-Gm-Message-State: AOJu0Yzd9N9bvciRoR/6i3zdQkhgDARPN8NJLkeoTdAxXrJLU3G613oO
	RQe87Wde2sCG3rA+a41D7HjcNyzi8NHGCrlBjNpLggsKwXfHyU+tn2AQewpv2lji24Nn+POIxGV
	lBmEHz1Uxbg4tzaqtn6eMlmdhc4kttXyhPuPhiA==
X-Google-Smtp-Source: AGHT+IFcVVXjGoc/qGWPxsaC0pBLaWdPcEgyZ2BKX13uQ6PcUDXE3ldI/yAxzls/u7L0bahDE7nlrnrf5QbmU71tWFQ=
X-Received: by 2002:a05:6512:2356:b0:52e:767a:ada3 with SMTP id
 2adb3069b0e04-5331c6e38afmr1553665e87.47.1723803080819; Fri, 16 Aug 2024
 03:11:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815071651.3645949-1-ye.zhang@rock-chips.com> <20240815071651.3645949-6-ye.zhang@rock-chips.com>
In-Reply-To: <20240815071651.3645949-6-ye.zhang@rock-chips.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 16 Aug 2024 12:11:09 +0200
Message-ID: <CAMRc=Mfok1T4xGvdKa54Hy9BocuFx5g4zrK8eSC3Qivhhmz9xg@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] rockchip: gpio: fix debounce config error
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: linus.walleij@linaro.org, heiko@sntech.de, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, tao.huang@rock-chips.com, 
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com, 
	elaine.zhang@rock-chips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2024 at 9:17=E2=80=AFAM Ye Zhang <ye.zhang@rock-chips.com> =
wrote:
>
> 1. Prevent data from crossing boundaries

I don't understand.

> 2. Support GPIO_TYPE_V2_2 debounce config

Should this be a separate patch?

> 3. fix rockchip_gpio_set_config
>

Same? And a fix?

Bart

