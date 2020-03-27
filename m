Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F64F195848
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2020 14:47:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727185AbgC0NrN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Mar 2020 09:47:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:57004 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726275AbgC0NrN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 27 Mar 2020 09:47:13 -0400
Received: from coco.lan (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CDAD8207FF;
        Fri, 27 Mar 2020 13:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585316832;
        bh=7Pepu9uT9jkfT1u0Lw+gmVZkqKbmxOrp/H5fM5L/zww=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=r6jUV25hxb/sEpYPoqpJU1QKNzNxsiNj7D3JzeqbhGADUSCqB0TdMOv/B0ej8NnKt
         8ShhDGrgzq2OzTXESqv5ic0ArU0UYXJimhf90bFpyTOWFd+yxw1BZ8equJV8WA0nz6
         9BsPMjcC2cuum+Ix9ZoMEiSu1aq8DXrK5eOhZM30=
Date:   Fri, 27 Mar 2020 14:47:07 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 12/17] gpio: gpiolib.c: fix a doc warning
Message-ID: <20200327144707.3367e97d@coco.lan>
In-Reply-To: <CACRpkdYrL02YHn5dPnh_Oz0Ysm5BxHrwQgwNMtsD55XGid_hCQ@mail.gmail.com>
References: <cover.1584456635.git.mchehab+huawei@kernel.org>
        <51197e3568f073e22c280f0584bfa20b44436708.1584456635.git.mchehab+huawei@kernel.org>
        <CACRpkdYrL02YHn5dPnh_Oz0Ysm5BxHrwQgwNMtsD55XGid_hCQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Em Fri, 27 Mar 2020 11:22:52 +0100
Linus Walleij <linus.walleij@linaro.org> escreveu:

> On Tue, Mar 17, 2020 at 3:54 PM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> 
> > Use a different markup for the ERR_PTR, as %FOO doesn't work
> > if there are parenthesis. So, use, instead:
> >
> >         ``ERR_PTR(-EINVAL)``
> >
> > This fixes the following warning:
> >
> >         ./drivers/gpio/gpiolib.c:139: WARNING: Inline literal start-string without end-string.
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Mauro are you merging this or do you want me to merge it?

Feel free to merge it.

My plan is to rebase my trees after the merge window, re-sending
anything that got missed for them to be either applied directly
or via the docs tree.

Thanks,
Mauro
