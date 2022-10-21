Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 695C0607484
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Oct 2022 11:56:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbiJUJ4j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Oct 2022 05:56:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbiJUJ4g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Oct 2022 05:56:36 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 677FB19C236
        for <linux-gpio@vger.kernel.org>; Fri, 21 Oct 2022 02:56:34 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id y1so2130557pfr.3
        for <linux-gpio@vger.kernel.org>; Fri, 21 Oct 2022 02:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fv4PzDbw636zCDcO9LjQOAPbNeydEhV3GT/YiXYHoz4=;
        b=NqjMxC7HnzPGBmpDW2SODv8uNac2NGDesz9ZpCqujHsHoQM4x9YaWb/Gl7v9iVkKuk
         S7BJqympYHjUyQfoUwyue7MIKCqZbMEITYLqlTpErAeTwpevY9b+nEkD6/Kq0tA1wnZ0
         ZCbmAc5BUXELnLkl8T3rJLc5dzfzKowSxA6mKNQasiDpPVBip4B1GFtdp9u5GO4Ewr9o
         i8ijuIecr5/M2CM/gPbyZhmY4cqB1A2RxuKf2GsVH/p7v22ZQHKG6LWLDqwC/4unjgtd
         eYx1Lmm44TmP5G6gjSnLz+LFiQTmVwyevXOpagRoVd1lVCaL1uyXMJIQJmm5UFD+J6oR
         3eow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fv4PzDbw636zCDcO9LjQOAPbNeydEhV3GT/YiXYHoz4=;
        b=TqJK2/izVLHgzrxVfhp8lmypGeLreZqf9habEBrhEWo5BDVS3jry1xt2EtjkcRIImm
         mAXgPUizcVIH/usoY7mZhEqiddg5HgkS6NCccU5oG5qf+GLrPV80fK6OaUnQXNERwKmh
         rC2Br0ykF6KeNBpecj1bbywtOivoOlW2TMyR1pwgRRYZzRZKEnzvHtGUOuXPh0v56Lvm
         OKrq/Wi5TKCxJfGVCmqdPjMcz4e36SWjS2CVflZyZtifj/pyVshVAOB5ii7TMjWq2lDu
         bFUfhHw2rbdI9B15vIxTuD9aCUMJKgQD5P5EAcufKIkSVQd0jAll1f2WWzLtLl4cWgN9
         1XEg==
X-Gm-Message-State: ACrzQf0pXCg8uBR41zUrZ6LFg1/5WHB+UflYrKLU/vM4ueLcRs3aQ6nV
        VA8J3qAsuwZh8oQGwFOWDXSOIQ==
X-Google-Smtp-Source: AMsMyM6OR6bmax0pWUvES/ycDCvdeoD+k73fx58YTly2ZAVEEyFKlyAhceuebYkMmP2mQhJTFJofzQ==
X-Received: by 2002:a05:6a00:cd1:b0:563:8df5:2b8b with SMTP id b17-20020a056a000cd100b005638df52b8bmr18544450pfv.67.1666346193911;
        Fri, 21 Oct 2022 02:56:33 -0700 (PDT)
Received: from localhost ([122.172.86.128])
        by smtp.gmail.com with ESMTPSA id q15-20020a65684f000000b0044ba7b39c2asm12938353pgt.60.2022.10.21.02.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 02:56:33 -0700 (PDT)
Date:   Fri, 21 Oct 2022 15:26:31 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V7 5/8] libgpiod: Add gpiosim rust crate
Message-ID: <20221021095631.xjexhk7artb7jaeh@vireshk-i7>
References: <cover.1665744170.git.viresh.kumar@linaro.org>
 <4484ba30efe5dbf09e9a200ec17185479282d1f2.1665744170.git.viresh.kumar@linaro.org>
 <Y01R5NC9IRCb8VSj@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y01R5NC9IRCb8VSj@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17-10-22, 21:00, Kent Gibson wrote:
> > +/// Sim Ctx
> > +#[derive(Debug)]
> > +struct SimCtx {
> > +    ctx: *mut gpiosim_ctx,
> > +}
> > +
> > +unsafe impl Send for SimCtx {}
> > +unsafe impl Sync for SimCtx {}
> > +
> 
> Is gpiosim thread safe?

There is no locking in place at the moment, if two threads try to do
conflicting operations at the same time. Nothing will stop them I
believe.

Though this module is only used for carrying out the tests at the
moment, where we are generating events from parallel threads. I am not
sure if we should make it more complex, for example with locking. Or
is there something else we can do ?

-- 
viresh
