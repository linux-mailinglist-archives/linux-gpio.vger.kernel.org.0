Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 283F314855F
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Jan 2020 13:46:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388690AbgAXMqq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Jan 2020 07:46:46 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:32905 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388692AbgAXMqo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Jan 2020 07:46:44 -0500
Received: by mail-pg1-f196.google.com with SMTP id 6so1000566pgk.0
        for <linux-gpio@vger.kernel.org>; Fri, 24 Jan 2020 04:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:user-agent:in-reply-to:references:mime-version
         :content-transfer-encoding:subject:to:cc:from:message-id;
        bh=bO48eiH7w0Y2sZOOFKprs0ltyE2e6nrqdGsFGOFXj5I=;
        b=ye4hi+rkXwPk9YJ1XFg/PX1X22xo1Gf5esAK3g+a3U9Yl70bIBvs04TEKukmmSSjC4
         3SCqwnzwPvMp7yOJ4RpMJINjDwLI6pxgLEKtMgiagAHNFv0Cct+LWSmWDdLuGpyzGiUM
         YQ7riz8KCjPdWySoLId5HrEjrkHQsNzHFtu0wPda1PLpEIJn+rR57+26SegF469MCs7i
         Zh4FPhelPywCPteAalLUyt0ON8xRlAh7M7Uc2tPNzyedyaWZbSozGlWrNE48JNQ3xyot
         rlVLMMkh4GMcopCKtFKFCibdd+oS66t96ySuH8lP51mNUhB+4rJvLplbclhVFo8lP9XX
         KiXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:user-agent:in-reply-to:references
         :mime-version:content-transfer-encoding:subject:to:cc:from
         :message-id;
        bh=bO48eiH7w0Y2sZOOFKprs0ltyE2e6nrqdGsFGOFXj5I=;
        b=N1Cf0JU03Ct27YxO4U6vxGAZxYe01cITBbaJEKJVeaAQHbsAAAvp00SH6wuytG9Wvi
         i9xGiyPp/q4KmfkjBX20q87WUiBVTwNR2VECnloa5Od2tqEDs02PmzumGrhAhI7YBNu7
         LQpa7ClRX+zmO25erlT62FjkUurVXz8mfeNky+k5gMevVTkQnnTfRbys3jkVEP6pGS3w
         jHPYuhRgB1aawaX1QBaDjCTjQ/b8K51ZJbP54t7y9/2IcPDjfrOKIHNeO0Cu1tKp0DBO
         IToNxeT8yVoStV8tV4KiqCm99fliobEAtjTK4YnP4+myigOo9HhxHpd8Opw9K5puiP+6
         L0jA==
X-Gm-Message-State: APjAAAXRwFlJm7So3A8vrdIDoEPb5qPhlhmI3tw+PhrsgmdnLBRP7VQF
        vismKOnhtIyyZIDo1Wb02p3F
X-Google-Smtp-Source: APXvYqxvKHr2BJZ+0Lz1nXRHRTswPoI20Qc0waDRQOjeiUJ3hC1gi59XWnLjOKi5Ht9zfbA4J+W+WA==
X-Received: by 2002:aa7:864a:: with SMTP id a10mr3246358pfo.233.1579870003097;
        Fri, 24 Jan 2020 04:46:43 -0800 (PST)
Received: from ?IPv6:2409:4072:18d:860f:a1d1:1fe2:8bbe:4ade? ([2409:4072:18d:860f:a1d1:1fe2:8bbe:4ade])
        by smtp.gmail.com with ESMTPSA id o2sm6678718pjo.26.2020.01.24.04.46.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Jan 2020 04:46:42 -0800 (PST)
Date:   Fri, 24 Jan 2020 18:16:32 +0530
User-Agent: K-9 Mail for Android
In-Reply-To: <20200124031819.608217-1-matheus@castello.eng.br>
References: <20200124031819.608217-1-matheus@castello.eng.br>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pinctrl actions: Fix functions groups names
To:     Matheus Castello <matheus@castello.eng.br>, afaerber@suse.de,
        linus.walleij@linaro.org
CC:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, pn@denx.de
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Message-ID: <900334CE-3A85-443D-99EC-4DD169BBCB65@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hey,

+Parthi, who is the author of s700 driver=2E=20

