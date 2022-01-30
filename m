Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE414A330D
	for <lists+linux-gpio@lfdr.de>; Sun, 30 Jan 2022 02:28:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346526AbiA3B2H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Jan 2022 20:28:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238167AbiA3B2G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Jan 2022 20:28:06 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7173C061714
        for <linux-gpio@vger.kernel.org>; Sat, 29 Jan 2022 17:28:06 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id g14so29704184ybs.8
        for <linux-gpio@vger.kernel.org>; Sat, 29 Jan 2022 17:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hsdAuwoAg7qwnLJlVMEDDTXi021Zq4Ivm1dCM+vbPPs=;
        b=TyRsph2/gOZcdWLHXcIspQWZuEx9+p1RXg52Tw6+N8sZdgTlYkyP+Vn9sDAUlpkiB6
         N+Lsj0ysGkkKnaAhjAkWTPxRgVI9ItrEnPA0SgzbTmg6tXqYAw1dOPXcy+0BwJ3RV1La
         l4/6qx/dLSiT2jna20tDUrcSwHNLz8LJAED/lNy2FrkDXs0ppXCMqKnh0NCxzwZrqurX
         1EGku7PSnHTSZJ0s67/8lYPBzFm30SDfHYeFfHf/75a1qk7qALECeCwgWQADMwOqAXP1
         Ut7J7McFUud1HJLksYmn3Jy3BbyEymcVZrJJH13uQ0N7sfFTjJoHjce8y8DS+/cODja1
         rT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hsdAuwoAg7qwnLJlVMEDDTXi021Zq4Ivm1dCM+vbPPs=;
        b=kuMcGvZYDrdFxbrNTcpKMirBGCV/wI8eT1Vcnu1RHW0vOztvYy2MhHOmlFTa9gAz91
         niomKMg+rZY50fqIR4wlz9xUaEpAxmATQOuKx8sIPgDnE15su/IQxLcrEfUuJH5i08KB
         e5nxAiD4+6CZqNW5/7btN+LGFv4vdgXXw0GorwHBhLcJdAOSfIWl/JQ25HykIeb8cI8x
         odyy7cAEWBug91FeFmO8lh5nhbtQPTklzCFQfFef2LetvtmySLSGLsM2L/sMzxEkLacg
         iV0AvFjrnWHHPD5zjwao7Dyye6fW0Jm7bImiKs7ViIDnjRWwcvAT9LhCjqD8yyX/fjSx
         4PoA==
X-Gm-Message-State: AOAM532LichoBlaJj69gSscBSU+yBGo7+VwaStxM+nEDr5McV0m0eOrE
        obTHxxJD3vYdPqnF1DYSlmMK3wclJ6//LJoD2CMwQA==
X-Google-Smtp-Source: ABdhPJyYJw7J1i2DU0pSR3z84ZATECJU70/tjvi/ZTOQjqBngtHmjnsVgVBEEXb7Fhp6bMyxhDtbn9RTBqTnOomGCGU=
X-Received: by 2002:a05:6902:1104:: with SMTP id o4mr21055261ybu.309.1643506085885;
 Sat, 29 Jan 2022 17:28:05 -0800 (PST)
MIME-Version: 1.0
References: <YfQdZTCvhjqjFUjm@black.fi.intel.com>
In-Reply-To: <YfQdZTCvhjqjFUjm@black.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 30 Jan 2022 02:27:54 +0100
Message-ID: <CACRpkdYngg0_M0F2Om3VTgjGMCYOqNWMvtKgGBKSxXum2-FrdQ@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.17-4
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 28, 2022 at 5:44 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Not many but still important fixes for Intel, ZynqMQ and pin control subsystem.
> Please, consider to pull for v5.17-rc2 (or nearest one).

Pulled in, I hope to send it off to Torvalds tomorrow.

Yours,
Linus Walleij
