Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE09B12FFDB
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jan 2020 01:59:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727260AbgADA7T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Jan 2020 19:59:19 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:46792 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727255AbgADA7T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Jan 2020 19:59:19 -0500
Received: by mail-io1-f66.google.com with SMTP id t26so43151553ioi.13
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jan 2020 16:59:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=he5w4xe5758mzPhyknWVdWn5blsV7hMVch+zol3itAA=;
        b=dXfh75CV5HEeCb+IwYelG5Cm1zwXasFFbje3v/yqczyTh4vqZsM1jTm3fVW3B6fRa6
         4/07ZeH/2sVziohlqxECP+u36INTF1yxmYQngovr23pTJxoSOzI4gGAP+jOY5SXWx8hj
         QCGm1/JFvLWfXY0isncgJzv7aVQLyNSLVqKvZf0VYtzFL3yp8G2Q781vHgNzcLApRejh
         bjru5tXS5vOmpmVOyTC1phyfscl9hoO1lyK0n15gkeXSoRAJBTjmWaGvHlwq5WMC43UZ
         uEhsiJPxUpZx4BbUl6Uf/vMl+saj8Xe/1rSzWJsPwBgsZsTR98DcODFd+tnAASiXOpOO
         K2CA==
X-Gm-Message-State: APjAAAWRG5Ni6DjQhqFaZQ3G6+DTRmDrTiGDn9DZmmv7BGgl30KmBil+
        uJuoalJBzxKAsIGtEzkjm+si0uI=
X-Google-Smtp-Source: APXvYqyEgPopsPHiCmB6gZunaZEg8CYXmEW7PNrOTzaQ6gM6yD50Ebe8guuKFtHAHr8YcruywOaLcQ==
X-Received: by 2002:a6b:7a45:: with SMTP id k5mr12170917iop.115.1578099558172;
        Fri, 03 Jan 2020 16:59:18 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id v10sm15039530iol.85.2020.01.03.16.59.16
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 16:59:17 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219b7
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 17:59:15 -0700
Date:   Fri, 3 Jan 2020 17:59:15 -0700
From:   Rob Herring <robh@kernel.org>
To:     Sricharan R <sricharan@codeaurora.org>
Cc:     sricharan@codeaurora.org, agross@kernel.org,
        devicetree@vger.kernel.org, linus.walleij@linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-soc@vger.kernel.org, robh+dt@kernel.org, sboyd@kernel.org,
        sivaprak@codeaurora.org
Subject: Re: [PATCH V3 3/5] dt-bindings: qcom: Add ipq6018 bindings
Message-ID: <20200104005915.GA14735@bogus>
References: <1578052177-6778-1-git-send-email-sricharan@codeaurora.org>
 <1578052177-6778-4-git-send-email-sricharan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578052177-6778-4-git-send-email-sricharan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri,  3 Jan 2020 17:19:35 +0530, Sricharan R wrote:
> Document the new ipq6018 SOC/board device tree bindings.
> 
> Co-developed-by: Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
> Signed-off-by: Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
> Co-developed-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
