Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B75D0833D2
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Aug 2019 16:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732883AbfHFOTl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Aug 2019 10:19:41 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34048 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731893AbfHFOTl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Aug 2019 10:19:41 -0400
Received: by mail-lf1-f68.google.com with SMTP id b29so54049690lfq.1
        for <linux-gpio@vger.kernel.org>; Tue, 06 Aug 2019 07:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V5jEF7EG4PC/suq/OlXR4ZWTuw0HGXTqAzdKkVGslUk=;
        b=ULcOMR+jww4NTNUs7NcAx18e93B5Nw/gBlqWx6xiwSBs6cs7d37AY/0at+jBAZsz9L
         nKGakf4d3FcI66w3uSvEv2o1eYC1cGgIEeINGfJGS+NGWswAIsexCY2Qi12ZTECRlBUe
         Xs5PxT6h/5r5zjx/xyRVp6WcvOXeAZHhHhtKQJgViFGxqshcnDNoKNZHphz9RjZ4rPG1
         pCHl+Ur0ep1NsDIAWaesNPR9rG3NJNuVmyvy020U3GeG+2j8iN0rc/8pmV4Bl+YJ5CuY
         7+/YbQopJ/SEahHd2BEbvp9irA2CuIxEk7yd+3t4oDFVCLIfUxnrXiRIBBNCWiCEumud
         B5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V5jEF7EG4PC/suq/OlXR4ZWTuw0HGXTqAzdKkVGslUk=;
        b=SAqAZzOArxu++s/+8Ly9wZ2YXlK4QSbo2R9n3Em2ri6u6u/NJlu6hfaS/jNzyl7VYU
         LObzeVpVanie6QOh0H7jvbwjPpzgvzd8R9JCmwZwW4J9RTViBHcm0bmyuiJMzwKUbCtq
         FCNIsxt4BoXROUN21nz+4kXDzYzKAviSbaGsRXO+iElCPhM97JBEIltoaQRJbEHE979g
         A06c51fkK+Pa84/Q0lvZ/vVr6MhNqMBRdlK9La8Rm0kscO2YW1HS9t4uQEkfAbE9wAnf
         Sw437ZexcJMq/0GMVlUCZofwjZtjlgwU9wfuaEpVl9tesqanwuTljZ7P9yeq5M0pQzF+
         TNZw==
X-Gm-Message-State: APjAAAUujkF+zuWWN92kc5DO7JaVf8HSV2wukU9SXVo5ZXV4W78aX32r
        KLL9vOSB+2JAX1IyEzilQOS4IMn3PlQsV7eyNio45Q==
X-Google-Smtp-Source: APXvYqyiScvaJDP2ekkmRlgBAXhfXHwRa26aWf4+vzG26RvGWoN0Fe0dbrrYZnADbBqjPhQeEpVSj3qURqtbrw8I10E=
X-Received: by 2002:ac2:5939:: with SMTP id v25mr2709543lfi.115.1565101179215;
 Tue, 06 Aug 2019 07:19:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190804154948.4584-1-nishkadg.linux@gmail.com>
In-Reply-To: <20190804154948.4584-1-nishkadg.linux@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 6 Aug 2019 16:19:27 +0200
Message-ID: <CACRpkdaZs6+V1d0R+-jmukxbSgJhyRP9JXmP5oJ9L0tyfyKEHg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: spear: spear: Add of_node_put() before return
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     Viresh Kumar <vireshk@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Aug 4, 2019 at 5:50 PM Nishka Dasgupta <nishkadg.linux@gmail.com> wrote:

> Each iteration of for_each_child_of_node puts the previous node, but in
> the case of a return from the middle of the loop, there is no put, thus
> causing a memory leak. Hence add an of_node_put before the return in
> two places.
> Issue found with Coccinelle.
>
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>

Patch applied with Viresh's ACK.

Yours,
Linus Walleij
