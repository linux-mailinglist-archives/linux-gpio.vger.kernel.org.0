Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A626D356CAB
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Apr 2021 14:52:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352298AbhDGMwp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Apr 2021 08:52:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344002AbhDGMwl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Apr 2021 08:52:41 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EEC5C061760
        for <linux-gpio@vger.kernel.org>; Wed,  7 Apr 2021 05:52:32 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id z8so20492483ljm.12
        for <linux-gpio@vger.kernel.org>; Wed, 07 Apr 2021 05:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c6MOoIBYaq1FB2jWSG59PiLmzCCOZs346eUtfJNgae4=;
        b=jO5TJkcVxVu3tzmZF75IY8ZZut5WsUpOx6Ar889EYfG66YONWiO1Tiv99+vCw2lDTJ
         rwx67c4UfEo8v/dX6vqo8D5nfdO0cfqCEnTeqLSaAtay+pBpaMAmLCEjo2RsrH2Tons2
         xKoIACfEiINUHYkrBO3Jhkgt06QXn8IDAT3681aGfb8XAcfttlHjeGObqu6dYPLLUvzL
         GZoA7dehKZjM6vncDr7/h7MnRq2evMxhDEVO5lBbST1zJ0rr24SAOGn7CjODoY4qQIVN
         iQn9dULPR8fJ2/T4DGW7gzMRz4haqcWbPJQSY1WxEGiFp2Jc8opyeXOa9A09V76AMCMD
         BGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c6MOoIBYaq1FB2jWSG59PiLmzCCOZs346eUtfJNgae4=;
        b=gyiTMQKKIPGrU+SN++T9pvR1juQnC5zC3THiCnblEkXh31MOBGBQXMHhip8HisxcE0
         bKY7s0YdcJOadSTUmWNzXl5NVexdRV6KYy+xR6ADNNP2B+2Gl707KUo0Qzitd/lwzOvL
         HBkrUq0WZaiB4bgCI89+u7QW1aRxbFoPlrZ6bIHhM0OuHZY7FTQAjFdjXCpYlOyzFPAq
         RnTk53tRmDO8sXA/7TgVaxapqUaZMSrGBsF4FLCC3Rm5VWHLUvgkK9iWwmwcNNDu/XbH
         mmZlzzznaGfl0bSwo2JI+IHi0Wu3C5pCwKPyr7dEUbtiO/fNdfgXHllaJElV7sMN2wuw
         Zjsw==
X-Gm-Message-State: AOAM5306tmFlw7QRIDx3TVBLfQHNF6tPeg4sC+iABk0cNRNwtWzDx35b
        nbO10GOgKEaYXxKSWlJYhRq0EIcp4f5FPrK6Cli+gg==
X-Google-Smtp-Source: ABdhPJxV7n/Kf8dNdBmeRaU9S6qNbt86uhvn/5D6xRYMV9bk3xv7vbh2O6AjGS8LhNmz8YBjqoKqs4CoaUamjLKjtqk=
X-Received: by 2002:a05:651c:103a:: with SMTP id w26mr2032872ljm.273.1617799950344;
 Wed, 07 Apr 2021 05:52:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617279355.git.mchehab+huawei@kernel.org> <f056e1e16adff1df42416f0033fdb730169edf44.1617279356.git.mchehab+huawei@kernel.org>
In-Reply-To: <f056e1e16adff1df42416f0033fdb730169edf44.1617279356.git.mchehab+huawei@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 7 Apr 2021 14:52:19 +0200
Message-ID: <CACRpkdaw3Eh=gYPAw+zZM3OCteXDyXzgqOkKsT9q_h0cQZ6GAg@mail.gmail.com>
Subject: Re: [PATCH 32/32] pinctrl: update pin-control.rst references
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Drew Fustini <drew@beagleboard.org>,
        Lee Jones <lee.jones@linaro.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <alsa-devel@alsa-project.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 1, 2021 at 2:17 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:

> Changeset 5513b411ea5b ("Documentation: rename pinctl to pin-control")
> renamed: Documentation/driver-api/pinctl.rst
> to: Documentation/driver-api/pin-control.rst.
>
> Update the cross-references accordingly.
>
> Fixes: 5513b411ea5b ("Documentation: rename pinctl to pin-control")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I assume you will apply this Mauro?

Yours,
Linus Walleij
