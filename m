Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C83C842B0AC
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Oct 2021 01:59:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234157AbhJMABv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Oct 2021 20:01:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233176AbhJMABu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Oct 2021 20:01:50 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC426C061745
        for <linux-gpio@vger.kernel.org>; Tue, 12 Oct 2021 16:59:47 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id i20so2549083edj.10
        for <linux-gpio@vger.kernel.org>; Tue, 12 Oct 2021 16:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pA/RLR0KfHQo0D8Z/6AcxihH5fdEamebhyEqoCoH4js=;
        b=NgLAwMaGbmUpS08qwcfFBxXGk97MvrDJzl+Zy9GxbMz2FgHsuLSjIoLw29SgHz0bae
         9e9QKK7XDIYQSljiJg1Z2S1XkPpGL4PizP+l+uzo73L5GL/Lzhx7AuHHJLSVKt5Pp+x/
         nFCrSmi4+L5gStAt3H06UFjMdRUI9sBX7bYOI0zbH3BJ67b75khA7bizEA83aiHrB64i
         CbJl2UHuxXGEcxCTTJ9VoBoiPDE+SYy6fGMu5L4FlyCOHxqlCgZfxhB4onKVCgDgAmlf
         HCBk/c3Pv809yvj759/8HZvIeipZswDs9pI0ZLXPbmJhW7V+iVUfFWuvVbgKAcwZwR8k
         5iyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pA/RLR0KfHQo0D8Z/6AcxihH5fdEamebhyEqoCoH4js=;
        b=ZzuQVe0XlzfP77jppDjhfwOYBF+Ff4PpUk62m688/1unuAb8QRp+7k8F+5awy2D962
         Fpl1BgKtqh/h/U4arAPs4iTv0asmg1C+XDN5AtartTeDl5MWhnPFAbSyilzWKlrGQmOP
         0dcni8PFVTMCZ0QiBWm6aM3xEl65F3bwrvbGR7lZHfz9+v9CJ26QafidUr7pDOLga7Ub
         /tFCG6BsisRUKu1/SL7lwc41FgJY2NxvFqlVDE4A3Q4UloIpFULN5JlQg+kqjeAYlLHf
         LGlLCGAXBPjowvtqw0yCGjhV0Q0gsRP0BJt8m4qw85mjp+nR6ev6jw0wNva1x8ihukP+
         E+pQ==
X-Gm-Message-State: AOAM5313eLjkMS5MxWo1zRBPsrswjuRvp9jBPXgvesYA3lV55cE2Jshq
        LskY5uPaAq6o/OsBT1Jq3vP1rDQxQZxvalWyD8IeOg==
X-Google-Smtp-Source: ABdhPJxbTyvOlEME29e2j+RkbfPt0NEPM4IQeMGrTtrmsNasAnyXtTpQbfSjPAEtbeGr0KaEdx7nUJlQAMiUSRr8oeU=
X-Received: by 2002:a05:6402:410:: with SMTP id q16mr4556268edv.286.1634083186495;
 Tue, 12 Oct 2021 16:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 13 Oct 2021 01:59:35 +0200
Message-ID: <CACRpkda_hW7vbvC1jizRa05ZdgeL-FkU3_zF+rvCfRBuRB3+VQ@mail.gmail.com>
Subject: Re:
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 8, 2021 at 3:25 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:

> In 2019 (in kernel 5.4) spmi-gpio and ssbi-gpio drivers were converted
> to hierarchical IRQ helpers, however MPP drivers were not converted at
> that moment. Complete this by converting MPP drivers.
>
> Changes since v2:
>  - Add patches fixing/updating mpps nodes in the existing device trees

Thanks a *lot* for being thorough and fixing all this properly!

I am happy to apply the pinctrl portions to the pinctrl tree, I'm
uncertain about Rob's syntax checker robot here, are there real
problems? Sometimes it complains about things being changed
in the DTS files at the same time.

I could apply all of this (including DTS changes) to an immutable
branch and offer to Bjorn if he is fine with the patches and
the general approach.

Yours,
Linus Walleij
