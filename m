Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD177476874
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Dec 2021 04:07:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230484AbhLPDHY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Dec 2021 22:07:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230237AbhLPDHY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Dec 2021 22:07:24 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ED7EC06173E
        for <linux-gpio@vger.kernel.org>; Wed, 15 Dec 2021 19:07:24 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id m6so34529473oim.2
        for <linux-gpio@vger.kernel.org>; Wed, 15 Dec 2021 19:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NejVyBoDRKTUQRXdaYR9tb6ltwN/AStdGjjkwn7Uk+s=;
        b=g1TkbmDI6gWDQloHqmRvrNzoPup+e9nPlXTQlcH3FHLl0wYvsDFEb+ZCSaKPIKjfsf
         sJZaqNXFMA4jwNod8u4R0l7ssP/b1T74+HUBguxOb9TVRjoqPx19+YBqrHyblm0NCbvj
         i207pxhYDX+RxDOnX4DQqbeQl+XtyJ0EjOAQP+mXroVqQGRM9wF3HfPCdj/QSsfpIY7r
         4ClrTaYkzcj0cMCOvzH0ZFlXQLKoHFTEnpv93YqDwXnv6stNmgWDxVzz7DrpBaVFxwbA
         hQjiTqsIBcn1CtDw2ra4dnGmKJ3h1HjfFd6E5oufWDyDQslDfgOaS+jyGlAHm21yUv0V
         97LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NejVyBoDRKTUQRXdaYR9tb6ltwN/AStdGjjkwn7Uk+s=;
        b=wQFGJGyw4A1OROWxYv6kr8zp2611eGWN50wpQESfhRrS19eVwphlTPcR/RA1r6DjNs
         mbbLv5FENny7eSXt3qbhf361ri2ZwOJXJNhNE97oGPjJOJbcA00U4OycjSrPVayjzUHR
         YvgNs0qwAtbWrqBNYSqyZj2RHOdWIQGkxymZug4xVKS/nQFgZgS6wEdsjBzfnkoR5kMU
         8S600+SPJgHlI9gB31s/t2ZBJNBqgzR/ADgP9AHTmxL1I/LU/X7+HnTZ+LD74HL4FkEo
         GMq7XtoiBa4N22PCXaLYswqTgjEthKdiF1OAt3Ss2UFK2z1rJhpi7Jl9gZU7K3IHy3H+
         DT7Q==
X-Gm-Message-State: AOAM530+EYBbTZiFbBWwFZrdlQc/vuFpeZziHwwXANR/OtT6ceCgkTvT
        w7p5dq0RpiU08JGUqR4h6OtBPMvzRhfSgQS+7SlqlzMPdiY=
X-Google-Smtp-Source: ABdhPJyFv/0gs+gd1B7jD6sYmT25ancZcI2AisMb3GlzN5/ccXwB1QAb+QehAyr2L7NYhy8E6V8IB/cXvagiRXpPicY=
X-Received: by 2002:aca:120f:: with SMTP id 15mr2584692ois.132.1639624043631;
 Wed, 15 Dec 2021 19:07:23 -0800 (PST)
MIME-Version: 1.0
References: <20211215174821.21668-1-zajec5@gmail.com>
In-Reply-To: <20211215174821.21668-1-zajec5@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Dec 2021 04:07:12 +0100
Message-ID: <CACRpkdarh1N+NwYgDR31T=eESF20AgWJd=PTyv321jTdpH8PsA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: add one more "const" for generic function groups
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 15, 2021 at 6:48 PM Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> =
wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> Generic code doesn't modify those strings and .get_function_groups
> callback has that extra "const" as well. This allows more flexibility in
> GENERIC_PINMUX_FUNCTIONS users.
>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

I really like const-correctness and I'm a fan of this patch.

It seems some users need to be modified as well though,
the test robot is unhappy.

Yours,
Linus Walleij
