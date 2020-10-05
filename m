Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E6E5283637
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Oct 2020 15:06:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbgJENGR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Oct 2020 09:06:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbgJENGR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Oct 2020 09:06:17 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 656E5C0613CE;
        Mon,  5 Oct 2020 06:06:17 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id u3so5570252pjr.3;
        Mon, 05 Oct 2020 06:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RpEUWf5x3kBexxHD9w8MwGv2yxAHkVms5tc+d1P5ftk=;
        b=Eu3Cd3nJUFxao8jHyz/1h1nT6pL0kgPvCTDJ952w4TfnfOOCDT7lbsxcwJDWUm+dcc
         6RCxnwvrixDEo5j0CZUw8neUUo5QM6jakhLdUD6UNV6kqT/uTg9P6B77/7PsfnSGAezR
         pmBunyaw6lFye15n4BSNagyUmDp92pu+bgUlKdi2GNG7uhz/M5zSQn6Lyx9HXPbdDstM
         a0fXsISMTG96NqokpZdyfNvK/qOl7vOXJgDA16KjGCJFQp3y3FKrcry2gBEg/bVrJDsR
         AZ3vDkVWbPPWHdwkKCckQ/vjW+9/zZG3WIPFxulCC7AtXghNxJjXUIMWfopQ7twOJhUu
         lVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RpEUWf5x3kBexxHD9w8MwGv2yxAHkVms5tc+d1P5ftk=;
        b=L7CKLbkeJEgQfRfROeiRyLq0BMYJlI1Wivu7I4EA1wNq+A75Ay1fhOiSiGlWR4K7wq
         +Libm7r/UFf7m/kVaZSlCMzGdLAD94iauNDssGt2t0HPvSBhqdKZ4FGZveua5SQb5l7H
         hUF9W5ITChBAQqsVkUlwGiBmyFBAnCepElxyXD+6BR+Kv0qhsK0BTW+wuE4okoEDYzNq
         oMyICuqf3yjFTQpQpvdINJG+OE8GkcxZCPbNufcpY/o13ifOpTYgTms4f7TiUcOeOw1X
         m7Ee0m4XMDoxoF6sw0SNcXBtUouuK9ZLWssZbByrGeUQtL2M7CbAGLbQJl5MMyA7h1+M
         366Q==
X-Gm-Message-State: AOAM531S/rUngFkKklsrdg/ORDRIj5OJTsMe/22PTtszSHLszeBUB0U7
        6u40maCQYg3upDp6YDH2VkM=
X-Google-Smtp-Source: ABdhPJzmjPUnYF+MlBN1/fP5Lbivcd90LOYT44vpOpU++yw3cOIscCpHxkqEJbeI8bfjptF2xM3lBg==
X-Received: by 2002:a17:90b:204d:: with SMTP id ji13mr5233053pjb.83.1601903176770;
        Mon, 05 Oct 2020 06:06:16 -0700 (PDT)
Received: from sol (106-69-166-86.dyn.iinet.net.au. [106.69.166.86])
        by smtp.gmail.com with ESMTPSA id g129sm12401261pfb.9.2020.10.05.06.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 06:06:15 -0700 (PDT)
Date:   Mon, 5 Oct 2020 21:06:10 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 5/5] gpio: uapi: clarify the meaning of 'empty' char
 arrays
Message-ID: <20201005130610.GA33067@sol>
References: <20201005070329.21055-1-warthog618@gmail.com>
 <20201005070329.21055-6-warthog618@gmail.com>
 <CAHp75VdJ7zqPtWXKp3cUqPw3ZT7K0Dxzf7NYK+Zk9ZBhAPqG4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdJ7zqPtWXKp3cUqPw3ZT7K0Dxzf7NYK+Zk9ZBhAPqG4g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 05, 2020 at 02:01:22PM +0300, Andy Shevchenko wrote:
> On Mon, Oct 5, 2020 at 10:07 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > Clarify that a char array containing a string is considered 'empty' if
> > the first character is the null terminator. The remaining characters
> > are not relevant to this determination.
> 
> >   * @label: a functional name for this GPIO chip, such as a product
> > - * number, may be empty
> > + * number, may be empty (i.e. label[0] == '\0')
> 
> I would rather put it like
> "...may be empty string (i.e. label == "")"
> 

I'm not keen on that alternative as what it suggests is actually a
pointer comparison, and even if the user realizes that they may instead
use "strlen(label) == 0", when they shouldn't be assuming that a null
terminator is present in the array.  I avoided mentioning "string" and
kept it in terms of the char array for the same reason.

Cheers,
Kent.
