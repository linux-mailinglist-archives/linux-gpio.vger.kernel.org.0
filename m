Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73E297C6193
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 02:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235255AbjJLAKY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 20:10:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235260AbjJLAKV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 20:10:21 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 110CFF7
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 17:10:14 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-692c02adeefso287682b3a.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 17:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697069414; x=1697674214; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DhsOUHZ3lFKgPTRqoWVovZ5mo6ZKq1tR2igcKj/Y6q0=;
        b=XI9GnFTKLvh/9bW8nC+4Vf5OBRc5h4cfAlX7xZ0lNLiE2PWfwbleAKpURRbpNj09S3
         NNKtJQhcvfcInaRQEeznjKszPAAABD8uzBuyu/ycb2c87fmsEkTdqlPvaPI1Q/zSkHg6
         0YKp99oQ7iUERsRezU9ApDpyZcek83eSlHp2VpGSZkYf8FC5U8xSSY2ssdfBLW5Ft46P
         l4lXcCwGu6S+XOqvRvcV8iTb8f/dKnLSt7jfsILtEZ3DIYZaILKzQXSmu3zX2S4EuDAW
         Nf9VykZzQ4PkoosGPcB7ce/b619xnfEQKOD99dOYRKFrbwB+v8dpLpGuJ/AUDWHmBuK8
         BxcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697069414; x=1697674214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DhsOUHZ3lFKgPTRqoWVovZ5mo6ZKq1tR2igcKj/Y6q0=;
        b=kPKhMk8Z21NsKURIyjcA8hidhPVJTqNTUg7ZW0PufPTOG6tZ/7gRnNfP3b68nkmeHB
         ry6+ILaBVH+H5hdSAio9foI53y+RZ5/So7S93weLDcEvGfrhAik70CBSqrhzD4692owy
         qx9U3lIlHiLIzT0TDePPhWjdmF709P4Rj0jxtxyl/GA6f62+LpkXQT9CfG7wwhxRdpLH
         h/VLwaVswHqsJPN8+3j1JyM7ngMFp7nlhuWAvbyfeMya9G5Gw7uaHJrzXgaBQ54yCyzx
         jONM73U95a799PxGm1O9NJysKnCw2stmLoyuNABg6H5kF218hILBEhabbn4ew9dF+Kge
         iejg==
X-Gm-Message-State: AOJu0YwVl3TmKcwc7AwguVSGHvoIRt4ClBuh9JShcs+Lauq6QpYEVirn
        krXVwrXwA72zByA3lWDVuE1uKoAmZLF0t95ePiLmfw==
X-Google-Smtp-Source: AGHT+IG8t9rsWMmNowQhOQ1WyuqSDsiTwmYXPilECezu59cz0mSrvenX34rYeJIU9Myx9YlD2cMhD0Xkh3+4G+1pfGE=
X-Received: by 2002:a05:6a21:789c:b0:15c:b7ba:e8e0 with SMTP id
 bf28-20020a056a21789c00b0015cb7bae8e0mr23173134pzc.51.1697069414237; Wed, 11
 Oct 2023 17:10:14 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org> <20231011184823.443959-12-peter.griffin@linaro.org>
In-Reply-To: <20231011184823.443959-12-peter.griffin@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Wed, 11 Oct 2023 19:10:03 -0500
Message-ID: <CAPLW+4ngcMXs-MbxjMiJRoo-XGj94jRCaKcstHGUTEjUNqqmKw@mail.gmail.com>
Subject: Re: [PATCH v3 11/20] clk: samsung: clk-gs101: add CMU_APM support
To:     Peter Griffin <peter.griffin@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, saravanak@google.com,
        willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75 autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 11, 2023 at 1:51=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> This patch adds all the registers for the APM clock controller unit.
>
> We register all the muxes and dividers, but only a few of the
> gates currently for PMU and GPIO.
>
> One clock is marked CLK_IS_CRITICAL because the system
> hangs if this clock is disabled.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Please merge all 3 clk patches together. Frankly in this case I'm not
sure there is a lot of value in keeping those separate.

