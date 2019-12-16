Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21871120F7C
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 17:31:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbfLPQbp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 11:31:45 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35345 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726545AbfLPQbo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Dec 2019 11:31:44 -0500
Received: by mail-wm1-f65.google.com with SMTP id p17so7423711wmb.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2019 08:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=tOdF2v2tnPw84XyFs+DLGKUeb/1Y9vVZVEyHczF+0yg=;
        b=v75PO5hRYI3xifwe8IjjxOk8gXJmuPeTk8r/sebv8k5VXvGx2syxR0H2BKR6+vXv2H
         tXer/YdwJlAMyR6zpiMe252PHatrAG2aKC/69EAn0ZDmqxbtiiKDtszJ1HIgL3DgkLRd
         Y71pqiVAxrAniWaaLJfzb0lXCjDqpPY6au4dWY3RakMG9IrCBjprhEWpW4oSTXYKR6o2
         mdt/kTckQyZGRZ8izFK+O2fSRgUC3kCpertIvQABHrTv22+fA88ER9ECqNDpFSkkqWlN
         vlL4nqfNXTN3xHkdXsyHbGlOzAyx7gQHwXYJX9pETi/63ceapo1lij7b17hsEHuP5nWb
         PQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=tOdF2v2tnPw84XyFs+DLGKUeb/1Y9vVZVEyHczF+0yg=;
        b=nBZc0IS64VBbcdeSY3SMljpy1jm362JGel33BMjYBqkBridN5XZhsZO66HTvEtNEIx
         1iPKWRZb9Hb/hTIBaMX5HdnzdJzK+XcREYvbSjxd4+tQkZaF2dh+MtWKDFbEgDcnG7A2
         rfuOw1ewjt55mVmi+x7TpccaB8k2HkKt91PK+wGrF2xia655/z7AXFPfxhxU/25qankf
         n7u/APsGQLOHEjRELuUPp2r1Q+60hGcImpAem+0FZC+S+qaWESIUM0GpZLWuRVoWwxTD
         ZulOUvttXlQpOE/IR3iCa3u9Qe+OxASGPLZ9OtPecISP7UqR/mW4xt02BBd8UM+Qhxq9
         VdRg==
X-Gm-Message-State: APjAAAUQrqoYrALP4bRNEwQH90SyudcvazxZKpkQl94BEZktl96DqxCI
        kRgz7NdjouLhH1GjqouepRpzJA==
X-Google-Smtp-Source: APXvYqza4ODdROrK4+NXBOk9wQRDqm6YbdINa4RvvhiswJwObb7hlbCMFzyXEVki5DExzxaNMZShsg==
X-Received: by 2002:a05:600c:2218:: with SMTP id z24mr31321397wml.50.1576513902937;
        Mon, 16 Dec 2019 08:31:42 -0800 (PST)
Received: from dell ([185.17.149.202])
        by smtp.gmail.com with ESMTPSA id w20sm21142865wmk.34.2019.12.16.08.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 08:31:42 -0800 (PST)
Date:   Mon, 16 Dec 2019 16:31:41 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     support.opensource@diasemi.com, robh+dt@kernel.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        joel@jms.id.au, andrew@aj.id.au, lgirdwood@gmail.com,
        broonie@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH v3 5/6] dt-bindings: mfd: da9062: add regulator gpio
 enable/disable documentation
Message-ID: <20191216163141.GS2369@dell>
References: <20191129172537.31410-1-m.felsch@pengutronix.de>
 <20191129172537.31410-6-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191129172537.31410-6-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 29 Nov 2019, Marco Felsch wrote:

> At the gpio-based regulator enable/disable documentation. This property
> can be applied to each subnode within the 'regulators' node so each
> regulator can be configured differently.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> Changelog:
> v3:
> - adapt binding description
> 
>  Documentation/devicetree/bindings/mfd/da9062.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
