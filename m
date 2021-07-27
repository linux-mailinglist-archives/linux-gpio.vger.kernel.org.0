Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 703B53D826C
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 00:19:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232142AbhG0WTi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Jul 2021 18:19:38 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:51201 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231706AbhG0WTh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 27 Jul 2021 18:19:37 -0400
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 27 Jul 2021 15:19:37 -0700
X-QCInternal: smtphost
Received: from hu-gurus-sd.qualcomm.com (HELO hu-devc-sd-c.qualcomm.com) ([10.56.230.15])
  by ironmsg01-sd.qualcomm.com with ESMTP; 27 Jul 2021 15:19:36 -0700
Received: by hu-devc-sd-c.qualcomm.com (Postfix, from userid 383780)
        id E102921089; Tue, 27 Jul 2021 15:19:36 -0700 (PDT)
Date:   Tue, 27 Jul 2021 15:19:36 -0700
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>, kgunda@codeaurora.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V7 1/3] dt-bindings: mfd: pm8008: Add gpio-ranges and
 spmi-gpio compatible
Message-ID: <20210727221936.GA10322@codeaurora.org>
References: <1627029074-23449-1-git-send-email-skakit@codeaurora.org>
 <1627029074-23449-2-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1627029074-23449-2-git-send-email-skakit@codeaurora.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 23, 2021 at 02:01:12PM +0530, satya priya wrote:
> Add gpio-ranges and "qcom,spmi-gpio" compatible to match with the
> parent qcom,pmic-gpio.yaml binding.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
> Changes in V7:
>  - This is newly added in V7 to resolve below error.
>  dtschema/dtc warnings/errors:
>  /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/qcom,pm8008.example.dt.yaml: gpio@c000: compatible: ['qcom,pm8008-gpio'] is too short
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
>  /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/qcom,pm8008.example.dt.yaml: gpio@c000: 'gpio-ranges' is a required property
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> 
>  Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)

Reviewed-by: Guru Das Srinagesh <gurus@codeaurora.org>
