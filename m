Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BDD2269C9A
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Sep 2020 05:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbgIODeg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Sep 2020 23:34:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725953AbgIODef (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Sep 2020 23:34:35 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B14BCC06174A
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 20:34:34 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id bg9so616964plb.2
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 20:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VguhKkVDH+CGOaHPfLHyHA/UmR7Gomc/wIdjizX3A/w=;
        b=ux39nl3FTBUYXtCyrOd5zKfhwWW6WN3dh0eO5WU6VjBq/AjJoDBkIT377Hpg/PsIFG
         YSYVX1Rb0oS77lO1FCV0IIXcrGdqx4b2N1EFIGM+ktYSIwgLI3VjJnCMu1gkVaGNxpP9
         K2EdVVeVVeqTp96vGtrX67bbEUBW7CuRRbywqDKSVt1iNtt+tzRyyKN0i4sxAe/Hw3b2
         QDEN5xzwNeV4pIICR0FEMRLtDDQAkUqvfknqHPMJ+UPiZbIfbn8YoQDTlgwqrQCq3iJJ
         0VRttKqVFUoqL1bqI0AktwMviMjaRxVdZTBqPT4plqhhHnwDBqSAmvMbsHqg2taFPo76
         kPUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VguhKkVDH+CGOaHPfLHyHA/UmR7Gomc/wIdjizX3A/w=;
        b=KYUHQUzj4T12YqcOAmcGzcNbhsfxAW28tqM5MRUZcbAh9tZlZY9eWOJ3La9zPE95Vv
         3aBj/dpQ0prxJLRdHdMwocHNeWDPM13K3Yh2IaROyzMlgUJqFU80YGflJYUtClv0c8dO
         0N4mRKiz6zA7GE3TLGgmw+EDKnzW2CAF9RTHvJSkc3ErbJJoMu5TlgvAmm/4f9RnTcYN
         MRRC7qqz+VSq3kpM/v1nmUE52b5Wj/IcYefME8tpDPN9AnJOs7QahiU5HBoXlVgGcAkE
         H0GGFHSro5AoqVSyzYY5pdmd1iNYfzKBRfffflO2Ea02p8JRoYF9LGu0wbTHIuwxPQm/
         GzPQ==
X-Gm-Message-State: AOAM531FF0+SM7GxRp06UKJAt4vP0JZhu+cRjUAOT2UhacLfXaKqjOou
        atnh8xqs8rvbi+NhTnMWwA1BaK+MBXc=
X-Google-Smtp-Source: ABdhPJwXEUncVQ0aBLiPgCNN8APjokR3U2JBUeS/6tetkcjNFrXj7dZ2npb0lNmpj6Y9WO6jfFnX+g==
X-Received: by 2002:a17:90a:120f:: with SMTP id f15mr2358854pja.120.1600140873574;
        Mon, 14 Sep 2020 20:34:33 -0700 (PDT)
Received: from sol (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id fz22sm10258474pjb.46.2020.09.14.20.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 20:34:32 -0700 (PDT)
Date:   Tue, 15 Sep 2020 11:34:28 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Maxim Devaev <mdevaev@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod] gpiomon loses events
Message-ID: <20200915033428.GA14286@sol>
References: <CAM4ZDbA_F+8O28YFwWgtT8Yoej0EeXCCboW6yfHT5T7ryg87WA@mail.gmail.com>
 <CAHp75Vft6zJDNr8FUQq7o9Cri78NQwYS13Y23+UUvhnt-sTjiQ@mail.gmail.com>
 <CAHp75VfexcxhAi1QHoWkFF-DMUbMF1zMmNFWnTyb-NniF22t=g@mail.gmail.com>
 <CAHp75VcbZ8zaseAD1FRQhY_pj_3_t43ssvqsw6NL6+4d3YfwXw@mail.gmail.com>
 <20200915004541.GC4138@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915004541.GC4138@sol>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 15, 2020 at 08:45:41AM +0800, Kent Gibson wrote:
> On Mon, Sep 14, 2020 at 06:55:20PM +0300, Andy Shevchenko wrote:
> > +Cc: libgpiod maintainers
> > 

[snip]

> A workaround with the unpatched v1.5.x is to only read events using
> gpiod_line_event_read_fd_multiple(), or one of the functions that wrap
> it, with num_lines=16.

Oops - that should be num_events.

Cheers,
Kent.
