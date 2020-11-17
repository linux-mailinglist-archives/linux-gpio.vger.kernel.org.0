Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EE1C2B72C1
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Nov 2020 00:58:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbgKQX6K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Nov 2020 18:58:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725771AbgKQX6K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2020 18:58:10 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2F36C0617A6
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 15:58:08 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id w142so337073lff.8
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 15:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DDTTTdwHCc1w1LQn9d18kS3gdpQLwepnpceiCNjIF5c=;
        b=rcGkBAJdPYVQMZHDJSkWZvKSeJ6HxKc3H8BAwdm8d6PklBENCwisqQJCIzC2yk+hd0
         k4LP0GudZ7IOem8wVnr5t0T5W71mKV5W/oHDi4FaQaZLpQsY7L4y7cxjpLrC/+/htiv+
         XdEpo9vw5EDGYbqc7P1APc8kOKSDT83PnDY/v8qSeYDZgXu1yu/3QDa+JqGp7pY7NtER
         8wZqxMZ+c0A3KoCnmKmTdvPOWuZx43g7jWn0LidaFdZXmrMMapdIBFmuuLBOXpcjK54t
         JEJlyimlODrDfd+IFcIOolOj9Ah7v/iIUDBemALVAUYelH54WYc+HEYB5+y6NGtX0KKA
         x+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DDTTTdwHCc1w1LQn9d18kS3gdpQLwepnpceiCNjIF5c=;
        b=c3agDoPpgLoWF5CoEbedd1VKM0QQ+ULyyoPlQ11P7YJBlufn7RTJOa2XrWcnlJZLev
         ez6smqShvUODntmwOygEx4HRLawM0bRfL73LpIwRq0UhJMcODoEa5JKP3AVZ2xfYsV/X
         sdxrT+RnEQJVET3Nw2/EYl3L86TU5lMGYJNcWKHxiAKGLFb+63+HqJvsr4YmTBl+1XMl
         uJ+MkZeOQezJnfbGgvyZAEzYb6+ucERX99rbr4lLS11U+1ZNtuw4+KRk6Y0S5kFKRdVR
         XSlwYLgDwutUWJVkEc8R101GSajBQztt6PxKOrMePIEmY1Amrv9E1kuH3BClemb7umrm
         jD+w==
X-Gm-Message-State: AOAM532VyJyDoaCPz7I6TSg65w0ZFwgsoIMZITUeEsXZ1xR6YIOexFMn
        k21AXcR3LSWZtoW2EoEEhvkA3pW4AI0fFfYslJDGLmhiwfMniw==
X-Google-Smtp-Source: ABdhPJzl7v4WoPOkTVcPzyibPZn61/XR9Cv/LuU2FZS5y89+0ItckbPb1gu2n4aru3xIHCAbIimUrfmFzDPM3B+RzB0=
X-Received: by 2002:a19:e08:: with SMTP id 8mr2436766lfo.441.1605657487028;
 Tue, 17 Nov 2020 15:58:07 -0800 (PST)
MIME-Version: 1.0
References: <1605201148-4508-1-git-send-email-srinivas.neeli@xilinx.com> <1605201148-4508-2-git-send-email-srinivas.neeli@xilinx.com>
In-Reply-To: <1605201148-4508-2-git-send-email-srinivas.neeli@xilinx.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 18 Nov 2020 00:57:56 +0100
Message-ID: <CACRpkdaUZejMj=rucoW0tnLykHo4vYu5Qj3rWq5x9YNiALu0ZQ@mail.gmail.com>
Subject: Re: [LINUX PATCH V3 1/9] gpio: gpio-xilinx: Arrange headers in
 sorting order
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        sgoud@xilinx.com, Robert Hancock <hancock@sedsystems.ca>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        git@xilinx.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 12, 2020 at 6:12 PM Srinivas Neeli
<srinivas.neeli@xilinx.com> wrote:

> Arrange header files in sorted order.
>
> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
> ---
> Changes in V3:
> -Created new patch for sorting header files.

Patch applied.

Yours,
Linus Walleij
