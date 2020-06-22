Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53129203CDE
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2020 18:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729524AbgFVQqd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jun 2020 12:46:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729525AbgFVQqc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jun 2020 12:46:32 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E60DC061573
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2020 09:46:32 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id n24so18727781ejd.0
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2020 09:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fSsgcITuzzTtFvxUUf/7ZrETIp3zZXPYb7gApVA448Y=;
        b=dJgV3C3Npd0Bo3NuBW7O76jTilUD1dmlODwipR7DJqKsfniJE9SVdQADL9wm1qBTQK
         m+UVWXA/QmgZQIx6zzzwM8EY/H65MfkrOJeoomdtnwunEv0iYL6h0u/yLTt2YSMip/hy
         hFVbLDJJ/4QFOSKStPOGqGPA93Xpx1MMWMHwLSUrsZkyk23hJbobslZ0KKxbKIy2+Tim
         rGezLawf5Sx8J2CMHn67m+sWMHQgfSA6ccJagdqzFjaHKS0cXCvDFZo4quqw7WT2Bw3m
         AFhMstwxn2sB7XqcmCPCSNmcq6U9iuzxiYhDHDHowhIH07YjhHnL7VCv77HHJyo8HOjh
         Jt3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fSsgcITuzzTtFvxUUf/7ZrETIp3zZXPYb7gApVA448Y=;
        b=Siq3asXpeyvEIordh13pxbP/7JUB1KQmjL4xmiFA/gxOZ8MXEbgELgGWEiiNUOrPot
         8tH9shXQJrxSy6+rjVXOr4Qc87vuv9omcvd1c9QT53nTZW9EbNfoUz87Q130/SosbPyL
         sHaixO5+iM0BkwM6/jJ4TQqIRTWyGF/jiE3UNRb8h4TAT0oLYGH6Y1ZTrOdqFyu7moXZ
         0/qYZnyxKiwepAJOSC+kiZiO2e5UxOAcivoQzEdcm3XHXQYmp/HU+pS1fcLSQbYKznXi
         Qf2Lgu7QASeAIcW6mZWj0OWpTxIVrwm/kGIusZZDfxziAqiQN5kkW1H19uD0azi0Rga2
         HzLQ==
X-Gm-Message-State: AOAM533U5zqJj9mBr+t7B1lq8kUhNOlAHfjxBcWtWduEQ4wDSHSS60rC
        sXn+NOgqo3e+fvApJY2bDsKgzA==
X-Google-Smtp-Source: ABdhPJwSEpI38Q3zwyH2KwYzEpMI5FZzuvcXZh/bMdcABtEX06nKggmbeaiHu9XyRFCFS5MYVMce8A==
X-Received: by 2002:a17:907:2052:: with SMTP id pg18mr15683151ejb.513.1592844391224;
        Mon, 22 Jun 2020 09:46:31 -0700 (PDT)
Received: from x1 (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id d16sm3841777ejo.31.2020.06.22.09.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 09:46:30 -0700 (PDT)
Date:   Mon, 22 Jun 2020 18:46:28 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        devicetree@vger.kernel.org,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: single: support #pinctrl-cells = 2
Message-ID: <20200622164628.GA510359@x1>
References: <20200618125057.41252-1-drew@beagleboard.org>
 <20200622161132.GM37466@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622161132.GM37466@atomide.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 22, 2020 at 09:11:32AM -0700, Tony Lindgren wrote:
> * Drew Fustini <drew@beagleboard.org> [200618 05:52]:
> > Currently, pinctrl-single only allows #pinctrl-cells = 1.
> > 
> > This series will allow pinctrl-single to also support #pinctrl-cells = 2
> > 
> > If "pinctrl-single,pins" has 3 arguments (offset, conf, mux) then
> > pcs_parse_one_pinctrl_entry() does an OR operation on to get the
> > value to store in the register.
> >     
> > To take advantage of #pinctrl-cells = 2, the AM33XX_PADCONF macro in
> > omap.h is modified to keep pin conf and pin mux values separate.
> 
> Hmm to me it looks like the order of the patches is the
> wrong way around here. Don't we need to first change
> pinctrl-single.c, and then only after that update the
> dts? And make sure the pinctrl-single.c change does not
> break anything without changing the dts :)
> 
> Regards,
> 
> Tony

Thanks for pointing this out.

I'll submit new version where:
[PATCH 1/3] pinctrl: single: parse #pinctrl-cells = 2
[PATCH 2/3] ARM: dts: change AM33XX_PADCONF macro separate conf and mux
[PATCH 3/3] ARM: dts: am33xx-l4: change #pinctrl-cells from 1 to 2

-drew
