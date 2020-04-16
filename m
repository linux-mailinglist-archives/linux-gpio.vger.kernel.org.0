Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BF801ACA62
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 17:34:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442577AbgDPPeG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 11:34:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2898232AbgDPNk6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Apr 2020 09:40:58 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2AEDC061A0C;
        Thu, 16 Apr 2020 06:40:57 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id f8so5574259lfe.12;
        Thu, 16 Apr 2020 06:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZLzws5i5Y18vpPpWQKpd4tf4rrBI/U3CKui/Sn/uhyY=;
        b=XECzl8bnoYHa7JBihaNpNho0X+TXnG6VeYsCQPhuEXHf9Iehd/9SIW1/J9mcuEEe0b
         WRwVX/i41aBzEhsORfM4ZC2TbVxNVMolHRAjUfke0s+RGZmitBw/DnJUZHiKqHqmrYT9
         I9LXFKpBWBqhTZZXXair5qVTLlU/jJbsjPoWIwsJBBo0mTlFrj9HgsYRzAG31YSPElY4
         QhYDKuMQA7falqvgwPR4X+Mt7f/W7ZeP/+/HYIh3CRJ+JsZlwpc6xEeVn3/TGziToDl9
         VblLgngigFTr2b8o136x/G69URCT7TQHa/jhmCrUF857d5kXKZ74Z1HEVMSgcSz3RKnR
         Ss3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZLzws5i5Y18vpPpWQKpd4tf4rrBI/U3CKui/Sn/uhyY=;
        b=NbGit8VHchrgxfyZz/SMcGF8EXrjpZ/Fmr7frzB973H/WfmaPkkAXbxvGNS9htcR0/
         L74iv6RJYfzNlyp9UimvTdUPvgTkOurxlmHFmR6DLGrMdDUv+llFXYj/ZOGVwYnhiIbg
         aoCxr7sdIjQX+RZgnpWhwzp33fwaz/mKESkeIIzrih6K7ZE3MJj5S4+3YhC+NvieCrhs
         15dBvWKJUq07oU2BgcE3cOD9+LRYCokG1/yICMgZwHZm2orN4Bt8oBr69cJsjfL5oFiS
         +Nvr5rn1DMOuYRbOKNfo417tsSsmp3/RhPYVndqjlOMOeEU8dgLQDtRzsBpbrH+c/Hgk
         dDWQ==
X-Gm-Message-State: AGi0PubpMTX1O6rsMQFWR2Ide2kVGp1Poe7NKgrycDPIVwF1BGVUQhXd
        atm2nfOuI1P1nMBRO/fQpCSrZamP3wKrNCQv5iA=
X-Google-Smtp-Source: APiQypIWud1D1EiOfs9YtVdVtAQk8rF/e+TJLy4nQSWV2/scuMvXiD9YGPWzt7VIZM5qqDNDgcds4hTD9Rab+a60/+0=
X-Received: by 2002:a19:88a:: with SMTP id 132mr6153501lfi.130.1587044456209;
 Thu, 16 Apr 2020 06:40:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200414152843.32129-1-pthomas8589@gmail.com> <CACRpkdaPc-rxNmdq7KFKZ-Qi7Tqy2RJ5Lkcv-8bTAh0GX7VygQ@mail.gmail.com>
 <CAMpxmJWZEhKho0+6zf=Ca8tif=Z7PcdNv2=tAsDnOUzeZLYqLg@mail.gmail.com>
In-Reply-To: <CAMpxmJWZEhKho0+6zf=Ca8tif=Z7PcdNv2=tAsDnOUzeZLYqLg@mail.gmail.com>
From:   Paul Thomas <pthomas8589@gmail.com>
Date:   Thu, 16 Apr 2020 09:40:44 -0400
Message-ID: <CAD56B7ezM5ewaFySr8zeybHvkLmLpcZQzMgYUnVNEvdJnvgGZw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: gpio-pca953x, Add get_multiple function
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 16, 2020 at 9:21 AM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> czw., 16 kwi 2020 o 13:22 Linus Walleij <linus.walleij@linaro.org> napisa=
=C5=82(a):
> >
> > On Tue, Apr 14, 2020 at 5:30 PM Paul Thomas <pthomas8589@gmail.com> wro=
te:
> >
> > > Implement a get_multiple function for gpio-pca953x. If a driver
> > > leaves get_multiple unimplemented then gpio_chip_get_multiple()
> > > in gpiolib.c takes care of it by calling chip->get() as needed.
> > > For i2c chips this is very inefficient. For example if you do an
> > > 8-bit read then instead of a single i2c transaction there are
> > > 8 transactions reading the same byte!
> > >
> > > This has been tested with max7312 chips on a 5.2 kernel.
> > >
> > > Signed-off-by: Paul Thomas <pthomas8589@gmail.com>
> > > ---
> > >  changes from v1: rebased to 5.7-rc1
> >
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Since I know Bartosz is queueing other patches for this driver I
> > let him pick it up.
> >
> > Yours,
> > Linus Walleij
>
> Patch applied. I removed the last line of the commit message since I
> guess you did test it on v5.7-rc1 after all?
I applied the patch and compiled the kernel, but I didn't test on our
embedded board with the actual max7312 chips, that board has a whole
series of special commits.

-Paul

>
> Bart
