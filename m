Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EAFB4FB269
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Apr 2022 05:34:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240392AbiDKDgE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 10 Apr 2022 23:36:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238812AbiDKDgD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 10 Apr 2022 23:36:03 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 322322AC57
        for <linux-gpio@vger.kernel.org>; Sun, 10 Apr 2022 20:33:51 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id c12-20020a17090a020c00b001cba1ebb20cso714256pjc.0
        for <linux-gpio@vger.kernel.org>; Sun, 10 Apr 2022 20:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ReP3a8cEKT8nv+Y7WWH4UmOJoBGVyEgvolBr0WXkxmc=;
        b=rjskXEqlsI0fiwe8xupYXDdBkdDmZt98SobZd8jfWI81Kv+NFeWVMk2YvdKmWuYmTB
         pNp9Zy1+8TtnCX7wNRYnHM+kzyb12JTcLgKRCUiimiuWFGYgPcWOz8twiT1nc9w9EZOx
         +T+cu24SiKy3qLc9SYbPUUVmARBKwK4+JNNph9RWXKF324owIcFzc49Jj1rw6FbD/AaC
         IDZHx9V9l9ZBUzjQUjj0jq2wNZkUfSQBHYrhZxwJ4QDSvTW84+k6RtV6CXBO8fYBwhqe
         ULiyUROXIx2xsBbqfJrK5kePkUnvVaKUyqm0lDGl9v/6xip2mrTFTzrXDykF+26uVlrb
         HUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ReP3a8cEKT8nv+Y7WWH4UmOJoBGVyEgvolBr0WXkxmc=;
        b=HTc/jDY+EpdomRrzRyzc0GZjWWje9ZoUDyx0cyq46tTVLHfBTIpcxlzlGolnvh2ZrA
         wzNlhWWh0XAE1cQvxqmavs/QzuqHsUt4xCxY0xlqc/MKVL8/U8X7wEQkVGjhDE9PA8M6
         SAtm8pzLnYB40uGkxOgDElMCZXdYUUnCS3HqmO2d49pRcK+Tprm7l7Nhm6qL1YIoamyb
         eA5wPVsDbltIkN1I+zF2McEWkQ325uv71Pk9QFAa3fZIHs0bQLCXcXAm2ed3COOMkoBV
         TMX7ThrrROOFUG3hFyk9Mw3Odr9iptblInaQF+TBPorq5foR9RVC5aYp0R3wU1q8Tf1F
         yLfg==
X-Gm-Message-State: AOAM5307JU1pYsnZ2XlGTmIG5y3ncKINK6y/dppq9a6iq2RrY5bvo6fy
        GRzlsG0kDNRRNT7lZgMOXl32zKttG+MzRw==
X-Google-Smtp-Source: ABdhPJz4LXNwXg8egDX2jKsYyyTAADvKFoNZUDqvS6rDVtTGCWbaTPw9sTQl6zudRf6mluH74TR23w==
X-Received: by 2002:a17:90a:5146:b0:1ca:75b8:7765 with SMTP id k6-20020a17090a514600b001ca75b87765mr34442339pjm.86.1649648030589;
        Sun, 10 Apr 2022 20:33:50 -0700 (PDT)
Received: from localhost ([223.184.83.228])
        by smtp.gmail.com with ESMTPSA id y3-20020a17090a8b0300b001c735089cc2sm18166543pjn.54.2022.04.10.20.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 20:33:49 -0700 (PDT)
Date:   Mon, 11 Apr 2022 09:03:48 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org
Subject: Re: [PATCH V2 0/4] libgpiod: Add Rust bindings
Message-ID: <20220411033348.khqukcu7xczytd6y@vireshk-i7>
References: <cover.1638443930.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1638443930.git.viresh.kumar@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 02-12-21, 16:52, Viresh Kumar wrote:
> Hi Bartosz,
> 
> This patch adds rust bindings for libgpiod v2.0, this is already partially
> tested with the virtio rust backend I am developing, which uses these to talk to
> the host kernel.
> 
> This is based of the next/post-libgpiod-2.0 branch.
> 
> I will be adding testing infrastructure later on, once other bindings are
> converted to use gpiosim.

Hi Bartosz,

I can see a lots of patches related to V2 version making there way
into libgpiod, but it is a bit hard for me to follow them currently.

Just wanted to request you, if you can ping me once the API is stable
enough and most of the V2 changes you planned are merged, so I can
rebase my stuff over those and send for review.

Thanks.

-- 
viresh
