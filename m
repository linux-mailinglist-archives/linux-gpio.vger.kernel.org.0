Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EB62146C96
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jan 2020 16:25:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729074AbgAWPY6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jan 2020 10:24:58 -0500
Received: from mail-io1-f51.google.com ([209.85.166.51]:35755 "EHLO
        mail-io1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729061AbgAWPY6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jan 2020 10:24:58 -0500
Received: by mail-io1-f51.google.com with SMTP id h8so3350125iob.2
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2020 07:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BC99IbgznV51ebkSNmOlrBudQG7GZ3+AdYLBnCjDBqE=;
        b=nU81obDAB3xzze9+m3K7YBN1TZ3htR7PWAbiHRx7Q5iA/6i9aOmjRlME8wQlYZqM0X
         wQ5a7JFKNbQGIBTTU06kgXo0ZNFhy/Oj+YjE3CupnrptmMKo6ZCLr6QuVDliNeZs3szr
         MisGDT6n0ppw396O5BYnEQY7Jh4cLHXRr/bKSUqgq1DdghwcHCLF5aLlEYIRMeCRwHiK
         20np/ldbhY2TFScg6G63Nt0Faf2F4hMbHblW9I2LCk/OBdHbTRyTXRwBt9z0Q5RYE3Vi
         VDUL7Q/7m7/I+iKVhBGAcoyJ28cBk8bJn98+Ag+IRn5QPNIbn5sQSvjV5G5HjRT0wuoB
         nCng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BC99IbgznV51ebkSNmOlrBudQG7GZ3+AdYLBnCjDBqE=;
        b=Mel6QuSuiohz+uH3877lhVGyQtJpGpueNbIhbqKw4aWlQF7iStIkKr+fT+fkz8drk4
         N4jqoMP91+y+NAJ3COEG/CqKdFlmKPV7Yjwubarf+2mlOeOMGSFlOgy4clpOGW0KsDYx
         5CDwGjSAQYmpW5a8rKkaPMWSVq4bYZn4As/Y32BfMNt9q8sEsw44goaXDc+zzkH2o0oH
         vhmILBDg+0M4AZZrdVHCJf00dWreKcagm0M+UT6L0fM/udMEjN9g97JKK243Ct8VxveP
         VvZH59ZY8eAEHwGKHrbpShe1hd+a1kv1rTEKUrhyQzUIZCTY2vNXMmt6jO9x7i1DqHiK
         OyuA==
X-Gm-Message-State: APjAAAUiBnucMa0Sl5a8jLFc87MQRR4e1aLuJNlc7+1H4m9XMOiyFM3K
        Tn/Z8AmtHKVjXmXSlMg+xADhWK5mRjjYTGrZ+X8ZHA==
X-Google-Smtp-Source: APXvYqwGqBocjjR32aYXUSpm+fAyIaNTMJhRfvsKcYSQG+OWC5akeoEIMD2bkacKENwDt1VBALJDMq6ff2W1JRyXVk4=
X-Received: by 2002:a05:6638:72c:: with SMTP id j12mr11974539jad.136.1579793097823;
 Thu, 23 Jan 2020 07:24:57 -0800 (PST)
MIME-Version: 1.0
References: <20200123140506.29275-1-brgl@bgdev.pl> <20200123145058.GW32742@smile.fi.intel.com>
In-Reply-To: <20200123145058.GW32742@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 23 Jan 2020 16:24:46 +0100
Message-ID: <CAMRc=MfNHjYB_8hbN610mnOG8y=9zEOG7+YE1s5-sYoi63=U4Q@mail.gmail.com>
Subject: Re: [RESEND PATCH v5 0/7] gpiolib: add an ioctl() for monitoring line
 status changes
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jiri Kosina <jkosina@suse.cz>,
        Stefani Seibold <stefani@seibold.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 23 sty 2020 o 15:51 Andy Shevchenko
<andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
>
> On Thu, Jan 23, 2020 at 03:04:59PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Resending with some people who could ack kfifo patches in copy.
>
> Haven't you got Ack from Stefani [1]?
>
> [1]: https://lkml.org/lkml/2020/1/7/514
>

Ha! Somehow I must have missed this.

Thanks, that's settled then.
