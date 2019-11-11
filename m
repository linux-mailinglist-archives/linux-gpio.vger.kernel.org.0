Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96482F7518
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2019 14:36:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726985AbfKKNgY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Nov 2019 08:36:24 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40326 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726834AbfKKNgU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Nov 2019 08:36:20 -0500
Received: by mail-wr1-f67.google.com with SMTP id i10so14662330wrs.7
        for <linux-gpio@vger.kernel.org>; Mon, 11 Nov 2019 05:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=0s9ZynTVj8MKyIhAnnLXh+oQ19lAh04mL6+1frjsEwU=;
        b=c6ruehmMh/cva0d4uTQ9KOMr4Uf69bUn/3AhPtA/HZmCVJ8H1L0JWTAUrYzMGP/SkY
         HVvxkQccjvl1SbbGmizCg0YUx/hXIsWM3cCFALBEGEfAsmShHRkA0YuzZbaMXtpZ1SQQ
         tOA/jBvVAdm/W797X0W1Wj6K7RETkhkTKos+BO/+SCBA4zRVJL1l+bB/nhgeQRbu3Csf
         zjS8Hg6M2MW9YWOmE2i5vvxe3ANl8o7WrrrbTKZZvgKBhavqI82JAVZKW7Bx1U0/W40U
         RXZIWXwPCCZEee6oXd1ZR4U6bhQI5pEgWHgZI07HFiMPyUmsyzZvGgMw+tbr6EP4CVvs
         9pSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=0s9ZynTVj8MKyIhAnnLXh+oQ19lAh04mL6+1frjsEwU=;
        b=IdIdPf1vNUDT78bC4mmvo4LlgLgG7s8r7PmC27Kx/I3+TfVAeuV353KuaRSuuuhBC8
         05UGDspNLraXyGQA5JBNxhJq97Vs5GCSOjwNwdFPhgi3BzpL/cUn7lo19VMzyHplz5K9
         s+i2OHuzXxDgzHP0PG3O25xgEZHMgPL3QZpWO95a4BJnodMhOpdDphy0UIRqkD647AbU
         4iE9SBd0rQzxfsWtxNroLUYRUGu7fQH+gyZ+aaki1vQcQK3482/Pys8z1z4UkAgnBhql
         Ant9VeBj2r4sTN08qt33M0pMN39muZyw4U7/BFFizyxBvKVitRCHnptQuODbgbHNFj9B
         FX7w==
X-Gm-Message-State: APjAAAUJkGZAJjpeXHA69U96I8ckUxKITwrE2Q7ML1TgZkk8qZvJC3o7
        CqEb42AFSuFuTmMEz2/rDxgynA==
X-Google-Smtp-Source: APXvYqzHgmTe66oXstdgxQO4KmGrIbywCgH/1P35rEMm83LcQyasx1HVyYnWKQ86oUmVQzSdPuzgPg==
X-Received: by 2002:adf:9185:: with SMTP id 5mr22081841wri.389.1573479378512;
        Mon, 11 Nov 2019 05:36:18 -0800 (PST)
Received: from dell ([95.147.198.88])
        by smtp.gmail.com with ESMTPSA id q5sm13960498wmc.27.2019.11.11.05.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 05:36:18 -0800 (PST)
Date:   Mon, 11 Nov 2019 13:36:10 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     robh@kernel.org, broonie@kernel.org, linus.walleij@linaro.org,
        vinod.koul@linaro.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 02/11] mfd: wcd934x: add support to wcd9340/wcd9341
 codec
Message-ID: <20191111133610.GO3218@dell>
References: <20191029112700.14548-1-srinivas.kandagatla@linaro.org>
 <20191029112700.14548-3-srinivas.kandagatla@linaro.org>
 <20191111111836.GH3218@dell>
 <ce2244ac-2219-3cc0-8ad6-7491295fbbef@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ce2244ac-2219-3cc0-8ad6-7491295fbbef@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> > > +static void wcd934x_slim_remove(struct slim_device *sdev)
> > > +{
> > > +	struct wcd934x_ddata *ddata = dev_get_drvdata(&sdev->dev);
> > > +
> > > +	regulator_bulk_disable(WCD934X_MAX_SUPPLY, ddata->supplies);
> > > +	mfd_remove_devices(&sdev->dev);
> > > +	kfree(ddata);
> > > +}
> > > +
> > > +static const struct slim_device_id wcd934x_slim_id[] = {
> > > +	{ SLIM_MANF_ID_QCOM, SLIM_PROD_CODE_WCD9340, 0x1, 0x0 },
> > 
> > What do the last parameters mean? Might be better to define them.
> 
> This is Instance ID and Device ID of SLIMBus enumeration address.

Great.

Please define them in the same was you did for the product code.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
