Return-Path: <linux-gpio+bounces-27074-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3E6BD8DBC
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 12:59:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AF3B1924C4F
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 11:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26B7F2FDC50;
	Tue, 14 Oct 2025 10:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m0ypyxAb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD702FD7DD
	for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 10:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760439449; cv=none; b=ggFpAkGbrnSgQ9F4K3bsvHT0NAb435QwknqLr5KTLrXgF+IxD6C6Y2m0RVuHtxTQUbBhufOiG7LJoiha9ZP8vkuVmLVuZIuEEdBoWXcUqUEbCXX6BB4gnAc9MyRsFS/ejDZoVrb73Fx03tTzyukydgNvCNIXKS748g5vrztCdmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760439449; c=relaxed/simple;
	bh=h0H6MhygcHpVeEe3ayRJhd0DlNHjer2rMmDiK65tgNg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bXA5XyMlPN6g/xB7nmig7DpJj+OtcJUAweuOMhtW8AP0WbTNsLzEi8L1HCS1zySqfUiNYy9/rIB7FjXeUpMPvsk1OckuTvnjSOCi9kAe16JmXyv6ktQs7OFWnai1MJImPy16oFe2dfUECFAhFhQIsPRLaDc16T05SURQV0piGss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m0ypyxAb; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7815092cd22so4160647b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 03:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760439447; x=1761044247; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bGzolF9q1IpbbklG5j2EadJMhIpSSosnmlJzCW1vwdk=;
        b=m0ypyxAbUMaX9Ll9fkB6zUZwxACK80pNkvk8W8aSq6klfbFdR1Pi64xS9xDt3zEIlz
         hwnj/nVKxt/m4/mDJ4wcpQd3g6FpDkhEexyr3/auHxcidcB/eoHcCfD7vvoxOOpghRQy
         RJLqHE4W/pRCH8IwKO9G01qOCMqcvC8C4nMaihkPL18aj4XJhmAzo356bP1oj03BKQlv
         O5UyNQwo24nM+MkmV5N07yDdTgVRs1JhxYfvMBuWg2o5YZNgi8Jeq2+elY29l2xHF64j
         veOIn1VrVrDWZmyLZEfHz9k1wzC+Mkk3Bbz1YSFA2oI71xvAElvPWBY4WMhaFgDv47LD
         txxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760439447; x=1761044247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bGzolF9q1IpbbklG5j2EadJMhIpSSosnmlJzCW1vwdk=;
        b=Ddza1eXzxAwn+dc0gfsNjzoafavcAEZokrSa28Ey9PQMTTp0FUuIp8KQakg4Z8+ClF
         fk2uPKp1zb57WWRinLpr2QcE2t4yXeJGiXtIwW3lGfb672JuKq20zwnS/wR+MccCCrUA
         BxwpnznMLCYRfPxBmzAVAwPJF4ivqj/w3R1Z6CXDdSkxfp77HdPSqne1+wgAn2TQkIPa
         ZLmsnDPfcfivk30YxOWsyOlwWT2CsxeOUI8DKhBLYSJizZRQGcEf7eKSq6dRkF+LeROK
         v8TT59IyRBpRYmT8yFPui2nXRvT9fxN9KqDmR/7izrhJeq+RroS99y4sBQAvH0ejbksK
         4skw==
X-Forwarded-Encrypted: i=1; AJvYcCVsHAsfssvVWj6o6cLRch5eIgEe/i6w4TsZr0we/tMVDtPYWPC81e3V4W0upx/in4yAodWrpc+f+ODS@vger.kernel.org
X-Gm-Message-State: AOJu0YwQA4UA//aZkR/CpNe3f0ATU7k9M7coYd1lA/4tEe0PMNlYEj0j
	cgUYNJRoaoBXxlQ/tjDHQTGX2Qtly2ranYuO+PbZTvl56kxrsTUpkkJS/xwmpW3nv9W47Tdxa4L
	dW0mTQ5sxDYcWHFsNqR+/Hb3ReyIuny6loMZFT8EPNA==
