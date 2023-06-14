Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E789472F7D4
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jun 2023 10:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243523AbjFNI30 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Jun 2023 04:29:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235164AbjFNI3Z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Jun 2023 04:29:25 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8476C11F
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jun 2023 01:29:24 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-652699e72f7so4917111b3a.3
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jun 2023 01:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686731364; x=1689323364;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lNxa0d2dSOK/pgTguPvMGi/cxzsGDb451qUivRi///Y=;
        b=Yw/ZF73j9E6QxvjUEwI0pJbjTZujw+K+gcQSvvmIRCvDPjskaqTAaGo7OOFI47xRs2
         KW5xQmMmGaljXNiA70UxY14DbyoxkA1djkRPSf4dX4EFO8akcvOg9Q0X29ekPO1Nzdcm
         j4OXTTmFHEDhmg2cubHEbseM0/82sOGJbR8JQXs4YeSZLu2ogUAPiKn+oECtKXaqaGi0
         r462nV79S3ICSZqiIt9a8ADOv/I2iT0CKfZYus8euORleSQKD3F6s3gzLxYBIY7vW+Tj
         NTIZLkP9GqX2UouHcyszNZNwuFaBPbMeemJtPg/nX/hCpLaL4k2TBMjGwEE8/nsXgJvX
         ROUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686731364; x=1689323364;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNxa0d2dSOK/pgTguPvMGi/cxzsGDb451qUivRi///Y=;
        b=QYA38A2YyTwmOsJwFoNFbUvSabN/kEY1VzfVj++Zq0QkITFvtwaDVoNae8DbvWcWct
         ewJvPFNHbRdfrxwRAqLPtxK6CyAEdyz2Vx0uFTA44amHnNRS99zsviJuFa59hXcDpeez
         s6jFsEJC7jUNss9CNJwVO5MaE9Qg1GMUgaJGnyNn5L1iL9nMe/QiJapU6GDGcRMZalc4
         kgUFKnj8yBYOtnBJ6FT+rue2oGZ0L21HIiiF2o7nGGFKeDu1QtVo+r/i8qGVJtUCprI4
         5D1ngZdsaHYeIivvm9hTZBvW1sG20Ngjr1lZh6GWBpjHbVw967nGkZ0KNQGp3abe9A0W
         SVXg==
X-Gm-Message-State: AC+VfDzqybMepoaFvkSXvFlm3kTIYkmmmquU442F6c7UU7ZIGBybGXTQ
        ftQVoovwgCTv3ylytaS2pHw=
X-Google-Smtp-Source: ACHHUZ4/ArXz/zE42RDzHQxlbDh7mPEi7L+BNzTMip8hwuR6or/YePF99j8I46pKSSIMeXQLL48VvQ==
X-Received: by 2002:a05:6a20:918f:b0:10f:f672:6e88 with SMTP id v15-20020a056a20918f00b0010ff6726e88mr1061058pzd.4.1686731363908;
        Wed, 14 Jun 2023 01:29:23 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id x25-20020a62fb19000000b0063afb08afeesm9882907pfm.67.2023.06.14.01.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 01:29:23 -0700 (PDT)
Date:   Wed, 14 Jun 2023 16:29:19 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Subject: Re: [libgpiod][PATCH] bindings: rust: fix clippy lint warnings
Message-ID: <ZIl6X8YAUHS/n5s8@sol>
References: <20230612154055.56556-1-warthog618@gmail.com>
 <CTC81IMWHW2L.28NQLXAIFP60L@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CTC81IMWHW2L.28NQLXAIFP60L@fedora>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 14, 2023 at 10:14:08AM +0200, Erik Schilling wrote:
> On Mon Jun 12, 2023 at 5:40 PM CEST, Kent Gibson wrote:
> > clippy from Rust 1.70 reports a host of warnings due to casting and type
> > conversions across the FFI interface to libgpiod.
> > These casts and conversions are required to support old versions of Rust
> > that do not support recent Rust FFI extensions.
> 
> Could you elaborate which extensions are relevant here? Would it be
> realistic to just update the minimum Rust version instead of needing
> to include these suppression directives?
> 

Types were added in core::ffi[1] in 1.64 for just this purpose.
e.g. c_uint[2]
Though c_size_t[3] still remains in Experimental.

And I guess the clippy lints followed soon after.

Wrt setting the MSRV, but I assumed not, hence the allows.

Cheers,
Kent.

[1] https://doc.rust-lang.org/stable/core/ffi/index.html
[2] https://doc.rust-lang.org/stable/core/ffi/type.c_uint.html
[3] https://doc.rust-lang.org/stable/core/ffi/type.c_size_t.html

