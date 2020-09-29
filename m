Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B671127CE07
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 14:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732991AbgI2Msa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 08:48:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729646AbgI2MsT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2020 08:48:19 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83496C061755
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 05:48:18 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id c2so3890849ljj.12
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 05:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IMvMGHi3GydeVKLOrfC/vWyiwI8YwAhMbrnZw1cRxOs=;
        b=peVIjQzaZ/pszoAnmZbBscUTAEFKGErn4WRK47+BgAKJqP6xS2c1xk6K7ZzWovbZf2
         ti/cmwLcSSkQA1+F5ilOUDu+17EGfvIXoA7hKyUL9TUXK6n4amn0IS6lylrteOul7Mt/
         byyqhv8G7Xs6tKXwZ5Yp5KyzWFjxCCPz+lqp8amlgOslfWgajcu7CXF1VwQpixq80y8G
         jqjncbVXsxjra/Q9gEaOY+/Nrqodjlh5n4MVPGhnHLGNES/s5eiuNxjoDWwAeqYMeRiO
         NWfelKACab2zTbAd8O8AonkYy7rhaiqEdBeXhl5ak+OGX5iVmsvqz8yelSf8ht+hiB1Y
         Zr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IMvMGHi3GydeVKLOrfC/vWyiwI8YwAhMbrnZw1cRxOs=;
        b=Kx1+E94/Ofr8HlYP4hDolkFx5LVKlo1Wqf/Vx9ABkgMUrj9a434K7TzbagdbRGyLUo
         onEqCUssSU3ZzEKpq1GQdAsOQhNkhQo0SLkhiWEFW6MgGJT2g/lbWTKfh6nCZGgD04jr
         3HN/kcP7laDdfQ4G3lDUiGsjMinmv75Ps0zQ88DgFG1AqIKIo3p4fvTHHrzvzKK2/FiJ
         wisUTf1P1HhBpJIQxPml46LPNoynt4oCCKB+97AcRHbyqKQr7JRITNiVQRAAaFB8ZWo/
         usXPq1S32VphltQO5W9pcM3hcciinHGjJLygsetvHbJK6qQMtoeVnhG89yqKMWrP+9O+
         BqIg==
X-Gm-Message-State: AOAM531j7wu9/wyjaGiaogOGDJmmXd+8NpV0Bg4lHI52s+nT90miBmXt
        7OVE6zScDIpJ8wcjsWyOvNNCMtZKEGfmEKmQ3c/EEA==
X-Google-Smtp-Source: ABdhPJxnA3qRid3mM60XUEJepbYMl8mDolsQ9KdGO3C9GOZv0vZRhKfRr/vLKQSMNCCxJr+uBzpvSl9ICGCfbY+94Q4=
X-Received: by 2002:a2e:9b15:: with SMTP id u21mr1193777lji.283.1601383696871;
 Tue, 29 Sep 2020 05:48:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200913065836.12156-1-zhouyanjie@wanyeetech.com>
In-Reply-To: <20200913065836.12156-1-zhouyanjie@wanyeetech.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 29 Sep 2020 14:48:06 +0200
Message-ID: <CACRpkda1B3LcGWc1PhXNgi-6JxapiKY4F_94c6dk4eBLgVGBJg@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] pinctrl: Ingenic: Add support for SSI and I2S pins.
To:     =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Sep 13, 2020 at 8:59 AM =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie)
<zhouyanjie@wanyeetech.com> wrote:

> 1.Add SSI pins support for JZ4770 and JZ4780.
> 2.Correct the pullup and pulldown parameters of JZ4780.
> 3.Add I2S pins support for JZ4780, X1000, X1500, and X1830.
>
> v2->v3:
> 1.Add Paul Cercueil's Reviewed-by.
> 2.Fix bug about PE15's pull-up parameter.

This v3 patch set applied!

Thank you so much for your hard work!

Yours,
Linus Walleij
