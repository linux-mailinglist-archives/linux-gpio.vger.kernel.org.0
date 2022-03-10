Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D6864D3FA3
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Mar 2022 04:24:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235384AbiCJDZI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Mar 2022 22:25:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232330AbiCJDZH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Mar 2022 22:25:07 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8332F9F91
        for <linux-gpio@vger.kernel.org>; Wed,  9 Mar 2022 19:24:07 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id s8so3965533pfk.12
        for <linux-gpio@vger.kernel.org>; Wed, 09 Mar 2022 19:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=lrl03+37jAP7R0VxH9jXIjnvyLRad/emJxueel8BDZE=;
        b=acLmRwcVk+9o7m2AWQWXP9KRpaTPE5wfHljNXPrsOJALYtXuzQmeEYDe8svtDWCJI2
         Tw7OooApeUMESaZAnkt8n2ANaXpNNBTsbcJc1NawdAEJ23cxCB9jPHC6VQQawsSgVSKu
         rwnOZhPzwO/FlUjfAN/8IDtHRrnjWLc0JsQEkeG/akFsYmsMKrKlLVeEXZgTuHjuC/gt
         Om9WL5w3Ps1F0vO/w6bEb+zah+uVfY/+knU/5DJTfN+1yqKzbwT52pZpanBO3lH+tKfM
         RW1PPj+Pd+DmOCM0Ux+PNekhoYhLR/kXGsX8lZtutceDBOlGgWt67MoBSaYuJxeMZqKQ
         oqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lrl03+37jAP7R0VxH9jXIjnvyLRad/emJxueel8BDZE=;
        b=0TH9zkPqbYdm00Qj8MpGfKSv2wj+pqzU1iScBy0oADiNllWm50BMEPl6HtUKb/EsGZ
         zfEQMpigbQen9Vx5+qOcr/N4TyBAWnp6kNmXtePwiw1VexA8xsJm9V5K54HRRWhFJTi9
         ITjaGX1Lcoc3z3i/tIG3uxuYHwdlSrbnKdyPLeXK3h322wmKdmSNNzN7hovkewIMWcUW
         4qBI6A0rkcXaROPSHFaSiRrNJsAqNUhLaD7XqGVYqAf1V7WORXbu3/X/rxRDrKMLHxqd
         BfLfxq/HJtUhm239LiJx1fn8lYU1mJkXvFg1x4ISF/5XiAyalwfRg6xpAD7+XYkPLQvx
         KSvg==
X-Gm-Message-State: AOAM533e9KZRweuLXnfFNhaSltfqgdDfE0ro4UkpiWLzbnNNPDG8wrf3
        n1kqvxkDgvHJO3g+05ricXkOKvk1erg=
X-Google-Smtp-Source: ABdhPJxthXVOTIn5g9gfc+NO+hfM+nLtEwJtFqbF4wnXJXlN9zhMIgz8ug0cWNXeDVNA7fCH21NEcQ==
X-Received: by 2002:a05:6a00:170c:b0:4f7:658d:77a2 with SMTP id h12-20020a056a00170c00b004f7658d77a2mr2988680pfc.60.1646882647073;
        Wed, 09 Mar 2022 19:24:07 -0800 (PST)
Received: from [10.230.24.186] ([192.19.224.250])
        by smtp.gmail.com with ESMTPSA id n24-20020a637218000000b0037ffc63b98csm3655398pgc.65.2022.03.09.19.24.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Mar 2022 19:24:06 -0800 (PST)
Message-ID: <3eef8b75-3e0b-4d49-f34f-32f4b17396db@gmail.com>
Date:   Wed, 9 Mar 2022 19:24:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH RFC 0/2] gpiolib: of: Introduce hook for missing
 gpio-ranges
Content-Language: en-US
To:     Stefan Wahren <stefan.wahren@i2se.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Arnd Bergmann <arnd@arndb.de>,
        Phil Elwell <phil@raspberrypi.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
References: <1646855026-9132-1-git-send-email-stefan.wahren@i2se.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <1646855026-9132-1-git-send-email-stefan.wahren@i2se.com>
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



On 3/9/2022 11:43 AM, Stefan Wahren wrote:
> This patch series tries to provide backward compatibility for DTB which
> lacks the gpio-ranges property.
> 
> The commit ("pinctrl: msm: fix gpio-hog related boot issues") by Christian
> Lamparter already contains a fallback in case the gpio-ranges property
> is missing. But this approach doesn't work on BCM2835 with a gpio-hog
> defined for the SoC GPIOs.
> 
> Based Christian's on explanation i conclude that the fallback must happen
> during the gpiochip_add() call and not afterwards. So the approach is to
> call an optional hook, which can be implemented in the platform driver.
> 
> This series has been tested on Raspberry Pi 3 B Plus.

For both patches, with and without 'gpio-ranges' for pinctrl-bcm2835.c:

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Tested-by: Florian Fainelli <f.fainelli@gmail.com>

Thanks a lot Stefan!
-- 
Florian
