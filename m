Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0043A468843
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Dec 2021 00:36:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233785AbhLDXkT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 4 Dec 2021 18:40:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233314AbhLDXkT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 4 Dec 2021 18:40:19 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF9F9C061751
        for <linux-gpio@vger.kernel.org>; Sat,  4 Dec 2021 15:36:52 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id a23-20020a9d4717000000b0056c15d6d0caso8495969otf.12
        for <linux-gpio@vger.kernel.org>; Sat, 04 Dec 2021 15:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NuW/fbIz0j4mSyCSfNd6qMqzZTl35SAyBw4Kyu5HiPA=;
        b=iFbmdA1TsAivA5FbFGUBriHLHlUT75w9xDbOkgIWR5o158RgJ70WSafgXYLVZVCtYh
         JbW+i/OT9oGX6cLrJjAurb4KM4XI0qhxiDyyGXjSkJsmioqwUyRLRbvbYenRvTbTwXpB
         Gi7ifeCLnLESst4k1++JcqYERHLsr7rnPGXORK/0lbRodkCHjQW3QLDob1VGDc4DquBy
         O5PhoQd37dN8UCwebSIoifubCOm4CPIYiM6iQDWrH6vZW93Z/SLd6B9FoDubK07nv38z
         tMUWwt0UntbeEPHP/RcRXrqrmd4I+DBrvxqdxeshQJyRwlsVJAV8qczxssO/yiy+u3VW
         cVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NuW/fbIz0j4mSyCSfNd6qMqzZTl35SAyBw4Kyu5HiPA=;
        b=2mDZP3YzHD9JIQc21LZiT47UtSQHBTKl9yJqg094ZzJV8FHpoOFBFpNXTSxtlyshyd
         Eyh5WYvkM16pDlT7stBZZhX/ujnhgGVBWwdY0iDQeU1Y5xwXQ8vyKEugQEGLJWM2bwv0
         0jU/fHpUo9WebohPolgN8dnsjX5VqzZZlToehwt4tNX/bB0PefM1TBze18KTMpIxdFVE
         rzlwfLjKOCTc/xm+BekIBU/9Hg/IyXLQNqUAffhxb7Enzx2SxavKnlBcEeBrPsNv4ek/
         RQxDLgSbHAQiF0D9EAeOCYOzTHvbISs67uGo3FHF7QeaMU0WYHVJZdRFJ5N5wYUipyMN
         VZCQ==
X-Gm-Message-State: AOAM531BU439XjE/8Kul3NOl38iN0PUVunud/C3P6Fe/ObpioIoxtQjA
        ywLd5HVP4Ccn6g+BtJU3uBFr78ilo4kPzMp1AgdIMQ==
X-Google-Smtp-Source: ABdhPJy/YkD5Lpp/kh/+b64tVyaKjWYz3dLa+2TfJuzuzRee3iC2k5N/5GhHPgwu4UeTgAhYUNIO+l5Lt4i9ercDe74=
X-Received: by 2002:a9d:a42:: with SMTP id 60mr23684363otg.179.1638661012313;
 Sat, 04 Dec 2021 15:36:52 -0800 (PST)
MIME-Version: 1.0
References: <20211202095255.165797-1-herve.codina@bootlin.com>
In-Reply-To: <20211202095255.165797-1-herve.codina@bootlin.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 5 Dec 2021 00:36:41 +0100
Message-ID: <CACRpkdZPO7HOAGwV1iU+z047EFWCRbsrOjNV5o9s4dzPsT1H5w@mail.gmail.com>
Subject: Re: [PATCH 0/6] spear: Fix SPEAr3XX plgpio support
To:     Herve Codina <herve.codina@bootlin.com>
Cc:     Viresh Kumar <vireshk@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 2, 2021 at 10:53 AM Herve Codina <herve.codina@bootlin.com> wrote:

> Herve Codina (6):
>   pinctrl: spear: spear: Convert to regmap
>   pinctrl: spear: plgpio: Convert to regmap
>   pinctrl: spear: plgpio: Introduce regmap phandle

These three applied to the pinctrl tree.

>   ARM: dts: spear3xx: Use plgpio regmap in SPEAr310 and SPEAr320

Please apply this to the SoC tree.

>   irq: spear-shirq: Add support for IRQ 0..6

Please ask Marc Zyngier to apply this to the irqchip tree.

>   ARM: dts: spear3xx: Add spear320s dtsi

Please apply this to the SoC tree.

Yours,
Linus Walleij
