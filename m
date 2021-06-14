Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5511A3A5EEF
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jun 2021 11:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232594AbhFNJOj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Jun 2021 05:14:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232528AbhFNJOj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Jun 2021 05:14:39 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1893C061574
        for <linux-gpio@vger.kernel.org>; Mon, 14 Jun 2021 02:12:21 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d16so10059936pfn.12
        for <linux-gpio@vger.kernel.org>; Mon, 14 Jun 2021 02:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4yyICwHMIJCbXq2c7BEGBVunI5RWt4gLljDerJ9bJhA=;
        b=ET+yJ2YpQh1nx70SZ+2L3LmRnVHxt0PqmvwWpzaonmZgwK4v58J+iDsJArycAeunGg
         tKgrNB2bx3GXCj4hriyFV3gIyPygHrpBHUbvrpyBJx0c+pLO24tErnSVRq/ELWYzqPf7
         wFHnJZzy8YFgD4BOv+2lw0abWp1Zja88mP2l5qzb7AemZVmlcJwIDfsqwA47CKvxPEZX
         +I9XRGd6O22GfnSveAE7svaFLPZk+JTEP2fIzFbkLcVBK+NzeGZEgz8lh+JI/O+XZRn4
         5JcTugxdxoBehzQMuVxsBu+CLmUBV38tQqd7r6WFQa+9Bx2Cm/L3tjvZ9BCBzNQJvQ+T
         HQUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4yyICwHMIJCbXq2c7BEGBVunI5RWt4gLljDerJ9bJhA=;
        b=csqawAI+rYfkj30WL3IW18J/u1JdWHJyuzXQDtIlVie2icoQxxLCOqFlWayIPZ0Gsa
         wi5s+lVRSIpzl038ybunRU0i589+EjAVSLQmJP1JdwKweyl1qaEVFgbLq7S6N0WNRtlb
         ZGPMLf3g64ZY7NtvSgQcPGB+q9bVs2Wcw3fsvnRgWXh96bdJKO2BbegBQG7h8GFgczh7
         vXiO4g0/ymn6aQhf9syGbMOCKlS6XMFi++LpV3dF1q1IJLe4vXYxFTOjbVmt8MUMQ32r
         nnHGbR1Rxr1k3FCj9lxp4198741OCXVpuMLXqkn68LoSBGkJadKUpj1RaiRM5C1iFJ5a
         LS5w==
X-Gm-Message-State: AOAM5324UrMzli7GINuYkF54NLMkiInPQLn7F7couokaDeUaH3vvv7K9
        xsoszzo1CPTtC/bwh6YXJDxwRg==
X-Google-Smtp-Source: ABdhPJzowyA4WkHFIZhVs8SkkNub47xJidNz0hMfmu9V1ygHyOQLgkMNrgUWSu8Xb77+wTBgpgZOOw==
X-Received: by 2002:a62:e404:0:b029:2ee:f086:726f with SMTP id r4-20020a62e4040000b02902eef086726fmr20669526pfh.7.1623661941123;
        Mon, 14 Jun 2021 02:12:21 -0700 (PDT)
Received: from localhost ([136.185.134.182])
        by smtp.gmail.com with ESMTPSA id q23sm12331418pff.175.2021.06.14.02.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 02:12:20 -0700 (PDT)
Date:   Mon, 14 Jun 2021 14:42:18 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        "Stefano Garzarella --cc virtualization @ lists . linux-foundation . org" 
        <sgarzare@redhat.com>, virtualization@lists.linux-foundation.org,
        Alistair Strachan <astrachan@google.com>
Subject: Re: [PATCH V3 1/3] gpio: Add virtio-gpio driver
Message-ID: <20210614091218.mj5hdx4xhy4vho5x@vireshk-i7>
References: <cover.1623326176.git.viresh.kumar@linaro.org>
 <10442926ae8a65f716bfc23f32339a6b35e51d5a.1623326176.git.viresh.kumar@linaro.org>
 <CACRpkdZV2v2S5z7CZf_8DV=At9-oPSj7RYFH78hWy3ZX37QnDQ@mail.gmail.com>
 <20210611035623.z4f2ynumzozigqnv@vireshk-i7>
 <CAMuHMdVrtSnFpPbB0P3Wxqm1D6vU1_cnh3ypsZJRNF6ueKdAsw@mail.gmail.com>
 <20210611080122.tlkidv6bowuka6fw@vireshk-i7>
 <0478822f-9d10-deb8-86ae-3b4ac3bb0c6c@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0478822f-9d10-deb8-86ae-3b4ac3bb0c6c@metux.net>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 14-06-21, 10:07, Enrico Weigelt, metux IT consult wrote:
> On 11.06.21 10:01, Viresh Kumar wrote:
> 
> > No, QEMU passes the raw messages to the backend daemon running in host
> > userspace (which shares a socket with qemu). The backend understands
> > the virtio/vhost protocols and so won't be required to change at all
> > if we move from Qemu to something else. And that's what we (Linaro)
> > are looking to do here with Project Stratos.

This is one of the ways of using it, via a backend running in host
userspace, maybe there are other ways of making this work which I may
not have explored, like handling this within qemu.

> Note that this is completely different from my approach that I've posted
> in autumn last year. Viresh's protocol hasn't much in common with mine.

The protocol hasn't changed in a sense on how it can be used. Yes few
things have moved around, new operations were introduced, but nothing
that will make a change at this level. We are trying to use the
protocol in one of the possible ways and yours can be different.

-- 
viresh
