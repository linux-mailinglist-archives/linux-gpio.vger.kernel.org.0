Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75D30430557
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Oct 2021 00:18:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244816AbhJPWUs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 16 Oct 2021 18:20:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241076AbhJPWUj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 16 Oct 2021 18:20:39 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FEF1C0613E3
        for <linux-gpio@vger.kernel.org>; Sat, 16 Oct 2021 15:18:25 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id x27so57235509lfa.9
        for <linux-gpio@vger.kernel.org>; Sat, 16 Oct 2021 15:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5hTZmsVraLnoyoiajwq2kp7kDJD/UBIvDGojNlZOjYA=;
        b=MlO9EhDO0R+F6a5IFnTIPbpmq5BWUpNHbM6qRx1Se8vfzBsGJpgsGiIfisAVmCOyo8
         lTiW0jaVH1nUXT0F0YXJntoy6WAyo07Tyh36UXjKY9JKKvpY+pfD0X7zs0DozQ9DQXP6
         karq1mJ2Le0t4/YNCerJCdx+i1q+nbSTF9hakC6Xo16kJejquw5aMr9bdtYSfioHkoCO
         70BEy+4R6MmLmofcuDIv2wWHzULVW6hq5ZmyX8PhgEgrkEFcn6x7XKEMCCoMXR5gUhsw
         G+861Cw4nKW4ccwd0KS42UXE5caVkz3VajZVIPE6ghQLY+1a5QKi4c9DVcbODx/pm7FQ
         jrGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5hTZmsVraLnoyoiajwq2kp7kDJD/UBIvDGojNlZOjYA=;
        b=eD2ZA2lqsC5Cmy3kWikozB8Hnq8nLQT2zaLx6qES0BdN7YGTIxmZUGZRWipY8KoyN8
         BugDPDqhk3onMUE7FK0QeB0TJlTPwDzNw9dZvkSuEjBW28lOv8JBiec/yhk359S9boG3
         xaSmM8GJ60g+NTQR24fDnjM9fVcp0C18w1mVOqFhvRfFaT45abtvPnC9VGWhUd68XVmX
         wlrUrynLmPYiYu5YqZZurkWWgaWh6KdgJgtRAXBYz7FbwTG6rwOWjesmQXTsrqPmcFHl
         VupyeVXLhmW2ca5seJ3xoDeJ9oh6B77HrmFkGNQy0TMc5EpjEkyyeiEraBchvS1H/QHg
         +gIA==
X-Gm-Message-State: AOAM533c0t3SJSmNWuWonzuW/7wLvaFNCooDCREVLj2z6kIsVHAwkhLi
        u8SKcmWx+8r4Vb53dHlhdcZ0fhWc36cuZZv21IcrlQ==
X-Google-Smtp-Source: ABdhPJy7PQL7FlWahwMf8zqvRh3tgaf9x3NU3N/Jf4Z/TBpgv3e+zIyq80gCL0b/Z+0DKPZ9HVLLg6VScA1ErGJ2s9s=
X-Received: by 2002:a19:c10a:: with SMTP id r10mr19208289lff.95.1634422703906;
 Sat, 16 Oct 2021 15:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <655523d7bf9658eb0b8e49a06c8b79a04052e5d5.1634286595.git.michal.simek@xilinx.com>
In-Reply-To: <655523d7bf9658eb0b8e49a06c8b79a04052e5d5.1634286595.git.michal.simek@xilinx.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 17 Oct 2021 00:18:13 +0200
Message-ID: <CACRpkdY4pQXGB0e+HY1UYrbNpSb9tZzcnMh9zETCpSxxQ-HoKg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: zynq: Add power-domains
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Michal Simek <monstr@monstr.eu>, git <git@xilinx.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 15, 2021 at 10:29 AM Michal Simek <michal.simek@xilinx.com> wrote:

> Describe optional power-domain property to fix dts_check warnings.
> The similar change was done by commit 8c0aa567146b ("dt-bindings: gpio:
> fsl-imx-gpio: Add power-domains").
>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
