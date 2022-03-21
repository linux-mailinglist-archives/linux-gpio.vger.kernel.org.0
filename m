Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF3284E2F0B
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Mar 2022 18:27:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351858AbiCUR3E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Mar 2022 13:29:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351862AbiCUR3D (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Mar 2022 13:29:03 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38D70186145
        for <linux-gpio@vger.kernel.org>; Mon, 21 Mar 2022 10:27:38 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id q8so10325466wrc.0
        for <linux-gpio@vger.kernel.org>; Mon, 21 Mar 2022 10:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Tgg5+eA7Y6k+NOTzXa5qB7Lg3dME+rVZtmJruOhkLPU=;
        b=W/sVARfVRlmWecBhjvOyOUshd4WiErJw5KoXrtL67+9+8wZAi0hulzYeePd7/pCGVZ
         ughGxh0+Olrfiv4pc8v+KbupxPRihVNKTcDg2rB1wqaRUE1sh+l2xgOMO73VOtoXnZPT
         7CWp+89KIvlroDazRp4rW9YuaMYvvT0kAyS6ysWLWys5byz9qAxkC5oPAo5DKAK1SWGZ
         ckmhMtmGTzkkfcs8No/KKgKynn8jsg5P07SJT7WUAu3YKXgMVUfIMO4HsWRoJlSx6dKC
         UnyXTdaVKr3Hm3LpvVEeY4hh7xtrDU/fIVG64akQUFS6FiKSvxfViHxmgQKyioHGdUz5
         HToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Tgg5+eA7Y6k+NOTzXa5qB7Lg3dME+rVZtmJruOhkLPU=;
        b=BUBT7Z5wzmKRGZTuZ7e9A8v7g76UbwN5sIDoNdq7kgLG/4OWtlcYhN7JoMv4LujYPN
         eYyHUsW8hw5/3UQBpj07L98hqb6FblPShYdDXVEIsPL3995azI4wf1YvbflrXN7mbSSG
         xYy0RX/ewDO//gpqR2zNwPKE6Py3zW/82pLUc1SJkUHdjmfpS6HJz3nte1WZcyB3bLtl
         f0evYoeBdho4mMrf2WkEkiQwiUPo5xkVQT3ox2X62Gw96NZqbMD9uduLtxvMCLTJKWx0
         zw208A439Zmueh+4C4hpnUK+NS3N/uv76pxoI+wTn2F600FMlrB0UVwR/DtJzUJw/gvV
         Tj2w==
X-Gm-Message-State: AOAM5321vJYfO7gBAz8+2tmeb88siiicNI5SWZL5sga1cGhQU37JYqU2
        I8G90sR7m71NZrj0soqhhrc=
X-Google-Smtp-Source: ABdhPJyCYagI7AIZxEw1e7qwG7gy6OEGn3syMr7uSrXcAPwTBKaYbYErRCAUdl6RU/O4u1daJgh70g==
X-Received: by 2002:a5d:5249:0:b0:203:d647:a5cd with SMTP id k9-20020a5d5249000000b00203d647a5cdmr19258378wrc.103.1647883656594;
        Mon, 21 Mar 2022 10:27:36 -0700 (PDT)
Received: from [192.168.1.31] ([90.61.176.186])
        by smtp.gmail.com with ESMTPSA id p21-20020a05600c359500b0038ca92f175csm158179wmq.32.2022.03.21.10.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Mar 2022 10:27:36 -0700 (PDT)
Message-ID: <8200d976-2b32-1215-e46c-0bb2837392b7@gmail.com>
Date:   Mon, 21 Mar 2022 18:27:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: gpiod: Set pullup for Input Line
Content-Language: fr
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <97da941f-39da-4ded-0138-d1e71c4d3ecc@gmail.com>
 <CAHp75VcXxSxtvEdHxenAWoP31WnkoyDJ6WfDwPDEKDhT3AtUmg@mail.gmail.com>
From:   Hans Kurscheidt <lve0200@gmail.com>
In-Reply-To: <CAHp75VcXxSxtvEdHxenAWoP31WnkoyDJ6WfDwPDEKDhT3AtUmg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi thanks, that makes hope.

Unfortunately apt-get gpiod on my OrangePi Armbian board gives me 
version 1.2, while the dev is already at 1.6. I probably have to build 
it from source.

Keeping fingers crossed .

RGDS

hk


Am 21.03.2022 um 17:26 schrieb Andy Shevchenko:
> On Mon, Mar 21, 2022 at 1:30 PM Hans Kurscheidt <lve0200@gmail.com> wrote:
>> Despite deep searching, I cannot find any information, if gpiod allow
>> specifying pull-ups to input lines and how to do/handle it.
> Have you followed this code from libgpiod?
> https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/tools/gpioset.c#n44
>
