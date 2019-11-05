Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67848EF9F5
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 10:49:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387870AbfKEJtU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 04:49:20 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34372 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730574AbfKEJtU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 04:49:20 -0500
Received: by mail-lj1-f196.google.com with SMTP id 139so21080096ljf.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 Nov 2019 01:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TAJe5ziKrCKK7rX2BdKY2ykoCXQoTfLqEiQktMB0pZc=;
        b=XCvudKjB3WldlrlLUYWp/rPSkhOTlZs7uTgllg94l9Dj/pvnvq+ZHihNGllZ5Cnfq2
         3YEIZcIKR7ab5YkIh0hd3sd3vHojbv0gNSkvu/8KbJzhxt6ln836ALEKFfSCMzu/KCdj
         CIm/wm9HhbRTGIlU7t98t9inx4s3syMNih/JbId2T8lWPiVQPkJfvBb8fXfHrmq8wVvu
         puto/O0rx5kW+R1PhNelEX7ydVAXKvbm31QA1dx+VlQegxySg7VaY9I/nwJ+ThZ/HjYs
         ZRMKjym+sv62w8vchDShhPjQ+J07r0+nWHFQAxFnFqO1NGw6cI3NdDud7gfMsrAp0dfG
         HBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TAJe5ziKrCKK7rX2BdKY2ykoCXQoTfLqEiQktMB0pZc=;
        b=irUtdIFz3bZPF7LDJsDFHpZ9vN19wgvqshoYRci7iG4di2jSY+g7UdWjO7W28Dye1T
         Xvc/gYjmuQjDHeAKzafdwSBCnXzwavtoX/c+J9che9yH2S+bZbq1F+REUJUrD9fSE/8e
         OpKQVfrZHkNa6PWT/pXRgrXaZqshiGBMlFlkvRgs6aFZE6Hqdg7gsW8PRMbYsf7z5PwI
         Cs7hSFi7OvAJePU1GNhzRzbgfy71XuSnrLmwxB2U3i9CskpT8qGYz0CyhZ9SyogHresi
         dD/eMV6pPucrhjb+4hWFitaGfuvQWhkmNrEX8L7Ht4PDqZ+Hw0GF2bJw/i7HG2f/nyNg
         Bp6Q==
X-Gm-Message-State: APjAAAVEYXkV6Vt6Nr2g06NzzS7Qzlkm8nVNUzvK4TWU9CdBhHIHfxXc
        mKFscR8gfuX3Oiwv1LgO6kJScH2VEYCYz6sWVDLrWQ==
X-Google-Smtp-Source: APXvYqwzKGwdM6Y55E27yheMCcnZ7qcC3Lb2zH9XzpcvqFMRqUcMcymk+LRc2yyxdiCWk004eqbcBGD0s8yWxwr90pI=
X-Received: by 2002:a2e:a0c9:: with SMTP id f9mr22644979ljm.77.1572947358711;
 Tue, 05 Nov 2019 01:49:18 -0800 (PST)
MIME-Version: 1.0
References: <1572419178-5750-1-git-send-email-mkshah@codeaurora.org> <1572419178-5750-2-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1572419178-5750-2-git-send-email-mkshah@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 5 Nov 2019 10:49:06 +0100
Message-ID: <CACRpkdbjFSiSmRrbjAm3xD-2jYcyHPb0U9L8rqMPM44_cQi8Bg@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: qcom: sc7180: Add GPIO wakeup interrupt map
To:     Maulik Shah <mkshah@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, lsrao@codeaurora.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 30, 2019 at 8:07 AM Maulik Shah <mkshah@codeaurora.org> wrote:

> GPIOs that can be configured as wakeup sources, have their
> interrupt lines routed to PDC interrupt controller.
>
> Provide the interrupt map of the GPIO to its wakeup capable
> interrupt parent.
>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>

Looks good to me but I'd like to see Bjorns and preferably also
Lina's review on this.

Yours,
Linus Walleij
