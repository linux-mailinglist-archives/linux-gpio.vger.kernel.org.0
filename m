Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60BA53B00A
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2019 09:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388263AbfFJH5e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Jun 2019 03:57:34 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33470 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388188AbfFJH5e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Jun 2019 03:57:34 -0400
Received: by mail-wr1-f65.google.com with SMTP id n9so8152582wru.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Jun 2019 00:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=xTVf10rNwhHdq0na/JiMNEiN+1J2gR7CZjLBDvBlZ9M=;
        b=C/7BgS21M51i7i2CmNw0m1n793WHuwfoYQkS3WRWJWKQsQBxjw9CIy2+Faq9ymMTeV
         U2GBuJzPbjKCHDCazNCv3EufybIeE1wUBtLZaPDWMGaINHWIIzfHC+0p9nVF7beZGSBd
         //LURySsxd2kT8FOBdUsOWxnFZ+5dl+hoVq7XeFhuZowUdZd4O1UvhPIRq4tH0zazkBr
         3TnjUYgkVr92aniAKuyUF8QQKGfjozeMSXNOnfXAnZNynC+7HVoNCxcff8tCQ4ZbboQl
         zVeN/hmZoEiKQoXh76n41vtHuJpPK1irmunendNLi9m6ZVhJKXOgCoZBuaGpKeVJspaT
         PIVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=xTVf10rNwhHdq0na/JiMNEiN+1J2gR7CZjLBDvBlZ9M=;
        b=qRk8cSA45nu04nn45zchzF00HvoclLV80D6lChTsuW51Ti3IESWki2hq8K2UKyNSDe
         FBNHQ1hrPUmFHqYOD6Ov4Tbx1Xg0hoBS0I+36XQjLTaGXa/d2wWW9VMraRQC9gxOlngl
         GYQy2Uz/fgPA2WMSgIYi0/xczaArkFBY+2ADknawlY+wTc07ZlM93BBXqT4zId2HjwjU
         iHwqNS5biyNdweCzEpdP820p6bUFGZtGYwGrSz9wCIXoGdLI17vj/MehLpk3WwsnEaMv
         q7ObtzlHX4rdjiJJGrA/m3du9VBaUA2U+Pj7qiMyG2ZkxaPuQaix1/Fs7xhqh1G0I+Hg
         SuAg==
X-Gm-Message-State: APjAAAUA/IhL7L0Y+53qaavXmIhNFxohWvrj6mc5BAAVqMKQ/kr/Wv2f
        K/SzT0hwCC6OFKva8U1ZZteOIw==
X-Google-Smtp-Source: APXvYqwPND89CTG631SsvW5xJabNs8hX8frrZKJyV7VaYPuMk/7oG5ltYmF1iH5bZQdZa0Uy/r0eCA==
X-Received: by 2002:a5d:6583:: with SMTP id q3mr47343484wru.184.1560153452753;
        Mon, 10 Jun 2019 00:57:32 -0700 (PDT)
Received: from dell ([2.31.167.229])
        by smtp.gmail.com with ESMTPSA id f13sm5796159wrt.27.2019.06.10.00.57.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Jun 2019 00:57:32 -0700 (PDT)
Date:   Mon, 10 Jun 2019 08:57:30 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>, alokc@codeaurora.org,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        jlhugo@gmail.com, linux-i2c@vger.kernel.org,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 3/8] pinctrl: msm: Add ability for drivers to supply a
 reserved GPIO list
Message-ID: <20190610075730.GH4797@dell>
References: <20190605114302.22509-1-lee.jones@linaro.org>
 <20190605114302.22509-3-lee.jones@linaro.org>
 <CACRpkdaEe3uKAsSuhbToevXH1cMsuMUvwaopLPuD+JkDTnuEnQ@mail.gmail.com>
 <20190608041044.GK24059@builder>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190608041044.GK24059@builder>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 07 Jun 2019, Bjorn Andersson wrote:

> On Fri 07 Jun 16:02 PDT 2019, Linus Walleij wrote:
> 
> > On Wed, Jun 5, 2019 at 1:43 PM Lee Jones <lee.jones@linaro.org> wrote:
> > 
> > > When booting MSM based platforms with Device Tree or some ACPI
> > > implementations, it is possible to provide a list of reserved pins
> > > via the 'gpio-reserved-ranges' and 'gpios' properties respectively.
> > > However some ACPI tables are not populated with this information,
> > > thus it has to come from a knowledgable device driver instead.
> > >
> > > Here we provide the MSM common driver with additional support to
> > > parse this informtion and correctly populate the widely used
> > > 'valid_mask'.
> > >
> > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > 
> > Exactly how we should use of the API, so if Björn can supply an
> > ACK to patches 3 and 4 I'm happy to apply them.
> > 
> > Björn?
> > 
> 
> I'm waiting for a version that does not specify the reserved_gpios for
> struct msm_pinctrl_soc_data sdm845_pinctrl {}, as this would override
> the ability of getting these from DT.
> 
> I haven't seen such revision yet, will review it once I find it.

Just testing it now.  It should be on the list by the time you start.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
