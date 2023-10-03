Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 372147B64D3
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Oct 2023 10:58:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230434AbjJCI6w (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Oct 2023 04:58:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230247AbjJCI6w (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Oct 2023 04:58:52 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4DABAB
        for <linux-gpio@vger.kernel.org>; Tue,  3 Oct 2023 01:58:48 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1c364fb8a4cso5513145ad.1
        for <linux-gpio@vger.kernel.org>; Tue, 03 Oct 2023 01:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696323528; x=1696928328; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7hKyecxYBOnJ1SDJ3VqjkcvNfM9xabaDRFQtv2x6HFY=;
        b=k4vsbu5s87Uqf10OVt3NSP8ytwVbhspRj2+AtHyljVRGaall1/mdQ1qflha5IJ8bGo
         gNIv3hzjGQUStiTcgVXQPsDlSTZUvJp+EjOavjWFA/saX8g9B9OBcAgPefJIBtqLO9+m
         6ODf6bTxqiuEWa8+zOsCityMvD0wg6yh79imW7lACb/JH9IsSH2PrMIFtHyJrndlnqWU
         +JKRGrdQQFUFbGamImDkOI/gwUAadTn1/fUhoIQ54Rh14YmvqsnXWusNWoEmJZafHGQr
         927/+Ze8WmWOZD4g9FnbzRtO/q8W5QTyvh8v1n3E/+rkQmTuDd2mRqePRJ8Wm1acdHEm
         gkzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696323528; x=1696928328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hKyecxYBOnJ1SDJ3VqjkcvNfM9xabaDRFQtv2x6HFY=;
        b=loco9rqM0cWnyLZfa4q2HKNve3zFN+i0oYeX3Uz7WYWWVPBmDmTsQVMYTui1rzG6Do
         haDfd1I2DfEAuMfAwpR6NBwW5sfqnpOA3VpMY2E/xD4olA3AFgJBknb3LfxF+0tZqm6Y
         PurLbgspBrBH2k40p//qp8UuisYsd6/h40j63Qdtm3STFqXyCHDxdD7FUhAM1Q7yjMw6
         129elrnmottHAgrzsPKzwVP/PSGa9YJRDWIdoFRmPln2TuHKBuy1eJypmn24Qk4OCkgd
         I0huSHh6kvevgnWy7R8mRJMDSKHsUVK650pXlHrF0a7QuDsTbpYSKBuHxIao3cb+5mfA
         mHYg==
X-Gm-Message-State: AOJu0YwEjEPZOMGI26z0vPxP0dIuTQDUmNvHFmAPdN4pkjaJpaeEGFzg
        XuYtQBiPA6HdA4eIUhQliavZsQ==
X-Google-Smtp-Source: AGHT+IH+hAiF5Z4fPDCJAurmydG1FRBoMeSn8aVrqnEECdULLXJY5qtJeMBKxwKBtnKq/f4D3hfatw==
X-Received: by 2002:a17:902:e885:b0:1b0:f8:9b2d with SMTP id w5-20020a170902e88500b001b000f89b2dmr16249822plg.29.1696323528240;
        Tue, 03 Oct 2023 01:58:48 -0700 (PDT)
Received: from localhost ([122.172.81.92])
        by smtp.gmail.com with ESMTPSA id p18-20020a170902e75200b001c61073b079sm948797plf.71.2023.10.03.01.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 01:58:47 -0700 (PDT)
Date:   Tue, 3 Oct 2023 14:28:45 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Kent Gibson <warthog618@gmail.com>
Subject: Re: [libgpiod][PATCH v2 1/3] bindings: rust: fix soundness of
 line_info modeling
Message-ID: <20231003085845.5ldq3ghwez3impyx@vireshk-i7>
References: <20230929-rust-line-info-soundness-v2-0-9782b7f20f26@linaro.org>
 <20230929-rust-line-info-soundness-v2-1-9782b7f20f26@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230929-rust-line-info-soundness-v2-1-9782b7f20f26@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 29-09-23, 15:18, Erik Schilling wrote:
> diff --git a/bindings/rust/libgpiod/src/chip.rs b/bindings/rust/libgpiod/src/chip.rs
> index 81e1be6..9ef8f22 100644
> --- a/bindings/rust/libgpiod/src/chip.rs
> +++ b/bindings/rust/libgpiod/src/chip.rs
> @@ -107,7 +107,9 @@ impl Chip {
>              ));
>          }
>  
> -        line::Info::new(info)
> +        // SAFETY: We verified that the pointer is valid. We own the pointer and
> +        // no longer use it after converting it into a Info instance.
> +        Ok(unsafe { line::Info::from_raw_owned(info) })

Hmm, I was expecting the naming to be simplified in this version here.

Now:

Info::from_raw_owned()
InfoRef::from_raw_non_owning()

What I am suggesting:

Info::from_raw()
InfoRef::from_raw()

Or maybe just `new()` routines for both ?

I think structure names tell us enough about ownership here and we don't need to
add it to functions.

-- 
viresh
