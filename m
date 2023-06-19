Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2F6E734DCC
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jun 2023 10:33:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230348AbjFSIdW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Jun 2023 04:33:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbjFSIdQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jun 2023 04:33:16 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E3EB197
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jun 2023 01:33:14 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-543d32eed7cso1178991a12.2
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jun 2023 01:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687163594; x=1689755594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pREcqjCdBKK5jCjYWm04rBVSt7nEJOHYFY2/prPTiyM=;
        b=X1YySkovRZlTMz8lTYDYbbFhJMhasJaoEf2ijU5bH+RVAB0alpEsL5Wv3GK7Kib5AS
         RtGQ7p4wIVDfdTCFSzNDVPHPrI1mnptFQFOl7k0oW4YgNdU5wF4SNw5gNKIyV3OliqOL
         ez5CaZbbI2JZQRFtZpnS/nXQlAxcVy0AZ/acquD4xwUA3d/+VZwKWwuBuOoQr2creqOj
         42BtsIy8b4BehbMrNY2aV3agpE4nNWJqi6SHCYivPzTnolMQ1zhENf7wCkXCozWANL/2
         JkXgOof1PN280S4hAtHiGlOaKPy8LbrUnuyQXGet7cshotlI9HRa5pks/LS/WUuf6GgD
         pTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687163594; x=1689755594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pREcqjCdBKK5jCjYWm04rBVSt7nEJOHYFY2/prPTiyM=;
        b=h7Ebj+ArEbdgNAD1jLzr5jFJ6MFdUvYFPNHkqp4ly9N+87R3OR9O05MMJfPW4XG3Xj
         gwqe4iQUP4hR336rPG5+ptnpULiAnd0QMtpW9f2H+1ukuOvZp8MxnrkmakgsBDb6yK09
         uUr+o+v5OtDwoiyFWwQOsW8MAQF9aDHWNuRX16VCFE+Q4yn0vwlg75ADuw4L4BpydaWA
         zgY5m20RRRHiqlK+N3pes6F4uGkogpL2VF27eFef0lDWXVyEYDbTX/Pzc1b+jtrHlSeC
         AoYmjq8Le3cXygw3NJXhAWgrHhNVCsHb2wlOM60dRdFlCTY6fqXJlRdPKfucrujw9m//
         GqqA==
X-Gm-Message-State: AC+VfDwFd/R+nkBqMZzwFZGbpJebSIs8Rf9eGyKC50OjIButxWvoS67p
        v30hLQsVclDjmSyHO1Tp2OK/Z32/az8=
X-Google-Smtp-Source: ACHHUZ4FGIjwiqQo2vQpPpj0AZzyBzRt9GcltLs9VEZ8xwjfoJwcGQi8l9webVL9PkqACrViAEdqcw==
X-Received: by 2002:a17:903:32c4:b0:1b3:f91d:15b3 with SMTP id i4-20020a17090332c400b001b3f91d15b3mr7323903plr.22.1687163593809;
        Mon, 19 Jun 2023 01:33:13 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id l17-20020a170903245100b001b1920cffd5sm4963771pls.267.2023.06.19.01.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 01:33:13 -0700 (PDT)
Date:   Mon, 19 Jun 2023 16:33:09 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     linux-gpio@vger.kernel.org, brgl@bgdev.pl, viresh.kumar@linaro.org
Subject: Re: [libgpiod][PATCH] bindings: rust: fix clippy lint warnings
Message-ID: <ZJASxQpvNuWWNXfo@sol>
References: <20230612154055.56556-1-warthog618@gmail.com>
 <CTC81IMWHW2L.28NQLXAIFP60L@fedora>
 <ZIl6X8YAUHS/n5s8@sol>
 <CTGGDNWWBD6E.FLAMJGXFKF3S@fedora>
 <ZJAKTdRVEwZfnKb+@sol>
 <CTGH61DGZBIQ.RVXF4UG9BYH2@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CTGH61DGZBIQ.RVXF4UG9BYH2@fedora>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 19, 2023 at 10:13:52AM +0200, Erik Schilling wrote:
> On Mon Jun 19, 2023 at 9:57 AM CEST, Kent Gibson wrote:
> > On Mon, Jun 19, 2023 at 09:36:48AM +0200, Erik Schilling wrote:
> > > Sorry, got distracted while sorting out the MSRV mess that I sent a
> > > separate patch for [4].
> > > 
> >
> > My reasoning was simply that building the bindings as you suggested
> > resulted in lint warnings, which is noisy and iritating when trying to
> > lint my own code.
> 
> I fully agree that we should fix them! I was just confused about the
> explanation.
> 
> > But I'm just the messenger.  Your question would be better directed at
> > Viresh - it is his code so he should be able to tell you why the casts
> > are there.
> > IIRC we needed the casts historically, though I don't recall the rust
> > version we were using at the time.
> > If we've moved beyond that then I have no problem with the casts being
> > removed, in fact in my initial comment I lamented the fact they were
> > necessary.
> 
> ACK. Not sure how the situation was when the patches came together, but
> today I would suggest to just drop the casts. Do you want to respin your
> series or shall I send the fixes?
> 

You go ahead.

Cheers,
Kent.
