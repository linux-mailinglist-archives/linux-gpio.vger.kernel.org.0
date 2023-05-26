Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23979711B0E
	for <lists+linux-gpio@lfdr.de>; Fri, 26 May 2023 02:25:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbjEZAZE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 May 2023 20:25:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbjEZAZD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 May 2023 20:25:03 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 484AF194
        for <linux-gpio@vger.kernel.org>; Thu, 25 May 2023 17:25:01 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-25533eb3e5dso268151a91.0
        for <linux-gpio@vger.kernel.org>; Thu, 25 May 2023 17:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685060701; x=1687652701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gOlhmtuJJPHmwqAhd+A2DEEEZfNgrITrmo7amyfmCA8=;
        b=lkmOTsBX8UkujNSbL/1LnkD1xXot93KEYhZUzNXPCwfk/72wrc+KpkqMvScvGiPF8H
         rRnHbJ+j49qJklleOWgOCP79vcLZyRSOouHhjAzTB3y4kS48YUFfTIedQVYRtjcC1FIH
         RU2LIPKBJloB1CDWA+MA/TyZgccdR+RzpFrWgGO9q/uLbV5IoA/NX0hkJm3+v2c1+L7L
         HKprzqSOKfEHxwl/yPposkOuyaQHYRDiYrW1xvhb2vMoPmUjks4nms0pEcGJlNw5kENM
         TxQIMNVvW7CGngObaE8aAWtl532RPJD9A5wym0Nek9gFjauPB2EEq0Fh9I10Jq58vF+e
         W3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685060701; x=1687652701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gOlhmtuJJPHmwqAhd+A2DEEEZfNgrITrmo7amyfmCA8=;
        b=XON0Fj5icauJAswy4xOGZeSJtydq7FLJik26o4QhZ9oUTcbRlAn+PthYePh/idKJW+
         eCRHxjEumrZCbQ2MbZrjK1WU0d6rGHT8486xsO1GTPwiQ46oV3qMsOaaBkxfNPtZiozh
         xbOa/Yvl5hDZYaFPntEPHLly2NYZ9wKr3TEFOCYCn7ucmp0FwSqr2xxQ3ZHv2EpKVanB
         7bcRkJ8yjHTsB+PAgsWAkQrg5hCUPpTjPeq1fgt+A0hmC4NPYdYZLJjdaD0eEhGjZ9fZ
         Mm+hQBO2jkXa3JqRo5nzO0d+LGl3W4d3+DiCFwK9Gy61A/SSC4Tux/80rXT8Ryo4ZQpi
         n5Uw==
X-Gm-Message-State: AC+VfDzXknprzQdkPmv4rtmT35AJnlXz9QBc8TTpfahcXJ44UH5kxN/s
        vhFw9CGwMNRiwtCo/EvDStA=
X-Google-Smtp-Source: ACHHUZ686fBlj73MzdQqQPCBkglNQVTqEYoJQE6WEWe9MVI/zdqV09ay1bDvq9Ff8ugNlGlTNLcjBg==
X-Received: by 2002:a17:90a:cb0d:b0:246:af1f:62ef with SMTP id z13-20020a17090acb0d00b00246af1f62efmr571267pjt.5.1685060700528;
        Thu, 25 May 2023 17:25:00 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id e18-20020a17090ac21200b00250c1392ed3sm1736616pjt.55.2023.05.25.17.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 17:25:00 -0700 (PDT)
Date:   Fri, 26 May 2023 08:24:55 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     "Slater, Joseph" <joe.slater@windriver.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "MacLeod, Randy" <Randy.MacLeod@windriver.com>
Subject: Re: [libgpiod][PATCH 1/1] gpio-tools-test.bats: modify delays in
 toggle test
Message-ID: <ZG/8V3ijqO8I1We9@sol>
References: <20230524210945.4054480-1-joe.slater@windriver.com>
 <ZG7bpE8xRuIeq7J+@sol>
 <BY5PR11MB3992F8CA5B13108F6310D72A88469@BY5PR11MB3992.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BY5PR11MB3992F8CA5B13108F6310D72A88469@BY5PR11MB3992.namprd11.prod.outlook.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 25, 2023 at 09:54:14PM +0000, Slater, Joseph wrote:
> 
> 
> > -----Original Message-----
> > From: Kent Gibson <warthog618@gmail.com>
> > Sent: Wednesday, May 24, 2023 8:53 PM
> > To: Slater, Joseph <joe.slater@windriver.com>
> > Cc: linux-gpio@vger.kernel.org; MacLeod, Randy
> > <Randy.MacLeod@windriver.com>
> > Subject: Re: [libgpiod][PATCH 1/1] gpio-tools-test.bats: modify delays in toggle
> > test
> > 
> > The comment is confusing once the sleep is removed, so just drop it.
> > If you want to describe what gpiosim_wait_value() does and when it should be
> > used then add that before the function itself.
> > 
> > The test toggles the line at 1s intervals to try to improve the chances of the test
> > and gpioset staying in sync.
> > Could that be reduced now, without impacting reliability?
> > (this test suite being glacial is a personal bugbear)
> 
> [Slater, Joseph] I'll get rid of the comment and try the test with a shorter toggle time.
> The series of 159 tests takes, maybe, 10-15 minutes for me, so I don't think saving a
> second or two here would make much difference, though.
> Joe
> 

I did mention it was glacial, so I feel your pain - you have no idea how
many times I've run that test suite - though it is a bit quicker than
10-15 for me.

So no problem with leaving the timings as is. I can look at it some
other time - revisiting that test suite to try to speed it up is on my
todo list - somewhere near the bottom.

I look forward to v2.

Cheers,
Kent.
