Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E75A27BEFF
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 10:16:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727725AbgI2IQB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 04:16:01 -0400
Received: from z5.mailgun.us ([104.130.96.5]:28959 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727715AbgI2IQB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 29 Sep 2020 04:16:01 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601367359; h=In-Reply-To: Content-Transfer-Encoding:
 Content-Type: MIME-Version: References: Message-ID: Subject: Cc: To:
 From: Date: Sender; bh=C9y1LdO+aWy0JAGGyfzZqhHPFniLyfb2PM4PGoHOs1Q=; b=oXag0gZVLoDrQgIODIYlL4Bd4aWplBQMb4wJMQUz27yQxijzACMXy6NOobz8d+0bqcohrgXk
 AzwZ4BpXDc9V68tBeMRbmgeG5ZYC4M/N+/o9IhvIBPEFOi1WSkNiJZAgbn9to5gnFS9PcuJM
 AABbscZvIT6PGXN0mrWoWftj4T8=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f72ed3f1fdd3a1390fb68ad (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 29 Sep 2020 08:15:59
 GMT
Sender: varada=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C9530C43387; Tue, 29 Sep 2020 08:15:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from codeaurora.org (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: varada)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C8B20C433FF;
        Tue, 29 Sep 2020 08:15:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C8B20C433FF
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=varada@codeaurora.org
Date:   Tue, 29 Sep 2020 13:45:47 +0530
From:   Varadarajan Narayanan <varada@codeaurora.org>
To:     Rob Herring <robh@kernel.org>
Cc:     mturquette@baylibre.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        robh+dt@kernel.org, nsekar@codeaurora.org,
        linux-gpio@vger.kernel.org, p.zabel@pengutronix.de,
        sboyd@kernel.org, linus.walleij@linaro.org,
        sricharan@codeaurora.org, linux-kernel@vger.kernel.org,
        catalin.marinas@arm.com, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, will@kernel.org,
        bjorn.andersson@linaro.org
Subject: Re: [PATCH 4/7] dt-bindings: pinctrl: qcom: Add ipq5018 pinctrl
 bindings
Message-ID: <20200929081547.GA11411@codeaurora.org>
References: <1601270140-4306-1-git-send-email-varada@codeaurora.org>
 <1601270140-4306-5-git-send-email-varada@codeaurora.org>
 <20200928181018.GA3007757@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200928181018.GA3007757@bogus>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 28, 2020 at 01:10:18PM -0500, Rob Herring wrote:
> On Mon, 28 Sep 2020 10:45:37 +0530, Varadarajan Narayanan wrote:
> > Add device tree binding Documentation details for ipq5018
> > pinctrl driver.
> >
> > Signed-off-by: Varadarajan Narayanan <varada@codeaurora.org>
> > ---
> >  .../bindings/pinctrl/qcom,ipq5018-pinctrl.yaml     | 143 +++++++++++++=
++++++++
> >  1 file changed, 143 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,ipq5=
018-pinctrl.yaml
> >
>
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinc=
trl/qcom,ipq5018-pinctrl.example.dt.yaml: pinctrl@1000000: serial3-pinmux:f=
unction:0: 'blsp2_uart' is not one of ['atest_char', 'atest_char0', 'atest_=
char1', 'atest_char2', 'atest_char3', 'audio_pdm0', 'audio_pdm1', 'audio_rx=
bclk', 'audio_rxd', 'audio_rxfsync', 'audio_rxmclk', 'audio_txbclk', 'audio=
_txd', 'audio_txfsync', 'audio_txmclk', 'blsp0_i2c', 'blsp0_spi', 'blsp0_ua=
rt0', 'blsp0_uart1', 'blsp1_i2c0', 'blsp1_i2c1', 'blsp1_spi0', 'blsp1_spi1'=
, 'blsp1_uart0', 'blsp1_uart1', 'blsp1_uart2', 'blsp2_i2c0', 'blsp2_i2c1', =
'blsp2_spi', 'blsp2_spi0', 'blsp2_spi1', 'btss0', 'btss1', 'btss10', 'btss1=
1', 'btss12', 'btss13', 'btss2', 'btss3', 'btss4', 'btss5', 'btss6', 'btss7=
', 'btss8', 'btss9', 'burn0', 'burn1', 'cri_trng', 'cri_trng0', 'cri_trng1'=
, 'cxc_clk', 'cxc_data', 'dbg_out', 'eud_gpio', 'gcc_plltest', 'gcc_tlmm', =
'gpio', 'mac0', 'mac1', 'mdc', 'mdio', 'pcie0_clk', 'pcie0_wake', 'pcie1_cl=
k', 'pcie1_wake', 'pll_test', 'prng_rosc', 'pwm0', 'pwm1', 'pwm2', 'pwm3', =
'qdss_cti_trig_in_a0', 'qdss_cti_trig_in_a1', 'qdss_cti_trig_in_b0', 'qdss_=
cti_trig_in_b1', 'qdss_cti_trig_out_a0', 'qdss_cti_trig_out_a1', 'qdss_cti_=
trig_out_b0', 'qdss_cti_trig_out_b1', 'qdss_traceclk_a', 'qdss_traceclk_b',=
 'qdss_tracectl_a', 'qdss_tracectl_b', 'qdss_tracedata_a', 'qdss_tracedata_=
b', 'qspi_clk', 'qspi_cs', 'qspi0', 'qspi1', 'qspi2', 'qspi3', 'reset_out',=
 'sdc1_clk', 'sdc1_cmd', 'sdc10', 'sdc11', 'sdc12', 'sdc13', 'wci0', 'wci1'=
, 'wci2', 'wci3', 'wci4', 'wci5', 'wci6', 'wci7', 'wsa_swrm', 'wsi_clk3', '=
wsi_data3', 'wsis_reset', 'xfem0', 'xfem1', 'xfem2', 'xfem3', 'xfem4', 'xfe=
m5', 'xfem6', 'xfem7']
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree=
/bindings/pinctrl/qcom,ipq5018-pinctrl.yaml
>
>
> See https://patchwork.ozlabs.org/patch/1372367
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
>
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master -=
-upgrade
>
> Please check and re-submit.

Ok, will check and post updated patches

--
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member o=
f Code Aurora Forum, hosted by The Linux Foundation
