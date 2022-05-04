Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5EB951B19C
	for <lists+linux-gpio@lfdr.de>; Thu,  5 May 2022 00:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239494AbiEDWMS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 May 2022 18:12:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352569AbiEDWMR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 May 2022 18:12:17 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BF6419C15
        for <linux-gpio@vger.kernel.org>; Wed,  4 May 2022 15:08:40 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id e12so4715274ybc.11
        for <linux-gpio@vger.kernel.org>; Wed, 04 May 2022 15:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KR2DheuJjcUkIOIUvQUUeNZAD0Do/Uz4XuptHOySxt8=;
        b=EEdHY2WYXdlpU2yBjkiemZxWwkp3ZpOMz4fiag41piTszem+RnzSdsfhLwno+JWoOo
         ec8LLnd6k1z9Dhx+Kk/rSvF2DS8wRH0xt/IZed8l/fVIfrEEM8RCTt+HuCambNCMkHsj
         Pi58haaM6QMnPRETblZo1RBEu2eSbG/sHcAWwzNETIO15yOOFrJTE+J4FzEeyq6a+e+/
         exwk5FTzyZJ1EqcnOm+M2MXvVTYiDP/nqUyhz8bCklhjmlL277XoYVFHqD/rAmEmCOiQ
         oqfxkT1QXj8q5NSXzbiiejSjtBMnIOQ6s4C29Tu+y9Ky+PLFJH3AvcNCTYf0ev15JvjS
         G6Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KR2DheuJjcUkIOIUvQUUeNZAD0Do/Uz4XuptHOySxt8=;
        b=JaaNtFBO040EImlGhP5JMTi1T6WCox6NeKAVLU0ow9ut+Yv3+pPKW3O+qs/mnbkWtA
         LJwnad309LWXy6rrKeUq+AVA3Yq+UkXNa0b9ZeqZS2G03NZnZMs+CAPHTXLkx9loEx3b
         0glJ5N8TjewV5AcF3sv0GUdFt5cb9uWr/QrnqXuBvolWu768F/3z0k+uXTenfDAFOwLS
         lMMyiuXVBbPnUOunmaVW6lgG5jFEK5lOwxJPtjLr/qEMGtdeeiCQ9x6OTcOJwLR/Spvb
         J04vWWvRUzML0mj5Uv0at9y5wer8Ku5W4HyocMVYvIFvOal+ktMYvvWUv5Vu7fIiMGhy
         t45Q==
X-Gm-Message-State: AOAM5337O/dFRu4zAmhgM+G6EF1yO/2D634YQyFvmcm/+igdNEDj/fNW
        2jCX8WdGlAukT7KZqZMUaS92ucwJ6RoaCgdcL/BPUZ+Sr5A=
X-Google-Smtp-Source: ABdhPJyTdhH2kmQaQQumXDHs0GjRnjkcH7xMYZb2ZH+uxT3QLuUwFLJJJF0FYLyU4UL2YqI+Ks3c8frqNy2YXLv4iJM=
X-Received: by 2002:a25:aa92:0:b0:649:6b56:5597 with SMTP id
 t18-20020a25aa92000000b006496b565597mr14236454ybi.295.1651702119896; Wed, 04
 May 2022 15:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220503151310.58762-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220503151310.58762-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 May 2022 00:08:28 +0200
Message-ID: <CACRpkdZLTys2PjLHZZ+Jy-L+8=Td5MWRbX+KB2_ePM5k0_FYGQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: nomadik: Setup parent device and get rid
 of unnecessary of_node assignment
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
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

On Tue, May 3, 2022 at 5:13 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Some of the drivers do not set parent device. This may lead to obstacles
> during debugging or understanding the device relations from the Linux
> point of view. Assign parent device for GPIO chips created by these
> drivers.
>
> While at it, let GPIO library to assign of_node from the parent device.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied!

Yours,
Linus Walleij
