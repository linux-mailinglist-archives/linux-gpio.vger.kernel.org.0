Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E31D67E546
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jan 2023 13:33:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231802AbjA0MdV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Jan 2023 07:33:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjA0MdU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2023 07:33:20 -0500
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBBD343467
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 04:33:18 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-50e7a0f0cc8so2804727b3.2
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 04:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rQ0envBKZILqHzUO+F+Zje3FulFWG4VE6MBPBgvm4Fg=;
        b=RxEhBD/W5Ke3tWjLCBPjfXPbcb2+7ZI9a78+cUTicFF3MMtONaLqwvKFvd6034xFRg
         TkYVQSiRrDZDSKcWy9SvYN0X61T16Mfx/Wvlw6EiGobxwLy6xh6S9OkjRA0E8uT9F8uS
         ZcuxIvdynQUoHNLsZddBjjeOy5hGbNB0waWspEcfF9tV7xuqh72LeULKlYFPTY//OXsM
         9YFUJOW8o/j40kzvXdOlUMWuZMIaUb2iA6jF//rwv1vPwu+U6yeSpVj/wfmsW7+AODHW
         CFBCbB8UBeijAAQhjAtKMhj8axcFzqOSUY0nv663zNjAG6HfSMSWDLmwNd9FQkCpjis/
         Kb2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rQ0envBKZILqHzUO+F+Zje3FulFWG4VE6MBPBgvm4Fg=;
        b=MFYIGiORroY0mu2+9OZa4Wku17WbqCPwSrYKza3nDRgMB4l0nZY40xHgIO5POf1Kb/
         Mhbe48rg0hLii9ZL/0sb4NDMH0GGJWQQgbjTpZwLR8z8AEbzj3LbmkGyo2/6surR+9v5
         Lqb2ZcR1eh12ffCnOrtBycW/aN17ji+mswcXgKQO/yYo4ympzK9rQAvN2cS60mSYRsT+
         3C6V19UXpJdUVutttz56KTin8T5Ac1aGsTXPBr99itkjWWHJQdHysfrWPdCDXsjmRuqU
         wexFdMGQnZTmzzDrDnW1Iab2Hy2my4gzNLcJyFo1UY5fRE4wmXk3zVi93dUP5tK3W/ue
         h+qA==
X-Gm-Message-State: AO0yUKV0ZdYDN4QWn6uIaoxa+AlSpO/MMUJEA5x1t1HHU7Epyk1fYcX7
        YWpIoBmg83T/tZzngj+NEnAwuLdktlLizoYea6mIR168Xd1lHg==
X-Google-Smtp-Source: AK7set96w+IW8ATycCAAKWTW/ZH9c8VFAZ1lyfXYdCAOBDbMOCUoct9VzwQAx1jXdTkqxZOMmvW57pokn4Dfdjrc7aE=
X-Received: by 2002:a05:690c:706:b0:506:6952:b9c9 with SMTP id
 bs6-20020a05690c070600b005066952b9c9mr1258217ywb.477.1674822798220; Fri, 27
 Jan 2023 04:33:18 -0800 (PST)
MIME-Version: 1.0
References: <20230119231856.52014-1-joel@jms.id.au>
In-Reply-To: <20230119231856.52014-1-joel@jms.id.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Jan 2023 13:33:06 +0100
Message-ID: <CACRpkdbR1O66L0UHG2cAq-d7smuqFQoAMtSEO2L=3za6ELN7mg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: Fix confusing types in return value
To:     Joel Stanley <joel@jms.id.au>
Cc:     Andrew Jeffery <andrew@aj.id.au>, linux-aspeed@lists.ozlabs.org,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 20, 2023 at 12:19 AM Joel Stanley <joel@jms.id.au> wrote:

> The function signature is int, but we return a bool. Instead return a
> negative errno as the kerneldoc suggests.
>
> Fixes: 4d3d0e4272d8 ("pinctrl: Add core support for Aspeed SoCs")
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Patch applied for fixes!

Yours,
Linus Walleij
