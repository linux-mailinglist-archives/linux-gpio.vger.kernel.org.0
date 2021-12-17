Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A69BC478853
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Dec 2021 11:04:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234558AbhLQKEe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Dec 2021 05:04:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231968AbhLQKEe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Dec 2021 05:04:34 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24F93C061574
        for <linux-gpio@vger.kernel.org>; Fri, 17 Dec 2021 02:04:34 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id a11-20020a17090a854b00b001b11aae38d6so2258820pjw.2
        for <linux-gpio@vger.kernel.org>; Fri, 17 Dec 2021 02:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nrvl2Z15AsfPSxn/R4yQgzxP2Mg2Jnd5O7FmMsYyfl4=;
        b=SnHI9TKUhEETAE5WFAwgL1wn+cI3YkL5V1muglDGurPHeB4wWy/bSPesi2pyDIf+hu
         Sgt5t/YIpyVjUnC4jC7Ve73RXQionhgNXf+WyQXqf1dtw7TtjA+P9vKNBm5aAI6d9KVl
         aOpFYRRFW7BtXIeR1unRP9VNp6WiuSck0jT9w3xfc2bC3ixPD0l8g3fwVSB9GEMPVWbo
         fxvA4IP7hmcPIeZU76otC5g4OuY3XunZHq5QsjF3KYAtbBzypoPecG3WGBgcXleA+7pP
         RIrBqGRt9iivfkjEgWnevXKR59h5vOH+BOnsfGAvXavoqq4j4tqsw94iPnDwmIkMgQut
         iShw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nrvl2Z15AsfPSxn/R4yQgzxP2Mg2Jnd5O7FmMsYyfl4=;
        b=O9pXt8S3pquUxSJYXy8zjvUywBh4ECt1yjk5nX+fYYmXbgqu5ClCXpVaDv9C/IQeFC
         DfprMlxoM9a7Nuv7rDsc5VtibZv0c7vqOMvP4PaCUXAkbJvW8kSko19JDnwTdBwHTI3n
         NnCs4jHiVk1PPAi19hPt9qcbsEKzasq9KN66XEaZRZgpa84XBPgTAbTc1b44XmKK6/+O
         VmAzvvbqNxnuCx/B6+5+Ii0jXdKKH8DoSb07n9AFshLXL2BdcT3+Co8fbgwjFpFjcWuT
         r4NV7J2eEFoFolo6ew7nx7EeXMJUjOim0yJoCpXl39dYomkZQV2l/iAJTLuCORKtnkOc
         hgPg==
X-Gm-Message-State: AOAM532Tf9WPq5ddovnLNrd7QZ7BegzpXTymY6JodJhbicQwkXAvZW/0
        7snGjw2miC+lv8kTGvM0wklJyA==
X-Google-Smtp-Source: ABdhPJzou1Je/FOAbSXC2kVkCtNS6LlujCRqY+FsMaDsFkEaqj8TfrDjc/GLCnlYVDTlXLzcABjAYA==
X-Received: by 2002:a17:902:e88a:b0:141:dfde:eed7 with SMTP id w10-20020a170902e88a00b00141dfdeeed7mr2492913plg.17.1639735472897;
        Fri, 17 Dec 2021 02:04:32 -0800 (PST)
Received: from localhost ([106.201.42.111])
        by smtp.gmail.com with ESMTPSA id t8sm8234943pgk.66.2021.12.17.02.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 02:04:32 -0800 (PST)
Date:   Fri, 17 Dec 2021 15:34:30 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org
Subject: Re: [PATCH V2 2/4] libgpiod: Add rust wrappers
Message-ID: <20211217100430.iyabqm4dxt7tkhdz@vireshk-i7>
References: <cover.1638443930.git.viresh.kumar@linaro.org>
 <7ace171379783b73a8f560737fd47900ac28924c.1638443930.git.viresh.kumar@linaro.org>
 <CAMRc=MeoTiUOjM_D36ZEU=echpM9jVhr1HY7fuxTDs0t0jf2Jg@mail.gmail.com>
 <20211217050135.l7p3sudbdvzewi6y@vireshk-i7>
 <CANiq72n=i9e5y8ONhZdH72tNuQJp8TJKY2Xa-y4NEpSDOq0+rw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72n=i9e5y8ONhZdH72tNuQJp8TJKY2Xa-y4NEpSDOq0+rw@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17-12-21, 10:44, Miguel Ojeda wrote:
> On Fri, Dec 17, 2021 at 6:01 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > Miguel, what's your take on stuff like this ? I am not sure if we should just
> > drop this check altogether.
> 
> Given the C side documents that the pointer is valid (I think; since
> others are documented as "or NULL" etc., but it is a bit implicit),
> then avoiding the check is a possibility.
> 
> However, to answer this, one needs to understand the risk profile of
> the project, the stability of the C API, the performance expectations
> (e.g. is the call supposed to be in the hot path of clients?), etc.
> 
> When in doubt (or when there is no reason to not do the check), it is
> usually better to err on the safe side, specially if you aren't close
> to the maintainers of the API etc. But since you have access to
> Linus/Bartosz here, it is best to discuss this with them :) And, after
> all, you are already trusting the C side to some degree anyway, and it
> would be good to make sure both sides understand and clearly document
> the contracts of the functions so that no bindings break in the future
> (Rust or otherwise).

And the null-checks are dropped, with an update to SAFETY comment :)

-- 
viresh
