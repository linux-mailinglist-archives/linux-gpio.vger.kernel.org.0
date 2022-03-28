Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02C064E9D26
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Mar 2022 19:15:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244466AbiC1RO6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Mar 2022 13:14:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244475AbiC1RO5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Mar 2022 13:14:57 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C34CC5F
        for <linux-gpio@vger.kernel.org>; Mon, 28 Mar 2022 10:13:12 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id a1so21332571wrh.10
        for <linux-gpio@vger.kernel.org>; Mon, 28 Mar 2022 10:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:references:in-reply-to:content-transfer-encoding;
        bh=ZQBHFzN9zilhKiZXOH16ABkZnSQ0ONL3XP8b70ymwQU=;
        b=dfpqxnQcQYWdOqkKalhN6Fpwqy15XF4EIoXEhVNmJBUBgmh8+svnnE/DyUIcdNLeai
         bVGNeKO2gK97qOX1cSw8cKrfy06KilD/l3RcJUGPjqbwHbqYYhwXoElG1cXfxB+U6YP2
         onKcmyO4axwyCERxFVE1nGa98lS9GA3XD4Ti6QKN6JcPRxN1AMYq1F4pdyZ9IESr9kq2
         uK0xtBy7RrK4mtOdgvSM/WMRwtenMAPYrKm4oRm7cLOyQXnPXHT9TpQvjp7En7qJ7I5L
         5Yvy5LU45VqKcblr3V3JRDz16m354DpDRQWQub+5f/Fdduoxn5rfnCOoMl5+qvGWGbXW
         MnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:references:in-reply-to
         :content-transfer-encoding;
        bh=ZQBHFzN9zilhKiZXOH16ABkZnSQ0ONL3XP8b70ymwQU=;
        b=JIpgGLtu7LgPYZEoEOTgG8VGL5S3qafol6puUEQItlPW0Br2IWLXwe2rG81He9KViw
         eabGX87EwZZKiSWgpFSCoShxFIF5pCCbQwZX514VU7o8m46Gc0aLHOo6SnQst+CWOg75
         PqtDSwtJCOG9tgt1w8tQ+IXhxnmWxvupuUXWjmE5YXIHdVzJBGNXOikNOOjFKRN2NvoH
         ZcFMHsXkg3aH6NXBvp1j+0UDiaUHVdvS+xKDrx0Pc4MitOgebTv+3jjrWYzojWjkg63Y
         lwZF5fQ4Muk8cx7tVRKGzYRz9s5jJWJy8veCWjN28wjCcfIxkb8fTmmVAx3pkFjkkOT2
         kLtg==
X-Gm-Message-State: AOAM531mf+p8CcyNK1cIu5+SjHQmtt2MeCoDI9BvpWeJe9krEG/CZG4m
        QK32SlI6NzrJkwo0gbgVksp4ZHwOxwH8Mg==
X-Google-Smtp-Source: ABdhPJy6HzOxS+sSEk4es9LcHsEgWXVBAcbiXGlxV3GP1U6pQxfWU9WeHvxBe17NZzLAofXlNp/Hng==
X-Received: by 2002:adf:9dc3:0:b0:205:7bf0:669f with SMTP id q3-20020adf9dc3000000b002057bf0669fmr24422109wre.4.1648487590701;
        Mon, 28 Mar 2022 10:13:10 -0700 (PDT)
Received: from [192.168.1.31] ([90.61.176.186])
        by smtp.gmail.com with ESMTPSA id m18-20020a05600c4f5200b0038cf335720dsm63049wmq.43.2022.03.28.10.13.09
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Mar 2022 10:13:10 -0700 (PDT)
Message-ID: <c02dbd80-5971-7319-17ad-acba33c10da6@gmail.com>
Date:   Mon, 28 Mar 2022 19:13:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Edit/gpiomon: Question about mode
Content-Language: fr
From:   Hans Kurscheidt <lve0200@gmail.com>
To:     linux-gpio@vger.kernel.org
References: <d7f8e55e-1db8-a471-9414-5aac831432a8@gmail.com>
In-Reply-To: <d7f8e55e-1db8-a471-9414-5aac831432a8@gmail.com>
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


Am 28.03.2022 um 15:16 schrieb Hans Kurscheidt:
> Hi,
>
> what would be the right mode for gpiomon call from
>
> a shellscript executed as root from systemd at system start
>
> waiting on a Pin w/ pullup for invoking shutdown upon rising* edge.   
> *changed
>
>
> Lots of interupts, Signals and other GPIO ongoing from other user APPs 
> & threads in multi-user state.

2b more precise: I wired a GPIO Pin to GND.

Upon the cmd: sudo gpiomon -r -n1 <chip> <offset>

the program exits immediately with 1 event, although there was never a 
rising edge due to the fix wire to GND. Is this a feature or a bug, and 
is it reproducible?

>
> RGDS
>
> hk
>
>
