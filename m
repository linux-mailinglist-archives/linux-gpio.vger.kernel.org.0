Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB2EBAFE12
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 15:51:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728195AbfIKNvH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 09:51:07 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40098 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726781AbfIKNvH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2019 09:51:07 -0400
Received: by mail-lj1-f196.google.com with SMTP id 7so20052599ljw.7
        for <linux-gpio@vger.kernel.org>; Wed, 11 Sep 2019 06:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NoMqRKmSHDNSonXcVU6fMQXm+z8bwoc4kZBnKFdCowk=;
        b=U3w+OKyBdOmsh6TvHMeNg2QShNoGWJKQGgwwHt3oI+sJpfMGXbMmZAW4xPIAm37vUf
         eHS2BZ9FeUkb+xCURTh9+1atnbXo8i0O4a0ONkSg9pFunDi8U2UOmSKJo1csyqw42lFA
         Mtkq+qxIiq+2bjH3m880tHaH0bAkOzrbgg0bCQxQuUQHe6UfpQX4gtCSowLb48kYe9H8
         UDScj59r1OpzGwKEUTtY0PSMfA669A1lqJPtmTOGCnfVHZP26XqHbb0caZ6Vh8TRf0Xv
         FKUWnGmrKvVL/6XJ5Hq/UgLcW9DyKpOfdnw39veCqa1inGv0zjOMM6xtfSIokn3qL7oh
         WaEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NoMqRKmSHDNSonXcVU6fMQXm+z8bwoc4kZBnKFdCowk=;
        b=S6+lKdf2u73iWXJasgrFh/SZmumpzKQxm89ScC4tIrKLX/0CIMaLoB4vBQ3FtVkvsk
         pNOPnGR5VpZUGR+RyzQyEiUIH6XLAIc5bdf8CKQPqs0l3ndapsiOIFeOK1Co29mEtif0
         LxJNkZkyMr0vq58p7bX+QNKmzhI+UEwLGxqL+a49o7eEeG+69CtU6CtIwS7GpxDZUwN7
         a9rRDQ4A7Yk5klC/8BbpWcnKXubPN/KqaTOqc9vIKC4dI/HdUg3eDbxVW4TcSXd0k50+
         PICNR326LCDEOuMyooAy29HJlSktUvkKtnNxeRF9omEyWer2tNQOu6rsgrcH+U9XBTbr
         wpdg==
X-Gm-Message-State: APjAAAUHJMK3LeZUfyrti490xpin8POZx4XHOQ13nvcaWNzKjqdCydiB
        ao125PbGJhWAluHNVodr5k1TOdPZb4HHK7keszRh6Q==
X-Google-Smtp-Source: APXvYqwfZnw3PjgDOxtmmaDanHc/yotTXP96wDhdzPOnMRhDpWyM2WFlorifP/kb36RfTEmUgCFHL3JnFqi8Mce9Hw8=
X-Received: by 2002:a2e:884d:: with SMTP id z13mr22437077ljj.62.1568209863184;
 Wed, 11 Sep 2019 06:51:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190906131032.22148-1-yuehaibing@huawei.com>
In-Reply-To: <20190906131032.22148-1-yuehaibing@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Sep 2019 14:50:51 +0100
Message-ID: <CACRpkdZgH9Q9OMUV4C6zADPj_NN+QrxQOLUDcOqJ_oYCxWP7vg@mail.gmail.com>
Subject: Re: [PATCH -next] gpio: creg-snps: use devm_platform_ioremap_resource()
 to simplify code
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Eugeniy.Paltsev@synopsys.com,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 6, 2019 at 2:48 PM YueHaibing <yuehaibing@huawei.com> wrote:

> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied with Eugeniy's ACK!

Yours,
Linus Walleij
