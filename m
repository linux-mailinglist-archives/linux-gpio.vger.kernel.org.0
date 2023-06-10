Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E821C72A93B
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Jun 2023 07:43:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232505AbjFJFnR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Jun 2023 01:43:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232262AbjFJFnP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 10 Jun 2023 01:43:15 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD6513AA5
        for <linux-gpio@vger.kernel.org>; Fri,  9 Jun 2023 22:43:14 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1b3a82c8887so828515ad.2
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jun 2023 22:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686375794; x=1688967794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S0E9TqPlClkIkHO+5O6SHOK2wGvqw8vvKKZgxDdIA58=;
        b=ehxZ2tJJ+t7XM0Wd0ZMB4vbxxGKlA95yzAAydTbIhcnAKMxqoyCHq3ui1wJzZASSqH
         3eqG6Z2krUc2SB8KvKVErAhrUHD0sAQtXSlXANHay5xwP8jN7rmR/lZIDKpSJIT7Tqh1
         +JYJXs50J8bJzUlPGsWEPSK7UuQfEkaX897U6v6U6qmbqa3Wh20oga9vJnBX+FnJMjYt
         M6AUKH+PssFLRJBhmzgRNBaoxv0HjiymvNUB+mydsDMxToMlO1qvx+ByzjuH8beuvu4X
         sObK0Km4n+gNnuOlUcmXEjnaIjxsk6ZpUKQiJfA+NZVZXCSIk8xx9YbIYFZRdpkzsKZR
         tNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686375794; x=1688967794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0E9TqPlClkIkHO+5O6SHOK2wGvqw8vvKKZgxDdIA58=;
        b=BsDRUIB4uyRnwBIAcwk82RO+fRo+/FqXcX0fH4N5f9nH35eEor1TlaGorxdmuRU7f4
         lxNXPd/nKf6CJnpVtbGCkpvwzONGd6ecJ3lckjiK8wpSUKWuJGlP4XAcHcOFaNTgOBgs
         fiXwRJWgJo1CChFquhOEzryhKRA9m7ilg7oJVuV3B9zi/SnUXw4sFvFN3AQGhjhsJG4N
         nYYxfXmDnI1q+xbqhEQ+NV5m2Aq4jW26YeJxzXrXpddCyiv2qaHGxJcTYMMJS0KRVZM6
         rJXqjktAG8l5S0ufcIZBqp8OHhs+K7/qY38oyRLjtlWSG9YadyZmTx7S00kTGeZf7jB+
         gUWw==
X-Gm-Message-State: AC+VfDzvZ+MbR+FPCcSjoTRbchZXr3hRvLI+R5lVAA+JsjhYT4QkOFuU
        V+RJkywpYbsPTPcx/+a9AXruNwKAFP4=
X-Google-Smtp-Source: ACHHUZ4GUhjjnA5tTtq4uGyTDpp5RIaHFVnK+jzOcUyACTrvCYSY+6NtuP2l+uJHTJDXH4DeFtsFjA==
X-Received: by 2002:a17:903:244a:b0:1b2:409a:3099 with SMTP id l10-20020a170903244a00b001b2409a3099mr1076360pls.58.1686375794211;
        Fri, 09 Jun 2023 22:43:14 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id z24-20020a1709028f9800b001b016313b1esm4151970plo.82.2023.06.09.22.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 22:43:13 -0700 (PDT)
Date:   Sat, 10 Jun 2023 13:43:08 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     brgl@bgdev.pl
Cc:     linux-gpio@vger.kernel.org, llvm@lists.linux.dev,
        oe-kbuild-all@lists.linux.dev
Subject: Re: [libgpiod][PATCH] doc: add configuration to generate doxygen
 documentation on readthedocs.
Message-ID: <ZIQNbB30BUsirOr1@sol>
References: <20230610020148.8973-1-warthog618@gmail.com>
 <202306101327.8CQ451FM-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202306101327.8CQ451FM-lkp@intel.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jun 10, 2023 at 01:20:47PM +0800, kernel test robot wrote:
> Hi Kent,
> 
> kernel test robot noticed the following build warnings:
> 

Ok, not sure what to make of that - why is the test robot concerned with
libgpiod patches?

The files in the patch aren't ignored by the .gitignores in the libgpiod
tree, so it must've applied the patch to the linux tree - which doesn't
like dot-files. That wont end well either way.

Can we tell the test robot not to try paddling around in the libgpiod
pool, e.g. ignore patches with the [libgpiod] prefix?

Cheers,
Kent.
