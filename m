Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6264255E446
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 15:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346157AbiF1NRp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jun 2022 09:17:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346343AbiF1NRb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2022 09:17:31 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38FE433899
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 06:17:15 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-317a66d62dfso116548907b3.7
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 06:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+OrWt7V3ek7J/ZmfXSq3ezPTamYKHl3qSabKK/KAAFw=;
        b=Mq+ggAUdbuw1SABJC2rRoNeqqiHxqWVzfYWEgUJUmBAxgUYV3eg4ut/In+3S70REkJ
         JIxzwEkWsYz6GGsCQrNPPOn7L4Hqt+qBNW96A0WY4ClwYn2j11CNvOdb0rooW+QzGse3
         Ic72qbRrj+Cvy3hlPILHPISRcMJp1zY6JJ1ellRWfjBLIkLcNtt/9iZu1Io8MpnJDE61
         ZnsuLxKU5Zjam/AQT3TgOYq8X5g9rz3C0snR2XMzA6oaTlRF2SyWxob/bC/8XWvrvl0M
         KlakB3KXgDfjQBByJdwPabCpM3MR0l5AGpa/HiIwDS+oHzAN5/OeAeWlf7qqF87BW/uo
         8iIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+OrWt7V3ek7J/ZmfXSq3ezPTamYKHl3qSabKK/KAAFw=;
        b=VCSWwkIzSakjWkjfnghwuUTZPXOg/keRhGccWLq7WGo9Vohm8Ifw2ZkmkyfBnWxgIf
         OBiNnR424QQLOmboh7pQvd+iSyx80ADtr9PWLJ7aq3cDgpROE+YN2BmpOsGUM3ON4T8r
         82fXEeyimuwFa+gsLDZ1t8qWrr8KOQhnXolBy8S8ob4xHgCxPXd2T7MxZL5FGy549StX
         OVl5DzQvZwWhC/disy9ySeKWQn4qdmilwRH+VgjEKJDeBs0oqZg31HUbvG1NhiUxXqjC
         Vip8HXmpzfXNUZ0FA7Qxsjfh5nnMQBRJtSZo6F8N3HJO3mW2rmCq8nOQYm2xvQDMoYAo
         A+7Q==
X-Gm-Message-State: AJIora+udhR9XQg/+gFKilizW5MH3FkEOPuNrtyjhyh0Z5pt3RRDAdQ/
        uG29BtocMZunM9xyKiciUQClh5aWdiOidqzq9VUWnA==
X-Google-Smtp-Source: AGRyM1uBZGd4eHAwhadZ6WgfoIuVnhTPjw1GxzRHc5NJIHNyG8k/lzp8U184W5tj52CkR7XKebCkl1UklVutCpILfaQ=
X-Received: by 2002:a81:6587:0:b0:318:38c2:2fb1 with SMTP id
 z129-20020a816587000000b0031838c22fb1mr21531440ywb.118.1656422234318; Tue, 28
 Jun 2022 06:17:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220613031854.1571357-1-ping.bai@nxp.com>
In-Reply-To: <20220613031854.1571357-1-ping.bai@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Jun 2022 15:17:03 +0200
Message-ID: <CACRpkdZSUYpMeod7kmF1QgQ9YjzzbVnoU_fZ6RcwKDe_1n61tg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx: Add the zero base flag for imx93
To:     Jacky Bai <ping.bai@nxp.com>, Sascha Hauer <kernel@pengutronix.de>
Cc:     shawnguo@kernel.org, aisheng.dong@nxp.com, festevam@gmail.com,
        linux-imx@nxp.com, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 13, 2022 at 5:17 AM Jacky Bai <ping.bai@nxp.com> wrote:

> On i.MX93, the pin mux reg offset is from 0x0,
> so need to add the 'ZERO_OFFSET_VALID' flag to make
> sure the pin at mux offset 0 can be found.
>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>

No reply from maintainers for an urgent fix for two weeks -> patch applied.

Jacky, maybe you should be listed as comaintainer for the freescale
pin controller if you are doing active maintenance on it?

Yours,
Linus Walleij
