Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6932AD8E7
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 15:37:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730059AbgKJOhR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 09:37:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbgKJOhQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 09:37:16 -0500
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41364C0613CF
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 06:37:15 -0800 (PST)
Received: by mail-il1-x131.google.com with SMTP id y17so12240887ilg.4
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 06:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E4+BxuhfG/QUAirFNxwrItWcfHe9bxlKV4TGmzbyMso=;
        b=Sc7qlP35S9hLq0yr0yoTz4HNlwqYLySD5uWd98h8t8Nb5wINhb+l8L/LZjizF2jYUd
         QhmOlAO38y8nN8FDShhtGt4/n3QDPpFf+mmhhkifyFpw8mDGFjpyAQbSwCtD+Whi2kAP
         zBjrAqNMbpypytgya7oV7Asg8nR8balVvFq1b2tBsQI/vDLxfoZDvcfnzKdynsdxAsb5
         r/Atsus820AcTtUajmvz/RVICZyF7vzg3Krt7dLwaY9+zVMMzcRuIUjGD9+V7svH5YhR
         N5mz9dH9R5YAQdpbL0pKnF7D6fGXR4UFEXW4WBOjOi8fFkcOKpNf+8tuV1/TbMmEox2q
         eyjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E4+BxuhfG/QUAirFNxwrItWcfHe9bxlKV4TGmzbyMso=;
        b=WVt+3019rg0RDcca2lfQreZcJGtZGfXqn0PboQlTHI1d6t4YZFOTw0FhStHkJgKtft
         Ze+fm06RTHw5ISGvg/R8xVzQC8QkO5wwmtKxJfhNsWDtsxc5vHNIfuWmqiEXAQEJBZ68
         pJ13CG0EWDP58zhEYhSBbbS4U/jCdUr5OuRMayoq1PVfknnHCsB3os217GeX8nMqpcr8
         jVcczktkBA3gwqqeqwQlcFB5J4Z4+fZevSixzkU4Aj9gliu9X2kjtrX0sGZL1BfufIDj
         YxqJQU4MQyIhQHWW8hW5Eebd7/UwVBC8OFJg81P95d+DCRO9UldP/MOgtYIh8+k+4Vo0
         LLpQ==
X-Gm-Message-State: AOAM531pOog2qyz6VCkTnSQby2pmML1TpMk65UHZeM7DEgCyjINCxwbO
        LHvu9h0X4HYPT0e3e1/7iZMkjxqphwQsFA+jnAoMhtj5HMQ=
X-Google-Smtp-Source: ABdhPJxxPumTpR+PctvGeeHU1X3gA3FHTLSPgtFaYX3KEhtE7nAVe1kvwQ2TuED+YavzE5pYyYaHh33nsjvFgHyBmJk=
X-Received: by 2002:a92:dc07:: with SMTP id t7mr6852082iln.189.1605019034560;
 Tue, 10 Nov 2020 06:37:14 -0800 (PST)
MIME-Version: 1.0
References: <454bd58b-7498-0052-8442-8f20b6681a7d@radiodata.biz>
In-Reply-To: <454bd58b-7498-0052-8442-8f20b6681a7d@radiodata.biz>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 10 Nov 2020 15:37:03 +0100
Message-ID: <CAMRc=McOU7Sh_SApPcxJOc4YuENtpT=YO+DVfYG6_8-pRU93pg@mail.gmail.com>
Subject: Re: [libgpiod] query state of output pin
To:     Christian Schneider <cschneider@radiodata.biz>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 9, 2020 at 6:34 PM Christian Schneider
<cschneider@radiodata.biz> wrote:
>
> Hi and sorry for asking user question here, but I couldn't find any
> other place to ask, and the documentation doesn't mention it.
>
> Is it OK to query the state an output pin is set to with
> gpiod_line_get_value(), or does this give not what I want/expect?
>
> BR, Christian

Hi Christian!

If your program is driving that pin then there's no reason to check
its value. If it's another process that is driving it then you can't
request it and read its value at the same time. We'll eventually get
to having a centralized user-space daemon that allows it but for now
you would have to hack your own solution.

Bartosz
