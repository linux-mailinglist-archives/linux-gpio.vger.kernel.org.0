Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6097F2FA88F
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jan 2021 19:19:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407350AbhARSS7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jan 2021 13:18:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393204AbhARPIq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jan 2021 10:08:46 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE984C061575
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jan 2021 07:08:05 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id b26so24551677lff.9
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jan 2021 07:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4zCbYZ+Ii0gKy8gsGpTa3Tuf0KUwV6cf+cE8scSt5cg=;
        b=wYSz9xSmMnsBS+V0YJP4pd1Ravw+EYjYEB08XGS56yApQ2IYJvD2sEwdFI+vexMhMx
         uJ17aQAcKnq2x/1mTMX/8bp/ml/rWmkuCyT5v4oudmlwEslbqnKayeyHnOyPFnNaUrov
         cNPNcgolDxtDvRgmNEYzNtnWHrBCWzOFmkvNIPCsGHPzAveFtYqMZZuXBcQNxS1t5e5O
         jYthnOJOqahDdcYP8FtVAn+tIUSVwM/kA46L1fBNxs0vPUNSxAhCDx99OITNQCiqsEtq
         VuFTDr7ifX1SA1apalWkLZWM6PCRGP2w6BkleLoPHMI4vCOd5f3tMnSCXBcveSEU5I5V
         9Wcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4zCbYZ+Ii0gKy8gsGpTa3Tuf0KUwV6cf+cE8scSt5cg=;
        b=Grz8vEZZcxm/Gg8ewqEVJHXY+XbZ55Delh7ZM8m77iY5JVud+XfPcwEzOppiReZs8f
         UWreHz/OnynaY4z3MUuxGvb9M23tqkL7T6ITqUJNg3CJfCZEDB09bPfGRJD0gx0VKTZ0
         eyLfAazyRW4pqgLq6pXu+tvMXXohrg0vIxKjNoQfq3wIMGrclFyCAnW8w7L7rnkE1VxE
         Uw+k43TsGyNs9jTBjPagG5skv/rbczB9ZKHoQPPDv2VmfCt+xsXC7vVodimelvgcofXw
         G0CEIqxw55+CWcXrCA4qMEh9p25kTbcp/hZnj95WxBBtrecsiGD65BbKrpFcBVDtOrTU
         CFzg==
X-Gm-Message-State: AOAM533+8Ae7IFW+ce2ARNjLXQ/ZWnf2sx3Xtz9nZfmWmq3Z+wrMB1JP
        ITi8Y3ji2PGZTrY9WGpB9GwnXd281gmXMS/Nxeholw==
X-Google-Smtp-Source: ABdhPJzamPmOphzkJBTICVbQQSRmXx8ElaLTJzGCDoClFhiaQeqWsgvskwMSNhP8AGZVgGPD1UXeY3mPErNxHf1Ui+0=
X-Received: by 2002:a19:6557:: with SMTP id c23mr10847407lfj.157.1610982484247;
 Mon, 18 Jan 2021 07:08:04 -0800 (PST)
MIME-Version: 1.0
References: <20210114191601.v7.1.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid>
In-Reply-To: <20210114191601.v7.1.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 Jan 2021 16:07:53 +0100
Message-ID: <CACRpkdZyEP6GCMW=dqjTtW+sBaLfu5TwX=dNHx=APE3YEHCz-g@mail.gmail.com>
Subject: Re: [PATCH v7 1/4] pinctrl: qcom: Allow SoCs to specify a GPIO
 function that's not 0
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Stephen Boyd <swboyd@chromium.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 15, 2021 at 4:16 AM Douglas Anderson <dianders@chromium.org> wrote:

> There's currently a comment in the code saying function 0 is GPIO.
> Instead of hardcoding it, let's add a member where an SoC can specify
> it.  No known SoCs use a number other than 0, but this just makes the
> code clearer.  NOTE: no SoC code needs to be updated since we can rely
> on zero-initialization.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
> Tested-by: Maulik Shah <mkshah@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Patches applied for fixes!

Yours,
Linus Walleij
