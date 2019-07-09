Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5FD462D9B
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2019 03:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbfGIBoj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jul 2019 21:44:39 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:46188 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725905AbfGIBoj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jul 2019 21:44:39 -0400
Received: by mail-io1-f66.google.com with SMTP id i10so39615931iol.13;
        Mon, 08 Jul 2019 18:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Kd+R8U7AeHQK+dVVAxxx/vKyVP0OoTL7mSnz079YKZg=;
        b=dn9OahJKlFcsiA3jGkmkYcKpKDnDkMvKLYlpSYEpv3TtHv0CSSOgyAD5OLNGAbJZ8B
         FgzLGGq5IC7y1mV2YpeeHTWG+mOENhtnoY/XNRX11He/UG4Ya9PSFT6Pze57DfA81LF5
         BHjxaBpf3cZu9pnkXWVgszeaYmsTbVVWC9w9bvT08HjS/zSRAkb59dFX4eYnThOwfhDG
         SNw70NHJLjDf3cFFmFztgOcQZB9L7CR0pOozFuMKErRF0JV6B2i6yI/H7/zIPYBirUJh
         2jwL9r2Gcs43LojXymmXbikkEglKio32c1Qq5fG9FgxfT4jMcg49pJTaaMMdE1a6ZaK6
         hb7A==
X-Gm-Message-State: APjAAAVJWsEDG0Ho4Q4+mUyiukYwbpTmn7CWJqlVi7QEn7CYxinc5iP0
        u1V7+TTMWzjWCSEclU+GoXovf4c=
X-Google-Smtp-Source: APXvYqwUZNHjJqnSaa51TzsLuv0W/Pd+sulwtIXpORaf4ssy3jNRBSvXFrt+gjlJKE0rUraKSVmSEw==
X-Received: by 2002:a6b:8bcb:: with SMTP id n194mr17670842iod.194.1562636677804;
        Mon, 08 Jul 2019 18:44:37 -0700 (PDT)
Received: from localhost ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id m4sm31452340iok.68.2019.07.08.18.44.36
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 08 Jul 2019 18:44:37 -0700 (PDT)
Date:   Mon, 8 Jul 2019 19:44:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sricharan R <sricharan@codeaurora.org>
Cc:     sboyd@kernel.org, linus.walleij@linaro.org, agross@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/6] pinctrl: qcom: Add ipq6018 pinctrl driver
Message-ID: <20190709014436.GA9055@bogus>
References: <1559755738-28643-1-git-send-email-sricharan@codeaurora.org>
 <1559755738-28643-2-git-send-email-sricharan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559755738-28643-2-git-send-email-sricharan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 05, 2019 at 10:58:53PM +0530, Sricharan R wrote:
> Add initial pinctrl driver to support pin configuration with
> pinctrl framework for ipq6018.
> 
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> Signed-off-by: Rajkumar Ayyasamy <arajkuma@codeaurora.org>
> Signed-off-by: speriaka <speriaka@codeaurora.org>
> ---
>  .../bindings/pinctrl/qcom,ipq6018-pinctrl.txt      |  186 +++

Please split bindings to separate patch. Using DT schema would be nice.

>  drivers/pinctrl/qcom/Kconfig                       |   10 +
>  drivers/pinctrl/qcom/Makefile                      |    1 +
>  drivers/pinctrl/qcom/pinctrl-ipq6018.c             | 1183 ++++++++++++++++++++
>  4 files changed, 1380 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.txt
>  create mode 100644 drivers/pinctrl/qcom/pinctrl-ipq6018.c
