Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D51215BAC2B
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Sep 2022 13:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbiIPLTS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Sep 2022 07:19:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbiIPLTR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Sep 2022 07:19:17 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D4B74D4DB
        for <linux-gpio@vger.kernel.org>; Fri, 16 Sep 2022 04:19:16 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 29so31005000edv.2
        for <linux-gpio@vger.kernel.org>; Fri, 16 Sep 2022 04:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=icUBRZO3jxS3eTTQZGMHo/3Ro+JI8Iz+Fgnw4zMxh1s=;
        b=mU59pLpvgebTMWSxaEMVYRYLsvuehZDwksFV4RuU9EVVQxnF8Sj5T3QpMfGM7wGc3t
         pWsMLdz97fwFP+uQ+tedL5b8P3hMcdYEb5giZ2Ma9jAKsbuvAaMOKsT+6j2gje++qp4n
         72XGo9nKMcGw6szjbchS8faU06IDRdyZIjuy1WdCJTO6KLkFUx+/7fFnCETXrDVhsv6w
         yuDsE7GIqckoRAct8SOzsUbvhd4HAPkZpWTleQXtgZzUNEzqH4+zmnhk7G3duvBLmC9f
         u4jrXQNZKhUUWwwTmPCPGMChl7/rmBNkU2/Rv66zoc1ZEXeecPYcF2A/ufcZ83F5qPeu
         hKRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=icUBRZO3jxS3eTTQZGMHo/3Ro+JI8Iz+Fgnw4zMxh1s=;
        b=Oi+7/hqTGPwbVDNFCtM+io0fqiALJAZUx+G8jGXcZQxpagnlKdcR7JMtadHGoya7PH
         nAJ2EMoK2a11Zz4SAzKAIZPqsWkeqDLSlSTXOvjYgFUOBwyhM6AvFoM7M+1FMqiQ3yIU
         hhc0CV7lK0Tr4VhQC7Jxnym/v6KIfhzx8PRjizz9Sacc9BQPws0DH7RW5oasjwi8eCt5
         Xw/vtB++GBRQbXfMRTQDJvHgKLPZK2h27Fs82PPEtP1IguI9RInEcmYEUlhi9dLnhqZO
         EYYWTvuuw9JeXSWr0ESePC8oEiQT2IyO04Paidw4SlsNs+sq2NrJ7p5xGBkbEVZ65iuH
         Pkzw==
X-Gm-Message-State: ACrzQf2LTpwWP4wqk4jsLBpmyuetnYArvq/JFh5mFtLvKHo0+auqwj9F
        gLqrUpH1mugPGhp0YhNJ3ejJrTdRJPtxVvf31N+d0w==
X-Google-Smtp-Source: AMsMyM7uG7ObWhfMYe3sbpSf7mOrJABzgDz5ES/6pcMzLsublRjWfYLHRWZK0mwQxUh2UdidY6sMh8DlCwmIeldo+JM=
X-Received: by 2002:a05:6402:190f:b0:452:d6ba:a150 with SMTP id
 e15-20020a056402190f00b00452d6baa150mr3582318edz.126.1663327155181; Fri, 16
 Sep 2022 04:19:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220916110118.446132-1-michael@walle.cc>
In-Reply-To: <20220916110118.446132-1-michael@walle.cc>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 16 Sep 2022 13:19:04 +0200
Message-ID: <CACRpkdbSkLxG8YiBPvFPuRm73iBXXB3FmChHV113dLXvSnpHfw@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: fix OOB access in quirk callbacks
To:     Michael Walle <michael@walle.cc>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 16, 2022 at 1:01 PM Michael Walle <michael@walle.cc> wrote:

> Commit a2b5e207cade ("gpiolib: rework quirk handling in of_find_gpio()")
> introduced an array of quirk functions which get iterated over. But a
> sentinal value is missing. Add it.
>
> Fixes: a2b5e207cade ("gpiolib: rework quirk handling in of_find_gpio()")
> Signed-off-by: Michael Walle <michael@walle.cc>

Looks correct, an alternative would be to have the for-loop use
ARRAY_SIZE() but this is just as good.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
