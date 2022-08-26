Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9D5F5A3192
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Aug 2022 23:57:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230436AbiHZV5L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Aug 2022 17:57:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238115AbiHZV5K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Aug 2022 17:57:10 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B7E2DF4C2
        for <linux-gpio@vger.kernel.org>; Fri, 26 Aug 2022 14:57:04 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id z8so3700067edb.0
        for <linux-gpio@vger.kernel.org>; Fri, 26 Aug 2022 14:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=7vSzq6vPLrHqcoL8kcBtL8IovIzvXBgbRpb5JcrKApM=;
        b=moD9pQtx2O8r/SMz3TXxlBEi6KM9LgOC/ExNEn/UpOh3/xg9gjjL/q5qvVceD+Pq+F
         PG3XnQ6yHlAjGW0PnFMz0HF1+mX47v57RzuS2BtND06yp1HfczNjdLBMQlwDzp+bRjsA
         TASLAwZIVTf2U/2FAdX44MlbxZDJ2wDOUBJHy7DuzqDVf36PCIpQDPUf54i6ccD02WF8
         RPwSSewXbllRYpN5H+yEiykQi5S4mSmVJBXQxxlXkWWzxkffmb8Y/PBAWQXmtS2e3prL
         Wlu5H/+Imia8y+VMjYkvyQOBWXC5+LZLxMkyQ3NGcQrNjdTvnFXlfmQNHG4vUu1iHB6n
         pBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=7vSzq6vPLrHqcoL8kcBtL8IovIzvXBgbRpb5JcrKApM=;
        b=qBXccKsxOz/E1lvYT1ArrlpRyzCh/ULAoo0xQDqh8hJtehwL3u7Gyn4I1tZ5JHz+/i
         yJyo8RZzMF65uV8KzhJELrlwXxFe/1yx11f+AgsCx3IChAUgJcnQM9FQn0L6SeJ7WkYi
         pz8vBCBO77v9txuqqqH/WD7DZ6JG8FBlm9WwFJ1SCxz2ohC8ijW50MqrJhqByI49Ok0h
         ogzB9KzOFCMEkGee9wyhtXJlYTGEmqnVzOUst6YNkFDA7szB6OxiWkx2+Bz/9FDC3tPk
         BOpxRpm1AaqT5sLoo7FgEWH+AJki/yY80VCtVQe85hxl8WbLcx1s02+fdijSzaJMFGz3
         fSlg==
X-Gm-Message-State: ACgBeo0CDoMJYKboAU8p/ExZXYYNhLcBt348FNNt/KnI6Fp91PPB7MpO
        F06ElVIeUX202BaEP+VsN31IoNkXjOjhiKVC09guvm1ZiOE=
X-Google-Smtp-Source: AA6agR7/sF+zC9EW31AKq/oYtanUhvn4sbw0O7Ai7ueTmh8pIaXiX3lkjMjogncYyYdmjrCur7/uosW9qLsMkiUy3A4=
X-Received: by 2002:a05:6402:4517:b0:443:7fe1:2d60 with SMTP id
 ez23-20020a056402451700b004437fe12d60mr8196109edb.133.1661551022135; Fri, 26
 Aug 2022 14:57:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220818101839.28860-1-billy_tsai@aspeedtech.com>
In-Reply-To: <20220818101839.28860-1-billy_tsai@aspeedtech.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 26 Aug 2022 23:56:50 +0200
Message-ID: <CACRpkdYpp_1JJQmuX27pECxN0cjzciCuETLPTrSYKqpX0FPABQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: Force to disable the function's signal
To:     Billy Tsai <billy_tsai@aspeedtech.com>
Cc:     andrew@aj.id.au, joel@jms.id.au, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 18, 2022 at 12:18 PM Billy Tsai <billy_tsai@aspeedtech.com> wrote:

> When the driver want to disable the signal of the function, it doesn't
> need to query the state of the mux function's signal on a pin. The
> condition below will miss the disable of the signal:
> Ball | Default | P0 Signal | P0 Expression               | Other
> -----+---------+-----------+-----------------------------+----------
>  E21   GPIOG0    SD2CLK      SCU4B4[16]=1 & SCU450[1]=1    GPIOG0
> -----+---------+-----------+-----------------------------+----------
>  B22   GPIOG1    SD2CMD      SCU4B4[17]=1 & SCU450[1]=1    GPIOG1
> -----+---------+-----------+-----------------------------+----------
> Assume the register status like below:
> SCU4B4[16] == 1 & SCU4B4[17] == 1 & SCU450[1]==1
> After the driver set the Ball E21 to the GPIOG0:
> SCU4B4[16] == 0 & SCU4B4[17] == 1 & SCU450[1]==0
> When the driver want to set the Ball B22 to the GPIOG1, the condition of
> the SD2CMD will be false causing SCU4B4[17] not to be cleared.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

I can't see the verdict for this patch? Will there be a new
version, or are we in the middle of a discussion?
I'd really like Andrew's ACK on the result before merging.

Yours,
Linus Walleij
