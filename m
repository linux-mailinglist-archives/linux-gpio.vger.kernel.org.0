Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A969127350B
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Sep 2020 23:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbgIUVkm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Sep 2020 17:40:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgIUVkm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Sep 2020 17:40:42 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD96BC061755
        for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2020 14:40:41 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id b22so15677938lfs.13
        for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2020 14:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bzI1Aq3hWbeglPVYuuldhchbupgrtN/i3DElgTJLyt0=;
        b=VlItBwTcS4Pvkd3BS8Mjl34txyI86UvmQduG8TrYiNlbzCh+hnrYEuo8ykmdfAaCXZ
         XKke1iif2Uv2huWowudQ5UjnvWsK1PWBpeQUIp96NqvHSpDPo9db2gHdWkNJA5alxJdn
         qocWuMwD4y7RrwmLvu88bvKj9G53Vd6YAo5B0h25zM41Ly8/PHrXs7GMNsI7fQqRJzPv
         RJrYX/iAMkVoZgQHHE9KTvOdrPEJ52EUUJx5LdYIIq21l2taEf0P9QBnlEnR7GadLpfe
         myXbwDrn4eKoqzOVqmrfWKeRGQn2+J4tGITPjP/E2HNO8FNceTziqiqbTkMoF9GZIAL4
         K9mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bzI1Aq3hWbeglPVYuuldhchbupgrtN/i3DElgTJLyt0=;
        b=S3zWI547ibJOUHbcp77HPOZVh+vD98/YvQ1MUajcXnF8Ad4CUv9L00qy70/gk5ddgA
         4rIsoBIuI2BFouTLbUizs3L43/rOByYwrvPlh/XlRxA5F/UdhxNQCTC/l3qodUnTeQoZ
         UO6oHQmuq8WPETzNjigQazwf7s5A8Ss56tVOTTiIw7ZBtOoBSp1+yXuQeSDX1IgqZVet
         3C5L1UsCKwegcychiL/Vzy5p9Mm85nxTyUrQjn2bFRJQcwp9qpXBazZNogEdeflD6hAw
         tgHFil6N+Pslt3KJexYRKUvS5yfq5q3qlRmf5QvTrNXIQaJJfn0tPGRRlsgXqAKbO8j5
         riXA==
X-Gm-Message-State: AOAM531idHVBMkEGzYLTzFjI8ctIz6lu6hf5lIBkpd6C7ZeImfe1LArN
        +LFbtrjsASy/VAp5XrByqB32+BP3zbv7q3TyY352GY9kCZMmaw==
X-Google-Smtp-Source: ABdhPJzKhAB4PhVAIDDHSLdfAXJBVh+PvWuORBNYZvtwJaWFQEo1nUDMIMjJH9ibkczJC9IDJx+NJt4k457MgNWXS1c=
X-Received: by 2002:ac2:4c11:: with SMTP id t17mr651708lfq.260.1600724440257;
 Mon, 21 Sep 2020 14:40:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200917113924.13677-1-brgl@bgdev.pl>
In-Reply-To: <20200917113924.13677-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 21 Sep 2020 23:40:29 +0200
Message-ID: <CACRpkdZNO57h=QZtom-XLPkQ0-vkd1By4dJyyJg1wkNrWC+ynw@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: updates for v5.10
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 17, 2020 at 1:39 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Please pull the following batch of updates for the v5.10 release cycle. Details
> are in the signed tag.

Pulled into my "devel" branch for v5.10, sorry for taking so long.

Yours,
Linus Walleij
