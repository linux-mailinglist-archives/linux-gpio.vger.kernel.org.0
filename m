Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5391B79B0A
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2019 23:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729923AbfG2V0H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Jul 2019 17:26:07 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:44661 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725945AbfG2V0H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Jul 2019 17:26:07 -0400
Received: by mail-lj1-f195.google.com with SMTP id k18so59962423ljc.11
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jul 2019 14:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IOAkkAoIsN9sHvDxLgNcH/sua9kV+XEpLvGj/nga688=;
        b=Py7C4V/TZp2Ls0KYRmiTL3RrsnPEJxJLQAFBrIJiqRG0JHly9aPhamT/5Fov9ByJSc
         LDO+Jfa808FKx9vATTDqOjYTp3gJVpooF9OaQrtJkDq2M4NnOwzTxVbHiFidkUd4WUGm
         bES3LhGfOMGBhsfTYQ9Znxz0TKhH52UDeVOcuIKw1KMiOoYCywgnetdDuhWSSQn16Cda
         dI1WI6h9fou7VP4DbhdkteclN0WwN6xAxwMYx5nKBqkNLR8Omt0q8jUh3RBzVHKUC4N0
         zeFVqiA4Q3eF9vhKiIaqS0KhBCNcElWH3yiIqZt/SKYItGMnQpjnSFlvDBHK7SD6iPue
         NwUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IOAkkAoIsN9sHvDxLgNcH/sua9kV+XEpLvGj/nga688=;
        b=B3GsItvc3VcFM414wYuYhMLDkKyLS9OSzw11xZmi4xAo619ah5y25GIYaHYaAL/Joh
         QpOQMltCMzZVutyB+IPpwOFmlQ11Mn5ycj5Z11Y4OhHb0qkfruEF0zBcsZvS5R9trovD
         GePBNPMe0YwRPm8t9W+u9u20LFtjWJjYyU2W13O6NwtGRVizr8Fd30emubH5QG3v+zYp
         5fxgubFgGxd3t+kaxLvFQoK4BjlAClbCDbRSAvmimEBSR+5wTG60aPXUWzlRmS/fdb1K
         u7pmSLoNzhSHZsuwiPAvmcqn6q1wXWJGVgE2oLhCUH3mvCy2YFTBYv/I/50MjOjvEE/A
         Ee7A==
X-Gm-Message-State: APjAAAUOJ4nxpzpQwCCYRVvFMyS0naUCVUf78jucatmMFQN3lU1TlCe6
        a4grxknvWqr5XMmCvGI/5vk/+5+Ua5k3YxhiegQ7Hsgh
X-Google-Smtp-Source: APXvYqzbOiMjz9SVM8sEmP3EO9KLlB4LmuEAAw/sbD+LCqz23P+GTnXMFLd8SNwVCxeMKVAPl6f/+jnDpLVZB6j5JnM=
X-Received: by 2002:a2e:9593:: with SMTP id w19mr12021403ljh.69.1564435565837;
 Mon, 29 Jul 2019 14:26:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190703145615.74768-1-andriy.shevchenko@linux.intel.com>
 <20190703163630.GY2640@lahna.fi.intel.com> <20190723155132.GO9224@smile.fi.intel.com>
 <CACRpkdbb+efsEZeOViKyr+a-NXzJ1vBXx9dEnFzpeK3g9Qz+BQ@mail.gmail.com> <20190729093743.GG9224@smile.fi.intel.com>
In-Reply-To: <20190729093743.GG9224@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 29 Jul 2019 23:25:54 +0200
Message-ID: <CACRpkdYtNz3hz-cyeU4zpeXucGv=eBJmcuHC71dtUvZwJB=e+w@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] pinctrl: baytrail: Use devm_platform_ioremap_resource()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 29, 2019 at 11:37 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Mon, Jul 29, 2019 at 12:06:52AM +0200, Linus Walleij wrote:
> > On Tue, Jul 23, 2019 at 5:51 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> >
> > > Pushed to my review and testing queue, thanks!
> >
> > I take it I can get a pull request with all the Intel pinctrl changes?
> > They all look good to me.
>
> Yes, we are collecting them, and GPIO as well.

Awesome, thanks a LOT!

Linus Walleij
