Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89A80478461
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Dec 2021 06:11:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232082AbhLQFLg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Dec 2021 00:11:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232041AbhLQFLf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Dec 2021 00:11:35 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C60C7C061574
        for <linux-gpio@vger.kernel.org>; Thu, 16 Dec 2021 21:11:35 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id y7so916407plp.0
        for <linux-gpio@vger.kernel.org>; Thu, 16 Dec 2021 21:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KP/o70ExsCE5urrYGfhpfRv8wAIOqUS/S0xqGksvIqM=;
        b=wdSoNagykpgIejPFYIZS/cf02Zgip85AOI1gdVmnu/kJKrEKYrX3bgMBsoQDNxWgM5
         5Zvdr4NZS2vww59tWqRTOml1vnAr4yTmOSpKsBB0eYy9QI580RRFQYq34BtCLPLJguS2
         t+us1d3lWik6TKhgPimSLETkYGRz8pslQ4CfBMmbkknaYMsFmsoQORNwWx6PFBXev5yr
         joSLFnwbe22AU5Rszb9GpXbmvGwh+26zYhOmCrxSfycxhQvB7hocmJ9n+CIMrFSv5b49
         03AV99wBfoMr5qIX7wOzHmvhS6D2BjjNWL8o0k3qj5PsJ9gyDX9frm9jRDsXtF6uAWeK
         dK/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KP/o70ExsCE5urrYGfhpfRv8wAIOqUS/S0xqGksvIqM=;
        b=nuHTgkclaox+D4LCp0w23YuzE8Wb6c1hA40o2KgbiKIZJyR0afezq3Bt0gP4IqJgm+
         vFq6eFplamV+P+NNOcwNXTa4jELa3B4JzzMmYwjBCPKN4kQHCWPEHLCSxEq/qzp7OpIz
         Hw3bD2PTp7vPS8Ix5Lc1sVGT6/togjwvacMygoyzuHzJAzLgXYODNEl84S8oGRPrOydg
         2aJWCU4BYgsQnbaeYPQfjCk1jXQ8B6OiK6jk0roKed+EkoJHUBteMTRdQu+zlZPt3cO2
         TvHY9f+fqOvbG4eSBOigHotmdtWJFBbZWbhDXcyKfL4TTUk7qseyhVbhp16l7bYJm/bu
         uRbg==
X-Gm-Message-State: AOAM532OfnBV7u/vU935HUSpfpeGOjIOh9DMDoaYURUo1UT4z7U5OwX8
        qX4FurqDklBHOmiI4en+7koxbg==
X-Google-Smtp-Source: ABdhPJxNGK2V4ytdKul5F1hHpJQe6QTYO8KQEAgr4CjKE+Auffj6f2P5iDjachTvsSpmlUJg7YRz+A==
X-Received: by 2002:a17:902:bf4b:b0:143:aa96:f608 with SMTP id u11-20020a170902bf4b00b00143aa96f608mr1305476pls.23.1639717895340;
        Thu, 16 Dec 2021 21:11:35 -0800 (PST)
Received: from localhost ([106.201.42.111])
        by smtp.gmail.com with ESMTPSA id u10sm952681pfm.58.2021.12.16.21.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 21:11:34 -0800 (PST)
Date:   Fri, 17 Dec 2021 10:41:33 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org
Subject: Re: [PATCH V2 2/4] libgpiod: Add rust wrappers
Message-ID: <20211217051133.c6pipmhxxysyxdrx@vireshk-i7>
References: <cover.1638443930.git.viresh.kumar@linaro.org>
 <7ace171379783b73a8f560737fd47900ac28924c.1638443930.git.viresh.kumar@linaro.org>
 <CAMRc=MeoTiUOjM_D36ZEU=echpM9jVhr1HY7fuxTDs0t0jf2Jg@mail.gmail.com>
 <20211217001207.GA6287@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211217001207.GA6287@sol>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17-12-21, 08:12, Kent Gibson wrote:
> I'm of the opinion that a rust implementation would be better targetting
> the ioctls directly rather than libgpiod, as my Go library does and for
> essentially the same reasons.

I remember asking Linus initially about this and I was suggested to use libgpiod
instead :)

> To test that theory, and as an exercise to learn rust, I've been writing
> one, and so far I've been calling it gpiod :-|.
> 
> Since this crate targets libgpiod it would make sense for it to
> remain named libgpiod.

I agree.

-- 
viresh
