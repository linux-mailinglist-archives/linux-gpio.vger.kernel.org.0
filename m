Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22D7C22AAEA
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jul 2020 10:44:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726956AbgGWIoJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jul 2020 04:44:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbgGWIoI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jul 2020 04:44:08 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D697C0619DC
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2020 01:44:08 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id e8so5500234ljb.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2020 01:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CkH2cH1tSHkiWUdx4NYvU3H/EJsQDUARMZQ26FKEGq4=;
        b=kxz381FsxyT6cNf9sYuimdhuIrl8nxWcoY7uM46nPmZffugo6no1qzJr5aIXrKo7h2
         5/8PKpg8A61z+wAa44SJdBgFVJmKEebebfWSTexkPuGPVtDBC+M8W2EETKfrxS/ajZbu
         jrLJqSTpXgSXiW+U+t9OKLEoilfVGq/LOzePAnPruqfi0mbPianEerwMGFitwc7Zj1Ix
         jwx6dUtf//RZoU+1i1gpp60/9sLPr1XTolu2Q1iQAAuEoUllIQ192rjwvvpx08okrahQ
         YV0s8XPRp2ObxIqNjdJ3SXyRjL2Ip5CA52ocGM7KqHgdPd90tsqQTO0UAmjRMnGvGkwb
         Q1Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CkH2cH1tSHkiWUdx4NYvU3H/EJsQDUARMZQ26FKEGq4=;
        b=gFf1snvYKNrlNZDoX5kBAH8Wwk39SaVHyZXkQlJU0VLeS1G3ZVa7O3PBbErZf8AE8A
         K0N/SVKsM9fqe0u/Vm+qu1DqT5rrDD77VX7NCCz+Jm8llVmeAVUORQQSt66gRnWP8CCN
         kDG6cfuYwDePFNPTJIrJsCOsP+8xZZl7SqtRvOM5Me2j8o5iR35PIZeXSiVXU1cKWbf/
         1ebeEt6j6fW2GsgBwnxCSMe8rHZLE6vcNYmCejoyEGB8f8SzO/cnx4vmYYxwQxxq9k0X
         lNRZK+TNYgEPuoX4FW9EhlFWUiTbIQmZ6mj7//wbm5KtU5o2SEnK32E+HGcl615PWgBH
         yHkg==
X-Gm-Message-State: AOAM530l55Rx3iEfLAIyDCY46NRXO/hGOT4/2j7HIFpP5Q6LlbMV0avf
        fwpe5p1Kblvv2xm5l2BxH+oTjN+5m5tQyqsVaUGkAg==
X-Google-Smtp-Source: ABdhPJy9FYQzEz5+a+xAYCl+rAh2wms4y8ztY1F8hFb6jAnV1ZJBUBI6y73dlz37/bChnljh88y3BVK9wCTiobiTO6M=
X-Received: by 2002:a05:651c:1291:: with SMTP id 17mr1628930ljc.286.1595493846705;
 Thu, 23 Jul 2020 01:44:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200713144930.1034632-1-lee.jones@linaro.org>
 <20200713144930.1034632-7-lee.jones@linaro.org> <20200720142714.GA6747@kozik-lap>
 <20200720144955.GD3368211@dell> <20200720145219.GA23990@kozik-lap>
In-Reply-To: <20200720145219.GA23990@kozik-lap>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Jul 2020 10:43:55 +0200
Message-ID: <CACRpkdaYQ3PEh838Qoxig4n1iNFp8AOj_Wk9jdvB-qMy0PBRKw@mail.gmail.com>
Subject: Re: [PATCH 06/25] pinctrl: samsung: pinctrl-samsung: Demote obvious
 misuse of kerneldoc to standard comment blocks
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Thomas Abraham <thomas.ab@samsung.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 20, 2020 at 4:52 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Mon, Jul 20, 2020 at 03:49:55PM +0100, Lee Jones wrote:

> > > Thanks, applied.
> >
> > Same as the others.  Already in -next.
>
> Thanks for letting me know. I dropped all of them.

It's a bit tricky at times with clean-up topics, I want submaintainers to pick
it up if possible so sorry about this, it's just too much to coordinate
sometimes.

Yours,
Linus Walleij
