Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8DFC63839F
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Nov 2022 06:49:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbiKYFtP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Nov 2022 00:49:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiKYFtO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Nov 2022 00:49:14 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4303928E06
        for <linux-gpio@vger.kernel.org>; Thu, 24 Nov 2022 21:49:13 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id w79so3253976pfc.2
        for <linux-gpio@vger.kernel.org>; Thu, 24 Nov 2022 21:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=epU8gmFMYytITwVWYcw7KpHF0EcrsfpkBnnMDNUw9Qw=;
        b=e63ONEE8bfZ3KHiPj18+Q2H7/lIpjcGDbmtu2JzqekA+dsLDU6gdVkhCQGvNuDe/wP
         +obDGmL2y6AXN7HnANt19fjPj49yThNtsBSnV+nAH0xjLtSvYyunlDsyv3tcxFaqJS57
         T/8Z6qnCq61LaZ1GJVK1oHXpvDNjz/oRYJVX+pEqX8JukIDYWj+utSTNJWgk97wu3xnZ
         +x1sa41SCGbgIAQhVEjOpKwF+3ydW0jTNbJD8bwuL7rTMX6+jy3UF5XxIhLK0kF5QM0U
         QjjBR5rNZz67HR+u+hPP5NWRlDRV2+SGXksGJdCKYGCggU2HL9Jp+X1U4Ym8cgF91LUf
         KyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=epU8gmFMYytITwVWYcw7KpHF0EcrsfpkBnnMDNUw9Qw=;
        b=bT/t48NkYrWf1k5uV4AJ0o2dqaJ27EPO6OxtgkSk0NhtM3ch1YiwnSVob1RFbKj+xF
         91FMcnOeTtirFEmjJmjtAtZh1SyI+2slwUWkqkHgZIpuK9sbRlqyuGZve8qep/oHjMKG
         azeQvs6GGfsQpNqNsmL/5Is3sDxoEj/ImA7qzmCBhOf5xzi2HlCP1ssevAj4J/hCcJpd
         e7QDaWnDfQeFYqO7VBuU9lxPJfHAEOmCeloLr3P8hAzWX7LiW/YVN6hrcH16B+eNp14p
         B/LMlFRLI3ztz9gG9EL+/G4e8kjgAlfOFBQhyWkGfGsQJpi5VCSFkbL6pBdHn+/aBKIB
         jdyg==
X-Gm-Message-State: ANoB5pkaB1ezycKK5W2jkzLqYx+jzYhpXmXHv2npJoyZUfroCeM037h6
        qpr3RnKvBXVM4ytS5A5WbG9dCQ==
X-Google-Smtp-Source: AA0mqf6jBBifiMfR4O3YSK6w7Z1WdioaMQ//9gGwEbqySk9HJPx/kDXjEtLvkq6U3JWbOEVPjcDYgw==
X-Received: by 2002:a65:4607:0:b0:477:31bc:348f with SMTP id v7-20020a654607000000b0047731bc348fmr17127565pgq.72.1669355352663;
        Thu, 24 Nov 2022 21:49:12 -0800 (PST)
Received: from localhost ([122.172.85.60])
        by smtp.gmail.com with ESMTPSA id b7-20020a1709027e0700b001869394a372sm2321703plm.201.2022.11.24.21.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 21:49:12 -0800 (PST)
Date:   Fri, 25 Nov 2022 11:19:10 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: libgpiod: rust bindings and bindgen issue with C enums
Message-ID: <20221125054910.aqapfnnk7wq6ezts@vireshk-i7>
References: <CAMRc=Me-LcGx1GUFZ3NnxvbW=wcKnpJ+jpDHjYb+20+_7gSCfg@mail.gmail.com>
 <CANiq72=vU1inYDgZJR1ukKkQF=Pj93eD3=Cw6iFE+8xf_+Brbw@mail.gmail.com>
 <CAMRc=Me2hHmEohYwCvnrKVhxNSHts9wrtNCRMp4neBu1AcZnOQ@mail.gmail.com>
 <CAMRc=Mf=ZbVJQJU0QkBMoRUFp1DrV1BJ0nVFn62jd6YMq83HNg@mail.gmail.com>
 <20221124104501.2bfllqmpfegdcs3m@vireshk-i7>
 <Y39yackN2u7q2Fxs@sol>
 <CAMRc=MdUTXVV1tzvFdU8c9B_CeHjYB77A-EW4gSoK+VG8PbB_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdUTXVV1tzvFdU8c9B_CeHjYB77A-EW4gSoK+VG8PbB_A@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 24-11-22, 15:27, Bartosz Golaszewski wrote:
> In that case: Viresh: can I include your changes in my patch (giving
> you credit as a co-author)?

Yes please. Thanks.

-- 
viresh
