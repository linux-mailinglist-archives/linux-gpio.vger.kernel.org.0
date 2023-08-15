Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BF3077C4BC
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Aug 2023 02:51:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbjHOAuc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Aug 2023 20:50:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233942AbjHOAuO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Aug 2023 20:50:14 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A60A71981
        for <linux-gpio@vger.kernel.org>; Mon, 14 Aug 2023 17:49:50 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-56518bb1552so2829538a12.0
        for <linux-gpio@vger.kernel.org>; Mon, 14 Aug 2023 17:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692060575; x=1692665375;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W9B4s65rLI1RHmbSggiLUcIjx64uqWtN4x86qwNEBN4=;
        b=KGbJur3LlM5hhkmX6HBZvfX93pncl9KVdSPamM3g3YaztWaAiGF2N7wdPf/bapVbi+
         8velzWqrVs16PXTLUQXXj3zliUY1QtDPb16JQn4iKkQ1ZYS6ErML4AWvJxNCBlcHIemt
         IA/BxBCXdkkICmMtWKCoQpB8T1NPl1ElsbJLHEIVrrlHV7mb65WqyLAMWPXudZImi9I4
         ++7qcWCsTyI+IRhEynWtpH+imGIrv9S0ivgqUE2RyQd9P7/3U/AST5Td/Xlt4whBpr+N
         rksFLfZZfzwi7jgLXWwrLeLIuI2+Ri4bGGRpBFk5timJ4mypcEvXe58jQiKDZE4hIolJ
         wRJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692060575; x=1692665375;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W9B4s65rLI1RHmbSggiLUcIjx64uqWtN4x86qwNEBN4=;
        b=FKctutknlIOXaNlRRpVw0trlDXBwuE+1N6CAK8g3flLFhR0fLVCfnd388OD8fowe8h
         RlDK4i588AAO+37hRKR5uCTbB9JUFbCz0Gb3GHdCDqmwuYt+io6exxRsUv63Ru68qRwh
         J4tm6spNucGallrTZycagREogYjYBAscH3y280Ei/0m/XhrITni5Lx376kP4mm4KxlT7
         coff6OOgEPx6bfKcFcsP3T2ABcXQY98MEzlAlkkcM+extvaJhITaX7GGK7W/lQnnwp5C
         JRkyRUM8OOI0mVRxn8li1ljaVhhEAPAKOt48Xf9/0vQDp9oA7oG46Nt66U2rbjFWEb8U
         LmQQ==
X-Gm-Message-State: AOJu0YxzazYels9jCoY0j7HfgI46fewUKw1cnCi/XjjVYV1reVdUfumQ
        JUz1ZBpeXfvs8rqk4g4og3I0ANCBCkY=
X-Google-Smtp-Source: AGHT+IEUxFqFhyfuOM7RWjNJwUNPIW834iZlMABzmwCq02Mp62jySBWUi3Ywr5f3OvgtD/2mE9PfTQ==
X-Received: by 2002:a05:6a20:3242:b0:13f:4e70:ad48 with SMTP id hm2-20020a056a20324200b0013f4e70ad48mr10026335pzc.52.1692060574724;
        Mon, 14 Aug 2023 17:49:34 -0700 (PDT)
Received: from sol ([220.235.36.234])
        by smtp.gmail.com with ESMTPSA id n4-20020a170903110400b001bba373919bsm10004814plh.261.2023.08.14.17.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 17:49:34 -0700 (PDT)
Date:   Tue, 15 Aug 2023 08:49:29 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     andy pugh <bodgesoc@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: How to use gpiod_line_set_flags
Message-ID: <ZNrLmd3DxcFPptEq@sol>
References: <ZM7xEbr0essN2qY3@sol>
 <CAN1+YZXd_dMJK9CYL+bmtTRCzT=W7Kt9VTeD38Wg8habFLirzg@mail.gmail.com>
 <ZM9oB0l4fvOinzLm@sol>
 <CAN1+YZVD7ui4HSRMaGv+y-xT9NgeGNWDM_vx2MhZfiGrwhLPVA@mail.gmail.com>
 <ZNQzT2MtskTTZTiI@sol>
 <CAN1+YZWz10vZ__3gThzTACbiPY=EVVJ_2qjrAzk6rgpjWwKv9g@mail.gmail.com>
 <ZNWH+L9o5gp6PWyq@sol>
 <CAN1+YZWTJ-TqjR99MBGSPPmQY1ao-TCGu-DfNTYBQvbXcmV=5A@mail.gmail.com>
 <ZNWQsabr8kPCbD4X@sol>
 <CAN1+YZUtCp1FLUSTGJthpXt1q7=2seYFiEHTb3-pMarpk0DnOA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAN1+YZUtCp1FLUSTGJthpXt1q7=2seYFiEHTb3-pMarpk0DnOA@mail.gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 14, 2023 at 11:25:18PM +0100, andy pugh wrote:
> I am somewhat puzzled by an error report when I try to use the
> function ‘gpiod_line_set_flags’
> 
>  warning: implicit declaration of function ‘gpiod_line_set_flags’
> 
> Many other function calls in the same code are working just fine.
> gpiod_line_set_flags() appears as a function declaration in the header
> file looking just like the ones that do work (as far as I can tell)
> 
> At the moment I have the code commented out, but I was hoping to be
> able to use the flags to control pull-up and pull-down.
> 

gpiod_line_set_flags() was a relatively recent addition to libgpiod, so
my guess is you have an old gpiod.h being included by your build.
Though that was added in 1.5, so it would have to be older than that.

Cheers,
Kent.

