Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C567A6FDFA7
	for <lists+linux-gpio@lfdr.de>; Wed, 10 May 2023 16:08:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237324AbjEJOIi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 May 2023 10:08:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237285AbjEJOIi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 May 2023 10:08:38 -0400
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7919610F
        for <linux-gpio@vger.kernel.org>; Wed, 10 May 2023 07:08:35 -0700 (PDT)
Received: from localhost (88-113-26-95.elisa-laajakaista.fi [88.113.26.95])
        by fgw21.mail.saunalahti.fi (Halon) with ESMTP
        id 262a7a7a-ef3c-11ed-abf4-005056bdd08f;
        Wed, 10 May 2023 17:08:33 +0300 (EEST)
From:   andy.shevchenko@gmail.com
Date:   Wed, 10 May 2023 17:08:33 +0300
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc:     andy.shevchenko@gmail.com, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, linus.walleij@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        richardcochran@gmail.com, manivannan.sadhasivam@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH v6 3/4] pinctrl: qcom: Refactor generic qcom pinctrl
 driver
Message-ID: <ZFulYdpI9a2vvbWK@surfacebook>
References: <1683718725-14869-1-git-send-email-quic_rohiagar@quicinc.com>
 <1683718725-14869-4-git-send-email-quic_rohiagar@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1683718725-14869-4-git-send-email-quic_rohiagar@quicinc.com>
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
        SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Wed, May 10, 2023 at 05:08:44PM +0530, Rohit Agarwal kirjoitti:
> Reuse the generic pingroup struct from pinctrl.h in msm_pingroup
> along with the macro defined.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Thank you!

> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>

-- 
With Best Regards,
Andy Shevchenko


