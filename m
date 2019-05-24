Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B62ED29793
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2019 13:51:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391292AbfEXLvY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 May 2019 07:51:24 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44709 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391289AbfEXLvY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 May 2019 07:51:24 -0400
Received: by mail-lj1-f196.google.com with SMTP id e13so8363009ljl.11
        for <linux-gpio@vger.kernel.org>; Fri, 24 May 2019 04:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nVGSSaSKko66gmIM4yeSPo0D27KVf/MwdUcazG0psBs=;
        b=CAmpOuMMgs9LNo7ffRbh2niHdnt9B+qRNFjXwdDDbdmKYvjsctl3g/iYhVPPMDXmNQ
         C9nCmUdsHuo/sXnalkykTGtXCI08h3hJXnqYckZEQBOV2H3XvVNS2Dw0rjzrSYLTAsBL
         PISC6f5iKEvlGI7Y6GmykNJP1NipS2yfbNBChNABwwmH3qY+78D78zSMqo5TqjyQXizP
         N6maHehsRnJvSf/9qt0lNOhnhc8rlvG2SJf4Qp9lq/WFS+WXiJgVk6bOrtkAm0MeZzsU
         Wt5vp0P7eU7nQmhGwG7OeUGt7wJgtBOx7tUcinuSNvgXlABpan0CL5MHMchYDegM9OD1
         c+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nVGSSaSKko66gmIM4yeSPo0D27KVf/MwdUcazG0psBs=;
        b=i2LUpVsxp6KYHjdbbzJYdWlZa74auryt0ONRGXXARwe9v+kePIVSRqheEyA+3DgRlW
         Cg8UrVeX6KuMquE86rz4QpUM9aJuuzu9+NLVCS3UpwV1gXp+rjahjL0mD21S1OFMC9OA
         ff8HjeyM/9RHkT/4L1ro4p6dEw1sT3Y+h5WEhPJk5eLYZ8kkZS7Xz3+FpwKmHo7s5i2w
         p/4eb/ukp3EgS4MFSE1iEhsG9jpDHwRZJc5MT7sZXZwu59FqGuKUW1SJMkjOlshhmmJX
         AFi5hgC0imaeoqtOhH+fe5Lo6LwNvI8eR8+mY8BIOraBTAvzhsn8KA1OuqEFN56Di1TV
         TM+w==
X-Gm-Message-State: APjAAAWGBqmQDnIT9Im0SZTkTxLaDIrLohd499dC83ytUGzM1jllFvw7
        kC/mz4d3DWPjIE4BzsaI4e5pSVHAfbq/zjQP8Be4jSVY
X-Google-Smtp-Source: APXvYqzGplebYUdWzYGmasp0vQj8eWkrY4uvvmACdfcAYttZqHwEGva24jRGrNIllzpYWD5Z+5whxlKgLAX04p3HNOg=
X-Received: by 2002:a2e:874b:: with SMTP id q11mr23966805ljj.48.1558698682215;
 Fri, 24 May 2019 04:51:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190520083101.10229-1-manivannan.sadhasivam@linaro.org> <20190520083101.10229-2-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20190520083101.10229-2-manivannan.sadhasivam@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 24 May 2019 13:51:10 +0200
Message-ID: <CACRpkdZTE-FZAht+txxVXYwe42uN_f1uPthLiKG54-=_YueUnw@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: pinctrl: Modify pinctrl memory map
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        haitao.suo@bitmain.com, darren.tsao@bitmain.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        alec.lin@bitmain.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 20, 2019 at 10:31 AM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:

> Earlier, the PWM registers were included as part of the pinctrl memory
> map, but this turned to be useless as the muxing is being handled by the
> SoC pin controller itself. So, lets modify the pinctrl memory map to
> reflect the same.
>
> Fixes: 07b734fbdea2 ("dt-bindings: pinctrl: Add BM1880 pinctrl binding")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Patch applied.

Yours,
Linus Walleij
