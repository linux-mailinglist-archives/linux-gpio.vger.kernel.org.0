Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D68FFCC4C2
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2019 23:24:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387555AbfJDVYU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Oct 2019 17:24:20 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43588 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730814AbfJDVYT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Oct 2019 17:24:19 -0400
Received: by mail-lj1-f194.google.com with SMTP id n14so7851297ljj.10
        for <linux-gpio@vger.kernel.org>; Fri, 04 Oct 2019 14:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hNGHFdo8S+XEl4ip8OV0waiNXwdBZOvLZWPEbaAFdNM=;
        b=NssoX+yI2Cgip/+Cwjg0GyMlo5A71XQr2ocWuZhlzYPkmzgbKvQlJyJYhcPoA+OKxa
         U5rtXE+xhKdQDS589JqhTYZ34Mhs6CHauo9DCh7MenK3ReWuDy0hYfxcjHlCj/tLQCnL
         rPAVfSSL1RzTwO294FsRpDk5Kux2n+yeTdDG+Or2bp0SnLCxChtgLJLeZt2HzKjx6yjp
         o8O/vg3l5OKp4QMi1X4kbkTUqa6v8sVukZTxHWhXF5btPpRICEzIw/cLSmY3+OW/0160
         v52tjq5PACVQprBMz2eUQilH1kiklfMsBO5732TVRSQ0ALApvD++8vEib3S4xsWmQJo4
         iAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hNGHFdo8S+XEl4ip8OV0waiNXwdBZOvLZWPEbaAFdNM=;
        b=J0pkztoZ0eDHKiZxeXxDUITF8H0ThLkN6OhifKkB5KdYe6nl72QosUiA19mszxGz0F
         O/vd/wZiKuc8WvxBsZMXVSzDdcdgLx/2PE9LvsUara5bKlWzbMVE0pOagW86rsFbunEQ
         RoNeeLqmzEbdn/q24TquAuL1S2ps1y/ETsRaRjurjVQFM/V7j4wFIpTFKWfnVUL/vcAD
         7a7WqTTRn6iosNSgoUJhN4GSTWtcOxK0O0d2d496xLnAkUWge67VW6oISCCmaR7IUyrz
         3CG6AhoY4vaKDCpia9K0hKhOjkjmJCROZzVggykJ3mU/wM3HkUS58DYNEBuSZy6Ot689
         DpGQ==
X-Gm-Message-State: APjAAAWTAPba7L6XHNLvhbE2GlcAwZmiixcHlptqRaCOlScTmGgGlbee
        QFgWza09WCJx4c22ktdqL5pRVhrAHFzMNad5bOAeRg==
X-Google-Smtp-Source: APXvYqyMA9RzeuncA2ngYUaYy5cXaQEwJ+1dQ0bAT1/5pc3cn5SzEaJQSouN1M7jDax6q4MjNNAX0ngD/1TPXgjETbc=
X-Received: by 2002:a2e:80d3:: with SMTP id r19mr10510006ljg.41.1570224255943;
 Fri, 04 Oct 2019 14:24:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190910152855.111588-1-paul.kocialkowski@bootlin.com>
 <20190910152855.111588-3-paul.kocialkowski@bootlin.com> <CACRpkdY40PZc9R-yFwooR4-WMgn3LH7K+yTx00ZNxyq6OOnw6A@mail.gmail.com>
 <20190923133325.GA57525@aptenodytes>
In-Reply-To: <20190923133325.GA57525@aptenodytes>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Oct 2019 23:24:04 +0200
Message-ID: <CACRpkdbtFQWJK_RtdHrh8hr9HTq4Pmnd9VXC11H45w9XvGCU2w@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: syscon: Add support for the Xylon LogiCVC GPIOs
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 23, 2019 at 3:33 PM Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:

> Maybe a first step would be to introduce Kconfig options for each device and
> ifdef around in the code, as to solve the "built unconditionally" aspect?

ifdefs is something we try to avoid using too much, better for things
to have their own files and use a library, usually, it's cleaner.

Yours,
Linus Walleij