>  drivers/clk/samsung/clk-gs101.c | 301 ++++++++++++++++++++++++++++++++
>  1 file changed, 301 insertions(+)
>
> diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs=
101.c
> index e2c62754b1eb..525f95e60665 100644
> --- a/drivers/clk/samsung/clk-gs101.c
> +++ b/drivers/clk/samsung/clk-gs101.c
> @@ -19,6 +19,7 @@
>
>  /* NOTE: Must be equal to the last clock ID increased by one */
>  #define TOP_NR_CLK                     (CLK_GOUT_CMU_BOOST + 1)
> +#define APM_NR_CLK                     (CLK_APM_PLL_DIV16_APM + 1)

Tabs for the indentation.

>
>  /* ---- CMU_TOP --------------------------------------------------------=
----- */
>
> @@ -1549,3 +1550,303 @@ static void __init gs101_cmu_top_init(struct devi=
ce_node *np)
>  /* Register CMU_TOP early, as it's a dependency for other early domains =
*/
>  CLK_OF_DECLARE(gs101_cmu_top, "google,gs101-cmu-top",
>                gs101_cmu_top_init);
> +
> +/* ---- CMU_APM --------------------------------------------------------=
----- */
> +/* Register Offset definitions for CMU_APM (0x17400000) */
> +#define APM_CMU_APM_CONTROLLER_OPTION                                   =
               0x0800
> +#define CLKOUT_CON_BLK_APM_CMU_APM_CLKOUT0                              =
               0x0810
> +#define CLK_CON_MUX_MUX_CLKCMU_APM_FUNC                                 =
                       0x1000
> +#define CLK_CON_MUX_MUX_CLKCMU_APM_FUNCSRC                              =
               0x1004
> +#define CLK_CON_DIV_DIV_CLK_APM_BOOST                                   =
               0x1800
> +#define CLK_CON_DIV_DIV_CLK_APM_USI0_UART                               =
               0x1804
> +#define CLK_CON_DIV_DIV_CLK_APM_USI0_USI                                =
               0x1808
> +#define CLK_CON_DIV_DIV_CLK_APM_USI1_UART                               =
               0x180c
> +#define CLK_CON_GAT_CLK_BLK_APM_UID_APM_CMU_APM_IPCLKPORT_PCLK          =
               0x2000
> +#define CLK_CON_GAT_CLK_BUS0_BOOST_OPTION1                              =
               0x2004
> +#define CLK_CON_GAT_CLK_CMU_BOOST_OPTION1                               =
               0x2008
> +#define CLK_CON_GAT_CLK_CORE_BOOST_OPTION1                              =
               0x200c
