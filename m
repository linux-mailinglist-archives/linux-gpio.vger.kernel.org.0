Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 497B4221EFD
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 10:52:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728347AbgGPIwj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 04:52:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbgGPIwj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 04:52:39 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E384C061755
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 01:52:39 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id s9so6206444ljm.11
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 01:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+4SkJVL9wnAlCfKY4DdUogrbTCM+/fohgbxw2ivrMDI=;
        b=IVPN7uQz4RycEvnB+kUblr+7G5kcMWSjxVyOau6YkD2OKaEdg3pVafN4Qlgs/SvWRG
         q6685eGAmEKhKiTPTJ10fgjhS6Haazk+r+a3l/p2Q35RKXjp6DYrzZ6YOB/YLKdRfZlJ
         E0D4ZWts2qIQzCDvCKCf0NGu8uyicx9/v5gNydH3S6g3oa7h2mhuRSdmfKLlDUUXing+
         /yKbvxVnqmJKid3I3lZ8Eezjp22hnoAkIOEkpyGM4pc78E1Q2NYd1/TRKKDhhSM9Fqwz
         5sbOW1PIIWD/bN+fdagqfOD03K5TeyNWHcSSKkyssRpuLgumiGtK+qLL4J58A3QNdPkj
         9t+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+4SkJVL9wnAlCfKY4DdUogrbTCM+/fohgbxw2ivrMDI=;
        b=p7KrUxqkqfioQXVNnELHRCrDr0ju8StrWv38M3WEhNY5xVb9DGzRek9LYyIEG5eYuJ
         Xx/XtCIL9KG0ZI2JoATbDYTyAKyapVDxTqLb5OclI5TDIkyhAMQkiYptFu0c19sH7Bs0
         SjTzUuVcPuj7sKJopmFRsTS3fjPhK+6MZLxGv8RvXBQv202Ilqg7YQdRDLl2tUdfvos/
         cvoLFNVYYl/RZTFxa+ZV156UNl53qn0Co3V+uKrlCYAhNA5Pn+4zlflTRdyvcvUNPK13
         rePcEXAOCO04tQMHSi0ypMBr4Fs9dw14IQqHco+CmBkv6NwzxkZQSNucVzMY6b7M3qUr
         V3/g==
X-Gm-Message-State: AOAM5300QfwqZPB5KmRXV/B8oAw5TMTELRwvhRPaDHYD4d7bx9TuZYLC
        fu+U62XayNvRa6qj+Ben8m/PTPZKALUM0BWTIbl10w==
X-Google-Smtp-Source: ABdhPJxnjmMYaXbpYxjf3I78rpw/gV+A21zEdTZdXJDis0U9G4POoYVAm8UXaPmX1Ni16xc0ABeAmnVEozCLRMOC1lo=
X-Received: by 2002:a2e:810a:: with SMTP id d10mr1452133ljg.144.1594889557461;
 Thu, 16 Jul 2020 01:52:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200709171203.12950-1-digetx@gmail.com>
In-Reply-To: <20200709171203.12950-1-digetx@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Jul 2020 10:52:26 +0200
Message-ID: <CACRpkdZNLDgsrPRenyvPZD6A+Wvj-P3AJBf5Ke-uY9=R9DyjxQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] Improvements for MAX77620 GPIO driver
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-tegra@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 9, 2020 at 7:12 PM Dmitry Osipenko <digetx@gmail.com> wrote:

> This series addresses a problem that I discovered on Nexus 7 device where
> GPIO interrupts may be left enabled after bootloader and the driver isn't
> prepared to this. It also makes a small improvements to the code, fixes the
> non-released interrupt bug and converts driver to use irqchip template.
>
> Changelog:
>
> v4: - Added stable-tag to the patch "Fix missing release of interrupt".

This v4 series applied, thanks a *LOT* for your patient work on this!

I need to fix the USB port on my Nexus 7 so I can test how the
mainline support is working these days!

Yours,
Linus Walleij
