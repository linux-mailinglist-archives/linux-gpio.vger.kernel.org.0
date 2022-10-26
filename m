Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49CCE60E68E
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Oct 2022 19:33:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233763AbiJZRdO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Oct 2022 13:33:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229995AbiJZRdN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2022 13:33:13 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 837A0105372
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 10:33:12 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id l22-20020a17090a3f1600b00212fbbcfb78so3299289pjc.3
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 10:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IJBTQA7RL98lrGdazxZXS3mNWRQzds0UXZKcg2+mvkI=;
        b=aqgzyaX9g2cVPtfUp+X6gqzd5g63Nos6HCV4MuTqE0aAuT3zHOxr+cCpQIzuUmfdqJ
         p0B3HyY4GO6PqA8TyqMMaEzWB8j5n/T5qWl+Aw+td1cQjglZB3U2SFcOt60D0KVsNvna
         KFPHn1NkKWSc/TBVZVITNnRbOAzydvgCh5cyhjVVqcPY32RDIlILb94z+l1MuE+8D/Ld
         QYvxyRE4YrMa6SfDnq2+ucQ4pFsecQbH1nTTlonBHWiRSkbtUm5juasNKM2GEk3oKsP5
         xvqVk0ziIUGxWSETe9+LKMom+Z4MY4dSyj0n8ppI5Tjv8BaCbXM1lX9r19sLhYcUUL4p
         a2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IJBTQA7RL98lrGdazxZXS3mNWRQzds0UXZKcg2+mvkI=;
        b=Kfg1LGg4DgIshc1pCc+wczx6Gwxjde3NjADSbx0hMhujUQmzzryOg6RaT9ecWwcFan
         1YFJc8fKKvemroTEPBf0YkimDdtE+cGisVxfYjyFZ7AKTVD8AEyfJSn5qGxouEGgJpn5
         cEostkxYCtNdIrh2SjBtu3xl673qCkk9CBjsg2jNNK9G2Dyb0z+33hLzViUztg71+V/U
         bOLUYleQkuEy3v+CngcYrN9XUOTfo9AU5pugEP+3osZPUAiLDyMut3Y15PHJp0MsBA9d
         QwpX/GELtGZZaNwy9KSyxB4DSyDPfu5TCEhZpScl0lX6GLXoke1aq0KP5Ox8G6L4H4Jl
         pVpw==
X-Gm-Message-State: ACrzQf3uwRXaWZkc9nPuC2hGb8ltGtCfneNdPj+kUBxVAssGUs1qXw1u
        dAnCEpim1/Rn2p36vIxAc723M1k5JO4=
X-Google-Smtp-Source: AMsMyM6T//tm0/D+LhMnajs7U8pcSztCUx6QkUsL0i25zn1UP7lu9Caf4h6Cgzx/Bb10NM0kaD33MA==
X-Received: by 2002:a17:90b:2812:b0:20d:7a3b:df3e with SMTP id qb18-20020a17090b281200b0020d7a3bdf3emr5374941pjb.169.1666805591363;
        Wed, 26 Oct 2022 10:33:11 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:58ae:2e0e:e8e8:213c])
        by smtp.gmail.com with ESMTPSA id 13-20020a170902c24d00b0017d7e5a9fa7sm3172630plg.92.2022.10.26.10.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 10:33:10 -0700 (PDT)
Date:   Wed, 26 Oct 2022 10:33:07 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Lee Jones <lee@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [bug report] tty: st-asc: switch to using devm_gpiod_get()
Message-ID: <Y1lvU/EN/xR8jbXk@google.com>
References: <Y1k+nMCs0gCh0/er@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1k+nMCs0gCh0/er@kili>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Dan,

On Wed, Oct 26, 2022 at 05:05:16PM +0300, Dan Carpenter wrote:
> Hello Dmitry Torokhov,
> 
> The patch 8c44f9b566a3: "tty: st-asc: switch to using
> devm_gpiod_get()" from Jan 4, 2020, leads to the following Smatch
> static checker warning:
> 
> 	drivers/gpio/gpiolib-devres.c:118 devm_gpiod_get_index()
> 	warn: sleeping in atomic context

You already reported this one:

https://lore.kernel.org/all/20210813124155.GA7367@kili/

As I mentioned back then my change simply swapped one devm invocation
for another, with the problem of sleeping in an atomic context being
already present. In fact the issue was introduced in:

commit d7356256488c544b8fdc2c3a775ce069546d7933
Author: Lee Jones <lee.jones@linaro.org>
Date:   Fri Feb 3 10:23:13 2017 +0000

    serial: st-asc: (De)Register GPIOD and swap Pinctrl profiles

    When hardware flow-control is disabled, manual toggling of the UART's
    reset line (RTS) using userland applications (e.g. stty) is not
    possible, since the ASC IP does not provide this functionality in the
    same was as some other IPs do.  Thus, we have to do this manually.

    This patch ensures that when HW flow-control is disabled the RTS/CTS
    lines are free to be registered via the GPIO API.  It also ensures
    any registered GPIO lines are unregistered when HW flow-control is
    requested, allowing the IP to control them automatically.

    Acked-by: Peter Griffin <peter.griffin@linaro.org>
    Signed-off-by: Lee Jones <lee.jones@linaro.org>
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

and I mentioned that Lee and Greg should look into fixing it. In
general, doing gpio allocation, or pin control switching while holding a
lock and/or with interrupts disabled is problematic...

Thanks.

-- 
Dmitry