> +#define CLK_CON_GAT_GATE_CLKCMU_APM_FUNC                                =
               0x2010
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_GPIO_ALIVE_IPCLKPORT_PCLK    =
               0x2014
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_GPIO_FAR_ALIVE_IPCLKPORT_PCLK=
               0x2018
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_PMU_ALIVE_IPCLKPORT_PCLK     =
               0x201c
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_RTC_IPCLKPORT_PCLK           =
               0x2020
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_TRTC_IPCLKPORT_PCLK          =
               0x2024
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI0_UART_IPCLKPORT_IPCLK      =
               0x2028
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI0_UART_IPCLKPORT_PCLK       =
               0x202c
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI0_USI_IPCLKPORT_IPCLK       =
               0x2030
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI0_USI_IPCLKPORT_PCLK        =
               0x2034
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI1_UART_IPCLKPORT_IPCLK      =
               0x2038
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI1_UART_IPCLKPORT_PCLK       =
               0x203c
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_D_TZPC_APM_IPCLKPORT_PCLK          =
               0x2040
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_GPC_APM_IPCLKPORT_PCLK             =
               0x2044
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_GREBEINTEGRATION_IPCLKPORT_HCLK    =
               0x2048
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_INTMEM_IPCLKPORT_ACLK              =
               0x204c
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_INTMEM_IPCLKPORT_PCLK              =
               0x2050
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_LHM_AXI_G_SWD_IPCLKPORT_I_CLK      =
               0x2054
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_LHM_AXI_P_AOCAPM_IPCLKPORT_I_CLK   =
               0x2058
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_LHM_AXI_P_APM_IPCLKPORT_I_CLK      =
               0x205c
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_LHS_AXI_D_APM_IPCLKPORT_I_CLK      =
               0x2060
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_LHS_AXI_G_DBGCORE_IPCLKPORT_I_CLK  =
               0x2064
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_LHS_AXI_G_SCAN2DRAM_IPCLKPORT_I_CLK=
               0x2068
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_APM_AOC_IPCLKPORT_PCLK     =
               0x206c
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_APM_AP_IPCLKPORT_PCLK      =
               0x2070
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_APM_GSA_IPCLKPORT_PCLK     =
               0x2074
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_APM_SWD_IPCLKPORT_PCLK     =
               0x207c
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_APM_TPU_IPCLKPORT_PCLK     =
               0x2080
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_AP_AOC_IPCLKPORT_PCLK      =
               0x2084
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_AP_DBGCORE_IPCLKPORT_PCLK  =
               0x2088
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_PMU_INTR_GEN_IPCLKPORT_PCLK        =
               0x208c
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_ROM_CRC32_HOST_IPCLKPORT_ACLK      =
               0x2090
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_ROM_CRC32_HOST_IPCLKPORT_PCLK      =
               0x2094
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_RSTNSYNC_CLK_APM_BUS_IPCLKPORT_CLK =
                       0x2098
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_RSTNSYNC_CLK_APM_USI0_UART_IPCLKPOR=
T_CLK          0x209c
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_RSTNSYNC_CLK_APM_USI0_USI_IPCLKPORT=
_CLK           0x20a0
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_RSTNSYNC_CLK_APM_USI1_UART_IPCLKPOR=
T_CLK          0x20a4
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_SPEEDY_APM_IPCLKPORT_PCLK          =
               0x20a8
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_SPEEDY_SUB_APM_IPCLKPORT_PCLK      =
               0x20ac
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_SSMT_D_APM_IPCLKPORT_ACLK          =
               0x20b0
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_SSMT_D_APM_IPCLKPORT_PCLK          =
               0x20b4
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_SSMT_G_DBGCORE_IPCLKPORT_ACLK      =
               0x20b8
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_SSMT_G_DBGCORE_IPCLKPORT_PCLK      =
               0x20bc
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_SS_DBGCORE_IPCLKPORT_SS_DBGCORE_IPC=
LKPORT_HCLK    0x20c0

Oh my, is that one is long :)

> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_SYSMMU_D_APM_IPCLKPORT_CLK_S2      =
               0x20c4
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_SYSREG_APM_IPCLKPORT_PCLK          =
               0x20cc
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_APM_IPCLKPORT_ACLK            =
               0x20d0
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_APM_IPCLKPORT_PCLK            =
               0x20d4
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_DBGCORE_IPCLKPORT_ACLK        =
               0x20d8
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_DBGCORE_IPCLKPORT_PCLK        =
               0x20dc
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_G_SWD_IPCLKPORT_ACLK          =
               0x20e0
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_G_SWD_IPCLKPORT_PCLK          =
               0x20e4
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_P_AOCAPM_IPCLKPORT_ACLK       =
               0x20e8
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_P_AOCAPM_IPCLKPORT_PCLK       =
               0x20ec
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_P_APM_IPCLKPORT_ACLK          =
               0x20f0
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_P_APM_IPCLKPORT_PCLK          =
               0x20f4
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_WDT_APM_IPCLKPORT_PCLK             =
               0x20f8
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_XIU_DP_APM_IPCLKPORT_ACLK          =
               0x20fc
