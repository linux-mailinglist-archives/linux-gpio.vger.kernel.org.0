Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF67CB0C53
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2019 12:11:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731014AbfILKLr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Sep 2019 06:11:47 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46926 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730458AbfILKLq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Sep 2019 06:11:46 -0400
Received: by mail-lj1-f195.google.com with SMTP id e17so22992802ljf.13
        for <linux-gpio@vger.kernel.org>; Thu, 12 Sep 2019 03:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4vEs9WeFlLNAO6DjHLn6Vtkhi8L0t325kmZ0jO3y+Wc=;
        b=NcYAwdsi28+vjx08eTFDNGKCd5XONjCjq2/QkOSeDBdhC+w3nD8DC27b+UvFvDLbLs
         /z8u3u9qYsBnfd/QOEG4/BwX4MI6VRxCCQculwd/WF1kd4hjYUzRY9lWo/6/He2OjzMD
         7VDz+b/xKsW/eAU/rIlfF5tzuV83nBGL/q63zj74cWBCppYPveJO3ntCM4Tg3VcvkQdj
         bs4Swi+W0EMkGOLnHmvc5u/fdozNpS/BPIg1qWJTeYPiuDre5tJ23HeewG5fTbolLIl4
         r9wq5vjgg9LgD+IBWnz6yzJYHf39aHZjSdZTlFbw7i1mT6ljfGyyhfEGSMXl6jWH8wEP
         GVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4vEs9WeFlLNAO6DjHLn6Vtkhi8L0t325kmZ0jO3y+Wc=;
        b=I+0RgafPysMyzB/HReeY9CPHBvTydDIA09g96fbiWpktsGPhDllOd88E2JIZh2QRvT
         XI9KO3nUTI3aIsHoYfEnJXtyzvlFW4X8/eo0W6tZq9DV+FZhi5PQkvbRa4vLJ3SGFa10
         tU6c7OpE13hUxUGJLp3mP2vlsCM0TOzR5yOI/oIyhIt5vKCRm/GNfDh4+adwCXfwj78f
         5CXhmBy9oF+hxSLSNZQZtdhae+4L3eV6lIT8Kl6uShlKq9fOcUCLXz3wr6KFvkx9I7xP
         gF5Rh9hhd1rlnVEJDPjgFxWKUbVjTdgbLRjAKHGq588c/I7WPbD9e++jGD/U4ldDIOOR
         o14Q==
X-Gm-Message-State: APjAAAXAH0b1/veIMsZV9zcpU4OETjlf3po3T54E7xR5EZwhbP++hupj
        HB8Q3XX94WAK5tBEYyzDFkBHCDtQZwBz+rMfKL6LqHM6wfqudQ==
X-Google-Smtp-Source: APXvYqxb3KEOIkMavy8eX3cExL/IC+pSzxilfnvqDLs4HTLm858UzgLR2nTJiHu9gy8/sLKtJYCibJo1y8MYZwIb0sI=
X-Received: by 2002:a2e:9dc3:: with SMTP id x3mr22449421ljj.108.1568283104833;
 Thu, 12 Sep 2019 03:11:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1568274587.git.rahul.tanwar@linux.intel.com>
In-Reply-To: <cover.1568274587.git.rahul.tanwar@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Sep 2019 11:11:32 +0100
Message-ID: <CACRpkdb7bPo7oH9w5OhAsOoQXx=MWjJELd5JvBt3R1sPdMjnpw@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] pinctrl: Add new pinctrl/GPIO driver
To:     Rahul Tanwar <rahul.tanwar@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Andriy Shevchenko <andriy.shevchenko@intel.com>,
        qi-ming.wu@intel.com, yixin.zhu@linux.intel.com,
        cheol.yong.kim@intel.com,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rahul,

thanks for your patches!

On Thu, Sep 12, 2019 at 8:59 AM Rahul Tanwar
<rahul.tanwar@linux.intel.com> wrote:

> This series is to add pinctrl & GPIO controller driver for a new SoC.
> Patch 1 adds pinmux & GPIO controller driver.
> Patch 2 adds the dt bindings document & include file.
>
> Patches are against Linux 5.3-rc5 at below Git tree:
> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git

OK nice, I think you need to include Mika Westerberg on this review
as well, because I think he likes to stay on top of all things intel
in pin control. (Also included two other Intel folks in Finland who usually
take an interest in these things.)

Yours,
Linus Walleij