X-Gm-Gg: ASbGncs0TucaI1wraa8R6H9c5P2cQ/U4CL/a+g+3UXtqQqsPHCHWxPhMNx0Ivk6SPaD
	thmzDSlZltPMoustDqY4mz8doa4pAvziZIwn472SpLROjTcwDSmWtlC+NwKU0fUHEwrNPBLn2N4
	T7y7IFKX00zTP9xz0B3LQGN/gPJ27jnYfdxKwsqkmEUeNhANZCz6WuwyFNme+KcWcldlKwWB/4l
	zWIVDXmhvZVZmsOjhDyW1Hm8E82pPZv7sRPlA4z
X-Google-Smtp-Source: AGHT+IEgeGSPp5tZrYwz7LuhOGgC2QQoV6jKld35rrrEDILk6KVu5XlJczlMevH7xUUTupvZG733g6Xg/DOqB7cpoSI=
X-Received: by 2002:a53:d649:0:b0:636:d3f9:6418 with SMTP id
 956f58d0204a3-63ccb864da8mr16445847d50.22.1760439446953; Tue, 14 Oct 2025
 03:57:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014015712.2922237-1-gary.yang@cixtech.com> <20251014015712.2922237-3-gary.yang@cixtech.com>
In-Reply-To: <20251014015712.2922237-3-gary.yang@cixtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Oct 2025 12:57:11 +0200
X-Gm-Features: AS18NWAM1tuEn3mlDY7wbHC5_VT-EX1J8T4IWs4ITMBNmXaEI1pGIgOsxThjx3c
Message-ID: <CACRpkdaXW-BFM=HvqLiSY-Mkmhso2ETmkZzOX328aSadUEBdSQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] pinctrl: cix: Add pin-controller support for sky1
To: Gary Yang <gary.yang@cixtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	cix-kernel-upstream@cixtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gary,

this looks very nice, as long as we finish the bindings we can
soon merge this I hope.

Some small comments!

On Tue, Oct 14, 2025 at 3:57=E2=80=AFAM Gary Yang <gary.yang@cixtech.com> w=
rote:


> There are two pin-controllers on Cix Sky1 platform.
> one is used under S0 state, the other is used under S0 and S5 state.
>
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
(...)

> +config PINCTRL_SKY1
> +       tristate "Cix Sky1 pinctrl driver"
> +       depends on ARCH_CIX

Maybe depends on ARCH_CIX || COMPILE_TEST so we
get some compile testing in the test farms and also a test
on the rest of the dependencies.

(Makes the bots complain so we can fix all such things!)

> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_address.h>
> +#include <linux/pinctrl/machine.h>

Do you really need <linux/pinctrl/machine.h>?

Another thing you might want to consider is whether the
designware GPIO will use this pin controller as
"back-end" for the GPIOs using gpio-ranges in the
GPIO controller nodes, for example (I just made this up):

gpio-ranges =3D <&pinctrl1 0 20 10>, <&pinctrl2 10 50 20>;

Then you might want to implement the GPIO
accelerator operations in struct pinmux_ops, i.e. these:

 * @gpio_request_enable: requests and enables GPIO on a certain pin.
 *      Implement this only if you can mux every pin individually as GPIO. =
The
 *      affected GPIO range is passed along with an offset(pin number) into=
 that
 *      specific GPIO range - function selectors and pin groups are orthogo=
nal
 *      to this, the core will however make sure the pins do not collide.
 * @gpio_disable_free: free up GPIO muxing on a certain pin, the reverse of
 *      @gpio_request_enable
 * @gpio_set_direction: Since controllers may need different configurations
 *      depending on whether the GPIO is configured as input or output,
 *      a direction selector function may be implemented as a backing
 *      to the GPIO controllers that need pin muxing.
 * @strict: do not allow simultaneous use of the same pin for GPIO and anot=
her
 *      function. Check both gpio_owner and mux_owner strictly before appro=
ving
 *      the pin request.

And nowadays it is also worth considering using:

        bool (*function_is_gpio) (struct pinctrl_dev *pctldev,
                                  unsigned int selector);

To make the pinctrl core awara of a certain function selector being the
GPIO function (which makes the accelerated functions work much better
with the strict mode).

This can all be added later in separate patches, but this is a good time
to make sure nothing stands in the way of doing this.

Yours,
Linus Walleij

