Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40232710D27
	for <lists+linux-gpio@lfdr.de>; Thu, 25 May 2023 15:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239180AbjEYNVb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 May 2023 09:21:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233986AbjEYNVa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 May 2023 09:21:30 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7763EB2
        for <linux-gpio@vger.kernel.org>; Thu, 25 May 2023 06:21:29 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-253520adb30so1066219a91.1
        for <linux-gpio@vger.kernel.org>; Thu, 25 May 2023 06:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685020889; x=1687612889;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tyZEvrbQZifYY1pau+ThLHjsvCYCtwaSbpjFVFd/8kA=;
        b=NxnEbYWsGkU2NY4uLQ419fIDV7udjsnyw3bNWVCnFFSA2EGLXgEvIxhIRLeQ2Pu/eG
         5q2GAsXDY6Ui2tWtCzI6tCWaKfLIud/4ZmZlTxfvPOA4272Q/wWZW3lrdsiNvYyN5Q7t
         bpiAdwHxNOv+E8kRV5Rw7Ujw01oeApDPkFwOAgk6O+oFkqlUbvjOgjlt1jTF9TXiTHkC
         700sDuj3VFahcFVQi3/6ycH7XqEGYO5WIcPHNrlYG6XhD4hAy5LC2F0iP34fuoyccvwN
         GM8IBlkgGMfQNErfZE06DtG/S6FxaMeW2HkT70Xbv4L4QQD56pAwx33Tc2gYESYMCkv3
         R0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685020889; x=1687612889;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tyZEvrbQZifYY1pau+ThLHjsvCYCtwaSbpjFVFd/8kA=;
        b=bC87Kvgg+vG9NQaoO4QuMTMFW6j9kddd7JNaA4VL/4PcIJxqBYneSuG5HIo60JCMdV
         jylBzY6qWMIV8pn8FOpjjlbfGA3zyAmpN13vbBiIH4m8U3aIebJ5EM9irqxLxom9NelA
         tov+/meh10yAyAt15bmdN+OMOA5r+KEfwz6GWWjKReyJ0BteDsy4ZfNFCP83iY+eIpBH
         hzAdrAokEeDsM5epxMgOY/laGy3YLN/HkBBtBrMQCs1SElfkY9JmJylxlRty/e7QQg+d
         cJ4ODt9LYDLaLhpz8a6F2Axo6E7l1mfKTUlyqGLpFbJnpEWAANUo6ODjWMfFyT35LvOE
         +HGQ==
X-Gm-Message-State: AC+VfDzuabJGHRlOCVhGttMraUoYWx3IkRGTPzIxEzo+P/0I8ECqf6yF
        0nLMY9KfNAjEhIlOqWgZ0fAxx1ZaIeI=
X-Google-Smtp-Source: ACHHUZ4AWfMJUG97svWB2epNxZH3NYmIUaqwfHHmigjh3xbQ+pf7gxKPgd5byJgduDgyDg6Bvnciqw==
X-Received: by 2002:a17:902:988c:b0:1af:d3b2:4eb7 with SMTP id s12-20020a170902988c00b001afd3b24eb7mr1296642plp.21.1685020888789;
        Thu, 25 May 2023 06:21:28 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id g23-20020a1709029f9700b001aaf2e8b1eesm1393473plq.248.2023.05.25.06.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 06:21:28 -0700 (PDT)
Date:   Thu, 25 May 2023 21:21:24 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     brgl@bgdev.pl
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [BUG] gpiolib: cdev: can't read RELEASED event for last line
Message-ID: <ZG9g1N1Jbm0aB4ST@sol>
References: <ZG7RgGasxXz4/pwl@sol>
 <ZG8Jpjq/N97plOGe@sol>
 <ZG8SRE9QzBYRspCO@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZG8SRE9QzBYRspCO@sol>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 25, 2023 at 03:46:12PM +0800, Kent Gibson wrote:
> On Thu, May 25, 2023 at 03:09:26PM +0800, Kent Gibson wrote:
> > On Thu, May 25, 2023 at 11:09:52AM +0800, Kent Gibson wrote:
> > > Hi Bart,
> > > 
> > I can also confirm that receiving the event using a blocking read() on the
> > fd still works, it is a poll() on the fd followed by a read() that fails.
> > 
> 
> Hmmm, so it occurred to me that gpionotify does the poll()/read(), so it
> should exhibit the bug.  But no, it doesn't.
> 
> So it could be my code doing something boneheaded??
> Or there is some other variable at play.
> I'll try to write a test for it with libgpiod and see I can reproduce
> it.  But I might put it on the back burner - this one isn't terribly
> high priority.
> 

Bisect result:

[bdbbae241a04f387ba910b8609f95fad5f1470c7] gpiolib: protect the GPIO device against being dropped while in use by user-space

So, the semaphores patch.
The Rust test gets the timings right to hit a race/order of events issue?

Cheers,
Kent.


