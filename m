Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C100C9F03
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2019 15:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729553AbfJCND7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Oct 2019 09:03:59 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38512 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726677AbfJCND7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Oct 2019 09:03:59 -0400
Received: by mail-lj1-f194.google.com with SMTP id b20so2658311ljj.5
        for <linux-gpio@vger.kernel.org>; Thu, 03 Oct 2019 06:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XioN7puVbcYRckEVTHmiB34pXF9Ej7EG9KjZda45NBU=;
        b=H94StjHmQA5TRSAC4/Abc0WwiGKQyKwCI6pdiTuyEJXIa3nnrlCVWv1OfoqEiZeATy
         4rZPkzd75ThGs8M0AIqY9Wvu3A9FcnYfOU4mOUbVNGCKmx/1uzJ8jnSiX6zIp5Z36COi
         8WmP9tmekQx+0CkLz3OC5EmxRSpVr8YOW7KbPDumSoW075JjFSIcd5R/jxX6YspjsWw1
         9qYL7XV7RHxSa6PoCa322+GkEVjjXxGqk0lHLgwL71qsXwx0NgdwR5gtckiKyeW8nXxs
         jPCUYskSLjqw4MJQ2ILs6Hsk+8qXt/PsDnwV0QlLxvOOdnw9jgYr/rY9xIsVcaqtCCUt
         49Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XioN7puVbcYRckEVTHmiB34pXF9Ej7EG9KjZda45NBU=;
        b=YrY2tfwborMufrIo1M/s5vlWvB6X8sKgFnr2accACUJf1et/lQDg7L6jkFV0g71TdH
         L2JvaWht25qGsMSKEauRRLroq43f2PpN8Rc9H1EDhb3tTK3bzwMksD4PZjHX1l1hkGcF
         AJWjFwUeONLRNWxHNpFHkHNGG5AA/phUIHatWl5duDxgIU93SWg9sNRlMBLAVqM/9e2c
         O2PfSDyag7P24kvkZXYTwtH4B/6R4koigilz+FWDvr27eXU+rf1wkEYOuAlyPw9eSnPg
         3ISP5L7kEDmApJRi4tyd61liTLARNDtphvQWRWP0NtaOaZ1pozzlS+b0QbHXLiDng6NG
         k/sg==
X-Gm-Message-State: APjAAAV9rUTuxjAIl2jn4qYB87nE03SmyaR4PuFyj9MfyK4kynQ8vcNB
        BO4PrHSzN3BVFsSexW73ZJhvQVVys8+oyXWBGYal0A==
X-Google-Smtp-Source: APXvYqwLTqJ6PluifEhLN3LXeppRw6SC+TULeLNjobndGDebZcb+fp7ss3iiSIMMyr4V9i2taRe0ub66NlmSxoi3y7o=
X-Received: by 2002:a2e:6e04:: with SMTP id j4mr5309093ljc.99.1570107837087;
 Thu, 03 Oct 2019 06:03:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190914111010.24384-1-masneyb@onstation.org>
In-Reply-To: <20190914111010.24384-1-masneyb@onstation.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 3 Oct 2019 15:03:45 +0200
Message-ID: <CACRpkdZeKbNRqC+2Qs2tvWjWYDFJdg22YQ8mxMNu18n9O8cyig@mail.gmail.com>
Subject: Re: [PATCH] qcom: ssbi-gpio: convert to hierarchical IRQ helpers in
 gpio core
To:     Brian Masney <masneyb@onstation.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Sep 14, 2019 at 1:10 PM Brian Masney <masneyb@onstation.org> wrote:

> Now that the GPIO core has support for hierarchical IRQ chips, convert
> Qualcomm's ssbi-gpio over to use these new helpers to reduce duplicated
> code across drivers.
>
> Signed-off-by: Brian Masney <masneyb@onstation.org>

Patch applied for v5.5. I didn't have time to test before the merge
window, sorry, not it's in!

Yours,
Linus Walleij
