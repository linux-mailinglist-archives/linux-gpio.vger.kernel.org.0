Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC71717321
	for <lists+linux-gpio@lfdr.de>; Wed, 31 May 2023 03:26:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231842AbjEaB0a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 May 2023 21:26:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231558AbjEaB0a (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2023 21:26:30 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0473893
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 18:26:29 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2562cc85d3dso4346506a91.1
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 18:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685496388; x=1688088388;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gIQDtKR4EnAPCg6VknyXPKO71M4jd8LQ9hV22myvrrk=;
        b=bQBVCabHrdhxM6y/wcfeS7SrZryK/p8YFNstfFwSI4ZgYf43POkVOtVQqX3Mg8Wn/O
         IilTHmc8+3cW0ZvJij0qCEnmajE/cHIisiek9hKXd5SYLbBKTmFr8A+2r3eTVNfauUm3
         zeKIrpu1Y8tpRLQLas86DJRlXA1HLZ+qR5RYbLEnGu56s5HJXQwVHxbPQPn8xF/fKICp
         ZMK3c9yKpJV+/I8udkZ2T72L66/dfj1ZVORB4eSubKG+ruE5OW/HV+YYQzslGW3njziK
         3ygol8w7Ln4eklhFW35g6CMRdDbRtR7zoa4LltJJX0ZIEjyE9xIrhKuV8yayi5K5+xYO
         7StA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685496388; x=1688088388;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gIQDtKR4EnAPCg6VknyXPKO71M4jd8LQ9hV22myvrrk=;
        b=Dh2qFdqvIa8NXpiMdKYujo5oFu2HJn1dLFIyYjkiXyBM7SwdT+lDrAqpFFJe0bc3Na
         dNISWJFDdlZwbkUHP09YhGzAdJH4ml58EbLAqCMfMtcvErVIdxtQyfso2ljd8Wkmpz42
         VkugrQH4NFthT/UISNy/xFqHudvcRkJa0yXUStjqiznxsgBAixoh7y4OcKuHNov5WAup
         phD9rJkLNGwCcYUhwYuNE0R47A6sTIebcASfmlrKNyNXa/n0pUU+O8xUn1x3QjQWCXyu
         dxnyacqkKzf2CDO793LjlDOLaFyAp2ayX20u/BUA9pUdRcpYK26iC2nStaulbyIpteUs
         xX1Q==
X-Gm-Message-State: AC+VfDwc17B5LssgDiOHE3vHucTNxc6twZ6xjorAWy8rlYdoMOzqrvA2
        aX9qZO9fBo0yJOgXX6LRwxzxLQ3ToH4=
X-Google-Smtp-Source: ACHHUZ71atYJk0JIKDcnHMOIpwndLxronNe3sNNasUCAz2ejgbfCUA2FnBa8YUOVQJXHc5nYCKFcqA==
X-Received: by 2002:a17:90a:c087:b0:253:87d3:e3b9 with SMTP id o7-20020a17090ac08700b0025387d3e3b9mr4019302pjs.34.1685496388409;
        Tue, 30 May 2023 18:26:28 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id t7-20020a17090a5d8700b0024df90a4c58sm13892pji.36.2023.05.30.18.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 18:26:27 -0700 (PDT)
Date:   Wed, 31 May 2023 09:26:23 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     andy.shevchenko@gmail.com, Gabriel Matni <gabriel.matni@exfo.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod][PATCH] tools: gpiomon: add timeout option
Message-ID: <ZHaiP/i6e38pH4G8@sol>
References: <PH8PR11MB71425AE7A35F6E651A5B3425864A9@PH8PR11MB7142.namprd11.prod.outlook.com>
 <ZHXB83x85Qchv1XJ@sol>
 <ZHXcLvUNvw75Z-3W@surfacebook>
 <ZHX1bEThvg8Cq8zD@sol>
 <CAMRc=Mc8Wnv_vTizO_UMkKenqr8n2g44x_KAURV7EQhD5ZQXwg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mc8Wnv_vTizO_UMkKenqr8n2g44x_KAURV7EQhD5ZQXwg@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 30, 2023 at 09:10:12PM +0200, Bartosz Golaszewski wrote:
> On Tue, May 30, 2023 at 3:09 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Tue, May 30, 2023 at 02:21:18PM +0300, andy.shevchenko@gmail.com wrote:
> > > Tue, May 30, 2023 at 05:29:23PM +0800, Kent Gibson kirjoitti:
> > > > On Mon, May 29, 2023 at 08:20:44PM +0000, Gabriel Matni wrote:
> > > > > From: Gabriel Matni <gabriel.matni@exfo.com>
> > >
> > > ...
> >
> > I take it you would be in favour of an idle timeout option then?
> >
> > I'm puzzled why no one has ever asked for it before, if it is something
> > that is in demand.
> >
> > Cheers,
> > Kent.
> 
> I do see value in this option. I'm not buying the argument about
> losing events - the same can be said in reverse - before we even
> request a line, we can lose events too.
> 
> Gabriel: please address the issues pointed out by Kent if you still
> want to add this.
> 

And consider adding a test to the test suite, assuming you have a
suitable test environment.  There are timeout tests for gpioset there
already as an example.

Cheers,
Kent.

