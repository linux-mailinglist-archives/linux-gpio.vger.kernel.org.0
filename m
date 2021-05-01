Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 225BE370454
	for <lists+linux-gpio@lfdr.de>; Sat,  1 May 2021 02:16:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232427AbhEAAQu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Apr 2021 20:16:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230508AbhEAAQu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Apr 2021 20:16:50 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 652C8C06174A
        for <linux-gpio@vger.kernel.org>; Fri, 30 Apr 2021 17:16:00 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id s22so29377865pgk.6
        for <linux-gpio@vger.kernel.org>; Fri, 30 Apr 2021 17:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=U6XAWtlhOMUoat+pVctBb5h0whpZ3amnjRUkoyDthtM=;
        b=gcwH/0iFBunNJkwqA9/06McrcuVmLNb26QgNS9WI0h3REohUKx/PfwKAd7tnJ6ftVo
         n65GAJgZM8lJmONJdoDEHQDCrLBnQXaNw5vZm9yRL/xErzyuiVb55KQ4MgtWAcvtH3Kw
         68yX3E753DLWAllz8/HVA/C7E18/YFnudgHv8GMF+sUUXrBIuQsWAjfRk3wUHA/t+uNR
         64RxnPcPZ0qSmvdut/X4rfg2cwVXb04mHF+m936wrJDGEEyHclhotmgUQS2aPjT5yfRl
         U1yGPfDjIqpXtS/eOWAbyT0uVH+8Gv5n9iDwHUj6euYmV9MetiVlkcQORJlMt+ylyrB0
         /F/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=U6XAWtlhOMUoat+pVctBb5h0whpZ3amnjRUkoyDthtM=;
        b=NL9wJOBNbqjRADgxDwTxGFQA0WSAgCjV6hehQMJ0kzEksP9ZGFpDMaTR0GFRwPjosG
         tiy2y4U+BcOVes/Z6W8bdbvVgX/sJRyasMft2e29k9WCAKoJaxtnjK1ViCoGyFFZQ8f4
         lfpAicG6w6auVPBFpEIv2xkOYyi58jT4CbDSIjpKvJ8cw5XRhn48JkNKNYRYhKuYk2VX
         wFzdLR+for2RK7OvqSn+qXw+IKh31Q8gcivpDdY2Xc/3neTAXsa82zKj2aKdSrzfImld
         omDcMBaQwt8Hq9OObm+aNWn2U00OiRoMAXcNZKFnKEuy/E/DvVr6L+fkbxCp5W/GamCs
         361g==
X-Gm-Message-State: AOAM531R4ZnoemnbqjmZwh/jEkxBvk+/59EuClQalk/5V7stRuphrAkp
        Z/+kIFhW+XZSualm8jyO334ap8ODTAxVzg==
X-Google-Smtp-Source: ABdhPJz833hcUrRxFE//UpMmW67fxx80D7CW2KBWVG57i0grynMaaditk0MDaNZBv+Qy0DJkcmU5AA==
X-Received: by 2002:a05:6a00:162c:b029:27d:a3d:4afc with SMTP id e12-20020a056a00162cb029027d0a3d4afcmr7052535pfc.11.1619828159930;
        Fri, 30 Apr 2021 17:15:59 -0700 (PDT)
Received: from sol (106-69-187-97.dyn.iinet.net.au. [106.69.187.97])
        by smtp.gmail.com with ESMTPSA id s184sm4164995pgc.29.2021.04.30.17.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 17:15:59 -0700 (PDT)
Date:   Sat, 1 May 2021 08:15:55 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod][RFC 0/6] first draft of libgpiod v2.0 API
Message-ID: <20210501001555.GA7168@sol>
References: <20210418034810.GA9261@sol>
 <CAMRc=Md8S=CayttjiEVw7f6LYUZzUO9EE-kv6iyUkDqi_5GE3w@mail.gmail.com>
 <20210419011746.GA4766@sol>
 <CAMRc=McnJbb50Q_7HjB5mDth0DKtmtmGQaXi9M4qLG4DbpONfQ@mail.gmail.com>
 <20210422023206.GA4994@sol>
 <CAMRc=Mfa2BbQx+C59vzeZ_JSLonFYVvfJhA8SuQbV2aGuvR9Ow@mail.gmail.com>
 <20210423013855.GA7321@sol>
 <CAMRc=MfqshaNAZ653rOX1egyaiyC_LJhenskA8Zvq0YQSFOjYA@mail.gmail.com>
 <20210428103449.GA22814@sol>
 <CAMRc=Mdg2+02CU3fhtzpG4wCVeFM9RK2tKovVKzct1JTTnewoA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mdg2+02CU3fhtzpG4wCVeFM9RK2tKovVKzct1JTTnewoA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 30, 2021 at 07:52:05PM +0200, Bartosz Golaszewski wrote:
> On Wed, Apr 28, 2021 at 12:34 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Wed, Apr 28, 2021 at 11:19:05AM +0200, Bartosz Golaszewski wrote:
> > > On Fri, Apr 23, 2021 at 3:39 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > >

[snip]

> >
> > If gpiod_line_request_<splat>_line_config(req, cfg) works better for you
> > then I'd prefer something along the lines of _apply_ or _commit_, as it is
> > taking the line_config, modified by sets, and applying it to the
> > requested lines.
> >
> 
> How about gpiod_line_request_reconfigure_lines()?
> 

That works for me.

Cheers,
Kent.
