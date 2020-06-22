Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F92520326E
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2020 10:49:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbgFVIs4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jun 2020 04:48:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:34328 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725912AbgFVIsz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Jun 2020 04:48:55 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 941D820578;
        Mon, 22 Jun 2020 08:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592815734;
        bh=KEXZv/RiV5DDJWb/evdFcodDSutl7irNtNrxfkNQuGc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=07mCxkHW4Bn9uIFnzMCrcbaZOcG/fGCicgGBYXseNN1mcPeo+NxhOAU8ZxINZVEVb
         EUVpBOjFptfcTqv4dta8awALUO8g3V4B4Z/cj1oG6U2l9B7wvaR2e38fbyOneTr5Q0
         tkZrHrMnrVonQSFBRx1miW0iZIUHTCltZrGv0gYk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200622075749.21925-5-konradybcio@gmail.com>
References: <20200622075749.21925-1-konradybcio@gmail.com> <20200622075749.21925-5-konradybcio@gmail.com>
Subject: Re: [PATCH v2 4/8] clk: qcom: smd: Add support for SDM660 rpm clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
To:     Konrad Dybcio <konradybcio@gmail.com>, skrzynka@konradybcio.pl
Date:   Mon, 22 Jun 2020 01:48:53 -0700
Message-ID: <159281573385.62212.14646958691369932904@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Konrad Dybcio (2020-06-22 00:57:42)
> Add rpm smd clocks, PMIC and bus clocks which are required on
> SDM630/660 (and APQ variants) for clients to vote on.
>=20
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>

Just minor nits. Please resend without the other dts and SoC things and
trim the Cc list way down. Thanks.

> ---
>  .../devicetree/bindings/clock/qcom,rpmcc.txt  |  1 +
>  drivers/clk/qcom/clk-smd-rpm.c                | 77 +++++++++++++++++++
>  include/dt-bindings/clock/qcom,rpmcc.h        | 10 +++
>  3 files changed, 88 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Doc=
umentation/devicetree/bindings/clock/qcom,rpmcc.txt
> index 90a1349bc713..2ced7807d574 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
> +++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
> @@ -20,6 +20,7 @@ Required properties :
>                         "qcom,rpmcc-msm8996", "qcom,rpmcc"
>                         "qcom,rpmcc-msm8998", "qcom,rpmcc"
>                         "qcom,rpmcc-qcs404", "qcom,rpmcc"
> +                        "qcom,rpmcc-sdm660", "qcom,rpmcc"

This one looks right, but indented incorrectly?

> =20
>  - #clock-cells : shall contain 1
> =20
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rp=
m.c
> index 52f63ad787ba..4ae9e79e602e 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -766,15 +766,92 @@ static const struct rpm_smd_clk_desc rpm_clk_msm899=
8 =3D {
>         .num_clks =3D ARRAY_SIZE(msm8998_clks),
>  };
> =20
> +/* sdm660 */
> +DEFINE_CLK_SMD_RPM_BRANCH(sdm660, bi_tcxo, bi_tcxo_a, QCOM_SMD_RPM_MISC_=
CLK, 0,
> +                                                               19200000);
> +DEFINE_CLK_SMD_RPM(sdm660, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1=
);
> +DEFINE_CLK_SMD_RPM(sdm660, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2=
);
> +DEFINE_CLK_SMD_RPM(sdm660, cnoc_periph_clk, cnoc_periph_a_clk,
> +                                               QCOM_SMD_RPM_BUS_CLK, 0);
> +DEFINE_CLK_SMD_RPM(sdm660, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, 0=
);
> +DEFINE_CLK_SMD_RPM(sdm660, mmssnoc_axi_clk, mmssnoc_axi_a_clk,
> +                                                  QCOM_SMD_RPM_MMAXI_CLK=
, 0);
> +DEFINE_CLK_SMD_RPM(sdm660, ipa_clk, ipa_a_clk, QCOM_SMD_RPM_IPA_CLK, 0);
> +DEFINE_CLK_SMD_RPM(sdm660, ce1_clk, ce1_a_clk, QCOM_SMD_RPM_CE_CLK, 0);
> +DEFINE_CLK_SMD_RPM(sdm660, aggre2_noc_clk, aggre2_noc_a_clk,
> +                                               QCOM_SMD_RPM_AGGR_CLK, 2);
> +DEFINE_CLK_SMD_RPM_QDSS(sdm660, qdss_clk, qdss_a_clk,
> +                                               QCOM_SMD_RPM_MISC_CLK, 1);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER(sdm660, rf_clk1, rf_clk1_a, 4);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER(sdm660, div_clk1, div_clk1_a, 11);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER(sdm660, ln_bb_clk1, ln_bb_clk1_a, 1);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER(sdm660, ln_bb_clk2, ln_bb_clk2_a, 2);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER(sdm660, ln_bb_clk3, ln_bb_clk3_a, 3);
> +
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(sdm660, rf_clk1_pin, rf_clk1_a_pin,=
 4);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(sdm660, ln_bb_clk1_pin,
> +                                                       ln_bb_clk1_pin_a,=
 1);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(sdm660, ln_bb_clk2_pin,
> +                                                       ln_bb_clk2_pin_a,=
 2);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(sdm660, ln_bb_clk3_pin,
> +                                                       ln_bb_clk3_pin_a,=
 3);
