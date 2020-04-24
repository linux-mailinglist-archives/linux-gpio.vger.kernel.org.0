Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15DFC1B7132
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2020 11:50:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbgDXJuk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Apr 2020 05:50:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726193AbgDXJuk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 24 Apr 2020 05:50:40 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD508C09B045;
        Fri, 24 Apr 2020 02:50:38 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id x15so4573896pfa.1;
        Fri, 24 Apr 2020 02:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pbcOhQqKUatbZW3PIFWQB5WseDd9hz4BT+OKuV/Ex7c=;
        b=TL206/yZkNCWkdT6lTbCRA+yet/mIFpmA/kkvZoeN13bkRghulq4uPnFiTInaph6vu
         0lsjwi/qCY82okNZ8Cj75SBQEPzEL4oL8QtKOr812oYwJznSfRaUtiYf89kH1av7vp7L
         G/wzsGsCqgQG9I/K8UBzKMsrl/k5xblLEfKZCN0zpTLHMxsWCtfXSFnmE9Ozdda3P8Q2
         kjeA6u+jJIKCbFi4RNMCYIUJATEJHDbWEMQZ/DVQpLSrKd/uLBcci5IewrdVnKv7RXKA
         /rtGkwEWrrzZtt/6HNWEYzDNhr4FveRGf0RXBk0Krjg6DCdspss4ZHQcUmYHMoJktsNr
         eYqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pbcOhQqKUatbZW3PIFWQB5WseDd9hz4BT+OKuV/Ex7c=;
        b=h1Z53n6eqbxtYeNCIsrj9RuaWZL+Ki60SKas5pauYwgGmia465/vOtvZUfpVf9QIhm
         EW6U20lnLJOhTrQmX0rsm7xCm8LZtdB/GMyIkJt+dgZOqq5SUnrWb6rSRiiUGPPBti8Y
         hwIfA9YyJDjhPm1bLtHKI0DLrWIFCSj1rTfmssux1J3zEJky1pw4KvcVCPtnbiQJd09N
         +MlUJC2tH0mYYkcR1CnwNfj6WMNUwpOO1D2SlxHRGxDvFcD7AZqX8JRsuXIN2XdfJRAS
         MWo0L30hR/WdhJNd/qakKubeAUEF4wdWsk+wGe5L0enJxisGnDxk6BwvLAhyxu+ytkV0
         jhfw==
X-Gm-Message-State: AGi0PubJ2N/csKljO41W8txMAdvCwFSb33NvXOzaJ2Sg2eHa+0yaO+2C
        9xtnWla8Feol7EJLb+Rx/zkJl/81mXq4h3yjmnw=
X-Google-Smtp-Source: APiQypJXXt1pl3u4AK4S+SuhVmIplJPaKhlPqZsOUJSg4hODFktaXH831PhMVdx9Mh7LqK5fPo+AHR2k21LMyjkNLvE=
X-Received: by 2002:a63:5511:: with SMTP id j17mr8205689pgb.4.1587721838081;
 Fri, 24 Apr 2020 02:50:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200424091201.568-1-caizhaopeng@uniontech.com>
In-Reply-To: <20200424091201.568-1-caizhaopeng@uniontech.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 24 Apr 2020 12:50:30 +0300
Message-ID: <CAHp75VekvqHX_eUm88RQJQiU59hUoxUY=pP4MWsp6xn3os9bPg@mail.gmail.com>
Subject: Re: [PATCH 1/1] pinctrl: add IRQF_EARLY_RESUME flags with gpio irq
 for elan touchpad.
To:     caizhaopeng@uniontech.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Zhangyueqian <zhangyueqian@uniontech.com>,
        Zhangshuang <zhangshuang@uniontech.com>,
        Hualet Wang <wangyaohua@uniontech.com>,
        Zhanglei <zhanglei@uniontech.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 24, 2020 at 12:16 PM <caizhaopeng@uniontech.com> wrote:
>
> From: Caicai <caizhaopeng@uniontech.com>
>
> I had tested two Notebook machines, the Intel i5(or amd ryzen)
> with elan touchpad, and there's a probability that the touchpad
> won't work after going to the S3/S4 to wake up, that it would
> appear no more than 15 times. I found that there's no interrupt
> to check for /proc/interrupt. It was found that the gpio
> interrupt of i2c was also not on top. By adding the gpio
> interrupt flags with IRQF_EARLY_RESUME, now the touchpad tested
> 200 + times works well.

Thanks for the contribution!

You need
a) to split this to patch per driver (I can't take or speak for AMD
code, I'm not a maintainer and don't have hardware)
b) explain what this flag actually means and does

On top of that we need to test this widely to avoid regressions.

-- 
With Best Regards,
Andy Shevchenko
