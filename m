Return-Path: <linux-gpio+bounces-12992-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 147C79C841B
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 08:43:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5DDA9B21633
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 07:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504BE1F4710;
	Thu, 14 Nov 2024 07:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RIWbPYg/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2281F12E2
	for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2024 07:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731570172; cv=none; b=PI0S80w1mP5nNvxQMCbGO14vNNYhjMhi7oZ8Eqz3jMXrkCjlzwP3HHicMOSNeaaIJZjjEFj/jaTW7h4oftKvXmqe08jz9ZFOel9UuepZKCwSgOffegSjKecmHF0+6i5w/26/4ehCytl/hKS2vXcS/+5j1fXPaYuFQAIp5XtpxVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731570172; c=relaxed/simple;
	bh=p6oN3ZD2O0QulRTU8WYlRPVhheJkgt8TaSsxQASSMWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FSsIq1tqI/HFHpSZDO5QLojwmK5KgEaVEDvX/48TyTRLya7WwelLcBKR/YbsEzJOxXA5oiMaqO5lwnFXvzQoi3/EqSzSN+83uMCl/CN+8x99dt+Hpp9+ZhrJ75IDa9jH7BRNTyKIjJJQcXTyb1pzDeAQ9NapJ/GKPMLGLxOyL1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RIWbPYg/; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so2472971fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2024 23:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731570168; x=1732174968; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6oN3ZD2O0QulRTU8WYlRPVhheJkgt8TaSsxQASSMWk=;
        b=RIWbPYg/OuFsSQsod7Pc4JmwIGsGsIQwmXBC4fxEZGF6xnNtZ5V41TgX8GQ+wbylLv
         vw5b2mKVcsARIIe1jqosNQS8uS++ZuZWUbVCXNQO1HRy1pdyvqx9j9zpAiGmzDEwjjIP
         V4JdFtf5wpQbUPia91yt0Lm3X78JO9MQqcKeOqGRMLyiWQp8MXK5VaKaeEGJGS4wjwZ/
         TeMlr0Ds+RuXXOtt/hU/LOLjPidW8Qu90zZ9zfjJzP0AgKXCfI8d5QD+q1lfNwdnegEn
         nfsz95ZD8uYUKGPVSwusOEgNw1y7k3Ui8IlzXRHIX1GtkEHkUVdEATxJjB39rfDH3ePV
         XUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731570168; x=1732174968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p6oN3ZD2O0QulRTU8WYlRPVhheJkgt8TaSsxQASSMWk=;
        b=Uxu+2JmVIa9YxZnhKzVi9LzjlGM1LcfpeuUTYL9/XK83H/TF3vEh5kKyGYfhdA2Hfd
         MfqggkABjneTRy9/1rOMP5WHGIbEo4GilnwxDiMzYm9JXbP8FOKVlLEfeaGLmKqxhDJ+
         CQxeHMo+CMl83Ih7p4O0izRFJlWQ6FXJbHlJS58f/pu2AXSRqJ9LVrZMt86CD7RBltEc
         YiyaEnzRrt3T8cKipxuWOxt0oR79sVOXWX0qVrOhJD9kHgBP7eGISNOBlonIm8zvNcVm
         wkxKpDl2Z1nsXGEVO37QKseyroahIkftrVRidSUgLONZgcNxvGgqJU55WhezQ8zxYBFO
         AMnw==
X-Forwarded-Encrypted: i=1; AJvYcCWGQ9biaKcDViClPKvuX7BWOB8KAuWhtuprpTLNBGOZSJYRR+VOZFTXeyUqUOHz9QAOeCzEpKkk1F0d@vger.kernel.org
X-Gm-Message-State: AOJu0YxQaQdnXZSuLA1DqWhkfoehiTEJOAMrBmNXGANHdUcu60qI3BFz
	t35fkZ9gqemZneY103nD725Rb2+7IjHAYx4KvhIxI1+74haWPGQf+5cXE4RZ8Ns3Nzwfua5SOcg
	m68PqO5vD8O17KEgeV6/b0ks4fuFiQa9vxMbDbg==
X-Google-Smtp-Source: AGHT+IFBNtNM9cyThi+vPNC5pevvknldlnAGEAmEeydRDlx23zOmIJ/llnoOA4NlpXUcYqfbuaQvMmI9LT27yin+eq4=
X-Received: by 2002:a05:651c:50d:b0:2f9:ce91:dea9 with SMTP id
 38308e7fff4ca-2ff202eab45mr123344961fa.32.1731570168400; Wed, 13 Nov 2024
 23:42:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113162939.886242-1-lars@metafoo.de>
In-Reply-To: <20241113162939.886242-1-lars@metafoo.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 14 Nov 2024 08:42:37 +0100
Message-ID: <CACRpkdYv0Z9cRdr5DXB-U=7ZqrkQ1VoWuntLGVUy6DRsNea2=w@mail.gmail.com>
Subject: Re: [PATCH] gpio: tegra186: Allow to enable driver on Tegra234
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Thierry Reding <treding@nvidia.com>, 
	Prathamesh Shete <pshete@nvidia.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 5:30=E2=80=AFPM Lars-Peter Clausen <lars@metafoo.de=
> wrote:

> Support for Tegra234 was added to the tegra186 driver in 1db9b241bb56 (
> "gpio: tegra186: Add support for Tegra234"). But the driver is not
> selectable on Tegra234. Update the Kconfig entry to allow the driver to b=
e
> enabled on Tegra234.
>
> Enable the driver by default on Tegra 234 as well, similar to the other
> platforms it supports.
>
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

