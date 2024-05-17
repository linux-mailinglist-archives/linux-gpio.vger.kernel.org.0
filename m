Return-Path: <linux-gpio+bounces-6424-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D58F8C8412
	for <lists+linux-gpio@lfdr.de>; Fri, 17 May 2024 11:48:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32C2F1F227BE
	for <lists+linux-gpio@lfdr.de>; Fri, 17 May 2024 09:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8689423754;
	Fri, 17 May 2024 09:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nHBv+HMz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5AF2260A
	for <linux-gpio@vger.kernel.org>; Fri, 17 May 2024 09:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715939282; cv=none; b=fquBCWBpsY03hnap6apM/nL8GrJyPL08Q+WZ84tyVOsy97hBkqOhdGQXh/3/ycQf2M32c2B0a/ZvnJ9d8jlPy5xf5ICsyjY0P996n43Li5E+Vievq4SOtuUdIGh0YUVZ2HSzcsnjy2snrYtQa/K4ixjYkW11BX8FcVOuitMA1Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715939282; c=relaxed/simple;
	bh=rUfteP0LJ3K2Y4OqPDdtCf6B80qEUl+7PxmAXtpchy4=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WrLOzwWw5IoyapYzVkLXUpeXyKOseDYZXFtKtQjc2E0IfE3uFaQPboOQ70S24TaDFKRi5Du7ujUrSzaiNZYLcC9cljVfBcXThoJ5WBr836ateta57vFf1SKKx5o2xfBEQGWipB1nsVoyGjJvpblAYeiKkWW61BRgYpEf6MN8zDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nHBv+HMz; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52327368e59so1861851e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 17 May 2024 02:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1715939279; x=1716544079; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rUfteP0LJ3K2Y4OqPDdtCf6B80qEUl+7PxmAXtpchy4=;
        b=nHBv+HMzUl57WoAept4mbbccGc+0hE7lSEKRfqClai/uYn8sxxeKjNdH/SKmGm5K9k
         dEBooBGYFkmp9hp1ANvlGdazulWu362HaIWs3VJiEItciffuHzJmCBH9O5qorcoY5oqo
         IC7yfM6ZQ1/0zlZE2q3u28BiX68kt5S+I+zXih9oWEZzFymhdXyqiLPrfbUvWNiye/Kz
         6FIkqED3gRLkVfVbcrNbEiouwIJynliuzXBSNQRCoOwQJDuuJ9K3v1/xXOkaSicTAxc6
         Im3h+bM28ptazLHnwayeoMIN+KXeV0cKlTAtXu3pImVpL1hlf81HAoZ2mJcS52nUIAHS
         ep1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715939279; x=1716544079;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rUfteP0LJ3K2Y4OqPDdtCf6B80qEUl+7PxmAXtpchy4=;
        b=X27Lxda4jRoJwxUCULbawFlTG0Fdi8KzygDPJHRzqH+okKg8riF+ZTkxhDcVsj1GNk
         pDDURuIK0aS/xI/3WVnLdKRPoYeQvu6LD6ug/dvjVql0bH+DysDFmZG6Y6xq3xWJ6jls
         gwsH1S1UqntGM8bGCVQ1Ka5MOXyqPiPV3n5PI7deHo/IWxAJB2aZwIhgF4d36pZs6le/
         BE+XAbXhe2LDWa4/VNFjMOJVe2/gpZVyOAhkT/amq0rw3drS+WbMmvRTqjXb+2pCGsb0
         USfCf0zvh6vZKm8ONVsFw+i5/7iht19qCZrrQHs/K9GAg02KVaZ05dLI4H0sPepMInii
         3Dew==
X-Forwarded-Encrypted: i=1; AJvYcCWrQIA37domRcl+RCMozCalmDkjm7Da9RC7U19P+qWkyWxAv4vyCl3fLxIeuXAGKu8lusPUjwH+D37D1kegHrEpAGPg+74iPQSAXw==
X-Gm-Message-State: AOJu0YyFICmerIvewQ+WYXszfV3jursKzVK9QfIruLKIRdRPXvmjIlBN
	Wma1QG0gSiJ+bH0EmOROJaVnjTUuGPQa+sxOFqcHu98b2jubAgZEypbQbnyvuJAKWPzR+E4ubiM
	9b2o3yVueDDttB1MAiUw/VGmSjQvXtaX3iAMa2g==
X-Google-Smtp-Source: AGHT+IFlzJPWRpHrqGByKZ4H5QNTQaquVeP+Lx2nIeqMnc82ZPWe4UEVmOrLeu6xqSeYSzujhT+d6PW5+Q+iNITvCTE=
X-Received: by 2002:a05:6512:a84:b0:523:b261:3ddf with SMTP id
 2adb3069b0e04-523b2613ebdmr4377606e87.32.1715939278759; Fri, 17 May 2024
 02:47:58 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 May 2024 02:47:58 -0700
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <ZkYQHnF76WLIf8-r@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240508101703.830066-1-andriy.shevchenko@linux.intel.com> <ZkYQHnF76WLIf8-r@smile.fi.intel.com>
Date: Fri, 17 May 2024 02:47:57 -0700
Message-ID: <CAMRc=MePRxKumCTQ+2W3Q=UgSetAkAROGRWZApdTcn3dRj79WA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: Remove legacy API documentation
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>, 
	Vegard Nossum <vegard.nossum@oracle.com>, Kent Gibson <warthog618@gmail.com>, 
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 May 2024 15:54:38 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> On Wed, May 08, 2024 at 01:17:01PM +0300, Andy Shevchenko wrote:
>> In order to discourage people to use old and legacy GPIO APIs
>> remove the respective documentation completely. It also helps
>> further cleanups of the legacy GPIO API leftovers, which is
>> ongoing task.
>
> Bart, Linus, Kent, what do you think about this?
>
> If there is a positive consensus, I would even dare to go for v6.10-rc2
> with it.
>

I don't have a problem with this change but I will not send it before the
v6.11 merge window. Why would I? I'll have it go the normal route, it's not
a fix.

Bart

