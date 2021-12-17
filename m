Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFA204785B4
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Dec 2021 08:48:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbhLQHse (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Dec 2021 02:48:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbhLQHse (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Dec 2021 02:48:34 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFC78C061574
        for <linux-gpio@vger.kernel.org>; Thu, 16 Dec 2021 23:48:33 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id 133so1345661pgc.12
        for <linux-gpio@vger.kernel.org>; Thu, 16 Dec 2021 23:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=z9iM4y6KYj1GG/3kaDvVYnWoGXpQnIl/TagvCjCxEm0=;
        b=C3Wah0tV6hpU88uoDQ4xt+QZYIn3UcjjKj3Mlq5dtftXKf9+EXT6JswAgbqRvUIGRo
         SlSyJaDBNy8kQER696w/oenKpHSDy3jgOfTOQCLVwAeB75QybF0/Oqv/qffhmc++PU07
         gM+DXVRkA4PRjsrboKzpr0YmB+2p0efaTZVfgoy6dy4fFJer/Fx4OpWlK/dwh4QIlZSx
         EfEXYix5rZHhMs8dXocRFbemW3Mx0nao7aLA2exoDCckWVZEHaSbLW1NiSdJ2gwbltHE
         V76uQcP/u5If1xemsKoMF2g88zrmU5dmXqeT5vhiX92fo5A9NFzBWpqN2ilCp8wL3DHZ
         QyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=z9iM4y6KYj1GG/3kaDvVYnWoGXpQnIl/TagvCjCxEm0=;
        b=KpfFynj63qxQrpCgikbl2hFWksMM7UVpQ9zNs/HYa9bFFwhKQmQtdTzBeVHlmj0xYc
         IasdVYCrwinO05qHHwbOxWVX//0ruNkGd7YeCsV5deW6Rk0cF4rKaXvtBiAvHaR+xniR
         vgCLC83GAe5S7LPxE56ome0C+wShV6DquEVzYVAsu1H2XqVctFL0bDyL5Yk++iMP/otZ
         cyeZ+ZbWsQn1zkci2WKFG+Fge6qzQRLNriy4IoIScDZPyCYeIibDJnBS7PAI8ON5Izbg
         EfBfGmmu8dBbPY3NUVU5en+OKdMcTYhDw1C1LW8z5dFzGJP8GWrop/1LfLfnOvze+H/r
         d+sg==
X-Gm-Message-State: AOAM531/uxOPFqQnhS98HV7e6kVb/LWvQsH8QMD7HhrWiRt+6359k/wx
        bkDestPYXdVdt8YUuJg3ixBFRA==
X-Google-Smtp-Source: ABdhPJzUtFfhocX+TkR/AKk8xZAw4j5u9B1PsTFyASKGRxrelZrGCErsh2g6tgab1cqAdPmRnAF28g==
X-Received: by 2002:a05:6a00:1a8d:b0:49f:de63:d9c0 with SMTP id e13-20020a056a001a8d00b0049fde63d9c0mr1769192pfv.79.1639727313411;
        Thu, 16 Dec 2021 23:48:33 -0800 (PST)
Received: from localhost ([106.201.42.111])
        by smtp.gmail.com with ESMTPSA id z13sm9039289pfj.7.2021.12.16.23.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 23:48:33 -0800 (PST)
Date:   Fri, 17 Dec 2021 13:18:31 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org
Subject: Re: [PATCH V2 2/4] libgpiod: Add rust wrappers
Message-ID: <20211217074831.mv2b5lfsgi7kqfxs@vireshk-i7>
References: <cover.1638443930.git.viresh.kumar@linaro.org>
 <7ace171379783b73a8f560737fd47900ac28924c.1638443930.git.viresh.kumar@linaro.org>
 <CAMRc=MeoTiUOjM_D36ZEU=echpM9jVhr1HY7fuxTDs0t0jf2Jg@mail.gmail.com>
 <20211217050135.l7p3sudbdvzewi6y@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211217050135.l7p3sudbdvzewi6y@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17-12-21, 10:31, Viresh Kumar wrote:
> On 16-12-21, 14:59, Bartosz Golaszewski wrote:
> > AFAICT this object will not survive the parent buffer. Take a look at
> > the current development version of the C++ bindings where I play with
> > copy constructors to ensure that.

I looked at bindings/cxx/line.cpp::make_line_event() now, is this what you were
referring to here ?

Based on what I have understood until now, I think the edge event structure can
be modified like this since it is only required to give us certain fixed values:

 pub struct EdgeEvent {
-    event: *mut bindings::gpiod_edge_event,
+    event_type: GpiodEdgeEvent,
+    timestamp: Duration,
+    line_offset: u32,
+    global_seqno: u64,
+    line_seqno: u64
 }

That way it won't depend on the struct EdgeEventBuffer anymore and can be freed
after the buffer is freed.

> Adding back some of the removed code as well.
> 
> +impl Drop for GpiodEdgeEvent {
> +    /// Free the edge event object and release all associated resources.
> +    fn drop(&mut self) {
> +        unsafe { bindings::gpiod_edge_event_free(self.event) }
> +    }
> +}
> 
> While testing this I found a bug few days back and I wonder why
> gpiod_edge_event_free() even exists. The memory for "events" is allocated with
> the buffer and gpiod_edge_event_free() shouldn't try to free a part of that.
> This looks buggy.
> 
> Yes I realize that the edge event shouldn't exist past the buffer itself, I will
> try to fix it in a Rusty way (maybe with Arc or something else).

-- 
viresh
