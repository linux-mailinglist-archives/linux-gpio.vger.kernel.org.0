Return-Path: <linux-gpio+bounces-4205-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E398751FD
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Mar 2024 15:37:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 499FD1C229B1
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Mar 2024 14:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 127ED1E867;
	Thu,  7 Mar 2024 14:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mEGWb/ub"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387791DFC6
	for <linux-gpio@vger.kernel.org>; Thu,  7 Mar 2024 14:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709822191; cv=none; b=LgzTcWhiDmWwnBIkuGPHw3W4Qg3Ku1WTocZst3EJ9HA9ZREoLk9UFvYl2T9xuk7UlojjhgcfWr8gskDJBlgsMNQOvMvowBdOVc/mF1BxYLAaW/tpo8FxIU/4cxoR/RdxE8oJmNYnvhOqBheYCN6+zs2KCbC3CdrKDSI9tiqJbBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709822191; c=relaxed/simple;
	bh=RdZjTpDJtzmsKAMiw+aGwZusF0XSscBClg/ZWlH4myQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q+rvhJinLDA0gX3HK9ZFYgeY9vpgpZB/Ibu+QsRbL37oWK7RozIXrfmZ/ReCUTvsbteVt759QOoNMJY57B1RYbMV8S9GElOY7lF0AZ4DtGqqwWfgYwgU05pEPP00iXvcOZC68ycWLCbOwKcacT8VyCc7FxHFwP7XYhz38X6HRKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mEGWb/ub; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dc742543119so926217276.0
        for <linux-gpio@vger.kernel.org>; Thu, 07 Mar 2024 06:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709822189; x=1710426989; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdZjTpDJtzmsKAMiw+aGwZusF0XSscBClg/ZWlH4myQ=;
        b=mEGWb/ubmqCtRL/r8UODsp4t11BN8h4AVwm6nCtiC8J8Pt5QR4D6vtXNCqkCGXykcB
         mz5zeybijYe5GRTGmsYzRtwUmmb+2NepLuAFdkKcDTP+QEhUkPWFxMyxuV+DeCQGDfN5
         2OKnTXLMIETTqxTfSPCc/RdqF9boKKmGzN1uezNLJUDvY138bFi+uSKJlg2XPLmzgQeW
         sEj049jdatsf8lOE51oiwB/BYHdwybWN7F//tVTJC28BIZiENJyHG1LuIwsQCmuPx8kF
         ZvMfjCPGUjrBijBcIj52HKXZ6IpH+lcABBczGFP23kdg3/dOik2Msd0/alzwUGXuWiIN
         x3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709822189; x=1710426989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RdZjTpDJtzmsKAMiw+aGwZusF0XSscBClg/ZWlH4myQ=;
        b=In3pyQh/gPcLGvnuZUNxXI1J2UL8pZvZc/6kXfrezxeKyj5GmJGRV6lXVPHyGwY0Zn
         sWULYEXvjcJLzyNJHo6nPf5tMm7Bgt70QIkTh7Vaw7pUvLh5zqRT1DbMHxXzSwJdO9kr
         79G+JiO1RKAZwGSUFCv4PX7lwVXNnL+JLJ3U1vwt3X/ZKinud4h1jbZ2iZkS4WD4lRXC
         eCcK2EIqJII1nQX9pP/m1tLK8HjJwM0VOGod8m0mdSggBcxYBvbHieqMXnyQi8sTEE1T
         n4HIupnYlABvZDDWttl289dsGRy7WKElX0QweZZT95lr0iIlcJaEJfSB+W8yxYQvmRfn
         ncAQ==
X-Gm-Message-State: AOJu0YwIrnxuE24DSQdquygSbUPmPhUsf8aKjBFC1+lQIh4x0+RQ61Qe
	49Rwu2Uet3uzkjnwgjoayfMtv58RRern9V7kRTYTNDFCK8p+qTwV+C3m5ocmgDS0/Fj8PRVY/Xj
	5H+uJryzuDAMT7GPP04lN5I9r9xPjaJuhgWVYtQ==
X-Google-Smtp-Source: AGHT+IGhwp9+i1EovMeL7O79DpNpuhC9nVwzgcvvbTtNXf5Mnu+oIU5/6z+8bMnsrA0eesmXP0IAOqR6f2u3zVYn5rw=
X-Received: by 2002:a25:2fc2:0:b0:dcc:a446:551 with SMTP id
 v185-20020a252fc2000000b00dcca4460551mr7674950ybv.52.1709822189305; Thu, 07
 Mar 2024 06:36:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240307135109.3778316-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240307135109.3778316-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Mar 2024 15:36:18 +0100
Message-ID: <CACRpkda6bykOFY6gcZqRKLAnprUooZooQ_g7Rj_63da2akbwtA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] gpiolib: Get rid of gpio_free_array()/gpio_request_array()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <siyanteng@loongson.cn>, Hu Haowen <2023002089@link.tyut.edu.cn>, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 7, 2024 at 2:51=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> There are only two users left of the gpio_free_array()/gpio_request_array=
().
> Convert them to very basic legacy APIs (it requires much less work for
> now) and drop no more used gpio_free_array()/gpio_request_array().

That's reasonable and makes the kernel a better place.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

