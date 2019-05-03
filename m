Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90A2812820
	for <lists+linux-gpio@lfdr.de>; Fri,  3 May 2019 08:55:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727141AbfECGy7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 May 2019 02:54:59 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37943 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726182AbfECGy7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 May 2019 02:54:59 -0400
Received: by mail-lj1-f193.google.com with SMTP id e18so4358147lja.5
        for <linux-gpio@vger.kernel.org>; Thu, 02 May 2019 23:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hBz4+yiuQjXPLH1KAsmMsIM1wRgzxzGB2JbaU1ql2DU=;
        b=sVRMi/DJmrrgH/2QPq/HwUbYwDJw9IFCAT7qVP5WGBPZEroP5fSMoT2OLTeqF+u89U
         om2uw4eq2IIpFviSmf+TjuS8UdyIu++38nlddcW7MPBdxWVz8rHEjZ3C5yDjYuyN+n92
         KupEWlSJtYqzGUZ/PO7DIrSrNU84MLxq7AvCtEdRqQhWIScoldabu0s95H7he4j3l8iY
         E28wXNieUxPctaePEvU+8++2ekh5gvjt/Ws9wcqtasdf6nsrFBeRit+oQbrOiHlxof/3
         mLp9aaH+ebBVplOkGMrer2t/KVUqnnc6jQPySL4RzzD04mv510iWdrTeQcleQeOdSo1W
         tnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hBz4+yiuQjXPLH1KAsmMsIM1wRgzxzGB2JbaU1ql2DU=;
        b=EPBDGpGxNBCP0Re4OGnTHDsDAsoiKqmzddFt1VNS8SOzCMN8Ccn4Q+0uk0tX+fcKl1
         2vK8SAdLX86rWxxvRvf/BqRvN9pv2n8Ua7QEYoS2KoII6An8u171Ye2IjXk0IgqQBUwy
         MnW/iw5jbfFhYcpExtgUp5FxoTCmMb7udWlbBDI8vbOaWFZ1Z4SPmYQp10JWWqCUDb6H
         sfR8OLqtaJBG4kXXQt0vfUciAmWDmYzZqj2f1NCExzgr3dA9Nv1rYjeyq3eds572OnUN
         IymFeWT1p6fXvFjekqfee9lPNKDlURkST2iXz4m622CKt9dPB55POjxnWxYNqPsAWKfU
         dhew==
X-Gm-Message-State: APjAAAXfRq+HMCJ4Z1wkbKLuSSf9uhEhjrXNBUyN0xVAWP/fRqnNJdYm
        uJtZ7ohcZeMrSN5OprIcecPi6z4S9IGrEcNSCQkxzC0IZaA=
X-Google-Smtp-Source: APXvYqxEdOe9qyQToC9y9v8WHIzuLQkgky94xWFfOYkm+skEbDX6tXI4BpT0semqfP6NrVTQVRTJRAdnf+PiYVo4wSE=
X-Received: by 2002:a2e:9d86:: with SMTP id c6mr2002903ljj.135.1556866497584;
 Thu, 02 May 2019 23:54:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190429100007.GA69386@black.fi.intel.com>
In-Reply-To: <20190429100007.GA69386@black.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 3 May 2019 07:54:46 +0100
Message-ID: <CACRpkdaag0EAzs8-B3Q0RzeG3ZQp1AMGpeM83CvRCy2T6RxDoA@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.2-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 29, 2019 at 11:00 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> There will be a conflict due to a patch for Intel pin control landed in the
> devel pin control queue. Though, it applies cleanly on top of for-next.
>
> I would recommend to drop Intel specific patches from devel queue.

OK I dropped Chris Chiu's patch from my queue and pulled this in
instead. Sorry for picking that up by mistake.

Yours,
Linus Walleij
