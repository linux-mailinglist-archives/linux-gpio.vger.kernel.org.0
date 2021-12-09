Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1604146E0A5
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Dec 2021 03:02:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbhLICFh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Dec 2021 21:05:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbhLICFg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Dec 2021 21:05:36 -0500
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29EEAC061746
        for <linux-gpio@vger.kernel.org>; Wed,  8 Dec 2021 18:02:04 -0800 (PST)
Received: by mail-oo1-xc35.google.com with SMTP id b1-20020a4a8101000000b002c659ab1342so1374986oog.1
        for <linux-gpio@vger.kernel.org>; Wed, 08 Dec 2021 18:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6jF6qRe5SRMSQZX8Z8oZJBZNxo3XePJj0xDc5654/qk=;
        b=wCoIOYuGPwfhnh5mM8AFZxRvgEPnUsc5SsVISnljiYoCtEFEY5OwxVjc2qHSvDoVHl
         5rUPE3/+8tOvWbZXMrYYgorbcYEd6PUoM/KOi8ic4/04344sX2XQlY4rHOGCB0mievKi
         inqa6tXO3P2+P/g4H1Uh4RLYO/DioOGyKOPgxXPGRjlfoxpqMGNxWBY3oQkA6IO1sArM
         6T1q2W4a6EmzJ6yZgOmHkbV7bx3hcM5cDvkM5NnnnZ0GvwwpIjNv+P40xLsrzveaj4Ej
         cE7fWuY+j7j5wtbh6IAtAONqSvAz+mWIIHBfSTnoqdu58vD5zkJWZ2oSXv8KVKkHsbcY
         xJPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6jF6qRe5SRMSQZX8Z8oZJBZNxo3XePJj0xDc5654/qk=;
        b=Xl2Gdi+HPcRaN7HASlK/fn1BgYzZ2BT2sDOGHEeZoQT6ZZ/zlE6T4AEPsvICpJhhBj
         St1quI8NWPBfA48PRIst5YouuWcymFYYE70OtJ/ZD3C/IxRkcHhsa3jg3fXr0SgTUxUY
         +9mzd8u/5+xgBeUghm5PvhaUnUnk1uFdb4JuyBpCJak9+6rdtA2I358TEQqYhT05i2Jq
         WgVmSFkGatDylzHSO+9JqT4eGz0Nvt8k5wqY1jkNq0oSE+YM4PUVwwVvBccPK40CkMhu
         B6Jap2tP3upHMDz1l1EHf7EpHshIG9AdnBDFddAsjKOyZuDu8p9miuDN++IX/i4DJJER
         vYbg==
X-Gm-Message-State: AOAM532SaWwjNAi6V6ZpuvJL+zmA9lvYdk/EuDLn5qBMS8os3vZeteKz
        b84MhMs0BNR530elGrJchw7FCGjdlYFsCy6xLIoztw==
X-Google-Smtp-Source: ABdhPJwwJMv8SYHU3EkSbYrgYngnVgHQ4AO8cwD1tYGgWSvzZ9StW1TExuN282563HLeY7phJa9zhbYnSnz/V5tFY1k=
X-Received: by 2002:a4a:aa8f:: with SMTP id d15mr2221617oon.86.1639015323501;
 Wed, 08 Dec 2021 18:02:03 -0800 (PST)
MIME-Version: 1.0
References: <20211201072434.3968768-1-vkoul@kernel.org> <20211201072434.3968768-2-vkoul@kernel.org>
In-Reply-To: <20211201072434.3968768-2-vkoul@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 9 Dec 2021 03:01:51 +0100
Message-ID: <CACRpkdZP7Po9JaozB7s7--qoM90a1YBdu0bwTHYPuDi-Cr0sXw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add SM8450 pinctrl bindings
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 1, 2021 at 8:24 AM Vinod Koul <vkoul@kernel.org> wrote:

> Add device tree binding Documentation details for Qualcomm SM8450
> TLMM device
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Patch applied!

Yours,
Linus Walleij
