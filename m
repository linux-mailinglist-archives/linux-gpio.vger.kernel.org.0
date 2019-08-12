Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1889A89B1A
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2019 12:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727679AbfHLKPJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Aug 2019 06:15:09 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:32858 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727324AbfHLKPJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Aug 2019 06:15:09 -0400
Received: by mail-wr1-f65.google.com with SMTP id n9so104177659wru.0
        for <linux-gpio@vger.kernel.org>; Mon, 12 Aug 2019 03:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=MIUyKFqvrV6Iriy5J++Bt5lmEJciQ4Nm0oLpNRJua4s=;
        b=JR4azrcfAINC79q/jxAC5q7wpl2GKtG+oqSduyMfzGNi7MCwG1x0vzQwWE5XWnUsqn
         4rvq0ZyF2vO73A1od36hoy/HlgAwsQvByuaSCf7qgoFk0pOoRmactaeJq+N5rrNr4nL0
         sMHmT+JJqQs1y47xUz0okyakzzuIzsZIQGoTNgr4MGMcXjg3SNLTpn0uQpJpePxfemI4
         eB9TFJRJdK0BAqRd3cOv4t3yykDlaiC8dePribs8TWaAdBtswdtwqoRGP8NGraDpCip6
         8mqPQZISI27VYMKq3Sw4FiBoVw8kpXQ/RGpijePMRLwvuqDyia8ETir7eum49Jot7nAU
         gSnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=MIUyKFqvrV6Iriy5J++Bt5lmEJciQ4Nm0oLpNRJua4s=;
        b=sY1gde1ZwWnL5ylqh6hLVuVAStbomOqUKRRIBER5pEBGBew112DekhtOYa7IRlACwu
         mvF//nvWcC/2f/5x8a8/xqlsUbGtFadhsKgPh1xShj1yBCjTunpLS3rCKsS+hgM0jbTF
         pJeJor2eCaClErzn8QNISmwPSpjw8w96ltQRsTkGaUMyU7TLf/7+d7ObSitnmp0FLrBK
         BQVGYcHkjk/4Nqe5YlFAq4qPmgaFg4A02N/nMZLECL+ZPaMgHItVAN+aPzlFUpZZB0HT
         YyQSBcVFOple+Js5hieLNU8sRZnGFL1HHNNgySk2yD7wi0LZOa4QZeh3wbp6tHfaWR5J
         OOBw==
X-Gm-Message-State: APjAAAVwyYgh9HsoRtk2lCp2JslkHkvIfu9SGLC7F+AYEhkecchx719H
        qu2RzKoWL4675yXjmInna3Mg/g==
X-Google-Smtp-Source: APXvYqz48A5YFBe5piSydrG0TZ+rpOGZ4/18TlUR5pdHjlvP/9aDOmhZiCfxMVH17iE2WGkbx8bxMw==
X-Received: by 2002:adf:f042:: with SMTP id t2mr39835533wro.139.1565604906881;
        Mon, 12 Aug 2019 03:15:06 -0700 (PDT)
Received: from dell ([2.27.35.255])
        by smtp.gmail.com with ESMTPSA id d17sm14629320wrm.52.2019.08.12.03.15.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2019 03:15:06 -0700 (PDT)
Date:   Mon, 12 Aug 2019 11:15:04 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andrew Jeffery <andrew@aj.id.au>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Joel Stanley <joel@jms.id.au>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 3/3] dt-bindings: aspeed: Remove mention of deprecated
 compatibles
Message-ID: <20190812101504.GF26727@dell>
References: <20190724081313.12934-1-andrew@aj.id.au>
 <20190724081313.12934-4-andrew@aj.id.au>
 <CACRpkdZCJWeZO6CFvkq4uhnX+o_q_AfkDZ=a2kmUgbS3JtDqfA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZCJWeZO6CFvkq4uhnX+o_q_AfkDZ=a2kmUgbS3JtDqfA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 05 Aug 2019, Linus Walleij wrote:

> On Wed, Jul 24, 2019 at 10:13 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> 
> > Guide readers away from using the aspeed,g[45].* compatible patterns.
> >
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> 
> Patch applied to the pinctrl tree.

With my Ack?

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
