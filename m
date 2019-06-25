Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69F0F550A9
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 15:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726448AbfFYNnT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 09:43:19 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45407 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbfFYNnT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 09:43:19 -0400
Received: by mail-lf1-f67.google.com with SMTP id u10so12636429lfm.12
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2019 06:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mouyUCijCL0qaXgD+khfJSX4dSqV3MXsNvU/q7OjoAo=;
        b=qCSEdeAMP1sIwlguOGRG+Qsdia7kp2b8qGsMUU4xlun0eAZSyCEmhXYCVuHgvaMjI2
         8C3dzpordUFcSQYrc1jzhemxVSWjvcAu/vA6XhWLbdlV3dPMDoVzv51D+eKpcrcXu+RW
         vNUduaqe+bhcZRp2V1dGBmVSigH5LtcenKIoTmJioMoYZDDHPEtHHB1eAarOZ4Uivgtd
         mkpDOGwFIrpfl8BlRs5WS/ebRelPxb/LPb0xs/c34QZnKMVrZ4wClccGWUnlwZsEpidI
         68sC4SHCBn3x8oYsdMqWBQbVGSPU9/YkGAr6zrUkn3/8Hda5mnPOacnDvD2VtXmrdyjO
         wGdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mouyUCijCL0qaXgD+khfJSX4dSqV3MXsNvU/q7OjoAo=;
        b=YkN3GXS2/7phuJZY335QcQuIURqFG3uFJt6IAbxUhyQCWCy25fOd4ODy/Re1TBXrds
         OFRCvXHwdxFcIhLvekYDnkTVQ4cmh0LMej9bHGCTLuTBRs6ZXfQnob7aDftsuaue1TtL
         3DwXByZ2UcFqkOT8vaRCjNWMAXcXroFoDnKq8gWSdneba59Lhcdx70IXvW0buqcw/fsi
         zSC9TrU6g4mrSfdEfUXZtd58UP6Ib/a7cAcVi4B6CleiMNS0/2dCCyZCMpKn1FvowqYX
         FkgULftKImbd4BQ8F4dgCO+67hFr3Riqa3VNYsmw3A/MZLbUxGq5GDJt1tt2GOvo4yBu
         UX/A==
X-Gm-Message-State: APjAAAVe0UFAT2Rro9tRKfVhwupEZOzOn1KwwCIBo8Rt1wfgZ9NEQdrS
        Jz/7aRjQxjDEFzWidDT/wA0KP/FG8eJWHmjhTwRPyf0Z
X-Google-Smtp-Source: APXvYqy0OxjHtBjby60RKNT2mppx7IQj99qwo5vUrxXCVqpZ9vVC9kx8mcvbkSQbadmIjLPI9EicniZ5HrnXpHS6BFI=
X-Received: by 2002:ac2:4891:: with SMTP id x17mr29353055lfc.60.1561470197405;
 Tue, 25 Jun 2019 06:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190620183037.29652-1-alexandre.belloni@bootlin.com> <20190620183037.29652-2-alexandre.belloni@bootlin.com>
In-Reply-To: <20190620183037.29652-2-alexandre.belloni@bootlin.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 15:43:06 +0200
Message-ID: <CACRpkdb1AzgUf0go=q9uDN2QdH6Gs-K-CT9h=y1T4YZgqKrF8Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: ocelot: fix pinmuxing for pins after 31
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 20, 2019 at 8:30 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:

> The actual layout for OCELOT_GPIO_ALT[01] when there are more than 32 pins
> is interleaved, i.e. OCELOT_GPIO_ALT0[0], OCELOT_GPIO_ALT1[0],
> OCELOT_GPIO_ALT0[1], OCELOT_GPIO_ALT1[1]. Introduce a new REG_ALT macro to
> facilitate the register offset calculation and use it where necessary.
>
> Fixes: da801ab56ad8 pinctrl: ocelot: add MSCC Jaguar2 support
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Patch applied for fixes.

Yours,
Linus Walleij
