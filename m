Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73147359329
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Apr 2021 05:38:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233137AbhDIDjB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Apr 2021 23:39:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233070AbhDIDjB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Apr 2021 23:39:01 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40E8AC061760;
        Thu,  8 Apr 2021 20:38:49 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id y2so3218622qtw.13;
        Thu, 08 Apr 2021 20:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zWYrgmgXBOXRjVrzdgXfjhYpQ0FoUCzYmeLXCLSnYFE=;
        b=jcSmnDiUo1MMc6Q3MSiXiyB7AXqJBpPE3e98RkysCl8SPty3nDcOvOcRler+dmur5d
         aMg54JUXZxIhZg03ZAR8c4WicszsfYamOPqGCL3/D+KRBdvKzAB4CjehLG05aGaqWbqE
         rpwrfWYwUuXjd2oNzh9mCifoRsFoJ+gnmN5pc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zWYrgmgXBOXRjVrzdgXfjhYpQ0FoUCzYmeLXCLSnYFE=;
        b=HN+LJqdNVvn/hi1ZUhgkWd/3pef68l833nkO/AdW9Vc5mXv+jafLT40GCm0NZwiSFq
         vNySFZ0jss9vLCsDfwcNFXcgoI/TAG7B5GO7PF9nHCz0UA4n3eKSOwrlUNxBRd1oyb+0
         8AExkBxwGhsA+lhUJKc41lEzYPh1JkU/6QY49aFFTmcFKGw196Hg7Cy5ltqh2KYHZceF
         43seJy+vhlt3sQzX4TWKa0h2jyK7j9/67dQlz/eHwENtxpIcZX5jyaMmSdtnE3N9lZvu
         yV+OE+Pik194ISQwP3DJ8aytiLKMFLBAF3OTH9eNv/NNc89eyulHnwWxyGYRqXBkrkl/
         qBvg==
X-Gm-Message-State: AOAM530hV4Vxgq9k5Esb1bi9Ui1Vt7W6Sha5EnmDgil6fFiTc8R1Y4JU
        j5iBAN9ySdw7v3xjUUm37pNcugbgmsM2F5tF7O4=
X-Google-Smtp-Source: ABdhPJy3ab4kwwpcl+l+Ds70eJmyq2Cr6Wy6ME4tEKA06FjzEJMtXRy47zcwt64rNz+2wEnTaXI69wecrdATFzf/+XE=
X-Received: by 2002:ac8:7547:: with SMTP id b7mr11274286qtr.176.1617939528484;
 Thu, 08 Apr 2021 20:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210319062752.145730-1-andrew@aj.id.au> <20210319062752.145730-5-andrew@aj.id.au>
In-Reply-To: <20210319062752.145730-5-andrew@aj.id.au>
From:   Joel Stanley <joel@jms.id.au>
Date:   Fri, 9 Apr 2021 03:38:36 +0000
Message-ID: <CACPK8XcFX9Ljo8K9XzhtCnTXKS0muknzrV6=SU6Wh5jJSPdNAg@mail.gmail.com>
Subject: Re: [PATCH v2 05/21] soc: aspeed: Adapt to new LPC device tree layout
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     openipmi-developer@lists.sourceforge.net,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Corey Minyard <minyard@acm.org>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
        devicetree <devicetree@vger.kernel.org>,
        Tomer Maimon <tmaimon77@gmail.com>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Patrick Venture <venture@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tali Perry <tali.perry1@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Benjamin Fair <benjaminfair@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 19 Mar 2021 at 06:28, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> From: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>
>
> Add check against LPC device v2 compatible string to
> ensure that the fixed device tree layout is adopted.
> The LPC register offsets are also fixed accordingly.
>
> Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>
