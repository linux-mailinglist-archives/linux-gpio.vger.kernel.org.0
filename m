Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25C26815C6
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 11:45:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727259AbfHEJpO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 05:45:14 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:44236 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726454AbfHEJpO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 05:45:14 -0400
Received: by mail-lj1-f195.google.com with SMTP id k18so78708150ljc.11
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 02:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s6zAh1o/41x26OEmzDgMFKqXOgyTDtCzMJW+rJBYMD0=;
        b=QDG828ckGudKUJFEh/4UjZteNBHZDbOng66nE3h63W7BZTvjDAlExp2Qua1834hppE
         L+3DB83/fO2atA0duVHKt5KaQhMwW4nh8Mq46ymtWQhCtyIzje5Wlj0LvJmN1YVWAkcI
         CWrTNcapGkIHXYuKkvdoeVdq/uz93uDEbceJn2r2JbfUw5PkHL54Qh4QIGh5gbCD96UD
         N+QHaVxs//5JkObl/9PSm6Tan0p/pd+AGbux2vxx3tu5+DsYoVI5DXtXfNTs3J+CgxQ1
         KvIQh7Pzc+McgMH4TI0iBmEUFdnZKU5EmMYVYzyEsimVtrUJ553x2odHTsIEoIpjNAFx
         BTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s6zAh1o/41x26OEmzDgMFKqXOgyTDtCzMJW+rJBYMD0=;
        b=MZYTzIfew3/FY3AaZnlZ9MQVRfBWBsb88aITZ80MLsnav8FRT5fchwIdvvteZgjx8n
         pmLSg6rkw8qf6EUSZEX1AcMluNOpfCyS0KjP8A/weotRpWeXh7B8lk3WFh+OLmZ5DLTv
         SyTMTiIWtV7NvH849c8ra6zu9uzclSqsMo5KU8eLPZNHRrFVJhdGPxKatj+O1p8DU/nF
         7G+1uJBzjz6fDOVOxxyIiMwefKA9O1XPXLyROz1i5IxpFGpIbJZJsYHlqo9s+4ORxwVs
         GNELEn62mEREMos59t4KaczT0Eqo4sQ3cvDTRD/rO4uj+GIbB3433QVhoQWRKxPy1g+4
         +aXA==
X-Gm-Message-State: APjAAAUJ2hB9rrjtKDz73f1+sT6T2wYMS4LaINpNYFSusddWix6N4VwA
        AMw2v7LAuTqJz9bINGIcurwkOBdKPXvM4Yo88HLq1A==
X-Google-Smtp-Source: APXvYqzIPpC9LlGYMyyGNXWAii4I2tobVkbvCj15E/NFWmXNTZIpJApX8U3rYQfX0rAeQ2hn8OetTpbCADQbBrndDQM=
X-Received: by 2002:a2e:a0cf:: with SMTP id f15mr14752725ljm.180.1564998312501;
 Mon, 05 Aug 2019 02:45:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190722090748.20807-1-ckeepax@opensource.cirrus.com> <20190722090748.20807-3-ckeepax@opensource.cirrus.com>
In-Reply-To: <20190722090748.20807-3-ckeepax@opensource.cirrus.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 11:45:01 +0200
Message-ID: <CACRpkdZh_STdTjsB=Rb9Qhfg9pjF9g3j5vwxBHTjCYn8+sGBrA@mail.gmail.com>
Subject: Re: [PATCH 3/4] gpio: madera: Add support for Cirrus Logic CS47L15
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 22, 2019 at 11:07 AM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:

> From: Richard Fitzgerald <rf@opensource.cirrus.com>
>
> As the gpio is common to all madera codecs all that is needed
> is to setup the correct number of GPIO pins for the CS47L15.
>
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Patch applied.

Yours,
Linus Walleij
