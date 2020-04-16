Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D90991ABE90
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 12:57:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505279AbgDPK5x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 06:57:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505561AbgDPKtw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Apr 2020 06:49:52 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54BBFC0610D6
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 03:42:47 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id h6so5251109lfc.0
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 03:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5sBt7Y0J5CJLOpgj9W3lTxZluw2lpZwvRsvq3wJNOuc=;
        b=IYkFzbchsaUv1RvEcax38OuhWWfAP14+YekZ3ZiXrKBrNiiDHhWq61k9RUpTO7Add0
         XOD8SWeKL/BFKPnRpIsWwZLrwLiP9aEJzxQb161VEZZtIxZtGhV1FUUIaw9S6/ifI5DB
         koWMjQ8jIlKvnKjjTKUQmy5Gk2nNESpoxNBLfDMf+oLC7yNzjg4OESiRanDIkQ7l7DpA
         nRdwRBiKSciWG9shSzskFmTl/yxlJ5L/gCjnK7xdpDkGmVNQzOWzH5yT94z54Z+IfhaM
         n+PC5dNL/EkM29CLXGGxiV2DQ9X0lUNWdNmQQqorqGhtdvQirkzH5PSC3Y7KO733kULB
         anSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5sBt7Y0J5CJLOpgj9W3lTxZluw2lpZwvRsvq3wJNOuc=;
        b=sShEOL9BAyph82xavYgBr8fjxyA7XtsqRBM9B05UW/ry6YEZ1fYTIJ+IMi3eXokQ/W
         4h/WNy495BGBp616FzofGfH+UnfpObA6ouDDlEppFDnh11WmX3WJ6gh0qETClEPugi81
         fgl8VhIMS0CrF4quI83Szvyk6Dli+z6hgp72JjpvZQhs0npbQriym3fNvGP0DiqNsEyt
         VrCC+Zlfy3KlkazSzDEiBVUiJNv67FD792aOlsnx4LsGQMdSTles6r2ZPXjyxkor7cjm
         7AOZjvbN9Lzdz4G9p3QaWtRIG//Led+UY/TqBU/Y7D0VPMftFbqAGre/0LCQ23LZ5JFp
         SILQ==
X-Gm-Message-State: AGi0PuZlzKtZVoo4JXipD6uqbagWlcOAeDPeGLMICDrhNq7C6g68EqjB
        WmhzIUHyGBZEwdWuNO+LNwNytrF3hGoUmyf33Gh1nQ==
X-Google-Smtp-Source: APiQypLr7z8VgK4rNGT1FQMVrt2BpOa71bVF8AIT2YamcngQbMd+JeeHa8MdEkh8jcjpi/+CBHMRZSb3e/miRYmZ6KU=
X-Received: by 2002:a19:700b:: with SMTP id h11mr5802769lfc.89.1587033765824;
 Thu, 16 Apr 2020 03:42:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200408070832.137037-1-yuehaibing@huawei.com>
In-Reply-To: <20200408070832.137037-1-yuehaibing@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 12:42:34 +0200
Message-ID: <CACRpkdYjpw47q2NDZH1XNibyad8qg1D8bSS-AHf4AJatYEQ8bw@mail.gmail.com>
Subject: Re: [PATCH -next] gpio: remove unused including <linux/version.h>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Asmaa Mnebhi <Asmaa@mellanox.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 8, 2020 at 9:06 AM YueHaibing <yuehaibing@huawei.com> wrote:

> Remove including <linux/version.h> that don't need it.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied with subject change to indicate the driver.

Yours,
Linus Walleij
