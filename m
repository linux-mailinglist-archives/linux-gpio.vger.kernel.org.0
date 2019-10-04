Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0384DCC545
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2019 23:54:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728841AbfJDVyZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Oct 2019 17:54:25 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:34216 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730626AbfJDVyZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Oct 2019 17:54:25 -0400
Received: by mail-lf1-f65.google.com with SMTP id r22so5492233lfm.1
        for <linux-gpio@vger.kernel.org>; Fri, 04 Oct 2019 14:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zoPNMzdQSsaX6T9xeXeKifKMZMvmutkXru6+TSI0b7Y=;
        b=wPWEuKlFUYzqdz4qs+FuWOkgujk6xQg4W88Gbwdt69yuCS4wF7jXBJ4GRPkZgyv8Kn
         gK3sYtTACAkkDIUWPIZxxu/0w1Eg23rseLUrwOcuHfzFts5eaU2ossk8ApAjQMalVPBh
         v/j+CjSbylx2eql609qx6b5pr/aMdpGxO+GwWP5fJlJL0YOCSX+tr4e5YbT0x/k5AWzK
         SwQVCCveut9k7OqNDYdHhgBL00/dvo11ApelQlPEGNEN2wE56jYEVWfGecor/prMr+fw
         blM71t5HKQTpeN7ZQUyQfoi0MuHKD/nGja/CpKC9T8UldLJFGLerfT0g3clJhEkHa6Uq
         tB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zoPNMzdQSsaX6T9xeXeKifKMZMvmutkXru6+TSI0b7Y=;
        b=XImG4d2Nj0+27kBjY4bA9nlyPg/5Z4EbqEqC6+N+U+CmC7rOMBXZ5Cc0ZafpTXdc1E
         XeVpicAs/EQLVX/9ChUBYPkwG/jdkNG6xVuhoc1IaoLiMRQBI/HJZ8ZwDzmqb0qBEIJz
         Rmx+Q/pIVOXxLIGDvFXn4gDcIRZkYvXQp1/0Rjg80cDKikkKrzr3yuyFw3jxeGEc4w84
         46Ke8vt86g8mK85BHIQ1dhkz1kZkGO0zXkG3qhh21NsXH4zUcnQjmAplSxrrFi2FXagS
         y12jIVQtcgalqkMY3y+Db2wgLvJlRE8e/2JqF2MX16TrrhmUnVhttz7ynuu+W+pTwiz2
         y1Bg==
X-Gm-Message-State: APjAAAV/yXZ+HBXhPAOhrnp1DM416CsCfx17Wz5wBgwlw4/JV3bIlUGm
        BF7KUTFJ+ytqaMjM2hQWdyAaZOz3b7EPg+8CGN5rJg==
X-Google-Smtp-Source: APXvYqws72vP4SKYhJ249ciHl03mUZyS9feS1uY1gUxq8IxgZYM6e4vR28Xp5ay5FGaGgDRYYJMV4A6rfFLyAwnEyp4=
X-Received: by 2002:a19:117:: with SMTP id 23mr10232144lfb.115.1570226062105;
 Fri, 04 Oct 2019 14:54:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190618160105.26343-3-alpawi@amazon.com> <20191001154634.96165-1-alpawi@amazon.com>
In-Reply-To: <20191001154634.96165-1-alpawi@amazon.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Oct 2019 23:54:10 +0200
Message-ID: <CACRpkdY7bYBytGq-AnMrRVWn=-ASz=xTA-_-5wCfsymch4qW9A@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: armada-37xx: fix control of pins 32 and up
To:     Patrick Williams <alpawi@amazon.com>
Cc:     Patrick Williams <patrick@stwcx.xyz>,
        stable <stable@vger.kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 1, 2019 at 5:49 PM Patrick Williams <alpawi@amazon.com> wrote:

> The 37xx configuration registers are only 32 bits long, so
> pins 32-35 spill over into the next register.  The calculation
> for the register address was done, but the bitmask was not, so
> any configuration to pin 32 or above resulted in a bitmask that
> overflowed and performed no action.
>
> Fix the register / offset calculation to also adjust the offset.
>
> Fixes: 5715092a458c ("pinctrl: armada-37xx: Add gpio support")
> Signed-off-by: Patrick Williams <alpawi@amazon.com>
> Acked-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> Cc: <stable@vger.kernel.org>

Patch applied for fixes.

Yours,
Linus Walleij
