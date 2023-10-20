Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9ADE97D05C5
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Oct 2023 02:21:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346721AbjJTAVM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Oct 2023 20:21:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346758AbjJTAVK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Oct 2023 20:21:10 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C305126
        for <linux-gpio@vger.kernel.org>; Thu, 19 Oct 2023 17:21:08 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2739c8862d2so68565a91.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Oct 2023 17:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697761267; x=1698366067; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AazS8e3mWG6qdiQRzyWIWi2ZxzZq0l/gtqP+3nsv/Jw=;
        b=WqZCMqmcSyy1rLQmtaefCTK6uRQ4dio4L05GwSrJqwEbhbGE2PE+A1FFsX29Mhi1jg
         AfTpC30J3Y80CkDX2VBQkQf7BIF5UInxiPO8uUKtDXkFlaoNVLo08dpDWE0MXkrmWZCd
         BbM3omffNeWLv0SJ8IDvwNqw95Wmn39Ng9WcdRohZzcUrEa12tcCvC26jWj1to7k55Z6
         dOe2Fb0ba9gp47BTmtMFQGvbqsBU7q2f98P46PquD4mBxvDjbPllfssalEe4dvUt+PE4
         jaUuwJEQYeAK1NkpqT8IeJU9iZrIVg6D7VyM6gBlff6dihXjkGn2PPVYb+RetN7ZEupx
         2XHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697761267; x=1698366067;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AazS8e3mWG6qdiQRzyWIWi2ZxzZq0l/gtqP+3nsv/Jw=;
        b=HYmb4XP5JqXiQShruA6Jv+LCw91Xw4RIbPswrY+m6sxdekssODUNfSJP2tsPTPtaOo
         CBctFDdOpqQjBFwCd26/CPYcbeRUwxjmAMt1etPE4SZ/d881t6QJsa2V5Yv3rNTJSbCZ
         ZTIsNMW1cgJVpn2JkCM1+PbeVjFuNiTfsoShx5lXvtsX3jNPmjgVPuULs9ugbB19Orn1
         hwIfA3CkRFFdOxuH0zrDlQlzr3YZKM/hGRAaIPlBRZ6BpNDt39ts6oKMpgVtoz6961Wd
         1r8oXVH5fMMAmbXHHD2Df8QsF7V8r3v1fxgNuOX4GiDtfdIAP9WlT9UhFIyNvdFtjim8
         8IYQ==
X-Gm-Message-State: AOJu0YwOWbE1OYL6lcyCK0GwDLvOayipKEKH3tTiJVt4MnV2AWfQt3Mr
        oeT6kUcb24BtcmxDuVFAgvuBLA==
X-Google-Smtp-Source: AGHT+IGs8jvjaM8tAopk/BiBZwpdGjzq5RLDH6wWLbZD7+wzqgc9cO8iiFexYNATXB3GHDxFUwhTOA==
X-Received: by 2002:a17:90b:33c4:b0:274:60c7:e15a with SMTP id lk4-20020a17090b33c400b0027460c7e15amr461810pjb.4.1697761267551;
        Thu, 19 Oct 2023 17:21:07 -0700 (PDT)
Received: from octopus ([2400:4050:c3e1:100:8685:4bd3:8dc9:1f68])
        by smtp.gmail.com with ESMTPSA id cx3-20020a17090afd8300b0027d1366d113sm2060953pjb.43.2023.10.19.17.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 17:21:07 -0700 (PDT)
Date:   Fri, 20 Oct 2023 09:21:02 +0900
From:   AKASHI Takahiro <takahiro.akashi@linaro.org>
To:     andy.shevchenko@gmail.com
Cc:     sudeep.holla@arm.com, cristian.marussi@arm.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linus.walleij@linaro.org, Oleksii_Moisieiev@epam.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [RFC v2 0/5] gpio: add pinctrl based generic gpio driver
Message-ID: <ZTHH7vwG7hRneZls@octopus>
Mail-Followup-To: AKASHI Takahiro <takahiro.akashi@linaro.org>,
        andy.shevchenko@gmail.com, sudeep.holla@arm.com,
        cristian.marussi@arm.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linus.walleij@linaro.org, Oleksii_Moisieiev@epam.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20231005025843.508689-1-takahiro.akashi@linaro.org>
 <ZTGfXsLc_Z6yj_HB@surfacebook.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZTGfXsLc_Z6yj_HB@surfacebook.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

On Fri, Oct 20, 2023 at 12:27:58AM +0300, andy.shevchenko@gmail.com wrote:
> Thu, Oct 05, 2023 at 11:58:38AM +0900, AKASHI Takahiro kirjoitti:
> > This is a revised version of my previous RFC[1]. Although I modified
> > the commits to make them look SCMI-independent, they are still posted
> > as RFC because I have never tested them on real hardware.
> > 
> > (background)
> > I'm currently working on implementing SCMI pinctrl/gpio drivers
> > on U-Boot[2]. Although the pinctrl driver for the kernel[3] was submitted
> > by EPAM, it doesn't contain the gpio driver and I believe that we should
> > discuss a couple of points on the kernel side to finalize my design for
> > U-Boot. 
> > 
> > So this RFC is intended for reviews, especially to raise some issues.
> > 
> > 1) how to obtain a value on an input pin
> >    All the existing gpio drivers are set to obtain a value on an input
> >    pin by accessing the hardware directly. In SCMI case, however, this is
> >    just impossible in its nature and must be supported via a protocol
> >    using "Input-value" configuration type. (See the spec[4], table-23.)
> > 
> >    The current pinconf framework is missing the feature (the pinconf
> >    parameter and a helper function). See patch#1, #2 and #3.
> > 
> >    Please note that there is an issue around the pin configuration in
> >    EPAM's current pinctrl driver as I commented[5].
> > 
> > 2) DT bindings
> >    I would like to propose a generic binding for pinctrl based gpio driver.
> >    This allows a "consumer" driver to handle gpio pins like as other
> >    normal gpio controllers support. (patch#5)
> > 
> > 3) generic GPIO driver
> >    Based on (2), I tried to prototype a generic driver in patch#4.
> >    Thanks to a set of existing pinctrl_gpio helper functions, except (1),
> >    It seems that the driver can be implemented not relying on pin controller
> >    specific code, at least for SCMI pinctrl.
> > 
> > I will appreciate any comments.
> 
> Any comment here: I'm listed as a designated reviewer of GPIO patches, why am I
> not Cc'ed on this?

My apologies. I will add you in Cc.

> I definitely have some comments against the code (no DT,
> though). Please, use (up-to-date) MAINTAINERS in your v3.

Please don't hesitate to make comments here on v2 so that I can
include your reviews in v3.

Thanks,
-Takahiro Akashi


> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
