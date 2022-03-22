Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7BFA4E35D2
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Mar 2022 01:59:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234511AbiCVBAs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Mar 2022 21:00:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234503AbiCVBAp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Mar 2022 21:00:45 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB52A5E756
        for <linux-gpio@vger.kernel.org>; Mon, 21 Mar 2022 17:59:18 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id mj15-20020a17090b368f00b001c637aa358eso1026909pjb.0
        for <linux-gpio@vger.kernel.org>; Mon, 21 Mar 2022 17:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ysYeXx127v8clRyvn5xrhxUPyY/Cb+radGHxFog+OaU=;
        b=fLSvEDTpKk04hJrkagCb9cKJMM8ASdIZAYOY8ERD5ubhMVeSHYiCOCFUfJiK6CteyV
         PXl0McC/qpuLLMT3JTxSi14btc7W+/2OXu46y/maQlQTUiRFdF0n8sU8zgZOAc0zdVpa
         LTYGH84zCOiUpg1RbluqdRwypX9Zv4NrktAazIbqEqIPYvK37Z9JB5NxpFpYreIZ+DIl
         J2AWMr8q9HHDM99i3PzhN5cQkHAyV7iscAlL1t1GDCOb6BO/zRh+wR2x03gRupWo+ixh
         1cMwuQoIAmgz3BaNjQz9ejcHp9U5L4PTARRjrtMVGmZ9RdE4TD56Zn2QDVZs5TR8Jdy2
         Afhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ysYeXx127v8clRyvn5xrhxUPyY/Cb+radGHxFog+OaU=;
        b=Rvme9eLu4eqCTOvm0BPR6BRHYADSk5P6LeTc/J6GFITXliKY0jBi5e0vriKhk1805I
         CFv4+FNIRFobHSnQg8Mn/Sck8uojiCf9DwGpL4/Fkl8zKgkBB5J2MhO98PfEsNsU3GlR
         tYsaq+QbAe1WbOxFAEV49dosjNY7n6+4hK5g0tTl6qCla/t2s7Qibg/hXlOjCk/9fTo/
         csTt8Rvlu9en+Ea29iIXocA7sCDBTDib7ljG028Twfl2NqUC4/1jhqK6/xE0dhthOZLB
         UgCl6tS9yTMT2mRS3O4En+75HBw4VQxecDOesdL7W87h4wqyU8YOQutGAqjvE9n+p+WR
         OhMA==
X-Gm-Message-State: AOAM532P8040a1Ym3bkUsClWRzh7kISL4PZwqK/w5H7HxT+Gmd5mpw98
        8ISasgeIdi6oTVgishTc1S4E7OQO+A53rA==
X-Google-Smtp-Source: ABdhPJx0MaSCwzKm3Dmr6YLzX55PbaXQ2TVwtpJh2lWSDlvUSOnqPLNJypAwZzKLMACI2eNMilRs+w==
X-Received: by 2002:a17:902:6bc4:b0:154:6b3d:a720 with SMTP id m4-20020a1709026bc400b001546b3da720mr4800620plt.104.1647910756722;
        Mon, 21 Mar 2022 17:59:16 -0700 (PDT)
Received: from sol ([124.148.64.37])
        by smtp.gmail.com with ESMTPSA id a24-20020a637f18000000b003821e17819csm10924908pgd.61.2022.03.21.17.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 17:59:15 -0700 (PDT)
Date:   Tue, 22 Mar 2022 08:59:11 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Hans Kurscheidt <lve0200@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: gpiod: Set pullup for Input Line
Message-ID: <20220322005911.GA6650@sol>
References: <97da941f-39da-4ded-0138-d1e71c4d3ecc@gmail.com>
 <CAHp75VcXxSxtvEdHxenAWoP31WnkoyDJ6WfDwPDEKDhT3AtUmg@mail.gmail.com>
 <8200d976-2b32-1215-e46c-0bb2837392b7@gmail.com>
 <CAHp75VcOHCE13oA4m43yAp5e2w=e6uOQhRNneonja6F+XhXmbA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VcOHCE13oA4m43yAp5e2w=e6uOQhRNneonja6F+XhXmbA@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 21, 2022 at 07:33:28PM +0200, Andy Shevchenko wrote:
> On Mon, Mar 21, 2022 at 7:27 PM Hans Kurscheidt <lve0200@gmail.com> wrote:
> >
> > Hi thanks, that makes hope.
> 
> First of all, please do not top-post.
> 
> > Unfortunately apt-get gpiod on my OrangePi Armbian board gives me
> > version 1.2, while the dev is already at 1.6. I probably have to build
> > it from source.
> >
> > Keeping fingers crossed .
> 
> I don't remember the details of old versions of libgpiod (Bart? Kent?)
> I think it was available even there.
> 

Bias support was added in libgpiod v1.5.
It wasn't even exposed in the uAPI prior to that - it wasn't added until
kernel v5.5.

In this case building the latest stable, 1.6.3, is the way to go.

Cheers,
Kent.

> > Am 21.03.2022 um 17:26 schrieb Andy Shevchenko:
> > > On Mon, Mar 21, 2022 at 1:30 PM Hans Kurscheidt <lve0200@gmail.com> wrote:
> > >> Despite deep searching, I cannot find any information, if gpiod allow
> > >> specifying pull-ups to input lines and how to do/handle it.
> > > Have you followed this code from libgpiod?
> > > https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/tools/gpioset.c#n44
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
