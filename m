Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36AEB62812D
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Nov 2022 14:21:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236861AbiKNNVL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Nov 2022 08:21:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236519AbiKNNUz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Nov 2022 08:20:55 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 382112E69C
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 05:20:09 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id a5so17230571edb.11
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 05:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MsxhLEEX+JewM1mfo6aagFFHoHLJtXvPCtuaWZUrbFE=;
        b=dSgMCm1OCQ0Kvx1xT2UF42+0L1ozkoEmbhvIY8tlQHWOSE6BbiHKQIuGprS9O716hY
         ATi0JW8DnbquF4DWZbt0QSn/XdY0aKE9xBxk1cBdXe00pEer6Za6v6Qvxwn56um1rtdA
         fQJ3EgQRDmqJcKM3nI8dB92nA/q7sSLj/eIdbpFYBy8gO63mS8N9q5CHTgF1rNFX3LR9
         iLuNddjb/5+hQnr+5MyU7/3l4jDBIZ16U9SmYCiI1NCyoOooQvt8t26Uj2N7rVnJZYPK
         VqXK5d7pxY8AcRIp0RagQRRFcYSkxPOKG0gciib4kElj6C6gzV9kJGIFlJdninxrS9TN
         yCJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MsxhLEEX+JewM1mfo6aagFFHoHLJtXvPCtuaWZUrbFE=;
        b=ETaP0KtF3pfBug/q8+UGHEi0JjqMmqB1sQmDnH+Yd2dp4AOnvkjkFmEW6CkkR6brwx
         EwfT4cneM7rqEzL9GtyF3PiWh5hTJlkK/s86Vsct2gzTIrja1RXt7c8ZK/ViPNhVwrRT
         2bxQK5d5/Q52IX6Sgcj7ydWUyulEziiZ9TwctiRY4DURkvZ+6fssi2gZ7/LGm3gv68hH
         jyZ/pSc+vIloeg/+e5kBZcNKw/hp/KiGnZAgqPj3pivmepVHsxF/1KI1cb1FNvrkeLsl
         E+QzDtwIOjv5fIRAfvVX0cFGfjrOvfV7vwZKcSJLv4y3k0A3yz9QxjmcbDGezzBq/Lqx
         0BKA==
X-Gm-Message-State: ANoB5pkvD5Zdwf91/rCW9yFnXq15v3tCy1M/xik8JEYUSmj0/2O3YX+9
        KrHiMd8GlbzF+G2+KfeIX9SqMdiGBlUbrATLbikeeg==
X-Google-Smtp-Source: AA0mqf4ek/cJs4+qeyY+pfVw9FIVNmbyc7P0td+hFzXMthx+hF5NM8dN0wclv3EWCY43IlieEr97pq2JpiiTG1rWvns=
X-Received: by 2002:a05:6402:682:b0:45d:45de:c062 with SMTP id
 f2-20020a056402068200b0045d45dec062mr11124828edy.133.1668432007660; Mon, 14
 Nov 2022 05:20:07 -0800 (PST)
MIME-Version: 1.0
References: <20221111120048.42968-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20221111120048.42968-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 14 Nov 2022 14:19:56 +0100
Message-ID: <CACRpkdY5sqFQq1364MVrCk2201DO9pR-mwHqur=jnnykgpt0uQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] pinctrl: Move for_each_maps() to namespace and
 hide iterator inside
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 11, 2022 at 1:00 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> First of all, while for_each_maps() is private to pin control subsystem
> it's still better to have it put into a namespace.
>
> Besides that, users are not relying on iterator variable, so hide it
> inside for-loop.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied!

Yours,
Linus Walleij
