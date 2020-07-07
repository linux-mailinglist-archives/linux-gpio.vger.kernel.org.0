Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2F7D216FAF
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2020 17:07:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727789AbgGGPHn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jul 2020 11:07:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbgGGPHn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jul 2020 11:07:43 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E0DBC061755;
        Tue,  7 Jul 2020 08:07:43 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id b92so18647231pjc.4;
        Tue, 07 Jul 2020 08:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Cj5YHVMEb1Skcs4Bgm6WovZ+60YcaX0yJ/fN2fOst+g=;
        b=ViObSl1ZKpdciiuiNFoSHCk5YRn01KNsWY0LK+HmrnV1MqDayYTmP09uakkSE9Oave
         5Z6J2fusmaBC1BtqDsnhUO6FvJMblkUrvXV7QeoJgmJHeWLtWo9a/N6vpL6jIcL7L1Hu
         9xt+yO49i5RQUVxCO88mM5b49xuIlDH5BDxbkzS+pBqsEAuyRkGQNlX5loUyRfVOCvA8
         n8DrIp1sgKmV0ae9UvWWKWWnPw/U0/ZgU8V7NmUC67FUjASPBc1aEmswsx3zz1xd9Wwo
         QVQxvZ4GQ7TmA00rFZCj8E1/Y5VdeTCikQGa5kVwZOZrpaatXeQdt7SuP7D50rHxjyGV
         rI0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Cj5YHVMEb1Skcs4Bgm6WovZ+60YcaX0yJ/fN2fOst+g=;
        b=ItInun/AoQmJgSxOxuWABryBOQg/voyHx0g60UdMKjY/tz7wmIzNoWu2SfoTCt3kOr
         9xArLsJKRcK5EqWdX5v1Jvr7V6Ex8/Ezy8qqmkult0GwIOT2srLBta8sLzAgkP+B6oT3
         zr0AZI/9AVb8Hx2EJ1pYARwQtRKludGE2sVcQi949PgahfeYzv8k0Pw0sJVat5Ts5qZm
         HnqBTgapQUKZXjlQQiPYOB5Wov/wv0FfdCOXLT40q+e5jxz6UtOU2FMX4yKkrZlHLt7w
         stSIhsqeZLdvCO8QIE5z1zFlRUghicYxLljGdVuoyhLpIx3i0AqiNxS1LZlwF4esX9wj
         xrSw==
X-Gm-Message-State: AOAM533dlyJu3TlTfalzrgaS/BikkCtGu5AjEmzDwPxXy2CmD0+WQN/Y
        ZwgwW6IjsZ5MxXEsnC5rCT9+I6mjwJBM8bG89C0=
X-Google-Smtp-Source: ABdhPJyAi6KKJgB+rJC8tyyRzMI6cuzPylPEhysjXroqhcz7RiGTClFrH2Ex/BeJyxHSXInhDczuPgIZoxvnXvep11E=
X-Received: by 2002:a17:902:7288:: with SMTP id d8mr46952213pll.18.1594134462903;
 Tue, 07 Jul 2020 08:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200705133038.161547-1-mans0n@gorani.run> <CAMpxmJUxGq3_R7BRGv68ApeNC+g9PDm_kBd0r=8TjFSyTNxFWg@mail.gmail.com>
 <CAHp75Vf4440V5Oh1SA5tjVgss134qGkx591ANDY3aQ+oecEzmw@mail.gmail.com> <15d8ae43-6905-b861-3b50-d1ba780edf2d@gorani.run>
In-Reply-To: <15d8ae43-6905-b861-3b50-d1ba780edf2d@gorani.run>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 7 Jul 2020 18:07:26 +0300
Message-ID: <CAHp75VeKUvy9tkoBq=axx9g-2_p3QUqffA1z2WmGO-Uu8oyHHA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] gpio: add GPO driver for PCA9570
To:     Sungbo Eo <mans0n@gorani.run>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Walle <michael@walle.cc>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 7, 2020 at 5:03 PM Sungbo Eo <mans0n@gorani.run> wrote:
> On 20. 7. 6. =EC=98=A4=ED=9B=84 9:00, Andy Shevchenko wrote:

...

> But I don't really understand what mutex does here. The driver does not
> need consecutive commands, it only sends/receives only one byte at a
> time. And AFAIK each i2c_smbus function is already protected by a mutex.
> So what should be exactly inside the lock? Should we protect the output
> buffer as well? I'm not an expert on this so please enlighten me.

There are questions, answering them will give you a solution:
- Since we have two functions doing i2c communications, can they
clash? If so, does the i2c framework guarantee the serialisation?
- Since we have a shared resource (buf), can accessors clash? How do
we guarantee serialization?

--=20
With Best Regards,
Andy Shevchenko
