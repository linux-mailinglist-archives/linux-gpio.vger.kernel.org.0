Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55900221E77
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 10:35:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728086AbgGPIcu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 04:32:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726843AbgGPIcl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 04:32:41 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA056C08C5CE
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 01:32:40 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id e4so6196865ljn.4
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 01:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lNLNfVPPAHXyv+eb8ftyyjegAwGWrhOLC//iWWVh0IU=;
        b=a8eMFsFUt5xNqeJpZ3u2ZRxxpxDwrwFJVD0nDwMFeJ15CvJdGCmCpcAsEd5yY57HJw
         7F9jOmQE4A8ktqHSk6mk6o5iHDxqXwAZenN3sXTjvCYACKU4VLls6zvfWBijK6+kq/sT
         tdA/GkXqAP3rMNLJAXISr1n/GwwfEx6RwTHBtLA0Ad47OlnvEB92xYwf+n6HbhhIynQ8
         nWvwhUsgNk0gW3PNpaPHpiwsMnJhdFrvYpR5VayiO3JCzN5I3JQ1xLmpD8eLUszf/ged
         AVdu4lh2dQOJyyvLUk7bonTsV0Id/v7h+05lFMqtmJu/I+F6cpIPemAqOVhSodAwOcem
         cjpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lNLNfVPPAHXyv+eb8ftyyjegAwGWrhOLC//iWWVh0IU=;
        b=ovUOQnPfw4T2Og4mJnrg3eqHWnWJ0Mm+ndVzaa0PD1iycKf/qFoPHKFkzBVZbfL8KA
         ZXWbiDDmpCfL19cXX/69DXhVt4m8qGz2DF+Zk87Qq2neKNaj6tXuQ0Un/ilCIQdTlb89
         zmWCPk8/45zNaor6tsIHNCPzYNKi01PPjW2TmHa550NGGuCNhrqUw67l4W177nIToljK
         DmUHcBcBZcpfJ+o/SgSIm4eLC42/EnRXDNBP+psE0x8VErVxJJ8k0KgQvpeR9TCoNCGo
         AxmfsldoDDg2CYbwS0yv/IDK6daJ9btA3xXGbyoVJKDnWmZ35Xcr376FD3eIPn3ZdBP+
         VZ9g==
X-Gm-Message-State: AOAM5306LaF0z1nCx0MwCYyacaHGjsPH6EToPL88csj8q0UVbKDVc00j
        0InPck+u566RDtXl096DP/++5W5uumnS8aWCI3JNBfKjx4Q=
X-Google-Smtp-Source: ABdhPJzgi2w25laszd9DgCZI4r2GaJsH2ivcxS3M0FLKQIG/i0s/VnFMZFUEdmKrZyboxEE1oxCCYQzJJx327kyUqjI=
X-Received: by 2002:a2e:9a4d:: with SMTP id k13mr1530220ljj.283.1594888359139;
 Thu, 16 Jul 2020 01:32:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200701030756.2834657-1-joel@jms.id.au>
In-Reply-To: <20200701030756.2834657-1-joel@jms.id.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Jul 2020 10:32:28 +0200
Message-ID: <CACRpkdbeFP_8R6Q1n7S7g+BS58P7bKx8EhLu73g6PsqfKCjcew@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: Describe the heartbeat function on ball Y23
To:     Joel Stanley <joel@jms.id.au>
Cc:     Andrew Jeffery <andrew@aj.id.au>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 1, 2020 at 5:08 AM Joel Stanley <joel@jms.id.au> wrote:

> From: Andrew Jeffery <andrew@aj.id.au>
>
> The default pinmux configuration for Y23 is to route a heartbeat to
> drive a LED. Previous revisions of the AST2600 datasheet did not include
> a description of this function.
>
> Fixes: 2eda1cdec49f ("pinctrl: aspeed: Add AST2600 pinmux support")
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Patch applied, thanks!

Yours,
Linus Walleij
