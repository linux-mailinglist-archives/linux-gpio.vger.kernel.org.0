Return-Path: <linux-gpio+bounces-10252-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADB797C265
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 03:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 016461F222E9
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 01:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CA44C8DF;
	Thu, 19 Sep 2024 01:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=allocor.tech header.i=@allocor.tech header.b="OhHBnn3a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCFCB673
	for <linux-gpio@vger.kernel.org>; Thu, 19 Sep 2024 01:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726708885; cv=none; b=a8HbbHiBf/8nHoENn29zUfcuf6NHuYky57z4WWCiPd6yV+ksFdBjuF9TFktXz5PuhfKir/lkjv3kgB4MsKDF3rOFpmE8xligw6KAuR9t+Dn2Nyl7jWRlq2afvh+eyBBu8OxnMA/9FyLbmNUWeS/GHiu+mAEPd0ItYAN4hF6icn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726708885; c=relaxed/simple;
	bh=31LexGI8Qk0EfQnF8bb0VyMZ7DE+r7p4PyjiV+2XRcU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=WFZn4VCHr0U37kFFLKwv5OTd1MLt/l/Ae5uiyY5sgm8tIBRsEb8yBbMviQhKiuZ9vN8hHiNl0uKb6JUMSxnj5ipoQ38qktITkXVY5WnTQg1XneR6aUUVvYbZ6iUUSo1hId0iteVrCoMDFP052Ncc3UWy+Job7QgAMK3W91b8Ev8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=allocor.tech; spf=pass smtp.mailfrom=allocor.tech; dkim=pass (2048-bit key) header.d=allocor.tech header.i=@allocor.tech header.b=OhHBnn3a; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=allocor.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=allocor.tech
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6db9f7969fdso2930767b3.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Sep 2024 18:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=allocor.tech; s=google; t=1726708882; x=1727313682; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1wazMw49Db9gZyPDRd8/yOUsPPVN4YF518TYZuLmgak=;
        b=OhHBnn3a7h1OBHmb0FsDw0hKgR1lVOSQwY/44nf32A6ZzDq9NlQxT73dBNWpIgEl5Q
         HlO7Pe33E3K6pFqg9UxyGqiYmK3G4Waderncpgr6NqtG8jut8g7bZsFEDn83Cd5TdvRG
         Qn8R4c5IpnsSNH6SbGq8Itk6u0XLNxdVoObXY5MdndoOQD2isVGQMCB2mshoNvDCnlos
         wn8MEFTktxzKAcAdQUdHN0p+7dmlus1GhVmuwfh8DWgJRw0ndQXPEYaRUX8t3mSy/jF3
         mPywymrhts89Z6xcmCVIOkRk9Xsj/UytAy5EV/bw7Ny7iVsh2tQkoEq75rx2HTnlXG/f
         zxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726708882; x=1727313682;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1wazMw49Db9gZyPDRd8/yOUsPPVN4YF518TYZuLmgak=;
        b=fMKSaG7xU9QViSU9p/mZUIREWR2/F4A+z5YgkuXbgYG6WvYZ4SP0LZ7SoD3Q452QyK
         5ewdwIZyuzI1m5KG9T8rsgcUDaaJcBDVplvgK9TNCmMN37LklXEeO3MdwdHHECd5AP2K
         GKDDtAILmtvThLploWjgx9wh1ezJFdcs1DR5pGLgFPZtQH7X2mMTHspAHARkUpxVg+zA
         IhmRoFOQrBEfs6H+jlUItQyCkF1ISUPIOT+EV8UOgcLWyLXHLFhMbmNSGKYnyRKbWCgg
         PAEbHSURhPrsBKF5Tgxvb7ZAsU9umH7LGlehpooJMISFaS5I3ItvRnTqaVbk3Z2z0tPb
         +YnQ==
