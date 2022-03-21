Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 003384E31AE
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Mar 2022 21:25:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353300AbiCUU1H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Mar 2022 16:27:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346176AbiCUU1H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Mar 2022 16:27:07 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B77DD165A83
        for <linux-gpio@vger.kernel.org>; Mon, 21 Mar 2022 13:25:40 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id v130-20020a1cac88000000b00389d0a5c511so237849wme.5
        for <linux-gpio@vger.kernel.org>; Mon, 21 Mar 2022 13:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :references:to:cc:from:in-reply-to:content-transfer-encoding;
        bh=uTVrA9GZi4Gf91IloyDeRrZa1VJplonE4ETifRb7gmc=;
        b=OKN3GoA8bxF71Xf1+J7jKIvHDRs07Scrnh8j7S/0S9jB6rCl0dRPODJHlCY9GqINdX
         /Z0aObKCfU9nzjwq3ZTxUYqYgiN8fjxBkGpcWilD2NGfuEXeBWVPJaLYCt/CCaD6VUo8
         mWqJJX7C4F8ynk98nVgFdGNK1a6V24c516VaUtvCH88F31eJhs1w45MUeHLpfKty14Vk
         e/WB1ZPPy8WPXpsbEvirqiDoLkvoXQncuoFqxyC/q2htyWnmq0IqMtNhuEQvQQGH8rWi
         OiUMnZ5hGLW9ZuPgev9MGGJ4os/1SuaxI0IvZWmyaaWepk2XhUFO2iTfNTaUsKtVFRB7
         JkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:references:to:cc:from:in-reply-to
         :content-transfer-encoding;
        bh=uTVrA9GZi4Gf91IloyDeRrZa1VJplonE4ETifRb7gmc=;
        b=Hm0l1s+eElXJYpshKd354BkBLpgm+VfDWe8OBwJBY4yPz3FvSVxMgPG9UOE/KacMxn
         MHFo+60O510kXWUMZhFwBvUVcYZtlhr9nmsHETszncQfC/aqTXvFJcDYGsPFjX/xWFVQ
         Vq0t8v13qWskZ2bP+QO3prQfsDdSt1/nUnsla4H5Z98Opm9oIyGbxQWyW3s1XVsbE+NF
         Cscuk7Q68Nys65l3R1XGqFlzD8B+zF0halR438GKaij21wuRbQDO5+gj7BSl6WAI4Tb2
         PLd5BhrBlehddZaeirv+fGBVZ5dW5y5MwCgDpw2X/sbFsgTJ8qsOuq0RvKOu0dUDrZgk
         LvVg==
X-Gm-Message-State: AOAM531wFGdt26eU9RNazzH0grieAcNmZE0goh04gjR7r5+tXDBYJFY7
        doDEdVxaq98ZcGwpOTFqd0w=
X-Google-Smtp-Source: ABdhPJwCnm7jBsQrUxabp58i/vVsIvi7x5te+FWpGxb3wXdmz8IM6UPcbAGC3IdIKyENlzIJvIYrNw==
X-Received: by 2002:a05:600c:19cd:b0:38c:b84f:41fb with SMTP id u13-20020a05600c19cd00b0038cb84f41fbmr75656wmq.137.1647894339090;
        Mon, 21 Mar 2022 13:25:39 -0700 (PDT)
Received: from [192.168.1.31] ([90.61.176.186])
        by smtp.gmail.com with ESMTPSA id f12-20020a5d64cc000000b00203d45bfbc7sm6741346wri.7.2022.03.21.13.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Mar 2022 13:25:38 -0700 (PDT)
Message-ID: <d9d28ca0-8141-0096-feb9-5808535990c9@gmail.com>
Date:   Mon, 21 Mar 2022 21:25:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Fwd: gpiod: Set pullup for Input Line
Content-Language: fr
References: <c490e63a-8fcb-f802-2f24-7cb8a7f36818@gmail.com>
To:     ndy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
From:   Hans Kurscheidt <lve0200@gmail.com>
In-Reply-To: <c490e63a-8fcb-f802-2f24-7cb8a7f36818@gmail.com>
X-Forwarded-Message-Id: <c490e63a-8fcb-f802-2f24-7cb8a7f36818@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Am 21.03.2022 um 18:33 schrieb Andy Shevchenko:
> On Mon, Mar 21, 2022 at 7:27 PM Hans Kurscheidt <lve0200@gmail.com> wrote:
>> Hi thanks, that makes hope.
> First of all, please do not top-post.
>
>> Unfortunately apt-get gpiod on my OrangePi Armbian board gives me
>> version 1.2, while the dev is already at 1.6. I probably have to build
>> it from source.
>>
>> Keeping fingers crossed .
> I don't remember the details of old versions of libgpiod (Bart? Kent?)
> I think it was available even there.
>
>> Am 21.03.2022 um 17:26 schrieb Andy Shevchenko:
>>> On Mon, Mar 21, 2022 at 1:30 PM Hans Kurscheidt <lve0200@gmail.com> 
>>> wrote:
>>>> Despite deep searching, I cannot find any information, if gpiod allow
>>>> specifying pull-ups to input lines and how to do/handle it.
>>> Have you followed this code from libgpiod?
>>> https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/tools/gpioset.c#n44
> I don't think that the Bias option is in 1.2.3, because help is mute 
> about it

> Trying to build it from source, doesn't work for me. I get:
hk@orangepizeroplus:~/libgpiod$ ./autogen.sh --enable-tools=yes 
--prefix=/usr/bin
autoreconf: Entering directory `.'
autoreconf: configure.ac: not using Gettext
autoreconf: running: aclocal --force -I m4
aclocal: warning: couldn't open directory 'm4': No such file or directory
autoreconf: configure.ac: tracing
autoreconf: configure.ac: creating directory autostuff
autoreconf: configure.ac: not using Libtool
autoreconf: running: /usr/bin/autoconf --force
configure.ac:163: error: possibly undefined macro: AC_LIBTOOL_CXX
       If this token and others are legitimate, please use m4_pattern_allow.
       See the Autoconf documentation.
configure.ac:165: error: Unexpanded AX_ macro found. Please install GNU 
autoconf-archive.
configure.ac:179: error: Unexpanded AX_ macro found. Please install GNU 
autoconf-archive.
autoreconf: /usr/bin/autoconf failed with exit status: 1
hk@orangepizeroplus:~/libgpiod$


??

RGDS

Got it; needed to install libtools and (may be) create a directory m4 in 
libgpiod
Its working now w/ Version 2.0 and I see the Bias Option

Thank you

