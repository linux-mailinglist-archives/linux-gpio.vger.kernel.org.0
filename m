Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8AFC2E974E
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jan 2021 15:32:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbhADOcA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jan 2021 09:32:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726029AbhADOcA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jan 2021 09:32:00 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85A8DC061574
        for <linux-gpio@vger.kernel.org>; Mon,  4 Jan 2021 06:31:19 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id x20so64705617lfe.12
        for <linux-gpio@vger.kernel.org>; Mon, 04 Jan 2021 06:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IR1VvMQVXulY7X8akWcW+oqvfmM4zhhR97+Zp8aioFY=;
        b=eufqnLs2z/BQYLh46GNs8McsAJk5HT0ZMS3p2hrfqwiTeZZ3lavxWchIYfwQsRtG2W
         zXII0oJAUqiki1xNyQnzbiyW8ww8VvvWo/zywg0P1gq+ustAe9qIplSHJIaxRwDBaEJK
         GG5uK08PvIe+EPh0UueOPNViz6WdQdzq7cjnUzrq/m5av0MaEE2HYfwXjDnOJFgAcn/i
         sMj/SZah7QT4LNgKu3yJvHXXaC0ATUW3KSkelL66AgBKbhkr3lHACsBNsIw1rtsEA481
         jzx4ylPz1shZ9QqwAjNh5CZTYBU+5yFPXlQJ/b2CGu42eSFgclbBRC8nUIHPHuMfrjfV
         hzSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IR1VvMQVXulY7X8akWcW+oqvfmM4zhhR97+Zp8aioFY=;
        b=ljxWf6WpBfN1PcTflCKLJP0gl+2AGi2mScETC+PONIbbDi9i2WeBSnwps+4olaNn3c
         wzdcMqofmbRnNZsnxtslHsQigmig/jdxCgOz6a1sIrckaKoFh4nx8aAKMNDGiiW4sg6G
         yczL8jQuzT9ePMCAF+9MIlxbSi1M2kG35ahTYu/4Gvdcq1FzpQPn+Oil29Gdm2wMq1/C
         3ZpzLsvJp7QJm3VDfDxCujwvIvST8QvCR8YdE4jXz7ahGKfRYBpm4tVidzgKjtU+09XM
         5RLSfPB1kO1ntnJYiKb0xE9Z5NyP+5Ts6oEU2ARRDAVzcG5199r38JxCDprSoQi876fo
         JV9A==
X-Gm-Message-State: AOAM533Q+b82yVGzZ7hrViTQhYAiC1FPzmP3No+xojw1/1whCEgbDCx6
        m+QlVq2jiJ2P0wAi2d6/emWcDx9o+Oi7lGIfQQMyig==
X-Google-Smtp-Source: ABdhPJzaB6PWbOcTECg7R/YOflEqN1JdBUJvlXBMvsyUZ80Txi5rKRW5E1cp3lxTTGfxWLs8QPY+zi2TQ4ond5CrNOk=
X-Received: by 2002:a05:6512:3238:: with SMTP id f24mr31491797lfe.29.1609770678082;
 Mon, 04 Jan 2021 06:31:18 -0800 (PST)
MIME-Version: 1.0
References: <20201211084801.2425-1-zhengyongjun3@huawei.com>
In-Reply-To: <20201211084801.2425-1-zhengyongjun3@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Jan 2021 15:31:07 +0100
Message-ID: <CACRpkdaQ0kOWdtuKT2r0Am_-b8esA0nXPX2oa=wW762beggBCA@mail.gmail.com>
Subject: Re: [PATCH -next] mediatek/pinctrl-moore: convert comma to semicolon
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 11, 2020 at 9:47 AM Zheng Yongjun <zhengyongjun3@huawei.com> wrote:

> Replace a comma between expression statements by a semicolon.
>
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>

Patch applied.

Yours,
Linus Walleij
