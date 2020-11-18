Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F31F2B7341
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Nov 2020 01:41:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729061AbgKRAk4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Nov 2020 19:40:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbgKRAky (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2020 19:40:54 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43865C061A4F
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 16:40:53 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id a9so492930lfh.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 16:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hlnCGH+LFWSKa3NWbEHZCA+KnyqTJ5mJquycr6mzLC0=;
        b=b35D5dRCngV85Jkliq8amklURhmzxmMXQXkmzvPciHNdKxKKW9BhNIkUxb8Yd7KzCy
         TxHf/H8xRvfgsEb1vKyJdNoECmnkfmfOJWmbefl/A0VFLDLvGdwQjwBkDH+ExPVjWC1i
         TcQeyjHEY3drDUSyOSxOCAWFx97UyAlVjGH0QiKgY9oRQxpnISjGvWWIuFubXekxBV/m
         oNhErG7gPFfWbJ5rukSn7tJ1+57uFlLzEBk6h0TqEksjg1y81DiFYLQxNRfFwHaOFB9n
         7/uTM4jWbKsfgI9cKJQRsY269jsnq3Eo4TiUF3QUbLr11I5uOd1NrwFpVg4g/Oaejv0A
         lf0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hlnCGH+LFWSKa3NWbEHZCA+KnyqTJ5mJquycr6mzLC0=;
        b=UpOTUc9uBIBKuUSkwb/SzCah6472xh93ruMoa8rLVBt+XfZV7A+yZC20nM/iaCXVbp
         xREeUzh3uMVseildP9xDBwxrGNT9qMdIqHMYlP+9NUGYlsk7ylOLm3tJdAcJ/BNkmHzt
         FsjgzJgsP+S7bqmE0yvq/s1nSCpcRkLhTQDx2gEDXAXo2T7pYD5uU+8ljqTpmD7+TaV0
         NZWtxqHBJIC+1kW0H1sI8zLX3hs2o0EFNm3+LRMvQb5hPRIFg76P8t0+WFtXK7yvOQ9f
         7fQcY52GnCxAGviRPUYGsdu9yAzztoJM5ZTdctbAszRi8fizO5zitxoB+726E7orpnaz
         SevA==
X-Gm-Message-State: AOAM5332zD68I352pq384snoyoJbB1kTtn2eP8MTEdBpKpECDqHuSxXv
        Mp+EvpVAH01+loKgcgU/i/uVU7IidJ2Z1dBXhaHvog==
X-Google-Smtp-Source: ABdhPJwHvhC6sS5DO4wWxQ0fGIfgHWvnruMbSZXZ13Nm+lY/aSnXpasjCmNCCVodVpaIuuBfv35soaLWZ+nIIxzxjCM=
X-Received: by 2002:a19:7b06:: with SMTP id w6mr2870290lfc.260.1605660051811;
 Tue, 17 Nov 2020 16:40:51 -0800 (PST)
MIME-Version: 1.0
References: <1605201148-4508-1-git-send-email-srinivas.neeli@xilinx.com> <1605201148-4508-10-git-send-email-srinivas.neeli@xilinx.com>
In-Reply-To: <1605201148-4508-10-git-send-email-srinivas.neeli@xilinx.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 18 Nov 2020 01:40:41 +0100
Message-ID: <CACRpkdZca9s2ybNx3N2MnrT-YfVPoSq1Enz3gQ6RS2FSQF8F+g@mail.gmail.com>
Subject: Re: [LINUX PATCH V3 9/9] MAINTAINERS: add fragment for xilinx GPIO drivers
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        sgoud@xilinx.com, Robert Hancock <hancock@sedsystems.ca>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        git@xilinx.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 12, 2020 at 6:13 PM Srinivas Neeli
<srinivas.neeli@xilinx.com> wrote:

> Added entry for xilinx GPIO drivers.
>
> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
> Acked-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Patch applied.

Yours,
Linus Walleij
