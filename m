Return-Path: <linux-gpio+bounces-5703-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 213508AC0C5
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Apr 2024 20:33:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C94FC2817C4
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Apr 2024 18:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4B613BBCC;
	Sun, 21 Apr 2024 18:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FVYxAKZN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B372524C
	for <linux-gpio@vger.kernel.org>; Sun, 21 Apr 2024 18:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713724422; cv=none; b=Ow8Am5CAFTC7r77IJZkiI2Px9cRzGmOFqE0IjUzQy9U7ydVFXk6iBfp2Gl/y18IvnlME4s7nmMHoxth5wuumQQN4yAphCe0gfzlozoCQbOyTJEhi88wD8FtQYrMe5GO073ur0PPO3MNdR1jWDl1VPC0iQ0w9V/keqNL048c8xeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713724422; c=relaxed/simple;
	bh=hsd0XsngwlbXYU49bRdK/iSsfg2UjS5QGrVkSmQDT4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sMTuNfKepUG5/oGE7hu3+eN1SIFaJY2TSsiy57+INLE/zcYeV+CUMrWXvJg/BFlI63qdtLg7FsnT2+1fZ3oFR+zpKf8EjVKef+iPDEvtR/kJXV+m1HGWheLwchs9oYvxyvKSapDgB0N8AiD99sDzVgCvBxYXOltutGwE7oR/wzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FVYxAKZN; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-db4364ecd6aso3604480276.2
        for <linux-gpio@vger.kernel.org>; Sun, 21 Apr 2024 11:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713724420; x=1714329220; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hsd0XsngwlbXYU49bRdK/iSsfg2UjS5QGrVkSmQDT4Q=;
        b=FVYxAKZNvxVbI1Pbq7z6uyjuRz2H8wGO22Xzf/79tmrb38tSFBLWJr0ctBt0RTEkj0
         wEkodXUqSxLrWEDakRzq/7tnBn+lHOHuBPb8+SVLlxBrb8HqXviMT6LLRCRkQZ+R1DVS
         yz8HIenw9ZpvmMXUue+h4hmIpsEIVeKJ2rqgtvpOmk9S5yul+sRd3EibGk/hXcexRzHa
         tSb1QFCRMwOdH6KhMlkOSxI1Y7TNqJk8Y395IT+pXKe8q6MSYNZqHpxdHq1OyjTbSAnF
         nCUlWlGDuXaV97r10gy+AxCOK02BpTEjWDIA+OQv59zrEtm+6x4azSiZ5IgudCdLDY5Y
         5saQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713724420; x=1714329220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hsd0XsngwlbXYU49bRdK/iSsfg2UjS5QGrVkSmQDT4Q=;
        b=DPuk5ObmNiIoe7CSwYEjv4RrYhxVNSJw/YVeuVzer1nD1Ta/l92wPwkWWM2kBtpvcq
         Ue574q2WWcY+vqs1sGaeUGBrdrvEXIdtHsPgnmfUgUF/0ugWwxvLzzLDbmA3ai4EwXqw
         hFyPQIomi/k84aDIN7AeE5Q/I/+jZW8Zw7P/lW+qiDWJoLzlc9NxmaliP4Y1lpnU/1BY
         hBipAk6QyS81X7vZoJAuneZPgjBN5PbkIIzIwOTfwWdHUZiyqcjVFSncU2UHSmHUddp2
         bhV7Y6IJ6gLkibvkQGs+vQLX30VgYAO/pL7s9Ibi6bKJJjWazzrG+x/+hJzic92DojgI
         wNkg==
X-Forwarded-Encrypted: i=1; AJvYcCWqOqt0BhoR0OdBnAHs0cutiCTawLfSnb5KavHBCAQ7xiqOvKldUaD6lz2EZrgmwqSZg7ocz9i2Q+eZBIwLXJ4GY3RvIrS6RMOMcQ==
X-Gm-Message-State: AOJu0YxUnWpf4+TAzikvsb2xy5JgWk2odOWwSqE5BacwVXT8SF32rfSZ
	YJj93eRmfoOjSPP1UC3EsVlfMres0OUVMVgy3KjEO8YIiXX4GoJt0jCJgLpKxviFp8/ggpwBRRv
	/Vslk0Yzq730JlfZxm3ARoaYXYLoXB16eC9vO1YsW0VMs5u+s
X-Google-Smtp-Source: AGHT+IEBVUribVSY4UKaYpUkmakZRxw/KOBF8S3bALynu/ZOsk+rr2ucErnlvDBowMnVOwVfVqBQlASGwJRKpPIpzuo=
X-Received: by 2002:a25:b222:0:b0:de4:8c46:e7f9 with SMTP id
 i34-20020a25b222000000b00de48c46e7f9mr6363423ybj.31.1713724420140; Sun, 21
 Apr 2024 11:33:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240419080555.97343-1-aapo.vienamo@linux.intel.com>
 <CACRpkdbSB+JTdhGXViWs-SmR3nUnm6dVXt3WzK-d4zFSz63XxQ@mail.gmail.com> <ljyjvdtzhgug7frkiwbrvobbusnzqu5gpn345n5bjsmbuw5gjd@xex3dznz5jov>
In-Reply-To: <ljyjvdtzhgug7frkiwbrvobbusnzqu5gpn345n5bjsmbuw5gjd@xex3dznz5jov>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 21 Apr 2024 20:33:28 +0200
Message-ID: <CACRpkdYKo+HTwrm1BssJ9nm_xsGFsdRoqDkJWJMETTL2fwaP2A@mail.gmail.com>
Subject: Re: [PATCH] gpio: Add Intel Granite Rapids-D vGPIO driver
To: Aapo Vienamo <aapo.vienamo@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2024 at 4:43=E2=80=AFPM Aapo Vienamo
<aapo.vienamo@linux.intel.com> wrote:

> > Can you rename this:
> > gnr_gpio_configure_direction()?
>
> I do agree that the pad part of the name maybe isn't the best, though
> this function isn't just for direction control, since it's used for
> setting the pin output state as well in gnr_gpio_set(). The idea is that
> locking and masking of the register accesses is factored out of the gpio
> callbacks and implemented in this function.
>
> Maybe gnr_gpio_configure_pin()?

gnr_gpio_configure_line() in that case, it clearly isn't a pin since it is
virtual and for that reason called *v*GPIO, right? Pins are a very
physical thing. It's that kind of confusion I want to avoid in naming.

Yours,
Linus Walleij

