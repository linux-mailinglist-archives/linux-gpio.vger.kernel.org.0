Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C96B727B41D
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 20:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbgI1SKW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Mon, 28 Sep 2020 14:10:22 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:38578 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726465AbgI1SKW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Sep 2020 14:10:22 -0400
Received: by mail-oi1-f195.google.com with SMTP id 26so2351110ois.5;
        Mon, 28 Sep 2020 11:10:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=c8OTkICxYAnO1Kcuxg8o2SQ0d26wTplGzJA4OxH5SbM=;
        b=q9QaVrKJPG9RDtNKumWOX+sI2st7faSQJygpHN7uqqTCBZAz2r94KRG+ZwIabeGBAh
         8rYck6ntihm17OT+jZtz2Wfl34ci2yT8wgaCMQR3oIm1xqii7mh2uFF/5dDqwE7pWrzT
         3riYZC7W9K+82IuA8kS4tqdtRH3a2ACMqD7Wf0pE85utwj1161wFYhiNxKiFf98aaIuW
         jPqb4ssgqkrB+ececVnvoFSqovPVtc25MMmE1TizqEbbHf4s4RBgV01vk2hSFCMyobjM
         q6lyx3w0Dcng+Q9+X/HvcnYQqkU+O7CkJNYAgVur1hPLzWmD7Zp7QxlNo8XEPCT65Ynu
         5hdg==
X-Gm-Message-State: AOAM532k8xpk6CJS8hc7xRg/n4WivUdphx6YefuMgiyry13yqG2bFaUP
        lIC6RVfkQgmLdkPhrkeahQ==
X-Google-Smtp-Source: ABdhPJwbjlzyIrzfHy8hq3FM8CnK9putnHHMWJurndbyd6KVwpjZccdGF88BnxQ5LBnm0IUP+99Rhw==
X-Received: by 2002:a05:6808:3d6:: with SMTP id o22mr76150oie.150.1601316620125;
        Mon, 28 Sep 2020 11:10:20 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e30sm397591otf.49.2020.09.28.11.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 11:10:19 -0700 (PDT)
Received: (nullmailer pid 3008460 invoked by uid 1000);
        Mon, 28 Sep 2020 18:10:18 -0000
Date:   Mon, 28 Sep 2020 13:10:18 -0500
From:   Rob Herring <robh@kernel.org>
To:     Varadarajan Narayanan <varada@codeaurora.org>
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
Message-ID: <20200928181018.GA3007757@bogus>
References: <1601270140-4306-1-git-send-email-varada@codeaurora.org>
 <1601270140-4306-5-git-send-email-varada@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <1601270140-4306-5-git-send-email-varada@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 28 Sep 2020 10:45:37 +0530, Varadarajan Narayanan wrote:
> Add device tree binding Documentation details for ipq5018
> pinctrl driver.
> 
> Signed-off-by: Varadarajan Narayanan <varada@codeaurora.org>
> ---
>  .../bindings/pinctrl/qcom,ipq5018-pinctrl.yaml     | 143 +++++++++++++++++++++
>  1 file changed, 143 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,ipq5018-pinctrl.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/qcom,ipq5018-pinctrl.example.dt.yaml: pinctrl@1000000: serial3-pinmux:function:0: 'blsp2_uart' is not one of ['atest_char', 'atest_char0', 'atest_char1', 'atest_char2', 'atest_char3', 'audio_pdm0', 'audio_pdm1', 'audio_rxbclk', 'audio_rxd', 'audio_rxfsync', 'audio_rxmclk', 'audio_txbclk', 'audio_txd', 'audio_txfsync', 'audio_txmclk', 'blsp0_i2c', 'blsp0_spi', 'blsp0_uart0', 'blsp0_uart1', 'blsp1_i2c0', 'blsp1_i2c1', 'blsp1_spi0', 'blsp1_spi1', 'blsp1_uart0', 'blsp1_uart1', 'blsp1_uart2', 'blsp2_i2c0', 'blsp2_i2c1', 'blsp2_spi', 'blsp2_spi0', 'blsp2_spi1', 'btss0', 'btss1', 'btss10', 'btss11', 'btss12', 'btss13', 'btss2', 'btss3', 'btss4', 'btss5', 'btss6', 'btss7', 'btss8', 'btss9', 'burn0', 'burn1', 'cri_trng', 'cri_trng0', 'cri_trng1', 'cxc_clk', 'cxc_data', 'dbg_out', 'eud_gpio', 'gcc_plltest', 'gcc_tlmm', 'gpio', 'mac0', 'mac1', 'mdc', 'mdio', 'pcie0_clk', 'pcie0_wake', 'pcie1_clk', 'pcie1_wake', 'pll_test', 'prng_rosc', 'pwm0', 'pwm1', 'pwm2', 'pwm3', 'qdss_cti_trig_in_a0', 'qdss_cti_trig_in_a1', 'qdss_cti_trig_in_b0', 'qdss_cti_trig_in_b1', 'qdss_cti_trig_out_a0', 'qdss_cti_trig_out_a1', 'qdss_cti_trig_out_b0', 'qdss_cti_trig_out_b1', 'qdss_traceclk_a', 'qdss_traceclk_b', 'qdss_tracectl_a', 'qdss_tracectl_b', 'qdss_tracedata_a', 'qdss_tracedata_b', 'qspi_clk', 'qspi_cs', 'qspi0', 'qspi1', 'qspi2', 'qspi3', 'reset_out', 'sdc1_clk', 'sdc1_cmd', 'sdc10', 'sdc11', 'sdc12', 'sdc13', 'wci0', 'wci1', 'wci2', 'wci3', 'wci4', 'wci5', 'wci6', 'wci7', 'wsa_swrm', 'wsi_clk3', 'wsi_data3', 'wsis_reset', 'xfem0', 'xfem1', 'xfem2', 'xfem3', 'xfem4', 'xfem5', 'xfem6', 'xfem7']
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/qcom,ipq5018-pinctrl.yaml


See https://patchwork.ozlabs.org/patch/1372367

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

