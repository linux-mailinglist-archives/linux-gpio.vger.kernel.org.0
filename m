Return-Path: <linux-gpio+bounces-5569-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9DB8A762F
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Apr 2024 23:17:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB2DD2841F8
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Apr 2024 21:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9685D66B5E;
	Tue, 16 Apr 2024 21:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="iTQO/N3G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22265A116
	for <linux-gpio@vger.kernel.org>; Tue, 16 Apr 2024 21:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713302234; cv=none; b=p6H+ECMGVACMV/guvrr1F3GfbXPUyHZ3+lvyNA3V/A7gLe1cOOy/ixbQjHYUBjqqcrVSMWdBXH6q+2e4Wo2dqS1XH/5MWJQGRNYtdNpb0l7HX1O1HbxZBZW5m/SSL2WJnYQYz+T7cgSEkxD08t3LnwY0lWspN1X42EIHsfTns1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713302234; c=relaxed/simple;
	bh=eW0+TtsohUH9CaW6bbrr3GrY8ovGxIw12PSymqVtzIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fUvzYGC0xGRT8rSA5zn30F1j/Iy3gcCsFos/Sxd06N0Egx/S5ZhsRp9iTq9vt/6E/WJFT6HRbMaGCyUlH2lyDDRDHhYoBP++uWt+nBiFJm+AwTAlDLMApG+UK15phjfj1e9bh7F81ozACrsWmZzQqnnAmsFsxdDAPnVfrX90/Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=iTQO/N3G; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-516d3a470d5so5703108e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 16 Apr 2024 14:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1713302230; x=1713907030; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7VtGiyOmv3LjfZ2ORMBzfO1xFPZa7kUNTsJeqps7G5g=;
        b=iTQO/N3GE3WnTqCk3cq7wwVLic2RScvyTBjmuP5amcWugciuQCAqK4GqNqFnGTWGuW
         coL551Emvpr75xiYFBTDSc/GsFqEUcbDpHHzFWOBND7wpo8T/EVFPRkJHhxQRWU/tDeR
         G2cbSlJ1nmMWaV5oPxpF+9h63EPO8EYJ4GWSILv0PxR/plagU57Gzme6pBneKJrj7NW+
         RyGoaSplAqaG01cpY7WiVN50jCItY6gGVtmg/qIJHjdzMGhP+sGDwGRBY209N1+h54xd
         jue5Ixh18PtSxuF4gtsq/CYPxklV2X5jbT0qcDmkzH/M4KwHfsC43R4VTHRVsOmlspEB
         lUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713302230; x=1713907030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7VtGiyOmv3LjfZ2ORMBzfO1xFPZa7kUNTsJeqps7G5g=;
        b=raBnKKzV+3ppqqP35He9Q5A9hNjEqDQf3nrMRaWr59NTfrHfa+Fs0j8KBSaa4CZHfF
         hyVL8yg5lw+QsUS23+me067ksxYFDKCq0YUQ1GusDRoe8t+nPPBof/tmNzEs5B3D11nw
         hK9NWmT4aIfkpv2MwNnnFOUvyrstEVQNoBEx2ovT7RU3O88Ou/uLKTsA8Md8ysUzIwI9
         tXhCr+7ChPM9o43HA+hp75rhyPqfbt6k5D7a/nHtvm5p4E1KOLlMp60lHAirLlMu3v2v
         rRe7QbsndNLicUnEnWNYjqf/zwhsNz6BsiuRg+BpYrV4jNW5Pc7AlG4A2GBlSo82+YD7
         gwjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuTlZOzz+vSH2Z4LfN7BAE2XDgSo+29J5ePj2Cf6JecV+jo5Q4RCSgw4Jzg8WL4Rfr1EcPb30f/1tWAv/WsE6s3aSdBbftU6FWog==
X-Gm-Message-State: AOJu0YwDBAaCTXNGrXO8DI7KY/qG8eDsCar72NWjQoLy+rNKF3RsDfgq
	ysM58kH+qDcVqwHgTEIo/P8aFDdYz9Kq94eGj7aQZoYWrRLQc8TSGgVgBgJ9MpuZbu099xgxUFz
	hGgqzfBEhArn3EMhERyAHpU7S+71nooiVCDuASg==
X-Google-Smtp-Source: AGHT+IG/dwM3JibMnMy9d0unvQ0xf9KGXFI7cArPxai6hEB4fz+b8Rj2viDAhFf3QhPcQOLzGYmF/+Acs+p6DdT2J/k=
X-Received: by 2002:a05:6512:3d91:b0:519:26c9:669a with SMTP id
 k17-20020a0565123d9100b0051926c9669amr2491258lfv.11.1713302230073; Tue, 16
 Apr 2024 14:17:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240410072102.1200869-1-andy.shevchenko@gmail.com> <ZhpC3lLD-BHqJEZz@ishi>
In-Reply-To: <ZhpC3lLD-BHqJEZz@ishi>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 16 Apr 2024 23:16:59 +0200
Message-ID: <CAMRc=MerqbYue_uubSkr0ta3wr+yQxfFMfk+vAUZa+C2oR+udQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: sch: Switch to memory mapped IO accessors
To: William Breathitt Gray <wbg@kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 13, 2024 at 10:31=E2=80=AFAM William Breathitt Gray <wbg@kernel=
.org> wrote:
>
> On Wed, Apr 10, 2024 at 10:21:02AM +0300, Andy Shevchenko wrote:
> > Convert driver to use memory mapped IO accessors.
> >
> > Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>
> Acked-by: William Breathitt Gray <wbg@kernel.org>
>
> A minor suggestion below, but I find this patch accepted as-is.
>
> >  static int sch_gpio_probe(struct platform_device *pdev)
> >  {
> > +     struct device *dev =3D &pdev->dev;
>
> In general I think this is a good variable to define to simplify all the
> &pdev->dev appearing throughout this callback, but I'd rather have seen
> it as its own patch so we could change all the other uses of &pdev->dev
> at once without distracting from the memory-mapped I/O change of this
> particular patch. Not really necessary, but maybe at some point in the
> future a follow-up patch doing such a cleanup would be nice.
>
> William Breathitt Gray

I applied it as is, if anyone wants it, this can be sent on top of it.

Bart