X-Gm-Message-State: AOJu0Yx1iUZIzABK+rAB0dilGAzWZEok2doJTx3RoMInCx0RCrJMySoM
	bQFtQSvqCHoVwtsVqp9lJL2TDwXoH6ZAOlK3NfleG0SHeFih4astXtcJeUARa5SajS4IqHwyv/M
	wfo9JofVQARmaddBRzTM1VtmEbFLKwry1pLanpyjh8U+71RtQdqQZ+g==
X-Google-Smtp-Source: AGHT+IEIAZ9G6uUVayOHmifenjyOSSrCEb2fclymPoWVp2kMm+CQ18r5JYTxaQ+eSGJz/Ktsw1jmp/waHbiUx2wxU3s=
X-Received: by 2002:a05:690c:67c2:b0:6dd:c619:4cb1 with SMTP id
 00721157ae682-6de0956b497mr14034927b3.0.1726708882087; Wed, 18 Sep 2024
 18:21:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Matt Walker <m@allocor.tech>
Date: Wed, 18 Sep 2024 21:21:11 -0400
Message-ID: <CACjtZiReNNqzonwri51fCPArKR-D9nzQ4HgZAM_EFdzUW0LGOg@mail.gmail.com>
Subject: MCP23S08 Pincontroller Bias Configuration and GpioLib
To: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi all -- I'm trying to do GPIO from userspace and have run into some
confusion I could use some clarification on.

Assumption: It is not possible to set the pull up bias for a specific
line from the device tree and expose the line to user space. And it is
not possible to set the bias from the old sysfs gpio configuration.

I'm therefore trying to use the GPIO_V2_LINE_SET_CONFIG_IOCTL to set
the bias of the line. However, the MCP23S08 (pinctrl-mcp23s08.c)
driver does not have its implementation of struct
pinconf_ops.pin_config_set called. Instead I had to add an
implementation of struct gpiochip.set_config.

Confusion: I thought the pin controller was solely responsible for
configuration of bias and that the gpiolib would magically know that
it needs to call pinconf_ops.pin_config_set. Since it seems like an
unnecessary duplication of effort to set bias config in both pinctrl
and gpiochip, I figure I'm missing something. I thought it might be
that the MCP driver does not have an explicit call to
gpiochip_add_pin_range, but that wasn't it. I also tried adding the
pinctrl definitions suggested in the device tree mapping, and that
also didn't work.

Thanks for any insights anyone might have! And if there's not a better
way, I'll clean up the driver and submit it as a patch.

Background information:
I'm running kernel v5.15; but a quick read of the latest kernel code
didn't reveal anything obvious that has changed.
This is an arm32 kernel, hence the presence of a device tree
We're using the microchip,spi-present-mask as we have multiple chips
sharing a single chip select. This seems to play havoc with the device
tree pin controller mapping, or at least I haven't figured out how to
get it to apply the bias to a specific line on a specific chip yet.

For what it's worth; here's my device tree node:
&spi1{
   pinctrl-names = "default", "sleep";
  pinctrl-0 = <&spi1_pins_z_mx>;
  pinctrl-1 = <&spi1_sleep_pins_z_mx>;
  status = "okay";
  cs-gpios = <&gpioi 7 0>, <&gpioi 8 0>;
  mcp23s08_u73@0{
    compatible = "microchip,mcp23s08";
    gpio-controller;
    #gpio-cells = <2>;
    microchip,spi-present-mask = <0x0B>;
    reg = <0>;
    spi-max-frequency = <1000000>;
  };
};

And I tried this variation to see if I could get the mcp driver to
apply the bias without me needing to tell it (which didn't work; and
after scratching my head for an hour decided it was better to
implement the function.) Given that the pin names are shared between
MCP instances, and a single device tree node creates 3 pin controllers
in this case, I'm not sure how to get it to behave itself.
... same spi node as before {
  mcp23s08_u73@0{
    .. same properties as before, with the following added:

    pinctrl-names = "active";
    pinctrl-0 = <&mcp23s08_u73_pins>;
    mcp23s08_u73_pins: pinmux {
      pins = "gpio0", "gpio1", "gpio2", "gpio3", "gpio4", "gpio5",
"gpio6", "gpio7";
      bias-pull-up;
    };
  };
};

~Matt

