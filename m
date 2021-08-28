Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85FF43FA6ED
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Aug 2021 19:16:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbhH1RRn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 28 Aug 2021 13:17:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbhH1RRn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 28 Aug 2021 13:17:43 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7385DC061796
        for <linux-gpio@vger.kernel.org>; Sat, 28 Aug 2021 10:16:52 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id l7-20020a0568302b0700b0051c0181deebso12203861otv.12
        for <linux-gpio@vger.kernel.org>; Sat, 28 Aug 2021 10:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Q3vx9KPM0ynEgRyDybcuLPMlUBUC/MjvyIKkhWo2C9Y=;
        b=cQpEkhuIKs61Vf3WunJpRhCiumTRy1vtfM7OwvmTWYxvdHo8sNaJKXBY6RCExXjfw3
         pxjsa6BUzmaBEEVpFSYhyCq3qnhIkUt4hUUsGlfrUxJmpoivWPCO1I8sWi3PY+XHY113
         olLH8qayt1qTv7UC1RFPDkTRuUCjvW//liokyp6Ye2Gl55jvMVcDadwUFFObYkddEOs8
         /el6uuR6zZpnRgLoLQIflveeZ/QXszVrMISEnUCPSxtrpF2cGy50KaGz+dZ2YH3ej20s
         3IBb7jd0B2Z67KByfkh8ejMzTTlRM01dMWjq3XvbcpUnQd2xhOHpLsh1t2/BiO/hF+qb
         ZV6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Q3vx9KPM0ynEgRyDybcuLPMlUBUC/MjvyIKkhWo2C9Y=;
        b=WpJg1hGsEUyqzriLptFTNfuKkOG2w1+qnZq/K2MSmjJg8naSG1W3VFONYjhtJ0WgIB
         yM5u3p8qYX7YxyfQaUvmK56hA7JT/a+XEo4Ript/ig2uGJ2WI1hC9s2FGkVUxg8FVplg
         JjChSWHcLrk8oSJjowNE/xyZ5D8Aw3WMF/tuuMxCGBOSQVSy4UXODarWI5kV1rfjYmcr
         cec6i93yLv2xTJEcKqtlcjz65mKxzet/ksBPxKwcKcSKMrvhE0ByemJsh2sjv2T+GAQ8
         KMc3HFKASepaSbBSeissmMsvp4KnpgPXtDF9++uIWftYFwKATZSQ10jnT7GCIil2SyuP
         95jA==
X-Gm-Message-State: AOAM532rymdBizXKK/k4gPElSm8IMbW+zvombmOUcaSZOe9TJnC7sbG6
        n7kzQksSZouUYjLJiSiJFaOl5sYt4fQloQ==
X-Google-Smtp-Source: ABdhPJwWVKLH+PWa5DIz6f1PzZytQfIjCnHKaoNQWVuvkkNMnvWrp6rSiaLr8zGGgVluzVXI1JOyxQ==
X-Received: by 2002:a05:6830:1184:: with SMTP id u4mr13170641otq.55.1630171011667;
        Sat, 28 Aug 2021 10:16:51 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 31sm1940409oti.63.2021.08.28.10.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 10:16:51 -0700 (PDT)
Date:   Sat, 28 Aug 2021 12:16:48 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add SM6350 pinctrl driver
Message-ID: <YSpvgNCxKk4zgsCP@yoga>
References: <20210828125112.14721-1-konrad.dybcio@somainline.org>
 <20210828125112.14721-2-konrad.dybcio@somainline.org>
 <YSo+lTwmbVpZYvxS@yoga>
 <501ee7b9-3db2-7a4a-e25a-fcfbce645bc7@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <501ee7b9-3db2-7a4a-e25a-fcfbce645bc7@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat 28 Aug 10:43 CDT 2021, Maulik Shah wrote:
> On 8/28/2021 7:18 PM, Bjorn Andersson wrote:
> > On Sat 28 Aug 07:51 CDT 2021, Konrad Dybcio wrote:
[..]
> > > diff --git a/drivers/pinctrl/qcom/pinctrl-sm6350.c b/drivers/pinctrl/qcom/pinctrl-sm6350.c
[..]
> > > +static const struct msm_gpio_wakeirq_map sm6350_pdc_map[] = {
> > > +	{ 3, 126 }, { 4, 151 }, { 7, 58 }, { 8, 113 }, { 9, 66 }, { 11, 106 },//
> > > +	{ 12, 59 }, { 13, 112 }, { 16, 73 }, { 17, 74 }, { 18, 75 }, { 19, 76 },//
> > > +	{ 21, 130 }, { 22, 96 }, { 23, 146 }, { 24, 114 }, { 25, 83 },//
> > > +	{ 27, 84 }, { 28, 85 }, { 34, 147 }, { 35, 92 }, { 36, 93 }, { 37, 94 },//
> > > +	{ 38, 68 }, { 48, 100 }, { 50, 57 }, { 51, 81 }, { 52, 80 }, { 53, 69 },//
> > > +	{ 54, 71 }, { 55, 70 }, { 57, 152 }, { 58, 115 }, { 59, 116 }, { 60, 117 },//
> > > +	{ 61, 118 }, { 62, 119 }, { 64, 121 }, { 66, 127 }, { 67, 128 },//
> > > +	{ 69, 60 }, { 73, 78 }, { 78, 135 }, { 82, 138 }, { 83, 140 },//
> > > +	{ 84, 141 }, { 85, 98 }, { 87, 88 }, { 88, 107 }, { 89, 109 },//
> > > +	{ 90, 110 }, { 91, 111 }, { 92, 149 }, { 93, 101 }, { 94, 61 },//
> > > +	{ 95, 65 }, { 96, 95 }, { 97, 72 }, { 98, 145 }, { 99, 150 },//
> > > +	{ 100, 108 }, { 104, 129 }, { 107, 131 }, { 110, 132 }, { 112, 133 },//
> > > +	{ 114, 134 }, { 116, 136 }, { 118, 137 }, { 122, 97 }, { 123, 99 },//
> minor:
> 
> above lines in sm6350_pdc_map[] has // at the end.  Probably Bjorn might fix
> them when applying.
> 

Thanks for noticing Maulik! Konrad, can you please trim those when
you're respinning the binding?


Maulik, when replying to long patches, please trim out unrelated
snippets so that it's easier to spot your comments in the large block of
text.

Thanks,
Bjorn
