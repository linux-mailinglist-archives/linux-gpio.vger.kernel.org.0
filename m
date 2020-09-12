Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DED126779A
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Sep 2020 05:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725801AbgILDy5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Sep 2020 23:54:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725791AbgILDyz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Sep 2020 23:54:55 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF515C061573
        for <linux-gpio@vger.kernel.org>; Fri, 11 Sep 2020 20:54:55 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id e4so1810113pln.10
        for <linux-gpio@vger.kernel.org>; Fri, 11 Sep 2020 20:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=F9/VxoCRVXxEcj0aDcN2j7KpBF8DG6s3mFotNEXPQio=;
        b=Vm9Yg5wJ0Qx/B7oABbFRLeLvra55bxSlWhvnvi4mbncgdfn2F6kgnuxM13LhwW6S5K
         KrjceFRCvYKhnvvmZZsdKN2olJ1wsQxq/m+ZfI+1lKs0Z5r03gVIgupgmZnRBGkpQSbM
         hOBYt4/F9k8T43KSkOpk1Np7Eta8whCaR4WbuXpHtdZweNAC2/9cEY6qPocTNfnp8wqZ
         M4cBVLTYH+h5H0eQ+7N2/IYHt731laRWAPFXbDSDe4Pfz6DQoCUR8ipTzplScbSA1eLl
         wic2DPttSr9FaQi0K1fzZLlU/K5R7ob92S8rr/O4BdhPZk5AukS2GUa1cv//JXH36WjD
         9KsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=F9/VxoCRVXxEcj0aDcN2j7KpBF8DG6s3mFotNEXPQio=;
        b=iIRoaYjot757WloAAVWTUI9w7ZNgR74mMX/f68oXQZCn11NoBiSlzlBPxH8G6ofeV0
         RN2X4O0nGBEFuDVMgDhYcjjOlJBxkNG9miXmAfcBkFcDSgv8oAofezqTpzsSyCpWVZ3D
         +S1+QY/HWSsceunB1+tmEtSXLXniy5XVFBB41+71GJI7TW/bAMSXRos7qabqGGo+ONVE
         36o+0vUOzE9pgOwUPmnCzcZvY1LTOQRBzdAxMMVsushg3Ya/IXciHr9s3Siat5ffJayj
         eoGAf92DPI9GKdrmRbsyMNmU/8qn7CtBZQbVr20wNnd4+9Qm+f42l15KQjmnqj05rnep
         aL1A==
X-Gm-Message-State: AOAM532adQXixBxm67GV6QbNY0M72g5kALnMrpqihiQhp1zCceg5rNhh
        emNl1TXz0NtlKZLpHucou8umMcLJshI=
X-Google-Smtp-Source: ABdhPJzZoP5uyuKHabWDfG7KPvTzNpCLQ8W0gCUDlzLrRvd+/Nc0DoNfcyx3g8Fc6cLhYpqXKgNo2g==
X-Received: by 2002:a17:90b:1107:: with SMTP id gi7mr4735549pjb.233.1599882894869;
        Fri, 11 Sep 2020 20:54:54 -0700 (PDT)
Received: from sol (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id i9sm2816598pgb.37.2020.09.11.20.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 20:54:53 -0700 (PDT)
Date:   Sat, 12 Sep 2020 11:54:49 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Subject: Re: [libgpiod][PATCH 1/2] tests: event: reading test coverage
 extended to cover reading a subset of available events
Message-ID: <20200912035449.GA723241@sol>
References: <20200912022248.16240-1-warthog618@gmail.com>
 <20200912022248.16240-2-warthog618@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200912022248.16240-2-warthog618@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Sep 12, 2020 at 10:22:47AM +0800, Kent Gibson wrote:
> Add tests for gpiod_line_event_read(), including reading multiple
> entries from the kernel event kfifo, and extend the existing
> read_multiple_event tests to read a subset of the available events as
> well as all the available events.
> 
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
> 
> I have removed the usleep()s between setting the pulls on the mockup as
> I don't believe they are necessary.
> Setting the pulls results in serial writes to the debugfs, which the
> kernel should be able to deal with.
> Any queuing in the kernel that results should come out in the wash.
> 

I'm obviously missing something in the path from gpio-mockup to
gpiolib, as the tests fail in slower emulated environments :-(.
I'll put out a v2 with the usleep()s restored once I finish testing
in a more diverse set of environments.

Sorry for rushing this one out.

Cheers,
Kent.

