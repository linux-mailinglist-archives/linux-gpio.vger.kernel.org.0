Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48792476CFA
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Dec 2021 10:11:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232950AbhLPJLd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Dec 2021 04:11:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232932AbhLPJLa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Dec 2021 04:11:30 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7913C06173E
        for <linux-gpio@vger.kernel.org>; Thu, 16 Dec 2021 01:11:30 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id y7so19001007plp.0
        for <linux-gpio@vger.kernel.org>; Thu, 16 Dec 2021 01:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0bBmUzm0as3OLbndyFlyofK8xxLs8ALB2oAWJJxPOhE=;
        b=yxWWeISm2rHo+YBcukBXjB9i+caN6YYc7f82ST6CNu8zjkrFF8tUXqvCHuE0WBRKMh
         9ZWs6zpfseC00xWKtLdavV3oa+H43U/Ja+qJfmeOC+oxTld+vYkTR12+DFAeB0PGMqPC
         8G8h5suN70st5WnXpyWqKt2hhHonwMityF5pLQYDUCAtS1oofWx6l53JHscwvb20k26B
         WlHLxtVgv9na+6UEHcOeMCxRZznWoIb6X/gs/wGSK1d16paPf48nehJZ1qmQ6qJCVLfB
         w0hooocuHcPfBonViAxE9OtRw6qQv3wLcQOFIP89stBEtMqy4zzEJlzmN4LM1viS/prw
         7/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0bBmUzm0as3OLbndyFlyofK8xxLs8ALB2oAWJJxPOhE=;
        b=FbjqsJM0BZrIU3/qbrf1hcE+EhRLzfjpj8s7Bvoj0JIBnrBsbsRFNN8BGotnxs9fyA
         lrkS+q2f2mxVYH3XJO3ouyauoi2TDH9G+EvS9WjSd86fGcQ4WExK0S7Af70PIgxs9QNj
         FVeamwfHHgDkecLyjnbMuhSfgjhZ7rgOqMIpwXCcWPvFI8gdx1f3Ud49cl0orisir3k7
         gOENTWKBQ/avVBpe4eKA9+e0byDRNqaMojVdEJGnQu132pR3Kiyf+DW7pKzv//Pb/Clu
         CDQpCpK+nyCDxCqzfC9E2BVSki2sUc6N9g1YI8S0fhEKb4hfd6BqeIg6ovUV/9TOedIH
         p7Aw==
X-Gm-Message-State: AOAM533Yj8JNMlnZ1iSoYI3jdqT1EcB+bz6GxVzWCHxjA4fU8cCYpIC0
        j2E6JGC99CnPefVd3tdY/j1UQQ==
X-Google-Smtp-Source: ABdhPJzWhW2mHVViWXQ4Bb/vYvLOGowYzSqqm8m7PVmSAL3Z2ap/hIBsiBQ8y7oR4K2x398UIMxDPQ==
X-Received: by 2002:a17:902:6b05:b0:148:a2e8:27a6 with SMTP id o5-20020a1709026b0500b00148a2e827a6mr8460721plk.173.1639645890165;
        Thu, 16 Dec 2021 01:11:30 -0800 (PST)
Received: from localhost ([106.201.42.111])
        by smtp.gmail.com with ESMTPSA id y126sm4986250pfy.40.2021.12.16.01.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 01:11:29 -0800 (PST)
Date:   Thu, 16 Dec 2021 14:41:27 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Gerard Ryan <g.m0n3y.2503@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [libgpiod] Generated Rust lang bindings
Message-ID: <20211216091127.qg6qqqq4angmiryw@vireshk-i7>
References: <CAKycSdDMxfto6oTqt06TbJxXY=S7p_gtEXWDQv8mz0d9zt3Gvw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKycSdDMxfto6oTqt06TbJxXY=S7p_gtEXWDQv8mz0d9zt3Gvw@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 16-12-21, 18:56, Gerard Ryan wrote:
> Hello,
> I created a build script to generate rust sys/unsafe bindings to build
> safe bindings upon.
> I have not reserved the `libgpiod-sys` or `libgpiod` crate names on
> crates.io as I figured it'd be easier for someone here to manage the
> credentials for that.
> Also, I'm not sure when I'll get time to work on the safe bindings
> (`libgpiod`) but figured this would be a good starting point.
> As for licensing, I couldn't find any agreements or preferred
> licensing for submissions so I submit this under a tentative MIT
> license.

Hey,

Nice to see someone else looking forward to these as well, please have a look at
this.

https://lore.kernel.org/all/cover.1638443930.git.viresh.kumar@linaro.org/

-- 
viresh
