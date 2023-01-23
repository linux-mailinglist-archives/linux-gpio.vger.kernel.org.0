Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B39E67763F
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jan 2023 09:24:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbjAWIYs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Jan 2023 03:24:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230122AbjAWIYs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Jan 2023 03:24:48 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BA15196A0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jan 2023 00:24:47 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id d10so8361237pgm.13
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jan 2023 00:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bn3yUjF9c0jKG/gSmvhhgiJqpHdO7QBFwGnsSULH1+k=;
        b=ixucxIV5Tz1fEVTaxg7GDqOgnEDxu0oY/Z+4GNbF0hZ6W//CqDc2EhABy6AWheZDAX
         7PKsC+IE0wlO+ossafzPfD8q6Cw+/+Ek0zvN30jfRa2s3hTdUGptViMHRmsaKPP7/aFo
         pcMYEjfk/RogautO+Hw3Yas+h7Ko9aGgO/UkCZHeEaiLVYs2vbxSWB1rQaK/GuY4NVx6
         dQ2aLH5MrBsHtTs9JngnvIKfn1TzxbH9npmAbFyP0lsQrC4MllDL9EN3CtTANy0vewXC
         5kzVx4U6DQN9xvMR0sQ0RjMzMoSgfdK56O4xZeW5PC90UvhWdXYFuVQ5Ms+K50gsrCL0
         yUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bn3yUjF9c0jKG/gSmvhhgiJqpHdO7QBFwGnsSULH1+k=;
        b=GUSS2YJ/ESc7vzMYwut5LDmVlBPFC8ZGqz8l51VjSh6i1TY5qY0lHDTkZfbCJQA91l
         I8MQIW/0IXH2R9uEVd6Xw5oN6L8Rdt5vepToPqAxAFsGbqtpjlMvf275VWi2q/4tOYEu
         y/E7OkILxgiC2DXbQYcG8s9VLdXkUIEBqSJGfpK8xUhOz1f1TJDfgzLk2A/P35Ku++KZ
         j+yv3nNUKWmedSMgNmFS/3DqL09NJc+A2NIaAufaRGoEFIWmumg6LzG4NGbh8AP6yFtm
         EPpcTyJD1BT3zyvrC9PV+/rFcv/L/67yjVT+BuJ+7SoTLp8fReLeT6C1X/MqFjnlPjSX
         J/2w==
X-Gm-Message-State: AFqh2krRCurnrEeJQJmc7ssfAuw5KuY2tQ1+mkjHtNue/4JIfP5SymHR
        Xd9kQOFs2Jlecx7aYxVXABIfhA==
X-Google-Smtp-Source: AMrXdXtgB+5337s5SodVAR+LoDHMXmPeQxHatQ5mXMeEdCSW6yYeBWb0VLNQUcSLPekK6bCQVxdzOw==
X-Received: by 2002:a05:6a00:181f:b0:58b:d244:b525 with SMTP id y31-20020a056a00181f00b0058bd244b525mr35990138pfa.17.1674462286272;
        Mon, 23 Jan 2023 00:24:46 -0800 (PST)
Received: from localhost ([122.172.83.155])
        by smtp.gmail.com with ESMTPSA id k19-20020aa79733000000b0058d90bc57basm15940787pfg.90.2023.01.23.00.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 00:24:45 -0800 (PST)
Date:   Mon, 23 Jan 2023 13:54:43 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 04/16] treewide: unify
 gpiod_line_config/request_get_offsets() functions
Message-ID: <20230123082443.xoexegmii3bnco6t@vireshk-i7>
References: <20230113215210.616812-1-brgl@bgdev.pl>
 <20230113215210.616812-5-brgl@bgdev.pl>
 <20230116055209.b6ydvderreqtqedp@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230116055209.b6ydvderreqtqedp@vireshk-i7>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,

I gave few comments here, and it looks like you missed them ?

On 16-01-23, 11:22, Viresh Kumar wrote:
> For Rust changes, please run these as well to find any formatting
> issues, warnings:
> 
> cargo fmt --all -- --check
> cargo clippy --release --workspace --bins --examples --tests --benches --all-features --all-targets -- -D warnings -D clippy::undocumented_unsafe_blocks
> 
> On 13-01-23, 22:51, Bartosz Golaszewski wrote:
 
> Just like ValueMap, maybe we can add following in lib.rs for this:
> 
> pub type line::SettingsMap = IntMap<line::Settings>;
> 
> > +        let mut map: HashMap<Offset, Settings> = HashMap::new();
> > +        let num_lines = unsafe { gpiod::gpiod_line_config_get_num_configured_offsets(self.config) };
> 
> This needs a SAFETY comment. Should we check if this returned 0 ?
> 
-- 
viresh
