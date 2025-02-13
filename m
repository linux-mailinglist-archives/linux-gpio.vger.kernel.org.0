Return-Path: <linux-gpio+bounces-15904-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F6BA33DF2
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 12:27:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F34C7A47EB
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 11:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 202F0227E8E;
	Thu, 13 Feb 2025 11:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="psBlelN4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AAA227E8C
	for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 11:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739445908; cv=none; b=LG1acLO8s84veStDYtIaKQW7CQoZQ/iXzlQP9sc0nUaFX6H/QhnnfPSss66u1xzYLX3raWSa6AMKR9Qazr4V5Q/lS+afXFhN2jxb35Ihmg3xW6cBGOJjyytleNCfv43iev0BInLtvW2LHy0Cl4j+2RPu3g5PIeZYIuXomaI1nU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739445908; c=relaxed/simple;
	bh=s1rdJ82+NANjUQkHR0ttFX0KL4WEA6yeR27UUOtKMQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YKjKgZishGFsxWovqi3OrWVYmkYmPX7ddu0sbjymgZusCPsFF9APnTORGDRrO88nneCeqic++5MOQHHWBdx1zU+3wmD+YBhKqnZlU+noB1V6RfX984MhL/YywZYx+85jrnGqebR1JcL74Yt3HpzHtcm1+6WGtwz5js6vLqkfQ9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=psBlelN4; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54504bf07cdso726880e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 03:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739445905; x=1740050705; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1rdJ82+NANjUQkHR0ttFX0KL4WEA6yeR27UUOtKMQc=;
        b=psBlelN4kYetFthmaFFvgXPrugNRW/inyLhUMRA+txlqU/VP9ZTlQtQPxUPYYZ1IMC
         oAvi6w9ez1lL2/GokJ/CkLkgr5WW2KmlJifFExn76OadlFQwuVclW/IZBuLBwNmbVZM3
         gzeDHkNryB/krTQQ2vKE/YRGxGd7MLMn2/rYjgsv44Rcv63ZfM7oJnkxfENG2C/K8ciY
         zAd8YvV6B0z7kPPngpoHeS3fIiFzObV2/A+S/KMrh9ZdaDC3DCSOVgJJbV1ssinFC8jd
         UauL1vf169ZJBci0kPudIe7e6DRYM6TSN/eaLGJ9epUcrxFL6PhlvmgccZuu7OWpfgyI
         izGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739445905; x=1740050705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s1rdJ82+NANjUQkHR0ttFX0KL4WEA6yeR27UUOtKMQc=;
        b=tg6S04+W/19mUTDMQB8nWhJf/HYexZMBjWwhFf8TIWbxFnjSo1r3ZVkazwhd1CXGme
         m8MRc7q+qvDeL6UnaYACUi09umSPPlwnq+flEkzxwWSKQrWBiBl/+2aaoztyApvz1WKH
         P8X0l8CuD2PAV5FXKrdpG8Ae+I6dr6KcXa6FCyBt3cWg+6EH2brFXEglF2vRnjWkrlaR
         p1/h0ykm600X6yedvbWX2zCFcBUGslYu1jzsVaqg6gFE6xf6m7oEhyelBqqxHvV4Jwia
         j+3ex0RYlzcIc/2pKHkOvUdmqfzHdLxj4Yy5iRZLhzI9cqmgAMZL8JcazwjdzK6jOxwK
         UuYg==
X-Gm-Message-State: AOJu0YxNRe58Bl+/sA8d6OIf4UHx/prfRKt+/MvsyPiJCffQhDNwwo4K
	hIZPNNg7EJZLTHBsmj3+uIy6wKWMkzmOH0IjZAlxxRE/nuXIC7bdShpTiKxqrlW4zTwFqg5ZIi1
	Kyq0/x0m7dNNCBdCJ/rBqfx5KZPYHwUDcEj0+utQ0Gqbf5pdG
X-Gm-Gg: ASbGncvdU2MPOtfun7yjksMgDycuRA13Y8hkP26v72o03qU2b6cJxjM/JD3t804yv2B
	T3q09Tbd/nNw6PIxBKr0SmBPUiE8gTfTWfjRlnVjUp5Fvx0IfWo9zMTk7U4do+GoSEcsv5rUe
X-Google-Smtp-Source: AGHT+IFktKy6Wuor7cNa66dzv77ajfDt6SmMNhTfLhHQnhN5+kYzTFtUtD5chR1OHhadebUvnjmNx8Tz8PhELnYt1PE=
X-Received: by 2002:a05:6512:2386:b0:545:a2a:58c with SMTP id
 2adb3069b0e04-5451819518fmr1568955e87.53.1739445904975; Thu, 13 Feb 2025
 03:25:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z6nHVEB85AQE-rQE@smile.fi.intel.com> <CACRpkdbUCjeJXkc4iBBqJFsQ3sEbiv8HO9eh7ft5dAC88f7XSQ@mail.gmail.com>
 <Z62mK8ZUr3IDzewt@smile.fi.intel.com>
In-Reply-To: <Z62mK8ZUr3IDzewt@smile.fi.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 13 Feb 2025 12:24:53 +0100
X-Gm-Features: AWEUYZlRG-UEmNkBa3iB2Z-Wu5Zo2zKKHxMM-WRstpzXcdeckj-XnDD3HCBlgYU
Message-ID: <CACRpkdZuv2ynjyoP6NsvfQCeno=hFdS+_pGiURoX_tx0SRiwDA@mail.gmail.com>
Subject: Re: small brainstorm for the problem I have
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2025 at 8:58=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> But this sounds like we would need some kind of translation quirks done i=
n gpiolib-acpi.c.
> In the similar way as OF does.

Yeah that's what I would do. You're the maintainer of that file so I feel y=
ou
should do what you think works best for ACPI.

Yours,
Linus Walleij

