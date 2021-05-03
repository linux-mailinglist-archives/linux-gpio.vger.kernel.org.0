Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3BF237128F
	for <lists+linux-gpio@lfdr.de>; Mon,  3 May 2021 10:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232959AbhECIp2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 May 2021 04:45:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232906AbhECIp2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 May 2021 04:45:28 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89C34C06174A
        for <linux-gpio@vger.kernel.org>; Mon,  3 May 2021 01:44:34 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id p4so3675608pfo.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 May 2021 01:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u8QTL1/BLMSAnv/3iNsL7Pj6nngCrqw4QASwlG2l2W4=;
        b=c8+EJHXtdnZ2GM/gZ0Vknj5T8HquKIYFu++JMFokvEd3u47Ea4FT9+pq9CgwYG3I3n
         jWgvQdwonuUxS36upF67aK03RBItVIft2dWZ+/ue9EP6V0BmsJYOJruzjR3s3GQGemvJ
         IdiSydyNbgQpYrT1ZWdaWjfcZ/giUD7NbFbkuVs0TyM9jwv7xrRDV2p4e9Sjq2bsS9Xf
         pfFJutB2iXWzixGAlDgnnx4QaQrKRTav6qSP7wWExfe9PC/LlPNqWDPJn4uHcAJXKRRj
         7jWkjUXW2opCzMqCAPyTZ7l0pjo0nKPMkXVWv6WzHcrHRHY2z6vgwlVLbugUNjVFx5+a
         09BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u8QTL1/BLMSAnv/3iNsL7Pj6nngCrqw4QASwlG2l2W4=;
        b=h9aRG7XczyrtjdUNZnKppWCgAisQdpBNw4gqx2zCXAt7VMwz2rEVmb9PhU4CK13efl
         Ej+7O7bHvno/EAYZSHkefltH1oetWT4YDvfeRT+3OVU4LLAIH28F7TwoN3BSNPbPP+CM
         H4ZNnMVlxjd+BwvdSOLW0K/CGVywDTzcmGZp3GiuJZZZyvsIbxWSG4jBhl0EzfSxFJ5F
         bmvUCZIeyitqYTzxfbZN9Rlp0nDvhOitvH/hYU/X0trTdWWACmzitc/NMZqS0pXfu7WA
         aHXZSNuGcbtL2VVJWIrft2LWbrS+Ljqykf7NcYcXrnbZWGv3QYtjjNQNOSxi1TBKSsWf
         3SkA==
X-Gm-Message-State: AOAM533y+U/KTmPxA267tGvZge/0rn2zGAR3meL91tR02h3gFFaZjthG
        e2k6TRssvrGDMY5VYxTM+c9xHUBIf8Yic0zZCOE=
X-Google-Smtp-Source: ABdhPJyP1wTcy/TSzgddROekvhyKuat7hqlS1g0z8yvNsFtA0sgthAjaXaNjlVaV/vBMZ2UBnZYjnUDKmOoV+mMmCew=
X-Received: by 2002:a62:e50f:0:b029:214:8e4a:ae46 with SMTP id
 n15-20020a62e50f0000b02902148e4aae46mr18297958pff.73.1620031474168; Mon, 03
 May 2021 01:44:34 -0700 (PDT)
MIME-Version: 1.0
References: <dd5443384071ef55c46316e7a66cca55348f6005.camel@microchip.com>
In-Reply-To: <dd5443384071ef55c46316e7a66cca55348f6005.camel@microchip.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 3 May 2021 11:44:18 +0300
Message-ID: <CAHp75Vf3j5NmZFq8cuMy3nbKuKq193_=B25nfCoS3e7D8CcOMQ@mail.gmail.com>
Subject: Re: Error code handling by GPIO subsystem for PIN_CONFIG_PERSIST_STATE
 config
To:     LakshmiPraveen Kopparthi <LakshmiPraveen.Kopparthi@microchip.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        LinusWalleij <linus.walleij@linaro.org>,
        Kumaravel Thiagarajan - I21417 
        <Kumaravel.Thiagarajan@microchip.com>,
        Sundararaman Hariharaputran - I21286 
        <Sundararaman.H@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 3, 2021 at 8:32 AM LakshmiPraveen Kopparthi
<LakshmiPraveen.Kopparthi@microchip.com> wrote:
>
> Hello GPIO Maintainers,
>
> I am writing a GPIO device driver for one of our PCIe based
> devices.While addressing the warnings and errors reported by checkpatch
> script, I ran into an problem while fixing this.

The problem is that you started fixing the symptoms, not a cause. The
cause is... checkpatch itself. Please, fix it instead (The warning
should be rewritten to be not so frightening).

-- 
With Best Regards,
Andy Shevchenko
