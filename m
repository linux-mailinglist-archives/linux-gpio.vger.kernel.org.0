Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 129774BC15
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jun 2019 16:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729494AbfFSOyy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Jun 2019 10:54:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:50950 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725899AbfFSOyy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 19 Jun 2019 10:54:54 -0400
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D55352182B;
        Wed, 19 Jun 2019 14:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560956093;
        bh=1o2dMj31GORXJZyOFULgtIRqexZMCNTkB7pR8LOrtJ4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=WNj4iaYt8/G5RaEDTSZfDsFjp6NVfp8+Eao8HcnQtl2WtIz059/SPsFZ4/w3uv6px
         67wlVpxhLvDfoTpoFbQZQOAr/v7soTPuK6Nq2xYD/iP4ju2Ax69/FF6c5ubeEBqbUi
         4WJLwK3hQRENzyYmfVF27jQgQQ9f/GPh1m75B4zw=
Received: by mail-qt1-f169.google.com with SMTP id s15so20195623qtk.9;
        Wed, 19 Jun 2019 07:54:52 -0700 (PDT)
X-Gm-Message-State: APjAAAVAxoTRzbQzaweSqxVwyrC5mo06bdWQCc1JF5ZdL39QRzkjj1X+
        0TywWYfga3YGMqgVkiAtEF+wR68xDK4k7bi8cA==
X-Google-Smtp-Source: APXvYqyIsFoKeKt8JjG9xmjujYGTtwkYLYLaB8h+ix0Pl7lN0krfkUYZCEy8rme8HA3CdujMucRPRNSAzdKC1rAn+e4=
X-Received: by 2002:aed:3fb0:: with SMTP id s45mr53667104qth.136.1560956092103;
 Wed, 19 Jun 2019 07:54:52 -0700 (PDT)
MIME-Version: 1.0
References: <1559754961-26783-1-git-send-email-sricharan@codeaurora.org> <1559754961-26783-3-git-send-email-sricharan@codeaurora.org>
In-Reply-To: <1559754961-26783-3-git-send-email-sricharan@codeaurora.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 19 Jun 2019 08:54:40 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+0TLtLiX17nRSyVWrJM2_UvLEVMsp7Hf2e3hU7fh4WGg@mail.gmail.com>
Message-ID: <CAL_Jsq+0TLtLiX17nRSyVWrJM2_UvLEVMsp7Hf2e3hU7fh4WGg@mail.gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: qcom: Add ipq6018 bindings
To:     Sricharan R <sricharan@codeaurora.org>
Cc:     Stephen Boyd <sboyd@codeaurora.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 5, 2019 at 11:16 AM Sricharan R <sricharan@codeaurora.org> wrote:
>
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> Signed-off-by: speriaka <speriaka@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index f6316ab..7b19028 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -36,6 +36,7 @@ description: |
>         mdm9615
>         ipq8074
>         sdm845
> +       ipq6018

You need to add actual schema for this, not just a description.

>
>    The 'board' element must be one of the following strings:
>
> @@ -45,6 +46,7 @@ description: |
>         mtp
>         sbc
>         hk01
> +       cp01-c1
>
>    The 'soc_version' and 'board_version' elements take the form of v<Major>.<Minor>
>    where the minor number may be omitted when it's zero, i.e.  v1.0 is the same
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
>
