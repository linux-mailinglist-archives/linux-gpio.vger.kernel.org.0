Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE8C54D9AE5
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 13:12:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242574AbiCOMN2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Mar 2022 08:13:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241885AbiCOMN2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2022 08:13:28 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C92D3C4AB
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 05:12:16 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id l8so8846151pfu.1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 05:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HJrujGQBXk61RDGZpAorafl+LZ1A28PgG85F9sdvPfs=;
        b=IrAH2moD07c5j1H1rZC14jStwPlOTAm10NLdsoHY6FrNLpHxUCLwiZD7+1ZMNDZ3yP
         yOfJfR6zNggDd2VDbqTvP24bdnc77ZpKzqsqRBRmzZFAWwIH3TWPq89CLMRL5hmf0krt
         GOshHT5+Y5LqybnrwV3nLbxcg8gTBnsebTuzrk4Fp6K3AQSzAfy2ULhIZp4LLO2KIKQm
         oKMp3iCdMeYleJXLkA6kqm9fEE+baHWndohUqLocThrK2p0t3TB397B+Pg2O5XUcAHh7
         iI2LNFy8EfHIk5vVMYgOtgcxPQMCaBRoeSabVOIGn7+9k2+vj0PDXMOfFi/H09bqnyLN
         ow/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HJrujGQBXk61RDGZpAorafl+LZ1A28PgG85F9sdvPfs=;
        b=z0zI3gCI46cWmTh9hPniW82lw8rg4UoEnDGgCsC7lcazUBL4YJi+AHeBE+KB2vzhkR
         YRNbpvsLM+2SM48PQ0SXOc/RApUB+dWZyCERRu6Lpcaq45vnKLi/9ZoHPeFG9/DF3vCM
         fGjf0BGCDHjZc7t4GmQ1W3ZWIWVWVzFmIyHNdy6ltrX376iqnwRRIOTXkMsgFdDjmete
         8jUHxLGyxSTrUOSex0VbU8yYpyRzpTf74z0YFz5eXsNoVXwCghGkcEb308/4x7t/sghT
         QxT8qSDuj6HmI++z/uouVWRdQBpAEVSBbjKjhB0baHRlmmT+bCGQBRhPxA1AL4JS0z27
         ZOkQ==
X-Gm-Message-State: AOAM532zBBjxZZsOSnxY0SBnas8gucCn4r8L99CI/DO1zq/DpN35JJXa
        bGplti2Cb9vMgwzaCCjQr9E=
X-Google-Smtp-Source: ABdhPJwxvVM8M36xXJwpid1Lu/BILKRRC3hQaK9wmvWjrzsZvDvVXGVZqY8q3cmPn28bNsY5me3NSQ==
X-Received: by 2002:a63:8543:0:b0:380:3079:dffd with SMTP id u64-20020a638543000000b003803079dffdmr24247887pgd.106.1647346336015;
        Tue, 15 Mar 2022 05:12:16 -0700 (PDT)
Received: from sol ([124.148.64.37])
        by smtp.gmail.com with ESMTPSA id 3-20020a17090a190300b001c61add3386sm2810227pjg.35.2022.03.15.05.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 05:12:15 -0700 (PDT)
Date:   Tue, 15 Mar 2022 20:12:11 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod v2][PATCH 2/3] core: split chip_info out of chip
Message-ID: <20220315121211.GA174293@sol>
References: <20220315053220.102934-1-warthog618@gmail.com>
 <20220315053220.102934-3-warthog618@gmail.com>
 <CAMRc=Mf9pAWiKeR2GH6PQX=bUOvWXoyWUP2aY+5grzqoAn6M8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mf9pAWiKeR2GH6PQX=bUOvWXoyWUP2aY+5grzqoAn6M8A@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 15, 2022 at 12:59:55PM +0100, Bartosz Golaszewski wrote:
> On Tue, Mar 15, 2022 at 6:32 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > The core library should be minimalist, only performing the operations
> > required, but gpiod_chip_open() always fetches the chip info,
> > even though the majority of the time the chip will only be used to
> > request a line, so the chip info is not required.
> >
> > Split the chip_info from the chip, in the same style as line_info, and
> > update methods and tools appropriately.
> >
> > In the rare occasions that the user requires the chip info they can
> > request it themselves using gpiod_chip_get_info(), as demonstrated
> > in the tool changes.
> >
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> 
> Ha! Interesting take. Makes sense. I queued this but tweaked a couple
> things (some bad copy-paste and stray newlines).
> 

I've been flip-flopping on this one, but wanted to float it as we're
getting close to finalising the API.
In some ways hiding the chip info is simpler, and gpiod_chip_open()
already does a whole lot in gpiod_is_gpiochip_device(), so an extra
ioctl call isn't going to make much difference...
But it does reduce the gpiod_chip size a fair bit as well.
As I said - flip-flopping.

Cheers,
Kent.
