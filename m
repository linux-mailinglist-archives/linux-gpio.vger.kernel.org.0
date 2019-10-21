Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 508D9DE469
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2019 08:19:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbfJUGTk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Oct 2019 02:19:40 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:35254 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726072AbfJUGTf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Oct 2019 02:19:35 -0400
Received: by mail-pf1-f194.google.com with SMTP id 205so7738228pfw.2
        for <linux-gpio@vger.kernel.org>; Sun, 20 Oct 2019 23:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=npNayPk5J2u1XBbRL1kMyLo7Xv1HpI8J+9mr55B2g9k=;
        b=QDvYpVhOa9llomgrWhkQTV7AvVq+a5nmiWzxknp7M34fEjVS0v79bpDXYYSHLu1xsh
         3r2LrOxWZCd+j+SAZnX3yRG89haB45hBUtUWfOXkCUWRQjipPwvece8OYwGhB5XPEMcD
         c23ua7i3PrboPvRFsD5ptap2coA5uv0FIuyTXAuCEXxI5d4XDx9p57AaYol3GG+DWot8
         rOcaEGRFXQi6qMDjK8Ia0W2wdzqRJnHDWluTgedOmC4Cg7Ox1ipLSdIXb1pVuHVDr6DC
         5EU+++ld2CJkiSlsN66IxR3O3iwDLczgHbsaQSPQ7rnFNDV0pmIVa35r8FugJDDtWKTi
         9Bhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=npNayPk5J2u1XBbRL1kMyLo7Xv1HpI8J+9mr55B2g9k=;
        b=iQIrkAYRP7Ij69V+dHvrIkfX2WJ9g92nXR6v5jnogLbQan0ue9dskNFBlzMtQW6OZB
         3tfbZd1cXgIJ/pf6VyhiaHpQRghP93atAVSsoWEKhVkgNHfFSVA/KvOP5sPE/il8x+xN
         eo1S5qdTuwksrW27hJH85M9b1yUQ7qRn798E8VBDXv8XgCSO3futpHXtpBA6BqISZW4H
         ZJB5SyYbaQWFdroko0R5BMwUOi4b1A/5kxdrXUQVxXOLtaJKt/+XiNs2zqYCst3xQcGZ
         hVaA7+8FcWfFD93mYsSKpo5TnFSNv848hSvnagaGWB64iZ/227aEdeg/NVXQYYsZI7HK
         +sYg==
X-Gm-Message-State: APjAAAUSBYXbsbpXPn/UW0eECYG4oxXxS1gyL9E7lcwldUQuVPcBjl0s
        AnXAomif3y8fQQHXaPWqOhRV
X-Google-Smtp-Source: APXvYqwa4lMT7wTGnd2y2szR63pKR1Kh4XWszfDbs08XxK1GjzoN2xaHY4ePYHjDl7fkNdK2QUchbw==
X-Received: by 2002:a62:5c07:: with SMTP id q7mr20788083pfb.159.1571638773575;
        Sun, 20 Oct 2019 23:19:33 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2405:204:700f:8db6:2442:890f:ac37:8127])
        by smtp.gmail.com with ESMTPSA id x65sm14911120pgb.75.2019.10.20.23.19.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Oct 2019 23:19:32 -0700 (PDT)
Date:   Mon, 21 Oct 2019 11:49:26 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-unisoc@lists.infradead.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>
Subject: Re: [PATCH v2 3/4] gpio: Add RDA Micro GPIO controller support
Message-ID: <20191021061926.GB12001@Mani-XPS-13-9360>
References: <20191015173026.9962-1-manivannan.sadhasivam@linaro.org>
 <20191015173026.9962-4-manivannan.sadhasivam@linaro.org>
 <CACRpkdZRY138RAf8N2xGam89r66ik2vW44OZx0bDcCt4P2GBLA@mail.gmail.com>
 <20191019160513.GA17631@Mani-XPS-13-9360>
 <CACRpkdbgFGciZMBF-_h5Wi47Hmco7tA9Pr7XegM8SpWxhqLT1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbgFGciZMBF-_h5Wi47Hmco7tA9Pr7XegM8SpWxhqLT1A@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Mon, Oct 21, 2019 at 02:57:31AM +0200, Linus Walleij wrote:
> On Sat, Oct 19, 2019 at 6:05 PM Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> > On Wed, Oct 16, 2019 at 02:41:32PM +0200, Linus Walleij wrote:
> 
> > > select GPIO_GENERIC
> >
> > hmm.. I don't think this driver can use it. Please see the justification
> > below.
> (...)
> > As you can see in this driver, there are 2 separate registers needs to be
> > read in order to get the value. RDA_GPIO_VAL needs to be read when the pin
> > is in input state and RDA_GPIO_SET needs to be read when the pin is in output
> > state.
> >
> > The MMIO driver relies on a single `dat` register to read the GPIO state and
> > this won't fit for this driver and hence my justification for not using it.
> 
> Use RDA_GPIO_VAL for dat, then set BGPIOF_READ_OUTPUT_REG_SET
> and the mmio core will do what you want I think? That's what the flag is
> for IIUC.
> 

Ah, this should work. Sorry for missing this earlier.

> Maybe we should document it better :/
> 

That's how everything is in kernel for me... If you don't look closer, you'll
not get it.

Thanks,
Mani

> Yours,
> Linus Walleij
