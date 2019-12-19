Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B73B1268FB
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 19:24:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726818AbfLSSYf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 13:24:35 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:46303 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726797AbfLSSYf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 13:24:35 -0500
Received: by mail-oi1-f195.google.com with SMTP id p67so3406058oib.13;
        Thu, 19 Dec 2019 10:24:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ubbzcYJgK4J86pN20uK4XO1/Lq32GjugkrqkcPBc/FQ=;
        b=p2x2ZJTkL3ccDvljtZmgIMYdrt4rD9ioHZFgFk28K3Jd1PDv+KFUPxIn9iDXCxqS/x
         b8z0CsFrBIMiDA+BU6lBjbAE8QpsctOoGCxedQDTJFTqDgzEUZ7lh50+oa/IsBZxrhyd
         f7vIV0e5ExRE3VstO3LXXz4cJxP0Q5BdN8UmS2bfHmnwkffFJYQldkLzqZKDViOyNbvt
         cj3buD0zYtOgFP5oIKbf5K9TGFKvSKEss11sIiFRcRBJUbJI7KMTRp/g2qHjvdFwW+bg
         ue3zP25CUGelLeTQ2yJMy9wf/gWWw9RCGq/37HgiRyS95IreBFDias2ZF9m2Ch8fimO3
         mzbw==
X-Gm-Message-State: APjAAAX4CpcCu6+UuXSRgx0sX2TBfJCYOU4FrKtW4mECOpHIhpLIC7m6
        9OsM+BzmIDeCUN9FwRSbWg==
X-Google-Smtp-Source: APXvYqwP+cokLxTWgWJHG2u8DLdl2oWM5ybBdugsg2ffv/IoIVKtZicq+YLqD5RB1XijlarWQmG0Gg==
X-Received: by 2002:aca:4fc2:: with SMTP id d185mr1123274oib.33.1576779874375;
        Thu, 19 Dec 2019 10:24:34 -0800 (PST)
Received: from localhost ([2607:fb90:bdf:98e:3549:d84c:9720:edb4])
        by smtp.gmail.com with ESMTPSA id p24sm2374547oth.28.2019.12.19.10.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 10:24:33 -0800 (PST)
Date:   Thu, 19 Dec 2019 12:24:31 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sricharan R <sricharan@codeaurora.org>
Cc:     agross@kernel.org, devicetree@vger.kernel.org,
        linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-soc@vger.kernel.org, sboyd@kernel.org,
        sivaprak@codeaurora.org
Subject: Re: [PATCH V2 4/7] clk: qcom: Add DT bindings for ipq6018 gcc clock
 controller
Message-ID: <20191219182431.GA25227@bogus>
References: <1576752109-24497-1-git-send-email-sricharan@codeaurora.org>
 <1576752109-24497-5-git-send-email-sricharan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1576752109-24497-5-git-send-email-sricharan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 19, 2019 at 04:11:46PM +0530, Sricharan R wrote:
> Add the compatible strings and the include file for ipq6018
> gcc clock controller.
> 
> Co-developed-by: Anusha Canchi Ramachandra Rao <anusharao@codeaurora.org>
> Signed-off-by: Anusha Canchi Ramachandra Rao <anusharao@codeaurora.org>
> Co-developed-by: Abhishek Sahu <absahu@codeaurora.org>
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> Co-developed-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> ---
> 
>  [V2] Addressed review comments.
> 
>  .../devicetree/bindings/clock/qcom,gcc.yaml        |   3 +-
>  include/dt-bindings/clock/qcom,gcc-ipq6018.h       | 262 +++++++++++++++++++++
>  include/dt-bindings/reset/qcom,gcc-ipq6018.h       | 157 ++++++++++++
>  3 files changed, 421 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-ipq6018.h
>  create mode 100644 include/dt-bindings/reset/qcom,gcc-ipq6018.h

Reviewed-by: Rob Herring <robh@kernel.org>
