Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 281A97439DC
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jun 2023 12:50:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231393AbjF3Ku0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jun 2023 06:50:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230054AbjF3KuZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2023 06:50:25 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2D5B2D56
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 03:50:23 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-553a1f13d9fso1317148a12.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 03:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688122223; x=1690714223;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cS+hqd1xvKBcodweRc6YKARzfK3Qs34YIhhZpZOLMS8=;
        b=GvXdfkFFd8O/c3fnk0cfUzNr+5JaI1s117mGj8X5qOMVBzUuPo2DHVuF/AMLPXTUQP
         2/AvmehaflOippLMWXrMhODdfsJ8AERRDKmloqDBbXVTVJw2EuOZdu1cW5qiGa8AvlzD
         1BsVeLIChSWqeTjvzjTnWzvdvAY+hBnuzenhjJg9xBRFPjDtN0V0A6SunMD2JSwtH4QQ
         tBJESvy2ucWzJu3koUVkxIRhmEVzoi3dNxWYAE9D/U638UfT5fDvt9tfIEnXAdUyc2Ql
         MjmHNjoUN+aRUol8CTcPQxI47f5A00bT99WRC+0W+ZJZG/tonkVUj2QBnpe/Jhh9OkiC
         NjbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688122223; x=1690714223;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cS+hqd1xvKBcodweRc6YKARzfK3Qs34YIhhZpZOLMS8=;
        b=CyK/fbitAGFwpnn1H7DHBCtcUQD8Gl0ue42kWZ0plqGb59X9cmOvftiLYOjeDJmEzd
         ZhYI8sxUBqqhjTfSh3VHfi7A+rJ/rXuE7RG2cJYXpwKXZMRHxBaXlg7BxIBM0pGHiGFe
         LoObH4pTKCOUi27TVtGXzI6i5ThwWgwRjc1ATnxMjbK4hDJAfuwaOtQqhyxZZqJyiSZ/
         4PfV44n4iwSNbJwP7+bL7Duaw/+yJlLmUg1W6InsUTit6wn7usO8HGjJWlHK3d5DJYZ7
         9acps5phPypkwm2gQEhJcZTjhS3ABT0Kg5OSvYpfqU3bhW/JlyTJTBtiJjUW8dccAov9
         fxOw==
X-Gm-Message-State: ABy/qLZZrFFzpOwuyVlFFmCS8UKqwuVyvqyEZmZRpHqNrE88m/HOefbX
        yu9WYpEzr+6Z5MYKARRbdX0=
X-Google-Smtp-Source: APBJJlHIynlqELUoDUcwqlBFTEIrUkQbin/8Lpjmq9yN4QdYG9Gm4hBGswMzBYjoKj6+xuZIWrctjA==
X-Received: by 2002:a05:6a20:42a6:b0:125:29e5:ae53 with SMTP id o38-20020a056a2042a600b0012529e5ae53mr2519594pzj.62.1688122223053;
        Fri, 30 Jun 2023 03:50:23 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id z6-20020aa785c6000000b00663b712bfbdsm9319999pfn.57.2023.06.30.03.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 03:50:22 -0700 (PDT)
Date:   Fri, 30 Jun 2023 18:50:18 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH libgpiod 4/4] bindings: rust: clippy: silence
 false-positive on iterator
Message-ID: <ZJ6zaq2JCQvMcnTh@sol>
References: <20230629-clippy-v1-0-9ff088713c54@linaro.org>
 <20230629-clippy-v1-4-9ff088713c54@linaro.org>
 <ZJ6bd8+oDbyX06rp@sol>
 <CTPWFHFJNFFA.2SGA858S5QIJ5@fedora>
 <ZJ6sQYctu9mHqQP5@sol>
 <CTPXANU2HUHF.3UJIZX6CQV4UF@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CTPXANU2HUHF.3UJIZX6CQV4UF@fedora>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 30, 2023 at 12:46:11PM +0200, Erik Schilling wrote:
> On Fri Jun 30, 2023 at 12:19 PM CEST, Kent Gibson wrote:
> > > 
> >
> > That is the only test failing out of the whole suite, so gpiosim is not
> > the problem.
> >
> > That is with the latest from the Raspberry Pi rpi-6.4.y branch[1]
> > (a867309b7a55 so a few days old now), with CONFIG_GPIO_SIM so that I can
> > run the tests.
> > Happens to be running on a Pi ZeroW, but I don't think that test is speed
> > sensitive.  I have done a complete rebuild - same result.
> >
> > Are there any distos enabling GPIO_SIM yet?
> 
> Fedora does now (after I asked for it [2]). But it does not support any
> 32-bit ARM targets anymore :/. Can you try reproducing it without the
> patches? I would be surprised if this was related to the patches.
> 

Tried that - same result with libgpiod master.
So it is not from your patches.

Cheers.
Kent.

> I will rebuild my armv7hf VM soon and retry with a self-built kernel.
> but not sure when I will get around that.
> 
> [2] https://bugzilla.redhat.com/show_bug.cgi?id=2215980
> 
> - Erik
