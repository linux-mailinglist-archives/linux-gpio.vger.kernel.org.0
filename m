Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 204B55DE0C
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2019 08:28:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbfGCG2R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Jul 2019 02:28:17 -0400
Received: from mail-lf1-f51.google.com ([209.85.167.51]:39823 "EHLO
        mail-lf1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbfGCG2R (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jul 2019 02:28:17 -0400
Received: by mail-lf1-f51.google.com with SMTP id p24so877819lfo.6
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jul 2019 23:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SXu32Pa/2jY/SIfhjCTPNXklOrGOPwxWNpCrd6d7xWc=;
        b=l9DxrZWHt7C6eTWN0i0SVfjKdZfwEj6P1o3jDecGHXsaU3IUlreJyMm/bDwCqnBpME
         1PWg+xm7is9gl5rlo6t7tIZ4bqeI+NFl9pn2AwPp/lvXCSZF/vlhLvBx7z5nc7aydCJ8
         IyBwVGAep64GgReKoASbFQviuuhXtZXZyOBMKqqDLtk/HOy6Dnr68erDYBDfy9xvX8kE
         o5sJG/8BOxNMs02ChrH3wrl73ckn46b3sJSF3i/lOAGsOgSr4Y43Cf/yxjCnGrssQxYD
         82024FHMnZayiuFtWma3P79crPYXnWJw+5QASgUS3mAfsgT7ZHMVQuzTGqU2i40lcN2Y
         Ft9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SXu32Pa/2jY/SIfhjCTPNXklOrGOPwxWNpCrd6d7xWc=;
        b=FbK1cLBoLdX/d5seSOuYny2qAXtiCaGRs0532JDJ33ZJDB9ROY9fNLsRmeQxy2SI72
         SJbSj4I9rOiBY66ggJUyyZNStoTBk1Daip4rtSmStA5Xlc30MNRRtwoyUOp6sayHar4R
         b39ySVaAiP1jGzTbddLWQurlbw1TBidQWJ21qSmzJUQgWg3uUshJPd0Pr3/7J36s5zEi
         qo5ccniUaZd8vn7yWk6wmKlJWG+k5WGGujAYJUJbsw1/cv1hbZhnEe35kxmufs5MKCuN
         5ygI9eHwRytwIntbwKnpYS1EQOmpyzl0p2XiOrp/+qvZTBvyjYJQvO17SKtJkARF1jmu
         xkIw==
X-Gm-Message-State: APjAAAW3W+LEKIuwY+ou+DOGNiylkTzyLW1eXZKboU4u4vny6/jerH5c
        Zjz4oOYGKv/O/YFyzVgBkleSOSlCoKiZ9rMDrS2oV0vu
X-Google-Smtp-Source: APXvYqwdVcvnU84nLBGloVccDLThbqvTd4gp+Ns0yDpZlYkr2svJh5eSqbc0sUqWRzwB9mhq8cfmaslICQM/toProkQ=
X-Received: by 2002:ac2:5382:: with SMTP id g2mr16327691lfh.92.1562135295442;
 Tue, 02 Jul 2019 23:28:15 -0700 (PDT)
MIME-Version: 1.0
References: <d4724d7ec8ab4f95884ea947d9467e26@svr-chch-ex1.atlnz.lc>
In-Reply-To: <d4724d7ec8ab4f95884ea947d9467e26@svr-chch-ex1.atlnz.lc>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 3 Jul 2019 08:28:03 +0200
Message-ID: <CACRpkdZD7x1eeatXRTtU5k7Zoj5tfG8V98SjaO=xubwaa9teTQ@mail.gmail.com>
Subject: Re: gpio desc flags being lost
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 3, 2019 at 7:35 AM Chris Packham
<Chris.Packham@alliedtelesis.co.nz> wrote:

> Doing a bit of debugging so far I see that after startup the desc->flags
> for those gpios is 0. But for the hogged ones it should be 0x800 (or 0x801).

Yeah that is wrong.

> I'll do some proper bisecting tomorrow, but figured you might want to
> know sooner rather than later.

Thanks, I have another critical GPIO fix queued so would be great if we
can fix this too before v5.2 is released.

Yours,
Linus Walleij
