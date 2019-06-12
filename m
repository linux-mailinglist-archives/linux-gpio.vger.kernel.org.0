Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EFB241FE6
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2019 10:54:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437366AbfFLIyZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jun 2019 04:54:25 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34410 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437356AbfFLIyY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jun 2019 04:54:24 -0400
Received: by mail-lj1-f193.google.com with SMTP id p17so7104674ljg.1
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2019 01:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5IKFQlxi0I3P+ssh5DIOko6Z7anWDy6UzmX3xFflNos=;
        b=Rz+qpRkAbq+hptik3GAI7okccDPVbInSsLaxqEtZTomNfsjlqRfd9PzKBT/YzBuNPE
         veYB4wGxhDLSH/ufDqUCISgInQPxltZputvSEzEcNMNOMAf9Ibxx9N5g5qc0qwH5gn8N
         Yafhk7x8bsm31SWMGMSv4Hnhrfg5fyrZggWpy7LS26LpYF/T/7M6qhr0mabXtEMvpDzh
         8CTTxM5sOHxKi26a35R7GIpCTvb4xnvsK1B2TIBF38F/LIoJ+EJa3pgDRmewKGlz4tKo
         gPg1dq7xGijhxl0IqDkiB6K/1PEXDtNrarjigDIXHs7l1kuLZ/WQCk0JN4Es9oe/Or72
         TJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5IKFQlxi0I3P+ssh5DIOko6Z7anWDy6UzmX3xFflNos=;
        b=SQo6e12E+gqQO3DwVGY4ClJV+ywxSasUVkYbweBumskG5RZLIvV3IbD99PRSc4G+cb
         8pXaCefkZWj3tppkOvmVLDf7jI/xmZpte7hOmcOB0ayYoQbIvN2H3Nj6VDwth1PoRLFZ
         fHbFmMbuJh48xAZXZICbW2cCAdl46AVqtsIa5fgZLl47/+4Q6QQBdITkVmBWyJgMsakU
         0yXfDyoNSmc0+ZQ2lwSOTafloUJA+miWItJGjbsp4d6cH1Ezollr7M2kZoypO8az7u/s
         K2JYTlWm5cth2BgV8F9Oiss104a9G5slPyCL2dOVaL/N70EHfFVYpaQm/ne0CajWE+VX
         pcFA==
X-Gm-Message-State: APjAAAVJOTPcDpnNT0M3JCr2fCsWwSi+vm7T/3Uhsb79dGkBMDt/bzFj
        YynGYn/fyIPiE7Bv9yx+t/yqRyVxRrXdcltKEbHeQQ==
X-Google-Smtp-Source: APXvYqxMH6dEoA+jip3uBxOPRmjugsKb0aIbkzeQ/8izSdJ+XQ+aTevZeOi2mpb9gqe3y8jgwkgiGr950I4ymBVhnDQ=
X-Received: by 2002:a2e:5bdd:: with SMTP id m90mr33803985lje.46.1560329662190;
 Wed, 12 Jun 2019 01:54:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190610171103.30903-1-grygorii.strashko@ti.com> <20190610171103.30903-14-grygorii.strashko@ti.com>
In-Reply-To: <20190610171103.30903-14-grygorii.strashko@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Jun 2019 10:54:10 +0200
Message-ID: <CACRpkdZmnezPYiKpi+7Ka70YL4H4O=_Gv=DqXfvY9J4xv8X37Q@mail.gmail.com>
Subject: Re: [PATCH-next 13/20] gpio: gpio-omap: simplify omap_toggle_gpio_edge_triggering()
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Russell King <rmk@arm.linux.org.uk>,
        Tony Lindgren <tony@atomide.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Russell King <rmk+kernel@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 10, 2019 at 7:12 PM Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> From: Russell King <rmk+kernel@armlinux.org.uk>
>
> This function open-codes an exclusive-or bitwise operation using an
> if() statement and explicitly setting or clearing the bit. Instead,
> use an exclusive-or operation instead, and simplify the function.
>
> We can combine the preprocessor conditional using IS_ENABLED() and
> gain some additional compilation coverage.
>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Patch applied.

Yours,
Linus Walleij
