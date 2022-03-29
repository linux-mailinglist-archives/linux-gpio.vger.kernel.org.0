Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4F704EA8FB
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Mar 2022 10:09:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233736AbiC2IJm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Mar 2022 04:09:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233749AbiC2IJm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Mar 2022 04:09:42 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3E6A55218
        for <linux-gpio@vger.kernel.org>; Tue, 29 Mar 2022 01:07:59 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id w4so23544190wrg.12
        for <linux-gpio@vger.kernel.org>; Tue, 29 Mar 2022 01:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ym4wYA9thGaPs1Qa6L+R6XcQniVDrYvwiPC7QvqEx5I=;
        b=Wq8uQ9UmM1E71ofAUDimSr2XmvJuw3PTbdZ8sSmgYRu0pnNUewfOfVcdFKoikgynbD
         e7uMgcX8iLzY7fUYgzzDd3xK8tMJM6+9SOnJxwQNLK/NO+FKSL90MshVERfcyUMWDwEs
         sB9W5S8iuUh+36NWgAcE70dOTo6QEKNuBdoo9MqKX6XKbgxcZo1W373UPKK6uVOD+66E
         5VX7cmSYHNcdjKg5a3k/2jV/qwj648tZDjx3PqSTsy7KDxq16zBInmLytXtiLkUop2fK
         s4yttlrpRZ6X4ZoMd5pjIGFdSERhzauCe3BHRybHuLQlbn/MFi1lkbWMSmnxpcu7y0PC
         BXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ym4wYA9thGaPs1Qa6L+R6XcQniVDrYvwiPC7QvqEx5I=;
        b=nbr8XKk9abocltFENipZDoZWznR7rP3L3WsGR5pdOaSPT+Bp4lUP1+2QVQwrv0i2KI
         SNLWgYuWcO+wmZbqBNerqGc9blpegjI2TtQFyCCbBM05/gClr4+6I3hDnewzQgZwjUAC
         g7NqtTMqioBLBi25SbBKsaAV8a4LNoxEMS+zWxYGaW/IZCFl6bPcHZfxedFrDPR23t10
         etFfY/HThjANG+6MspjwMQVIVURuvRvSnAkH0MmwyCU4BcypibLzJqTppMD8x1mQ0k6P
         cBO3FZe7YpmOeGMPRzcCXtF1p5LJCAWes8Qobs/OtR+17Vp148UaGcuSoGALRSDu2J76
         mhBw==
X-Gm-Message-State: AOAM530uSB/xrA8s36n9/R5v75YXpNvQ8D0sM+WtQBAXeGIkGJVkN9GQ
        nzRK4hE+we4L6CPmoH693aI=
X-Google-Smtp-Source: ABdhPJzvLkeVimf8Xs+dWDLBvwAbgJfL+tKIKxF4YE3OT6Oj9084/5dcLpk0YLp56LVQmaOzZmSeUA==
X-Received: by 2002:a5d:47c5:0:b0:205:9248:817a with SMTP id o5-20020a5d47c5000000b002059248817amr28043772wrc.718.1648541278347;
        Tue, 29 Mar 2022 01:07:58 -0700 (PDT)
Received: from [192.168.1.31] ([90.61.176.186])
        by smtp.gmail.com with ESMTPSA id u11-20020a5d6acb000000b002058148822bsm19993625wrw.63.2022.03.29.01.07.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Mar 2022 01:07:57 -0700 (PDT)
Message-ID: <425f4895-81a9-719a-be74-4c67f9c35b92@gmail.com>
Date:   Tue, 29 Mar 2022 10:07:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Edit/gpiomon: Question about mode
Content-Language: fr
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
References: <d7f8e55e-1db8-a471-9414-5aac831432a8@gmail.com>
 <c02dbd80-5971-7319-17ad-acba33c10da6@gmail.com> <20220329033840.GA14149@sol>
From:   Hans Kurscheidt <lve0200@gmail.com>
In-Reply-To: <20220329033840.GA14149@sol>
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


Am 29.03.2022 um 05:38 schrieb Kent Gibson:
> On Mon, Mar 28, 2022 at 07:13:13PM +0200, Hans Kurscheidt wrote:
>> Am 28.03.2022 um 15:16 schrieb Hans Kurscheidt:
>>> Hi,
>>>
>>> what would be the right mode for gpiomon call from
>>>
>>> a shellscript executed as root from systemd at system start
>>>
>>> waiting on a Pin w/ pullup for invoking shutdown upon rising* edge.
>>> *changed
>>>
>>>
>>> Lots of interupts, Signals and other GPIO ongoing from other user APPs &
>>> threads in multi-user state.
>> 2b more precise: I wired a GPIO Pin to GND.
>>
>> Upon the cmd: sudo gpiomon -r -n1 <chip> <offset>
>>
>> the program exits immediately with 1 event, although there was never a
>> rising edge due to the fix wire to GND. Is this a feature or a bug, and is
>> it reproducible?
>>
> Not a feature and not reproducible for me on a Raspberry Pi4 with the
> setup you describe, so probably a bug specific to your hardware platform,
> whatever that may be.
>
> If it is 100% reproduceable for you, and assuming it is an initialisation
> issue so you only get the one spurious event, how about using -n2 as a
> workaround ;-)?
>
> Cheers,
> Kent.

It appears 2b reproduceable 100% on my OrangePi zero+ (Allwinner H5) and 
using -n2 does the trick, but isn't gpiod not supposed to work on all 
commercial HW platforms and related kernels, rather then only on RPI??

RGDS

hk


