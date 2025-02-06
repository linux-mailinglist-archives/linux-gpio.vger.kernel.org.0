Return-Path: <linux-gpio+bounces-15428-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA26A2A492
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 10:34:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF4FE7A165A
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 09:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 483BC226167;
	Thu,  6 Feb 2025 09:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="myoeHHPs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9C722619B
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 09:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738834292; cv=none; b=Pqnrtnj5PmSIZ53Qgb/Cd3QMJGlCUz0XUTXxD/KdG76Z9VNYST2sixqL079hFS8QaBlxPXaAeknPrBQrV/k0kUbIdUL5KlcfCiCQ5iUs5U1GjDY4XYq078J/TdI4x1w4clvG6IYy1MqEGP21IlNu5b4XWen2tGiUFJ/vn5azehg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738834292; c=relaxed/simple;
	bh=DDYhcReaqTeAJ8Ct+nQyrID5qgSTAK+HyqV4S88yu+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gkibBTFEIKWLfCJYvY1F1Nq8/W3tlezjrCsEXJUS1UO+z655sgQDD43sDEnC95Tia0/0P+7xDqz+qbYP/DXJKHPKrk2p6XzBa3JOzgveoGlMmfdJhls9DEAJp7avPrcP0aMktyZX+751suvSJzahUt+84gRYmOQZVNMUaqdjzxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=myoeHHPs; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-307d1ab59c6so6229491fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 01:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738834288; x=1739439088; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDYhcReaqTeAJ8Ct+nQyrID5qgSTAK+HyqV4S88yu+k=;
        b=myoeHHPsMkmeeFshyk6tSKm+qtyjtMLf0z9k9jGNRWGWsvZL9TxFv17uz0SFiAwbCe
         ul5R7qWdcpVgxpGxqBypMvzmeVxGQgMptGGp/IjF5zm+cwt6+rmGh3S/yYkv3f4E8mxg
         +oQSZGbcOZfVcNCJXiYqfWKc3JUeV8cG22Q3eqsfRDulg/XdlWBpbnv1R/WhpgrowAZJ
         DVt7sTbcStNBPV5JtrQ5yZRWHw/3PmydUKw4RsckQb/QB0fSPNbdLXNDERjG6ZGkSZ5k
         WTdfaaIWA6yByLUWTfFOJkDns0iWjBMYSHMODgXDfmmTYucgzSb2weLlU/2ufHjMmjd7
         WxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738834288; x=1739439088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DDYhcReaqTeAJ8Ct+nQyrID5qgSTAK+HyqV4S88yu+k=;
        b=oxuH+uPHUu7RIP0KkWPab/AsEXAIjXbeUSj+vicQEvrcChjMeQ80yq1G3jvsxMLCS+
         7DCFE8vKh+y/DQMEIrtn8Pnga9brjJ3Ckvap9t8eyLYH5B8G3wYO1AHyWQUGWXFSW6A1
         A2T17CFJ6b9Kd5qrTZLaoUab0zOmwBh4R0jBgFQhgKkVqa/e38vVMnJSJV3yGmkpEBA1
         Qv5ujbQq5PA4n0Sjdfv8RaLcm5qq96/MsprCDIccO+Fzm4AJgfme7dEcXTac1XVhI9ep
         Oo0DioGYpZnnVYS2IPWxH3K3KCJ9m0p4cnKuUfUEGk9IEFcQy4f37e+9y4E+WZztGce3
         9/Kg==
X-Forwarded-Encrypted: i=1; AJvYcCVKbGi7izi7aNhlXCMOIDFugbVV+7ePHt/gjdjlYHmerAj9FFHliZ3Bv7o9mdkfEZESiL8WS6rrnKWx@vger.kernel.org
X-Gm-Message-State: AOJu0YxKf+gBCdJMfGxlz2Njg6zWORK+lvEm8XKYyAg+xi5kq6u7HJm2
	yXiqcXPyrqLbUMIJEACgW+2Jm8FtPDBSUn6t/kFyvo3al+XmRN3qyXxHaJaWRLq0xlnW9ZbR036
	IMcOPxFbUuWTYLGLH4eBauvbQMj4mTKcvGmvPpA==
X-Gm-Gg: ASbGnctGkhAJQ4bZY+Tq2zNWFw24dNEuGmdhzkrhVlne1IyExT+t63D2Guz0No0o8ND
	idopSp6vOPhIZe7nqoOUzNEiPKfJBNgmK28+4BFcLgynyVr277Ovqnvue5etV54j1JuU6nZs=
X-Google-Smtp-Source: AGHT+IHcFWo3xte3K/LEtEaJiM+DRe2msO38SbMIwC0bXZ5PX+6iklANjvHzTB6e1CWVgPfne7+PROlXtmg2N2jgE2w=
X-Received: by 2002:a05:651c:222b:b0:302:3003:97e with SMTP id
 38308e7fff4ca-307cf38c85fmr22106041fa.30.1738834288265; Thu, 06 Feb 2025
 01:31:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129145155.1746876-1-andriy.shevchenko@linux.intel.com> <20250129145155.1746876-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250129145155.1746876-2-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 10:31:17 +0100
X-Gm-Features: AWEUYZmwoTYF2TuiKQlWq3AmlQqyzT0xz3waUTJAiHp5kUR0_yl7mdskuk2sj9E
Message-ID: <CACRpkdZs9Y+GTHLeWBmpkaZrqiJGWj6s_q+6g=kkr7AmmeGMig@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] pinctrl: baytrail: Use dedicated helpers for
 chained IRQ handlers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2025 at 3:52=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Instead of relying on the fact that the parent IRQ chip supports
> fasteoi mode and calling the respective callback at the end of
> the interrupt handler, surround it with enter and exit helpers
> for chained IRQ handlers which will consider all possible cases.
>
> This in particular unifies how GPIO drivers handle IRQ.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Looks fine to me, also 2/2.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Expect to get this from you as pull request!

Yours,
Linus Walleij

