Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D045F5B7A
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2019 23:57:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727768AbfKHW5W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Nov 2019 17:57:22 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:33731 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726349AbfKHW5V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Nov 2019 17:57:21 -0500
Received: by mail-il1-f193.google.com with SMTP id m5so6594796ilq.0
        for <linux-gpio@vger.kernel.org>; Fri, 08 Nov 2019 14:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=15aP2JIo2un+I+5s0CvWGMu22FT6huOg3Ifbcx3TkJg=;
        b=FATIMyIMWI2cM5vk5yduPwEeoizGoSfyKtyHYbMALU237IVsQGNU05IOJKkdabxCbO
         0m/DzALGw2i4wZ8zesh0KudOZ6vdFHsEHdC0u2B5kESkwOFnxSiA+yHfjNhCb/zwnfN0
         YJxBlA5TLrD+LTxSdgzigyE+mVolF54tuLjCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=15aP2JIo2un+I+5s0CvWGMu22FT6huOg3Ifbcx3TkJg=;
        b=nTc7hgGPs/VjxnUMzc7wFYnlCwcVxgdO+TwaE2YUb2pSTxB0zgp5qqiC1d/QQjGQJO
         /wAzl/Y980/QQE+lsAz9gHgyPXw6M1ERTen0W4hW+CXotvVaxlexntxX6byWjD1NGxjE
         WmebA6C9i/kDtnS4bX3RyKrJ80Cd2mDToBEqxE3WXxYzjZxMoZvGssI6aTby3v66FyD5
         /gCsjlrNpzm6KFAuezBGgJLP2QGH44IgeKDv2qDfC5IrAei4KdQIgOHNn4nhP5iilX/U
         lM4+mJ9/6lcg7CpZlNUB1WNRcZsRIwt1V6TD26EFWlyma21i0kMLg+fw04ewuzKWwknv
         T65A==
X-Gm-Message-State: APjAAAUG1brUn4ZGbL28DIljmhXY4s2EY1OmZ4hPNS8K89elJO+lZ432
        e3XaH6OrSUZDsrhiN0tWc+SLTahaeu0=
X-Google-Smtp-Source: APXvYqyuhBc4Yx+TdcXFx7lrcFt0VqTPfgpERxBD8LjhOTLclnjVIuQXy/GpWFjOIZvwhuOnhmlyJQ==
X-Received: by 2002:a92:980b:: with SMTP id l11mr15728426ili.194.1573253840723;
        Fri, 08 Nov 2019 14:57:20 -0800 (PST)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com. [209.85.166.43])
        by smtp.gmail.com with ESMTPSA id 139sm923380ile.15.2019.11.08.14.57.18
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2019 14:57:18 -0800 (PST)
Received: by mail-io1-f43.google.com with SMTP id r144so8087481iod.8
        for <linux-gpio@vger.kernel.org>; Fri, 08 Nov 2019 14:57:18 -0800 (PST)
X-Received: by 2002:a5e:8e02:: with SMTP id a2mr13245256ion.269.1573253837987;
 Fri, 08 Nov 2019 14:57:17 -0800 (PST)
MIME-Version: 1.0
References: <1568411962-1022-1-git-send-email-ilina@codeaurora.org>
 <1568411962-1022-5-git-send-email-ilina@codeaurora.org> <CAD=FV=WOVHQyk0y3t0eki6cBfBedduQw3T-JZW2dERuCk9tRtA@mail.gmail.com>
 <20191108215424.GG16900@codeaurora.org> <20191108221636.GH16900@codeaurora.org>
In-Reply-To: <20191108221636.GH16900@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 8 Nov 2019 14:57:05 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V_hieLP-qqU23=shM0PdeXpu=Spe3O6a-WHur7w+AnAQ@mail.gmail.com>
Message-ID: <CAD=FV=V_hieLP-qqU23=shM0PdeXpu=Spe3O6a-WHur7w+AnAQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 04/14] drivers: irqchip: add PDC irqdomain for
 wakeup capable GPIOs
To:     Lina Iyer <ilina@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>, maz@kernel.org,
        LinusW <linus.walleij@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        mkshah@codeaurora.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Fri, Nov 8, 2019 at 2:16 PM Lina Iyer <ilina@codeaurora.org> wrote:
>
> On Fri, Nov 08 2019 at 14:54 -0700, Lina Iyer wrote:
> >On Fri, Nov 08 2019 at 14:22 -0700, Doug Anderson wrote:
> >>Hi,
> >>
> >>On Fri, Sep 13, 2019 at 3:00 PM Lina Iyer <ilina@codeaurora.org> wrote:
> >>>
> >>>diff --git a/include/linux/soc/qcom/irq.h b/include/linux/soc/qcom/irq.h
> >>>new file mode 100644
> >>>index 0000000..85ac4b6
> >>>--- /dev/null
> >>>+++ b/include/linux/soc/qcom/irq.h
> >>>@@ -0,0 +1,19 @@
> >>>+/* SPDX-License-Identifier: GPL-2.0-only */
> >>>+
> >>>+#ifndef __QCOM_IRQ_H
> >>>+#define __QCOM_IRQ_H
> >>>+
> >>
> >>I happened to be looking at a pile of patches and one of them added:
> >>
> >>+#include <linux/irqdomain.h>
> >>
> >>...right here.  If/when you spin your patch, maybe you should too?  At
> >>the moment the patch I was looking at is at:
> >>
> >>https://android.googlesource.com/kernel/common/+log/refs/heads/android-mainline-tracking
> >>
> >>Specifically:
> >>
> >>https://android.googlesource.com/kernel/common/+/448e2302f82a70f52475b6fc32bbe30301052e6b
> >>
> >>
> >Sure, will take care of it in the next spin.
> >
> Checking for this, it seems like it would not be needed by this header.
> There is nothing in this file that would need that header. It was
> probably a older version that pulled into that tree.
>
> Is there a reason now that you see this need?

From the note in the commit I found I'd assume that Maulik Shah (who
is CCed here) has history?

...but looking at it, I see that your header file refers to
"IRQ_DOMAIN_FLAG_NONCORE" which is defined in "linux/irqdomain.h".
That means it's good hygiene for you to include the header, right?
Otherwise all your users need to know that they should include the
header themselves, which is a bit ugly.

-Doug
