Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45554356C7C
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Apr 2021 14:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235499AbhDGMqk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Apr 2021 08:46:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235035AbhDGMqk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Apr 2021 08:46:40 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B22F8C06175F
        for <linux-gpio@vger.kernel.org>; Wed,  7 Apr 2021 05:46:29 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id z8so20469275ljm.12
        for <linux-gpio@vger.kernel.org>; Wed, 07 Apr 2021 05:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9fEidbG2mkH1AcECygNcp3MNB9ZfpqzIVMUEPrbQPzc=;
        b=BepU5eueKnJ1sfHKHWdyeTo+Ezij/ITEIe0XBuV+fOTdy3UU9S1jA+T5LgGRqXfZ7n
         5s3vYtpts12q8rprpifg9HGt4Io3N1jnAwd8RGSKZSqTxHTQ2zIiTbcCRwvmGtFiGa7I
         XW7xXC8VoWng7oLtV+NGPq+xTJ71c6T4HmllZAgZuFd3P5BQCvObMIUV5nmhuhnC+QA+
         swlyKTMG/UIWCUUaICtRtZBkTk6pvweClo/sDNfO2zh3pZvft8D3KcJmKen806weQzfl
         uka0MQCuibP3Z9zloNGhe/bv0teNSlLiCGTMQ9+Ga+yOs59KkCkmICqqSsCmE8RMDBDQ
         K3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9fEidbG2mkH1AcECygNcp3MNB9ZfpqzIVMUEPrbQPzc=;
        b=iyzkakRQe/aMl1I9ZxhgzhWOKQMChIukFKHnzZfcZ1hXtopaTt/UPkNSV/3yy7of3K
         cnpExQhalNIu4fqRlISXFHnlYpGGILQI+Rni1DYyXwgHKPD6+dZvf9+wPwBGjlW9RHd/
         0If6OURcUXPByZ4f1881tG5wP3gyiCPpOB3mXM+Eh00OZG3lQ97zUpD2I8eEeIraysCB
         fGqa0TLhvpdMOCIOE+AusW/Sfqjqu0yEod+FxaCFqDhcdk+g92ePfBTZEqPiPFOqSuTI
         PtA5rrdIIOZgGC/MH3z3hGxy1LZQM5WpdvLCfPrpkwc9gaSN5b0ThK/WdbSob8LnScEP
         4fMw==
X-Gm-Message-State: AOAM531VJ3hqp+X2B4srEnaj0ghGq/jqwe8oKEi2baBCsAooOAvn2/c6
        RN3Gox0kTnMNRdNmqGqEMoFq610rmA07y5RvYURypA==
X-Google-Smtp-Source: ABdhPJyjxbqkrseOVwt1d8gFHppZQCb8Bovuc1UQ5ikzaPez+dbs8HtS5kKTqLUF+M+6+plEUrE8QHk0MQKX6Elnsjs=
X-Received: by 2002:a2e:9004:: with SMTP id h4mr2084192ljg.326.1617799587838;
 Wed, 07 Apr 2021 05:46:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617363828.git.geert+renesas@glider.be>
In-Reply-To: <cover.1617363828.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 7 Apr 2021 14:46:17 +0200
Message-ID: <CACRpkdadBnrxbCr9Pe=aHD08Ouz3=Qa-WZruv=vpVBSZtFEDoA@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: sh-pfc: Updates for v5.13 (take two)
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 2, 2021 at 1:46 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit f7adcca27edf05fc1f061a9e5de059fe179f0e1c:
>
>   pinctrl: renesas: r8a77965: Add vin4_g8 and vin5_high8 pins (2021-03-10 10:50:26 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.13-tag2
>
> for you to fetch changes up to 61232cd6efca6e4d2705993850d014343ba604c4:
>
>   pinctrl: renesas: r8a7791: Add bias pinconf support (2021-03-24 10:38:29 +0100)

Pulled in! Sorry for the delay.

Yours,
Linus Walleij
