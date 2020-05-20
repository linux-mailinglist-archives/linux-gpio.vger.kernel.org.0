Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E58D71DB577
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2020 15:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgETNr3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 May 2020 09:47:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbgETNr2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 May 2020 09:47:28 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45722C061A0E
        for <linux-gpio@vger.kernel.org>; Wed, 20 May 2020 06:47:27 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id l15so3402871lje.9
        for <linux-gpio@vger.kernel.org>; Wed, 20 May 2020 06:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=v/fbU/YykiYywnhxzUCtdbYsAhy4mokpI98XjDignOk=;
        b=LjwpZ5WAvZaCWix9AZjsOyBvSER2CXxm5AMHOfJAvPCgXFpj2fixhKIx+qoaZl4mpg
         wctISjMvhRNO41cmThoY3VLFzdR5SUaecSGKvwFV0V6has5B4PrXQiVJkPh5n09FbomT
         1N6YK1qFqHgVVUpltipS5+AKRn7s1niA8w6r2WH56Yp7oh5gMr1rhEUICUTv79wJgOTE
         zvK2y+fVCqCwt7Zf4pdI+wSSGjStO4wNth92as0MWDNlKvXF94wInJ/pHr2Mkp5iZ/mo
         gTP820xaRZPr5SYbaLq0AsP/G5wU3XnlJGmrYTXAWm6UmxdkMhfaS1ilDJ48x/RT0Akw
         GScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=v/fbU/YykiYywnhxzUCtdbYsAhy4mokpI98XjDignOk=;
        b=V7uP51lKZNXa1vdtBGYI5044tTzbRrUZKE+eP8vgrIjvYHgvI5R9hV6DY71KLpPwhP
         Kf4kh3Fic7ICeGCXvQHdsO4a7lgk6/kNIt4mEFTXhy/MrkFRti2yZR/p3mRQ2P7PGURj
         UD9TKTfkx0qAPulfWkmBAHBf+78ikTKvQ2mz9eB8AHUYHWl7+ph+Ut9rR4bsxbTfC1gb
         mPVr1QQE7Rbu0BegijhQznHerpzISgxogWqRJ0aIeEFXrHsSoxcroatH+lhfM4Wxw5Mz
         6KsRRzX74hfQzxuszkk2AFGjWVwPnOJQ0hbolMy5RsLrNC8PKTxliyL0I5TWAOOzYZas
         eCVA==
X-Gm-Message-State: AOAM533FkV/mTUW6MDLXR2c4h+9DkinW9F4rRQRbnfyJ7VJibtKAuIjk
        bX+QJGsBgiB6rP6NnDf1S9b/zQ==
X-Google-Smtp-Source: ABdhPJwkHQtJ+WIPeV5PBl0zvnZpiJoTvWQDz9pqSFZ1YJmStumqkV2K7/YNOxiSOAqMQqDx+Tk2+g==
X-Received: by 2002:a2e:7f04:: with SMTP id a4mr2803918ljd.114.1589982445707;
        Wed, 20 May 2020 06:47:25 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:4e2:ae96:6d06:66d1:d6f1:88dc? ([2a00:1fa0:4e2:ae96:6d06:66d1:d6f1:88dc])
        by smtp.gmail.com with ESMTPSA id f9sm1086577lfm.62.2020.05.20.06.47.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2020 06:47:25 -0700 (PDT)
Subject: Re: [GIT PULL] pinctrl: sh-pfc: Updates for v5.8 (take two)
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20200520125357.16281-1-geert+renesas@glider.be>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <83cb2005-c9e6-7711-5b78-44080256e52e@cogentembedded.com>
Date:   Wed, 20 May 2020 16:47:14 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200520125357.16281-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello!

On 20.05.2020 15:53, Geert Uytterhoeven wrote:

> The following changes since commit 41fe32ecc7aff4527a4ee477870d9b1164be95a4:
> 
>    MAINTAINERS: Add DT Bindings for Renesas Pin Function Controllers (2020-04-20 13:14:05 +0200)
> 
> are available in the Git repository at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v5.8-tag2
> 
> for you to fetch changes up to dfae0422de12265ae7c9bf57b34990200dea0c83:
> 
>    MAINTAINERS: Renesas Pin Controllers are supported (2020-05-20 14:02:00 +0200)
> 
> ----------------------------------------------------------------
> pinctrl: sh-pfc: Updates for v5.8 (take two)
> 
>    - Add support for the new RZ/H1G (r8a7742) SoC,

    I think it's rather RZ/G1H. :-)

>    - Minor fixes and improvements.
> 
> Thanks for pulling!
> ----------------------------------------------------------------
> Geert Uytterhoeven (2):
>        pinctrl: rza1: Fix flag name in comment
>        MAINTAINERS: Renesas Pin Controllers are supported
> 
> Lad Prabhakar (2):
>        dt-bindings: pinctrl: sh-pfc: Document r8a7742 PFC support
>        pinctrl: sh-pfc: r8a7790: Add r8a7742 PFC support
> 
>   .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |   1 +
>   MAINTAINERS                                        |   2 +-
>   drivers/pinctrl/pinctrl-rza1.c                     |   2 +-
>   drivers/pinctrl/sh-pfc/Kconfig                     |   4 +
>   drivers/pinctrl/sh-pfc/Makefile                    |   1 +
>   drivers/pinctrl/sh-pfc/core.c                      |   6 +
>   drivers/pinctrl/sh-pfc/pfc-r8a7790.c               | 744 +++++++++++----------
>   drivers/pinctrl/sh-pfc/sh_pfc.h                    |   1 +
>   8 files changed, 407 insertions(+), 354 deletions(-)
> 
> 
> Gr{oetje,eeting}s,
> 
> 						Geert

MBR, Sergei
