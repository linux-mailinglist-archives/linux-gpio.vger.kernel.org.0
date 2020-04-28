Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B31381BBA73
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2020 11:58:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727803AbgD1J6P (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 05:58:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727096AbgD1J6P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Apr 2020 05:58:15 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D170C03C1A9
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 02:58:13 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id m2so16356976lfo.6
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 02:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=K2sBtRNx7PhSzPZ9iZVY4Qa3ve/fLU6E7fXk7zTXtP8=;
        b=mVHgFUR1ptdq+Ra8ChQLqF/rBEoIstE8ZBn5MRfdiJ14YLJ6cavaqDVU6z+YK01SxN
         9oSCd2xltXsQOw+tPEZsGRD8GYzQGPo1Ea1wLTII2u0YadLLZY0MXG/yJ6kRCVDL3vuW
         hfAP1AZTWzl9jOEHnzzQdL9pm2ue0k344DbUvhnI0zDXPTwdaMCeezeZtKVQACEAl6S/
         0daqPZV9EqIaH5rndilcywTc+NddK9HZCNH8sesUleOkWX8U+CSkZUJ4GcNHQEaIDvV8
         SejsV30Q/Wb93azr7u4zwHNknX/4kq9pPDrLjAqQT+bGtfLqT0VE/8dnE0NEmVwR8mBY
         sfuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=K2sBtRNx7PhSzPZ9iZVY4Qa3ve/fLU6E7fXk7zTXtP8=;
        b=qr0YL36Qr9mg39PUZv8I4xNdfQ5x1jkLnePclMHH6rwmT8znSlw8Mk2KtR4dmgnGrL
         HgjVc+gtdV0ZaeakXIWvVLzDnyimaNM/PqqV8mubyWSMbciDTxLeUa99jXtxVpxa3Je4
         IqDlIXByyPi6zHEufDJg2etY8HnL7L9r87iIvUhSgV5SOQC8sFILx+A83Cu+DZCPzVtn
         HdPpXjZ9N3EdEKB9z/scvCjVsrNPv95YrcGojBzQRzIgxCaLg+5thTV7/P21V2X6Fbzt
         oWfLNK/yacR6hDmikZQYAgpyiEmpseQ/rueCAcEC/1TUHoOJO6T0HrMnjBOUf68wZcaJ
         HuVg==
X-Gm-Message-State: AGi0PuZsKztvkt2thGscTdviIVC8g7AVjBzOl029UT/giQx/S8RjcGo/
        iLHU4A4fnavKJrpuEzYgo15VDWVVm/yeKzqk4XQOSg==
X-Google-Smtp-Source: APiQypJgR9W6U13zcfDrGvlRdKXdtFC8wu0m0JoeHg9XV6mKnUUCD0eedTeCwViJJKUt9nBuCBxDv6Y3SnUETZJxBQs=
X-Received: by 2002:ac2:5c4e:: with SMTP id s14mr18862973lfp.77.1588067892086;
 Tue, 28 Apr 2020 02:58:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200417092112.12303-1-yanaijie@huawei.com>
In-Reply-To: <20200417092112.12303-1-yanaijie@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Apr 2020 11:58:01 +0200
Message-ID: <CACRpkdb5Ozz_MKAUDoyOxdnu_NkN72vRu=ZY7j_Lb5uMAiS3SA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: remove unused 'pwm37_pins'
To:     Jason Yan <yanaijie@huawei.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 17, 2020 at 10:54 AM Jason Yan <yanaijie@huawei.com> wrote:

> Fix the following gcc warning:
>
> drivers/pinctrl/pinctrl-bm1880.c:263:27: warning: =E2=80=98pwm37_pins=E2=
=80=99 defined
> but not used [-Wunused-const-variable=3D]
>  static const unsigned int pwm37_pins[] =3D { 110 };
>                            ^~~~~~~~~~
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>

I'm sceptic about this. I think PWM37 exists and just need to be
properly defined.

Mani will know the right solution to this.

Yours,
Linus Walleij
