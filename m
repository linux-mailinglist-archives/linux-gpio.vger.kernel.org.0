Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFEEB563B5
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 09:52:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726905AbfFZHwS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 03:52:18 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:46295 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725379AbfFZHwR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 03:52:17 -0400
Received: by mail-lf1-f65.google.com with SMTP id z15so863665lfh.13
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2019 00:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/xAcvCpgrsdrggNvOHN5Sy3EqDAOq+lWEaVhYEBub4U=;
        b=utKxCZLLZtf5zf+jgyFANAXUbwc5IVAPktXFnY/tbGlohruRsiEGQmttkSJg7gRFzW
         mUiaZDXWQMwzrA5HeabcCYxK3GoPysh8IdrJsGQ1pjYOx+QOqxd2k6m1v7slhh2yNFno
         FEgVrQcionu5ZCYPyIZUK3wvccBxRADxI9VCgr+ShCv5nIvcfEx3MQf5hBxeKtY1jaTE
         TOQq04tn/WSdnb5MIR1NXwADO5xT1EdXqgKPtA2Z0OyWaZ5PPEIak85qTK3ocDJz0sgD
         9/GaPIel5lui8+2MmGLNE9CGe3jM7OEatIIGi7tJHEAUofUSN1wSh54qMqThwwrhIcmk
         T0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/xAcvCpgrsdrggNvOHN5Sy3EqDAOq+lWEaVhYEBub4U=;
        b=VjYxQPI2AxB7VfPxpxbIbCaSwKHXWriGTnPBDz84BV/iNVGLFqx1L7nJFLLdqcpVUv
         7xe8vi8WUqlJwt3lF5ZaIKA8oo92+ATF3BN0wkfoFf377mYvnxjt31yk38MJuj7hI3z+
         ErCTL/svKINDegvNA9PY1ka9hsnwlYNFwBNQLyYiZjHkEyVx6CGXmN+o3Cg53TVNntjQ
         E8gg8+j9pTeA4DBAGoUYtdzAsWBCV6OkH59/2OEzjZTJTQfipULewec/JYFC/l0glGOI
         pObocXGCLi8sHECfEIOvk3w8qiyyfYFtL7xLxBrpcMc2HU1qonECuUOJbUgBSPUoGgbC
         sQQw==
X-Gm-Message-State: APjAAAW9hceQtx4P3sNc84hYZngbC1Vpv1cTJVVSXA0KX/WbHNGgBNve
        zifoWafUCHYqFdymKtugkPeyR6Fc2VXCD2WWm4tEkA==
X-Google-Smtp-Source: APXvYqyv/xt5i8YCUKVwHAiCq9maeDwgeyEddqc/LhrMxG73uZzewR4WN7AKruYwcG9X9fGoVl6000N/Hj9bq7y6KC4=
X-Received: by 2002:ac2:598d:: with SMTP id w13mr1820383lfn.165.1561535535626;
 Wed, 26 Jun 2019 00:52:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190625153915.28424-1-ckeepax@opensource.cirrus.com>
In-Reply-To: <20190625153915.28424-1-ckeepax@opensource.cirrus.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 26 Jun 2019 09:52:03 +0200
Message-ID: <CACRpkdbcxNHy0ubHpZpWN0bo==8q=w53iG041n+ofkk56fdQvg@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: madera: Fixup SPDX headers
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 25, 2019 at 5:39 PM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:

> GPL-2.0-only is the preferred way of expressing v2 of the GPL, so switch
> to that. Remove some redundant copyright notices and correct some
> instances where the wrong comment type has been used in header files.
>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Patch applied.

Yours,
Linus Walleij