On 24 January 2020 8:48:19 AM IST, Matheus Castello <matheus@castello=2Een=
g=2Ebr> wrote:
>Group names by function do not match their respective structures and
>documentation defined names=2E
>
>This fixes following errors observed on s500-based Labrador board when
>groups names defined on documentation are used:
>[    4=2E262778] pinctrl-s700 b01b0040=2Epinctrl: invalid group
>"sd0_d1_mfp" for function "sd0"
>[    4=2E271394] pinctrl-s700 b01b0040=2Epinctrl: invalid group
>"sd0_d2_d3_mfp" for function "sd0"
>[    4=2E280248] pinctrl-s700 b01b0040=2Epinctrl: invalid group
>"sd1_d0_d3_mfp" for function "sd0"
>[    4=2E289122] pinctrl-s700 b01b0040=2Epinctrl: invalid group
>"sd0_cmd_mfp" for function "sd0"
>

Doh, I'm not sure how I missed this obvious mistake during review=2E Sorry=
 for that=2E=20

The change looks good but the commit message needs to be reworked a bit=2E=
 It doesn't make sense to use s700 driver on s500 based board=2E Even thoug=
h you could've modified it for s500, it should not be mentioned=2E So just =
mention the issue=2E Also you're missing colon after pinctrl in subject=2E=
=20

Btw, are you planning to contribute s500 driver?=20

Thanks,=20
Mani

