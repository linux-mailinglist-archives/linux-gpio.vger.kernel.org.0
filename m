Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B17C8297B1
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2019 13:56:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391337AbfEXLyl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 May 2019 07:54:41 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43275 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391195AbfEXLyk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 May 2019 07:54:40 -0400
Received: by mail-lf1-f65.google.com with SMTP id u27so6918310lfg.10
        for <linux-gpio@vger.kernel.org>; Fri, 24 May 2019 04:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/Azj5Mh17Xr9FCaEyv0nk1c3/T309llcqUN9VP/DQik=;
        b=fcHnoD4vDFTzmg8QamBdu8mV+cYaJtuDyG3kWeofCmb377qqJWF05W/khA8hWMoOsT
         8wGRqbsDSv4n/+4RSB65JncRdIbGsQnGx7wDjPbZsVJh3k+Bvo4Zl8JGMB9vEz2JUePA
         KjzrqGUzbXBk46zgSeUUbjk/PjKvkM5M35w5EQhVrIhWTy4QxCDWBjsm4eKFIPeWd7Dj
         4EsjqzZ2ZulAaBko4yNvM0BI62kMnAd2LykhVsDgS1A7T3m8onYWErWZljVNTCmg9pR1
         7oRQk+2h0FCEZp5hoFMW5nxkzYSWyiVSquCgbnbXQFmLL4PxmL1jWRKGycSyJ0cTnCi+
         hBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/Azj5Mh17Xr9FCaEyv0nk1c3/T309llcqUN9VP/DQik=;
        b=eYbNOjntY6vFGj1u7SCRXHRScIkASyPnU03AXQhLgKy2LUyuyCf/vYkPuJ3Oj+k1Xc
         bsEw5Jjh+uje/FdNHqXGCE3ZorU/b9RTAMZZW650QxVIyQdhb9RVQRmgc5Cs9lG6Nyi5
         xIQ+D8CBDmYNDnDy/I1ShmjNE7eWEEGEtSXNVPRgoE4F3VDuxZ0OGFWEVNwZFN5h5rjA
         ZxZD+ls+cO1Jha6ZOyp69Mt+JWxAzSxLYq1v/tWW9WuTFq+5MS/tconCz5ZSDcethdyL
         eXKtl2m1GmJ9NSSFWRVKL4VeI5E+OcVB6Mss+Ld4vFLq/FZ0ekn+gv8bBdRGJ2sN3lW+
         utRw==
X-Gm-Message-State: APjAAAXsF78uyv8E4VyjuE+cvBWtRXwcSpomQ6R0+4PqZTQ4iDTjs7i2
        l4I/16acE98uS1dgrXd/1CsanTJsLBJ0ip93r7u22w==
X-Google-Smtp-Source: APXvYqwIIZNQbUvjC3/LAYZAUbrO59dxsLsAscijArxf5xAPoLHmlBeI4UgtMCBGZ6OBmRpTsXtE3Yphmj2LJ6hmnmA=
X-Received: by 2002:ac2:4209:: with SMTP id y9mr11799734lfh.83.1558698878778;
 Fri, 24 May 2019 04:54:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190520083101.10229-1-manivannan.sadhasivam@linaro.org> <20190520083101.10229-6-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20190520083101.10229-6-manivannan.sadhasivam@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 24 May 2019 13:54:27 +0200
Message-ID: <CACRpkda1a_WSP5rWGHDZPsbU=5mLN+2TPVF05mEHm17R2fM0aQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] pinctrl: Add pinconf support for BM1880 SoC
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

> Add pinconf support for Bitmain BM1880 SoC. Pinconf support includes
> pin bias, slew rate and schmitt trigger. Drive strength support will
> be added later.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Patch applied.

Yours,
Linus Walleij
