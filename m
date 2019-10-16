Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F14C5D8B59
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2019 10:41:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391792AbfJPIl3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Oct 2019 04:41:29 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45913 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391789AbfJPIl2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Oct 2019 04:41:28 -0400
Received: by mail-lf1-f65.google.com with SMTP id a19so3843679lfg.12
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2019 01:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ssx3E9AK9p6749zZaq+BomwgK5eiQnswsLOVXlYW29c=;
        b=qdPgZ35Y1+lmVqkVwpryS2vB8Oh9Ww6/PMjzG+tomGo/GSFQdF/JcD8v23X7oxGoxw
         Umd1pOjtCWg1SiHc3uhbWSs/Ghp6LK1UizMRU3QfBAoI4AW/TkkRmB0JmCVadtfJsWOT
         DhXlhhxyhEdPwgRcVwUNhlp/5ddohkBa+Ykw7Rj3Cs9yxJKmUpAl4p4j/ywqLFHhN06g
         hbmbQIQ36UkI7aKr+l//4QQh53a5AGcwitpTv9ae+dTYfFMs4Ndl48BH9DkyKMvuPrsV
         Z5OsnWtmmmRiP0IlfYXd8MyRiWlVvIDz2/MkdQcvJGemAfD7tY039VKI9QGVxI61LFjL
         f9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ssx3E9AK9p6749zZaq+BomwgK5eiQnswsLOVXlYW29c=;
        b=Oqci/vset1l6v+w5LzdIntxghcwCklmrBTQqz5UiUaL+C+fLJZe+AIMQidV8fyLI2l
         hY3mSQchcc6oMgo7jfxhvIxqJO7sYCMC8xMEhDEgOXGcMr21D9QTW5YO4++gliksFMuk
         v8aBRP4i9fFR4BF8kfq6qeyXYCiQMa7HUI+jpw1NvZg7rx9wt9d6Egtg61Mycbl2/5h8
         FXL7C4415s9xuKYaRODT1EHMZKLfDJQ6fN7zBOF5fFmBgH5Zvydhsbo7RpRuVJNBeoP9
         RNMRr/PUnHDpuEamckuTVd9DPUVtTteK0BUquNDczq3FoQnR17gzw/vhzEipHplb3Ua3
         362A==
X-Gm-Message-State: APjAAAVLxNhqmq4SYDdntxc2XU12BVQ5l6gksje2yIimKVhtKmGE2Svi
        kSLZIwgh4WtY3hr/82POLaGL+abuj42SDuxfW4QyrA==
X-Google-Smtp-Source: APXvYqzUPTAj/wdpGxospwfgSvc6NbuF6ASWLLAqMPz4Y86VHAcr8x+P5MUlqNOOs7hv3snxjhkd5UQcARi7p66kzFk=
X-Received: by 2002:a19:c505:: with SMTP id w5mr24026445lfe.115.1571215286849;
 Wed, 16 Oct 2019 01:41:26 -0700 (PDT)
MIME-Version: 1.0
References: <20191005105936.31216-1-kholk11@gmail.com> <20191005105936.31216-2-kholk11@gmail.com>
In-Reply-To: <20191005105936.31216-2-kholk11@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 16 Oct 2019 10:41:14 +0200
Message-ID: <CACRpkdb1s6caSc8gViWrTLRv=x1SeYFviwL3qe-HY_nQomn7HA@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: qcom: Add a pinctrl driver for MSM8976 and 8956
To:     kholk11@gmail.com
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, marijns95@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Oct 5, 2019 at 12:59 PM <kholk11@gmail.com> wrote:

> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
>
> Add the pinctrl driver to support pin configuration with the
> pinctrl framework on MSM8976, MSM8956, APQ8056, APQ8076.
>
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>

Patch applied with Bjorn's ACK.

Thank you for fixing up these platforms, good job.

Yours,
Linus Walleij
