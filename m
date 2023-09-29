Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D5B27B30DD
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Sep 2023 12:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232893AbjI2KuN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Sep 2023 06:50:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232975AbjI2KuM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Sep 2023 06:50:12 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6068F1AA
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 03:50:08 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1c451541f23so113504925ad.2
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 03:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695984608; x=1696589408; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3jjuly2/FgyME3hAhkXC/M6P/XxvHDlqA4LdcYZqegA=;
        b=jEJNNSKPTzR+c7Di4kIMEsDHdqMtepOOJ2lVWK5oCWEbTVifRvHtrJ08cSgbAr3j0K
         7pPJiTo8pdj5Fuf3jVdZTMLERe3uR24nnuw+ENYQbQm1qz8SnNXEq1V8H23X4P34YtDO
         UTcl72fNyrO5W4BP1OE7SRfTSE5Vxff13x5kqGuGJfISu5qZHpYVK2HQJ0ZgAhIBI3LK
         jKBrCnOkICo1NPRkka4twlKzlJ3D5eZ7PlIR4vtCB5Vo7fBnrC0fava+/JZiNu/OMoZs
         HCByP9Oy9lqKXOxvRzqWhNXTMKzl8nCSfgoTjdGCsQEoV2zv/nUKD7rU0sUEPZUgawMR
         Pz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695984608; x=1696589408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3jjuly2/FgyME3hAhkXC/M6P/XxvHDlqA4LdcYZqegA=;
        b=Ct1Ui2QNgZe2L3VuEtuuf94uwuC6QqdKqtjJT9u6gsr/FzQ53bskO31OoGGEX6KwRs
         gvdT+tGYUJ5zROrnNzceUYyqJg2E+CNdv+op58OoQOJHpwQYNrduDnholQ5XLaofYCl+
         /ie2JgJQZChkRw+2qObL9N4nPRFFvTn3m7RTQcB2Dp2PsxXA05EtzdhQfPCT4fw3l6Vf
         HoYrHijZfU2/2Jl3rdupjI6rGJyUR4P5em637nU4R3zwfl9Vo+GUg86HMcL/pkgBF9qD
         7lSprAv1IDa1YYNjSxSjAOZviyr5fU68/QQdK3c4cKnuiun//1GniUszhpnV43BF+TQs
         thtQ==
X-Gm-Message-State: AOJu0Yw+x+Jw+b6WAtkSKyR3EHh9v1B50jY8o8sQw/wnNQ1721XQOjM5
        d4jS7fHmi0H+jRnc8lkSyRjupQ==
X-Google-Smtp-Source: AGHT+IHber1mPnAkjE3nGvrD7pbdmcg/ivlxlos9UfzX7nOaqwhDq3cx33y/DIwbUfzsaKucrcg23Q==
X-Received: by 2002:a17:903:41c1:b0:1bf:22b7:86d with SMTP id u1-20020a17090341c100b001bf22b7086dmr4255661ple.3.1695984607832;
        Fri, 29 Sep 2023 03:50:07 -0700 (PDT)
Received: from localhost ([122.172.81.92])
        by smtp.gmail.com with ESMTPSA id g24-20020a1709029f9800b001b8943b37a5sm5488850plq.24.2023.09.29.03.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 03:50:07 -0700 (PDT)
Date:   Fri, 29 Sep 2023 16:20:05 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: Re: [libgpiod][PATCH 2/3] bindings: rust: allow cloning line::Info
 -> line::OwnedInfo
Message-ID: <20230929105005.hssr5bgs7w5j24j6@vireshk-i7>
References: <20230927-rust-line-info-soundness-v1-0-990dce6f18ab@linaro.org>
 <20230927-rust-line-info-soundness-v1-2-990dce6f18ab@linaro.org>
 <CVUKC1HXG1P8.13XIUCCXN95F0@ablu-work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CVUKC1HXG1P8.13XIUCCXN95F0@ablu-work>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

$subject: s/OwnedInfo/InfoOwned/

On 28-09-23, 14:52, Erik Schilling wrote:
> On Wed Sep 27, 2023 at 6:29 PM CEST, Erik Schilling wrote:
> > diff --git a/bindings/rust/libgpiod/src/line_info.rs b/bindings/rust/libgpiod/src/line_info.rs
> > index 32c4bb2..fe01a14 100644
> > --- a/bindings/rust/libgpiod/src/line_info.rs
> > +++ b/bindings/rust/libgpiod/src/line_info.rs
> > @@ -58,6 +58,22 @@ impl Info {
> >          self as *const _ as *mut _
> >      }
> >  
> > +    /// Clones the [gpiod::gpiod_line_info] instance to an [InfoOwned]
> > +    pub fn try_clone(&self) -> Result<InfoOwned> {
> 
> Hm... I realized that we have `event_clone()` for cloning an `Event`
> and `settings_clone()` for cloning `line::Settings`. Should better
> stay consistent here...
> 
> However, I think the name `try_clone()` sounds more suitable to me. Any
> opinions? I could send a patch to rename the existing cloning methods
> to `try_clone()`.

IIRC, I did try to use clone() and try_clone() earlier for something and there
were prototype issues, as they weren't matching with the standard library and so
had to innovate `event_clone()` and `settings_clone()`. `try_clone()` is anyday
better.

-- 
viresh
