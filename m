Return-Path: <linux-gpio+bounces-15477-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E979A2B09D
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 19:22:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 336BA188BAAF
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 18:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D63ED199254;
	Thu,  6 Feb 2025 18:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FFeOuAHu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C382B19D8B7
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 18:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865840; cv=none; b=YxdBrZZtFEB/rcUyfTAKFZLShMmGCuixDZ7jMnGNgEbta7MttVSxfdAdrggVTXFABIPziEwO20FzoxRpPorcUFeMMlMyybwd4X345JYKjRONr4U/q2tlMNr4SW2SxqK4lhOZxM3L9WOEVUVS+6FbLlDvyMxtdgcdhk6I5RlYwwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865840; c=relaxed/simple;
	bh=197lp3kzwItmnztsj2amEy4Ts4sUwvD5wd25DtZFya8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oecX7rYiJAiM+Rrd0SL+M1BbCWiqtMDW5Wn5cLvfQqgP9SaLH2lDKtfuJqfi0du/F/c9P901J7v+jhknTNkh+lWLVpi4/CjfoiPZOea9cp/v4kTYDqmrGirxf7UATvOvDd3Z+wZpR4fQUxlwU88UjfFOj1InLlr4GK0xuGIJtXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FFeOuAHu; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54410d769f7so902797e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 10:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738865837; x=1739470637; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5MVWUvrz6I/EjcUog/wJCigSBALMduOPBpWQgvDyB4o=;
        b=FFeOuAHutN34rCWmRwBmVPING5Ib3EZINfkYy6HfqWluVEWJRLaxVVeteS4Wa0KTTR
         KrrsDGOnbu7QS42Gun+ZpJSmaFc5BIkp20EOlq6R7Nev0DSZx6J+gVMpSDeX4oU0mPUr
         Ifk60wpQX2/8Nk8ucszSWP7nJ53LExgPLOGNI6zRM6209XwrcTEgMWN63UogJUzDq3NU
         5rUrmCqp7NPQqiQk32Xk4gEPm9NH6+9wTQtsw5H1QixGZzCUci9Ujdy+MMZ1mzl+gufE
         fCmWCnpqXO7aTHP0uhpM7WIXbotRbxhuQs7zCVQ+ZksnfHLx30b/oC/VdCRelvuVx5FZ
         JiAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738865837; x=1739470637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5MVWUvrz6I/EjcUog/wJCigSBALMduOPBpWQgvDyB4o=;
        b=WkyqykWpmw34umcER1pbctH+O8mbpV2SLt7zgL4NEWC7QWDGSvTB4UeaRQe6Lxa1LB
         BysBQWcsyES8AdRfvEmflH9qizRiXSd+kdjcJa4qGFg3SNM7fM98vyaOrvWWaR8FWzmG
         KpFSiIfmJ1lOlfeanPIYgCINkCPyInZKNXB/4KKBIlEU/WGLOY1hjTc2Medj896NcnGv
         mW6ZXjqSFBMGNswC4OAdzepMxVuAMbdfREkCZe0wVC40kzPfQS7E8ytY2JxHvfnS97rD
         wk2lX6A+GFCdLVEZNdYQqh3roEGRrixH38qSs77cLjB1lYN66TV1Ku434HV6s+tTEd0R
         igVw==
X-Forwarded-Encrypted: i=1; AJvYcCWimifxQEnJlumyNZzpHyUPlqVl1VnPHvQhuVDkPgnl3qA9ocxeqLMGZwRdBJkbDx8g3eDrzCI3u02v@vger.kernel.org
X-Gm-Message-State: AOJu0YwAF6+HvEcJdSvFRpSSnhfw89OYZ6I1t6+bGTN8Q46zbA0bgHEe
	AsF+kbPAYml/pM8DAnfJL/4nu2Guo6OEdOnr8gydxjBnaOcMVFus+zqoyBAd0tRq4mBzIEFZ0M2
	BU+2DHWDbiL5QDpXp2KFtMhuC38HRmQXDemSLCJbqIB1R49T+
X-Gm-Gg: ASbGncuPD6z7eqQ+X9FpscTef5necEOknH9Urnf6dd8vSOtv+J8JYwcxADTzW+tJiYV
	LQQVFOJ0dus10sWcDq7q6OcsgtMXr+5U1wjffact43rniCZ93gTsmuQaD7G0AmtViHDgGUk0=
X-Google-Smtp-Source: AGHT+IH3sHYKWyOD5ia3rmPaUPdB8KYuQwRoGoxGcTpzNmXeS5xrmV3mgCN6Tr2QiY+B044QqFQhDWxhGS1tixCTg/o=
X-Received: by 2002:a05:6512:1044:b0:540:1d37:e6e with SMTP id
 2adb3069b0e04-54405a438a5mr3117203e87.33.1738865836820; Thu, 06 Feb 2025
 10:17:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206143714.182230-1-brgl@bgdev.pl>
In-Reply-To: <20250206143714.182230-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 19:17:05 +0100
X-Gm-Features: AWEUYZmjY00VQRyj-wROvCwcjvRKMHYs9Ew0heG6nw4BijJkAe4FJsZiQNQlpkw
Message-ID: <CACRpkdYKY-fZED=ZCjuXD5s0TYYxBsgFwJ2ga-rHkx4k6FE5Bg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: don't build HTE code with CONFIG_HTE disabled
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Dipen Patel <dipenp@nvidia.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, timestamp@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

On Thu, Feb 6, 2025 at 3:37=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Hardware timestamping is only used on tegra186 platforms but we include
> the code and export the symbols everywhere. Shrink the binary a bit by
> compiling the relevant functions conditionally.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

> +static inline int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc,
> +                                              unsigned long flags)
> +{
> +#if !IS_ENABLED(CONFIG_GPIOLIB)
> +       WARN_ON(desc);
> +#endif
> +       return -ENOSYS;

I think you can just:

if (!IS_ENABLED(CONFIG_GPIOLIB))
  WARN_ON()
else
  return -ENOSYS;

here, so it's not so ifdeffy.
The compiler will eliminate the second branch.

Yours,
Linus Walleij

