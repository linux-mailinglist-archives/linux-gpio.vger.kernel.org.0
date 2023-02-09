Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA648690226
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Feb 2023 09:29:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbjBII3K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Feb 2023 03:29:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbjBII3J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Feb 2023 03:29:09 -0500
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7761D442F2
        for <linux-gpio@vger.kernel.org>; Thu,  9 Feb 2023 00:29:07 -0800 (PST)
Received: by mail-vs1-xe34.google.com with SMTP id y8so1388542vsq.0
        for <linux-gpio@vger.kernel.org>; Thu, 09 Feb 2023 00:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VFUbZ2IQqN/B2Y7Qegnv4UsDgWXeRnzgvM1anZtyAgI=;
        b=aTXzm3O6M15CzbT2ZeL7Kbfh6ulZihcK22G4nTiPsVMto033ukl3SMS59BDDe4akaS
         Z3bSCd10Kym1+XEgzR3sU8MYxyul1NhT327LuLOX+a40uY4Al640lx5MF5Rr5oc8EYtI
         Z4pQ9x+3uaxQdcqjDwDMnBAOVycgdoHWT5fq9mBrrNOR4DnnweaMn5GjM5M85cfj0Ygo
         3XpPHSv/FzA1R0UCyepDcZIxsnRRAvPogXOsqAM9MZFgYxPPQekPAk63BEOVYP9kjRhq
         t79lIqtwHHiriAMIIQKrMsvhPNkJFj3VzDi2IC5cPIAYDAOu64KUG61NzoYwaL6/KB50
         azbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VFUbZ2IQqN/B2Y7Qegnv4UsDgWXeRnzgvM1anZtyAgI=;
        b=GzZq5+m2+NL4rOhAVYgsnjki63o8OCt4tq8ebWfT8kTw74tnVDUF81BMPMShiNErcw
         t0v2gWIwB/IACuMVYp2h2lD7t0oHbmZ5Tcaylk9VAg6tYWzamd7NIg88kFUVjPDuAkW3
         6AojWN5SBHt/poXXsoHBXMasPscjD7uYHqBSd86ElSCFzU/E44YhbxEbiC54Esrv6Ul1
         4XaMnemMPOBN02bgcRnVfgEApQkMci2aZ1A2dJCznLy3AgfN0o596orwcM9fU2HsMu3a
         AeSV2pyyh9+rp8mCLdpGW4vSTJgAai8UlXU7JlhYE83jQ5upEIZucOIvuwucfZIsN3GP
         PFYA==
X-Gm-Message-State: AO0yUKVB26tVtEh5b2r6FDT7mOm0S0kWp5xHY5H257GGPS2AgJoAqTaT
        FPDXEKNpcSZdpOTByRyXaakUBfr21VdNxx7/W8wNByNv100Jvg==
X-Google-Smtp-Source: AK7set96YJnD44yXoX5IimKQlV2GBQJs55RLlsw6axlOgHqCmJ+taYRR3nbI6htpk6NxtdueuHCDX6tvFfUIcVpFwD0=
X-Received: by 2002:a05:6102:3c94:b0:3fe:b46c:7889 with SMTP id
 c20-20020a0561023c9400b003feb46c7889mr3079529vsv.78.1675931346555; Thu, 09
 Feb 2023 00:29:06 -0800 (PST)
MIME-Version: 1.0
References: <CAMRc=MdyS6CsMkyvRL+_Shr__QnYxXE_Di6DqRKvh+QB_A3Qgg@mail.gmail.com>
 <14de29ca-e9b5-101c-351d-156b21f4a3df@gmail.com>
In-Reply-To: <14de29ca-e9b5-101c-351d-156b21f4a3df@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 9 Feb 2023 09:28:55 +0100
Message-ID: <CAMRc=Mfzu+mbr=N-bshgxzfGvmAh7aPmLPrteMMWc_TiiG1f0g@mail.gmail.com>
Subject: Re: [ANNOUNCE] libgpiod v2.0-rc1 released
To:     Ferry Toth <fntoth@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 8, 2023 at 9:00 PM Ferry Toth <fntoth@gmail.com> wrote:
>
> Op 08-02-2023 om 16:08 schreef Bartosz Golaszewski:
> > There have been no issues raised since the RFC so let's get it out.
> > I'm tagging a release candidate that I will also try and make
> > available in meta-openembedded with the hope that it will get some
> > exposure and testing before we commit to a final v2.0 release.
>
> That is very good news.
>
> I'd like to test this on Intel Edison-Arduino.
>
> I guess the recipe for meta-openembedded will a -rc as well? Where can I
> find it?
>

It's in master-next branch of meta-openembedded already! Just pull it
and give it a spin. Thanks!

Bart
