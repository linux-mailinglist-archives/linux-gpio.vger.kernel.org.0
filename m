Return-Path: <linux-gpio+bounces-6047-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C69398BA9E5
	for <lists+linux-gpio@lfdr.de>; Fri,  3 May 2024 11:30:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C5961F2248E
	for <lists+linux-gpio@lfdr.de>; Fri,  3 May 2024 09:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 338DB14F9CE;
	Fri,  3 May 2024 09:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="grBC8Hap"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7575C14F11A
	for <linux-gpio@vger.kernel.org>; Fri,  3 May 2024 09:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714728612; cv=none; b=r9m5m95T64YNcqwW43/OCmHTd4qadfeO+MXT2S5iIqRKQ5RImlCRrgOP8G4h9PFpXt11uFeWPWP12xHzKPEMfkW6gkk6djRhG9pjL3p5YSwOWSYy8pjxl3WhLCe2vtiucW/xwuTl5JUgiqAGZTs90mbEIdYCYuo+af7bRxc1B8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714728612; c=relaxed/simple;
	bh=ZNb2/oSuDvsekJbrUvzVBARQvr1M+l1FF1dsoV5we18=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iZSQeVqU/CttLz+A9LgB8XubDbM7wV+A8t9YIMn9bYRVIGyOmuSZma/vm7NjzSOVzLhaKui6XHBJI0yoxOLfZX+pgiBnvmeH3xsieUZmW7GQjjgzp/oZkywanejZVUphNHP8kTFIBbh0EQ3sbPNme6if6pyZe/ZdzlGIwqK9IyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=grBC8Hap; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-41b79451128so52894795e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 03 May 2024 02:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714728608; x=1715333408; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KULRcTjxfat7nflWft5bz9NukEzEddiZ2lggi8GzZ0E=;
        b=grBC8HapctbhvTbub7vtfg58qy5UOfQxyjgAjDMr32V+DGEd/69rY110u70yzZlY6a
         YmTPKt6IV/MsENRwslhCcbDgSBGDe4k4WwzTlYIt+UO878ZX9DsXIkIBMxVOx1zoJcMY
         FgyP0o6IbUbVXaV/zQE9StkIZtrzmXk2HHCRqlXL4sUGRIgGwR6+/lv89I0zWRDMwEYT
         G/IBabHtyjy3TnI+0zk87noYm/ZWO0Zw3J2clS2bjmnsg/8KU+9cPmQN6GJ1G5t4k8al
         m5T7fR3TvFhtVSnfpYMK9+YV2RvBLszqst1ruyBDcymP28MMtXB2/tAKCpwzjRoyeK5+
         Xd6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714728608; x=1715333408;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KULRcTjxfat7nflWft5bz9NukEzEddiZ2lggi8GzZ0E=;
        b=SDeMdkbMGyR1LnCF4Im0iwnWqGI0LJJdKRjTgReMbMVq+SHkJI8V5S/ZUpHkgFWdCY
         8adc5AsLBq9mfdsk1hg/exBf+/ybg4tdFl8cqcJk+J9mXqyoSi7FqokpKfh1+Mvboe4A
         fbtNH1iRkmKMFqayjupKQ5BksHVCQy4EmqPNesBdNL0oGRwXnJucdAesO9Qnz913RiWp
         wpIuc8WrpMKvQyHXP7dkeMes8sF0L6H3SV/FNhlcnS6X+XA5JfNvHv1F/Zi+Rz6hC4sk
         5tyS/HSbYS+ag0LmobYXo3M5NhxvZI2HGR245kNU3lcwG5qtgCI5E70Dlq2jCSdQEgiI
         rpqA==
X-Forwarded-Encrypted: i=1; AJvYcCXeXm/syPIQrQt2JshpnlQMDZIdkK8SEnm9X8nMpl0Dz/H2lBykKCUqRbSxcnJv2XDUKX63zRw3+qe9cBhcTalOIbWSRI7QWiPmnA==
X-Gm-Message-State: AOJu0YzBIkcM387E4H1o9TzIFePAGqT0PCXFp/EoTnLQjxGBE+rbxIor
	PajZdPV0ePgeTloo84p0bvuxxOMXUZiYDpXjCFSPGfFesoIi4xa9kBKY7MjBEb0=
X-Google-Smtp-Source: AGHT+IFMjfL7kc5atSQVs5RqNDVKOWw0871oLlfuW3vxv/8yUSCVntr1NwQgjxnL3bhXh2tYDPwLzw==
X-Received: by 2002:a05:600c:a01:b0:41b:13a3:6183 with SMTP id z1-20020a05600c0a0100b0041b13a36183mr1736973wmp.24.1714728607700;
        Fri, 03 May 2024 02:30:07 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id bi9-20020a05600c3d8900b00418db9e4228sm4988571wmb.29.2024.05.03.02.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 02:30:07 -0700 (PDT)
Message-ID: <0106b6f58ce19752c2c685d128e5a480103ee91c.camel@linaro.org>
Subject: Re: [PATCH v3 2/2] pinctrl: samsung: support a bus clock
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij
 <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Peter Griffin
 <peter.griffin@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, Sam Protsenko
	 <semen.protsenko@linaro.org>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 03 May 2024 10:30:06 +0100
In-Reply-To: <c39eab66-4e78-4f24-bcaf-003161b38ed0@kernel.org>
References: <20240426-samsung-pinctrl-busclock-v3-0-adb8664b8a7e@linaro.org>
	 <20240426-samsung-pinctrl-busclock-v3-2-adb8664b8a7e@linaro.org>
	 <ea6f17d7-49bf-4a1e-ba3b-757e29221590@linaro.org>
	 <9a960401-f41f-4902-bcbd-8f30f318ba98@kernel.org>
	 <c4c73732595b067369a6c8d71508d54358962552.camel@linaro.org>
	 <c39eab66-4e78-4f24-bcaf-003161b38ed0@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3-1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

On Fri, 2024-05-03 at 11:13 +0200, Krzysztof Kozlowski wrote:
> On 02/05/2024 12:41, Andr=C3=A9 Draszik wrote:
> > I was initially thinking the same, but the clock seems to be required f=
or
> > register access only, interrupts are still being received and triggered
> > with pclk turned off as per my testing.
>=20
> Probably we could simplify this all and keep the clock enabled always,
> when device is not suspended. Toggling clock on/off for every pin change
> is also an overhead. Anyway, I merged the patches for now, because it
> addresses real problem and seems like one of reasonable solutions.

I had contemplated a global enable of the clock on driver instantiation
as well, but in the end for me the reasons why I chose the fine-grained
approach here instead were:

* Since the clock is only needed for register access, it seems only
  natural to enable it during register accesses only. (The same would
  happen if we had support for automatic clock gating in Linux).
* If we think about external GPIO interrupts, they are likely to occur
  very rarely (think button press by operator on some external keys or
  I2C interrupts), it seems a waste to have the clock running all the
  time.
* drivers/i2c/busses/i2c-exynos5.c and drivers/soc/samsung/exynos-usi.c
  also kinda do it this way. Bus clocks are only enabled when needed
  (e.g. during transfer) (granted, the IPs (IP clocks) are also fully
  enabled/disabled in those drivers when idle, and there is no such
  thing here)


Cheers,
Andre'


