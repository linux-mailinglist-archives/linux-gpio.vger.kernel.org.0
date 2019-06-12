Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F102041AAA
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2019 05:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406020AbfFLDTc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jun 2019 23:19:32 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35908 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387878AbfFLDTc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Jun 2019 23:19:32 -0400
Received: by mail-pg1-f194.google.com with SMTP id f21so2081673pgi.3
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jun 2019 20:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ate72NuJmVUI6S2BuZQCuvpskZE3U2N/nMIH2X9inqs=;
        b=wONe3ABjpXyvX++muN+ZuuQPCqABZNEGqIqxYQ/Kt3+uMGojPLxRSIvfb/BY+fdwuG
         KekIHVfMMPWEt2iVGpYLRtMDFlvWdWZQ5k1LeLMG6u/GZrzIezH7XP6vIhGcsBW+ii0L
         gOnSHP9g6CBDUTxhU2oTLwRXVDlXsKmhEbPEYheQAqd7KVigbRcszf2ZesnwW85PE1dO
         iyU20ncmowoBO3l8SVj5VyrMj5LmSNEaWqBtwhga5wxb4uKNqWI9n7cGRT4AetHicKKc
         Aw/YlYfKfl5ziY0qdFhe1J71Org6PQArMHzDhgPN6gLNsPPoPq3bsND8qGL8LNA0flRp
         9Seg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ate72NuJmVUI6S2BuZQCuvpskZE3U2N/nMIH2X9inqs=;
        b=TC4Sj9rg0FBzvtOxyHQ+OOAWhy/VzYYfbfG6J3+UOjtofegRFEgRduco7doRMNmiW0
         O58n4Uwo3EJc94bvOnjmNxTTVFxvOoiu6MXdGZvuHj+phUwbtfRL2OdSt7IUdzQk41iY
         zXndbrxu6SHQ9ypQvp+JIG99BmLkmY1FC3sFZCH2DwYvjveTuDTF7Kt+8rfjVb2wUbgr
         HT3CZUkWKvvmEuUoPR+E5cJGgxn2FIJJEN6zCIFp1Te3v2MwR7yp2f7gMWzhTOCU46R/
         er6MJswYAe79oD5R0nmUlYojlyJJB4mRINzHVEZxIa3h9pz0iv3jjJSeTzxGI/d0FlQz
         LDeg==
X-Gm-Message-State: APjAAAUyVDH5Vj+zk2PjceBWzk7wE0+aPzR5BJyAXtOwfcK3sBOTkB/k
        AXzuQ+YqivyBUcF+UBg0iRgdzw==
X-Google-Smtp-Source: APXvYqzHGgDNU6Vo6rIo/Aq12B4nqhPE19OxuX8C/VoLATKTH5QzhJS9otDk/sgsXlZcHlrej3ZyIg==
X-Received: by 2002:a17:90a:22c6:: with SMTP id s64mr30744352pjc.5.1560309571012;
        Tue, 11 Jun 2019 20:19:31 -0700 (PDT)
Received: from localhost ([122.172.66.84])
        by smtp.gmail.com with ESMTPSA id d9sm14160236pgj.34.2019.06.11.20.19.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 20:19:30 -0700 (PDT)
Date:   Wed, 12 Jun 2019 08:49:27 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: gpio: Convert Arm PL061 to json-schema
Message-ID: <20190612031927.mgr62xiirjqrzkeu@vireshk-i7>
References: <20190514005033.15593-1-robh@kernel.org>
 <CACRpkdZabT3_vjkv0PR+GLC0ZXWzpMxfwJU6O9Y+omKJ=6zCaA@mail.gmail.com>
 <20190527064146.5rlm2audk6uojdxn@vireshk-i7>
 <CAL_JsqK3iS+Tv+0HYMApL6C6WQeVsf9hXgvpLpuR+dbDuygQdg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqK3iS+Tv+0HYMApL6C6WQeVsf9hXgvpLpuR+dbDuygQdg@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11-06-19, 13:54, Rob Herring wrote:
> On Mon, May 27, 2019 at 12:41 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > I checked SPEAr and it is missing interrupt-controller at few places and clocks
> > everywhere. Missing clocks should be fine as SPEAr doesn't get clocks from DT.
> 
> Clocks not from DT was supposed to be a transitional thing...

Right, but by the time I left ST in 2012, mainline clock's DT support
wasn't there and the SPEAr core team got fired soon after that. No one
was left in ST to do the porting, but there are still people using the
SPEAr boards and there are products in market, so we can't delete the
platform as well.

So, no one is going to add clock DT support now.

> > And interrupt-controller can be just added, I don't think there would be any
> > platform dependent side-affects ?
> 
> There shouldn't be.

Okay, will send a patch for that then.

-- 
viresh
