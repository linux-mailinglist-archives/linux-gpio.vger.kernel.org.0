Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CFCE2ECC84
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jan 2021 10:16:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727379AbhAGJPd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Jan 2021 04:15:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726545AbhAGJPd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Jan 2021 04:15:33 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1125C0612F5
        for <linux-gpio@vger.kernel.org>; Thu,  7 Jan 2021 01:14:52 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id l11so13073681lfg.0
        for <linux-gpio@vger.kernel.org>; Thu, 07 Jan 2021 01:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GuQBd5Bv/M8sEF3cnpZAcsUDB8M9ZiHQitHCQNG7YKs=;
        b=nDm2Cxv5oCTBaJCU9X7aUHty8qfhrprXLyiPp8fF1B/7A15p69CPeSIhpMWA30Lbv/
         BGiR5atDqSrSBvLzAEcFX2mFRtBNchkId65oUf6DAWbiqa8u6AjnQ7FyANlRbJEnsWAe
         ovXVuxCpTGAPXEsOSPwhMe9EJ3LXZlhZ8WxfiJoeJzhPid9nyKDkS/sMg+BMiF6EcgEH
         Gw++YWwdUuV3WZD6v9lJYAewkD2aDrwiqPZzU3UkAesdrahZZ9kfSqSGOn1yiRZrcBMf
         vnPAnxFcW7o4gNpNslXSF/QFJPBZUh0HBlpy/pnJce47vFRKgZm9aMJXjbA1oHk/stAZ
         Etug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GuQBd5Bv/M8sEF3cnpZAcsUDB8M9ZiHQitHCQNG7YKs=;
        b=EFA3BO4NiIuhFsUtnbfd+XG/KcHqwUbgQpKEaudmCu57K/hCjIDeIk7e8rqk2k37xS
         EqnodXOWnyR+mDb5kpW3ArnC39TuNn9ffAFcthFeLFaZy5SZhpTGlXo8eYaV0k6VmQhy
         9eagtxjAXGHXRkojVV12MVSJv5bUXYheOAN6QFt1sLTWFRRzaRGKInjZ2kMVN06XfqT+
         r6CYzTAuqU9o5iGpzeKK4Rjk/N2LTlmzlujnFWVRulJigxJ99ns1+lKTGydeL6Zgi+BD
         H7Co1sWfeAaVUwMYfZGC7rUz2nphmhfGPLebyJN6fhrQQcB+t8qj5kpa5hQfX1Q262uv
         NLzw==
X-Gm-Message-State: AOAM5332A9NWeb8Btv0daNIg4HI6J+1S3XlYO5D8GBeViMIj/DSQgWnV
        yLqR6lKZ+uuMaNF0yyFcHvRnMFB1raHHNlxWD8gQrQ==
X-Google-Smtp-Source: ABdhPJzluqhmKSx2xvx6A3E28Qg6ceuRBHi81mGKgx+iIRNrjoEvHxYEFN4uKbJymAzKULEKFmaBjYyjr3Kk49xzY0c=
X-Received: by 2002:a2e:3503:: with SMTP id z3mr3996490ljz.74.1610010891299;
 Thu, 07 Jan 2021 01:14:51 -0800 (PST)
MIME-Version: 1.0
References: <1609936000-28378-1-git-send-email-srinivas.neeli@xilinx.com> <1609936000-28378-3-git-send-email-srinivas.neeli@xilinx.com>
In-Reply-To: <1609936000-28378-3-git-send-email-srinivas.neeli@xilinx.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Jan 2021 10:14:40 +0100
Message-ID: <CACRpkda4AupiD2mkuYzmJTcq9nVVNUbo4KzyMQXUokFLxgp+Tw@mail.gmail.com>
Subject: Re: [PATCH V4 2/5] gpio: gpio-xilinx: Reduce spinlock array to array
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        sgoud@xilinx.com, Robert Hancock <hancock@sedsystems.ca>,
        William Breathitt Gray <vilhelm.gray@gmail.com>,
        Syed Nayyar Waris <syednwaris@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        git@xilinx.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 6, 2021 at 1:27 PM Srinivas Neeli <srinivas.neeli@xilinx.com> wrote:

> Changed spinlock array to single. It is preparation for irq support which
> is shared between two channels that's why spinlock should be only one.
>
> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
