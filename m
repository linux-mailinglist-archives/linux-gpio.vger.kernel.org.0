Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E71EA38F4D3
	for <lists+linux-gpio@lfdr.de>; Mon, 24 May 2021 23:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232820AbhEXV1L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 17:27:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbhEXV1K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 17:27:10 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3025C061574
        for <linux-gpio@vger.kernel.org>; Mon, 24 May 2021 14:25:41 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id t193so21057874pgb.4
        for <linux-gpio@vger.kernel.org>; Mon, 24 May 2021 14:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lABxjI8I0ag5Qzb4co3HpLIFDtD6I0Xr+O5YHWn2k6E=;
        b=TWBuC/HaQdWvQgqHhNDaIiBv0qrt7mlbOf3eg37w0pu9iFvgFCNHhVNErIE2AOe7JX
         LnkEUNEfw9O+K1KSQaIWV6941aqy4RNKXC7WJCxl7oNLyJyd4Vr4Xt2gPNPUHkGTm/Wj
         PoD4Rdjn6if/jG/EMG7bE3kBnsjVMUeZOqRJzBsvbS5Gs7IvowRG5m600Z9kTLxJtN6Z
         wpCdEyEQ12ELeslBG8nHpAxUn+4vqmVj53rKk5Z7L33ikT9VN2k8YImhX9fOlE7EWPsT
         TliuVdMyB1jDGt1MAqa8VsNpCzW9mfqc5WhH5za5FAk2TiFD96UAH7156nlt6BAmTYYR
         wKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lABxjI8I0ag5Qzb4co3HpLIFDtD6I0Xr+O5YHWn2k6E=;
        b=MwLyIwKUxx20Bl7OLudzU7+rhoo//fktYQFXyK1puKGvx7GCY9gfosZ9blqC5Bd8NG
         UZm4LS4gQuMZHWDMuO+7G/iJY/boe25i83gBtPQ9II/q4hegiJciSqH2Lt+gTck2sMA1
         3WjPM4/qURnEFJ7aERMRKH09UwKbqQiL+/6Cp81vgbay73dF5vWsneLaz8v+HfXqcJHA
         +V8uEkgcNC5WV24y0g6b5M9s5CobjkuU0a0Opos9OSsDz8JueXqFqlFWK7j+YQrtzCgp
         XVxblzcGchx/YLFNRAeZQPVPA2eXPpDS+fTzcmdelFHtn7/MuTrLaXpXHBKR2TvP1m8f
         q47w==
X-Gm-Message-State: AOAM532Y12Yfm9dUNDWLL2aQo5vOK3T2e0aLn2GbRQLcSKDNQjH46AV9
        iNxsFZ7cqBpaFnprsuJE2l3+bg==
X-Google-Smtp-Source: ABdhPJxnpal0eztqr9HsEiLxFryfIpB/VG+T6T0+dWGZZxkN3FpXSRycUV/J9D2QDVQ7G+4IJ9ahww==
X-Received: by 2002:a63:5a5d:: with SMTP id k29mr15269183pgm.215.1621891541467;
        Mon, 24 May 2021 14:25:41 -0700 (PDT)
Received: from x1 ([2601:1c0:4701:ae70:5a64:3ac5:f809:b62e])
        by smtp.gmail.com with ESMTPSA id bx18sm342785pjb.9.2021.05.24.14.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 14:25:40 -0700 (PDT)
Date:   Mon, 24 May 2021 14:25:38 -0700
From:   Drew Fustini <drew@beagleboard.org>
To:     Mauri Sandberg <sandberg@mailfence.com>
Cc:     andy.shevchenko@gmail.com, bgolaszewski@baylibre.com,
        geert+renesas@glider.be, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 0/2] gpio: add generic gpio input multiplexer
Message-ID: <20210524212538.GA3756746@x1>
References: <20210325122832.119147-1-sandberg@mailfence.com>
 <20210517165847.206316-1-sandberg@mailfence.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210517165847.206316-1-sandberg@mailfence.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 17, 2021 at 07:58:45PM +0300, Mauri Sandberg wrote:
