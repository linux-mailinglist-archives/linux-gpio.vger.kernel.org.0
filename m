Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B870110E9EB
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2019 13:05:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727423AbfLBME6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Dec 2019 07:04:58 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44278 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727431AbfLBME4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Dec 2019 07:04:56 -0500
Received: by mail-wr1-f65.google.com with SMTP id q10so7745342wrm.11
        for <linux-gpio@vger.kernel.org>; Mon, 02 Dec 2019 04:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=soNW5fohseRrYu9CQUXRU3A2LW40lxkkIsWjpHtjy+4=;
        b=SUG7XFQxmmslnG3yAcE+XfPV6jsM+pD0FOn/54XPlpukSkJwexaujXTj7VWCN9CS51
         K1BGEZpvuVusIAPNwGWYifr6QBV3Ofv4pimEXUe+U5dyoDivC/moJFyo7GSqhy6FLBzE
         WWeFROjbPyNLXD3Ms5kdMU3IRJEI7ZHRWvg6XrjX7ok5CeC3Ac+2cLeXhB6D9JI3Gqwy
         27A+Hp/ugNpWU9QCKhl8xOP3Fq7lXOWOI4LlRYonFmGczAd9+0uJkz7DoDYWZddCb0O4
         LP84Kbe0/+QVfD1OcPz8Aj/skgXs+GqAe4hzEhQR44AkCyfP06M0x65zCPiL2tsJnVzV
         ilGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=soNW5fohseRrYu9CQUXRU3A2LW40lxkkIsWjpHtjy+4=;
        b=FxxFgapM0KgEENHPrTqo4XinFTNUQvQg+8RuvkDCnwwIkknFDV4D8zBEcGDbzL58a4
         vbKeGQpG56XFo0HeD+aJmbp8zS0hyBscOGSVofn6mnZuwGoVghhonFodMzXvPL1Gpk6x
         w4rRoaqdhkZX1DsPmBlHrscPqo9UN7Tka6wrrjdv6MwGJp6QMCCRsQmZrjHiZjJkb9HW
         O6ONue2WZ2J6iqUgXRLawkERgIJcnlTCmRiz+yHMakaiIquZOKlAwmTaust/mDVkX+8N
         NmOanPcb+Lz+Qfq09K0e4utVm4bHsbvUWP25L7QT2nXGGPtcI+ouiHkgxfPqYwC9HrgA
         VrYQ==
X-Gm-Message-State: APjAAAVw8DEvMVlrzGmr5l4xjn9OkNk5SJQoKQ75jrpFwg2CDhvpitd4
        VXGKfPVvIycM0nyx62aAEiIF7Q==
X-Google-Smtp-Source: APXvYqwOBVgqYt1ED9Zw7laHel2W8Pvb3keFWerq1L9G4LSaenpLO4wmf6lPLnHFD28jBsEIYgohAA==
X-Received: by 2002:adf:db86:: with SMTP id u6mr72454037wri.318.1575288293871;
        Mon, 02 Dec 2019 04:04:53 -0800 (PST)
Received: from dell ([2.27.35.155])
        by smtp.gmail.com with ESMTPSA id 60sm40793963wrn.86.2019.12.02.04.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 04:04:53 -0800 (PST)
Date:   Mon, 2 Dec 2019 12:04:42 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Marco Felsch <m.felsch@pengutronix.de>,
        Support Opensource <support.opensource@diasemi.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Sascha Hauer <kernel@pengutronix.de>
Subject: Re: [PATCH v3 0/6] DA9062 PMIC features
Message-ID: <20191202120442.GC14416@dell>
References: <20191129172537.31410-1-m.felsch@pengutronix.de>
 <CACRpkdaSmwORgetv7aZjtgk+2OchcvQR4SBjdWQ4KsRMHuUvSg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdaSmwORgetv7aZjtgk+2OchcvQR4SBjdWQ4KsRMHuUvSg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 02 Dec 2019, Linus Walleij wrote:

> On Fri, Nov 29, 2019 at 6:25 PM Marco Felsch <m.felsch@pengutronix.de> wrote:
> 
> > this series address all comments made on [1]. Patch "gpio: add support
> > to get local gpio number" is splitted into:
> >  - "gpio: treewide rename gpio_chip_hwgpio to gpiod_to_offset"
> >  - "gpio: make gpiod_to_offset() available for other users"
> > Please check the discussion [1] for more information. You need to apply
> > [2] to test the new features.
> 
> I am very happy with the shape of patches (1) and (2).
> 
> I can apply these on an immutable branch and merge into the
> GPIO tree at v5.5-rc1 and offer to other subsystem maintainers
> to pull in so they can merge the rest of the patch series on
> top.
> 
> Alternatively I can merge all the patches into the GPIO tree.
> 
> I suppose this is not so much of a MFD business at this
> point so whatever the regulator maintainer prefers I suppose?

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
