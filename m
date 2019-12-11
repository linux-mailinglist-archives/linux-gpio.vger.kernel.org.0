Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F3B211A673
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 10:08:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728030AbfLKJH7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 04:07:59 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:36698 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725973AbfLKJH7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2019 04:07:59 -0500
Received: by mail-qk1-f193.google.com with SMTP id a203so8913176qkc.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Dec 2019 01:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+1+2OzonF8JaI5zb2TCQGTWjY1hWFqWalCfMdztL7bw=;
        b=S60wH1RHuXQ8mOnPL0RhPKzQIGXltV0Cv9h00AH+VYro56n5frUBSr4jG3994daVvT
         V+vThx0M+M5TKEPRP7rKgYkWR9SLOxLfctebgbS4/teJyPdNqlqYK9Sqae4OYe3pOZfj
         RbOKuXYBl+rwcuW9scJiI3DZUILjSRdRChb2cUjEMEG/J6gALdSSdCrSN73Zs+Oaq7Ld
         ncsVZLJRCCbXDi37Bkc0aQABg2eiqLVtoela5xrLAMI6eSLhlktSHK/xO5UF2xLQLYer
         yMxhiSsTvhVSoG04ZT4mwPZHx/2a+Y7mdi6v2EwwgKDOC/A2904us+0B2fJX/ZY9l4Bm
         hO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+1+2OzonF8JaI5zb2TCQGTWjY1hWFqWalCfMdztL7bw=;
        b=hbbH/LvTPt70kFWoCIRP3PuUlr9GRIHENexL3x1/EKZkMpPiK6G+ddBnJJPksXRKTg
         CiWDAdU2ZkjBndSNj3s+sRduyEwlrkz4l3YByt2jcInb3R3/HsvV+PmJFSMAW41fAOUo
         7ZOHX6CwWxjcqu6wqazKLdS0BCrdc0QVxjyv9vfstkNOUXZsQXdqfqCXcKv+Qy6O1gx7
         W6OcKbHJOEEYxvtcaeGM8Phey1UL+YHNlrya/4biDkXrABeIF9UC/iHEXaQp1NxXNLmq
         KqtgkhJSIFK2R2Zw0/nTc+LScxvdIf94csY8gUgDM+UPxEGAxlmNko8S+laKnPc6zzq0
         ly4w==
X-Gm-Message-State: APjAAAX1sF9fPTNISkAfybby8e4BKIDWpgshU/QkY9Y7qyeeCc/5HvJf
        PM6//VTH4OqHSPxyY3haj15MwWrAY4U2temPwycQQg==
X-Google-Smtp-Source: APXvYqxo51nvYaIkggIMq8ITtXp9gbKNulM8Wmtc5DRGjuFLLqvLJhg/1ssY8su+0/x7Vipo/ClbnBGeVsB5uoQ3mKs=
X-Received: by 2002:a37:6255:: with SMTP id w82mr1919216qkb.330.1576055278589;
 Wed, 11 Dec 2019 01:07:58 -0800 (PST)
MIME-Version: 1.0
References: <20191210202842.2546758-1-arnd@arndb.de> <f6a514d1-44cb-4577-af07-fd2f3fefc974@www.fastmail.com>
In-Reply-To: <f6a514d1-44cb-4577-af07-fd2f3fefc974@www.fastmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 11 Dec 2019 10:07:47 +0100
Message-ID: <CAMpxmJUD8A1qtmZmOxAq3XojFG5LHu_DS94LC7orinz_O9zY=A@mail.gmail.com>
Subject: Re: [PATCH] gpio: aspeed: avoid return type warning
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Joel Stanley <joel@jms.id.au>,
        Hongwei Zhang <hongweiz@ami.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 10 gru 2019 o 23:10 Andrew Jeffery <andrew@aj.id.au> napisa=C5=82(a):
>
>
>
> On Wed, 11 Dec 2019, at 06:58, Arnd Bergmann wrote:
> > gcc has a hard time tracking whether BUG_ON(1) ends
> > execution or not:
> >
> > drivers/gpio/gpio-aspeed-sgpio.c: In function 'bank_reg':
> > drivers/gpio/gpio-aspeed-sgpio.c:112:1: error: control reaches end of
> > non-void function [-Werror=3Dreturn-type]
> >
> > Use the simpler BUG() that gcc knows cannot continue.
> >
> > Fixes: f8b410e3695a ("gpio: aspeed-sgpio: Rename and add Kconfig/Makefi=
le")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Acked-by: Andrew Jeffery <andrew@aj.id.au>

Applied for fixes.

Bartosz