> +static struct clk_smd_rpm *sdm660_clks[] =3D {
> +       [RPM_SMD_XO_CLK_SRC] =3D &sdm660_bi_tcxo,
> +       [RPM_SMD_XO_A_CLK_SRC] =3D &sdm660_bi_tcxo_a,
> +       [RPM_SMD_SNOC_CLK] =3D &sdm660_snoc_clk,
> +       [RPM_SMD_SNOC_A_CLK] =3D &sdm660_snoc_a_clk,
> +       [RPM_SMD_CNOC_CLK] =3D &sdm660_cnoc_clk,
> +       [RPM_SMD_CNOC_A_CLK] =3D &sdm660_cnoc_a_clk,
> +       [RPM_SMD_CNOC_PERIPH_CLK] =3D &sdm660_cnoc_periph_clk,
> +       [RPM_SMD_CNOC_PERIPH_A_CLK] =3D &sdm660_cnoc_periph_a_clk,
> +       [RPM_SMD_BIMC_CLK] =3D &sdm660_bimc_clk,
> +       [RPM_SMD_BIMC_A_CLK] =3D &sdm660_bimc_a_clk,
> +       [RPM_SMD_MMSSNOC_AXI_CLK] =3D &sdm660_mmssnoc_axi_clk,
> +       [RPM_SMD_MMSSNOC_AXI_CLK_A] =3D &sdm660_mmssnoc_axi_a_clk,
> +       [RPM_SMD_IPA_CLK] =3D &sdm660_ipa_clk,
> +       [RPM_SMD_IPA_A_CLK] =3D &sdm660_ipa_a_clk,
> +       [RPM_SMD_CE1_CLK] =3D &sdm660_ce1_clk,
> +       [RPM_SMD_CE1_A_CLK] =3D &sdm660_ce1_a_clk,
> +       [RPM_SMD_AGGR2_NOC_CLK] =3D &sdm660_aggre2_noc_clk,
> +       [RPM_SMD_AGGR2_NOC_A_CLK] =3D &sdm660_aggre2_noc_a_clk,
> +       [RPM_SMD_QDSS_CLK] =3D &sdm660_qdss_clk,
> +       [RPM_SMD_QDSS_A_CLK] =3D &sdm660_qdss_a_clk,
> +       [RPM_SMD_RF_CLK1] =3D &sdm660_rf_clk1,
> +       [RPM_SMD_RF_CLK1_A] =3D &sdm660_rf_clk1_a,
> +       [RPM_SMD_DIV_CLK1] =3D &sdm660_div_clk1,
> +       [RPM_SMD_DIV_A_CLK1] =3D &sdm660_div_clk1_a,
> +       [RPM_SMD_LN_BB_CLK] =3D &sdm660_ln_bb_clk1,
> +       [RPM_SMD_LN_BB_A_CLK] =3D &sdm660_ln_bb_clk1_a,
> +       [RPM_SMD_LN_BB_CLK2] =3D &sdm660_ln_bb_clk2,
> +       [RPM_SMD_LN_BB_CLK2_A] =3D &sdm660_ln_bb_clk2_a,
> +       [RPM_SMD_LN_BB_CLK3] =3D &sdm660_ln_bb_clk3,
> +       [RPM_SMD_LN_BB_CLK3_A] =3D &sdm660_ln_bb_clk3_a,
> +       [RPM_SMD_RF_CLK1_PIN] =3D &sdm660_rf_clk1_pin,
> +       [RPM_SMD_RF_CLK1_A_PIN] =3D &sdm660_rf_clk1_a_pin,
> +       [RPM_SMD_LN_BB_CLK1_PIN] =3D &sdm660_ln_bb_clk1_pin,
> +       [RPM_SMD_LN_BB_CLK1_A_PIN] =3D &sdm660_ln_bb_clk1_pin_a,
> +       [RPM_SMD_LN_BB_CLK2_PIN] =3D &sdm660_ln_bb_clk2_pin,
> +       [RPM_SMD_LN_BB_CLK2_A_PIN] =3D &sdm660_ln_bb_clk2_pin_a,
> +       [RPM_SMD_LN_BB_CLK3_PIN] =3D &sdm660_ln_bb_clk3_pin,
> +       [RPM_SMD_LN_BB_CLK3_A_PIN] =3D &sdm660_ln_bb_clk3_pin_a,
> +};
> +
> +static const struct rpm_smd_clk_desc rpm_clk_sdm660 =3D {
> +       .clks =3D sdm660_clks,
> +       .num_clks =3D ARRAY_SIZE(sdm660_clks),
> +};
> +
>  static const struct of_device_id rpm_smd_clk_match_table[] =3D {
>         { .compatible =3D "qcom,rpmcc-msm8916", .data =3D &rpm_clk_msm891=
6 },
>         { .compatible =3D "qcom,rpmcc-msm8974", .data =3D &rpm_clk_msm897=
4 },
>         { .compatible =3D "qcom,rpmcc-msm8976", .data =3D &rpm_clk_msm897=
6 },
>         { .compatible =3D "qcom,rpmcc-msm8996", .data =3D &rpm_clk_msm899=
6 },
>         { .compatible =3D "qcom,rpmcc-msm8998", .data =3D &rpm_clk_msm899=
8 },
> +       { .compatible =3D "qcom,rpmcc-sdm660",  .data =3D &rpm_clk_sdm660=
  },

Should come last, because s comes after q.

>         { .compatible =3D "qcom,rpmcc-qcs404",  .data =3D &rpm_clk_qcs404=
  },
>         { }
>  };
> +

Drop this diff.

>  MODULE_DEVICE_TABLE(of, rpm_smd_clk_match_table);
> =20
>  static struct clk_hw *qcom_smdrpm_clk_hw_get(struct of_phandle_args *clk=
spec,
