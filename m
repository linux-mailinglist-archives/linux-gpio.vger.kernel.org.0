Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC5DB2663A0
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Sep 2020 18:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726206AbgIKQVf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Sep 2020 12:21:35 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:40769 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbgIKQVH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Sep 2020 12:21:07 -0400
Received: from mail-qk1-f177.google.com ([209.85.222.177]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MVNF1-1k8HS921h9-00SPWM for <linux-gpio@vger.kernel.org>; Fri, 11 Sep
 2020 18:21:06 +0200
Received: by mail-qk1-f177.google.com with SMTP id p4so10437924qkf.0
        for <linux-gpio@vger.kernel.org>; Fri, 11 Sep 2020 09:21:06 -0700 (PDT)
X-Gm-Message-State: AOAM531TZVwKbJiHh7YMlVCYZLkgQS/k/LKjVvP8IPksR+xuT7SWF/64
        X2wgVr5aigVwPYQeFD80Q/cYIS0q10Q7HeNrEns=
X-Google-Smtp-Source: ABdhPJzFEgC9dURwjyMtJYlD7nYRAS9cBjCMiezqXSVOnDQuin3nN5egW4b3fQ2NMXEVr/gzB8WcMuEvGCQ7wK+V7nc=
X-Received: by 2002:a37:a483:: with SMTP id n125mr2216550qke.286.1599841265258;
 Fri, 11 Sep 2020 09:21:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200910101935.47140-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200910101935.47140-1-andriy.shevchenko@linux.intel.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 11 Sep 2020 18:20:49 +0200
X-Gmail-Original-Message-ID: <CAK8P3a30D-mU5eLV1xAdvAordvcBavPN6sfEBghLQrQXQ2wVfw@mail.gmail.com>
Message-ID: <CAK8P3a30D-mU5eLV1xAdvAordvcBavPN6sfEBghLQrQXQ2wVfw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] gpiolib: Fix line event handling in syscall
 compatible mode
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:SGp7oUHodQSG8gmkALvB8sri+xbse7L2VXa+lPGZcmdPNrsXyfT
 fnbjy8m4O/8Y7iYzeq0IUdiA/9CmosN2kUEC7S2CZOTwxRQ8HtRzm+KUrsB/axTHcYcJEfB
 2gTrZX4hE6EmMErOTrCuJSINBrbCU6QqMVJNrgLhTtu9M6UmbmWGAbBdszTHFjs+7FSAi+E
 GnoSzIJrTOgU+QKT0r9UQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:K4qKnlIJWAI=:pFzOmBa9CLVEf/YY5c6xO9
 iEwE2G9bmje9NVQLrKlVvuf4NR++JTUazKKwqLGiXJ9+aUS1XYi39958qiYwvmbvXhAMCMa+O
 m3WxdJmkGD4iqAAeRhLrwA8r+K/jerl0Zbg7pWARj+PqSDq3LI3+5uzn8BXKu2oB5AGjeQICc
 ChT/VbWi7iyAtmIzq+dnMoK6KkaZSSL85vWvi3fNNZaB2Oyc4PdmPPR4tw13PsrOd9yUQ2QqX
 z469vSyEuv6Fn2RbYLiwwvs2GA3OxvRsIXyBA6n7J4wK9l3zIaMBZ1cb88qjRf7tOud/X21f4
 zzeCTwFzDuzhtt0b8ChvQDjMz1JOEp6ue2gakqwK1xDB0vCt3rLMB4p3HKxWkzLToRP+9e92T
 sCsr5V6cq97/et0QSGDL3Rdl3AIs8krRh5jaM+JZCAFyeAm2dk0AViQWcWYV1gJoooI7SI+iv
 ffRuoMnAaAIGUalzYxWQ8IuYUt3+fq19DXYBOdCBE/RuDK1x2XX5ZfSIWV61l+Eyalq6UGVKD
 ko0LrVPx1YG1MzQcTdJtDV9s0tZEHb4cRd1G7Aeh9fDRQU1aRE59v5wKrEhhhrzSO3dKE+Of1
 EtjJrBg2ljyjXCP7KbxQVAvfXHNDq2uyaadkQtBchVnWAqmc7prdBGs5Qu5AoVQQC8Kzpke5k
 Mfn+VsJsazk1xrPCtGpVmcvdEhct6xdpFwz+MkOpyCv74ekmNDolzMCXZtFUGRLmcv8rioaTQ
 krCVNBZPyUDa51uCBx/qufR52FDON1PnTMZvwR+XlX448DMMlxVu3LhbPIF6RRLIU3a9FwQfr
 7oQ4VsQOz8qOUI79x4sm526rX0y5cRDim6HATTIkXTmr4vBIEUwW8NINHaYNNA3pLAcS0cW
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> +static ssize_t lineevent_to_user(char __user *buf, struct gpioevent_data *ge)
> +{
> +#ifdef __x86_64__

I would make this "#ifdef CONFIG_IA32_COMPAT" to clarify what this
is actually checking for. In theory we could add support for
CONFIG_OABI_COMPAT here as well, not sure if there is a point.
I recently came across a couple of things that all need the same
hacks for arm-oabi and x86-32 in principle.

> +       /* i386 has no padding after 'id' */
> +       if (in_ia32_syscall()) {
> +               struct compat_ge {
> +                       compat_u64      timestamp __packed;

No need for marking this __packed, it already is.

> +                       u32             id;
> +               } cge;
> +
> +               if (buf && ge) {

I think I'd leave out the 'if()' checks here, and require the function
to be called with valid pointers. It seems odd otherwise to return
sizeof(cge) from the read() function without having written data.

Note also that user space may pass a NULL pointer and should
get back -EFAULT instead of 12 or 16.

> -       if (count < sizeof(ge))
> +       /* When argument is NULL it returns size of the structure in user space */
> +       ge_size = lineevent_to_user(NULL, NULL);
> +       if (count < ge_size)
>                 return -EINVAL;

Right, I see this is how it's being used, and I'd tend to agree with Kent:
if you just determine the size dynamically and add a good comment,
then the rest of the code gets simpler and more logical.

      Arnd
