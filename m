Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D249547E633
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 17:13:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349058AbhLWQN0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 11:13:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349038AbhLWQNZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 11:13:25 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62E14C061401
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 08:13:24 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id w16so23231192edc.11
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 08:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yHLMEZ1VuzE6uxMbdPv55wU7eVtiVgZCa+D9ZzJsUAc=;
        b=hI8YCvDquqUmJHnaXxcafS+98svO1SNpzc/r98lDaV2TuUo2k61fxi4pE8oBIrSENR
         tNTGQWwExqzOqg+6lIDd3P5PwaUXG1kclyGVargOvVRFtSMPO7V8VFcuzPoF/cJY06vw
         tSZzOczh5Ui2b0bS4cGDILifJpmy2tgFLWP6VLyuZQpKSCCPZyJ+qim8VL+3KMBKAh69
         ccpCOM1KS7uuw3Hcj1Ql4J1NAjLuhscL5J48DcyDiOP2UICw+LVYQ80b+BPASPJyztdP
         AFJCKpB4M1rGpmY6pU7+LNxTR03DUE9AQVUt4rVcuijKD5UuizlCw36lEK4aue6W2qhu
         ujQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yHLMEZ1VuzE6uxMbdPv55wU7eVtiVgZCa+D9ZzJsUAc=;
        b=SpfSXIZDtI1SyA5GvemlBl6X3+ht6LzAPbLeUNzcDC8/HbyTDcqTksduPDaMF15fn5
         kwWUOYYI5j40AbZXuUboxlhx8gWWn/2LdhBNYMvQn/MvlJ8qvQbORNfAeDEUXqgW29Gb
         m+YbRHaHSmwVETJ8TLJoW6s0npmbOdDBkxzkxYUJkimO8UxytLgJx88LjB6icacnAghb
         4BsxUmcfiEadof2JjD7CKlAH2HIkpLRnoBarTMeKoLYV0uHi7CWw3hpokXb5GAHZPoF0
         l70mopWYB4owH1Ewmi8K2RNfyw95ZZLiiBR4X+CjuzjSGr+zPjRXNYnd/rFWL7XbMakP
         WUHQ==
X-Gm-Message-State: AOAM532b+zCbdKnFj6w6Q5vHeQweelX6yBtIMb8k3+83xhwwKfifS/2w
        nyUngbdQN5UTj4cHvWs0LtH4jGuMu1jvTgPBZulqeA==
X-Google-Smtp-Source: ABdhPJwohpYNifaB0bSL+BV70k2Gb6z/DwdPRr1BpabSQW0Lg20czznFwuhburUE3lmTL/kEwSIxntG4h67ZS2/OSeE=
X-Received: by 2002:a17:907:6289:: with SMTP id nd9mr2421168ejc.101.1640276002971;
 Thu, 23 Dec 2021 08:13:22 -0800 (PST)
MIME-Version: 1.0
References: <20211216141009.1478562-1-thierry.reding@gmail.com>
In-Reply-To: <20211216141009.1478562-1-thierry.reding@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 23 Dec 2021 17:13:12 +0100
Message-ID: <CAMRc=MfR5vD022zhT-vfqSiyY2nv_GRRT92XXgw+2YwM4xCtYA@mail.gmail.com>
Subject: Re: [PATCH 0/2] gpio: tegra186: Add support for Tegra241
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Akhil R <akhilrajeev@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 16, 2021 at 3:10 PM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> Hi,
>
> this is another extension of the Tegra186 GPIO driver, this time for the
> upcoming Tegra241 (Grace) chip. Note that while this adds the DT binding
> header, it doesn't actually define a new DT compatible string because it
> is unlikely that the Tegra241 will ever boot using DT but will use ACPI
> instead.
>
> The pin definitions are still in the "DT binding" header for consistency
> with previous chips. Just wanted to highlight this to preempt questions
> as to why I haven't Cc'ed Rob or the devicetree mailing list.
>
> Thierry
>
> Akhil R (2):
>   dt-bindings: gpio: Add Tegra241 support
>   gpio: tegra186: Add support for Tegra241
>
>  drivers/gpio/gpio-tegra186.c             | 52 ++++++++++++++++++++++++
>  include/dt-bindings/gpio/tegra241-gpio.h | 42 +++++++++++++++++++
>  2 files changed, 94 insertions(+)
>  create mode 100644 include/dt-bindings/gpio/tegra241-gpio.h
>
> --
> 2.34.1
>

Sounds good, applied, thanks!

Bart
