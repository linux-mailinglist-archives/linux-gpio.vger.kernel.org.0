Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 913DB87AAF
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2019 14:58:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbfHIM6X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Aug 2019 08:58:23 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44758 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbfHIM6X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Aug 2019 08:58:23 -0400
Received: by mail-lj1-f196.google.com with SMTP id k18so91977470ljc.11
        for <linux-gpio@vger.kernel.org>; Fri, 09 Aug 2019 05:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XwaWKZDSHe1I80bisXSNJIWzL8wl2xq2VTsncPVHBWc=;
        b=jejH5IZKgO83L1vJddIFvE9i0jmZSe4vpPmRc28zRlTdvQPaHp/r1WjenaYnE9aZbQ
         oY+1K/cThpLcCQfio569wohtcIhS9ouwM+Ci3hxdnvo3W6JDvDpDSEdJll77TLzEfJFB
         OuBSKDozxOk5Yk6mG+ULAfYmfnJRwwYRutWncwjC3S5Xi6g6E9ExAWK2fSeDxToe69MA
         Drq3C1+DESnptqE5nMLNN/miYSZrZtk6TvyU5Ibq9KEow9LxsGc55sVXTyZS1G2p6223
         AfErguYqVQXbdxxgYgyhGtYvl/abP8eL/ziP30KVbYs4maLMD6uTuOl6FI9kUqg6HJ/y
         K7oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XwaWKZDSHe1I80bisXSNJIWzL8wl2xq2VTsncPVHBWc=;
        b=Jb0ahxw0mPHs+cENhz9Jiof0qvmszOvLBdN/BFQlNZTKRg9jH1G6pMoMAlT0T9vedc
         EMsNT2Fmtlvu205ZzpfbBydeHiHZxULPFbd6mLfeZpZdNh2B420agYLEsoFKPn5Bbx0N
         +ikTGyoRyckrwhgEgjEbgv1EbG9ZscWllGbiKjKrarsdhJC8qM/Kn2idlSNOZqjXrtYF
         kP+H/XOqZ0nCDTQqngxtocRLXpSvAQHjEN3fOsSxzTw4R1DLhpiZr27HulbyocNnaYdo
         pXAdI4hbxcrSSPouu2HRKgNTkVwwZt7/xds0n48TgTb2C0x7TX7+xwXexHGLuvkKCZr2
         AvKQ==
X-Gm-Message-State: APjAAAX8N/59X1gPavuc0glrCBwVIUIxj4x3jrlz8iatZZYfGDPPfLaP
        YKMWaZRDHLXuLhBgkXH6tWntOpa1wuz0U1BhMVkc6aZATog=
X-Google-Smtp-Source: APXvYqwZHxPel8iWoW+RfFZDeMlpptWObrR53+YONbLN3cqDPVU/TMo1+HinN4DN4snd6v6pZVfqihGTcgZDp1cnLag=
X-Received: by 2002:a2e:9048:: with SMTP id n8mr11337170ljg.37.1565355501575;
 Fri, 09 Aug 2019 05:58:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190808132128.13359-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20190808132128.13359-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 9 Aug 2019 14:58:10 +0200
Message-ID: <CACRpkdZKv3w7yGNWrE7WvWLd9tw=3at9EPyOQRruqE=Frym8bA@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: intel: Allow to request locked pads
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 8, 2019 at 3:21 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Some firmwares would like to protect pads from being modified by OS
> and at the same time provide them to OS as a resource. So, the driver
> in such circumstances may request pad and may not change its state.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> in v2:
> - amended comment in intel_pad_locked() respectively to the change (Mika)
> - described enum values (Linus)
> - lowered case for locking flavour in debugfs for better looking
>  drivers/pinctrl/intel/pinctrl-intel.c | 67 ++++++++++++++++++++-------
>  1 file changed, 50 insertions(+), 17 deletions(-)

Mika pointed out some typos or so, apart from that:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
