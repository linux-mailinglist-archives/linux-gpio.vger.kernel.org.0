Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C47E7AB10
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2019 16:32:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729634AbfG3OcA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jul 2019 10:32:00 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:28192 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728527AbfG3OcA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jul 2019 10:32:00 -0400
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id x6UEVpvt032128;
        Tue, 30 Jul 2019 23:31:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x6UEVpvt032128
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1564497113;
        bh=cZjjC9PP1LqBq8GA5ZyQIzvHoACB+pU5O0RNljsPvx4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=KoVxUkf1EdZ9MqFTZkaTokxjng34PHmVCasjO8hzTEPOLv8n2S5GDpIaiuuVv2Og8
         MyOkCclmYz7SqqI6PZITfqsdc0ABn0QOgTbvV90KobFUOoMUL2gLR/41KLkYzIpZaJ
         5NLQsm6JLqE3uQsb73cTIUmVm0qtkWNaKPYPyRY+IAMguRTHXoh62wP40rGcAKu5YE
         6dKBziLthX5Dsh6HsvUhVrx7NRHwHQTZ+H3dFDlqbwo4LleK9/LBxacsS37KEIjuhR
         QVRiGgHclk1GQsKQfuXqtwSnqq/8F8OCpHWqobae9b3Fi6RXN8l0plGdTwdEEwsK3A
         McVrja3FREifA==
X-Nifty-SrcIP: [209.85.217.41]
Received: by mail-vs1-f41.google.com with SMTP id r3so43584026vsr.13;
        Tue, 30 Jul 2019 07:31:52 -0700 (PDT)
X-Gm-Message-State: APjAAAWHhF4dFFGWATcZGDNSlbbQSgI3kyMFf8EU/JMfqHo9Hpp4xKgU
        Ke2uz23m3I/C//sNb47dPUY8nLZLuN5nJ4crD7U=
X-Google-Smtp-Source: APXvYqzzMjiYis6ulKJOaFvw4iNNbc6SgmW0tRSjbeem8L4rYZQnOGWU+h/jR5zfUjSp3CfUodjMbZzMk4in6+qlTt0=
X-Received: by 2002:a67:fc45:: with SMTP id p5mr11106683vsq.179.1564497111451;
 Tue, 30 Jul 2019 07:31:51 -0700 (PDT)
MIME-Version: 1.0
References: <1564465410-9165-1-git-send-email-hayashi.kunihiko@socionext.com> <1564465410-9165-5-git-send-email-hayashi.kunihiko@socionext.com>
In-Reply-To: <1564465410-9165-5-git-send-email-hayashi.kunihiko@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Tue, 30 Jul 2019 23:31:15 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQZNu_R_noC=P=oe_NVewAS-LeVhmuDNT=TQJApRCtgEw@mail.gmail.com>
Message-ID: <CAK7LNAQZNu_R_noC=P=oe_NVewAS-LeVhmuDNT=TQJApRCtgEw@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] pinctrl: uniphier: Add Pro5 PCIe pin-mux settings
To:     Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 30, 2019 at 2:44 PM Kunihiko Hayashi
<hayashi.kunihiko@socionext.com> wrote:
>
> Pro5 PCIe interface uses the following pins:
>     XPERST, XPEWAKE, XPECLKRQ
>
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> ---

Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>



-- 
Best Regards
Masahiro Yamada