> Hello all!
> 
> This patch set is closely related to another thread at [4], which I abandoned
> against better judgement and created this one.
> 
> Here I am sending revised versions of the patches. It builds on v2 and adopts 
> managed device resources as suggested by Andy on the thread mentioned
> above [5].
> 
> I have tested the functionality on a NXP 74HC153 dual 4-way muxer. Drew, did
> you find the time to have a go with this [6] and if so, did it work as expected?
> 
> Thanks,
> Mauri
> 
> [4] https://www.spinics.net/lists/linux-gpio/msg58573.html
> [5] https://www.spinics.net/lists/linux-gpio/msg60160.html
> [6] https://www.spinics.net/lists/linux-gpio/msg60159.html
> 
> 
> Mauri Sandberg (2):
>   dt-bindings: gpio-mux-input: add documentation
>   gpio: gpio-mux-input: add generic gpio input multiplexer
> 
>  .../bindings/gpio/gpio-mux-input.yaml         |  75 +++++++++++
>  drivers/gpio/Kconfig                          |  16 +++
>  drivers/gpio/Makefile                         |   1 +
>  drivers/gpio/gpio-mux-input.c                 | 124 ++++++++++++++++++
>  4 files changed, 216 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-mux-input.yaml
>  create mode 100644 drivers/gpio/gpio-mux-input.c
> 
> 
> base-commit: 6453b9532b5f77d19837b159c4d074f0af9f141b
> -- 
> 2.25.1

Tested-by: Drew Fustini <drew@beagleboard.org>
Reviewed-by: Drew Fustini <drew@beagleboard.org>

I have wired up the TI CD74HC153E to a BeagleBone Black:

  S0: P8_7
  S1: P8_8

  1Y: P8_10
  2Y: P8_9

I added this to arch/arm/boot/dts/am335x-boneblack.dts

  mux: mux-controller {
          compatible = "gpio-mux";
          #mux-control-cells = <0>;

          mux-gpios = <&gpio2 2 GPIO_ACTIVE_HIGH>, /* S0: P8_7 */
                      <&gpio2 3 GPIO_ACTIVE_HIGH>  /* S1: P8_8 */;
  };

  gpio8: key-mux1 {
          compatible = "gpio-mux-input";
          mux-controls = <&mux>;

          gpio-controller;
          #gpio-cells = <2>;

          // GPIOs used by this node, mux pin
          pin-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>; /* 2Y: P8_9 */
  };

  gpio9: key-mux2 {
          compatible = "gpio-mux-input";
          mux-controls = <&mux>;

          gpio-controller;
          #gpio-cells = <2>;

          // GPIOs used by this node, mux pin
          pin-gpios = <&gpio2 4 GPIO_ACTIVE_HIGH>; /* 1Y: P8_10 */
  };


The two new gpiochips appear:

  root@beaglebone:~# gpiodetect
  gpiochip0 [gpio-0-31] (32 lines)
  gpiochip1 [gpio-32-63] (32 lines)
  gpiochip2 [gpio-64-95] (32 lines)
  gpiochip3 [gpio-96-127] (32 lines)
  gpiochip4 [key-mux1] (4 lines)
  gpiochip5 [key-mux2] (4 lines)
  
The mux pins and input pins are connected to lines on gpiochip1:

  debian@beaglebone:~$ gpioinfo 1
  gpiochip1 - 32 lines:
	  line   0:     "P9_15B"       unused   input  active-high
	  line   1:      "P8_18"       unused   input  active-high
	  line   2:       "P8_7"        "mux"  output  active-high [used]
	  line   3:       "P8_8"        "mux"  output  active-high [used]
	  line   4:      "P8_10"        "pin"   input  active-high [used]
	  line   5:       "P8_9"        "pin"   input  active-high [used]
  <snip>
  

Test with all inputs connected to 3.3V (1I0:1I3 and 2I0:2I3)

  debian@beaglebone:~$ gpioget 4 0
  1
  debian@beaglebone:~$ gpioget 4 1
  1
  debian@beaglebone:~$ gpioget 4 2
  1
  debian@beaglebone:~$ gpioget 4 3
  1
  debian@beaglebone:~$ gpioget 5 0
  1
  debian@beaglebone:~$ gpioget 5 1
  1
  debian@beaglebone:~$ gpioget 5 2
  1
  debian@beaglebone:~$ gpioget 5 3
  1

Connect 1I0 to GND

  debian@beaglebone:~$ gpioget 4 0
  0

Connect 1I0 to 3V3

  debian@beaglebone:~$ gpioget 4 0
  1

I tried this with all the rest and got the same succesfull results.

thanks,
drew
