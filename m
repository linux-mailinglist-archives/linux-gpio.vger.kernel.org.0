Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8CE62AABCC
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Nov 2020 16:11:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728267AbgKHPLt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 8 Nov 2020 10:11:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727570AbgKHPLt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 8 Nov 2020 10:11:49 -0500
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06B8AC0613CF;
        Sun,  8 Nov 2020 07:11:49 -0800 (PST)
Received: by mail-ed1-x542.google.com with SMTP id q3so6059333edr.12;
        Sun, 08 Nov 2020 07:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:sender:from:date:message-id
         :subject:to:cc;
        bh=mz8zZn6hvRpj6Q4wr0nq4rIYkR+MONLI7vCkIZaxeaY=;
        b=YuEuc0aieZuFG+xeVWDLDV/QzLCaWuBqgB/t+fjTmIA0FPVpRq8djVuxre0yn0dofn
         I1drFe5aNX3GItRAmw+O1roPJHSB7FeqXRPJxtgPyBbneTm2c8rC3OCLgfpx6elxYdF8
         1TSKAMU/x6uRBPMnEqgdxl6ntqd5iTlR6Z+2X1uL26c211n2LX1dx99dPinemfmnmgmj
         ju5RmaZdtQ3Vah3M0Eus/4LAPY53r/BaZWgmWAvbf/DMqutG89qDVKZvqx3m0E4MB99Y
         js1h/OgdEOOTZ/D1seu6bslY8Dl/JNYDrwt8+Wo9VItPyLJCJufR3z2QKS1aBZN1PEOe
         C5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:sender:from
         :date:message-id:subject:to:cc;
        bh=mz8zZn6hvRpj6Q4wr0nq4rIYkR+MONLI7vCkIZaxeaY=;
        b=TCBk2CpDcij1MQFFaGCfWziz1ONxSCS3fUf0qMYu1T2iAB5X7I48qpkeoE3jYeuihC
         H/OGDWKVwHhTvWXLvZPY8Do6TPEjphzEwF/Fe60lgZbaVLbnHZxhuoOFteTyUFlWxvA/
         5FDCIYb7jO/oWGHRHdwQcgKryBlwcnNOS63BqQW+zD0QFTh/wNXN643FETamQD+qoWAs
         rreeX00EnfBh/88+PVzHBAJHND7SG8S33eOVXU9Tn8W+V0zSsiD0M8HsMgC89ezckQCx
         RWI2PFi/QA8u7xaPCFD5G7mCfqe+nqHwfISNloOUQsj5upYUXcL0JyCi+wX7JlbuBM3L
         gwUg==
X-Gm-Message-State: AOAM530TtaJTRaS2Dli9yCTJwzZwfdM2zFZB4S2+qLX8LO9o2eGPQ7wV
        hoxXkLoslZ/zxsOUIrVdfWkT9/VtN8opxgkIEbseoOCD
X-Google-Smtp-Source: ABdhPJwnoa6bGnnPgl4Q1UhnZIeJBpi6gPdD0oYDgO/5/cze2FGXsvjbwbkojus19YQcZY/Gz1EtHSvqigrCRy7e2Ks=
X-Received: by 2002:a17:907:2166:: with SMTP id rl6mr11174428ejb.61.1604848307710;
 Sun, 08 Nov 2020 07:11:47 -0800 (PST)
MIME-Version: 1.0
References: <20180129005948.7714-1-bjorn.andersson@linaro.org>
 <CAKZGPAPrwXNeYk+bDiMBRczVf4PaBANnzhmenZie+V0BJ7OqBg@mail.gmail.com> <CACRpkdZ2UzA=Hyw+b20dCqzu8+L7_D1bTM44MKbbue2VFCY4UQ@mail.gmail.com>
In-Reply-To: <CACRpkdZ2UzA=Hyw+b20dCqzu8+L7_D1bTM44MKbbue2VFCY4UQ@mail.gmail.com>
Sender: getarunks@gmail.com
X-Google-Sender-Delegation: getarunks@gmail.com
From:   Arun KS <arunks.linux@gmail.com>
Date:   Sun, 8 Nov 2020 20:41:36 +0530
X-Google-Sender-Auth: v7oOVuzKmc_SZlk15grZ33XZAyc
Message-ID: <CAKZGPAPGP7=_W8c5DA5E0eKmawF10XSO92_+E4hSE1cNFE_vcA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: msm: Use dynamic GPIO numbering
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Timur Tabi <timur@codeaurora.org>,
        Arun KS <getarunks@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 5, 2020 at 3:46 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Oct 23, 2020 at 4:21 PM Arun KS <arunks.linux@gmail.com> wrote:
>
> > Im only concerned because, after this change, the use of gpio number
> > from user space has become a little difficult.
>
> This makes me a bit puzzled so I need to push back a bit
> here.
>
> What is this userspace and what interface is it using?
>
> We recommend using the GPIO character device with
> libgpiod for userspace applications:
> https://www.kernel.org/doc/html/latest/driver-api/gpio/using-gpio.html

Thanks Linus. Makes sense. Basically using the gpiochipset and offset
to it will solve my problem. Earlier, while using the sysfs interface,
it used to be one to one mapping with real gpio numbers.

Regards,
Arun
>
> Is there any problem with this?
>
> sysfs is deprecated for years now:
> https://www.kernel.org/doc/html/latest/admin-guide/gpio/sysfs.html
>
> Yours,
> Linus Walleij
