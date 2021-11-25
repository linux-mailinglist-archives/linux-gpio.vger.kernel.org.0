Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1958345DE8A
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Nov 2021 17:18:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356524AbhKYQVW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Nov 2021 11:21:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240883AbhKYQTV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Nov 2021 11:19:21 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61BEEC0619F6
        for <linux-gpio@vger.kernel.org>; Thu, 25 Nov 2021 08:04:48 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id l25so27348913eda.11
        for <linux-gpio@vger.kernel.org>; Thu, 25 Nov 2021 08:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DVRK0vsAFSd9un/Qpxcb2BS/qNq/R1YBd0ezYm4ihh8=;
        b=DVh4+lkLH3d0ppsry8cHOlOrOmUiw1716a3Y7lbdjSg/PlxCqMZPWtJQQkLKeOqB5l
         fT/E8lZgfCgO3r5/EI37xYa31hyR0MYs33g5OPP+SeN1k5eRtbRiVrO8fT14sOa3i2PC
         p5S7JwFYKBCGEr8kgag6D94EEgam3lh7Xn6kdg2szGWdPQMK5YA9k0YwhQMZzUP0f3O3
         vE2atMySlfkfF4c8xe5cEXLc/Q4kk6yqWy1Z06RgtV7NrXoYPVORhA0qdtKcguJxz0sf
         UjqBfyOwcXWQaANLOJULimUseWHmeY8/Kds1P63emIhWy3xLP8WIV7H42uIk5SWrIzPK
         SPCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DVRK0vsAFSd9un/Qpxcb2BS/qNq/R1YBd0ezYm4ihh8=;
        b=nQ1CLIVmlzQaLLrNc61OnFLsrr/F+uw3/bQciFYrTiwUaSMQrkZOgjLOpyaveLf/Cm
         lTDzx/VmEHrCvo7Kz+tvScf0HKxf81AHKfzst1bVSDVi/UzG6eps3gjjnFmFUsf+Bjzl
         Qzvqa75Z9hvr6y9aMKNAVBgDxC/zZZEgZlFRGnaGcPK4wXSD5Phcb3/GeuFG1W3xOFOB
         4V/ILzGP2u3rbzpZbjzNi+pv0ossbF/u4rBa6IgC1xp39My+QGPo184W/8JtXX9lBg/i
         WBv32GoBoT+j9GwIpUgVN86kfQBEZr306Sg2DLNKXqtcUH/d5MSMeNfkUGc3T2hJKz94
         aBMg==
X-Gm-Message-State: AOAM532q4F71V64HYnwnPTF4v1kRW6TQmGgcgkfEU5cGs25Qk0/QpKWC
        7cH0WloqxD4doM9IB3s9v5FjjSQE6+7gIr6cDkifd0Mpg/g=
X-Google-Smtp-Source: ABdhPJzUBRSv5Iu4pHA8rtLoagRjValMFi9LTD1PIRTDtInoLO6zBw0d3xkq08FIkx5/VbCm3E7/HaGhKI7zu7jI6ao=
X-Received: by 2002:a17:907:869e:: with SMTP id qa30mr31077086ejc.356.1637856286611;
 Thu, 25 Nov 2021 08:04:46 -0800 (PST)
MIME-Version: 1.0
References: <20211124141724.1734978-1-arthur.heymans@9elements.com>
In-Reply-To: <20211124141724.1734978-1-arthur.heymans@9elements.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 25 Nov 2021 18:04:10 +0200
Message-ID: <CAHp75VfAYgDHJMBL99PQLjLP6QzDN4vub4-vYfinqrgq-dZ_2w@mail.gmail.com>
Subject: Re: [PATCH] drivers/gpio: Add cy8c95x0 support
To:     arthur@aheymans.xyz
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        patrick.rudolph@9elements.com,
        Arthur Heymans <arthur.heymans@9elements.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 25, 2021 at 4:21 PM <arthur@aheymans.xyz> wrote:
>
> From: Patrick Rudolph <patrick.rudolph@9elements.com>
>
> Add support for I2C GPIO expanders:
>
> - cy8c9520
> - cy8c9540
> - cy8c9560
>
> Add basic support for GPIO input, output, direction, pin config and
> interrupt handling.
>
> The chip uses an optional regulator called vdd-supply.
> The ngpios devicetree property can be used to specify less GPIOs if not
> all are connected.
>
> Tested:
> - Input
> - Output
> - Direction
> - Pullup
> - Pulldown
> - IRQ support

Thanks (*really* appreciate this effort, since I have even hardware to
test and had thought of developing the driver myself)!
 And unfortunately NAK from me. Please do it as a pin control.

I specifically had in mind to have PWM stitching with the pin control
subsystem with this chip taken as an example.

-- 
With Best Regards,
Andy Shevchenko
