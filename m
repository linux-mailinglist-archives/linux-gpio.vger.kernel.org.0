Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F07705EB51D
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Sep 2022 01:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229453AbiIZXIB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Sep 2022 19:08:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbiIZXIA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Sep 2022 19:08:00 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E892A9C2D
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 16:08:00 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 247526D9;
        Mon, 26 Sep 2022 23:07:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 247526D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1664233679; bh=Ltqt/ahueQxktzBHy9zs1jUgPcXx3uxiXbQvMePf/50=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=WvmGm+ae8HZNPEmFJf+VNJlGiyVafyZYuPsH9o9JMkNvKzFP2apL79LMfxrZK1xsM
         lWBOPHLTl7/h/GgHgMUeqDmLuGTHQ4HZxjxHd0MBPWNZq/tsY+qUgvmaZ/kroetj+/
         /aG5xxirpeUhw88EBHgbO+uWdUxcTA96JB59plUgl+V7PwnCO5YTCURVknY4+LjAUh
         JFxJUoFVRhaw/GqJguCcP7rjpXRLmOUWKOeG1Ahy53TlTwnpW1zIclqUhTT/IpTx30
         QeeuAhqEf/gnrJtAKKx79zB46Fo/kUVmMSewLY0IyZ42XV4eJp1Ix6VIK677eYS+99
         71dK0ju0jwDEg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     linus.walleij@linaro.org, yangyingliang@huawei.com
Subject: Re: [PATCH -next] Documentation: devres: add missing PINCTRL helpers
In-Reply-To: <20220922153737.2863951-1-yangyingliang@huawei.com>
References: <20220922153737.2863951-1-yangyingliang@huawei.com>
Date:   Mon, 26 Sep 2022 17:07:58 -0600
Message-ID: <87pmfhpwdt.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Yang Yingliang <yangyingliang@huawei.com> writes:

> Add devm_pinctrl_get_select() and devm_pinctrl_register_and_init() to
> devres.rst.
>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  Documentation/driver-api/driver-model/devres.rst | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
> index 2895f9ea00c4..d31eb10b271d 100644
> --- a/Documentation/driver-api/driver-model/devres.rst
> +++ b/Documentation/driver-api/driver-model/devres.rst
> @@ -391,7 +391,9 @@ PHY
>  PINCTRL
>    devm_pinctrl_get()
>    devm_pinctrl_put()
> +  devm_pinctrl_get_select()
>    devm_pinctrl_register()
> +  devm_pinctrl_register_and_init()
>    devm_pinctrl_unregister()

Applied, thanks.

jon
