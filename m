Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C78A38F6FD
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 02:30:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229921AbhEYAcE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 20:32:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229891AbhEYAcE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 20:32:04 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E303C06138A
        for <linux-gpio@vger.kernel.org>; Mon, 24 May 2021 17:30:34 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id q7so41876529lfr.6
        for <linux-gpio@vger.kernel.org>; Mon, 24 May 2021 17:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oLP4oglLNCR+9nXwmE8IhmlcVIVSmG3eaWpMOp4bmk8=;
        b=rP/2hrI1pD+HuYaQkfSjt5L/O90JURl9WFveM0Bp/G+tbVrsVgygnir3hDkS9zFJqX
         XwL1LfEOIOxuB2aKqJEngEBuhsCz6MqBjebju6J+qBFyEqlvdRwR5atOCQXXH3Kkx2N1
         3fY2XXDpsZlfzLr4UMLuyNrxt/cNHjLd0CZdrgN1EMztuULY0zPEj5BwznG9AS3nIfd/
         Jpyu3RspjH4vFW3p5DQ/fhfYDFtsnm5XHL1ibkcu/Rny8E7jbDKOStD/nbSOvBdYKnco
         4wpIIkaIXl924s6i38dplGClI6DKYZSrxnniQcXThYcEDAsgkwfVcoYyxGdrcze3TwKm
         CB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oLP4oglLNCR+9nXwmE8IhmlcVIVSmG3eaWpMOp4bmk8=;
        b=Apm+k2kNa27mbsOSdn/jQduoT0CrGwpjVRmN6kuiDxGlidE9Ao7pT2PX8rQ5WNcmk0
         69QqPOOebrTCqMnmNSEZZWKg8C2IQDSjAAmA0EoE6MoBSj9vt1ZNsNUnNe90hdaUa9Wn
         TF4SMQyhOUGCEnQ3+xA4Ew/rA5uWTp3Iped4B0yh5aT9oCwovSzCp0dsY4GMY5eyRHFV
         oVEcgLV9fCDb7OBYlEUnunJiJwl7bFGO/dRbh78+fPbPsgUb7vX+uod1AQtZ08tWBcSm
         3aptho4vn5sjAScCsLSQHCkqtiFllU8JV0ksKyaPISYk0FMKDmX2MhPw4yfbAfC8PJE8
         eSHw==
X-Gm-Message-State: AOAM5318boIada8dWh/SX8Dw3OGH6ZOL5IZiRO2SZj1EsWVDAhI3sA54
        Z2di3AX1t6zCzDEibeE1oWl25VuZ5xOkRUg5OQQ2vg==
X-Google-Smtp-Source: ABdhPJw1HN3EJMYQmc9N6v18t6ySbunlT/243xY0jxo6mquZnjHFnii7atHe6NxbmrbfQ6HLxJ1mbqJN+Y9YvZPTUTs=
X-Received: by 2002:a05:6512:11ea:: with SMTP id p10mr11731891lfs.157.1621902632596;
 Mon, 24 May 2021 17:30:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1621413933.git.mchehab+huawei@kernel.org> <46ac2e918c7c4a4b701d54870f167b78466ec578.1621413933.git.mchehab+huawei@kernel.org>
In-Reply-To: <46ac2e918c7c4a4b701d54870f167b78466ec578.1621413933.git.mchehab+huawei@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 May 2021 02:30:21 +0200
Message-ID: <CACRpkdYU4LQM54rht9quJvfxJ7N4KjJf27+ckNGTdLOW1LF1UQ@mail.gmail.com>
Subject: Re: [PATCH 05/10] docs: update pin-control.rst references
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Drew Fustini <drew@beagleboard.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Saravana Kannan <saravanak@google.com>,
        "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <alsa-devel@alsa-project.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 19, 2021 at 10:51 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:

> Changeset 5513b411ea5b ("Documentation: rename pinctl to pin-control")
> renamed: Documentation/driver-api/pinctl.rst
> to: Documentation/driver-api/pin-control.rst.
>
> Update the cross-references accordingly.
>
> Fixes: 5513b411ea5b ("Documentation: rename pinctl to pin-control")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>
I suppose you take it through the doc tree? I can apply it if you prefer.

Yours,
Linus Walleij
