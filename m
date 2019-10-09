Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BB3FD10BE
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2019 16:02:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731317AbfJIOCA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Oct 2019 10:02:00 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:33780 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731254AbfJIOCA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Oct 2019 10:02:00 -0400
Received: by mail-pg1-f195.google.com with SMTP id i76so1496811pgc.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Oct 2019 07:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+AeLir6QWyueSN7OUH4ytnjQCqMSdKCLKVG/J3fBveQ=;
        b=uqOEfUFn8W9Tw/A2XLLNkPQretOGc0JtsnVINy7k0dYGlez3Vl1FvZcgmxdrGYMEHJ
         C6b3dIrXs0LWSpFVrPeTmheLdQRLtETW8c96LlrjrwOnQYMMx5QmMvTIIjiGzNj4dy5e
         dCW/DuctSFDpS32Oqk9ppVyb+so00b4gXuFAl6G7tiKLe+qFquImwlSxhm/jXuz0CoCr
         xdE6VA+LmOh1qoNu01zLazJ+KmysQ0EDY1Mq+WEb5FC1J0DRqPiJPNr9ABKVjEyIZ3+s
         eWKW6Uj37jCGgnlzZc0OaDwDnCMNtlKw/qkYAMMNAr0ciiE6jN6/OmKK8vAN5R+qp6vd
         dkFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+AeLir6QWyueSN7OUH4ytnjQCqMSdKCLKVG/J3fBveQ=;
        b=feONG3hYaz8HC69heaXKOvZmJjumyg1J0CzZ/FxoChk750Os3YUXY6MBY9G2CpfQJZ
         buBwXhgQvkJnHy/xqlqR0QqcVzdi/gTSEXEJ5O9wm0zXz/6+qxAMxKgWzG1iclzBwT/0
         918m9/6YKdFnlIWkrPxnXg9shuq076a5ycHTY+D+5oZZAaBsJxMtC4Kl8UgZ2QM24nVA
         Gz1pSWwb4F+O3sJul7C5B7ccaKAQueTw70PTU6eLMjcjNnD5k34ZG/q1IoOb8Zmq8Sdi
         tZ68Z8DucjkPQark/5Daw/LQnZ1S0g9l3dqGZkaXDm6+iBVwyUGr3TtX9D23h8MT4TWH
         lDCQ==
X-Gm-Message-State: APjAAAXiONg1koFGaWE3zBBYPEB+ByHTmESG3iGHcVdXP2thc6YaCK/t
        kNzU4hl1lL4wapLfu3LJBUY=
X-Google-Smtp-Source: APXvYqw6m4iW0TBER7bn3au2Dq7i+eIf6j35twBRjpN5MZ6NemVznL667cIR9h17XKv5sA1R+V7iVw==
X-Received: by 2002:a65:6797:: with SMTP id e23mr4469620pgr.255.1570629718988;
        Wed, 09 Oct 2019 07:01:58 -0700 (PDT)
Received: from sol (220-235-84-126.dyn.iinet.net.au. [220.235.84.126])
        by smtp.gmail.com with ESMTPSA id z3sm2545101pjd.25.2019.10.09.07.01.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2019 07:01:58 -0700 (PDT)
Date:   Wed, 9 Oct 2019 22:01:53 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Drew Fustini <drew@pdp7.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [RFC] gpio: expose pull-up/pull-down line flags to userspace
Message-ID: <20191009140153.GA22016@sol>
References: <20190921102522.8970-1-drew@pdp7.com>
 <20191008061512.GA19956@sol>
 <CAMRc=Mf8DsEOWcX2BTtdVtsRkNXB3oA-xt2SrWJTn6vt3Fd8Pg@mail.gmail.com>
 <20191008232120.GA9225@sol>
 <20191009135738.GA20539@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191009135738.GA20539@x1>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 09, 2019 at 03:57:38PM +0200, Drew Fustini wrote:
> On Wed, Oct 09, 2019 at 07:21:20AM +0800, Kent Gibson wrote:
> > And while we're talking, does the gpio-mockup support pull up/down
> > being set from the kernel side?
> 
> I was curious where this refers to the kernel or libgpiod?
> 
> I see there is:
> libgpiod/tests/mockup/gpio-mockup.c
> 
> and:
> linux/drivers/gpio/gpio-mockup.c
> 
The kernel one.  I was referring to being able to change the pull on a
line using the pull up/down flags.  It can be set using debugfs, but the
point here is to show that it can be set via the new flags as well.

Cheers,
Kent.
