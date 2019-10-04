Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FE88CC581
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2019 23:59:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730910AbfJDV6z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Oct 2019 17:58:55 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:39224 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727647AbfJDV6y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Oct 2019 17:58:54 -0400
Received: by mail-lf1-f67.google.com with SMTP id 72so5466322lfh.6
        for <linux-gpio@vger.kernel.org>; Fri, 04 Oct 2019 14:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j453WNsSMfecyCoQY7VzUIyW3gFQh62iMQgb3cot0yo=;
        b=FCCkoMEVZtJTRMDk1y780eRkneHFdnF4M3fUod6sSrVPv2h4Bswq9TrSTKb8nVuU94
         yHwzKE807k5FccoAl8T5t1M50cnGwzyUw2IedUw6JSIBak/NvtILQH3CzuWTG0ydrEDD
         IHSeQdsWuXBkO0Tk5i0ngM2xcI/JFm2E6oQAiQjIVnfjoVT7EdnuaGhrHUzP4gfrNSEf
         gbu3d9zNlvBE4J2c7XUJOdXXj7TeP4HNIv5agGU7HUgei8nszcLfid709lp1pV6XAFv3
         +EP+WWBQd1cYmVxTM4u/wavzkaO/qeLYhe724YFhCDPtjGAvI2gHC4XtdrTPRWqc3sSd
         9bLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j453WNsSMfecyCoQY7VzUIyW3gFQh62iMQgb3cot0yo=;
        b=ivC3X7BK/UP1XRJ79yrBOXk3teNA6PI6WYbmOiJg12lb5bsv35S22YHvX9E33IHyXy
         DUMpeLgp/GV8w7xA2rYKW0i0V1oqovsCCym/+vvlb4OSGURwp08KAMcU6jqzUKsv5xZG
         Y9BGcpSmS4oGyN52slzfL10YJOzHUiWQgfsXpNhg99roDY4+6cFUc7F6zfatC8A6Ypwz
         qQT6ar8RCfaHTJEpSntB8wSxSzO2sehzOWN7XDGXxjnlorsSCSx8OZTpDUgKE3q0oTka
         OcPk8hQKu+RCRQ8QUXPUIueaIFh8jTqnWj3Gq67ad7A+Z5FxIHj1M5sD8oTQpqrxGh/W
         Gp5A==
X-Gm-Message-State: APjAAAXi062vqU7EQdErEA3ykKWCF/vXtAcl91u3GsX6nBAhrp4yMSxN
        iCrVTLoDo4ssKBrAvhLBsuJ0HFdqdSj1tCPbjsgL1w==
X-Google-Smtp-Source: APXvYqy3Z3ai5AV08IvVin/TZlw4UG/kdlBlNxOsNMKq/7fVtBn2PEOEbUPCbfoSvLfZseN9UdTg8Hk1wFafNOLhEZg=
X-Received: by 2002:a19:14f:: with SMTP id 76mr9856396lfb.92.1570226332814;
 Fri, 04 Oct 2019 14:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191002122825.3948322-1-thierry.reding@gmail.com>
In-Reply-To: <20191002122825.3948322-1-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Oct 2019 23:58:41 +0200
Message-ID: <CACRpkdYS+nH5jVixrJbxV4wqPgibp_JS+q=YCVwTMMND6ccwKQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpio: max77620: Use correct unit for debounce times
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Timo Alho <talho@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 2, 2019 at 2:28 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> The gpiod_set_debounce() function takes the debounce time in
> microseconds. Adjust the switch/case values in the MAX77620 GPIO to use
> the correct unit.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Patch applied for fixes.

Yours,
Linus Walleij
