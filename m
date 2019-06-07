Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BD6C3975A
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2019 23:08:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730401AbfFGVIU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jun 2019 17:08:20 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43588 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730254AbfFGVIU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Jun 2019 17:08:20 -0400
Received: by mail-lj1-f194.google.com with SMTP id 16so2893745ljv.10
        for <linux-gpio@vger.kernel.org>; Fri, 07 Jun 2019 14:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f6jL7ejK1vdoksS3xLayzljNzEjieCxBcJeb5tUZgYI=;
        b=vegyCWkoFq7IWHKgGIIU7ajpXmTFnt5PpMQ9WCQO4zF3Q/P2g/7GacC2aZLGSPk7+k
         bwnKT4BjE4rsV0FAHf9xG/aEDLvBOW+z+MciDjGAJnnRQTaNamB/IA7WdfJeNgPuY5VL
         l69vSI2aMGChyzbeGI9JtyDF+xnfqxqznHF5qxCwD1n4/FJaZGuR38MdzlOoNiqnR4+D
         lOx0xMbHlCKYL1nYd151G75AOt9/cgRis88Her1XSNeTwqKZJGwxGK3xCG7hInDN+zoG
         +/PsDxfzby9IDLyGazyfoIU2PDdufTCb8/oXvvsP0ynVXnqs+pyfxXYNdkyYvxFqslBV
         /lZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f6jL7ejK1vdoksS3xLayzljNzEjieCxBcJeb5tUZgYI=;
        b=uMTkosKm1BuR3I1pIy1zMAw33ChHHgiYoIuAELJU9a09sPSMOAz6dzg9UsbJFdb8jf
         FQHTMqY/laHYzRW5qbHsP1BBoV1q6XCVnb25x2yA8ROGos+EXEMpqVuuFIcsI04zkaRy
         OhkTNcjIpDFPNCJrzVGzXTtADlasCWVeDtw31FrtOSsqPlxO9/B02yWv3eVRIw6I+t9a
         l2O86al/NzkSIOwBOKe7pX37fjdQ0qCS2z8WF+nPZFU2D0v26V8FWmfgVPs/u2ovJ3LM
         ojGbw1b1cHWJVRmgsIpTrAH2t7hANDJUH3XEUsHMh5kzyNZd5FS527nP0P+JmqLJ/wNi
         0ORg==
X-Gm-Message-State: APjAAAW6j2aGyLS0ByafBYunOC4WhnZI0NtEqazI219rHtdIa02BYcat
        R8iFc0+LKuX1jXJxJT2shPsss9PFHwNK/gdtT6gvGa5a
X-Google-Smtp-Source: APXvYqwPTQVLwavT2qXQKKLz8bFfoqAyN+lJI4vElZiZLHJbP2BQZYrz/3pv5Uyw1qDhaFDWje1vP/YBI4KFNgDVDhs=
X-Received: by 2002:a2e:8902:: with SMTP id d2mr29169874lji.94.1559941698057;
 Fri, 07 Jun 2019 14:08:18 -0700 (PDT)
MIME-Version: 1.0
References: <1559285512-27784-1-git-send-email-tengfeif@codeaurora.org>
In-Reply-To: <1559285512-27784-1-git-send-email-tengfeif@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 7 Jun 2019 23:08:10 +0200
Message-ID: <CACRpkdbdkbSofrvJ0hSV66DX+DcwWXp0ONDjx0265Pz50yE8TA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Clear status bit on irq_unmask
To:     Tengfei Fan <tengfeif@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Niklas Cassel <niklas.cassel@linaro.org>
Cc:     Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 31, 2019 at 8:52 AM Tengfei Fan <tengfeif@codeaurora.org> wrote:

> The gpio interrupt status bit is getting set after the
> irq is disabled and causing an immediate interrupt after
> enablling the irq, so clear status bit on irq_unmask.
>
> Signed-off-by: Tengfei Fan <tengfeif@codeaurora.org>

This looks pretty serious, can one of the Qcom maintainers ACK
this?

Should it be sent to fixes and even stable?

Fixes: tag?

Yours,
Linus Walleij
