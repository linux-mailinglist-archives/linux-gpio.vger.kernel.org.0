Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C1C53E0A76
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Aug 2021 00:36:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbhHDWgl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Aug 2021 18:36:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230138AbhHDWgl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Aug 2021 18:36:41 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC33EC0613D5;
        Wed,  4 Aug 2021 15:36:26 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id x8so7177647lfe.3;
        Wed, 04 Aug 2021 15:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AnR/vwLGsL7Poij+z8KIk9gwayPey3/PAXIR24vHmP0=;
        b=c2q/uQrMO4jPVQnQdZ9sjj+CN79C/J8jIUpR4Pc7BSXnwzep3tlimNRR/H2xhI7r6g
         t9D2kA58NXmF1rqVtdzP0FR8q9jJM22Mn6hWLWADNWK8MxxY4tjkI3YeDcLL7q5Ye6W4
         Vd8n9Q6h0bWS0pozeAtwyIu5N/GLYGIHpovDwgEtyd80IypPv8CUvmJV+VsbVMjNuUB2
         bTwUoXTWuqUUXAxubDTnps3NtV8zE8czLZOiP4YvnTVMnUoHxybN+CO7NKXDYoVb+2JX
         EEWYg5JWheFJyWDRADgSIAigH3Z9vfuZ7kP3ZbwQ1fxPV6iEjPjojHIFKhEBv4D99Fkx
         l9yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AnR/vwLGsL7Poij+z8KIk9gwayPey3/PAXIR24vHmP0=;
        b=bfezMsyZAj5nm/LrzQ3cfsImf5BtwVJyCoZPJu2vCMGtVAPO0+FZQVY/KHkJ+Qxjoo
         MjAEs963JWIX/OVIrpVnZe33+PSptouVNQWXhG/IY+y8JZG9ltMNIxlLq6aehvnjimcd
         cTRKgBiaTmw2tgjr+OiZmXRsSEb065IpdfyggIk3RrZf9Jvo3N564TmcKqFNPysReO/T
         ryIusBnkkrTXS0s4IbfJIAjIHdZpqYgj6k0axBcuNzPGO7P2kGAlVLhnMpwbha0bS3v9
         rcE5CPDzdFTv8/LcggIu665XVsr3rvpey1m12J3HTM/ppYuePtcjwHJt00LvgSYUSfW5
         Lujg==
X-Gm-Message-State: AOAM533qVaubkAGyM9iFv2elwZ5GfsR9To882qRWc/jNevxFdMoFNaNm
        UtJM4PmB00AKeRH4ItE+B0HJOEs0WxUdO44Stw==
X-Google-Smtp-Source: ABdhPJxLxuyttu7imt6SnqjaH9qPL5KqPGfCTvbu+tVQhehjnWS73vs3lJQiFmP5Zsx+YK9RTSzIftCqHotYVCX4WqQ=
X-Received: by 2002:a05:6512:a8c:: with SMTP id m12mr1020129lfu.526.1628116585131;
 Wed, 04 Aug 2021 15:36:25 -0700 (PDT)
MIME-Version: 1.0
References: <8ee569d3-7fac-68c6-a1f7-f6457ce0343c@gmail.com>
In-Reply-To: <8ee569d3-7fac-68c6-a1f7-f6457ce0343c@gmail.com>
From:   Gabriel C <nix.or.die@googlemail.com>
Date:   Thu, 5 Aug 2021 00:35:59 +0200
Message-ID: <CAEJqkgiUv1q3tz2JPSyqrAifQQDsS8uPf6QmbG3C4Hs6fDRTJA@mail.gmail.com>
Subject: Re: [pinctrl-amd] 5.14-rcX, d62bd5ce12d79bcd6a6c3e4381daa7375dc21158
 breaks poweroff/shutdown on ThinkPads
To:     Raul E Rangel <rrangel@chromium.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Adding gpio list to CC


