Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7346414824
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Sep 2021 13:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234294AbhIVLvE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 07:51:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230171AbhIVLvD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Sep 2021 07:51:03 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9D6AC061574
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 04:49:33 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id v5so8906575edc.2
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 04:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=essensium.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=3B9lk6627Di+vg9pEI8WZVPT6KmmiqaEQQqDgeF3RD8=;
        b=Y78+Z8gpWg4M79MEtb4IavbfJYB0gGbESlzBOFLceOTVd68aK8mzCjHV+2xkh5G+59
         Go5Wfo54RRqVdXRxoxk1ON3uiaRD286Vv1JR+1KW8EzUsuLuuNmPR97kTbLxPp3j3yt4
         hTNoT+ZofqRdoh0aHcCRraZskL70zqKni/IZTgRPmOvQk0nI8WDWJhimAIvgWESczly2
         /Tcr6G9osT7Ybs4mUXFDQ4YsL/EgXUATCCV9tY4pKSP47mrcdCJer3YqOdg3ERcKfdub
         mCZtMXxQlAtwXFGksyOKttCnED0WfB2EMYllVeslT90jRe5KK+Vd4ovJ9lFwf37rJJUu
         R75A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=3B9lk6627Di+vg9pEI8WZVPT6KmmiqaEQQqDgeF3RD8=;
        b=Rr/TEdHvIngTWI7+CIIxiKt5MZGVWBhs/xZivBdn+fSazslucb+FSrZ2L4h5QU5M9N
         dpeUb5wW5t+BZT3Hbe0v0UWYQ4++XKt7V6rSfY9re3ZJNotgF6V1JXvBHjTxEF2PgwRC
         TG5XG6SAJtdZ4yWwN61BIlJo3C6iaD7vC9Cot3ngH8Hb3cJJuNMPWFRFix/I5TfsQsZk
         MsPQgGhfWJ3Oga3FUUqmFfwclADhb9kPprQvZu2qP7fmpUvNHbqIxXFj2wAfTOMIUl20
         DNoTI93o6wCtw/9bYGev12ZNOgk7Ti3lYXUvrFgj9hAlXmzvn6iIuQ0RowvQR4v9fEsX
         RkhA==
X-Gm-Message-State: AOAM533hiWYK2WqHaFHTK9dWmUHfQA2PjkHtxO+jMwYWj1YgUGGCpwXq
        nuAgXnBEFI8vJ3/Y1DFBIbTH2+E2a3AAhfP2
X-Google-Smtp-Source: ABdhPJyP5VL0pCIZBmvMCK/aOBsrWyOnSKoBibP0PFOxh/LVv617e6uD932KYlhObC0Zfx5ltZDWqw==
X-Received: by 2002:a17:906:3746:: with SMTP id e6mr41196913ejc.57.1632311368764;
        Wed, 22 Sep 2021 04:49:28 -0700 (PDT)
Received: from cephalopod ([84.198.211.186])
        by smtp.gmail.com with ESMTPSA id e22sm1145780edu.35.2021.09.22.04.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 04:49:28 -0700 (PDT)
Date:   Wed, 22 Sep 2021 13:49:25 +0200
From:   Ben Hutchings <ben.hutchings@essensium.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH libgpiod-v2] gpioinfo: Show edge detection and debounce
 period if enabled
Message-ID: <20210922114924.GA24226@cephalopod>
References: <20210728234607.GC14442@cephalopod>
 <CAMRc=Me_UsY8b2wJx3CopJ2eX1Qb=fdSRqq_sRyR2vGXVULTbg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Me_UsY8b2wJx3CopJ2eX1Qb=fdSRqq_sRyR2vGXVULTbg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 20, 2021 at 03:52:17PM +0200, Bartosz Golaszewski wrote:
> On Thu, Jul 29, 2021 at 1:46 AM Ben Hutchings <ben.hutchings@mind.be> wrote:
[...]
> > @@ -166,6 +196,9 @@ static void list_lines(struct gpiod_chip *chip)
> >                 prinfo(&of, 13, "%s ",
> >                        active_low ? "active-low" : "active-high");
> >
> > +               if (debounce_period)
> > +                       printf("debounce=%lu ", debounce_period);
> 
> You should use prinfo here for formatting. But it would be even better
> if this became a flag - like the bias, drive etc settings and be shown
> inside the [] brackets at the end of the line - something like:
> "[pull-up, used, debounce-period=1000us]".
[...]

Well it's not a flag; it's an attribute with a value.  But if you
think it should be grouped with the flags anyway, I can do that.

Ben.

-- 
Ben Hutchings · Senior Embedded Software Engineer, Essensium-Mind · mind.be
