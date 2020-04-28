Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FDCB1BBA0F
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2020 11:40:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbgD1Jki (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 05:40:38 -0400
Received: from mail-ej1-f66.google.com ([209.85.218.66]:32971 "EHLO
        mail-ej1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726932AbgD1Jkh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Apr 2020 05:40:37 -0400
Received: by mail-ej1-f66.google.com with SMTP id nv1so16756254ejb.0;
        Tue, 28 Apr 2020 02:40:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QPpy8dELuAAjDK6ELgslqKgtZGdGtoakZnwFCsFyxiY=;
        b=SB1C5AgCL0uhWv8Autt7LrkawzvSoMx1LjP4jyMGQCHiV71tslZ5VBQOVjNnqPn1yE
         Exj3BPYhxPecw2VqYN5+msmjRp1dBKFFiNX3RatKtVd0lLl3ctH6iPZ11+VCon2oN5Kc
         NIl3JJLhkUkVTZ2W71ePFm7+SkkJgxYt2i1iWLz4VHinRzl+y95iQqLCQsinfsDjazhI
         zWxLT8fFvWer6c2Gux47FqyGijwi7/lANI6xV2Vc+dFc05aImplSdMpktnyg5O4B3wBr
         tDXOylZut0Ko5zkdML+9Ym1VC+PUnmrcerUEaZHFSjv0STgVvvzSqiNAJ2HXCRzSIgf+
         2+7A==
X-Gm-Message-State: AGi0PuapHNDy4Srupr3U4sy97HgivpsOTu7WqBuMlMrbpZpWkBonY1cE
        TifHUIKd/gN2HQP0KZT1HJewoPQo
X-Google-Smtp-Source: APiQypK/J2mRSfYf1Diw96LSTO8Uy+VHIm/8bbRhhtGMjC1QU33gdmtKQlVA6cbWyNIKnF5z1H2Phw==
X-Received: by 2002:a17:907:20b5:: with SMTP id pw21mr22933290ejb.227.1588066835749;
        Tue, 28 Apr 2020 02:40:35 -0700 (PDT)
Received: from kozik-lap ([194.230.155.237])
        by smtp.googlemail.com with ESMTPSA id yd11sm398829ejb.8.2020.04.28.02.40.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Apr 2020 02:40:34 -0700 (PDT)
Date:   Tue, 28 Apr 2020 11:40:32 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Jonathan Bakker <xc-racer2@live.ca>
Cc:     tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, kgene@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: samsung: Save/restore eint_mask over suspend
 for EINT_TYPE GPIOs
Message-ID: <20200428094032.GA23462@kozik-lap>
References: <BN6PR04MB06600C848C2C1531F73DAD7BA3D10@BN6PR04MB0660.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <BN6PR04MB06600C848C2C1531F73DAD7BA3D10@BN6PR04MB0660.namprd04.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Apr 25, 2020 at 04:10:46PM -0700, Jonathan Bakker wrote:
> Currently, for EINT_TYPE GPIOs, the CON and FLTCON registers
> are saved and restored over a suspend/resume cycle.  However, the
> EINT_MASK registers are not.
> 
> On S5PV210 at the very least, these registers are not retained over
> suspend, leading to the interrupts remaining masked upon resume and
> therefore no interrupts being triggered for the device.  There should
> be no effect on any SoCs that do retain these registers as theoretically
> we would just be re-writing what was already there.
> 
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
> ---
>  drivers/pinctrl/samsung/pinctrl-exynos.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

Exynos4412 (Odroid U3) also did not retain the register values. SD card
detect interrupt should be affected.

Thanks, applied (with CC-stable).

Best regards,
Krzysztof

