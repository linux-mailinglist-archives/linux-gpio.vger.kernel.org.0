Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 932B358375A
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Jul 2022 05:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237866AbiG1DKv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jul 2022 23:10:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237885AbiG1DKp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jul 2022 23:10:45 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E867F1BE9B
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jul 2022 20:10:44 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id h132so467958pgc.10
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jul 2022 20:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Wg5ZrH+inM2dxL10fpBtDAFn80YQ2HbWlRs9YvaR1WE=;
        b=mV5atAR0q+YnkQ1AFDc/lTKgeeFYHws28FShkwifucULtzKSvvNzUC8CmjbR/FoSgj
         o9hVD8I7Ch20ffMdFf6P0bV734XFrrtlJReNkQ3AWv1i7rzyE3OJ9oo21ZAFaWVtUdfJ
         OR0H+/ykYATvTLS4YDU/IAQC/n7WDhmPZV9QqK1GtBatN3iYA63/rBlHstnjJKNYYPRB
         5WBPffoww62A80eF9QaDtNBIOrU+xldbicfUiz+uBflITCVkQDKsfNy8n2RSeddqDfYh
         rRHefUTJ9SK6CJzD4ydZwJrEfpbihSNHgY9b9UHU00CWCGOuZFpNtRa2emLegcs03p13
         qrdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Wg5ZrH+inM2dxL10fpBtDAFn80YQ2HbWlRs9YvaR1WE=;
        b=2h/EiwuoSK+sfE89w/zHKLuT1uleHKKcS6X5QNZutkLA/ePWdpfnvlO4iah6+Jb/Xa
         ZGiDSpiyVlEtbHeFafHj5r/05I3D/6NR6aW8sNIvTlRtb2ofbhjVzTayANYz24F0BbjV
         pmVpaT9ar+tpD5kWMunRn+1YV2RrWvzM62svB9nd+WdZrY06a/23e7xIw+1Swv7fb7Ai
         SrSxUkZgcMhIJsEmOmf0M+LO+xFHAJ2QhKhntV9GOOA/KjYtmTDQAzSfo0cYFlEYFLJZ
         8shZh1WOpOVGjR0YbImWwwlDAiKd+86RcOKtPvXo0R1h4CV6SOJOfXMfsSAf3ejbHu5j
         li4w==
X-Gm-Message-State: AJIora/l0x8wJh9Y++8jWSilpzTV7Lz5b7T1FPsU/8X5inTmDpVG/2kM
        VT23j+uZXKsEnhxJqluFDXs=
X-Google-Smtp-Source: AGRyM1vxj8TxslrrLmEcIAIns/ZKQkkV4N+BcVlMFwlSP/P67Kcf5wxqXocM/mn2EzluonA+JK1D1w==
X-Received: by 2002:a63:4c61:0:b0:416:1e62:953c with SMTP id m33-20020a634c61000000b004161e62953cmr20992496pgl.24.1658977844331;
        Wed, 27 Jul 2022 20:10:44 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id l13-20020a170903244d00b0016dbaf3ff2esm1447833pls.22.2022.07.27.20.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 20:10:43 -0700 (PDT)
Date:   Thu, 28 Jul 2022 11:10:37 +0800
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
Subject: Re: [PATCH V4 4/8] libgpiod: Add rust wrapper crate
Message-ID: <20220728031037.GA15896@sol>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <c3bdcaa85e1ee4a227d11a9e113f40d0c92b0542.1657279685.git.viresh.kumar@linaro.org>
 <20220727025754.GD88787@sol>
 <20220727090701.hfgv2thsd2w36wyg@vireshk-i7>
 <20220727100809.GB117252@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727100809.GB117252@sol>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 27, 2022 at 06:08:09PM +0800, Kent Gibson wrote:
> > > > +
> > > > +    /// Get the edge event buffer size for the request config.
> > > > +    pub fn get_event_buffer_size(&self) -> u32 {
> > > > +        unsafe { bindings::gpiod_request_config_get_event_buffer_size(self.config) as u32 }
> > > > +    }
> > > 
> > > You might want to note that this just reads the value from the config.
> > > The actual value used by the kernel is not made available to user space.
> > 
> > Do you want me to add these two comments for the above two routines ?
> > 
> 
> Not add verbatim.  Maybe work them in.
> Probably should look at revising the C API comments and then just mirror that.
> 

Just to be clear, I don't think we want to get into the details as to how
the kernel interprets that setting, so that is just informational for
you in case you find the kernel doesn't buffer exactly the number you
expected.  The description for the set covers the case where you might
get less than you expected.  But in some cases you may get more.

The key difference is that the C API description says:
 @return Edge event buffer size setting from the request config.
                                ^^^^^^^
which indicates you are getting the setting value back, not whatever the
buffer size in the kernel actually is.
That is missing from the one-liner description, which is all you copied.
So if you are going to condense it to one line then add "setting" in
there.

Cheers,
Kent.
