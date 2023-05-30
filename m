Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0663B715AFE
	for <lists+linux-gpio@lfdr.de>; Tue, 30 May 2023 12:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231184AbjE3KFJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 May 2023 06:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231417AbjE3KFC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2023 06:05:02 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D56DF1
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 03:05:00 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2563ca70f64so2380880a91.0
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 03:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685441099; x=1688033099;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OOVLx3ZkQfrv8S+dynj1Zx7TKIQVwUEfCGfvQ8Y5ygw=;
        b=USSoLbFhtMkIwvBrBlJviWnicOhzIFtv+V0i6KtVN9GRGPGKZnZQQ1FsPMe9z8Tv9B
         m3IEwzZAWnvicTwjbN09c/XVvX/84rUsJSutX3m0KrUh3sjHhYGYjElIQMCiTOCG9cD7
         HyJr+6mQpqddfr0CWoKv4HHmnN4WuWW9VqBRooXzne8OfbT6fScvUxY5gQ66zMRlFeRn
         Zjq8kb4D8MlF05amoZG77ofbXQv0A8r6hwMftNyFmWDD3w8J853W0ev9D4gGHg8MPNRL
         ONYDVg16QZl58ioCio2akywhWJfEgYkoSOOTd+vgpxShN3B3XIZWpRAFaAE5a7RVTgzo
         I0wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685441099; x=1688033099;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OOVLx3ZkQfrv8S+dynj1Zx7TKIQVwUEfCGfvQ8Y5ygw=;
        b=D0PoF/K8FW6etbRfMi/C5SveUQygdxcjdaIt4GNM1TXVBOinKpZRO9Fd9oa/9Xv3JR
         YMlEyU8Zc3zx09PtPoPIiA15xp7rhGC8keesEbQWF+oSqnGeRispramB+kwX5l29UbaG
         +oHYD0m9+ctQj76dCEWg/QnvXdlm+ODkM2l/n4q6D2+hNKTEejFQGDO6sMFribrSh8q7
         NQhjapS3ecKllHQhDdAhpn+yJ+i9lYcPHal5IK/xCcOQLhrb+D6T+P+7tEXQmmA8E004
         yKrSL3hkr7/861lWWdzC/pNhvNlLsRgct2OYhriMcuAyAefvMC7h8wc+jiZJWuBlTaeD
         rr2A==
X-Gm-Message-State: AC+VfDxrq97lWfMjCHe3QArfJBYY2T/uZaU8QGJGS+d7m/UXBmwcLg+8
        Ev8S3PhC/nXywslWqtMyczWIAbZuC+Q=
X-Google-Smtp-Source: ACHHUZ6+YtLIBCx756o9nTVpD5FaLVJKzxLkiMlfq/NWzHQ4nmu3nzIF1c4iisMJlxFO0N4GpjR/dQ==
X-Received: by 2002:a17:90a:d917:b0:252:bb8d:3dce with SMTP id c23-20020a17090ad91700b00252bb8d3dcemr1878675pjv.39.1685441099507;
        Tue, 30 May 2023 03:04:59 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id i6-20020a17090aee8600b002566caf4466sm4094073pjz.24.2023.05.30.03.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 03:04:59 -0700 (PDT)
Date:   Tue, 30 May 2023 18:04:54 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "Slater, Joseph" <joe.slater@windriver.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "MacLeod, Randy" <Randy.MacLeod@windriver.com>
Subject: Re: [libgpiod][PATCH 1/1] gpio-tools-test.bats: modify delays in
 toggle test
Message-ID: <ZHXKRtJOYSw42BAi@sol>
References: <20230524210945.4054480-1-joe.slater@windriver.com>
 <ZG7bpE8xRuIeq7J+@sol>
 <BY5PR11MB3992F8CA5B13108F6310D72A88469@BY5PR11MB3992.namprd11.prod.outlook.com>
 <CAMRc=MeOiCKkn2OqNtSfRrh6_jSgEpWbh5DJNK30FmKP5NfPDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeOiCKkn2OqNtSfRrh6_jSgEpWbh5DJNK30FmKP5NfPDg@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 30, 2023 at 11:51:05AM +0200, Bartosz Golaszewski wrote:
> On Thu, May 25, 2023 at 11:54 PM Slater, Joseph
> <joe.slater@windriver.com> wrote:
> >
> >
> > [Slater, Joseph] I'll get rid of the comment and try the test with a shorter toggle time.
> > The series of 159 tests takes, maybe, 10-15 minutes for me, so I don't think saving a
> > second or two here would make much difference, though.
> > Joe
> >
> 
> That can't be right, are you running it on a toaster? It takes 26
> seconds on my regular lenovo thinkpad laptop which is still longer
> than I'd like but quite acceptable for now (though I agree it would be
> great to improve it).
> 

Consider yourself blessed.
I just got:

real	2m25.956s

on my test VM.
Not sure exactly what the hold up is - it isn't using much CPU, or any
other resources AFAICT.
Compared to all the other test suites I run, this is far and away the
slowest, especially since switching everything over to gpio-sim.

Cheers,
Kent.


