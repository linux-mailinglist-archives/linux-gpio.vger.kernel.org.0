Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E81F2073E5
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2020 15:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390820AbgFXNBa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jun 2020 09:01:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390686AbgFXNB3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2020 09:01:29 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EC90C061573;
        Wed, 24 Jun 2020 06:01:29 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id k6so1028594pll.9;
        Wed, 24 Jun 2020 06:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FtkmdXx4B1M45guE2A+6Jpvosg2yvcthShAtRVDK1oY=;
        b=rVQuaamTUWBcFQ9CabWEd+EnZ8MIyVY1vX7xhBVIjVJd0lMRmGaISN2lqsj5SbeS4s
         J9Au8DfgkfZW6yfIH8s3tJm1vLXpqgEthdHtGUVBN789fEWZoRjmQPU5kXs8RmupyKHQ
         1psCw/spVDoHCtqjEN+acSoC3JwOZ1hpIyZywbs4sBUnBoV1RlKg/5Myl44nvkpWU3C1
         eHLPve4ShclXkDGX3C9j1zbIOG88VPxBgf5L3i9Mi0cCM6nzQKVU64snNKYLhJ3pf+uR
         rTOlk1cHnsNomvzyLf2EIZnJVSLwBR/ktIhJboFB1Tni8GQP+MdoSI+J/G+CfqGsdfNm
         ddHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FtkmdXx4B1M45guE2A+6Jpvosg2yvcthShAtRVDK1oY=;
        b=sXpQDluYKEoDMvkQ8Tmum+5EHzdx2jgftB4UoVayBjKiuNHTdaUb7+lB31Z8/M8+go
         y7hLwCl79wKJlKc6zXj0DPOI4SHj8L/mOpM5zTIgAeAVoOVbq7DOdpO6RpgU4XHmq1KM
         VIpBZD8eWfCPNozfSa3Ye/RZ4OZs+RufnPtxvACrRGMdo+ue44FuKVF71dQW2Ft79aXX
         3STxtE1Zv4dpnvZh4ATTlDaNGfHdL5cPE4/IMnbXsRHWqx2UsXlck7HT3nh9Ckp2hEQx
         s+sBH8sl+MAGs8tlmZba5VwHFqzP/FXlElcT1k9KtgSPgkLeTTLSPAU90b4voAai6fa7
         Fhcg==
X-Gm-Message-State: AOAM533+If5aFFDrldirk7qFJ+DRzmz0qeT5sGeXrTryVg7uT2/3br77
        I1zrVFSX+e1PtwkkIO8fshLoqk+rC46Q2I81aD4=
X-Google-Smtp-Source: ABdhPJxUXoiDpqrzcG9jHa+PhMn/D2FoW3z0FBTkuN1UXlMkVdn0fvo3bmb3trunYGTSAI32+hU1loB8+TGTJH3l1pA=
X-Received: by 2002:a17:90a:b30d:: with SMTP id d13mr28040118pjr.181.1593003688866;
 Wed, 24 Jun 2020 06:01:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200623060526.29922-1-mans0n@gorani.run>
In-Reply-To: <20200623060526.29922-1-mans0n@gorani.run>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 24 Jun 2020 16:01:16 +0300
Message-ID: <CAHp75VfMQh3KW276uAwBV-nOVTnLaAspGijPHyZjuHzm4XLPag@mail.gmail.com>
Subject: Re: [PATCH] gpio: add GPO driver for PCA9570
To:     Sungbo Eo <mans0n@gorani.run>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 23, 2020 at 9:06 AM Sungbo Eo <mans0n@gorani.run> wrote:
>
> This patch adds support for the PCA9570 I2C GPO expander.

> Tested in kernel 5.4 on an ipq40xx platform.
>
> This is my first time submitting a whole driver patch, and I'm not really familiar with this PCA expander series.
> Please let me know how I can improve this patch further. (Do I also need to document the DT compatible string?)
>
> FYI there's an unmerged patch for this chip.
> http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2017-May/105602.html
> I don't have PCA9571 either so I didn't add support for it.

My very first questions to such (simple) driver submissions is: Have
you conducted research of existing drivers and found that none is
suitable for this chip?
Do this and answer in a commit message, if it will be still valid.

-- 
With Best Regards,
Andy Shevchenko
