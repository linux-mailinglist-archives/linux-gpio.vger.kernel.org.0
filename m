Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB4F04D996
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jun 2019 20:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726052AbfFTSkf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jun 2019 14:40:35 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34536 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725869AbfFTSkf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jun 2019 14:40:35 -0400
Received: by mail-pf1-f195.google.com with SMTP id c85so2164057pfc.1
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jun 2019 11:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3E9yCKMWHtYXo9wRsncEUScya2BBzWft7CLBUWLLdV4=;
        b=hyhR05T+yMmKFbyV70Y25z06JF/z+EPcG98dgh4y79hyhyESfyRzRqbb8kiCD0aPJs
         Z5Jcgf2l1gQpElDrQ5+D7lXj/T+7NHLv0bbjO9ZNoB1Kzb29SyBOv0l9Y+s+B6xqITAh
         X2AMd8FFR/8JtjLiRFbBhvHdwplbb75LkMbwycM/9mWp+Vga/Y+i/zCU5z6uwgPfshpk
         /vgG5wH1DxpmNGZbV/fymrtWs0aBvAI9Qwh3bgh3wln1U8JfOPeDGUtBysELMquUiuQS
         XMMEfBnrg1hdTHDE+c4bbDEqWEwssQWMTbskVcIKztYdquafiypCwze429NBLMVxZbbo
         c2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3E9yCKMWHtYXo9wRsncEUScya2BBzWft7CLBUWLLdV4=;
        b=aTsMF6zW/bV8tAqHVRarPl6Hn94wOYGw9YpvmhEc4O6pU8VMCjk+FTh15Bu3hEw4uR
         OfNGb2E/++wOXzD5o9uu7HsMOVawwmLrj7eBekqICFTkDSVYEP8xQEizPzy13xkY+UWw
         pEqdmGwok3vsBJWsD5WwZWu5/j0BN3Qju7ojGpZ4V0pa0nM4Su4NlJ4dAY7nmrGdUo3t
         03S4X+SdzEG7LpJwEtBBPn6ls380euH0PlIZlg1TKonR0Ly7gLMglCg1v9Gpdw35Zm7O
         UFNbxJkKfGGwOED1eACDmHJJCololtxpLXgd0OaB6pxhGGhsKzch6JlSd79oUmRDWR6q
         pHEA==
X-Gm-Message-State: APjAAAUibiRrRpESC2Q3obU8dlp/394nwNsMSmuxi7m/wTVtGm55fTe6
        gVFOvsj6LBrdZMywDZ5UcVQZ2w==
X-Google-Smtp-Source: APXvYqw670I70MZtHBEfqVjppQCLZyKZubkBQX7oucoHQkaeWDMjIPR6gtBFCP8G2slIEMY6I2t52g==
X-Received: by 2002:aa7:8157:: with SMTP id d23mr132293116pfn.92.1561056034189;
        Thu, 20 Jun 2019 11:40:34 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 14sm320978pgo.70.2019.06.20.11.40.32
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 20 Jun 2019 11:40:33 -0700 (PDT)
Date:   Thu, 20 Jun 2019 11:41:24 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        gpio <linux-gpio@vger.kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: How to write "modern" pinctrl DT node
Message-ID: <20190620184124.GB24205@tuxbook-pro>
References: <18ab4b1c-e74e-410a-a504-f524e46c42ac@free.fr>
 <20190611180516.GO4814@minitux>
 <be298c01-53b8-a954-5de0-3f302265f1cb@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be298c01-53b8-a954-5de0-3f302265f1cb@free.fr>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu 20 Jun 04:02 PDT 2019, Marc Gonzalez wrote:

> On 11/06/2019 20:05, Bjorn Andersson wrote:
> 
> > Also, what's up with tsif0 vs tsif1?
> 
> Some people count from 0; other people count from 1.
> 
> The HW programming guide mentions TSIF_0 and TSIF_1.
> The pinctrl driver defines tsif1 and tsif2.
> 
> I propose we use 0 and 1 consistently everywhere.
> 

I do like when the tlmm functions matches the hardware block naming
(which for some reason is not always the case). So I'm good with your
suggestion.

> > PS. I would suggest that you send a patch to the MSM8998 pinctrl driver
> > (and binding) where you squash tsifN_* to tsifN. It would break
> > backwards compatibility, but I think we can take that risk now before
> > someone starts to use it... And after that you can go with your proposed
> > squashed node.
> 
> Here's what I have right now:
> 
> $ git ls --stat 85c02fb4dfd1..HEAD
> 5ed38c44a92a (HEAD -> tsif-fixup) Fixup qcom,msm8998-pinctrl.txt example
>  Documentation/devicetree/bindings/pinctrl/qcom,msm8998-pinctrl.txt | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
> 823402af81a6 Fixup qcom,msm8998-pinctrl.txt binding
>  Documentation/devicetree/bindings/pinctrl/qcom,msm8998-pinctrl.txt | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> afb686b8b3e7 Squash all 5 tsif1 pins together
>  drivers/pinctrl/qcom/pinctrl-msm8998.c | 38 +++++++++-----------------------------
>  1 file changed, 9 insertions(+), 29 deletions(-)
> 8e4d31c8d455 Squash all 5 tsif0 pins together
>  drivers/pinctrl/qcom/pinctrl-msm8998.c | 38 +++++++++-----------------------------
>  1 file changed, 9 insertions(+), 29 deletions(-)
> ee850fa510a6 sed -i 's/tsif2/tsif1/g' drivers/pinctrl/qcom/pinctrl-msm8998.c
>  drivers/pinctrl/qcom/pinctrl-msm8998.c | 40 ++++++++++++++++++++--------------------
>  1 file changed, 20 insertions(+), 20 deletions(-)
> c7ffe4075623 sed -i 's/tsif1/tsif0/g' drivers/pinctrl/qcom/pinctrl-msm8998.c
>  drivers/pinctrl/qcom/pinctrl-msm8998.c | 40 ++++++++++++++++++++--------------------
>  1 file changed, 20 insertions(+), 20 deletions(-)
> 
> I'm wondering if the series needs to be split up (as it is) or squashed
> into a single patch (might be harder to review for mistakes).
> 
> What do you think?
>

Go for one patch.

Regards,
Bjorn
