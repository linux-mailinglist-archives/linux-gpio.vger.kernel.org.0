Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49E69615B44
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Nov 2022 05:00:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbiKBEA4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Nov 2022 00:00:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbiKBEAx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Nov 2022 00:00:53 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D79AE275C9
        for <linux-gpio@vger.kernel.org>; Tue,  1 Nov 2022 21:00:52 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id z26so2175100pff.1
        for <linux-gpio@vger.kernel.org>; Tue, 01 Nov 2022 21:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c/xn8GCuNPtzqzIP0fKQfVLGbGFp11OcImQCGfFohX0=;
        b=cLsHozo/wyOeJFyvzuLqSQiNJCWM5PT7VAGkIuUHzIuYOtVU2A49zlayd+9P4jqakp
         Vo7UPo5ISy+ivLCqKYfjdC7I7R/R5hDrOlFw4umLxXcHMwacECK2LfI9GIkTwXQUdVT1
         cAg4QF28ZgG2QQ+O6wWWW5gItjDtvNcAyR/KqRfep5EEN6RVrsu4slXbF/n0CB5tctun
         kXU4QI3U+UlPSedrS8UnoTKq7hmkQQv23IlBxFFWoh9FnemLROnPzAFa5FFO6cFmteOE
         6rRmr/yz6yVaevjx1pb0jvalLocLzsqMki/SWa/wv7jJP5zDFNbomOT3KUU8jmazGAfh
         iTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/xn8GCuNPtzqzIP0fKQfVLGbGFp11OcImQCGfFohX0=;
        b=3nArUn2J1ykpmmHOQaw/gfYsDgJ3hbjT9RFKn07V9PKpbOuSa/g56ho2NVgzThrjQg
         ImcClCpXzSq2O2GN5u7D5BYQUGq2zkjPkFmhlaoLIZ8cEo2AMTcG97KXzojwYrO0EhBb
         OiMOdizRrEi64e5XX7dbeqXEpY5Fi0g2dqQzkxblJs9V6EELKTHS54VXNZ3YVIdYzn9n
         eo+2qg4BagfDV+29KmTNZ5IbvoVzOZcbFyGv/BQ+x+rVuxm3nINkPvahw/AywLU2ePmI
         yc91gkBuJOhQOLtCqTOQ+t/GcQpx5u7XJPKf//7AqiSeMNFIeC4xw9lZQke/PWNLG3H8
         W4fQ==
X-Gm-Message-State: ACrzQf0dwbc6QUYg0LoXoEbZjc8ggAiTv1AbsPpckZrLJeuddlpS/y3z
        ICDr/YRDlpWhsFAsXOHNF44oHw==
X-Google-Smtp-Source: AMsMyM742Va/Dt30lBVWWGVLhvLNKBTSCZclFW9W8xsinlgZIQseVPvLLdwAOY9ZEm8ms/qFcEhrDw==
X-Received: by 2002:a65:6e0d:0:b0:42d:707c:94ee with SMTP id bd13-20020a656e0d000000b0042d707c94eemr19638872pgb.260.1667361652353;
        Tue, 01 Nov 2022 21:00:52 -0700 (PDT)
Received: from localhost ([122.172.84.80])
        by smtp.gmail.com with ESMTPSA id n29-20020aa7985d000000b0056baca45977sm7264690pfq.21.2022.11.01.21.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 21:00:51 -0700 (PDT)
Date:   Wed, 2 Nov 2022 09:30:49 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V7 3/8] libgpiod: Add rust wrapper crate
Message-ID: <20221102040049.64b3yll7itvi7vzw@vireshk-i7>
References: <cover.1665744170.git.viresh.kumar@linaro.org>
 <6a94249d2d69bc5c1907fea9ed80c9d7e34278aa.1665744170.git.viresh.kumar@linaro.org>
 <Y01RvbboC3dMDVSy@sol>
 <20221021112238.teqz25pn3hz5d4cs@vireshk-i7>
 <Y1KTCWiGdUxkQ6Al@sol>
 <CAMRc=MdWce2Msjwjyo3ny9LyUsA8Zeq_WhhJ2=ar5CG1BPmhtg@mail.gmail.com>
 <Y1/AtfEhuijx1+tK@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1/AtfEhuijx1+tK@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 31-10-22, 20:33, Kent Gibson wrote:
> Wrt the Rust bindings, I was assuming that either Viresh would provide
> support, or as his work appears to be on behalf of Linaro that they
> would have an interest in maintaining it.

I will surely help in maintaining the Rust part. Not an issue.

-- 
viresh
