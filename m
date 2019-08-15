Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B890F8E4D8
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Aug 2019 08:16:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730405AbfHOGP4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Aug 2019 02:15:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:59538 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725681AbfHOGP4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 15 Aug 2019 02:15:56 -0400
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9CB582084D;
        Thu, 15 Aug 2019 06:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565849756;
        bh=UdS63mi586+/lEO9WpbHVnhGDiXc8WFsWXVUrVKqli4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=hyUFe4azQclyComi59PT8+Kby66Jv3PaMtN63HzWTHy4EWA/UfsV8YRNa/xUj0GL9
         1Bv68TTO26hdiNLdjYc74BncODUUcEeIMYPjzmXh0LS8HLH+/XHsaIMqbKY0/+FWUf
         QN30HeTeemMFAYLF+kh3XrtRPAhhPe+uOJrphYDc=
Received: by mail-lj1-f182.google.com with SMTP id z17so1329470ljz.0;
        Wed, 14 Aug 2019 23:15:55 -0700 (PDT)
X-Gm-Message-State: APjAAAUeVc8VMZ7hQJuS/0pvZBkKI79/GOq7m3UTTFqjCzVeek6mCIle
        +FvP3aSiSHVZxCbeSjVkuKILOXDiSfqmdtUTkYQ=
X-Google-Smtp-Source: APXvYqymA0m6g6FYEkt+jvTS/lHA6LXkadvpzAJfqn2n+NzLPIJ0NX5IscY500yE+VMSEdPLNeQTT4pSQY1UMVm/F7Q=
X-Received: by 2002:a2e:7818:: with SMTP id t24mr298678ljc.210.1565849753812;
 Wed, 14 Aug 2019 23:15:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190815060914.3572-1-nishkadg.linux@gmail.com>
In-Reply-To: <20190815060914.3572-1-nishkadg.linux@gmail.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Thu, 15 Aug 2019 08:15:42 +0200
X-Gmail-Original-Message-ID: <CAJKOXPfxV9SZrjpQ1=fRcRrkE_4vYRMKPzr3+GJ6cyktZeZtYw@mail.gmail.com>
Message-ID: <CAJKOXPfxV9SZrjpQ1=fRcRrkE_4vYRMKPzr3+GJ6cyktZeZtYw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: samsung: samsung: Add of_node_put() before return
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>, linus.walleij@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 15 Aug 2019 at 08:09, Nishka Dasgupta <nishkadg.linux@gmail.com> wrote:
>
> Each iteration of for_each_child_of_node puts the previous node, but in
> the case of a return from the middle of the loop, there is no put, thus
> causing a memory leak. Hence add an of_node_put before the return in
> three places.
> Issue found with Coccinelle.
>
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---
>  drivers/pinctrl/samsung/pinctrl-samsung.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

This is already fixed. You can base your patches on top of linux-next
to avoid duplicating effort.

Best regards,
Krzysztof
