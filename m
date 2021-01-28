Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3A5A30738D
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Jan 2021 11:21:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231468AbhA1KUc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Jan 2021 05:20:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231467AbhA1KU3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Jan 2021 05:20:29 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6712FC061573;
        Thu, 28 Jan 2021 02:19:47 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id 190so3847385wmz.0;
        Thu, 28 Jan 2021 02:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=RCvbfOIW3W6+aeDvZc0GOFXEO64imNVS6UzVUBooVvA=;
        b=gDH+qqevZvp+YOTzuVNfH/WWzmLLtKA02Ef0OixWBJS9dL8ZayTkiDoP5o2D9f2EP6
         cCPLwlEc7wJZmlWzuc3XUxB8WXh5Tyv2IxBPDbWY1mzr8bCJU3VEweBkLnmyX4oN0J9E
         77szUfS9PU51+nZlO/74WZBGMtxogZAsG/oY+Lo4uHcqV9QOAWOs/Zve+L2jY6/CQAcd
         gyMxKtw402tBi3+vbnaF3BqeobtyK2dHfnyzApou2RAbzSBmulmM8pqpyJ9uxwD0lfxa
         iHaI3sdKDycgkHYebIXRCnt/W5ACJmHCfEVm34AQ/nqyYEjKzfCQgoCSEhr5q8KdviR8
         gcMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=RCvbfOIW3W6+aeDvZc0GOFXEO64imNVS6UzVUBooVvA=;
        b=gX+3cItMRFUV30RP6M2JDAf7G/iXyRl+jAoHlH7vni5DRkTrB1z4fOQ4+DDpLe90xf
         IbDTGLrmZcK6ZFCR2QmP1kD7kjwLh+kppG9qmRsh4ubZ7FjN1IBTUPW0SuSWWIkmo/5K
         2BYCkpYHJ3W9UgT3bRzaS/t4gUy+C6yybMX27SQdPSQ4qNlGeZNYkXFFmpbVXzfdtKzE
         TQGa79G18Btw9TGw2tFufA7PZqfu2dfHXqjiAEohATcTJpbqvhGmM4paZL6TRCO1uguW
         ugJoHA411VzXdXdk3+ICYY1eS/5BOa60QkpIquieWH79cO2WM5TMtUWXZXfYiCPRKGLU
         NNVQ==
X-Gm-Message-State: AOAM533VqT2Ir5WEnBGk4UevnxeH7gs3O6bC8ZwaEGHC+N+HrsdtI+/N
        W9y99jnF3HS4km+8nAozznyTa+6CRCg=
X-Google-Smtp-Source: ABdhPJya78+1iHpwjhDOcKpysAKfE75nsJFoAa7lIRekMjsv0tA0yHfR22bgt11xuP25wrph+IQz/Q==
X-Received: by 2002:a05:600c:21c1:: with SMTP id x1mr8365797wmj.48.1611829186171;
        Thu, 28 Jan 2021 02:19:46 -0800 (PST)
Received: from [192.168.1.21] ([195.245.17.255])
        by smtp.gmail.com with ESMTPSA id e11sm6275009wrx.14.2021.01.28.02.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 02:19:45 -0800 (PST)
Message-ID: <7b932babfe5ad5756eed70effe32bdc03b901d84.camel@gmail.com>
Subject: Re: [PATCH v2 0/9] gpio: ep93xx: fixes series patch
From:   Alexander Sverdlin <alexander.sverdlin@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Date:   Thu, 28 Jan 2021 11:19:44 +0100
In-Reply-To: <CACRpkdYPYua-NuxVC7aBxJtLYFEECL-60jr4pYgK4=fd5Mb-6g@mail.gmail.com>
References: <20201228150052.2633-1-nikita.shubin@maquefel.me>
         <20210127104617.1173-1-nikita.shubin@maquefel.me>
         <CACRpkdYPYua-NuxVC7aBxJtLYFEECL-60jr4pYgK4=fd5Mb-6g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Linus,

On Wed, 2021-01-27 at 22:54 +0100, Linus Walleij wrote:
> > Series of patches to fix ep93xx gpio driver to make IRQ's working.
> > 
> > The following are fix patches (these are enough to get gpio-ep93xx
> > working with modern kernel):
> 
> I see that there is a strange level of attention to patches to this
> platform!
> 
> Since you fix all my mistakes made in converting this driver
> in the past I will just say:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> For all of them.
> 
> There are some nitpicks from the reviewers to fix up but
> overall this looks very very good.

as we don't have a dedicated EP93xx tree, would you like to take
the series in one of your trees?

-- 
Alexander Sverdlin.


