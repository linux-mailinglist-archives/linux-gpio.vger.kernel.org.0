Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAC3F5876DF
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Aug 2022 07:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232759AbiHBFrU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Aug 2022 01:47:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231804AbiHBFrS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Aug 2022 01:47:18 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20BD619C23
        for <linux-gpio@vger.kernel.org>; Mon,  1 Aug 2022 22:47:17 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id f65so11474002pgc.12
        for <linux-gpio@vger.kernel.org>; Mon, 01 Aug 2022 22:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DfCsR6KF8bgbXXbV10avlnLe+p1TMoNPoIp5imq2S20=;
        b=YFT16QVrkwWsSHAQnL5/kZF6f/uc1qkcLoaPlMZdIbPHYFpmR6zGUKKVhm+TfWFIUs
         W0RiedjzEcxfHlOJh6FWnrGuiyzPSBYuNJfc/6sbi0W6IXsV7QmmHd0XOE9JaZSDBL3S
         /Xmue8/NmzzwEEJBNm8g4TwTJBorpTMIuIwWCKG5ifP/frGKnwRPSA5/Ge1sN5GRhQQn
         +rQBoZJQudzR/sS4frPrlnHMk8a5JcBKqujCAwhQrxvxTfoOgR4DOlzykZXWqCi0JL48
         W12moKusMgZsI9LZuGjpSAadoYUyln4vwUXK+r1rWidmVVqtSMA3KBSS924J3mc0hHIH
         zDnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DfCsR6KF8bgbXXbV10avlnLe+p1TMoNPoIp5imq2S20=;
        b=7z+aYBMncHAMUvmARmq41aKZLHLVMU1bqY6ZTB0HSydRIZgr1bzC8Z8KAljitSM1BU
         93y6Yx0eXyrGM/FX1tioaXQ1arWCDpE/FdbEKyIewTZCsOYUreGmucT10mYNq1z/AaP8
         BbqZnWGr2b/l2nNk8oTAJsBDItNDre3SKn6BPtdhFatulwZDKWmjZZKPUynj7MLmu2Nc
         TN3C7L8mE2iwJO99rSYRJ2uz04bOBFq1f80NYaVJeRAHruRKhWmJWHCJDegbxvQLLS6x
         1s+REFGzmt/F1Qxvd9yg4M5Qjo1F503AyOEiy2wc1f+I+q8vn64Fcc7JMQYv5wzhCBqJ
         pNzA==
X-Gm-Message-State: AJIora+Q/fdDGrzoreSQFONyEKDFQlbPv3UgT5PSKPI3ZOm8kH+sfppE
        GpStytnU6gwBME+MLWl/eDM=
X-Google-Smtp-Source: AGRyM1uHbZumyd1gDo7BK+u49jSKA3blc0R07K0lTpcAXDNMOij0AkJPFhBK5I3ktsONtfeDH8t9ng==
X-Received: by 2002:a63:6c06:0:b0:419:ab8e:e177 with SMTP id h6-20020a636c06000000b00419ab8ee177mr15388621pgc.188.1659419236478;
        Mon, 01 Aug 2022 22:47:16 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id u3-20020a17090add4300b001f260b1954bsm10122274pjv.13.2022.08.01.22.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Aug 2022 22:47:15 -0700 (PDT)
Date:   Tue, 2 Aug 2022 13:47:09 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V4 7/8] libgpiod: Add rust tests
Message-ID: <20220802054709.GA22973@sol>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <78b3ee21dec2a66003c2eae2800e9699a8ecd180.1657279685.git.viresh.kumar@linaro.org>
 <20220727025847.GG88787@sol>
 <20220801115402.uk4gsptesrisohvk@vireshk-i7>
 <20220801123806.GA42433@sol>
 <20220802054434.prvmgvv6hklilbfq@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220802054434.prvmgvv6hklilbfq@vireshk-i7>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 02, 2022 at 11:14:34AM +0530, Viresh Kumar wrote:
> On 01-08-22, 20:38, Kent Gibson wrote:
> > The request_lines() could be considered sufficient to test
> > the conversions for both request_config and line_config objects.
> > 
> > But testing request_lines() and reconfigure_lines() doesn't just test
> > those conversions, it checks that the functions don't mess with the
> > config along the way.
> > If you want to take that as a given then sure, just testing the
> > config variants for request_lines() will do.
> 
> Okay, so we want test setting various flag types in line_config and
> then see if request_line() fails or not and verify (read) them later.
> Right ?
> 

Right.

Cheers,
Kent.

> Very similar to this is also done in tests/line_info now, where you
> suggested:
> 
> "Test that you can read all supported values for all fields."
> 
> So I set all possible values for fields and then read them back.
> 
> Lets see after the next version, if they are sufficient or not. I will
> happily add more if required then.
> 
> Thanks.
> 
> -- 
> viresh
