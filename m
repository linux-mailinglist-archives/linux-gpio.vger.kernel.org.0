Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0D1C410E
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2019 21:33:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbfJATcm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Oct 2019 15:32:42 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44712 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726509AbfJATcm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Oct 2019 15:32:42 -0400
Received: by mail-wr1-f68.google.com with SMTP id z9so3767946wrl.11;
        Tue, 01 Oct 2019 12:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ayUbWJsxkqD+mo0+GTLk1QtdaMyIPMQiVn/aJA6TKg8=;
        b=aG16SI8+yP/uMVk4R/RE2X/uZ3hTAvchJDTvLuIt1HL+7l300TZw1JtQbomGG2DvWW
         Yna4S2abLYPXX3xAt30NxkyvgWSZZd/fHH68WAXMHrKPyyjnYfCIUTI7Vm5t48dD72m9
         JCMlamy3hNS3txsulO06zBYo63i370I//bnQlOld6JSRZ+8Rh9xTEs8wa8UOZQloym5d
         fVZsecM11/mBtVPhRtFzU0rRQCCd/dMnv/1wu8pnwBKMy7W0SunmqR63mZ+oges9NyJc
         79QyazIqV72iHH+8tbh/hzeKbJoIa/xVPjFylzdb8RIE2/PKvBmEmY+D/zwVPFhtRNjW
         Rlqg==
X-Gm-Message-State: APjAAAXSHGgtRDlxcN63ATYwHCoAsKDExT4tBqj8/vdYGgT9eeDew/m+
        hv/eGDpk3ZURvdyo9K3Q22Y=
X-Google-Smtp-Source: APXvYqwGswH3573Oay8QhO1I8alNz0mzREZr4xpskZM5gCgbs1QivesTORhlknY68JOJMjfr7TIqUA==
X-Received: by 2002:a5d:6411:: with SMTP id z17mr7835261wru.274.1569958360403;
        Tue, 01 Oct 2019 12:32:40 -0700 (PDT)
Received: from kozik-lap ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id f8sm2516442wmb.37.2019.10.01.12.32.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Oct 2019 12:32:39 -0700 (PDT)
Date:   Tue, 1 Oct 2019 21:32:37 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, tomasz.figa@gmail.com,
        s.nawrocki@samsung.com, kgene@kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] pinctrl: samsung: exynos: Add of_node_put() before return
Message-ID: <20191001193237.GB1815@kozik-lap>
References: <20190804160200.5139-1-nishkadg.linux@gmail.com>
 <20190805162154.GA24769@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190805162154.GA24769@kozik-lap>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 05, 2019 at 06:21:54PM +0200, Krzysztof Kozlowski wrote:
> On Sun, Aug 04, 2019 at 09:32:00PM +0530, Nishka Dasgupta wrote:
> > Each iteration of for_each_child_of_node puts the previous node, but in
> > the case of a return from the middle of the loop, there is no put, thus
> > causing a memory leak. Hence add an of_node_put before the return.
> > Issue found with Coccinelle.
> > 
> > Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> > ---
> >  drivers/pinctrl/samsung/pinctrl-exynos.c | 4 +++-
> 
> Thanks, applied.
>

Hi Nishka,

I am sorry but I missed the v5.4 merge window and did not push this to
Linus. It's my fault. I'll push it this time, for v5.5 (no need for
action from your side).

Best regards,
Krzysztof
