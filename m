Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D12C1165B7D
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2020 11:29:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726921AbgBTK2y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Feb 2020 05:28:54 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:34875 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726801AbgBTK2x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Feb 2020 05:28:53 -0500
Received: by mail-qk1-f193.google.com with SMTP id v2so3064085qkj.2
        for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2020 02:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=V+D+Oguuyj+RUr3A3Lx/J2MyIAXszwuZogb4QISizTY=;
        b=JbRmvJg89oGETca2ebk+jHa32PMmkvyzx4Vp/pxwdvYV1A5Ybt+qcld0w9znyCHot3
         z9lzzT5XaTtnksYFr1npZRvCz16QsXhrfzhRUG2xSRr/MZaC+MQXfrtqotJPuVbm9rFc
         TfWFQN/wPoYNe/Hv2ZOK12WdZsdLZAjoAdV4Ly/9J0BpnNl4D3FBMLbeCWWfsnkHOR9Q
         bfTuyeyaC5y9tZug9cBXCN1jaN0r63vjEcu6YDTl+/ktflr0ov5GPZ9cKLb4swkaJJKI
         +InJc335F84vnbeQGPIAPBv7+sY57/x2lhtjSlA9cbXxMx8M1KD/OHZPhzFg1lGVN6E/
         mzmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=V+D+Oguuyj+RUr3A3Lx/J2MyIAXszwuZogb4QISizTY=;
        b=OLtsZ7FhkQy1FbGdlAbkWt3/By+CWMUNuOtmSd4FXbMbpZqVMuRixbzE2INvCjuk5p
         sfYcIzJYkHGsWeyBOCxafCuYUM+WipFOPsG2+AhK8L8VeF/Ni0n6m3YE4EpEZ5oEByZx
         Sur2vMCvn78HWGfcb43rwEN6Ek6h95hUnoeL0jOoIDsiE76a9HwopYyAYkiTN96AMNcO
         VXkDVLdyWNRVS4mEug/qGjuyPyMZNHlPeCP+vaBWdg40ya14KU5c+IkKCls/9v07CtYJ
         8Exuo34eEqiWh2gyvkcBgf81Pnor1pFFCp2QaWzK1wtIpsVvlAw53hVv36dWST2YP1Re
         +ooQ==
X-Gm-Message-State: APjAAAWaZHqQoPtjsFYYftFv14CdPUDp92NkSV4Rrcr19vRB53YiUvQ8
        fsVwT6KZrfsfv1ioWNRCx0VOlQpD+z4t2LnWEbJAWA==
X-Google-Smtp-Source: APXvYqxykPihTXTgrIShZPQYasPSZbasbw4QwcYCWUECJz0hLDszKBzPXxvT3OnTzm3yGMIO8Ev1AxqGbckdQ1v1gYQ=
X-Received: by 2002:a37:4808:: with SMTP id v8mr24745184qka.263.1582194531385;
 Thu, 20 Feb 2020 02:28:51 -0800 (PST)
MIME-Version: 1.0
References: <1581942793-19468-1-git-send-email-srinivas.neeli@xilinx.com>
In-Reply-To: <1581942793-19468-1-git-send-email-srinivas.neeli@xilinx.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 20 Feb 2020 11:28:40 +0100
Message-ID: <CAMpxmJX1zTpeBGdd6DSe_o3mxUW7ObsFbRjptGQBZB1-4YE7UQ@mail.gmail.com>
Subject: Re: [PATCH V3 0/7] gpio: zynq: Update on gpio-zynq driver
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        shubhrajyoti.datta@xilinx.com,
        linux-gpio <linux-gpio@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>, git@xilinx.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 17 lut 2020 o 13:33 Srinivas Neeli <srinivas.neeli@xilinx.com> napisa=
=C5=82(a):
>
> This patch series does the following:
> -protect direction in/out with a spinlock
> -Add binding for Versal gpio
> -Add binding for pmc gpio node
> -Add Versal support
> -Disable the irq if it is not a wakeup source
> -Add pmc gpio support
> -Remove error prints in EPROBE_DEFER
>
> ---
> Changes in V2:
> - In previous series [PATCH 1/8] already applied on "linux-next".
> - Fixed checkpatch warning for spinlock description.
> - Added description for Versal PS_GPIO and PMC_GPIO.
> Changes in V3:
> - Updated commit description for PATCH 4 and 6.
> ---
>
> Glenn Langedock (1):
>   gpio: zynq: protect direction in/out with a spinlock
>
> Shubhrajyoti Datta (6):
>   dt-bindings: gpio: Add binding for Versal gpio
>   devicetree-binding: Add pmc gpio node
>   gpio: zynq: Add Versal support
>   gpio: zynq: Disable the irq if it is not a wakeup source
>   gpio: zynq: Add pmc gpio support
>   gpio: zynq: Remove error prints in EPROBE_DEFER
>
>  .../devicetree/bindings/gpio/gpio-zynq.txt         |  4 +-
>  drivers/gpio/gpio-zynq.c                           | 66 ++++++++++++++++=
+++++-
>  2 files changed, 67 insertions(+), 3 deletions(-)
>
> --
> 2.7.4
>

Other than the commit messages, the series looks good to me.

Bart