> +#define PCH_CON_LHM_AXI_G_SWD_PCH                      0x3000
> +#define PCH_CON_LHM_AXI_P_AOCAPM_PCH                   0x3004
> +#define PCH_CON_LHM_AXI_P_APM_PCH                      0x3008
> +#define PCH_CON_LHS_AXI_D_APM_PCH                      0x300c
> +#define PCH_CON_LHS_AXI_G_DBGCORE_PCH                  0x3010
> +#define PCH_CON_LHS_AXI_G_SCAN2DRAM_PCH                        0x3014
> +#define QCH_CON_APBIF_GPIO_ALIVE_QCH                   0x3018
> +#define QCH_CON_APBIF_GPIO_FAR_ALIVE_QCH               0x301c
> +#define QCH_CON_APBIF_PMU_ALIVE_QCH                    0x3020
> +#define QCH_CON_APBIF_RTC_QCH                          0x3024
> +#define QCH_CON_APBIF_TRTC_QCH                         0x3028
> +#define QCH_CON_APM_CMU_APM_QCH                                0x302c
> +#define QCH_CON_APM_USI0_UART_QCH                      0x3030
> +#define QCH_CON_APM_USI0_USI_QCH                       0x3034
> +#define QCH_CON_APM_USI1_UART_QCH                      0x3038
> +#define QCH_CON_D_TZPC_APM_QCH                         0x303c
> +#define QCH_CON_GPC_APM_QCH                            0x3040
> +#define QCH_CON_GREBEINTEGRATION_QCH_DBG               0x3044
> +#define QCH_CON_GREBEINTEGRATION_QCH_GREBE             0x3048
> +#define QCH_CON_INTMEM_QCH                             0x304c
> +#define QCH_CON_LHM_AXI_G_SWD_QCH                      0x3050
> +#define QCH_CON_LHM_AXI_P_AOCAPM_QCH                   0x3054
> +#define QCH_CON_LHM_AXI_P_APM_QCH                      0x3058
> +#define QCH_CON_LHS_AXI_D_APM_QCH                      0x305c
> +#define QCH_CON_LHS_AXI_G_DBGCORE_QCH                  0x3060
> +#define QCH_CON_LHS_AXI_G_SCAN2DRAM_QCH                        0x3064
> +#define QCH_CON_MAILBOX_APM_AOC_QCH                    0x3068
> +#define QCH_CON_MAILBOX_APM_AP_QCH                     0x306c
> +#define QCH_CON_MAILBOX_APM_GSA_QCH                    0x3070
> +#define QCH_CON_MAILBOX_APM_SWD_QCH                    0x3078
> +#define QCH_CON_MAILBOX_APM_TPU_QCH                    0x307c
> +#define QCH_CON_MAILBOX_AP_AOC_QCH                     0x3080
> +#define QCH_CON_MAILBOX_AP_DBGCORE_QCH                 0x3084
> +#define QCH_CON_PMU_INTR_GEN_QCH                       0x3088
> +#define QCH_CON_ROM_CRC32_HOST_QCH                     0x308c
> +#define QCH_CON_RSTNSYNC_CLK_APM_BUS_QCH_GREBE         0x3090
> +#define QCH_CON_RSTNSYNC_CLK_APM_BUS_QCH_GREBE_DBG     0x3094
> +#define QCH_CON_SPEEDY_APM_QCH                         0x3098
> +#define QCH_CON_SPEEDY_SUB_APM_QCH                     0x309c
> +#define QCH_CON_SSMT_D_APM_QCH                         0x30a0
> +#define QCH_CON_SSMT_G_DBGCORE_QCH                     0x30a4
> +#define QCH_CON_SS_DBGCORE_QCH_DBG                     0x30a8
> +#define QCH_CON_SS_DBGCORE_QCH_GREBE                   0x30ac
> +#define QCH_CON_SYSMMU_D_APM_QCH                       0x30b0
> +#define QCH_CON_SYSREG_APM_QCH                         0x30b8
> +#define QCH_CON_UASC_APM_QCH                           0x30bc
> +#define QCH_CON_UASC_DBGCORE_QCH                       0x30c0
> +#define QCH_CON_UASC_G_SWD_QCH                         0x30c4
> +#define QCH_CON_UASC_P_AOCAPM_QCH                      0x30c8
> +#define QCH_CON_UASC_P_APM_QCH                         0x30cc
> +#define QCH_CON_WDT_APM_QCH                            0x30d0
> +#define QUEUE_CTRL_REG_BLK_APM_CMU_APM                 0x3c00
> +
> +static const unsigned long apm_clk_regs[] __initconst =3D {
> +       APM_CMU_APM_CONTROLLER_OPTION,
> +       CLKOUT_CON_BLK_APM_CMU_APM_CLKOUT0,
> +       CLK_CON_MUX_MUX_CLKCMU_APM_FUNC,
> +       CLK_CON_MUX_MUX_CLKCMU_APM_FUNCSRC,
> +       CLK_CON_DIV_DIV_CLK_APM_BOOST,
> +       CLK_CON_DIV_DIV_CLK_APM_USI0_UART,
> +       CLK_CON_DIV_DIV_CLK_APM_USI0_USI,
> +       CLK_CON_DIV_DIV_CLK_APM_USI1_UART,
> +       CLK_CON_GAT_CLK_BLK_APM_UID_APM_CMU_APM_IPCLKPORT_PCLK,
> +       CLK_CON_GAT_CLK_BUS0_BOOST_OPTION1,
> +       CLK_CON_GAT_CLK_CMU_BOOST_OPTION1,
> +       CLK_CON_GAT_CLK_CORE_BOOST_OPTION1,
> +       CLK_CON_GAT_GATE_CLKCMU_APM_FUNC,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_GPIO_ALIVE_IPCLKPORT_PCLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_GPIO_FAR_ALIVE_IPCLKPORT_PCLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_PMU_ALIVE_IPCLKPORT_PCLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_RTC_IPCLKPORT_PCLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_TRTC_IPCLKPORT_PCLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI0_UART_IPCLKPORT_IPCLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI0_UART_IPCLKPORT_PCLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI0_USI_IPCLKPORT_IPCLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI0_USI_IPCLKPORT_PCLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI1_UART_IPCLKPORT_IPCLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI1_UART_IPCLKPORT_PCLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_D_TZPC_APM_IPCLKPORT_PCLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_GPC_APM_IPCLKPORT_PCLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_GREBEINTEGRATION_IPCLKPORT_HCLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_INTMEM_IPCLKPORT_ACLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_INTMEM_IPCLKPORT_PCLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_LHM_AXI_G_SWD_IPCLKPORT_I_CLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_LHM_AXI_P_AOCAPM_IPCLKPORT_I_CLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_LHM_AXI_P_APM_IPCLKPORT_I_CLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_LHS_AXI_D_APM_IPCLKPORT_I_CLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_LHS_AXI_G_DBGCORE_IPCLKPORT_I_CLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_LHS_AXI_G_SCAN2DRAM_IPCLKPORT_I_CLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_APM_AOC_IPCLKPORT_PCLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_APM_AP_IPCLKPORT_PCLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_APM_GSA_IPCLKPORT_PCLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_APM_SWD_IPCLKPORT_PCLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_APM_TPU_IPCLKPORT_PCLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_AP_AOC_IPCLKPORT_PCLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_AP_DBGCORE_IPCLKPORT_PCLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_PMU_INTR_GEN_IPCLKPORT_PCLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_ROM_CRC32_HOST_IPCLKPORT_ACLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_ROM_CRC32_HOST_IPCLKPORT_PCLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_RSTNSYNC_CLK_APM_BUS_IPCLKPORT_CLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_RSTNSYNC_CLK_APM_USI0_UART_IPCLKPORT=
_CLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_RSTNSYNC_CLK_APM_USI0_USI_IPCLKPORT_=
CLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_RSTNSYNC_CLK_APM_USI1_UART_IPCLKPORT=
_CLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_SPEEDY_APM_IPCLKPORT_PCLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_SPEEDY_SUB_APM_IPCLKPORT_PCLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_SSMT_D_APM_IPCLKPORT_ACLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_SSMT_D_APM_IPCLKPORT_PCLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_SSMT_G_DBGCORE_IPCLKPORT_ACLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_SSMT_G_DBGCORE_IPCLKPORT_PCLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_SS_DBGCORE_IPCLKPORT_SS_DBGCORE_IPCL=
KPORT_HCLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_SYSMMU_D_APM_IPCLKPORT_CLK_S2,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_SYSREG_APM_IPCLKPORT_PCLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_APM_IPCLKPORT_ACLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_APM_IPCLKPORT_PCLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_DBGCORE_IPCLKPORT_ACLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_DBGCORE_IPCLKPORT_PCLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_G_SWD_IPCLKPORT_ACLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_G_SWD_IPCLKPORT_PCLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_P_AOCAPM_IPCLKPORT_ACLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_P_AOCAPM_IPCLKPORT_PCLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_P_APM_IPCLKPORT_ACLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_P_APM_IPCLKPORT_PCLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_WDT_APM_IPCLKPORT_PCLK,
> +       CLK_CON_GAT_GOUT_BLK_APM_UID_XIU_DP_APM_IPCLKPORT_ACLK,
> +};
> +
> +PNAME(mout_apm_func_p) =3D { "oscclk_apmgsa", "mout_apm_funcsrc", "pad_c=
lk_apm" };
> +PNAME(mout_apm_funcsrc_p) =3D { "pll_alv_div2_apm", "pll_alv_div4_apm", =
"pll_alv_div16_apm" };
> +
> +static const struct samsung_fixed_rate_clock apm_fixed_clks[] __initcons=
t =3D {
> +       FRATE(CLK_APM_PLL_DIV2_APM, "clk_apm_pll_div2_apm", NULL, 0, 3932=
16000),
> +       FRATE(CLK_APM_PLL_DIV4_APM, "clk_apm_pll_div4_apm", NULL, 0, 1966=
08000),
> +       FRATE(CLK_APM_PLL_DIV16_APM, "clk_apm_pll_div16_apm", NULL, 0, 49=
152000),
> +};
> +
> +static const struct samsung_mux_clock apm_mux_clks[] __initconst =3D {
> +       MUX(CLK_MOUT_APM_FUNC, "mout_apm_func", mout_apm_func_p,
> +           CLK_CON_MUX_MUX_CLKCMU_APM_FUNC, 4, 1),
> +       MUX(CLK_MOUT_APM_FUNCSRC, "mout_apm_funcsrc", mout_apm_funcsrc_p,
> +           CLK_CON_MUX_MUX_CLKCMU_APM_FUNCSRC, 3, 1),
> +};
> +
> +static const struct samsung_div_clock apm_div_clks[] __initconst =3D {
> +       DIV(CLK_DOUT_APM_BOOST, "dout_apm_boost", "gout_apm_func",
> +           CLK_CON_DIV_DIV_CLK_APM_BOOST, 0, 1),
> +       DIV(CLK_DOUT_APM_USI0_UART, "dout_apm_usi0_uart", "gout_apm_func"=
,
> +           CLK_CON_DIV_DIV_CLK_APM_USI0_UART, 0, 7),
> +       DIV(CLK_DOUT_APM_USI0_USI, "dout_apm_usi0_usi", "gout_apm_func",
> +           CLK_CON_DIV_DIV_CLK_APM_USI0_USI, 0, 7),
> +       DIV(CLK_DOUT_APM_USI1_UART, "dout_apm_usi1_uart", "gout_apm_func"=
,
> +           CLK_CON_DIV_DIV_CLK_APM_USI1_UART, 0, 7),
> +};
> +
> +static const struct samsung_gate_clock apm_gate_clks[] __initconst =3D {
> +       GATE(CLK_GOUT_APM_FUNC, "gout_apm_func", "mout_apm_func",
> +            CLK_CON_GAT_GATE_CLKCMU_APM_FUNC, 21, 0, 0),
> +

Empty lines are not necessary in cases like that.

> +       GATE(CLK_GOUT_APM_UID_APBIF_GPIO_ALIVE_IPCLKPORT_PCLK,
> +            "gout_apm_gpio_alive_ipclkport_pclk", "gout_apm_func",
> +            CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_GPIO_ALIVE_IPCLKPORT_PCLK=
,
> +            21, 0, 0),
> +
> +       GATE(CLK_GOUT_APM_UID_APBIF_GPIO_FAR_ALIVE_IPCLKPORT_PCLK,
> +            "gout_apm_gpio_far_alive_ipclkport_pclk", "gout_apm_func",
> +            CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_GPIO_FAR_ALIVE_IPCLKPORT_=
PCLK,
> +            21, 0, 0),
> +
> +       GATE(CLK_GOUT_APM_UID_APBIF_PMU_ALIVE_IPCLKPORT_PCLK,
> +            "gout_apm_pmu_alive_ipclkport_pclk", "gout_apm_func",
> +            CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_PMU_ALIVE_IPCLKPORT_PCLK,
> +            21, CLK_IS_CRITICAL, 0),
> +
> +       GATE(CLK_GOUT_APM_UID_SYSREG_APM_IPCLKPORT_PCLK,
> +            "gout_apm_sysreg_apm_ipclkport_pclk", "gout_apm_func",
> +            CLK_CON_GAT_GOUT_BLK_APM_UID_SYSREG_APM_IPCLKPORT_PCLK,
> +            21, 0, 0),
> +};
> +
> +static const struct samsung_cmu_info apm_cmu_info __initconst =3D {
> +       .mux_clks               =3D apm_mux_clks,
> +       .nr_mux_clks            =3D ARRAY_SIZE(apm_mux_clks),
> +       .div_clks               =3D apm_div_clks,
> +       .nr_div_clks            =3D ARRAY_SIZE(apm_div_clks),
> +       .gate_clks              =3D apm_gate_clks,
> +       .nr_gate_clks           =3D ARRAY_SIZE(apm_gate_clks),
> +       .fixed_clks             =3D apm_fixed_clks,
> +       .nr_fixed_clks          =3D ARRAY_SIZE(apm_fixed_clks),
> +       .nr_clk_ids             =3D APM_NR_CLK,
> +       .clk_regs               =3D apm_clk_regs,
> +       .nr_clk_regs            =3D ARRAY_SIZE(apm_clk_regs),
> +};
> +
> +/* ---- platform_driver ------------------------------------------------=
----- */
> +
> +static int __init gs101_cmu_probe(struct platform_device *pdev)
> +{
> +       const struct samsung_cmu_info *info;
> +       struct device *dev =3D &pdev->dev;
> +
> +       info =3D of_device_get_match_data(dev);
> +       exynos_arm64_register_cmu(dev, dev->of_node, info);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id gs101_cmu_of_match[] =3D {
> +       {
> +               .compatible =3D "google,gs101-cmu-apm",
> +               .data =3D &apm_cmu_info,
> +       }, {
> +       },
> +};
> +
> +static struct platform_driver gs101_cmu_driver __refdata =3D {
> +       .driver =3D {
> +               .name =3D "gs101-cmu",
> +               .of_match_table =3D gs101_cmu_of_match,
> +               .suppress_bind_attrs =3D true,
> +       },
> +       .probe =3D gs101_cmu_probe,
> +};
> +
> +static int __init gs101_cmu_init(void)
> +{
> +       return platform_driver_register(&gs101_cmu_driver);
> +}
> +core_initcall(gs101_cmu_init);
> --
> 2.42.0.655.g421f12c284-goog
>
