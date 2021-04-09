Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 818AE359755
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Apr 2021 10:13:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbhDIINu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Apr 2021 04:13:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229467AbhDIINt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Apr 2021 04:13:49 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62C77C061760
        for <linux-gpio@vger.kernel.org>; Fri,  9 Apr 2021 01:13:37 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id e34so494283wmp.0
        for <linux-gpio@vger.kernel.org>; Fri, 09 Apr 2021 01:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+DnCibJ7jXF/NmEn+QdQ6xpNdxPjEP53xLfmAcIWLsE=;
        b=XY6duv67QcyAzpBJZrAT0PTK2f2SmqNQDBccPIsyYoBGN7SCb7B2oLG1OGFyRS0ME9
         cCyPNhh6cEokGPohy2fSCbqXlC6TRVshmNMx3lvwQ95r2Fz7WsVYreaRnqnb0/2u7xcd
         S1fXAFx77qhG2jgcJxZQDwNjJkxTtWvgrcTJ3j6fIHXiDQZi59mwX4fjLEstPXl/eRxa
         BtDQU2hiVika1Cdnc1o/y+e9h5lEBRBnS2ZUC7pUZHAoxjTNybvRvMgUkEXFPa1gOBB6
         4fn0DP3wNedUwjx317Ji42ZLYI4ykBb5/nF/oDKxhG4BthJSE8DR7YlvTlL1hy3nfjGk
         TX9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+DnCibJ7jXF/NmEn+QdQ6xpNdxPjEP53xLfmAcIWLsE=;
        b=nno5Ynt5IycTiqxuPwoUNZu+ISm5jx5SbmtxZBPpc8/kNAa8edGevOvBy9G64XsqGK
         vVFbQsDGLUepwCO1ZZRzahrK6jlqqOgeNv89JH1yDRf3nVqgfYFW1Qrggx3GT0QCtPYu
         fRWfEF3eaCcI5VaFG7hSTRxI7q2WBu0MulJnk9Z/hYty65MXPXabyv8vAyHv5jZzAXW/
         18pPeEcmDFtLge7c9sNNQ5L3huGcYbBo10Qz9K8JgGVRa0FtmqxtZcX0vH8kif65vgqc
         qMimCu799iu3LTY7yxf55BouXjnxqyaARcN7qKgbi5ViejloCsijLEoq81uMZfy6Ax+h
         tiaA==
X-Gm-Message-State: AOAM532YepBshndxzPmQZLy8SrkpubYrwYJ7kDerBfPr1ta0s7X4SDm4
        rfJDWfKcQXOxn3jdEtrauM0aAayvMPLQ8gVFTPSl9TLGnCE=
X-Google-Smtp-Source: ABdhPJyDugk7+S1C/TussRC1Mhp2lpGfMHdDokyuY8GLs6M9zv3fcILHus+BpUyxAxo2Ydy064KEK2HauWmszijcV0o=
X-Received: by 2002:a1c:e912:: with SMTP id q18mr12679195wmc.59.1617956016200;
 Fri, 09 Apr 2021 01:13:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210322033846.39882-1-ran.wang_1@nxp.com> <AM6PR04MB54134144991AB746382FCC0BF1769@AM6PR04MB5413.eurprd04.prod.outlook.com>
 <CACRpkdbh_kn9SjjSqS32m5VNy5k=j6eLCVJDJxmiWVQnYC0ZJA@mail.gmail.com>
In-Reply-To: <CACRpkdbh_kn9SjjSqS32m5VNy5k=j6eLCVJDJxmiWVQnYC0ZJA@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 9 Apr 2021 10:13:25 +0200
Message-ID: <CAMpxmJXqAZBXEsvGfonG8bbTnk+LW0-0kEhh8zLR_4QAY283fw@mail.gmail.com>
Subject: Re: [PATCH v4] gpio: mpc8xxx: Add ACPI support
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Ran Wang <ran.wang_1@nxp.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Michael Walle <michael@walle.cc>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 8, 2021 at 9:20 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Apr 6, 2021 at 3:49 AM Ran Wang <ran.wang_1@nxp.com> wrote:
>
> > Could this version be accepted, or any comment/suggestion?
>
> Andy says yes, then it is a yes :)
> FWIW
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> Yours,
> Linus Walleij

Applied, thanks!

Bartosz
