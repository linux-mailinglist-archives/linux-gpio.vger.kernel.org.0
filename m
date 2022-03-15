Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F9224D9AEE
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 13:15:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344714AbiCOMQr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Mar 2022 08:16:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242335AbiCOMQq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2022 08:16:46 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E7624A3CD
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 05:15:34 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id t1so23707750edc.3
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 05:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g7dT8+eLeMBdScpKAdYFo4FB8ECruoBV7neczdDCMug=;
        b=QNKK21AT7b1UeK9ZIxdpufuTJqa/0hdnA0GK8B4i1pgnKOJcXRCM7zok6ggPSK2f5m
         LoHeHttCMsPae/69vDLS+vTAyby+dnahjJYmhY06CWHJxqzBe3O81UvWl2YqHAwJAJmB
         4JaJMYos3E2XTShuFbL2aJUe5v4DluwhcCePYrBSLqzcynKXJzAJc4surLLuYstDVvkX
         Gc4oDpGlf1f9Bi8g5lfG1Od1r0k87eCpW547yiXfpXgFbIjdUetn2uBh8ZSEBnbJJ4aG
         NTHebn83xNgnlNTHq9TbJF1Ldn3UE293Ws/38VoOi/g13wc7R2BL5HW3vb7rp10nao24
         wd2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g7dT8+eLeMBdScpKAdYFo4FB8ECruoBV7neczdDCMug=;
        b=zb5upCiC/b4Q1V8U74Pak/kSUWAQoPxfBg5qpNPvrfqxu2AbDSYDvPlUSXFpkVBEqo
         zHkzy5tRIDkY3P+QCAF/uvMA/QdRw4N0Ea9VXoOpMvFU+Ynfoz3HU3vBD9UAwWkerq3O
         ABNmzjGe8ek6YoajF33QePROAQry4SrIf8Gm4Jf9s1iWgiz+m+Bn2qT4efxZ98AzR3b7
         H2ibXt3v/sNKh80vCBcdYizxeL1br/gnI+pekDQ39C7dxJSeG7TFFg8VLWqS4f8gYtyu
         M1FOr+O1ekUFSNKhB8ZcpYIuskxXMI/4/N/0hZMotKVq8fnI0+UwZKFFpPMwvUWQWf1y
         BFqg==
X-Gm-Message-State: AOAM530M2M2Gi+WibUCqn52LIpIgh8JgjvDcSAjtIl2p72iQ7oDwo+9U
        +tOObBnRuAhkjWW6FMqZLBltahwLXOqSnNwdH6oUmFb4unoPcA==
X-Google-Smtp-Source: ABdhPJzdwgTMXIu5T/D3CBjtwNcf58xTjap/YC9kXdcywNO1DHrs/Pai9Yq3i5LU3YDHX45qsWpswWlHKLMD6pkQnn8=
X-Received: by 2002:aa7:c55a:0:b0:418:681a:d65c with SMTP id
 s26-20020aa7c55a000000b00418681ad65cmr13959177edr.145.1647346532935; Tue, 15
 Mar 2022 05:15:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220315053220.102934-1-warthog618@gmail.com> <20220315053220.102934-3-warthog618@gmail.com>
 <CAMRc=Mf9pAWiKeR2GH6PQX=bUOvWXoyWUP2aY+5grzqoAn6M8A@mail.gmail.com> <20220315121211.GA174293@sol>
In-Reply-To: <20220315121211.GA174293@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 15 Mar 2022 13:15:22 +0100
Message-ID: <CAMRc=McvDy-pfv6Aj7bvTBp=G4VbXVMbP9JWL6FQmdzBf1rZVA@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH 2/3] core: split chip_info out of chip
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 15, 2022 at 1:12 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Tue, Mar 15, 2022 at 12:59:55PM +0100, Bartosz Golaszewski wrote:
> > On Tue, Mar 15, 2022 at 6:32 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > The core library should be minimalist, only performing the operations
> > > required, but gpiod_chip_open() always fetches the chip info,
> > > even though the majority of the time the chip will only be used to
> > > request a line, so the chip info is not required.
> > >
> > > Split the chip_info from the chip, in the same style as line_info, and
> > > update methods and tools appropriately.
> > >
> > > In the rare occasions that the user requires the chip info they can
> > > request it themselves using gpiod_chip_get_info(), as demonstrated
> > > in the tool changes.
> > >
> > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> >
> > Ha! Interesting take. Makes sense. I queued this but tweaked a couple
> > things (some bad copy-paste and stray newlines).
> >
>
> I've been flip-flopping on this one, but wanted to float it as we're
> getting close to finalising the API.
> In some ways hiding the chip info is simpler, and gpiod_chip_open()
> already does a whole lot in gpiod_is_gpiochip_device(), so an extra
> ioctl call isn't going to make much difference...
> But it does reduce the gpiod_chip size a fair bit as well.
> As I said - flip-flopping.
>

No, it's good. I like to idea of limiting the responsiblities of each structure.

Bart
