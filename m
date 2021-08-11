Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CFD23E924B
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 15:12:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230486AbhHKNMe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 09:12:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230233AbhHKNMH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Aug 2021 09:12:07 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A23A0C061765
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 06:11:38 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id n7so4581329ljq.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 06:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lgZlLOQSGd7JAZDlhlp6F842HBfgrwr0OPnh9kA6XCg=;
        b=xCvv2dHMI1dReAdeb7Lg/ttkEnbPTWf4OMmhHRNg9SjPOqYCOLuoE7827o0igZdq4H
         DWMsbcOwyjpidwjxkpoUbs6qAX4sYuy0pWPbZskTqv9OtyaEQuWRRcr9v1ulOlGAnDKB
         xnhq3u2GufuFscsk703hi7lMuIBACYzk4g3FlphtbHas09lbiSjBTKLjWX1eI6ElO4Xx
         h7G7AV9HeY39slC509jtyj3CTYoonPhs7DVYQjNV9imOfo/dx/0Z07/4vfAFIj74s+5H
         AXJOPphc0/zIh3ZB2pPU4uBDqRHjdmkSvdM9I8YqD+iFC0s6dB58X3Qnh0I/AzrZ9hqf
         BD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lgZlLOQSGd7JAZDlhlp6F842HBfgrwr0OPnh9kA6XCg=;
        b=q3lDOlBV64oWjQqyq/NvYp3JsWcghlHoaHwfjEPy8EHnLxCfSZQgdQTOaC4yBrl7Md
         2fMKYC8qBXHt2aa3ihxXbyZDT6xZC9IUEQtX5Tn7aOyJlxxIgO8o91VzfmSCJdyEziWJ
         Su8mB4LZOUizaypW+Y50+2Bc+OtFGN9F95kOPCMgmXeGI6vi6mEgHfFJYB42NUPiUfqz
         6BLNMpWZsA0dDH1OapjZc+4VSq/mZC3uJ/j9l1CKXkyMv+OeQXgmazKZcN6XKAIky+UW
         p0EQWliFlu0NlLFfyMM8bHFXhz0/m0ndGA7kxhyi1fDfSPeOBJ/P0/VeFHjGiAjwF1Y3
         E9bg==
X-Gm-Message-State: AOAM533fWB+pjSiSPjzr1gN8Z0ggK5ZLjnTYutJ2Le2bm4EQl1d11BIA
        XDG6iHntuoapoDdPpBqzKXximF4LbDPqrmjmLxtV+A==
X-Google-Smtp-Source: ABdhPJx1DLEuFr8Fad8R4D/BUmaXsH6vX2SPni+p3ktOQcDloaMJer+ukeY+anfpsispsRqP64vLhRToFvZuNtrE8tQ=
X-Received: by 2002:a05:651c:1318:: with SMTP id u24mr23326114lja.200.1628687497061;
 Wed, 11 Aug 2021 06:11:37 -0700 (PDT)
MIME-Version: 1.0
References: <YQz9VXAHPcvQOSi2@black.fi.intel.com>
In-Reply-To: <YQz9VXAHPcvQOSi2@black.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Aug 2021 15:11:26 +0200
Message-ID: <CACRpkdaFz3Je4GmEgBzbm85nHxBNw8OSB3C6fA_KvVL1nYPxQw@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.14-2
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 6, 2021 at 11:20 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Hi Linux pin control  maintainers,
>
> One fix for number of bug reports. Should go as soon as possible to v5.14.

Thanks Andy, pulled into my fixes branch!

Yours,
Linus Walleij
