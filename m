Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0774A95911
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2019 10:02:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729284AbfHTICJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Aug 2019 04:02:09 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35344 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729198AbfHTICI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Aug 2019 04:02:08 -0400
Received: by mail-lj1-f196.google.com with SMTP id l14so4233307lje.2
        for <linux-gpio@vger.kernel.org>; Tue, 20 Aug 2019 01:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xz3riwOPHeLMjIKiRTAstl81PVMJRcr7E9ClEgdXbnQ=;
        b=Ct6Pi1czeTf9z6T+C4jDBSvH2xXBdPjMlt4G31y4frLXOxPWxz70z3myokApt18Gmj
         aqlUOOZ69sZxRzyrtB8KKbhVkTCkwbrsHBVifk/HGZ8Wk+2gd2Z5I4MLqUhbLbCr8Pix
         QCbAXnogekX7YC5d4HK3kN813oWiWpBcBSYkMAfOB0k2MclxV/IbWJbbCHgxsfWKdNMF
         4zFetviAWRbAL4ELynFuiL6aWnDdMsB/TP7cluyVG7nSslw8WONPhUzK4Ck9ONmwvYGs
         GSBYNUaFLLlesPmY6wPu9St514IVQbT3UbqQvypK9wfxV3hc0nvsR2duRzgUxLn02zh9
         i3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xz3riwOPHeLMjIKiRTAstl81PVMJRcr7E9ClEgdXbnQ=;
        b=GRAyrM0DqkmHac2uE+t68vfFTdWtC0z1MxKqIPExAsOEONjpTewvAxsSQmBCeRoBIk
         v0sukm3w1mttImmE9H8dpd8ClX91t3LLfvaY8GMGj632ESNKodej9IYzPcuxgAeiZb8y
         RCGHC2JtNHWNmfqrG7zoI75ADTEaZIx6vB2iNjU3lALY7s+tzHPdN8wN7Zrn8ay+WBEH
         iXvF90fkKOHc4y3GxFa7/4PnDWB7bH8koyCASv848qDGX5MS13whwiZ6u3nRaZccky5f
         zxI3/F18xvQUE/BAtlsDPGKNzBg//E+fBu3dFsRp9NEfRwNpq1zcBwzZ9putlwpEEfnr
         mYwg==
X-Gm-Message-State: APjAAAX/6d7Klj4pttQKP5w1cHXSrc1lZFpB7uQjvgPdIfJHVvbRQFcZ
        HIlVu7RG5BbiPu9vC+D0xX7C5pfD59DV4i2Os0OX8g==
X-Google-Smtp-Source: APXvYqztZtpJGLWma67jex9+6AlgTsze/ATXlXlMvWkex6LjcZ491q2g6dhhQIo1pZxfzYItT3p1fbH9boWIFmBn7oY=
X-Received: by 2002:a2e:b174:: with SMTP id a20mr12297799ljm.108.1566288126735;
 Tue, 20 Aug 2019 01:02:06 -0700 (PDT)
MIME-Version: 1.0
References: <1566221225-5170-1-git-send-email-xuwei5@hisilicon.com>
In-Reply-To: <1566221225-5170-1-git-send-email-xuwei5@hisilicon.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 20 Aug 2019 10:01:55 +0200
Message-ID: <CACRpkdZFwANp-+fSmPPENLoh2Za2-fyf+aZ0VK79AnyRJs1H3A@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: pl061: Fix the issue failed to register the ACPI interrtupion
To:     Wei Xu <xuwei5@hisilicon.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linuxarm <linuxarm@huawei.com>,
        Shameerali Kolothum Thodi 
        <shameerali.kolothum.thodi@huawei.com>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        John Garry <john.garry@huawei.com>,
        Salil Mehta <salil.mehta@huawei.com>,
        Shiju Jose <shiju.jose@huawei.com>, jinying@hisilicon.com,
        Zhangyi ac <zhangyi.ac@huawei.com>,
        "Liguozhu (Kenneth)" <liguozhu@hisilicon.com>,
        Tangkunshan <tangkunshan@huawei.com>,
        huangdaode <huangdaode@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 19, 2019 at 3:29 PM Wei Xu <xuwei5@hisilicon.com> wrote:

> Invoke acpi_gpiochip_request_interrupts after the acpi data has been
> attached to the pl061 acpi node to register interruption.
>
> Otherwise it will be failed to register interruption for the ACPI case.
> Because in the gpiochip_add_data_with_key, acpi_gpiochip_add is invoked
> after gpiochip_add_irqchip but at that time the acpi data has not been
> attached yet.

We need to fix this problem in gpiochip_add_data_with_key() instead.

Yours,
Linus Walleij
