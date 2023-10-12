Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F6477C7342
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 18:41:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379203AbjJLQlL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Oct 2023 12:41:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347319AbjJLQlK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Oct 2023 12:41:10 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA6ECCF
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 09:41:05 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1c9d4f08d7cso2755ad.0
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 09:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697128865; x=1697733665; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cSKjALH7K6gqrT2RIcyszQs/ymuQ9k0jAbQvHQpJcQA=;
        b=CdiVfbCXvfWqv8mkRE4NkVfrWQNrE3h9EzzNhv2rdreG3Rw7byj6e3OAFBHdHvYdo0
         HLJzoSmcK1o/Pm2vQ5UGVlDdlmTAvI//2rEt8DYfanRPGLMogz1ZsNcCMrq7by9V4SDp
         tjCMAD6RI/rkTjOiKwLndGJGzP/r2Ci819U9S2VEoKst0Zc1sORnoFAX2IwrG7DNkXnC
         I2zswzY6L6S5lN3g8bD+Wey+B4YjibOeh7rQXtcZS+sovZjOxnanVMILQytE1MozuEd5
         3+OQqu6vx14ijZkiBZ9xs0y0nFOaUMFjnbOd42y7A6WgOZyUB3hXENzdb+8H2hNWhoA/
         HSTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697128865; x=1697733665;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cSKjALH7K6gqrT2RIcyszQs/ymuQ9k0jAbQvHQpJcQA=;
        b=FLz9SUQZR1e71lOPhNRv7BP5p/QYiUon9H+FcPDSf6HKKMFM9U4qzxHZznfpureTjq
         P6yEmwmZ5yk22MsONd1BbtVh/ZyjSnuclY8pjte+xqrO5tGjif9gnutq/q+WHggJpzu1
         U088WHLvQiROcIHJzNTH8ZYbcSs8D5z6CDzQcPy+GjdSNDeI63/Axpf0Flv0evE+Ab4i
         nJBI8YSitbbW+qUIXfDE5jSJ4d/eH1MDg/+yP210RoSWFtjwAZEELgGN4Dw/dq4qfh0s
         KvDoLGnB4ljady7kU1MIC+Zg2g6QYW0+Ift9gLD9jrEa27Xi02LRO3qTg6mPiyKpVZ64
         iGfQ==
X-Gm-Message-State: AOJu0Yy2dqaL++AmUIY7gyxi/3zQkxbyR92HgbyglvPwAVQzr07+MInB
        TFNpaAoFVgiiasZpYTdmEEqttQ==
X-Google-Smtp-Source: AGHT+IGbop51QjWpgXb5pkCyl9/yUmkBYSbumMYF7aG+hEKDNgoq4+8TkErlkAcvF9Oq1e+uxKOYXQ==
X-Received: by 2002:a17:902:f54e:b0:1c1:e54a:3971 with SMTP id h14-20020a170902f54e00b001c1e54a3971mr478238plf.1.1697128864785;
        Thu, 12 Oct 2023 09:41:04 -0700 (PDT)
Received: from google.com (137.22.168.34.bc.googleusercontent.com. [34.168.22.137])
        by smtp.gmail.com with ESMTPSA id 9-20020a17090a190900b002792b7182dcsm2224617pjg.49.2023.10.12.09.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 09:41:04 -0700 (PDT)
Date:   Thu, 12 Oct 2023 09:41:01 -0700
From:   William McVicker <willmcvicker@google.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
        s.nawrocki@samsung.com, linus.walleij@linaro.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, gregkh@linuxfoundation.org, cw00.choi@samsung.com,
        tudor.ambarus@linaro.org, andre.draszik@linaro.org,
        semen.protsenko@linaro.org, saravanak@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: Re: [PATCH v3 02/20] dt-bindings: clock: Add Google gs101 clock
 management unit bindings
Message-ID: <ZSghnUygaF5ReC4Y@google.com>
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-3-peter.griffin@linaro.org>
 <ZScYOUi7qhvGmMIF@google.com>
 <e4523fc3-e1dd-4791-b950-98dfc6dce1f5@linaro.org>
 <CADrjBPpntJMsxb6oGQ7zuX3f0dgE3oYFepL4OdxamBz=_or7kw@mail.gmail.com>
 <21742fbf-8484-42ab-aba1-379305091946@linaro.org>
 <CADrjBPpF3Ta67QzUqyXD1YSFV_kFWqujCxPAjKbvRNhgXeMmOg@mail.gmail.com>
 <67ce052e-ac78-492f-9a36-6947ce161951@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67ce052e-ac78-492f-9a36-6947ce161951@linaro.org>
X-Spam-Status: No, score=-15.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Krzysztof,

On 10/12/2023, Krzysztof Kozlowski wrote:
> On 12/10/2023 12:45, Peter Griffin wrote:
> > Hi Krzysztof,
> > 
> > On Thu, 12 Oct 2023 at 10:36, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 12/10/2023 10:56, Peter Griffin wrote:
> >>> Hi Krzysztof,
> >>>
> >>> On Thu, 12 Oct 2023 at 07:07, Krzysztof Kozlowski
> >>> <krzysztof.kozlowski@linaro.org> wrote:
> >>>>
> >>>> On 11/10/2023 23:48, William McVicker wrote:
> >>>>> On 10/11/2023, Peter Griffin wrote:
> >>>>>> Provide dt-schema documentation for Google gs101 SoC clock controller.
> >>>>>> Currently this adds support for cmu_top, cmu_misc and cmu_apm.
> >>>>>>
> >>>>>> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> >>>>>
> >>>>> Tested-by: Will McVicker <willmcvicker@google.com>
> >>>>
> >>>> And how do you perform testing of a binding?
> >>>
> >>> I guess if William is using my script to build and flash the kernel it actually
> >>> runs the DTC checks as part of the build process.
> >>>
> >>> See https://git.codelinaro.org/linaro/googlelt/pixelscripts/-/blob/clo/main/buildp21upstream.sh#L44
> >>
> >> So it is a build test? We do not consider building as a test procedure,
> >> otherwise I should add my and robots tested-by to many other patches.
> > 
> > Ok so I should only add the Tested-by on the .c patches?
> 
> In my opinion, if someone performs only build testing, it is not a
> testing. You cannot test the bindings other way than build testing, at
> least I do not know such way. Of course other code like C or DTS affects
> hardware so it can be tested.

What additional testing beside building and booting do you prefer at this
stage? I put my Tested-by for this patch because it includes the google,gs101.h
header which is used by the DT and clock controller driver during boot. Maybe
I should have been more clear on what I tested in each patch instead of only
mentioning how I tested in the cover letter?

Sorry for the confusion.

Thanks,
Will

> 
> > 
> >> Shall I consider other Tested-by tags here also as build-tested only?
> > 
> > No. William indicated here
> > https://lore.kernel.org/linux-arm-kernel/ZScZu-QB2LmB4CSM@google.com/T/#mbd96a26b725d6c85eb4193de8cd70ff277bc728e
> > that he booted it on his Oriole device.
> 
> 
> OK, I was just a bit confused.
> 
> Best regards,
> Krzysztof
> 
