Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47DF02B72CA
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Nov 2020 01:04:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725814AbgKRADI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Nov 2020 19:03:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbgKRADI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2020 19:03:08 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D8A2C0613CF
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 16:03:08 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id w142so351689lff.8
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 16:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J9RXigtzZqvF8NKIRf2sG4Ypb/c5XwyoqVNxlI7Ir5E=;
        b=O+k6airmtoeTQZpHPonJn6WuBOScgaR+GqsM3cToHhHL6UXlqbinprGKfpo2XDgXO2
         eVVu/RFOBPr7Z1w3KkH/YKP2j3ydCTsTYPys3u2SS+V3ZEbQV+pKKMF4P53Bg92qodWR
         2hAxCsgoI4BjN/3Hofb4/ctFxk5McwckRR96SP7xWb+4JoouByzQ7QV/dbTFVxZGS+H5
         kp4HZxktM/WGE4cQsd8AfO2rPekTDrkPNFzPFtFUzSgHKYSQgZBaJVuQsa/OB3vcvB7D
         lku3q+zSIlLsdgzBQQxKY3EoFjGUyA+wSx/NwZQi1psDRpdDYvq37cNr8QLIpbV9j9a/
         1V4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J9RXigtzZqvF8NKIRf2sG4Ypb/c5XwyoqVNxlI7Ir5E=;
        b=iAkm6ivZeAx5ySdX6j3vNK3ZOu1X65qxdQ2FFGbZNDtQ/n18YwPHlONtSSuUm15Iu5
         3+ouKR4fXRXLfIVTJdfa0ozu3I1wR8z1zWB6GPG/zBpIbvFomqr/NT8TEi7RK07Ue9RK
         m8o1LhUU+s9a5wDbZ1phKMflriS9RxRASEv0hC5PiSVYzyM/o+4uUHL9Tgagmuknqdcv
         goTuVp9eL/7Y5BcTYKV5UFSIDWoHZ/AR8yaH3Noklc7QA9ZQVKHcP9N7KXr04jCoI054
         E2MB/+JgwvEHWf//m1hGPWNQIKIRmo20VHO3DbURw6qdkZXtVwWS4b/J2KIeUqh3mxvW
         Mclg==
X-Gm-Message-State: AOAM533R0BpCTWt3aDDYYAo88kMbEVX/uHxI0VyDRv9hsxjtojQMtyPp
        hz35JPcbqqH1Eyu+P+nJZAs8ONp1xcI25CfiOVvoYQ==
X-Google-Smtp-Source: ABdhPJyJu9tHRpFd4TthwF9GL52PbEJxM9JfWHXC753KZYvspsLBP+BURDqaZ3+VvaUbStkvgsLJy1JUicAoWlFlFEQ=
X-Received: by 2002:a19:e08:: with SMTP id 8mr2441966lfo.441.1605657786579;
 Tue, 17 Nov 2020 16:03:06 -0800 (PST)
MIME-Version: 1.0
References: <1605201148-4508-1-git-send-email-srinivas.neeli@xilinx.com> <1605201148-4508-5-git-send-email-srinivas.neeli@xilinx.com>
In-Reply-To: <1605201148-4508-5-git-send-email-srinivas.neeli@xilinx.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 18 Nov 2020 01:02:55 +0100
Message-ID: <CACRpkdaSeZSvS0TpATD0MSAxbM3yP+yVU9C2zTEXJ+xuNHUfLA@mail.gmail.com>
Subject: Re: [LINUX PATCH V3 4/9] gpio: gpio-xilinx: Reduce spinlock array to single
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

On Thu, Nov 12, 2020 at 6:12 PM Srinivas Neeli
<srinivas.neeli@xilinx.com> wrote:

> Changed spinlock array to single. It is preparation for irq support which
> is shared between two channels that's why spinlock should be only one.
>
> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>

This patch does not apply to my "devel" tree.

Yours,
Linus Walleij
