Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE0A04E2FC8
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Mar 2022 19:17:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352006AbiCUSSv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Mar 2022 14:18:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352001AbiCUSSv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Mar 2022 14:18:51 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD09F187BA1
        for <linux-gpio@vger.kernel.org>; Mon, 21 Mar 2022 11:17:24 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id h23so21247253wrb.8
        for <linux-gpio@vger.kernel.org>; Mon, 21 Mar 2022 11:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=+pwimOLhdySYosVSTAlKiZ2BY6HFod5o98mRqS7IOnA=;
        b=XC3+YTNVYe/QHusCy5gsdXqPd/SzTnoFPEzbezbK6AE/L/1ThIY5lAbEDF2jd1MxX8
         O3h4BKqL3wGeYha92xt9Lz0DtQGUwehTU5N7QTgsyAoQSla/ZnTJvRbSiV01KQNvHW/x
         jI7/iBqHXRZSsnpsE2soFl8CEy4tvFtI+mtZRnW1AbNu1wQ2imGuuba4eCyKsDXYeGyb
         o8WPBpRjNHv202W308Ekh44ICRzfPl3nA4yh+pw4uVVjMB9Hef2oy+500NtvjtlADcIA
         SwAZDkTKQM8TI9Q3/bnS2FihKc1+Thy45D/XsZTpTEZylj19GjbASvx+7UWbn7YHGf67
         L2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+pwimOLhdySYosVSTAlKiZ2BY6HFod5o98mRqS7IOnA=;
        b=8Pwn8t2VZKSyiDtnFEaUKHrl6RjwAbVIbgflZwXC8MpHkSy5e2PX7ZIhtjxSMUYY1t
         c90/aP74lQ4FY9aJo2hFrhMVFVe3zbWP5p/RjmzqtAVGUojRbRacWUBZgkOZvvxvVjBt
         GpiM0YhID8mm4rbkxqKI6hnxamHR3MOebSTCEfu6U75hSnG9axiHkGLWu+VXxpFUuvu7
         UoTd9iIjaAd5OHfDxT+qNu+EteIrg84lHyx+YNTInL23IGBiA5Utg+JfYbgPk2VsDowW
         5Lm/eEx1vuhiVog4bv6pVbTm03fXTRvPOpzeL+rms+Kyb3qw2KaXOeE3nJ2LM0Qd4DQ9
         3wOg==
X-Gm-Message-State: AOAM530GvyVjPvOX5hu+JABang0my0ho3O4FkeY1exyZXAbmSZGfVAiO
        9qUhBZXV+4wxmxw+efCcoGcZ7eavW5TuQ1ji
X-Google-Smtp-Source: ABdhPJyFfEAhCc01DP5nHkIYJc51jNux+OOldK1sRMy0w0tPy4B9cPTIY+3XU7Tw7V+eoY6jUqOtBg==
X-Received: by 2002:adf:e7cd:0:b0:204:ba2:b106 with SMTP id e13-20020adfe7cd000000b002040ba2b106mr6490767wrn.679.1647886643276;
        Mon, 21 Mar 2022 11:17:23 -0700 (PDT)
Received: from [192.168.1.31] ([90.61.176.186])
        by smtp.gmail.com with ESMTPSA id 14-20020a056000154e00b00203f8adde0csm10380669wry.32.2022.03.21.11.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Mar 2022 11:17:22 -0700 (PDT)
Message-ID: <c490e63a-8fcb-f802-2f24-7cb8a7f36818@gmail.com>
Date:   Mon, 21 Mar 2022 19:17:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: gpiod: Set pullup for Input Line
Content-Language: fr
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <97da941f-39da-4ded-0138-d1e71c4d3ecc@gmail.com>
 <CAHp75VcXxSxtvEdHxenAWoP31WnkoyDJ6WfDwPDEKDhT3AtUmg@mail.gmail.com>
 <8200d976-2b32-1215-e46c-0bb2837392b7@gmail.com>
 <CAHp75VcOHCE13oA4m43yAp5e2w=e6uOQhRNneonja6F+XhXmbA@mail.gmail.com>
From:   Hans Kurscheidt <lve0200@gmail.com>
In-Reply-To: <CAHp75VcOHCE13oA4m43yAp5e2w=e6uOQhRNneonja6F+XhXmbA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
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
>>> On Mon, Mar 21, 2022 at 1:30 PM Hans Kurscheidt <lve0200@gmail.com> wrote:
>>>> Despite deep searching, I cannot find any information, if gpiod allow
>>>> specifying pull-ups to input lines and how to do/handle it.
>>> Have you followed this code from libgpiod?
>>> https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/tools/gpioset.c#n44
> I don't think that the Bias option is in 1.2.3, because help is mute about it

>   Trying to build it from source, doesn't work for me. I get:
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


