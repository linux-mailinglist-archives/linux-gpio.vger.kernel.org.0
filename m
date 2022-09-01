Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98AB75A9DF8
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Sep 2022 19:26:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234330AbiIARZ7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Sep 2022 13:25:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234101AbiIARZt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Sep 2022 13:25:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCB1632BB1
        for <linux-gpio@vger.kernel.org>; Thu,  1 Sep 2022 10:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662053147;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Yhiq+uzZquevHh6W5PlwgpPs6hTPERlicGPTwhiJ5Ig=;
        b=C4l/VQwERLfYqZZh82AD8cKZQ8olteJWoy1ijsEJ0kEMi+I4YBZvlhQR+QbFof9ISyO/s9
        iVmmqMfcQVwKhcHrnYterYv4qqMJKDVVknfigIzWE/0p0aY9jTEERrYKZK2eBpD0dXOKby
        l+S5GwzlP2nYS/+dRiTc6zsl2W4I2Ow=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-553-FGWPXca0NjiLdSzCzPhi_A-1; Thu, 01 Sep 2022 13:25:43 -0400
X-MC-Unique: FGWPXca0NjiLdSzCzPhi_A-1
Received: by mail-qk1-f198.google.com with SMTP id az11-20020a05620a170b00b006bc374c71e8so14950906qkb.17
        for <linux-gpio@vger.kernel.org>; Thu, 01 Sep 2022 10:25:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Yhiq+uzZquevHh6W5PlwgpPs6hTPERlicGPTwhiJ5Ig=;
        b=UAi3NqwqTHyB8a4y1LooYy208PN07epQ4WE6jUHcciJx7iuqOl3w2Efu3qVCYWHF4A
         TxNdCOmf1KpqI9PVkRteiRhvirI2a1Hn3FIOVl94pw8M+2tiLcXGfoCVc5JKCppcnrkV
         XA6IAr+Nkj5yXbOSOB8tghgOJlIQhMxbg1JoarqPf40tDo7BPZgcfkr+/qTkvk6xIL9L
         6szMDd6/e9hRdsgORXXcaab7XG46dcTSHJTxvaQvuk6MTy1DSb+2ajZP3BYfAIHPaQnk
         guvHnzIl0LQGPNZjs/daPyLR1aiXmUZnDOwbDn/LGx31oymkQxE/4E73D0O70XzGXhQB
         sdxA==
X-Gm-Message-State: ACgBeo38Pi7PQ88DZPsaEO7SidwMrxD3M8Rckzya5zBmJmuVM8XHjvOc
        EYUjLVJB0sknfaYNlCGq3zB3gqLYeKRouPr4LvwCp1ZKo6yHOw5qp9L9p0OuqehMMQGYX6nT1kn
        c91k7ztg68wS/thhvtrIs1sGZNlcN2j234nrYIw==
X-Received: by 2002:a05:620a:f10:b0:6aa:318e:55a9 with SMTP id v16-20020a05620a0f1000b006aa318e55a9mr20109052qkl.559.1662053142855;
        Thu, 01 Sep 2022 10:25:42 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6H+iDi5O5k3M6nEBNZA3HLo0Yzmi5upyVTsAbeN+D1ILZKxFbooCpeZvW9sBJEBmKPiow4VeJ91+tCW5nNdOs=
X-Received: by 2002:a05:620a:f10:b0:6aa:318e:55a9 with SMTP id
 v16-20020a05620a0f1000b006aa318e55a9mr20109041qkl.559.1662053142668; Thu, 01
 Sep 2022 10:25:42 -0700 (PDT)
MIME-Version: 1.0
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk> <E1oTkeR-003t9R-BK@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1oTkeR-003t9R-BK@rmk-PC.armlinux.org.uk>
From:   Eric Curtin <ecurtin@redhat.com>
Date:   Thu, 1 Sep 2022 18:25:26 +0100
Message-ID: <CAOgh=FzvV5cLOW-27JqPLr-Y6VryyEXcqOOF+ARYx+vWEoafcw@mail.gmail.com>
Subject: Re: [PATCH 3/6] soc: apple: rtkit: Add apple_rtkit_poll
To:     Russell King <rmk+kernel@armlinux.org.uk>
Cc:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        Hector Martin <marcan@marcan.st>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Sven Peter <sven@svenpeter.dev>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 1 Sept 2022 at 15:03, Russell King <rmk+kernel@armlinux.org.uk> wrote:
>
> From: Hector Martin <marcan@marcan.st>
>
> This allows a client to receive messages in atomic context, by polling.
>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Eric Curtin <ecurtin@redhat.com>

