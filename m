Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68EC42B0FE
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2019 11:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbfE0JIS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 May 2019 05:08:18 -0400
Received: from mail-lf1-f45.google.com ([209.85.167.45]:43856 "EHLO
        mail-lf1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726063AbfE0JIS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 May 2019 05:08:18 -0400
Received: by mail-lf1-f45.google.com with SMTP id u27so11506098lfg.10
        for <linux-gpio@vger.kernel.org>; Mon, 27 May 2019 02:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rDjGbdorg9VdOEm4pIIngWtSBO/UW2gLWez1MYyE5DI=;
        b=E87KyphMNdtx1RsRmYPA7RZccxTrwICvaCPBCt6Rnum603pJRSQWXtq9KRBVqbkMDq
         VsFCOGB23YIxRLhNa8hmeLmoEfl77mssf1meVNMOxjpX+Ky+6n/vHdKxlN721QOkdmna
         fiqyNBQAHz+7XcGzjyV/GkJSYTZd7SmmCe4H+2lN0geyjNMjTc0gxlIeW3oKwEFxd76J
         o2q5wHmrhVo7Mj0kANCj4QxRpXuc4suEOhtOeFZrBfB4O1iyZ6P+/ureqQVGwKKwU3XQ
         g3b6ukVTPUAm1UygJg6i/4thEOp2nwgWFxSKk5zC7ZkA81IKCNMP2iDkQL4qHSoYTfJJ
         Lvwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rDjGbdorg9VdOEm4pIIngWtSBO/UW2gLWez1MYyE5DI=;
        b=dt+C4qE0SsAh/ju5rkYfFyljYyo7opR1+JmYbIRgrwnlxXkBONT2aVBo2m+3CTerwJ
         r3YRJw7kX3aOeCEGeWeU6DEgDx7mKePpnvCYp650EBKgr0mpqwoiAL4G+YEQSYU9+VVS
         MdXMGRQmyiuFZETEGRekvorIepqnj9vENnhObNfrCl+khojtKkUXQ5VVeHNOcRW2lxvI
         BiKBNR+WqudYzpSWYlAAAfoo9OEn2kJv6paBbfAcfe2PHA0NgBZeTbRlShpspuQ5Z5x2
         rH4gs2S/kiykIUVt9mT5uNE3A4E44DNjLZBVUvI980yD3qpAHqC9YWbWZzPrBXGcI6n1
         4j4Q==
X-Gm-Message-State: APjAAAUaET0Hde8AkDe+ggmyeOZrnXHaQ884aOAw+sV84Nc205/qOwNB
        d5M7CGRtugsfPbGeCXKa+tynwzQcR/yXFitQjj7H3BQS
X-Google-Smtp-Source: APXvYqwv1JTcOZe837wXtstcLIpuvvkHuSYKbOWbc0VNjwntjC/e211gRcOyWBz3ZNq0k3EpHAzF78ipzFtKlGnM52Q=
X-Received: by 2002:ac2:48ad:: with SMTP id u13mr29300961lfg.60.1558948096536;
 Mon, 27 May 2019 02:08:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190524154424.GA68376@black.fi.intel.com>
In-Reply-To: <20190524154424.GA68376@black.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 27 May 2019 11:08:04 +0200
Message-ID: <CACRpkdYLKG1pqzaTZc8StgigV1YF3Du8Xbg2A+Sq0N=-dz9S9A@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.2-2
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 24, 2019 at 5:44 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Bugfix for v5.2-rc2. I send it separately due to last minute arrival during
> merge window.

Pulled into my pinctrl fixes branch.

Thanks!
Linus Walleij
