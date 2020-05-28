Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7874D1E5AED
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2020 10:38:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727061AbgE1IiD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 May 2020 04:38:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726955AbgE1IiC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 May 2020 04:38:02 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A546DC05BD1E;
        Thu, 28 May 2020 01:38:01 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id n15so2824379pjt.4;
        Thu, 28 May 2020 01:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3FeLF9C4KrWkMchJbnEzZmVQQSmBZVMkSMWSfHFIMoo=;
        b=X6foASzdCTwtc31HmvAT1LCYr1zbPvHeYlZBvlvVamztFkyV++dAqD4EoUMJIpvmu/
         BubIg4ZM+eGNQOTOf8oJGG4ReUja2Iuuf9Y012KgU6voe7AU9fq9JO44C28cD98hxaiF
         YSahDZ4NYSMgFvexgo9ZS0IUfROUfPlOWmdjrHY03kQMyqV9BlRL9Bfl8zMuCy2rNW8L
         waHelqvvUuqaGdAJvdhiVmHgh9JaxR8Y5F8tNSt27QfbMOuEhP+dUBm/OQ94L309pUyl
         iePoqHxCEXkvWWA/1ffx99FiLmPYUWUQz5DEs16IYjg9xiiXKEjJuO8But8iGris04+j
         r7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3FeLF9C4KrWkMchJbnEzZmVQQSmBZVMkSMWSfHFIMoo=;
        b=fVCbXHvX/YKEvkrvFh33tV5cwyjKnW9iEdhoCpDFVlqppz+6N27OKCoTd8aqhdoykx
         l7/RmLtoNa4K6EhmWmow1+Eyc+NsDZBuvPiYoc47KkY2gQHrEVHaj0KdhdbPYVH9jYZb
         UJBWpLuLykkIL0hQXdvdjWf4r8TDXlh6ze1tEQTyCOnt0vpTQvdO8+XwetvK+nxNJOTm
         eRX1MRhtzy7h90CM3x9tkEQJIxrt6uCjtpYZpSywBIinNSYNgRWQnE8x2IVd/WX2ZsIV
         TNbAnXgrQzTm53CrKndURMUltq+gRrWoBvtWSClhgh6pyXer7FvzK6dE8xZdnUqef9y6
         lSDQ==
X-Gm-Message-State: AOAM531WK8jTE4FHGfSpZvpHqc0DACrtZzCIv2S1qcFob2GsS/tfivZ1
        F6O9a4detBy0XxTAPAWc4yeSqSgN7X9Wf0zGfGU=
X-Google-Smtp-Source: ABdhPJxUeGRUtaopPBCGbuHZA+j7iUZdoj7kYiqqCQGTb+RDEzEKRMsQbLc2m7fremZ0Lg+xUPDCWf/Pzcqgo8wEsfM=
X-Received: by 2002:a17:902:d68e:: with SMTP id v14mr2413312ply.262.1590655081175;
 Thu, 28 May 2020 01:38:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200525160741.21729-1-michael@walle.cc> <20200525160741.21729-3-michael@walle.cc>
 <d245b4f5-065f-4c82-ef8e-d906b363fdcf@linux.intel.com> <6d08ebbfbc9f656cb5650ede988cf36d@walle.cc>
 <fe44039a-4fa9-dab3-cd14-04967b729158@linux.intel.com> <143ec2f44c881706db9744465328329f@walle.cc>
In-Reply-To: <143ec2f44c881706db9744465328329f@walle.cc>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 28 May 2020 11:37:49 +0300
Message-ID: <CAHp75Vf7XxNFJMSOr6SzKHm0tssEVKzokaEeZ8nts5xQ2hQLNA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] gpio: add a reusable generic gpio_chip using regmap
To:     Michael Walle <michael@walle.cc>
Cc:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Brown <broonie@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 28, 2020 at 7:11 AM Michael Walle <michael@walle.cc> wrote:
> Am 2020-05-28 02:31, schrieb Pierre-Louis Bossart:


> I've send a v5 with that fix and your names property.

Did you already? Because I have a question why we have gpio-regmap.h
instead of gpio/regmap.h ?

-- 
With Best Regards,
Andy Shevchenko