>Fixes: 81c9d563cc74 (pinctrl: actions: Add Actions Semi S700 pinctrl
>driver)
>Signed-off-by: Matheus Castello <matheus@castello=2Eeng=2Ebr>
>---
> drivers/pinctrl/actions/pinctrl-s700=2Ec | 510 ++++++++++++-------------
> 1 file changed, 255 insertions(+), 255 deletions(-)
>
>diff --git a/drivers/pinctrl/actions/pinctrl-s700=2Ec
>b/drivers/pinctrl/actions/pinctrl-s700=2Ec
>index 8b8121e35edb=2E=2E1182b38ff4dc 100644
>--- a/drivers/pinctrl/actions/pinctrl-s700=2Ec
>+++ b/drivers/pinctrl/actions/pinctrl-s700=2Ec
>@@ -1125,317 +1125,317 @@ static const struct owl_pingroup
>s700_groups[] =3D {
> };
>=20
> static const char * const nor_groups[] =3D {
>-	"lcd0_d18",
>-	"i2s_d0",
>-	"i2s0_pcm0",
>-	"i2s1_pcm0",
>-	"i2s_d1",
>-	"ks_in2",
>-	"ks_in1",
>-	"ks_in0",
>-	"ks_in3",
>-	"ks_out0",
>-	"ks_out1",
>-	"ks_out2",
>-	"lcd0_d2",
>-	"lvds_ee_pn",
>-	"uart2_rx_tx",
>-	"spi0_i2c_pcm",
>-	"lvds_e_pn",
>-	"sd0_d0",
>-	"sd0_d1",
>-	"sd0_d2_d3",
>-	"sd1_d0_d3",
>-	"sd0_cmd",
>-	"sd1_cmd",
>-	"sens0_ckout",
>-	"sen0_pclk",
>+	"lcd0_d18_mfp",
>+	"i2s_d0_mfp",
>+	"i2s0_pcm0_mfp",
>+	"i2s1_pcm0_mfp",
>+	"i2s_d1_mfp",
>+	"ks_in2_mfp",
>+	"ks_in1_mfp",
>+	"ks_in0_mfp",
>+	"ks_in3_mfp",
>+	"ks_out0_mfp",
>+	"ks_out1_mfp",
>+	"ks_out2_mfp",
>+	"lcd0_d2_mfp",
>+	"lvds_ee_pn_mfp",
>+	"uart2_rx_tx_mfp",
>+	"spi0_i2c_pcm_mfp",
>+	"lvds_e_pn_mfp",
>+	"sd0_d0_mfp",
>+	"sd0_d1_mfp",
>+	"sd0_d2_d3_mfp",
>+	"sd1_d0_d3_mfp",
>+	"sd0_cmd_mfp",
>+	"sd1_cmd_mfp",
>+	"sens0_ckout_mfp",
>+	"sen0_pclk_mfp",
> };
>=20
> static const char * const eth_rmii_groups[] =3D {
>-	"rgmii_txd23",
>-	"rgmii_rxd2",
>-	"rgmii_rxd3",
>-	"rgmii_txd01",
>-	"rgmii_txd0",
>-	"rgmii_txd1",
>-	"rgmii_txen",
>-	"rgmii_rxen",
>-	"rgmii_rxd1",
>-	"rgmii_rxd0",
>-	"rgmii_ref_clk",
>+	"rgmii_txd23_mfp",
>+	"rgmii_rxd2_mfp",
>+	"rgmii_rxd3_mfp",
>+	"rgmii_txd01_mfp",
>+	"rgmii_txd0_mfp",
>+	"rgmii_txd1_mfp",
>+	"rgmii_txen_mfp",
>+	"rgmii_rxen_mfp",
>+	"rgmii_rxd1_mfp",
>+	"rgmii_rxd0_mfp",
>+	"rgmii_ref_clk_mfp",
> 	"eth_smi_dummy",
> };
>=20
> static const char * const eth_smii_groups[] =3D {
>-	"rgmii_txd0",
>-	"rgmii_txd1",
>-	"rgmii_rxd0",
>-	"rgmii_rxd1",
>-	"rgmii_ref_clk",
>+	"rgmii_txd0_mfp",
>+	"rgmii_txd1_mfp",
>+	"rgmii_rxd0_mfp",
>+	"rgmii_rxd1_mfp",
>+	"rgmii_ref_clk_mfp",
> 	"eth_smi_dummy",
> };
>=20
> static const char * const spi0_groups[] =3D {
>-	"dsi_dn0",
>-	"dsi_dp2",
>-	"dsi_dp0",
>-	"uart2_rx_tx",
>-	"spi0_i2c_pcm",
>-	"dsi_dn2",
>+	"dsi_dn0_mfp",
>+	"dsi_dp2_mfp",
>+	"dsi_dp0_mfp",
>+	"uart2_rx_tx_mfp",
>+	"spi0_i2c_pcm_mfp",
>+	"dsi_dn2_mfp",
> };
>=20
> static const char * const spi1_groups[] =3D {
>-	"uart0_rx",
>-	"uart0_tx",
>+	"uart0_rx_mfp",
>+	"uart0_tx_mfp",
> 	"i2c0_mfp",
> };
>=20
> static const char * const spi2_groups[] =3D {
>-	"rgmii_txd01",
>-	"rgmii_txd0",
>-	"rgmii_txd1",
>-	"rgmii_ref_clk",
>-	"dnand_acle_ce0",
>+	"rgmii_txd01_mfp",
>+	"rgmii_txd0_mfp",
>+	"rgmii_txd1_mfp",
>+	"rgmii_ref_clk_mfp",
>+	"dnand_acle_ce0_mfp",
> };
>=20
> static const char * const spi3_groups[] =3D {
>-	"rgmii_txen",
>-	"rgmii_rxen",
>-	"rgmii_rxd1",
>-	"rgmii_rxd0",
>+	"rgmii_txen_mfp",
>+	"rgmii_rxen_mfp",
>+	"rgmii_rxd1_mfp",
>+	"rgmii_rxd0_mfp",
> };
>=20
> static const char * const sens0_groups[] =3D {
>-	"csi_cn_cp",
>-	"sens0_ckout",
>-	"csi_dn_dp",
>-	"sen0_pclk",
>+	"csi_cn_cp_mfp",
>+	"sens0_ckout_mfp",
>+	"csi_dn_dp_mfp",
>+	"sen0_pclk_mfp",
> };
>=20
> static const char * const sens1_groups[] =3D {
>-	"lcd0_d18",
>-	"ks_in2",
>-	"ks_in1",
>-	"ks_in0",
>-	"ks_in3",
>-	"ks_out0",
>-	"ks_out1",
>-	"ks_out2",
>-	"sens0_ckout",
>-	"pcm1_in",
>-	"pcm1_clk",
>-	"pcm1_sync",
>-	"pcm1_out",
>+	"lcd0_d18_mfp",
>+	"ks_in2_mfp",
>+	"ks_in1_mfp",
>+	"ks_in0_mfp",
>+	"ks_in3_mfp",
>+	"ks_out0_mfp",
>+	"ks_out1_mfp",
>+	"ks_out2_mfp",
>+	"sens0_ckout_mfp",
>+	"pcm1_in_mfp",
>+	"pcm1_clk_mfp",
>+	"pcm1_sync_mfp",
>+	"pcm1_out_mfp",
> };
>=20
> static const char * const uart0_groups[] =3D {
>-	"uart2_rtsb",
>-	"uart2_ctsb",
>-	"uart0_rx",
>-	"uart0_tx",
>+	"uart2_rtsb_mfp",
>+	"uart2_ctsb_mfp",
>+	"uart0_rx_mfp",
>+	"uart0_tx_mfp",
> };
>=20
> static const char * const uart1_groups[] =3D {
>-	"sd0_d2_d3",
>+	"sd0_d2_d3_mfp",
> 	"i2c0_mfp",
> };
>=20
> static const char * const uart2_groups[] =3D {
>-	"rgmii_txen",
>-	"rgmii_rxen",
>-	"rgmii_rxd1",
>-	"rgmii_rxd0",
>-	"dsi_dn0",
>-	"dsi_dp2",
>-	"dsi_dp0",
>-	"uart2_rx_tx",
>-	"dsi_dn2",
>-	"uart2_rtsb",
>-	"uart2_ctsb",
>-	"sd0_d0",
>-	"sd0_d1",
>-	"sd0_d2_d3",
>-	"uart0_rx",
>-	"uart0_tx",
>+	"rgmii_txen_mfp",
>+	"rgmii_rxen_mfp",
>+	"rgmii_rxd1_mfp",
>+	"rgmii_rxd0_mfp",
>+	"dsi_dn0_mfp",
>+	"dsi_dp2_mfp",
>+	"dsi_dp0_mfp",
>+	"uart2_rx_tx_mfp",
>+	"dsi_dn2_mfp",
>+	"uart2_rtsb_mfp",
>+	"uart2_ctsb_mfp",
>+	"sd0_d0_mfp",
>+	"sd0_d1_mfp",
>+	"sd0_d2_d3_mfp",
>+	"uart0_rx_mfp",
>+	"uart0_tx_mfp",
> 	"i2c0_mfp",
> 	"uart2_dummy"
> };
>=20
> static const char * const uart3_groups[] =3D {
>-	"rgmii_txd23",
>-	"rgmii_rxd2",
>-	"rgmii_rxd3",
>-	"uart3_rtsb",
>-	"uart3_ctsb",
>+	"rgmii_txd23_mfp",
>+	"rgmii_rxd2_mfp",
>+	"rgmii_rxd3_mfp",
>+	"uart3_rtsb_mfp",
>+	"uart3_ctsb_mfp",
> 	"uart3_dummy"
> };
>=20
> static const char * const uart4_groups[] =3D {
>-	"rgmii_txd01",
>-	"rgmii_ref_clk",
>-	"ks_out0",
>-	"ks_out1",
>+	"rgmii_txd01_mfp",
>+	"rgmii_ref_clk_mfp",
>+	"ks_out0_mfp",
>+	"ks_out1_mfp",
> };
>=20
> static const char * const uart5_groups[] =3D {
>-	"rgmii_rxd1",
>-	"rgmii_rxd0",
>-	"ks_out0",
>-	"ks_out2",
>-	"uart3_rtsb",
>-	"uart3_ctsb",
>-	"sd0_d0",
>-	"sd0_d1",
>+	"rgmii_rxd1_mfp",
>+	"rgmii_rxd0_mfp",
>+	"ks_out0_mfp",
>+	"ks_out2_mfp",
>+	"uart3_rtsb_mfp",
>+	"uart3_ctsb_mfp",
>+	"sd0_d0_mfp",
>+	"sd0_d1_mfp",
> };
>=20
> static const char * const uart6_groups[] =3D {
>-	"rgmii_txd0",
>-	"rgmii_txd1",
>+	"rgmii_txd0_mfp",
>+	"rgmii_txd1_mfp",
> };
>=20
> static const char * const i2s0_groups[] =3D {
>-	"i2s_d0",
>-	"i2s_pcm1",
>-	"i2s0_pcm0",
>+	"i2s_d0_mfp",
>+	"i2s_pcm1_mfp",
>+	"i2s0_pcm0_mfp",
> };
>=20
> static const char * const i2s1_groups[] =3D {
>-	"i2s1_pcm0",
>-	"i2s_d1",
>+	"i2s1_pcm0_mfp",
>+	"i2s_d1_mfp",
> 	"i2s1_dummy",
>-	"spi0_i2c_pcm",
>-	"uart0_rx",
>-	"uart0_tx",
>+	"spi0_i2c_pcm_mfp",
>+	"uart0_rx_mfp",
>+	"uart0_tx_mfp",
> };
>=20
> static const char * const pcm1_groups[] =3D {
>-	"i2s_pcm1",
>-	"spi0_i2c_pcm",
>-	"uart0_rx",
>-	"uart0_tx",
>-	"pcm1_in",
>-	"pcm1_clk",
>-	"pcm1_sync",
>-	"pcm1_out",
>+	"i2s_pcm1_mfp",
>+	"spi0_i2c_pcm_mfp",
>+	"uart0_rx_mfp",
>+	"uart0_tx_mfp",
>+	"pcm1_in_mfp",
>+	"pcm1_clk_mfp",
>+	"pcm1_sync_mfp",
>+	"pcm1_out_mfp",
> };
>=20
> static const char * const pcm0_groups[] =3D {
>-	"i2s0_pcm0",
>-	"i2s1_pcm0",
>-	"uart2_rx_tx",
>-	"spi0_i2c_pcm",
>+	"i2s0_pcm0_mfp",
>+	"i2s1_pcm0_mfp",
>+	"uart2_rx_tx_mfp",
>+	"spi0_i2c_pcm_mfp",
> };
>=20
> static const char * const ks_groups[] =3D {
>-	"ks_in2",
>-	"ks_in1",
>-	"ks_in0",
>-	"ks_in3",
>-	"ks_out0",
>-	"ks_out1",
>-	"ks_out2",
>+	"ks_in2_mfp",
>+	"ks_in1_mfp",
>+	"ks_in0_mfp",
>+	"ks_in3_mfp",
>+	"ks_out0_mfp",
>+	"ks_out1_mfp",
>+	"ks_out2_mfp",
> };
>=20
> static const char * const jtag_groups[] =3D {
>-	"ks_in2",
>-	"ks_in1",
>-	"ks_in0",
>-	"ks_in3",
>-	"ks_out1",
>-	"sd0_d0",
>-	"sd0_d2_d3",
>-	"sd0_cmd",
>-	"sd0_clk",
>+	"ks_in2_mfp",
>+	"ks_in1_mfp",
>+	"ks_in0_mfp",
>+	"ks_in3_mfp",
>+	"ks_out1_mfp",
>+	"sd0_d0_mfp",
>+	"sd0_d2_d3_mfp",
>+	"sd0_cmd_mfp",
>+	"sd0_clk_mfp",
> };
>=20
> static const char * const pwm0_groups[] =3D {
>-	"rgmii_rxd2",
>-	"rgmii_txen",
>-	"ks_in2",
>-	"sen0_pclk",
>+	"rgmii_rxd2_mfp",
>+	"rgmii_txen_mfp",
>+	"ks_in2_mfp",
>+	"sen0_pclk_mfp",
> };
>=20
> static const char * const pwm1_groups[] =3D {
>-	"rgmii_rxen",
>-	"ks_in1",
>-	"ks_in3",
>-	"sens0_ckout",
>+	"rgmii_rxen_mfp",
>+	"ks_in1_mfp",
>+	"ks_in3_mfp",
>+	"sens0_ckout_mfp",
> };
>=20
> static const char * const pwm2_groups[] =3D {
>-	"lcd0_d18",
>-	"rgmii_rxd3",
>-	"rgmii_rxd1",
>-	"ks_out0",
>-	"ks_out2",
>+	"lcd0_d18_mfp",
>+	"rgmii_rxd3_mfp",
>+	"rgmii_rxd1_mfp",
>+	"ks_out0_mfp",
>+	"ks_out2_mfp",
> };
>=20
> static const char * const pwm3_groups[] =3D {
>-	"rgmii_rxd0",
>-	"ks_out1",
>-	"lcd0_d2",
>+	"rgmii_rxd0_mfp",
>+	"ks_out1_mfp",
>+	"lcd0_d2_mfp",
> };
>=20
> static const char * const pwm4_groups[] =3D {
>-	"lcd0_d18",
>-	"rgmii_txd01",
>-	"rgmii_txd0",
>-	"ks_in0",
>-	"pcm1_in",
>-	"nand_ceb3",
>+	"lcd0_d18_mfp",
>+	"rgmii_txd01_mfp",
>+	"rgmii_txd0_mfp",
>+	"ks_in0_mfp",
>+	"pcm1_in_mfp",
>+	"nand_ceb3_mfp",
> };
>=20
> static const char * const pwm5_groups[] =3D {
>-	"rgmii_txd1",
>-	"ks_in1",
>-	"pcm1_clk",
>-	"nand_ceb2",
>+	"rgmii_txd1_mfp",
>+	"ks_in1_mfp",
>+	"pcm1_clk_mfp",
>+	"nand_ceb2_mfp",
> };
>=20
> static const char * const p0_groups[] =3D {
>-	"ks_in2",
>-	"ks_in0",
>+	"ks_in2_mfp",
>+	"ks_in0_mfp",
> };
>=20
> static const char * const sd0_groups[] =3D {
>-	"ks_out0",
>-	"ks_out1",
>-	"ks_out2",
>-	"lcd0_d2",
>-	"dsi_dp3",
>-	"dsi_dp0",
>-	"sd0_d0",
>-	"sd0_d1",
>-	"sd0_d2_d3",
>-	"sd1_d0_d3",
>-	"sd0_cmd",
>-	"sd0_clk",
>+	"ks_out0_mfp",
>+	"ks_out1_mfp",
>+	"ks_out2_mfp",
>+	"lcd0_d2_mfp",
>+	"dsi_dp3_mfp",
>+	"dsi_dp0_mfp",
>+	"sd0_d0_mfp",
>+	"sd0_d1_mfp",
>+	"sd0_d2_d3_mfp",
>+	"sd1_d0_d3_mfp",
>+	"sd0_cmd_mfp",
>+	"sd0_clk_mfp",
> };
>=20
> static const char * const sd1_groups[] =3D {
>-	"dsi_dp2",
>-	"mfp1_16_14",
>-	"lcd0_d2",
>-	"mfp1_16_14_d17",
>-	"dsi_dp3",
>-	"dsi_dn3",
>-	"dsi_dnp1_cp_d2",
>-	"dsi_dnp1_cp_d17",
>-	"dsi_dn2",
>-	"sd1_d0_d3",
>-	"sd1_cmd",
>+	"dsi_dp2_mfp",
>+	"mfp1_16_14_mfp",
>+	"lcd0_d2_mfp",
>+	"mfp1_16_14_d17_mfp",
>+	"dsi_dp3_mfp",
>+	"dsi_dn3_mfp",
>+	"dsi_dnp1_cp_d2_mfp",
>+	"dsi_dnp1_cp_d17_mfp",
>+	"dsi_dn2_mfp",
>+	"sd1_d0_d3_mfp",
>+	"sd1_cmd_mfp",
> 	"sd1_dummy",
> };
>=20
> static const char * const sd2_groups[] =3D {
>-	"dnand_data_wr",
>+	"dnand_data_wr_mfp",
> };
>=20
> static const char * const i2c0_groups[] =3D {
>-	"uart0_rx",
>-	"uart0_tx",
>-	"i2c0_mfp",
>+	"uart0_rx_mfp",
>+	"uart0_tx_mfp",
>+	"i2c0_mfp_mfp",
> };
>=20
> static const char * const i2c1_groups[] =3D {
>@@ -1448,85 +1448,85 @@ static const char * const i2c2_groups[] =3D {
> };
>=20
> static const char * const i2c3_groups[] =3D {
>-	"uart2_rx_tx",
>-	"pcm1_sync",
>-	"pcm1_out",
>+	"uart2_rx_tx_mfp",
>+	"pcm1_sync_mfp",
>+	"pcm1_out_mfp",
> };
>=20
> static const char * const lvds_groups[] =3D {
>-	"lvds_o_pn",
>-	"lvds_ee_pn",
>-	"lvds_e_pn",
>+	"lvds_o_pn_mfp",
>+	"lvds_ee_pn_mfp",
>+	"lvds_e_pn_mfp",
> };
>=20
> static const char * const bt_groups[] =3D {
>-	"i2s_pcm1",
>-	"i2s0_pcm0",
>-	"i2s1_pcm0",
>-	"ks_in2",
>-	"ks_in1",
>-	"ks_in0",
>-	"ks_in3",
>-	"ks_out0",
>-	"ks_out1",
>-	"ks_out2",
>-	"lvds_o_pn",
>-	"lvds_ee_pn",
>-	"pcm1_in",
>-	"pcm1_clk",
>-	"pcm1_sync",
>-	"pcm1_out",
>+	"i2s_pcm1_mfp",
>+	"i2s0_pcm0_mfp",
>+	"i2s1_pcm0_mfp",
>+	"ks_in2_mfp",
>+	"ks_in1_mfp",
>+	"ks_in0_mfp",
>+	"ks_in3_mfp",
>+	"ks_out0_mfp",
>+	"ks_out1_mfp",
>+	"ks_out2_mfp",
>+	"lvds_o_pn_mfp",
>+	"lvds_ee_pn_mfp",
>+	"pcm1_in_mfp",
>+	"pcm1_clk_mfp",
>+	"pcm1_sync_mfp",
>+	"pcm1_out_mfp",
> };
>=20
> static const char * const lcd0_groups[] =3D {
>-	"lcd0_d18",
>-	"lcd0_d2",
>-	"mfp1_16_14_d17",
>-	"lvds_o_pn",
>-	"dsi_dp3",
>-	"dsi_dn3",
>-	"lvds_ee_pn",
>-	"dsi_dnp1_cp_d2",
>-	"dsi_dnp1_cp_d17",
>-	"lvds_e_pn",
>+	"lcd0_d18_mfp",
>+	"lcd0_d2_mfp",
>+	"mfp1_16_14_d17_mfp",
>+	"lvds_o_pn_mfp",
>+	"dsi_dp3_mfp",
>+	"dsi_dn3_mfp",
>+	"lvds_ee_pn_mfp",
>+	"dsi_dnp1_cp_d2_mfp",
>+	"dsi_dnp1_cp_d17_mfp",
>+	"lvds_e_pn_mfp",
> };
>=20
>=20
> static const char * const usb30_groups[] =3D {
>-	"ks_in1",
>+	"ks_in1_mfp",
> };
>=20
> static const char * const clko_25m_groups[] =3D {
>-	"clko_25m",
>+	"clko_25m_mfp",
> };
>=20
> static const char * const mipi_csi_groups[] =3D {
>-	"csi_cn_cp",
>-	"csi_dn_dp",
>+	"csi_cn_cp_mfp",
>+	"csi_dn_dp_mfp",
> };
>=20
> static const char * const dsi_groups[] =3D {
>-	"dsi_dn0",
>-	"dsi_dp2",
>-	"dsi_dp3",
>-	"dsi_dn3",
>-	"dsi_dp0",
>-	"dsi_dnp1_cp_d2",
>-	"dsi_dnp1_cp_d17",
>-	"dsi_dn2",
>+	"dsi_dn0_mfp",
>+	"dsi_dp2_mfp",
>+	"dsi_dp3_mfp",
>+	"dsi_dn3_mfp",
>+	"dsi_dp0_mfp",
>+	"dsi_dnp1_cp_d2_mfp",
>+	"dsi_dnp1_cp_d17_mfp",
>+	"dsi_dn2_mfp",
> 	"dsi_dummy",
> };
>=20
> static const char * const nand_groups[] =3D {
>-	"dnand_data_wr",
>-	"dnand_acle_ce0",
>-	"nand_ceb2",
>-	"nand_ceb3",
>+	"dnand_data_wr_mfp",
>+	"dnand_acle_ce0_mfp",
>+	"nand_ceb2_mfp",
>+	"nand_ceb3_mfp",
> 	"nand_dummy",
> };
>=20
> static const char * const spdif_groups[] =3D {
>-	"uart0_tx",
>+	"uart0_tx_mfp",
> };
>=20
> static const char * const sirq0_groups[] =3D {

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
