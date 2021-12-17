Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCC984787FB
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Dec 2021 10:43:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234515AbhLQJnZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Dec 2021 04:43:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234263AbhLQJnZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Dec 2021 04:43:25 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A912C061574
        for <linux-gpio@vger.kernel.org>; Fri, 17 Dec 2021 01:43:25 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id fv9-20020a17090b0e8900b001a6a5ab1392so2217499pjb.1
        for <linux-gpio@vger.kernel.org>; Fri, 17 Dec 2021 01:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zUkgYv3UzoCevU14VmPuowaYcr0q/sn06fV60iKuhKM=;
        b=l+pHP7DKOdByStHvxWbHAyTb3kYvl7ueiWKktd6/+KQB8Npdn75ck4Cjqf23z4a1n4
         CWrzoEDNDwMrNgvgBGaAGbw2FOIbSDGGHoRNiWmmeoxRgwi3B92sPFwo579vWF37jdQs
         yUaA6PEBMTfmDqmHIP+dPw5EJznIshtCYWq0g4wWBsrwkKlgbyQaCs7/7E6gfsu1UTgC
         wkXwy1EUEj3DXeLqvpM6qxAVllfO5bXjcVna9LtT4WwIW10MNNZJ0r9GNVkNQG1Zu6m7
         6Cx6Mi+ZDRr8Yz+XqyeRS30AffmDddN/NdpwvROUofu8+bYUhi+wZbNvJsshtCzPF8RO
         UBIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zUkgYv3UzoCevU14VmPuowaYcr0q/sn06fV60iKuhKM=;
        b=b8lxzZ26GGe87I/q3KYsl2bZQz0ECE0rUdFoSWSgCoC1QUOlOLbpG6FVRohYvFMMBz
         A8H6HoQz0Kak4z5ZYtWBN/PFX7tEVpKgnvfblNWb/KCldZhxXTudrnT5mynlqdnBSVeK
         QJwIe9GqNTsN2ynanYLp/Fxk7JDi3857FL1CToiF8sXzcLZSXE3Mfe5U/TJ8K7pRUhMv
         Lc/TWzBe42AAM/g6DKkpZkvo2j0t1zSJdsExep1Vz0+/vVw9M9eOgj0sZZLS6r4IpAsJ
         tLHwZxZlWDEfdpaE6s1aJEryaPgJmMs+6i4JdmEh65wScR8Y3OxlcXLTw9EIIAoh2yky
         wktA==
X-Gm-Message-State: AOAM530GQKN3WjGfcE5WLUZp+2lH0kfzp4wbxhnCtk/1RpYVpv7mHavc
        RXnCtrpHpOcIQVCZGFWtiH5HqQ==
X-Google-Smtp-Source: ABdhPJysZNSlGhOlcBXDqG210pjxXRIs/dbxvj4fzi23QaU3+rzjyvFQqaGv91srGdpSH0zX0t/zyw==
X-Received: by 2002:a17:902:c40f:b0:148:a668:3506 with SMTP id k15-20020a170902c40f00b00148a6683506mr2156477plk.108.1639734204591;
        Fri, 17 Dec 2021 01:43:24 -0800 (PST)
Received: from localhost ([106.201.42.111])
        by smtp.gmail.com with ESMTPSA id p16sm10064985pfh.97.2021.12.17.01.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 01:43:24 -0800 (PST)
Date:   Fri, 17 Dec 2021 15:13:22 +0530
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
Message-ID: <20211217094322.amieymzrzlsgg3ws@vireshk-i7>
References: <cover.1638443930.git.viresh.kumar@linaro.org>
 <7ace171379783b73a8f560737fd47900ac28924c.1638443930.git.viresh.kumar@linaro.org>
 <CAMRc=MeoTiUOjM_D36ZEU=echpM9jVhr1HY7fuxTDs0t0jf2Jg@mail.gmail.com>
 <CANiq72m5g7j=-rzi8dFvGU27Hw8779m-m1QZUy8rCt2szenkpA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72m5g7j=-rzi8dFvGU27Hw8779m-m1QZUy8rCt2szenkpA@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17-12-21, 10:21, Miguel Ojeda wrote:
> In any case, one can also re-export things more conveniently for
> users, so that is an option too.

This is what I have done now, and this is how users access them:

use libgpiod::{Chip, Edge, EdgeEventBuffer, Error, LineConfig, LineEdgeEvent, RequestConfig};

-- 
viresh
