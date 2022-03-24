Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67EF24E6940
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Mar 2022 20:24:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242242AbiCXTZj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Mar 2022 15:25:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346128AbiCXTZh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Mar 2022 15:25:37 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63D6F6E4CE
        for <linux-gpio@vger.kernel.org>; Thu, 24 Mar 2022 12:24:05 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id z16so4729522pfh.3
        for <linux-gpio@vger.kernel.org>; Thu, 24 Mar 2022 12:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=+7mZcYr+cQZVQCVlGpg9d5gd0kqzibMDw8/886VYVDo=;
        b=jx82KHZvOYVP3VaHJOUfrOrHJQgWm8qp+y2SeNQ2H918HXt6z2PQ4EGiN3/EXIct8u
         3XQ41KfyzUKVYwMlakK6WSPTchU+24pAK+e41mh1Thtj1dSWk5fHfHoSs79JXE2wfvEY
         ttBFk15mh77gcX6SDWnXY1mWy0tz0C/JFbYmALtTxnI56i4hdsrFuQ+u5wDPBngWd7wN
         LmD/uqDJV8Zbs+hyuhqiHHiBeP5VAWEUnBzGFq5sPv7TdZulzQw100jWDL0MUEjqXxd/
         9/qLd/svRXOvxkM5CE7NXCiq2fVnrGBNy+UqldLa8dia0oDKe6zjP9ngPJYcET6gEtZ2
         CK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+7mZcYr+cQZVQCVlGpg9d5gd0kqzibMDw8/886VYVDo=;
        b=2Jsi/5ELi0oC03Zp6ET3+iLDX47al5PuQXpymCDXNcok+QU106XIq0+RlCrOy0S8Jg
         /LpK5e/MkQkWqiJU24nH+1WrLgcr/D/rsCfcIgMOTqLTsyLrSPzEB0ZEw/4dhe8kAmyl
         0W0/QJrOxHAWBBnYUGS4BEMTR37/6wCq+n9f6lv+UPq2/molfXi1SO4pB64LL+50yyf2
         Q+uZZufEbIUICuwFOgvMnropnBUt8ZMkaYH95pqfvb29NuNwOFcC4cFiBUNZWRtRUeXx
         rncZ6M3Yjzn/iDZp5cw8cUlWHxXhCn5ANQhap5Q49s2nhLfmJwwu/+U7cWxXZMt6/sKM
         rsqQ==
X-Gm-Message-State: AOAM531HCZDRWkPwrNasNU5HqM3mxvaE8g4XqBScrc005Qpbha0cVUnq
        /lsV8mSHzmeU/R6+HQ6Cklk=
X-Google-Smtp-Source: ABdhPJx1xt1u6vc5zyXN9oCNsUz4GBXWD8NLx/7PdewncPpjTU2kmgksb8wkzfaOu3SV7RUwnGqXMQ==
X-Received: by 2002:a63:2320:0:b0:381:f11:20d7 with SMTP id j32-20020a632320000000b003810f1120d7mr5087891pgj.612.1648149844738;
        Thu, 24 Mar 2022 12:24:04 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id 102-20020a17090a0fef00b001c7b8eea25asm2976261pjz.31.2022.03.24.12.24.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Mar 2022 12:24:04 -0700 (PDT)
Message-ID: <671fa1fc-3c36-dd73-aa98-8bdd29264149@gmail.com>
Date:   Thu, 24 Mar 2022 12:23:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH RFC 0/2] gpiolib: of: Introduce hook for missing
 gpio-ranges
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Arnd Bergmann <arnd@arndb.de>,
        Phil Elwell <phil@raspberrypi.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
References: <1646855026-9132-1-git-send-email-stefan.wahren@i2se.com>
 <CACRpkdYuxsYw99CZZK_GXp3V-mPiuL50CxgsE-=oRMApZf_bxA@mail.gmail.com>
 <15171d7e-f065-88b8-b3b3-dbeed75c5e6e@gmail.com>
 <98561f61-55c7-afe1-2393-362376251e43@i2se.com>
 <55b5cb38-41ea-2efa-321f-952259b12082@gmail.com>
 <f498afb0-dec9-c6fa-8469-896897f77d3f@i2se.com>
 <78dc59cb-cf83-3649-f3d4-a03f3edcb9cf@gmail.com>
 <CACRpkdZfruAcg7t2fT5Nz-N815BNAF8hvYVZ3HQLVhHZ5CXqAA@mail.gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <CACRpkdZfruAcg7t2fT5Nz-N815BNAF8hvYVZ3HQLVhHZ5CXqAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 3/24/22 12:00, Linus Walleij wrote:
> On Mon, Mar 21, 2022 at 7:21 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
> 
>> Linus, how are we proceeding with these changes? Any hope to include
>> them for 5.18?
> 
> Yes if they are finished? These two have RFC prefix but if you say they
> should be applied I'll apply them, I trust you!

I do not really see much room for improvement, unless we wanted to move 
away from the callback approach and make it somewhat mandatory to put 
that code within the core pinctrl code, with the chances of possibly 
regression.

So as far as I can tell, they work as intended and advertised, tested 
them, ship it!
--
Florian
