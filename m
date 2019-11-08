Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7DECF59C2
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2019 22:25:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732202AbfKHVWC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Nov 2019 16:22:02 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:35289 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732246AbfKHVWB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Nov 2019 16:22:01 -0500
Received: by mail-io1-f65.google.com with SMTP id x21so7902298iol.2
        for <linux-gpio@vger.kernel.org>; Fri, 08 Nov 2019 13:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hHbuppcDTbd6STg/n36IHSkDQvgwaovyTFQQvw2epkA=;
        b=OByoOTNcmFJNLtvHQftXOvJ3EwPlUZKslCtZ5oa/wAMLAtwIxqf/4frJZyKSq+/sQ4
         J9PsCN6ojbD99kHspY9uPywEaqNgmN1H3Kf5nbghcQekUG29P3ibVItxCqTZIN5k8LUV
         2MYKE8HQtDmNsxMOegMVxCNOlqm8GgCUV1N2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hHbuppcDTbd6STg/n36IHSkDQvgwaovyTFQQvw2epkA=;
        b=PP7hh29TIzxA5AD8Z5C9O/Rs8Lzjg72e3M0LV14WCpcqIcem6IS/yMfY59SIH9y+95
         AON6K9mjH2XrYw2mHjC0fCvqk+PJd01tuxnRPPags/U+dp8BGwIHD8qeFBXcG7gBYez/
         4wugRbl1b5al8E1YCMa8h1ZanUBO93UMI6OJDd/YsEQrfCyvzWXsNO1BO1aZkgBCADLM
         8UMTUKdjL5FT0tCjU8XrC0BCFGj3LaLvzp+A8zW8EfCytj0qIL/iovF3Fc3RezEU9PdD
         Ner459ARm5pevPUcjsJ9xm3oIVtHZTa6awIX3g02iaNavLcjRO80ve9BzoQhEmewSJ2t
         3Rjg==
X-Gm-Message-State: APjAAAW6pIOvhjmXn+Dqr9ZWaJ1QjuvIF907rHaJP9jHedaG2r7PFxIN
        bM5eo58ggdgY4XCyhhq2o4Mr9UpduKQ=
X-Google-Smtp-Source: APXvYqwcYWLAGlNeGrIdFw8esu6ERV+yeCjZ8aJz3NQc8zfWhGj7EHQuH/ny3ndNEePhmQg5cAu8ow==
X-Received: by 2002:a02:6a24:: with SMTP id l36mr13237956jac.46.1573248120413;
        Fri, 08 Nov 2019 13:22:00 -0800 (PST)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com. [209.85.166.54])
        by smtp.gmail.com with ESMTPSA id k22sm586994iot.34.2019.11.08.13.21.59
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2019 13:21:59 -0800 (PST)
Received: by mail-io1-f54.google.com with SMTP id j20so7616808ioo.11
        for <linux-gpio@vger.kernel.org>; Fri, 08 Nov 2019 13:21:59 -0800 (PST)
X-Received: by 2002:a5d:9059:: with SMTP id v25mr8937747ioq.58.1573248118962;
 Fri, 08 Nov 2019 13:21:58 -0800 (PST)
MIME-Version: 1.0
References: <1568411962-1022-1-git-send-email-ilina@codeaurora.org> <1568411962-1022-5-git-send-email-ilina@codeaurora.org>
In-Reply-To: <1568411962-1022-5-git-send-email-ilina@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 8 Nov 2019 13:21:46 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WOVHQyk0y3t0eki6cBfBedduQw3T-JZW2dERuCk9tRtA@mail.gmail.com>
Message-ID: <CAD=FV=WOVHQyk0y3t0eki6cBfBedduQw3T-JZW2dERuCk9tRtA@mail.gmail.com>
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

On Fri, Sep 13, 2019 at 3:00 PM Lina Iyer <ilina@codeaurora.org> wrote:
>
> diff --git a/include/linux/soc/qcom/irq.h b/include/linux/soc/qcom/irq.h
> new file mode 100644
> index 0000000..85ac4b6
> --- /dev/null
> +++ b/include/linux/soc/qcom/irq.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __QCOM_IRQ_H
> +#define __QCOM_IRQ_H
> +

I happened to be looking at a pile of patches and one of them added:

+#include <linux/irqdomain.h>

...right here.  If/when you spin your patch, maybe you should too?  At
the moment the patch I was looking at is at:

https://android.googlesource.com/kernel/common/+log/refs/heads/android-mainline-tracking

Specifically:

https://android.googlesource.com/kernel/common/+/448e2302f82a70f52475b6fc32bbe30301052e6b


-Doug
