Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 921AC66BE07
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jan 2023 13:43:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230369AbjAPMnj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Jan 2023 07:43:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230365AbjAPMni (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2023 07:43:38 -0500
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32E331E29B
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 04:43:37 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id c124so30077720ybb.13
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 04:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bzAXwdCvDxq2ZXNmGsdcs5ULG6ySxlBGhBK+Q84iWyc=;
        b=z429dc8HTSxSpP83/Qvm8uHIwVOjUxW+fB3mUGvLwV7TDdHjjp5oZmDcHqKCuGx3rg
         HL/QvYIf9C2va1HJ+tXJ9BFWFytG6LZRHpd2yqYSSUqbvWzX+OaniGDqRYr4yPeJAhUb
         NzGHYw5tDuLWgXvZntzWDQ603DCyNowwAYQV1MHA8TGybyn2CiFV2t3zDLe7GozgxwbS
         cQl23omTkC15QGGvX29CHZvT79o24NreIe9YBmanerG3LxwnIjo8JpIeCwW8uw1BbP/J
         oQBhWD3vNF0Cd58k01fdckG5P3DvCwx0zEVMp7tEd0Lz45k8FYZJLEtfTatwlEc+xHA/
         C1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bzAXwdCvDxq2ZXNmGsdcs5ULG6ySxlBGhBK+Q84iWyc=;
        b=jykbI4r7PyKVPBHrhgxYk0H4JVQ8G81nBcHOgbNgS7o+JfsxUNlL5CI/tjROb3Toxg
         tN8zTI3MZ24GkRxYSHRbQaWEG5dqidpcTYQernBzy9F1p0uo4tZkiTL4QLciAbSHQugI
         ljz/635G7h5GBxhVgdV+UnjIa2vP9QKjb1IlDz7PYcUIdaO7imXFyW7xa8/W/MD2V381
         FI05p7WSOYkdqXN1sPEMyEzp5K2KCHvgHQD9laRb1U9g7rExNlnaEIBcJ6GahKWFQzH7
         5S9yED+EfgF9nCu/pQBaQ1EIaPumH0ukP9EsOTE+RFENAQTlIVgVLXiFKSd2NSGPmWTw
         ZKqg==
X-Gm-Message-State: AFqh2kpWz4QfEdhJTH6iuW4kgZlgAXyGeKm1WIZ6TKBE/DNE+4ayMJsr
        XAFznJHOeL6zfvRefpEmJ6qcpeN3rUTzUSgvVwk97A==
X-Google-Smtp-Source: AMrXdXvAx6y1ThlA1UIN8G7jYozTcqWPm5nhqThDDSJen+uXvBbrhIA8Aeq85e+9eAZsYZA6UVZvtUEAHY1gLjQITy8=
X-Received: by 2002:a25:c042:0:b0:7e4:fa1:b33 with SMTP id c63-20020a25c042000000b007e40fa10b33mr255611ybf.460.1673873016453;
 Mon, 16 Jan 2023 04:43:36 -0800 (PST)
MIME-Version: 1.0
References: <20230110172955.1258840-1-jonas@kwiboo.se>
In-Reply-To: <20230110172955.1258840-1-jonas@kwiboo.se>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Jan 2023 13:43:25 +0100
Message-ID: <CACRpkdaY7Q9WngrznF8jch8fzfu8uEbk1t30NAMd2tBdLnZXOA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: rockchip: fix reading pull type on rk3568
To:     Jonas Karlman <jonas@kwiboo.se>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        Jianqun Xu <jay.xu@rock-chips.com>, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 10, 2023 at 6:29 PM Jonas Karlman <jonas@kwiboo.se> wrote:

> When reading pinconf-pins from debugfs it fails to get the configured pull
> type on RK3568, "unsupported pinctrl type" error messages is also reported.
>
> Fix this by adding support for RK3568 in rockchip_get_pull, including a
> reverse of the pull-up value swap applied in rockchip_set_pull so that
> pull-up is correctly reported in pinconf-pins.
> Also update the workaround comment to reflect affected pins, GPIO0_D3-D6.
>
> Fixes: c0dadc0e47a8 ("pinctrl: rockchip: add support for rk3568")
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Patch applied for fixes. Thanks for fixing this!

Yours,
Linus Walleij
