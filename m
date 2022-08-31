Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FE2F5A7D92
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Aug 2022 14:38:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230181AbiHaMiW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Aug 2022 08:38:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230497AbiHaMiV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Aug 2022 08:38:21 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 333BAABF29
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 05:38:19 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id lx1so28032577ejb.12
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 05:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Nw0EBkOY83iYP+XsN3p7xZie4SqaMCFMbmxIx0k38js=;
        b=EbrxVY5nmWOEeuFzz8xCaJqiVAvdtpUvBA09CA8hlz6jVkKBBrR/cUoroforFFsHgH
         8CTqzGo6sJLLleJ3EjHWNW7S4C9EqAo1GspjvLhY8kAI7KH6NE3SU88Zhg/0YBD8/cIM
         CAreXFBsW7QgLcRnUd4MXZc8zjptdubpZ4HnrliE5Rob4mZOYDfsHDF8unLHjql30KkR
         x1aayH3bv59OYuOO3e+EpxZrQipMhrTsMThjsrzdpqBp75vSrWDvv0YbeHIaw0asdmh0
         /tX2jReNXg/+GLMwAV1WwNtcn/7lUzkMmHljQ2GeLcZYUN1CC3evGFqk0UiehrPdd0xO
         kVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Nw0EBkOY83iYP+XsN3p7xZie4SqaMCFMbmxIx0k38js=;
        b=G5F+vHmJ9f36+OAZEzftrRz3dyhRLnNWRM03JOchGCZ26DfqPzG+1/fLNDIDEg2QLi
         AMmOgH4nVkWrKtXs/NN3Oe6B9SFSbWYtVQknfzRF3taXfUHXJuHTqXtDKex2jXoh8vGv
         IyfniTW89ZBaPG4UGjVKfXgIBvAARbXwmqvl8LwdQQZn7cPH2tXaAm/mtQoy5WonFuUP
         b1LvNlqygQzCQU2ZT57WPXqxCqu+u4xCyAszr0gYkHxBw++BJ77BZBqYaSFCFPxZDHZE
         EOf6j7B+fmXRzPTGQHFTheE4AAa6BatBF5K08iHK5REkwcJ+MTY6WnlTx288Ctsu7Tlp
         mfXQ==
X-Gm-Message-State: ACgBeo2F+dpoEvVr9ApESzET2veYQQWgtF6fUxb62AjvxkNC/hhFGMgT
        Si7TjBixuozo7Pzly13gRcM/Y8XgMJlwl5iH90DlHw==
X-Google-Smtp-Source: AA6agR6oyyPbMlYFtb5NpTtsjpRebaLkWf/bYtJDx2BFFBYm0+SoT8VLAlPWsAw1NQyFyIQ8k9S6mB877Ji41iDBZww=
X-Received: by 2002:a17:906:9bf3:b0:741:6900:61a5 with SMTP id
 de51-20020a1709069bf300b00741690061a5mr11441223ejc.286.1661949497747; Wed, 31
 Aug 2022 05:38:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220824010605.14256-1-jeffy.chen@rock-chips.com>
In-Reply-To: <20220824010605.14256-1-jeffy.chen@rock-chips.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 31 Aug 2022 14:38:07 +0200
Message-ID: <CAMRc=MdOdeqkRKMdyX2H3QYTeHkL4mrzWD6=tuo=cH46xxKGFw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio/rockchip: Convert to generic_handle_domain_irq()
To:     Jeffy Chen <jeffy.chen@rock-chips.com>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 24, 2022 at 3:13 AM Jeffy Chen <jeffy.chen@rock-chips.com> wrote:
>
> Follow commit dbd1c54fc820 ("gpio: Bulk conversion to
> generic_handle_domain_irq()").
>
> Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
> ---

Applied, thanks!

Bart
