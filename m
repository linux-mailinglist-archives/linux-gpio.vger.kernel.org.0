Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28C391BB9B3
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2020 11:20:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727067AbgD1JUv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 05:20:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727064AbgD1JUu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Apr 2020 05:20:50 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1279BC03C1AD
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 02:20:49 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id r17so16280854lff.2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 02:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ICN7dCbBx+6WcoJArMnBEzGvK72rSzOZiK5dL2bPeD0=;
        b=GSzf/+wsv5cyATIz/phw1ojwp4XlksxZM2jEHxqwTKLBsfOj2Tm8SPZhPYNBd+ZYiw
         kkFCMlrO12KSyLfwW6Npq2lked/S06URs6P2h7WJVdy8hHZ+CBtRGQCAQDMgJyyyLRaO
         IvBJ7XYQ5jC0tIiRtVPN2ODt0VtbClcg2ZPs2tMKCR1du0uNpaTy0bAsbdFeW8k/6lVQ
         KjKh1X855w6wNtJ5KK+z0/TMd5dyQCBrcsoXmCGNxSxdiKBaLmy+WoA5p4sO8gqIU4K/
         yvpoXibwcg0tLpNTItn8e408z//AZ+7vFd8F9xxOLytU2lVZhMpt9K7sasBX3FT6nu4o
         4phw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ICN7dCbBx+6WcoJArMnBEzGvK72rSzOZiK5dL2bPeD0=;
        b=lnFXGPvxqweYjcu+ogWKey3KieJuJP2forb5QkrhZOsWxbTff2EeYCf+CoWLiv6dl8
         az/PWaUswqfDasPCkfXO4wcdh6U3T1c0jCgl7naRjBvQd0V9kz2go0dxmeO84I2cVokB
         JJ6BzcUaSrq5FAMy7iRR6At5NpEhcFdLpk7Evtlsq3ZH7cy0ayF5yvNGII/H5HQ6HL18
         3Bgxs+CFtbTkSUK+yvIu+/qlMm/ZOIFRbeUAlKKp0U88vxyZAGM39AiwtZncBEaKUlgp
         Aaqb+Xq6UvDa8RFIPZomZKMpCVXQUA8GRpRcy7aFQf+cceoSMxR5oBIPSzoAsVpIUuNp
         GAWQ==
X-Gm-Message-State: AGi0PuYc/nGeSKtLntst7z2qL3OwFI+g1TpeHITonSvFTWKpMvAcBJgL
        UZwG11sOJZXunIgGsJ3qcv+Sj7mRdp3E9v4c3kTFBw==
X-Google-Smtp-Source: APiQypIus6ZMe4qjasmN97t76YaFjK6cebZ/M2PBOdjLaAbJq41X1LdszKoDynGbta+EZNl04COKBV/jynSPVQp9okk=
X-Received: by 2002:a19:42c3:: with SMTP id p186mr349742lfa.194.1588065647258;
 Tue, 28 Apr 2020 02:20:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200417061907.1226490-1-bjorn.andersson@linaro.org>
In-Reply-To: <20200417061907.1226490-1-bjorn.andersson@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Apr 2020 11:20:36 +0200
Message-ID: <CACRpkdb9ZmoD5x1g7O-BHFWJ3qNMBGrrVN_=ygDAMuXe76xuFg@mail.gmail.com>
Subject: Re: [PATCH 0/2] Qualcomm SM8250 TLMM binding and driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 17, 2020 at 8:19 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

> Binding and driver for the Qualcomm SM8250 TLMM pinctrl block

Applied both patches. Thanks!

As noted elsewhere Qualcomm is full circle now recycling the
number of their first Snapdragon QSD8250 SoC from 2007
for a new SM8250 SoC only 13 years later :D

Yours,
Linus Walleij
