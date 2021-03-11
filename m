Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA0D43375E4
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Mar 2021 15:40:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233065AbhCKOj6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Mar 2021 09:39:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233583AbhCKOjk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Mar 2021 09:39:40 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B19DDC061574
        for <linux-gpio@vger.kernel.org>; Thu, 11 Mar 2021 06:39:39 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id k9so40119004lfo.12
        for <linux-gpio@vger.kernel.org>; Thu, 11 Mar 2021 06:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aRX3JxL9ArLTMgxvg9Vap8aqfjFmbYdIVVaZ27whFws=;
        b=o6Zm2K0Fr8q5q9PtKQteoTYia0u2gqkf/Nfpmd9Ysmr6n38jRx+78XcJwzjUSg91Rb
         A23aGhbCJa6L8HeF1S/Ub9dRlfL8ykT8HfDZAX5H3/HFAhJqrC/ojzdfTLH0krNFL2bX
         x/gzA5b10kGzYV9MXCZLGuO5Z/OEXlqmEovymnceQermlW1yLXtN5LuFqTn0/NOEmyBm
         BwPrIhPxh8DdzHbxYrItrFOBf14Et4bQuvVQjid9zzJU3DTdCqTvkt3GVRSdohDBMOc2
         9VBO5DPPpJ1mIrqzdNVTxHA40GFPoXACkldx1qnJfxKFuy1RmZce7QNkb7ytkPZfFdjc
         EsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aRX3JxL9ArLTMgxvg9Vap8aqfjFmbYdIVVaZ27whFws=;
        b=Q8Xh2UA/B9PuzbIc83zNr9h1Ge/fWimzSjgdtA/Se7ZhA0VDC+PzlztXo8we5QNeNu
         fPzBKD9I0ygha32iZvXv7ClnbyHXJWNiK1rIOSMGvFjqc5Db9X3S+IYy5oFW3bl0CGG5
         o4hTpQQIf32OIR3RVingsXeXjlwYGzsQEV9fBpFhoPdW8aOIQxlr9K45S3F6yB9nHuh7
         gQYS/kWU++vK2W7BMUyVoLMZKMvzGi9GOYcOA8oPgXYixr9Edbd1NWCSZoulWyBLTGk7
         weWQK+9pttuURBk4Tp8HfnA2hxfZI8Ywap8plGp6hiw6HNKh2YrsMRk7O5g22DsrEYIw
         ZdAw==
X-Gm-Message-State: AOAM533Svm8kFvdVWTtMa3sBdNg0RstD8Wax4gy9PeqP8/vw0ucD+hD9
        GFSKA+3KTO+jTs4iqPQjjNTFdsZ7uu/UspISqenhDw==
X-Google-Smtp-Source: ABdhPJzL7b1QCjpPuDvu5hMDtVElSv+oLOTPmam9LzLVeTqzRxH6pQkh+F02MtmXCazZCgtaLEU618wN5tWM9Pdnu3Q=
X-Received: by 2002:ac2:4d95:: with SMTP id g21mr2608064lfe.29.1615473578223;
 Thu, 11 Mar 2021 06:39:38 -0800 (PST)
MIME-Version: 1.0
References: <d66e78e3-2000-611b-cd74-8a61461153e8@canonical.com>
 <5c08bd61-688f-e95b-5fa3-584f190ed4bf@xilinx.com> <bf508c29-4a51-5f97-8459-06c1fe74b60f@canonical.com>
 <f6cd3eb3-c8ce-9b40-e5dc-82b6748d4084@xilinx.com>
In-Reply-To: <f6cd3eb3-c8ce-9b40-e5dc-82b6748d4084@xilinx.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 11 Mar 2021 15:39:27 +0100
Message-ID: <CACRpkdazxVZCwLK6sJb7-hqhzuWs-HJ=2yiVr-UX4+AoEAWAZw@mail.gmail.com>
Subject: Re: pinctrl: core: Handling pinmux and pinconf separately
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     Colin Ian King <colin.king@canonical.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 11, 2021 at 12:28 PM Michal Simek <michal.simek@xilinx.com> wrote:

> > It will take me 2 hours to re-run the analysis, but from eyeballing the
> > code I think the assignments will fix this.
>
> would be good if you can rerun it and get back to us on this.
> I will wait if something else will pop up and then will send v2 with
> this that Linus can apply this one instead.

Just send an incremental patch, that reflects the issues found
in a nice way in the development history.

Yours,
Linus Walleij
