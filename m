Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 768E42ECDAF
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jan 2021 11:21:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726371AbhAGKVR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Jan 2021 05:21:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbhAGKVR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Jan 2021 05:21:17 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2203C0612F5
        for <linux-gpio@vger.kernel.org>; Thu,  7 Jan 2021 02:20:36 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id h22so13444468lfu.2
        for <linux-gpio@vger.kernel.org>; Thu, 07 Jan 2021 02:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h2Z57oRMgV8H88lmGxyt0IypANIWalVTfC1aYe8+U1E=;
        b=f7qxYMqodMyFWwyVKPQ+maYWvU8LpydxglZmjVFt3/Kquj/mHL+kueWogIW6L2gcah
         ye3O3WW8tcxVf3oUi0fYW7TR8p/uE34HSCZMhMAkGOBpq3hln5Y0CNdu49RvrcAb9JqN
         9ppkQZ1LmCJ8zTxQNFwJOtSlIVevjk4J6XoZPunGxYW515QV6Me08tWGH39HrPDA0Ni/
         xjjCKVtqgpr6j7aquek0eeM7nMZbGKIRZ3aZmuXqtkVArX3tlWACRSdXrx5pij769YTh
         KdCCfV7uZRdOHu7AHpXhuQ7EuB4XcLH1mMxOPbpcZUIvqoZsPLWkZNL0my0SLnP4H8Tr
         GEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h2Z57oRMgV8H88lmGxyt0IypANIWalVTfC1aYe8+U1E=;
        b=fE7GO653S0VITlVzT1keiEAPtYf8Wmh1vBP8QeR/lFFqxX+MJ1BDolavFV4MNACbrU
         C5XjnC1F2y5zJQq7xXo9hXKkMO3WKM1VVYwgif9CkwEUZZ6+La8rlTSjJM8mfqeBUoTe
         L0T5D0l44CRJ2dkW7mglZmverRxTXidBqOxGj5AkfHdxv+8KQ27l9/DbsNv1WZ7C60fm
         UOFkQGAyHfSIYULYo6pZ6Go+iw/PR8Kdxckyxg6yR8LhG8BcSGKtEymwDlVfzQCTZ/n+
         zWEPtEs6xU8BRa1itpCfq46ATV8Tl6OSFm7qX4CyPzZt/al1hDDes1YXTRY9tsCPPUAS
         hBcA==
X-Gm-Message-State: AOAM530T6RB/6v7aNgr6sQvDs7EkGjIinuzkcyQt3CQDpEWhaYoPTWUw
        jMOEiF9wFjBGSd4X4MFnX5l5AuH3gWdO0geE+9EPLGt+SNc=
X-Google-Smtp-Source: ABdhPJwnnQx19Mo90ktD1Q8381IfaNNjXYuZsfi7Y3OQQgvakpwZvbD9A7VAn4LYqVC9tDW7g/HZ9ehaM3xPA2do1NE=
X-Received: by 2002:a2e:9dc3:: with SMTP id x3mr4045386ljj.326.1610014835410;
 Thu, 07 Jan 2021 02:20:35 -0800 (PST)
MIME-Version: 1.0
References: <20210106131908.584-1-zhengyongjun3@huawei.com>
In-Reply-To: <20210106131908.584-1-zhengyongjun3@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Jan 2021 11:20:24 +0100
Message-ID: <CACRpkdZHuNSaox+GWpk5A_+y-uqAN88eomCNfYerjOA_RiaF+g@mail.gmail.com>
Subject: Re: [PATCH -next] gpio: vx855: use resource_size
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 6, 2021 at 2:18 PM Zheng Yongjun <zhengyongjun3@huawei.com> wrote:

> Use resource_size rather than a verbose computation on
> the end and start fields.
>
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>

The commit message of these patches is obviously wrong.
Resend all with the right commit message.

Yours,
Linus Walleij
