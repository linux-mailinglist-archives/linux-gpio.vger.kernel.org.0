Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5922D416721
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Sep 2021 23:10:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243244AbhIWVLq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Sep 2021 17:11:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243174AbhIWVLp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Sep 2021 17:11:45 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E539C061574
        for <linux-gpio@vger.kernel.org>; Thu, 23 Sep 2021 14:10:13 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id u8so30660326lff.9
        for <linux-gpio@vger.kernel.org>; Thu, 23 Sep 2021 14:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RzCYOEChqS52ihYCFoLsCYGGR6ap8pXnjkTEkEmy1IM=;
        b=DwUvUexVIQ2f+G5CJTygnALkzFfFQTEkUtuLnis44qdnGAWeGJ1siEXg4btlfrJY0L
         1fp9oe9j1lL//ULw/51YZrFxU+cEPivYFu25FzHbGjZxHVFI9IomFikZHjhXLn+YNww9
         tDgvefSWm5+2yZauq/3TM5oKOEcjntfUQ2wdk9cJi3+hqbSBICoo8SWpJskJw/prNYAA
         OU9Tz+6FsN0/uprjvV9uZaLTpccMMnVoWE0eyaUp/9hPz982ubh2U3UXTuDqwPjuzHq+
         A+mCQBddelyPSz7OhxZ5gcgWWYfhd85+nw8YeBLVgD9czkCk+60/4GWpi5Lw9225jOSp
         oPzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RzCYOEChqS52ihYCFoLsCYGGR6ap8pXnjkTEkEmy1IM=;
        b=QqIrYENgRA50Ebd7MDOegvmNLI9YW2XEDTEONmmQ22f6ipI+04vLq/UIRr6jDtV/xF
         P0e/7oJsG99s7s7Kblx/5MlvZmnn8bL8YP+JjpufL4zutoELCtzNfcfRkRunw3gD60g/
         U19iwUeOmI1scfyoVRCNBWEsanxQFkkmYaWKyzplXANDmyZAdU6Wlx/hkWyMHi/f8koz
         ReLtfQ6/EgkrC6Ocq8m9ehQ1yo/L1Z+3XxvEpUeiFhAdRIXrpPsectEOiv2Cm2Y8sDrV
         +0wRMsYdMoMYa/qhv0EWaIXDnpqiKQba94FNarbMwtKDykD1EIajgv17PqxeUoxli8wF
         5xJQ==
X-Gm-Message-State: AOAM5306Y9RAhtkWK+kRP73HiMdFheGBl0/z5NReneBaJkzylj7csi+c
        VewSMPN2cxg6q8J3Jf9G48E5OEzTQnGgw5490JM+zK0WyRk=
X-Google-Smtp-Source: ABdhPJyvWnA5YfxMUa0cPBb67wdrszJXaQYs8/Ln8r6azwb7B76KLd8cP1MpRLp2CqAdwCnLqyZlEYKeslxOgKWfpOM=
X-Received: by 2002:ac2:4651:: with SMTP id s17mr6100025lfo.584.1632431412003;
 Thu, 23 Sep 2021 14:10:12 -0700 (PDT)
MIME-Version: 1.0
References: <1632389487-11283-1-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1632389487-11283-1-git-send-email-rnayak@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Sep 2021 23:10:01 +0200
Message-ID: <CACRpkdYSqyk4yhguZ0yWr5NDAsDZx8gR1Wchr=TPHaDpWg=KtA@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: sc7280: Add PM suspend callbacks
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 23, 2021 at 11:31 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:

> Use PM suspend callbacks from msm core, without this the hog_sleep
> pins don't change state in suspend.
>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
> v2: removed some stale diffstat

Patch applied for fixes!

Yours,
Linus Walleij
