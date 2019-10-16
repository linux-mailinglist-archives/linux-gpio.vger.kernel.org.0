Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4526AD9084
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2019 14:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387700AbfJPMNt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Oct 2019 08:13:49 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38389 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731285AbfJPMNt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Oct 2019 08:13:49 -0400
Received: by mail-lj1-f195.google.com with SMTP id b20so23783483ljj.5
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2019 05:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gwAOuJ02/CmNLRHvM1+0qWUJI2vdB/CPjcxRe0gTmfs=;
        b=HGlLUHGm8S/Vl+k3MY1zgTw0RMgNg16Hy9iyCo9W1KsN+asWjfDNyDhvnxak0iXuC4
         RzAppZ3MSc3irAS7NtlwfvcE0/Cs+UyZa50Y3zMQSDsMSqedDidivTOd6BLzWZvjw0PK
         abReKeIh11Dxh5DcAgNfz8tn+Z1+a6m0pq61W26X6JoxC1oPbycUYP0bwgOysFkQvRkg
         WndepekugfextEI9bex7J8l1AyqNSrACd8gL8nO8netT9wjGt0Id9AYDXjM/KtQ0xhxh
         bNXd805sxS01yNIb6nxz+FAEyI09tgMaaunICGWQxDglPwC9EPBbkIJ8MYPy9ZoHTUjR
         DioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gwAOuJ02/CmNLRHvM1+0qWUJI2vdB/CPjcxRe0gTmfs=;
        b=HdnVY7nWNvflSwbRmsqDwkHkzxztdQ7r8nKuYeuwSULQjQtutr/42nFeFpp2WLtrMy
         i+eIytUXfxVRCU8ClMFa9fNvsuqo8oPPX9Eo+/b/ozu1JT5jppMQxIpvF1qE2G7NE8eU
         y3YiCt6SfFk6T5e/JL2uzk+lVpt9WxsfipH2hDlR2QzQX72kcrVWWAdOQR69RWOVuq1l
         7noa3g3t6epi7zi4/JuN+lIAshubVcQObmkOLc+pS77fwjmiqCCgP1JnMC5h5btOq7SQ
         cie6N++YJrXf4c+QodBBb2qArepEliX30byny+x9Zx35BHdfyLm2TwpP4iFGSMiV6vJd
         S1BA==
X-Gm-Message-State: APjAAAV8Sa6xRdKwuL65lgaI1U2MG+4DTVbrAumotpTBM/PIbDFAPaa5
        t7sXNiGBBhasSLRkShfGdS8SX1x4u/FjEpBQlETrtA==
X-Google-Smtp-Source: APXvYqzcLm4ffYjz6L/K6mToL+dNjoyckx1raiIUkGvyOt2QIDTLZA0ue/HKnt9dEPr3w6FBUV2ydjWuON8gLRceMgU=
X-Received: by 2002:a2e:481a:: with SMTP id v26mr18267416lja.41.1571228027497;
 Wed, 16 Oct 2019 05:13:47 -0700 (PDT)
MIME-Version: 1.0
References: <20191011154321.44f08f9a@xhacker.debian>
In-Reply-To: <20191011154321.44f08f9a@xhacker.debian>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 16 Oct 2019 14:13:36 +0200
Message-ID: <CACRpkdb=FzN8sVc+u7SxgNkx11dWCLJK7rbJmOrk0gUN1T58zA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: berlin: as370: fix a typo s/spififib/spdifib
To:     Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 11, 2019 at 9:55 AM Jisheng Zhang
<Jisheng.Zhang@synaptics.com> wrote:

> The function should be spdifib, fix this typo.
>
> Fixes: 423ddc580b13 ("pinctrl: berlin: add the as370 SoC pinctrl driver")
> Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>

Patch applied for fixes.

Thanks!
Linus Walleij