Am Mo., 2. Aug. 2021 um 20:18 Uhr schrieb Gabriel C <nix.or.die@googlemail.com>:
>
> Hello,
>
> while doing S0ix testing on my P14s gen1 AMD I noticed the machine won't
> poweroff/shutdown anymore starting with 5.14-rc1,
>
> it just reboots. The machine set to S3 in BIOS works as expected.
>
> I have  confirmed the T14/T14s/X13 AMD gen1 models have the same problem
> so I've run a bisect.
>
>
> crazy@ThinkPad-P14s:~/Work/kernel/git/linux$ git bisect log
> git bisect start
> # bad: [e73f0f0ee7541171d89f2e2491130c7771ba58d3] Linux 5.14-rc1
> git bisect bad e73f0f0ee7541171d89f2e2491130c7771ba58d3
> # good: [62fb9874f5da54fdb243003b386128037319b219] Linux 5.13
> git bisect good 62fb9874f5da54fdb243003b386128037319b219
> # good: [e058a84bfddc42ba356a2316f2cf1141974625c9] Merge tag
> 'drm-next-2021-07-01' of git://anongit.freedesktop.org/drm/drm
> git bisect good e058a84bfddc42ba356a2316f2cf1141974625c9
> # bad: [eed0218e8cae9fcd186c30e9fcf5fe46a87e056e] Merge tag
> 'char-misc-5.14-rc1' of
> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc
> git bisect bad eed0218e8cae9fcd186c30e9fcf5fe46a87e056e
> # bad: [bd31b9efbf549d9630bf2f269a3a56dcb29fcac1] Merge tag 'scsi-misc'
> of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi
> git bisect bad bd31b9efbf549d9630bf2f269a3a56dcb29fcac1
> # bad: [406254918b232db198ed60f5bf1f8b84d96bca00] Merge tag
> 'perf-tools-for-v5.14-2021-07-01' of
> git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux
> git bisect bad 406254918b232db198ed60f5bf1f8b84d96bca00
> # good: [e04360a2ea01bf42aa639b65aad81f502e896c7f] Merge tag 'for-linus'
> of git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma
> git bisect good e04360a2ea01bf42aa639b65aad81f502e896c7f
> # good: [b869d5be0acf0e125e69adcffdca04000dc5b17c] ipc/util.c: use
> binary search for max_idx
> git bisect good b869d5be0acf0e125e69adcffdca04000dc5b17c
> # good: [6495e762522d4cf73d0b339830091799881eb025] perf dlfilter: Add
> attr() to perf_dlfilter_fns
> git bisect good 6495e762522d4cf73d0b339830091799881eb025
> # bad: [a32b344e6f4375c5bdc3e89d0997b7eae187a3b1] Merge tag
> 'pinctrl-v5.14-1' of
> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl
> git bisect bad a32b344e6f4375c5bdc3e89d0997b7eae187a3b1
> # bad: [897120d41e7afd9da435cb00041a142aeeb53c07] pinctrl: mcp23s08: fix
> race condition in irq handler
> git bisect bad 897120d41e7afd9da435cb00041a142aeeb53c07
> # bad: [8b4c397d88d97d4fd9c3f3527aa66688b1a3387a] dt-bindings: pinctrl:
> mt65xx: add mt8365 SoC binding
> git bisect bad 8b4c397d88d97d4fd9c3f3527aa66688b1a3387a
> # bad: [ef9385fbf30e9484e4291db76e000b8961419782] pinctrl: iproc-gpio:
> Remove redundant error printing in iproc_gpio_probe()
> git bisect bad ef9385fbf30e9484e4291db76e000b8961419782
> # bad: [969ef42b1ae094da99b8acbf14864f94d37f6e58] pinctrl: qcom:
> spmi-mpp: Add compatible for pmi8994
> git bisect bad 969ef42b1ae094da99b8acbf14864f94d37f6e58
> # bad: [d62bd5ce12d79bcd6a6c3e4381daa7375dc21158] pinctrl: amd:
> Implement irq_set_wake
> git bisect bad d62bd5ce12d79bcd6a6c3e4381daa7375dc21158
> # good: [ac5f8197d15cf37d7ae37ff5b6438abe6c8509a6] dt-bindings: pinctrl:
> convert Broadcom Northstar to the json-schema
> git bisect good ac5f8197d15cf37d7ae37ff5b6438abe6c8509a6
> # first bad commit: [d62bd5ce12d79bcd6a6c3e4381daa7375dc21158] pinctrl:
> amd: Implement irq_set_wake
>
>
> Reverting d62bd5ce12d79bcd6a6c3e4381daa7375dc21158 fixes the problem.
>
>
> Best Regards,
>
>
> Gabriel C.
>
