Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F8F162DA7
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2019 03:47:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727536AbfGIBpe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jul 2019 21:45:34 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:41819 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727519AbfGIBpd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jul 2019 21:45:33 -0400
Received: by mail-io1-f65.google.com with SMTP id j5so20326852ioj.8;
        Mon, 08 Jul 2019 18:45:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=w0QazOGBd5y+/M3y1evVA30OJoEykK/Zg2Mf8gk+MiM=;
        b=NIQ0udq9e6FEjtlrkE/9z4gjpmPjib93zW5QmNjzDIRXJenCLwSGWB1xcCb2nZ12jz
         7xjnKuMck1Gm3KIPJFfZ00d6GK00smoZaH5vS6zC3GPrZUggioddhIiY8DYOv5+14SPJ
         9GX4H4GX5B2suLDW1nEg8M9CC9BepdgyfFOAvJMdhuHUDn9RIMVCP04gvndbbgyTWzWB
         DZ0oWHrUY4tMfnM3F/Kh+4WwFd67T7AQ3d4QbizoimArDBPiWbeqV6u2Q9dzUkKdQDOq
         DUskFdiuLHQSgFDXhCiSwXQtoEve8aWoX2lZQQ+9q3kcsPtuXhGyiHU+V+0YQg1or2Tb
         iILA==
X-Gm-Message-State: APjAAAVEhthudhMZnDft58hci1SGHbruZEXaABbWIrVsTC/0hzy4grIU
        SOXj/Hk740XWBKZ7dVAC9N66ElE=
X-Google-Smtp-Source: APXvYqx2fM5NOGsxTULrx2iaKeFFnxMqvQIuY+JWFSB76mkEKidNVEFKEWSxH7TbP75NhzsZnufbXw==
X-Received: by 2002:a02:c95a:: with SMTP id u26mr23408608jao.15.1562636732587;
        Mon, 08 Jul 2019 18:45:32 -0700 (PDT)
Received: from localhost ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id o7sm15792362ioo.81.2019.07.08.18.45.31
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 08 Jul 2019 18:45:32 -0700 (PDT)
Date:   Mon, 8 Jul 2019 19:45:30 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sricharan R <sricharan@codeaurora.org>
Cc:     robh+dt@kernel.org, sboyd@kernel.org, linus.walleij@linaro.org,
        agross@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/6] clk: qcom: Add DT bindings for ipq6018 gcc clock
 controller
Message-ID: <20190709014530.GA12304@bogus>
References: <1559755738-28643-1-git-send-email-sricharan@codeaurora.org>
 <1559755738-28643-4-git-send-email-sricharan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559755738-28643-4-git-send-email-sricharan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed,  5 Jun 2019 22:58:55 +0530, Sricharan R wrote:
> Add the compatible strings and the include file for ipq6018
> gcc clock controller.
> 
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> Signed-off-by: anusha <anusharao@codeaurora.org>
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,gcc.txt         |   1 +
>  include/dt-bindings/clock/qcom,gcc-ipq6018.h       | 405 +++++++++++++++++++++
>  2 files changed, 406 insertions(+)
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-ipq6018.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
