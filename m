Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DCF4468873
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Dec 2021 00:59:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbhLEACi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 4 Dec 2021 19:02:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234813AbhLDX71 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 4 Dec 2021 18:59:27 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55563C061751
        for <linux-gpio@vger.kernel.org>; Sat,  4 Dec 2021 15:56:01 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id h19-20020a9d3e53000000b0056547b797b2so8573271otg.4
        for <linux-gpio@vger.kernel.org>; Sat, 04 Dec 2021 15:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zY3i7ftL+qU7EaeCEo0Da0c8vVJG5AN/hKQi41H+yLI=;
        b=hXY+SVGQvC0dITFV/8cw66YveTL2VrAPWypCzem5wLj0zfH0E8//nkk0PU9MlEuimD
         8GJR/HNR80LvvLGcBjuQtk9mGAL+RtIsU24DzgSNKw/CGq/6tIQQ2kVGxDURajHvLdwJ
         xUGOkiJOTh5nc4PFGiaTqbZodn2nnLUqEAXoV387GuNy8z9H88bl/anUL9OZ+i61/VgN
         wrWgmcBkiHuQpbaFDJ2yYWTsYMSt0NaCe2WKez4U3aIVPTRCoMMb9A59BLNcSYBGT5qD
         9YTPNYXfPElaKANjF9CszCxad0tRKRhcaE4Dev27/x+XspjJ/k748foEPQZJZzW6OSaw
         Atzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zY3i7ftL+qU7EaeCEo0Da0c8vVJG5AN/hKQi41H+yLI=;
        b=Qlv7xRq9zjaw5TmG9W/aOcImqIQvAgNUQMQcQbq6B1+ME7In3t/qhTbq/gU5fB4iCX
         uUjNs5jwjRUXtFcMg3j7nr4x3N9Dy49OP+Q8x7k0D6Yir29ue2mGtfPnFIJeIt365R12
         qADlhZo+UR127k1SidExW08TB8pzYNayYwb1KbSzHuxqiFn+Wjb2E6hnIoXT2cspayMh
         h0/mcLfHur4RsKt4T+19b70Yr2yJBKOC4wCMDIvXnQqdIHKVW0JiPz4dcoo9H9wKWuVT
         DB1VjueusfDWkHp1S+n5vn14pQa0POEUlD0HfkfGIJrnfO4wBgn5p/HzGJpj9AGg08Wr
         tg5g==
X-Gm-Message-State: AOAM530qmTkZRSCNOTcW0S8b1Od4cI1JMPbNq9NVd9Huf7Tr53godlh8
        SjtpxIWJvbKhOswqxAKJ/2QSONqm34gHEjVvQ5SBtQ==
X-Google-Smtp-Source: ABdhPJz2vvD7CFG8AqSlV1zqwUTjhaC64nFB3oOay4IJHNTFWeP7piR/EKMbqPy9/EM8NpCWA32hXh9F6VlWbbXvFlI=
X-Received: by 2002:a9d:a42:: with SMTP id 60mr23737125otg.179.1638662160588;
 Sat, 04 Dec 2021 15:56:00 -0800 (PST)
MIME-Version: 1.0
References: <20211129153330.37719-1-nbd@nbd.name> <20211129153330.37719-13-nbd@nbd.name>
 <CACRpkdacgoT-K4qZoBpMx8RiPcvOf=YmrTP36LKyizcQk+VyUQ@mail.gmail.com>
 <c42f4ea0-2879-01cf-1db8-ed39844959fc@nbd.name> <c721ac4a-8b80-2241-3380-6b55e953d754@phrozen.org>
In-Reply-To: <c721ac4a-8b80-2241-3380-6b55e953d754@phrozen.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 5 Dec 2021 00:55:49 +0100
Message-ID: <CACRpkdbOC_CgB_jsVKq7z+mhyK0jo4dvXtjYOuaVeJcCJXufBg@mail.gmail.com>
Subject: Re: [PATCH v5 12/13] gpio: Add support for Airoha EN7523 GPIO controller
To:     John Crispin <john@phrozen.org>
Cc:     Felix Fietkau <nbd@nbd.name>, linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 2, 2021 at 8:02 PM John Crispin <john@phrozen.org> wrote:

> Hi Linus,
> I sent an email to you 16.06.21 explaining all of this and you replied,
> telling me that this approach is the most reasonable one to take.
>         John

Sadly I don't remember that, too long ago!

Anyways let's just go ahead with this.

Yours,
Linus Walleij
