Return-Path: <linux-gpio+bounces-10276-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6026C97CA84
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 15:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26029286214
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 13:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 131D919EEC6;
	Thu, 19 Sep 2024 13:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Z/J+RY3q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFB71CA9E
	for <linux-gpio@vger.kernel.org>; Thu, 19 Sep 2024 13:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726754038; cv=none; b=QU+hjZ5k/oJyDrzodYuBR8BZWt+U/Mp9K9b9X8nfzsJwLWvnk40RWOzhLhAELYH8M4VbWLKtZX7U9/YUSjSl7X8iK26jFG9RbIOjCEv+VVYnuwSX7zfpZc2GSlqqHZMCpc7RQGrlxkQ3g2aV7AeNqEaO/558/gmJTqC+rvItDEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726754038; c=relaxed/simple;
	bh=7gEmw2y9ALNc1z4q3KCruNUPoOfopCSe5Hleoao9w04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ttoZGuLg4FYYVsQMFw+FWY5UcV9oPYjKs3UDOCO9SsY5QEM2sE5fFlZTAe5kWADnGvw2X0nEiXGVvuSoTuLGdnoRNCy1FzcLugWEDU4tUaMAPsATF+sSEZQR1fjlAChmK72e3wiQDDy0jxpJ9RinfAlLGG6eh3fovb67r8nSKbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Z/J+RY3q; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f753375394so7083561fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 19 Sep 2024 06:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1726754035; x=1727358835; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZ7C+kdc8awhvK8nyEsAW9cEkfOev2bLaZCfNgaDnt4=;
        b=Z/J+RY3qEP8K7+WrBgOGNymFoomS3N4grtpq1VVI+Mh48w8rzlGwInA+KJcREtsjFT
         Kq7UE6BWl07MQoRKB6mxLxrSDFf+Tn5EtzHRQsUqkNj/Bx0hajUP66Y8+pv2lt3PSPMS
         SYXRn9VLzcn2YeuQeD9GYr8ttS14NW+jAcCxK8KMYLkh/a5LZMyMpHK8rDhSLO/DZpXI
         Q9KHxvF1Xw9QWneTZ5s224FTobdIvFVLObJPL0xs2vplPdS2ZrxgU4xiWiJzCPxCkZX6
         Yub+WhOONh99eONV04R0iaYIiJDsHmY8RTjFBugPpNnmL3ebd8FHjms5dK9T5p2tJQ4P
         9P3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726754035; x=1727358835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lZ7C+kdc8awhvK8nyEsAW9cEkfOev2bLaZCfNgaDnt4=;
        b=L3SLtnqhPoMIRlvmCAdRX6+Jjt1QDi5VQuoTuKdcJE8xRp2MftacZuh5Q55smInVde
         0lBfRsyy+/T3kUWYJBtR0Yp/Sw2ytHT1QMnmx1E3hJnTW6IY4MFLxxV00zMJwZwzAY0k
         KFAsciVZOBXaZKfTbw2AykYW2PkFXMH6yYyMdkArGHiswBhy0DJrz7EnwrftW7RhrGKa
         sT7YmST4KWQGV3zOP/0fMnnf2Qc+3O9VdJ6uATlC3fjaSNbFfbDW4GjIbhPrOiETt5Un
         ezh8BpENgtK6E3jhTWqmgAA7h7Ip3fbegMsLkQomzMhJo9noTUykq+BNBCcce73mN6oN
         ssIQ==
X-Gm-Message-State: AOJu0Yzz1WtTjdBuzrGp20XO96Y7C4MAU3dbOmKZ8VbSLxRW8ocoLdW/
	6TMgDOdIlJ6M7d23G/dq3dDd+gDnN/39kAB5mQqwGJbEccmYgIheaKhxhmZs+65tqoBhdMYWqIc
	BJ0MKnyWf8KJR1vP82V3/Zn6TJ0U6ogyL/+ZHFw==
X-Google-Smtp-Source: AGHT+IEAqPvenK1Z5TacImTAUNgsMUVHe3xRbK2jF1vErNhwsnJosPXPzIqcaRnxUXR9nRojEUUj8o4NpdSjKFv5AFg=
X-Received: by 2002:a2e:be86:0:b0:2f5:2e2:eafb with SMTP id
 38308e7fff4ca-2f787dad3c6mr152309911fa.7.1726754035268; Thu, 19 Sep 2024
 06:53:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240919111324.10117-1-brgl@bgdev.pl>
In-Reply-To: <20240919111324.10117-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Sep 2024 15:53:43 +0200
Message-ID: <CAMRc=McyND+2SN_uNJMiveCPm7RJxF3V55GU2NLhkydoG9m0Hw@mail.gmail.com>
Subject: Re: [PATCH] gpio: free irqs that are still requested when the chip is
 being removed
To: Herve Codina <herve.codina@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 19, 2024 at 1:13=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> If we remove a GPIO chip that is also an interrupt controller with users
> not having freed some interrupts, we'll end up leaking resources as
> indicated by the following warning:
>
>   remove_proc_entry: removing non-empty directory 'irq/30', leaking at le=
ast 'gpio'
>
> As there's no way of notifying interrupt users about the irqchip going
> away and the interrupt subsystem is not plugged into the driver model and
> so not all cases can be handled by devlinks, we need to make sure to free
> all interrupts before the complete the removal of the provider.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Herve: if I say I'll do something, then I'll do it, no need to remind me =
every
> six months. :) Anyway, this is a proposition of fixing the resource leak =
you
> reported with gpiomon in a more generic way so we also address the same i=
ssue
> for in-kernel users.
>

I noticed a problem here so I sent an improved version[1].

Bart

[1] https://lore.kernel.org/linux-gpio/20240919135104.3583-1-brgl@bgdev.pl/

