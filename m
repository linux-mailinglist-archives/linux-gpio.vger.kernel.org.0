Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E103C37207B
	for <lists+linux-gpio@lfdr.de>; Mon,  3 May 2021 21:32:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbhECTcs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 May 2021 15:32:48 -0400
Received: from mail-ot1-f53.google.com ([209.85.210.53]:36673 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbhECTcs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 May 2021 15:32:48 -0400
Received: by mail-ot1-f53.google.com with SMTP id n32-20020a9d1ea30000b02902a53d6ad4bdso6144647otn.3;
        Mon, 03 May 2021 12:31:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aia+4VUMLHBzhQRL5fgqbL1YLrL8gOZPDsCa5uOnqc0=;
        b=hTN272mQ0/2AskUNhlksHKeOiPrcnQ0bzimTJcI+EPFogb0HdvgEcKzgTK2CUFGCYx
         i0SX0khoG9mNbjsCUrO3K1/IR8MSIMIK9igG8Q7s1dVbQK/FlnrMuzoj4CEgk3HVz11Z
         PTok+qx3bq9beS0HLioRtyAavOlIj/3dBacRi547qvxjs8P2fcyKHidVLoy5H6pgmFZ9
         FIseLLxU3phLw6u9DG6E5Xf43J/Fzlf3HdNlu5hWLsDuEIM30HxksRXhrgwOpinjCu6K
         PFKc9ecff/+LyoLjjj8QYj2O0Oj+Q0g8Z7CU/fqA7gIgFn0FT3w9oVkSUcb/tzAMHxGk
         M2jA==
X-Gm-Message-State: AOAM532Ev+p+RvnNHI94eMAi4ELnG95jRu4EPjYQFpH3vH7jeyrGSZOt
        ThdgDyT33Ct4vBv4bdaCgQNh4A9SjA==
X-Google-Smtp-Source: ABdhPJyAJfaKyrbIHXdP4+C8h+0LFr3i9ZUvTi1nUCD1zHPUDUziKewEYnclJLXl8kE+lZu5xTwuZA==
X-Received: by 2002:a9d:1b4d:: with SMTP id l71mr16211817otl.241.1620070314104;
        Mon, 03 May 2021 12:31:54 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x141sm174033oif.13.2021.05.03.12.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 12:31:53 -0700 (PDT)
Received: (nullmailer pid 2247620 invoked by uid 1000);
        Mon, 03 May 2021 19:31:52 -0000
Date:   Mon, 3 May 2021 14:31:52 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: spmi-mpp: Add compatible for pmi8994
Message-ID: <20210503193152.GA2247516@robh.at.kernel.org>
References: <20210429003751.224232-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210429003751.224232-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 28 Apr 2021 17:37:51 -0700, Bjorn Andersson wrote:
> The PMI8994 has 4 multi-purpose-pins, add a compatible for this hardware
> block to the MPP driver.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> PS. I see that while the related gpio driver was converted to hierarchical IRQ
> chips the mpp driver didn't get the same treatment. We should fix this at some
> point...
> 
>  Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt | 1 +
>  drivers/pinctrl/qcom/pinctrl-spmi-mpp.c                     | 1 +
>  2 files changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
