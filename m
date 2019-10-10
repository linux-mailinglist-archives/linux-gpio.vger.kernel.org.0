Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4E82D3440
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2019 01:23:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbfJJXXq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Oct 2019 19:23:46 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:39025 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726135AbfJJXXq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Oct 2019 19:23:46 -0400
Received: by mail-lf1-f66.google.com with SMTP id 72so5648284lfh.6
        for <linux-gpio@vger.kernel.org>; Thu, 10 Oct 2019 16:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eI2LdeT57YLofvFeveNckvQGsjhBiHe01DRAZu3rCss=;
        b=mm/gsgpc3A7y6M3sUzl5REeS5ScaZ+FzI1mu+CKBNLMkPLhB68yXIzxLTrIWCZl3rt
         okhAUOwPSrIK7QNx0PptXtO+Xp1iP3rA+c/7vuC6O4nGbvSH+Lun5LAZIesvZFu1v5Ry
         V68eJmqaOKyJU25ut2glvuysYH2hllEt42E5mgrVbBT/4D+Gut9/IU7X3C3k+Sc7S3vs
         EmBQdirOXenFxaHdPRFQ35UwwDtTZzL9l5+gtt58pw3V14cIPnsqQ6AwwvQOycQ0C+ET
         /QPGkgLV2yCEtmBoDg4Om0CkWjCXdwSXlRfYCRXPZBFyEqjSb1u6uGe24uiHBVE6hfqd
         xEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eI2LdeT57YLofvFeveNckvQGsjhBiHe01DRAZu3rCss=;
        b=rvU6j5bBi4e5j4hivKFECpS7kMxahn16Riqgk3NYnnY6n5aWvBmXaw6ROdaybdNiGT
         Fy6lJ8jbfZ9GTCQUHzyOjYI3w68Hn9U+Yf84S8PrC2QdkLji6Qr3cKZSMfvx3wes3gci
         7c6vCiHNI0njTi3l42dRBduUiJ8+MKtZMwyOx2O3H3rri1tmIKmecCia7DEdoDa6jeRi
         0dwgAKO2wBhvlnodS5Mpcv+NHO/EVOlVZlYNNDGqKTT1SsVrNODrCq4yAM8/O/wCfeS0
         SG3Ew0HNit/npVXzmc658ix8nLBT94Ym7ar3C8vkB9Oxxcjh/iScLTSwIzIGZjwBHp+J
         IxZA==
X-Gm-Message-State: APjAAAXrt5WUc6AAUiY3ZXUoXSdqZH2JIUqB6lTmFQuUBFhWxygb8MXy
        yNyrU18PFbXovqBFUi+7tRIR8isuyW8Rfis/dhr3cgcHBLU=
X-Google-Smtp-Source: APXvYqzyPzXL99Y14yGQpqbm61Sey+8rDc0ZWW/9zMfQu/jCWJR2MAE9qpLdkxXAifyswozldh9pabWQPjioq3B/rU4=
X-Received: by 2002:a19:c505:: with SMTP id w5mr7321232lfe.115.1570749824284;
 Thu, 10 Oct 2019 16:23:44 -0700 (PDT)
MIME-Version: 1.0
References: <20191008110737.GE2819@lahna.fi.intel.com>
In-Reply-To: <20191008110737.GE2819@lahna.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 11 Oct 2019 01:23:32 +0200
Message-ID: <CACRpkdb7D4TXsOr7jXon3F7x4Kxcb8wKezLdOL4RXvv4rx1Bqg@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl fixes for v5.4
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux pin control <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 8, 2019 at 1:07 PM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:
>
>   Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-fixes-v5.4
>
> for you to fetch changes up to 260996c30f4f3a732f45045e3e0efe27017615e4:
>
>   pinctrl: cherryview: restore Strago DMI workaround for all versions (2019-10-01 17:36:40 +0300)

Pulled in for fixes.

Thanks for all help!

Yours,
Linus Walleij
